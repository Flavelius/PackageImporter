//==============================================================================
//  Trade_Transaction
//==============================================================================

class Trade_Transaction extends Object
    native
    exportstructs
    dependsOn(Game_Pawn,Game_Character)
  ;

  enum EServerTradeState {
    STS_REQUESTING ,
    STS_TRADING ,
    STS_OFFERED ,
    STS_FINALIZING ,
    STS_DONE 
  };

  struct ServerTradeItem {
      var Game_Item Item;
      var int Amount;
      var int LocationSlot;

  };


  var private transient byte mTradeState;
  var transient Game_Pawn mInitiator;
  var transient Game_Pawn mPartner;
  var private transient array<ServerTradeItem> mInitiatorItems;
  var private transient array<ServerTradeItem> mPartnerItems;
  var private transient int mInitiatorMoney;
  var private transient int mPartnerMoney;
  var (null);


  function Game_Pawn sv_GetOtherTrader(Game_Pawn aPawn) {
    if (aPawn != None) {                                                        //0000 : 07 29 00 77 00 E0 18 38 11 2A 16 
      if (aPawn == mInitiator) {                                                //000B : 07 23 00 72 00 E0 18 38 11 01 78 F1 30 11 16 
        return mPartner;                                                        //001A : 04 01 F0 F1 30 11 
      } else {                                                                  //0020 : 06 29 00 
        return mInitiator;                                                      //0023 : 04 01 78 F1 30 11 
      }
    }
    return None;                                                                //0029 : 04 2A 
    //07 29 00 77 00 E0 18 38 11 2A 16 07 23 00 72 00 E0 18 38 11 01 78 F1 30 11 16 04 01 F0 F1 30 11 
    //06 29 00 04 01 78 F1 30 11 04 2A 04 0B 47 
  }


  function bool sv_IsTransactionValid() {
    if (mTradeState == 4) {                                                     //0000 : 07 12 00 9A 39 3A 01 60 1B 38 11 39 3A 24 04 16 
      return False;                                                             //0010 : 04 28 
    }
    if (mInitiator == None || mPartner == None) {                               //0012 : 07 2C 00 84 72 01 78 F1 30 11 2A 16 18 09 00 72 01 F0 F1 30 11 2A 16 16 
      return False;                                                             //002A : 04 28 
    }
    if (mInitiator.IsDead() || mPartner.IsDead()) {                             //002C : 07 54 00 84 19 01 78 F1 30 11 06 00 04 1C D8 52 34 0F 16 18 10 00 19 01 F0 F1 30 11 06 00 04 1C D8 52 34 0F 16 16 
      return False;                                                             //0052 : 04 28 
    }
    if (mInitiator.Trading == None || mPartner.Trading == None) {               //0054 : 07 80 00 84 72 19 01 78 F1 30 11 05 00 04 01 C0 43 32 0F 2A 16 18 12 00 72 19 01 F0 F1 30 11 05 00 04 01 C0 43 32 0F 2A 16 16 
      return False;                                                             //007E : 04 28 
    }
    return True;                                                                //0080 : 04 27 
    //07 12 00 9A 39 3A 01 60 1B 38 11 39 3A 24 04 16 04 28 07 2C 00 84 72 01 78 F1 30 11 2A 16 18 09 
    //00 72 01 F0 F1 30 11 2A 16 16 04 28 07 54 00 84 19 01 78 F1 30 11 06 00 04 1C D8 52 34 0F 16 18 
    //10 00 19 01 F0 F1 30 11 06 00 04 1C D8 52 34 0F 16 16 04 28 07 80 00 84 72 19 01 78 F1 30 11 05 
    //00 04 01 C0 43 32 0F 2A 16 18 12 00 72 19 01 F0 F1 30 11 05 00 04 01 C0 43 32 0F 2A 16 16 04 28 
    //04 27 04 0B 47 
  }


  event sv_PerformedTransaction(int aErrorCode) {
    sv_SetState(4);                                                             //0000 : 1B 1D 0C 00 00 24 04 16 
    OnPerformedTransaction(self,aErrorCode == 0);                               //0008 : 43 90 1A 30 11 DC 05 00 00 17 9A 00 88 1C 38 11 25 16 16 
    //1B 1D 0C 00 00 24 04 16 43 90 1A 30 11 DC 05 00 00 17 9A 00 88 1C 38 11 25 16 16 04 0B 47 
  }


  native function sv_PerformTransaction();


  native function bool sv_HasSufficientSpace(Game_Pawn aTrader);


  function sv_ResetOffer(Game_Pawn aTrader) {
    if (aTrader != None && mTradeState != 3
      && sv_IsTransactionValid()) { //0000 : 07 60 00 82 82 77 00 00 F0 33 11 2A 16 18 0E 00 9B 39 3A 01 60 1B 38 11 39 3A 24 03 16 16 18 07 00 1B 14 0C 00 00 16 16 
      if (aTrader == mInitiator) {                                              //0028 : 07 49 00 72 00 00 F0 33 11 01 78 F1 30 11 16 
        mInitiatorMoney = 0;                                                    //0037 : 0F 01 28 F1 33 11 25 
        mInitiatorItems.Length = 0;                                             //003E : 0F 37 01 A0 F1 33 11 25 
      } else {                                                                  //0046 : 06 58 00 
        mPartnerMoney = 0;                                                      //0049 : 0F 01 18 F2 33 11 25 
        mPartnerItems.Length = 0;                                               //0050 : 0F 37 01 90 F2 33 11 25 
      }
      sv_SetState(1);                                                           //0058 : 1B 1D 0C 00 00 24 01 16 
    }
    //07 60 00 82 82 77 00 00 F0 33 11 2A 16 18 0E 00 9B 39 3A 01 60 1B 38 11 39 3A 24 03 16 16 18 07 
    //00 1B 14 0C 00 00 16 16 07 49 00 72 00 00 F0 33 11 01 78 F1 30 11 16 0F 01 28 F1 33 11 25 0F 37 
    //01 A0 F1 33 11 25 06 58 00 0F 01 18 F2 33 11 25 0F 37 01 90 F2 33 11 25 1B 1D 0C 00 00 24 01 16 
    //04 0B 47 
  }


  function int sv_GetTradeMoney(Game_Pawn aTrader) {
    if (aTrader == mInitiator) {                                                //0000 : 07 18 00 72 00 B8 F3 33 11 01 78 F1 30 11 16 
      return mInitiatorMoney;                                                   //000F : 04 01 28 F1 33 11 
    } else {                                                                    //0015 : 06 1E 00 
      return mPartnerMoney;                                                     //0018 : 04 01 18 F2 33 11 
    }
    //07 18 00 72 00 B8 F3 33 11 01 78 F1 30 11 16 04 01 28 F1 33 11 06 1E 00 04 01 18 F2 33 11 04 0B 
    //47 
  }


  function bool sv_SetTradeMoney(Game_Pawn aTrader,int aMoney) {
    if (aTrader != None && mTradeState != 3
      && sv_IsTransactionValid()) { //0000 : 07 7F 00 82 82 77 00 58 F5 33 11 2A 16 18 0E 00 9B 39 3A 01 60 1B 38 11 39 3A 24 03 16 16 18 07 00 1B 14 0C 00 00 16 16 
      aMoney = Min(aMoney,aTrader.Character.GetMoney());                        //0028 : 0F 00 B0 F6 33 11 F9 00 B0 F6 33 11 19 19 00 58 F5 33 11 05 00 04 01 68 2E 34 0F 06 00 04 1C 50 33 22 11 16 16 
      if (aTrader == mInitiator) {                                              //004D : 07 6A 00 72 00 58 F5 33 11 01 78 F1 30 11 16 
        mInitiatorMoney = aMoney;                                               //005C : 0F 01 28 F1 33 11 00 B0 F6 33 11 
      } else {                                                                  //0067 : 06 75 00 
        mPartnerMoney = aMoney;                                                 //006A : 0F 01 18 F2 33 11 00 B0 F6 33 11 
      }
      sv_SetState(1);                                                           //0075 : 1B 1D 0C 00 00 24 01 16 
      return True;                                                              //007D : 04 27 
    }
    return False;                                                               //007F : 04 28 
    //07 7F 00 82 82 77 00 58 F5 33 11 2A 16 18 0E 00 9B 39 3A 01 60 1B 38 11 39 3A 24 03 16 16 18 07 
    //00 1B 14 0C 00 00 16 16 0F 00 B0 F6 33 11 F9 00 B0 F6 33 11 19 19 00 58 F5 33 11 05 00 04 01 68 
    //2E 34 0F 06 00 04 1C 50 33 22 11 16 16 07 6A 00 72 00 58 F5 33 11 01 78 F1 30 11 16 0F 01 28 F1 
    //33 11 00 B0 F6 33 11 06 75 00 0F 01 18 F2 33 11 00 B0 F6 33 11 1B 1D 0C 00 00 24 01 16 04 27 04 
    //28 04 0B 47 
  }


  private function RemoveItem(out array<ServerTradeItem> outItems,int aLocationSlot) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 C8 F8 33 11 25 
    while (i < outItems.Length) {                                               //0007 : 07 4A 00 96 00 C8 F8 33 11 37 00 50 F8 33 11 16 
      if (outItems[i].LocationSlot == aLocationSlot) {                          //0017 : 07 40 00 9A 36 C8 F9 33 11 10 00 C8 F8 33 11 00 50 F8 33 11 00 40 FA 33 11 16 
        outItems.Remove(i,1);                                                   //0031 : 41 00 50 F8 33 11 00 C8 F8 33 11 26 
        goto jl004A;                                                            //003D : 06 4A 00 
      }
      ++i;                                                                      //0040 : A3 00 C8 F8 33 11 16 
    }
    //0F 00 C8 F8 33 11 25 07 4A 00 96 00 C8 F8 33 11 37 00 50 F8 33 11 16 07 40 00 9A 36 C8 F9 33 11 
    //10 00 C8 F8 33 11 00 50 F8 33 11 00 40 FA 33 11 16 41 00 50 F8 33 11 00 C8 F8 33 11 26 06 4A 00 
    //A3 00 C8 F8 33 11 16 06 07 00 04 0B 47 
  }


  function bool sv_RemoveItem(Game_Pawn aTrader,int aLocationSlot) {
    if (aLocationSlot >= 0 && aLocationSlot < 16
      && aTrader != None
      && mTradeState != 3
      && sv_IsTransactionValid()) {//0000 : 07 7F 00 82 82 82 82 99 00 68 FF 33 11 25 16 18 0A 00 96 00 68 FF 33 11 2C 10 16 16 18 09 00 77 00 10 FE 33 11 2A 16 16 18 0E 00 9B 39 3A 01 60 1B 38 11 39 3A 24 03 16 16 18 07 00 1B 14 0C 00 00 16 16 
      if (aTrader == mInitiator) {                                              //0043 : 07 65 00 72 00 10 FE 33 11 01 78 F1 30 11 16 
        RemoveItem(mInitiatorItems,aLocationSlot);                              //0052 : 1B 81 0C 00 00 01 A0 F1 33 11 00 68 FF 33 11 16 
      } else {                                                                  //0062 : 06 75 00 
        RemoveItem(mPartnerItems,aLocationSlot);                                //0065 : 1B 81 0C 00 00 01 90 F2 33 11 00 68 FF 33 11 16 
      }
      sv_SetState(1);                                                           //0075 : 1B 1D 0C 00 00 24 01 16 
      return True;                                                              //007D : 04 27 
    }
    return False;                                                               //007F : 04 28 
    //07 7F 00 82 82 82 82 99 00 68 FF 33 11 25 16 18 0A 00 96 00 68 FF 33 11 2C 10 16 16 18 09 00 77 
    //00 10 FE 33 11 2A 16 16 18 0E 00 9B 39 3A 01 60 1B 38 11 39 3A 24 03 16 16 18 07 00 1B 14 0C 00 
    //00 16 16 07 65 00 72 00 10 FE 33 11 01 78 F1 30 11 16 1B 81 0C 00 00 01 A0 F1 33 11 00 68 FF 33 
    //11 16 06 75 00 1B 81 0C 00 00 01 90 F2 33 11 00 68 FF 33 11 16 1B 1D 0C 00 00 24 01 16 04 27 04 
    //28 04 0B 47 
  }


  function bool sv_SetTradeItem(Game_Pawn aTrader,Game_Item aItem,int aAmount,int aLocationSlot) {
    local ServerTradeItem serverItem;
    if (aTrader != None && mTradeState != 3
      && sv_IsTransactionValid()) { //0000 : 07 B8 00 82 82 77 00 08 01 34 11 2A 16 18 0E 00 9B 39 3A 01 60 1B 38 11 39 3A 24 03 16 16 18 07 00 1B 14 0C 00 00 16 16 
      serverItem.Item = aItem;                                                  //0028 : 0F 36 30 FB 33 11 00 B0 02 34 11 00 28 03 34 11 
      serverItem.Amount = aAmount;                                              //0038 : 0F 36 E8 FC 33 11 00 B0 02 34 11 00 A0 03 34 11 
      serverItem.LocationSlot = aLocationSlot;                                  //0048 : 0F 36 C8 F9 33 11 00 B0 02 34 11 00 18 04 34 11 
      if (aTrader == mInitiator) {                                              //0058 : 07 8C 00 72 00 08 01 34 11 01 78 F1 30 11 16 
        RemoveItem(mInitiatorItems,aLocationSlot);                              //0067 : 1B 81 0C 00 00 01 A0 F1 33 11 00 18 04 34 11 16 
        mInitiatorItems[mInitiatorItems.Length] = serverItem;                   //0077 : 0F 10 37 01 A0 F1 33 11 01 A0 F1 33 11 00 B0 02 34 11 
      } else {                                                                  //0089 : 06 AE 00 
        RemoveItem(mPartnerItems,aLocationSlot);                                //008C : 1B 81 0C 00 00 01 90 F2 33 11 00 18 04 34 11 16 
        mPartnerItems[mPartnerItems.Length] = serverItem;                       //009C : 0F 10 37 01 90 F2 33 11 01 90 F2 33 11 00 B0 02 34 11 
      }
      sv_SetState(1);                                                           //00AE : 1B 1D 0C 00 00 24 01 16 
      return True;                                                              //00B6 : 04 27 
    }
    return False;                                                               //00B8 : 04 28 
    //07 B8 00 82 82 77 00 08 01 34 11 2A 16 18 0E 00 9B 39 3A 01 60 1B 38 11 39 3A 24 03 16 16 18 07 
    //00 1B 14 0C 00 00 16 16 0F 36 30 FB 33 11 00 B0 02 34 11 00 28 03 34 11 0F 36 E8 FC 33 11 00 B0 
    //02 34 11 00 A0 03 34 11 0F 36 C8 F9 33 11 00 B0 02 34 11 00 18 04 34 11 07 8C 00 72 00 08 01 34 
    //11 01 78 F1 30 11 16 1B 81 0C 00 00 01 A0 F1 33 11 00 18 04 34 11 16 0F 10 37 01 A0 F1 33 11 01 
    //A0 F1 33 11 00 B0 02 34 11 06 AE 00 1B 81 0C 00 00 01 90 F2 33 11 00 18 04 34 11 16 0F 10 37 01 
    //90 F2 33 11 01 90 F2 33 11 00 B0 02 34 11 1B 1D 0C 00 00 24 01 16 04 27 04 28 04 0B 47 
  }


  function sv_SetState(byte aState) {
    mTradeState = aState;                                                       //0000 : 0F 01 60 1B 38 11 00 B8 05 34 11 
    //0F 01 60 1B 38 11 00 B8 05 34 11 04 0B 47 
  }


  function byte sv_GetState() {
    return mTradeState;                                                         //0000 : 04 01 60 1B 38 11 
    //04 01 60 1B 38 11 04 0B 47 
  }


  function sv_TraderDisconnected(Game_Pawn aTrader) {
    if (aTrader == mInitiator) {                                                //0000 : 07 19 00 72 00 D0 08 34 11 01 78 F1 30 11 16 
      mInitiator = None;                                                        //000F : 0F 01 78 F1 30 11 2A 
    } else {                                                                    //0016 : 06 2F 00 
      if (aTrader == mPartner) {                                                //0019 : 07 2F 00 72 00 D0 08 34 11 01 F0 F1 30 11 16 
        mPartner = None;                                                        //0028 : 0F 01 F0 F1 30 11 2A 
      }
    }
    //07 19 00 72 00 D0 08 34 11 01 78 F1 30 11 16 0F 01 78 F1 30 11 2A 06 2F 00 07 2F 00 72 00 D0 08 
    //34 11 01 F0 F1 30 11 16 0F 01 F0 F1 30 11 2A 04 0B 47 
  }


  function sv_InitTransaction(Game_Pawn aInitiator,Game_Pawn aPartner) {
    mInitiator = aInitiator;                                                    //0000 : 0F 01 78 F1 30 11 00 68 0A 34 11 
    mPartner = aPartner;                                                        //000B : 0F 01 F0 F1 30 11 00 38 0B 34 11 
    sv_SetState(0);                                                             //0016 : 1B 1D 0C 00 00 24 00 16 
    //0F 01 78 F1 30 11 00 68 0A 34 11 0F 01 F0 F1 30 11 00 38 0B 34 11 1B 1D 0C 00 00 24 00 16 04 0B 
    //47 
  }


  delegate OnPerformedTransaction(Trade_Transaction aTransaction,bool aSucces);



