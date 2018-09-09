//==============================================================================
//  HUD_Trading
//==============================================================================

class HUD_Trading extends GUI_Window
    dependsOn(Game_Pawn,Game_Trading,HUD_TradeSelection,GUI_EditBox,Game_Character,Game_Item,Item_Type,GUI_Component,GUI_Label,HUD_TradeItemContainer,GED_Editor)
    Transient
    Config(User)
  ;

  const ID_REMOVE_ALL =  3;
  const ID_REMOVE_ITEM =  2;
  const ID_TRADE_ACCEPT_OFFER =  1;
  const ID_TRADE_CANCEL =  0;
  var private GUI_Label mOtherName;
  var private GUI_Label mOtherSunplates;
  var private GUI_Label mOtherQuarternails;
  var private GUI_Label mOtherLoderings;
  var private GUI_Label mPlayerName;
  var private GUI_Label mHelpLabel1;
  var private GUI_Label mHelpLabel2;
  var private GUI_EditBox mPlayerSunplates;
  var private GUI_EditBox mPlayerQuarternails;
  var private GUI_EditBox mPlayerLoderings;
  var private GUI_Button mRemoveItemButton;
  var private GUI_Button mRemoveAllButton;
  var private GUI_Button mCancelButton;
  var private GUI_Button mAcceptOfferButton;
  var private HUD_TradeSelection mPlayerTradePage;
  var private HUD_TradeSelection mOtherTradePage;
  var private GUI_Page mHeaderTradePartnerPage;
  var private GUI_Page mHeaderTradePlayerPage;


  event OnComponentDestroyed() {
    local Game_Pawn gamePawn;
    gamePawn = GetPawn();                                                       //0000 : 0F 00 10 E7 2C 26 1B 2B 0C 00 00 16 
    gamePawn.Trading.__OnSetPartnerItem__Delegate = None;                       //000C : 45 19 19 00 10 E7 2C 26 05 00 04 01 C0 43 32 0F 05 00 08 01 D8 CC 22 11 44 00 00 00 00 
    gamePawn.Trading.__OnRemovePartnerItem__Delegate = None;                    //0029 : 45 19 19 00 10 E7 2C 26 05 00 04 01 C0 43 32 0F 05 00 08 01 08 C1 22 11 44 00 00 00 00 
    gamePawn.Trading.__OnSetPartnerMoney__Delegate = None;                      //0046 : 45 19 19 00 10 E7 2C 26 05 00 04 01 C0 43 32 0F 05 00 08 01 C0 BA 22 11 44 00 00 00 00 
    gamePawn.Trading.__OnResetPartnerOffer__Delegate = None;                    //0063 : 45 19 19 00 10 E7 2C 26 05 00 04 01 C0 43 32 0F 05 00 08 01 18 B5 22 11 44 00 00 00 00 
    gamePawn.Trading.__OnSetPartnerOffered__Delegate = None;                    //0080 : 45 19 19 00 10 E7 2C 26 05 00 04 01 C0 43 32 0F 05 00 08 01 70 EB 22 11 44 00 00 00 00 
    gamePawn.Trading.__OnAcceptCancelled__Delegate = None;                      //009D : 45 19 19 00 10 E7 2C 26 05 00 04 01 C0 43 32 0F 05 00 08 01 F8 EA 22 11 44 00 00 00 00 
    Super.OnComponentDestroyed();                                               //00BA : 1C E0 DA 9D 19 16 
    //0F 00 10 E7 2C 26 1B 2B 0C 00 00 16 45 19 19 00 10 E7 2C 26 05 00 04 01 C0 43 32 0F 05 00 08 01 
    //D8 CC 22 11 44 00 00 00 00 45 19 19 00 10 E7 2C 26 05 00 04 01 C0 43 32 0F 05 00 08 01 08 C1 22 
    //11 44 00 00 00 00 45 19 19 00 10 E7 2C 26 05 00 04 01 C0 43 32 0F 05 00 08 01 C0 BA 22 11 44 00 
    //00 00 00 45 19 19 00 10 E7 2C 26 05 00 04 01 C0 43 32 0F 05 00 08 01 18 B5 22 11 44 00 00 00 00 
    //45 19 19 00 10 E7 2C 26 05 00 04 01 C0 43 32 0F 05 00 08 01 70 EB 22 11 44 00 00 00 00 45 19 19 
    //00 10 E7 2C 26 05 00 04 01 C0 43 32 0F 05 00 08 01 F8 EA 22 11 44 00 00 00 00 1C E0 DA 9D 19 16 
    //04 0B 47 
  }


  function TradeChanged() {
    mRemoveAllButton.SetEnabled(mPlayerTradePage.GetNumberOfFilledSlots() > 0
      || GetPlayerMoney() > 0);//0000 : 19 01 60 A4 2C 26 26 00 00 1B 5F 32 00 00 84 97 19 01 38 39 2B 26 06 00 04 1B 59 9B 00 00 16 25 16 18 0A 00 97 1B BC 99 00 00 16 25 16 16 16 
    mAcceptOfferButton.SetEnabled(True);                                        //002F : 19 01 D8 DC 2C 26 07 00 00 1B 5F 32 00 00 27 16 
    mHeaderTradePlayerPage.SetSolidBackground(186.00000000,179.00000000,197.00000000);//003F : 19 01 38 DA 04 1B 15 00 00 1B 52 98 00 00 1E 00 00 3A 43 1E 00 00 33 43 1E 00 00 45 43 16 
    UpdatePartnerLabel(False);                                                  //005D : 1B C6 99 00 00 28 16 
    //19 01 60 A4 2C 26 26 00 00 1B 5F 32 00 00 84 97 19 01 38 39 2B 26 06 00 04 1B 59 9B 00 00 16 25 
    //16 18 0A 00 97 1B BC 99 00 00 16 25 16 16 16 19 01 D8 DC 2C 26 07 00 00 1B 5F 32 00 00 27 16 19 
    //01 38 DA 04 1B 15 00 00 1B 52 98 00 00 1E 00 00 3A 43 1E 00 00 33 43 1E 00 00 45 43 16 1B C6 99 
    //00 00 28 16 04 0B 47 
  }


  function SelectHandler(int aIndex) {
    mRemoveItemButton.SetEnabled(aIndex >= 0);                                  //0000 : 19 01 C8 D6 2C 26 0E 00 00 1B 5F 32 00 00 99 00 F8 3B 34 26 25 16 16 
    //19 01 C8 D6 2C 26 0E 00 00 1B 5F 32 00 00 99 00 F8 3B 34 26 25 16 16 04 0B 47 
  }


  function bool MoneyChangeHandler(GUI_EditBox aEditBox) {
    local int playerTradeMoney;
    local int availableMoney;
    local string Input;
    Input = aEditBox.GetText();                                                 //0000 : 0F 00 30 CA 2B 26 19 00 D8 5C 06 1B 06 00 00 1B 92 0C 00 00 16 
    if (Len(Input) == 0) {                                                      //0015 : 07 2E 00 9A 7D 00 30 CA 2B 26 16 25 16 
      Input = "0";                                                              //0022 : 0F 00 30 CA 2B 26 1F 30 00 
    } else {                                                                    //002B : 06 6B 00 
      if (Len(Input) > 1) {                                                     //002E : 07 6B 00 97 7D 00 30 CA 2B 26 16 26 16 
        while (Left(Input,1) == "0" && Len(Input) > 1) {                        //003B : 07 6B 00 82 7A 80 00 30 CA 2B 26 26 16 1F 30 00 16 18 0B 00 97 7D 00 30 CA 2B 26 16 26 16 16 
          Input = Mid(Input,1);                                                 //005A : 0F 00 30 CA 2B 26 7F 00 30 CA 2B 26 26 16 
        }
      }
    }
    aEditBox.SetText(Input);                                                    //006B : 19 00 D8 5C 06 1B 0B 00 00 1B 13 98 00 00 00 30 CA 2B 26 16 
    playerTradeMoney = GetPlayerMoney();                                        //007F : 0F 00 E8 7F 06 1B 1B BC 99 00 00 16 
    availableMoney = GetPawn().Character.GetMoney();                            //008B : 0F 00 80 25 05 1B 19 19 1B 2B 0C 00 00 16 05 00 04 01 68 2E 34 0F 06 00 04 1C 50 33 22 11 16 
    if (playerTradeMoney >= availableMoney) {                                   //00AA : 07 CF 00 99 00 E8 7F 06 1B 00 80 25 05 1B 16 
      SetPlayerMoney(availableMoney);                                           //00B9 : 1B 44 99 00 00 00 80 25 05 1B 16 
      playerTradeMoney = availableMoney;                                        //00C4 : 0F 00 E8 7F 06 1B 00 80 25 05 1B 
    }
    GetPawn().Trading.cl_SetTradeMoney(playerTradeMoney);                       //00CF : 19 19 1B 2B 0C 00 00 16 05 00 04 01 C0 43 32 0F 0B 00 00 1B 3D 1B 00 00 00 E8 7F 06 1B 16 
    TradeChanged();                                                             //00ED : 1B 8E 98 00 00 16 
    return True;                                                                //00F3 : 04 27 
    //0F 00 30 CA 2B 26 19 00 D8 5C 06 1B 06 00 00 1B 92 0C 00 00 16 07 2E 00 9A 7D 00 30 CA 2B 26 16 
    //25 16 0F 00 30 CA 2B 26 1F 30 00 06 6B 00 07 6B 00 97 7D 00 30 CA 2B 26 16 26 16 07 6B 00 82 7A 
    //80 00 30 CA 2B 26 26 16 1F 30 00 16 18 0B 00 97 7D 00 30 CA 2B 26 16 26 16 16 0F 00 30 CA 2B 26 
    //7F 00 30 CA 2B 26 26 16 06 3B 00 19 00 D8 5C 06 1B 0B 00 00 1B 13 98 00 00 00 30 CA 2B 26 16 0F 
    //00 E8 7F 06 1B 1B BC 99 00 00 16 0F 00 80 25 05 1B 19 19 1B 2B 0C 00 00 16 05 00 04 01 68 2E 34 
    //0F 06 00 04 1C 50 33 22 11 16 07 CF 00 99 00 E8 7F 06 1B 00 80 25 05 1B 16 1B 44 99 00 00 00 80 
    //25 05 1B 16 0F 00 E8 7F 06 1B 00 80 25 05 1B 19 19 1B 2B 0C 00 00 16 05 00 04 01 C0 43 32 0F 0B 
    //00 00 1B 3D 1B 00 00 00 E8 7F 06 1B 16 1B 8E 98 00 00 16 04 27 04 0B 47 
  }


  function OnSetTradeItemHandler(Game_Item aItem,int aLocationSlot) {
    local Game_Pawn gamePawn;
    gamePawn = GetPawn();                                                       //0000 : 0F 00 10 D2 04 1B 1B 2B 0C 00 00 16 
    if (gamePawn != None && gamePawn.Trading != None) {                         //000C : 07 BB 00 82 77 00 10 D2 04 1B 2A 16 18 12 00 77 19 00 10 D2 04 1B 05 00 04 01 C0 43 32 0F 2A 16 16 
      if (aItem == None) {                                                      //002D : 07 58 00 72 00 88 D2 04 1B 2A 16 
        gamePawn.Trading.cl_RemoveItem(aLocationSlot);                          //0038 : 19 19 00 10 D2 04 1B 05 00 04 01 C0 43 32 0F 0B 00 00 1B 3C 1B 00 00 00 F8 61 06 1B 16 
      } else {                                                                  //0055 : 06 BB 00 
        if (aItem.Type.Tradable && aItem.Attuned == 0) {                        //0058 : 07 BB 00 82 19 19 00 88 D2 04 1B 05 00 04 01 98 2F 22 11 06 00 04 2D 01 18 EF 2B 11 18 14 00 9A 39 3A 19 00 88 D2 04 1B 05 00 01 01 28 3F 2E 11 25 16 16 
          gamePawn.Trading.cl_SetTradeItem(aItem,aItem.StackSize,aLocationSlot);//008B : 19 19 00 10 D2 04 1B 05 00 04 01 C0 43 32 0F 1E 00 00 1B 3B 1B 00 00 00 88 D2 04 1B 19 00 88 D2 04 1B 05 00 04 01 E8 CB 22 11 00 F8 61 06 1B 16 
        }
      }
    }
    TradeChanged();                                                             //00BB : 1B 8E 98 00 00 16 
    //0F 00 10 D2 04 1B 1B 2B 0C 00 00 16 07 BB 00 82 77 00 10 D2 04 1B 2A 16 18 12 00 77 19 00 10 D2 
    //04 1B 05 00 04 01 C0 43 32 0F 2A 16 16 07 58 00 72 00 88 D2 04 1B 2A 16 19 19 00 10 D2 04 1B 05 
    //00 04 01 C0 43 32 0F 0B 00 00 1B 3C 1B 00 00 00 F8 61 06 1B 16 06 BB 00 07 BB 00 82 19 19 00 88 
    //D2 04 1B 05 00 04 01 98 2F 22 11 06 00 04 2D 01 18 EF 2B 11 18 14 00 9A 39 3A 19 00 88 D2 04 1B 
    //05 00 01 01 28 3F 2E 11 25 16 16 19 19 00 10 D2 04 1B 05 00 04 01 C0 43 32 0F 1E 00 00 1B 3B 1B 
    //00 00 00 88 D2 04 1B 19 00 88 D2 04 1B 05 00 04 01 E8 CB 22 11 00 F8 61 06 1B 16 1B 8E 98 00 00 
    //16 04 0B 47 
  }


  function bool ClickHandler(GUI_Component aClickedButton) {
    switch (aClickedButton.mIntTag) {                                           //0000 : 05 04 19 00 D0 3A 34 26 05 00 04 01 58 90 31 16 
      case 0 :                                                                  //0010 : 0A 1D 00 25 
        CancelTrade();                                                          //0014 : 1B C0 99 00 00 16 
        break;                                                                  //001A : 06 74 00 
      case 1 :                                                                  //001D : 0A 2A 00 26 
        AcceptOffer();                                                          //0021 : 1B D6 9A 00 00 16 
        break;                                                                  //0027 : 06 74 00 
      case 2 :                                                                  //002A : 0A 60 00 2C 02 
        mPlayerTradePage.RemoveTradeItem(mPlayerTradePage.GetSelectedButtonIndex());//002F : 19 01 38 39 2B 26 15 00 00 1B 32 99 00 00 19 01 38 39 2B 26 06 00 04 1B 58 9B 00 00 16 16 
        mRemoveItemButton.SetEnabled(False);                                    //004D : 19 01 C8 D6 2C 26 07 00 00 1B 5F 32 00 00 28 16 
        break;                                                                  //005D : 06 74 00 
      case 3 :                                                                  //0060 : 0A 6E 00 2C 03 
        ResetOffer();                                                           //0065 : 1B D7 9A 00 00 16 
        break;                                                                  //006B : 06 74 00 
      default:                                                                  //006E : 0A FF FF 
        break;                                                                  //0071 : 06 74 00 
    }
    return True;                                                                //0074 : 04 27 
    //05 04 19 00 D0 3A 34 26 05 00 04 01 58 90 31 16 0A 1D 00 25 1B C0 99 00 00 16 06 74 00 0A 2A 00 
    //26 1B D6 9A 00 00 16 06 74 00 0A 60 00 2C 02 19 01 38 39 2B 26 15 00 00 1B 32 99 00 00 19 01 38 
    //39 2B 26 06 00 04 1B 58 9B 00 00 16 16 19 01 C8 D6 2C 26 07 00 00 1B 5F 32 00 00 28 16 06 74 00 
    //0A 6E 00 2C 03 1B D7 9A 00 00 16 06 74 00 0A FF FF 06 74 00 04 27 04 0B 47 
  }


  function bool IsTradingItem(Game_Item aItem) {
    return mPlayerTradePage.IsTradingItem(aItem);                               //0000 : 04 19 01 38 39 2B 26 0B 00 04 1B 4F 99 00 00 00 08 4A 34 26 16 
    //04 19 01 38 39 2B 26 0B 00 04 1B 4F 99 00 00 00 08 4A 34 26 16 04 0B 47 
  }


  private function int GetPlayerMoney() {
    local int Money;
    local int sunplates;
    local int quarternails;
    local int loderings;
    sunplates = int(mPlayerSunplates.GetText());                                //0000 : 0F 00 08 68 06 1B 39 4A 19 01 20 1F 04 1B 06 00 00 1B 92 0C 00 00 16 
    quarternails = int(mPlayerQuarternails.GetText());                          //0017 : 0F 00 78 65 06 1B 39 4A 19 01 28 C8 2C 26 06 00 00 1B 92 0C 00 00 16 
    loderings = int(mPlayerLoderings.GetText());                                //002E : 0F 00 00 65 06 1B 39 4A 19 01 90 C9 2C 26 06 00 00 1B 92 0C 00 00 16 
    Money = sunplates * 10000 + quarternails * 100 + loderings;                 //0045 : 0F 00 E8 1C 05 1B 92 92 90 00 08 68 06 1B 1D 10 27 00 00 16 90 00 78 65 06 1B 2C 64 16 16 00 00 65 06 1B 16 
    if (Money < 0) {                                                            //0069 : 07 93 00 96 00 E8 1C 05 1B 25 16 
      Money = GetPawn().Character.GetMoney();                                   //0074 : 0F 00 E8 1C 05 1B 19 19 1B 2B 0C 00 00 16 05 00 04 01 68 2E 34 0F 06 00 04 1C 50 33 22 11 16 
    }
    return Money;                                                               //0093 : 04 00 E8 1C 05 1B 
    //0F 00 08 68 06 1B 39 4A 19 01 20 1F 04 1B 06 00 00 1B 92 0C 00 00 16 0F 00 78 65 06 1B 39 4A 19 
    //01 28 C8 2C 26 06 00 00 1B 92 0C 00 00 16 0F 00 00 65 06 1B 39 4A 19 01 90 C9 2C 26 06 00 00 1B 
    //92 0C 00 00 16 0F 00 E8 1C 05 1B 92 92 90 00 08 68 06 1B 1D 10 27 00 00 16 90 00 78 65 06 1B 2C 
    //64 16 16 00 00 65 06 1B 16 07 93 00 96 00 E8 1C 05 1B 25 16 0F 00 E8 1C 05 1B 19 19 1B 2B 0C 00 
    //00 16 05 00 04 01 68 2E 34 0F 06 00 04 1C 50 33 22 11 16 04 00 E8 1C 05 1B 04 0B 47 
  }


  private function SetPlayerMoney(int Money) {
    if (mPlayerSunplates != None) {                                             //0000 : 07 2C 00 77 01 20 1F 04 1B 2A 16 
      mPlayerSunplates.SetText("" $ string(Money / 10000));                     //000B : 19 01 20 1F 04 1B 18 00 00 1B 13 98 00 00 70 1F 00 39 53 91 00 F0 A9 07 1B 1D 10 27 00 00 16 16 16 
    }
    if (mPlayerQuarternails != None) {                                          //002C : 07 5D 00 77 01 28 C8 2C 26 2A 16 
      mPlayerQuarternails.SetText(""
        $ string(static.Mod(Money / 100,100)));//0037 : 19 01 28 C8 2C 26 1D 00 00 1B 13 98 00 00 70 1F 00 39 53 1C 60 4D 6B 0F 91 00 F0 A9 07 1B 2C 64 16 2C 64 16 16 16 
    }
    if (mPlayerLoderings != None) {                                             //005D : 07 8A 00 77 01 90 C9 2C 26 2A 16 
      mPlayerLoderings.SetText("" $ string(static.Mod(Money,100)));             //0068 : 19 01 90 C9 2C 26 19 00 00 1B 13 98 00 00 70 1F 00 39 53 1C 60 4D 6B 0F 00 F0 A9 07 1B 2C 64 16 16 16 
    }
    //07 2C 00 77 01 20 1F 04 1B 2A 16 19 01 20 1F 04 1B 18 00 00 1B 13 98 00 00 70 1F 00 39 53 91 00 
    //F0 A9 07 1B 1D 10 27 00 00 16 16 16 07 5D 00 77 01 28 C8 2C 26 2A 16 19 01 28 C8 2C 26 1D 00 00 
    //1B 13 98 00 00 70 1F 00 39 53 1C 60 4D 6B 0F 91 00 F0 A9 07 1B 2C 64 16 2C 64 16 16 16 07 8A 00 
    //77 01 90 C9 2C 26 2A 16 19 01 90 C9 2C 26 19 00 00 1B 13 98 00 00 70 1F 00 39 53 1C 60 4D 6B 0F 
    //00 F0 A9 07 1B 2C 64 16 16 16 04 0B 47 
  }


  private function SetPartnerMoney(int Money) {
    if (mOtherSunplates != None) {                                              //0000 : 07 2C 00 77 01 C8 97 07 1B 2A 16 
      mOtherSunplates.SetText("" $ string(Money / 10000));                      //000B : 19 01 C8 97 07 1B 18 00 00 1B 13 98 00 00 70 1F 00 39 53 91 00 50 A8 07 1B 1D 10 27 00 00 16 16 16 
    }
    if (mOtherQuarternails != None) {                                           //002C : 07 5D 00 77 01 40 98 07 1B 2A 16 
      mOtherQuarternails.SetText(""
        $ string(static.Mod(Money / 100,100)));//0037 : 19 01 40 98 07 1B 1D 00 00 1B 13 98 00 00 70 1F 00 39 53 1C 60 4D 6B 0F 91 00 50 A8 07 1B 2C 64 16 2C 64 16 16 16 
    }
    if (mOtherLoderings != None) {                                              //005D : 07 8A 00 77 01 B8 98 07 1B 2A 16 
      mOtherLoderings.SetText("" $ string(static.Mod(Money,100)));              //0068 : 19 01 B8 98 07 1B 19 00 00 1B 13 98 00 00 70 1F 00 39 53 1C 60 4D 6B 0F 00 50 A8 07 1B 2C 64 16 16 16 
    }
    TradeChanged();                                                             //008A : 1B 8E 98 00 00 16 
    //07 2C 00 77 01 C8 97 07 1B 2A 16 19 01 C8 97 07 1B 18 00 00 1B 13 98 00 00 70 1F 00 39 53 91 00 
    //50 A8 07 1B 1D 10 27 00 00 16 16 16 07 5D 00 77 01 40 98 07 1B 2A 16 19 01 40 98 07 1B 1D 00 00 
    //1B 13 98 00 00 70 1F 00 39 53 1C 60 4D 6B 0F 91 00 50 A8 07 1B 2C 64 16 2C 64 16 16 16 07 8A 00 
    //77 01 B8 98 07 1B 2A 16 19 01 B8 98 07 1B 19 00 00 1B 13 98 00 00 70 1F 00 39 53 1C 60 4D 6B 0F 
    //00 50 A8 07 1B 2C 64 16 16 16 1B 8E 98 00 00 16 04 0B 47 
  }


  function ResetOffer() {
    local Game_Pawn gamePawn;
    gamePawn = GetPawn();                                                       //0000 : 0F 00 00 12 05 1B 1B 2B 0C 00 00 16 
    SetPlayerMoney(0);                                                          //000C : 1B 44 99 00 00 25 16 
    mPlayerTradePage.Reset();                                                   //0013 : 19 01 38 39 2B 26 06 00 00 1B 53 12 00 00 16 
    if (gamePawn != None && gamePawn.Trading != None) {                         //0022 : 07 5B 00 82 77 00 00 12 05 1B 2A 16 18 12 00 77 19 00 00 12 05 1B 05 00 04 01 C0 43 32 0F 2A 16 16 
      gamePawn.Trading.cl_ResetOffer();                                         //0043 : 19 19 00 00 12 05 1B 05 00 04 01 C0 43 32 0F 06 00 00 1B 3E 1B 00 00 16 
    }
    TradeChanged();                                                             //005B : 1B 8E 98 00 00 16 
    //0F 00 00 12 05 1B 1B 2B 0C 00 00 16 1B 44 99 00 00 25 16 19 01 38 39 2B 26 06 00 00 1B 53 12 00 
    //00 16 07 5B 00 82 77 00 00 12 05 1B 2A 16 18 12 00 77 19 00 00 12 05 1B 05 00 04 01 C0 43 32 0F 
    //2A 16 16 19 19 00 00 12 05 1B 05 00 04 01 C0 43 32 0F 06 00 00 1B 3E 1B 00 00 16 1B 8E 98 00 00 
    //16 04 0B 47 
  }


  function AcceptOffer() {
    local Game_Pawn gamePawn;
    gamePawn = GetPawn();                                                       //0000 : 0F 00 50 D5 04 1B 1B 2B 0C 00 00 16 
    if (gamePawn != None && gamePawn.Trading != None
      && mPlayerTradePage.CheckForLastWeapons(gamePawn)) {//000C : 07 8C 00 82 82 77 00 50 D5 04 1B 2A 16 18 12 00 77 19 00 50 D5 04 1B 05 00 04 01 C0 43 32 0F 2A 16 16 18 15 00 19 01 38 39 2B 26 0B 00 04 1B 5A 9B 00 00 00 50 D5 04 1B 16 16 
      mAcceptOfferButton.SetEnabled(False);                                     //0046 : 19 01 D8 DC 2C 26 07 00 00 1B 5F 32 00 00 28 16 
      mHeaderTradePlayerPage.SetSolidBackground(255.00000000,255.00000000,255.00000000);//0056 : 19 01 38 DA 04 1B 15 00 00 1B 52 98 00 00 1E 00 00 7F 43 1E 00 00 7F 43 1E 00 00 7F 43 16 
      gamePawn.Trading.cl_AcceptOffer();                                        //0074 : 19 19 00 50 D5 04 1B 05 00 04 01 C0 43 32 0F 06 00 00 1B 40 1B 00 00 16 
    }
    //0F 00 50 D5 04 1B 1B 2B 0C 00 00 16 07 8C 00 82 82 77 00 50 D5 04 1B 2A 16 18 12 00 77 19 00 50 
    //D5 04 1B 05 00 04 01 C0 43 32 0F 2A 16 16 18 15 00 19 01 38 39 2B 26 0B 00 04 1B 5A 9B 00 00 00 
    //50 D5 04 1B 16 16 19 01 D8 DC 2C 26 07 00 00 1B 5F 32 00 00 28 16 19 01 38 DA 04 1B 15 00 00 1B 
    //52 98 00 00 1E 00 00 7F 43 1E 00 00 7F 43 1E 00 00 7F 43 16 19 19 00 50 D5 04 1B 05 00 04 01 C0 
    //43 32 0F 06 00 00 1B 40 1B 00 00 16 04 0B 47 
  }


  function CancelTrade() {
    local Game_Pawn playerPawn;
    playerPawn = GetPawn();                                                     //0000 : 0F 00 68 0C 05 1B 1B 2B 0C 00 00 16 
    if (playerPawn != None && playerPawn.Trading != None) {                     //000C : 07 4B 00 82 77 00 68 0C 05 1B 2A 16 18 12 00 77 19 00 68 0C 05 1B 05 00 04 01 C0 43 32 0F 2A 16 16 
      AcceptCancelled();                                                        //002D : 1B C1 99 00 00 16 
      playerPawn.Trading.cl_CancelTrade();                                      //0033 : 19 19 00 68 0C 05 1B 05 00 04 01 C0 43 32 0F 06 00 00 1B 3F 1B 00 00 16 
    }
    //0F 00 68 0C 05 1B 1B 2B 0C 00 00 16 07 4B 00 82 77 00 68 0C 05 1B 2A 16 18 12 00 77 19 00 68 0C 
    //05 1B 05 00 04 01 C0 43 32 0F 2A 16 16 1B C1 99 00 00 16 19 19 00 68 0C 05 1B 05 00 04 01 C0 43 
    //32 0F 06 00 00 1B 3F 1B 00 00 16 04 0B 47 
  }


  function AcceptCancelled() {
    mAcceptOfferButton.SetEnabled(True);                                        //0000 : 19 01 D8 DC 2C 26 07 00 00 1B 5F 32 00 00 27 16 
    mHeaderTradePlayerPage.SetSolidBackground(186.00000000,179.00000000,197.00000000);//0010 : 19 01 38 DA 04 1B 15 00 00 1B 52 98 00 00 1E 00 00 3A 43 1E 00 00 33 43 1E 00 00 45 43 16 
    //19 01 D8 DC 2C 26 07 00 00 1B 5F 32 00 00 27 16 19 01 38 DA 04 1B 15 00 00 1B 52 98 00 00 1E 00 
    //00 3A 43 1E 00 00 33 43 1E 00 00 45 43 16 04 0B 47 
  }


  function UpdatePartnerLabel(bool aOffered) {
    if (aOffered) {                                                             //0000 : 07 67 00 2D 00 B8 47 34 26 
      mOtherName.SetText(GetPawn().Trading.cl_GetPartnerName()
        @ Class'SBGuiStrings'.default.Offer_made.Text);//0009 : 19 01 F8 3B 06 1B 34 00 00 1B 13 98 00 00 A8 19 19 1B 2B 0C 00 00 16 05 00 04 01 C0 43 32 0F 06 00 00 1B E7 0E 00 00 16 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D8 E4 98 19 16 16 
      mHeaderTradePartnerPage.SetSolidBackground(255.00000000,255.00000000,255.00000000);//0046 : 19 01 40 78 06 1B 15 00 00 1B 52 98 00 00 1E 00 00 7F 43 1E 00 00 7F 43 1E 00 00 7F 43 16 
    } else {                                                                    //0064 : 06 AD 00 
      mOtherName.SetText(GetPawn().Trading.cl_GetPartnerName());                //0067 : 19 01 F8 3B 06 1B 1F 00 00 1B 13 98 00 00 19 19 1B 2B 0C 00 00 16 05 00 04 01 C0 43 32 0F 06 00 00 1B E7 0E 00 00 16 16 
      mHeaderTradePartnerPage.SetSolidBackground(186.00000000,179.00000000,197.00000000);//008F : 19 01 40 78 06 1B 15 00 00 1B 52 98 00 00 1E 00 00 3A 43 1E 00 00 33 43 1E 00 00 45 43 16 
    }
    //07 67 00 2D 00 B8 47 34 26 19 01 F8 3B 06 1B 34 00 00 1B 13 98 00 00 A8 19 19 1B 2B 0C 00 00 16 
    //05 00 04 01 C0 43 32 0F 06 00 00 1B E7 0E 00 00 16 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 
    //D8 E4 98 19 16 16 19 01 40 78 06 1B 15 00 00 1B 52 98 00 00 1E 00 00 7F 43 1E 00 00 7F 43 1E 00 
    //00 7F 43 16 06 AD 00 19 01 F8 3B 06 1B 1F 00 00 1B 13 98 00 00 19 19 1B 2B 0C 00 00 16 05 00 04 
    //01 C0 43 32 0F 06 00 00 1B E7 0E 00 00 16 16 19 01 40 78 06 1B 15 00 00 1B 52 98 00 00 1E 00 00 
    //3A 43 1E 00 00 33 43 1E 00 00 45 43 16 04 0B 47 
  }


  function PartnerOffered(bool aOffered) {
    UpdatePartnerLabel(aOffered);                                               //0000 : 1B C6 99 00 00 2D 00 90 46 34 26 16 
    //1B C6 99 00 00 2D 00 90 46 34 26 16 04 0B 47 
  }


  function ResetPartnerTrade() {
    SetPartnerMoney(0);                                                         //0000 : 1B 41 99 00 00 25 16 
    mOtherTradePage.Reset();                                                    //0007 : 19 01 A8 6A 04 1B 06 00 00 1B 53 12 00 00 16 
    TradeChanged();                                                             //0016 : 1B 8E 98 00 00 16 
    //1B 41 99 00 00 25 16 19 01 A8 6A 04 1B 06 00 00 1B 53 12 00 00 16 1B 8E 98 00 00 16 04 0B 47 
  }


  function RemovePartnerItem(int aLocationSlot) {
    mOtherTradePage.SetTradeItem(None,aLocationSlot);                           //0000 : 19 01 A8 6A 04 1B 0C 00 00 1B FA 99 00 00 2A 00 68 45 34 26 16 
    TradeChanged();                                                             //0015 : 1B 8E 98 00 00 16 
    //19 01 A8 6A 04 1B 0C 00 00 1B FA 99 00 00 2A 00 68 45 34 26 16 1B 8E 98 00 00 16 04 0B 47 
  }


  function SetPartnerItem(Game_Item aItem,int aLocationSlot) {
    mOtherTradePage.SetTradeItem(aItem,aLocationSlot);                          //0000 : 19 01 A8 6A 04 1B 10 00 00 1B FA 99 00 00 00 C8 43 34 26 00 40 44 34 26 16 
    TradeChanged();                                                             //0019 : 1B 8E 98 00 00 16 
    //19 01 A8 6A 04 1B 10 00 00 1B FA 99 00 00 00 C8 43 34 26 00 40 44 34 26 16 1B 8E 98 00 00 16 04 
    //0B 47 
  }


  function RemoveTradeItem(Game_Item aItem) {
    local HUD_TradeItemContainer container;
    container = mPlayerTradePage.GetGetContainerForItem(aItem);                 //0000 : 0F 00 10 A5 07 1B 19 01 38 39 2B 26 0B 00 04 1B FD 99 00 00 00 A0 42 34 26 16 
    if (container != None) {                                                    //001A : 07 34 00 77 00 10 A5 07 1B 2A 16 
      container.RemoveItem();                                                   //0025 : 19 00 10 A5 07 1B 06 00 00 1B 81 0C 00 00 16 
    }
    //0F 00 10 A5 07 1B 19 01 38 39 2B 26 0B 00 04 1B FD 99 00 00 00 A0 42 34 26 16 07 34 00 77 00 10 
    //A5 07 1B 2A 16 19 00 10 A5 07 1B 06 00 00 1B 81 0C 00 00 16 04 0B 47 
  }


  function AddTradeItem(HUD_ItemContainer aSourceContainer,Game_Item aItem) {
    local HUD_TradeItemContainer container;
    if (aItem != None) {                                                        //0000 : 07 6E 00 77 00 80 68 06 1B 2A 16 
      container = mPlayerTradePage.GetGetContainerForItem(None);                //000B : 0F 00 E8 A3 07 1B 19 01 38 39 2B 26 07 00 04 1B FD 99 00 00 2A 16 
      if (container != None) {                                                  //0021 : 07 48 00 77 00 E8 A3 07 1B 2A 16 
        container.PlaceItem(aSourceContainer,aItem);                            //002C : 19 00 E8 A3 07 1B 10 00 04 1B 2F 97 00 00 00 48 53 34 26 00 80 68 06 1B 16 
      } else {                                                                  //0045 : 06 6E 00 
        mDesktop.AddMessage("",Class'SBGuiStrings'.default.Cant_trade_item__No_empty_trade_slots_left.Text,7);//0048 : 19 01 48 0C 9D 19 1D 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 70 89 99 19 2C 07 16 
      }
    }
    //07 6E 00 77 00 80 68 06 1B 2A 16 0F 00 E8 A3 07 1B 19 01 38 39 2B 26 07 00 04 1B FD 99 00 00 2A 
    //16 07 48 00 77 00 E8 A3 07 1B 2A 16 19 00 E8 A3 07 1B 10 00 04 1B 2F 97 00 00 00 48 53 34 26 00 
    //80 68 06 1B 16 06 6E 00 19 01 48 0C 9D 19 1D 00 00 1B 7E 04 00 00 1F 00 36 58 C6 6B 0F 12 20 70 
    //4B 32 1D 05 00 0C 02 70 89 99 19 2C 07 16 04 0B 47 
  }


  function InitTrade() {
    local Game_Pawn gamePawn;
    local string otherPlayerName;
    gamePawn = GetPawn();                                                       //0000 : 0F 00 88 25 2B 26 1B 2B 0C 00 00 16 
    if (gamePawn != None && gamePawn.Trading != None) {                         //000C : 07 4B 01 82 77 00 88 25 2B 26 2A 16 18 12 00 77 19 00 88 25 2B 26 05 00 04 01 C0 43 32 0F 2A 16 16 
      mPlayerName.SetText(gamePawn.GetCharacterName());                         //002D : 19 01 70 1B 08 1B 15 00 00 1B 13 98 00 00 19 00 88 25 2B 26 06 00 00 1B 67 05 00 00 16 16 
      otherPlayerName = gamePawn.Trading.cl_GetPartnerName();                   //004B : 0F 00 58 A1 07 1B 19 19 00 88 25 2B 26 05 00 04 01 C0 43 32 0F 06 00 00 1B E7 0E 00 00 16 
      mOtherName.SetText(otherPlayerName);                                      //0069 : 19 01 F8 3B 06 1B 0B 00 00 1B 13 98 00 00 00 58 A1 07 1B 16 
      SetTitle(Class'SBGuiStrings'.default.Trade_with.Text
        @ otherPlayerName);//007D : 1B 0A 2C 00 00 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E8 3E 99 19 00 58 A1 07 1B 16 16 
      gamePawn.Trading.__OnSetPartnerItem__Delegate = SetPartnerItem;           //009D : 45 19 19 00 88 25 2B 26 05 00 04 01 C0 43 32 0F 05 00 08 01 D8 CC 22 11 44 CF 9A 00 00 
      gamePawn.Trading.__OnRemovePartnerItem__Delegate = RemovePartnerItem;     //00BA : 45 19 19 00 88 25 2B 26 05 00 04 01 C0 43 32 0F 05 00 08 01 08 C1 22 11 44 D0 9A 00 00 
      gamePawn.Trading.__OnSetPartnerMoney__Delegate = SetPartnerMoney;         //00D7 : 45 19 19 00 88 25 2B 26 05 00 04 01 C0 43 32 0F 05 00 08 01 C0 BA 22 11 44 41 99 00 00 
      gamePawn.Trading.__OnResetPartnerOffer__Delegate = ResetPartnerTrade;     //00F4 : 45 19 19 00 88 25 2B 26 05 00 04 01 C0 43 32 0F 05 00 08 01 18 B5 22 11 44 D2 9A 00 00 
      gamePawn.Trading.__OnSetPartnerOffered__Delegate = PartnerOffered;        //0111 : 45 19 19 00 88 25 2B 26 05 00 04 01 C0 43 32 0F 05 00 08 01 70 EB 22 11 44 D3 9A 00 00 
      gamePawn.Trading.__OnAcceptCancelled__Delegate = AcceptCancelled;         //012E : 45 19 19 00 88 25 2B 26 05 00 04 01 C0 43 32 0F 05 00 08 01 F8 EA 22 11 44 C1 99 00 00 
    }
    //0F 00 88 25 2B 26 1B 2B 0C 00 00 16 07 4B 01 82 77 00 88 25 2B 26 2A 16 18 12 00 77 19 00 88 25 
    //2B 26 05 00 04 01 C0 43 32 0F 2A 16 16 19 01 70 1B 08 1B 15 00 00 1B 13 98 00 00 19 00 88 25 2B 
    //26 06 00 00 1B 67 05 00 00 16 16 0F 00 58 A1 07 1B 19 19 00 88 25 2B 26 05 00 04 01 C0 43 32 0F 
    //06 00 00 1B E7 0E 00 00 16 19 01 F8 3B 06 1B 0B 00 00 1B 13 98 00 00 00 58 A1 07 1B 16 1B 0A 2C 
    //00 00 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E8 3E 99 19 00 58 A1 07 1B 16 16 45 19 19 
    //00 88 25 2B 26 05 00 04 01 C0 43 32 0F 05 00 08 01 D8 CC 22 11 44 CF 9A 00 00 45 19 19 00 88 25 
    //2B 26 05 00 04 01 C0 43 32 0F 05 00 08 01 08 C1 22 11 44 D0 9A 00 00 45 19 19 00 88 25 2B 26 05 
    //00 04 01 C0 43 32 0F 05 00 08 01 C0 BA 22 11 44 41 99 00 00 45 19 19 00 88 25 2B 26 05 00 04 01 
    //C0 43 32 0F 05 00 08 01 18 B5 22 11 44 D2 9A 00 00 45 19 19 00 88 25 2B 26 05 00 04 01 C0 43 32 
    //0F 05 00 08 01 70 EB 22 11 44 D3 9A 00 00 45 19 19 00 88 25 2B 26 05 00 04 01 C0 43 32 0F 05 00 
    //08 01 F8 EA 22 11 44 C1 99 00 00 04 0B 47 
  }


  function Reset() {
    SetPlayerMoney(0);                                                          //0000 : 1B 44 99 00 00 25 16 
    SetPartnerMoney(0);                                                         //0007 : 1B 41 99 00 00 25 16 
    mPlayerTradePage.Reset();                                                   //000E : 19 01 38 39 2B 26 06 00 00 1B 53 12 00 00 16 
    mOtherTradePage.Reset();                                                    //001D : 19 01 A8 6A 04 1B 06 00 00 1B 53 12 00 00 16 
    TradeChanged();                                                             //002C : 1B 8E 98 00 00 16 
    //1B 44 99 00 00 25 16 1B 41 99 00 00 25 16 19 01 38 39 2B 26 06 00 00 1B 53 12 00 00 16 19 01 A8 
    //6A 04 1B 06 00 00 1B 53 12 00 00 16 1B 8E 98 00 00 16 04 0B 47 
  }


  event DoShowWindow(int flags) {
    local Game_Pawn Pawn;
    Super.DoShowWindow(flags);                                                  //0000 : 1C 20 7A 9E 19 00 68 A0 07 1B 16 
    Reset();                                                                    //000B : 1B 53 12 00 00 16 
    if (flags == Class'GUI_BaseDesktop'.1) {                                    //0011 : 07 2E 00 9A 00 68 A0 07 1B 12 20 00 68 D7 00 01 00 04 26 16 
      InitTrade();                                                              //0025 : 1B CC 9A 00 00 16 
    } else {                                                                    //002B : 06 99 00 
      if (flags == 2) {                                                         //002E : 07 99 00 9A 00 68 A0 07 1B 2C 02 16 
        Pawn = GetPawn();                                                       //003A : 0F 00 70 7F 06 1B 1B 2B 0C 00 00 16 
        if (Pawn != None && Pawn.Trading != None) {                             //0046 : 07 99 00 82 77 00 70 7F 06 1B 2A 16 18 12 00 77 19 00 70 7F 06 1B 05 00 04 01 C0 43 32 0F 2A 16 16 
          if (Pawn.Trading.cl_GetTradeState() == Class'Game_Trading'.4) {       //0067 : 07 99 00 9A 39 3A 19 19 00 70 7F 06 1B 05 00 04 01 C0 43 32 0F 06 00 01 1B 37 1B 00 00 16 39 3A 12 20 B0 78 5F 01 02 00 01 24 04 16 
            CancelTrade();                                                      //0093 : 1B C0 99 00 00 16 
          }
        }
      }
    }
    //1C 20 7A 9E 19 00 68 A0 07 1B 16 1B 53 12 00 00 16 07 2E 00 9A 00 68 A0 07 1B 12 20 00 68 D7 00 
    //01 00 04 26 16 1B CC 9A 00 00 16 06 99 00 07 99 00 9A 00 68 A0 07 1B 2C 02 16 0F 00 70 7F 06 1B 
    //1B 2B 0C 00 00 16 07 99 00 82 77 00 70 7F 06 1B 2A 16 18 12 00 77 19 00 70 7F 06 1B 05 00 04 01 
    //C0 43 32 0F 2A 16 16 07 99 00 9A 39 3A 19 19 00 70 7F 06 1B 05 00 04 01 C0 43 32 0F 06 00 01 1B 
    //37 1B 00 00 16 39 3A 12 20 B0 78 5F 01 02 00 01 24 04 16 1B C0 99 00 00 16 04 0B 47 
  }


  event Initialize() {
    local GED_Editor Editor;
    Super.Initialize();                                                         //0000 : 1C 28 9E 9E 19 16 
    Editor = GED_Editor(mDesktop.GetStdWindow(Class'GUI_BaseDesktop'.45));      //0006 : 0F 00 88 DF 2A 26 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 2C 2D 16 
    if (Editor != None) {                                                       //002B : 07 1F 06 77 00 88 DF 2A 26 2A 16 
      Editor.Attach(self,"TradeWindow.txt");                                    //0036 : 19 00 88 DF 2A 26 18 00 00 1B 3F 01 00 00 17 1F 54 72 61 64 65 57 69 6E 64 6F 77 2E 74 78 74 00 16 
      SetIcon("header_trade","SBGuiTX.GUI_Styles","GUI_Styles");                //0057 : 1B 28 98 00 00 1F 68 65 61 64 65 72 5F 74 72 61 64 65 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
      mHeaderTradePartnerPage = GUI_Page(Editor.RetrieveComponent("mHeaderTradePartnerPage"));//008B : 0F 01 40 78 06 1B 2E D8 E5 2E 1D 19 00 88 DF 2A 26 1F 00 04 1B 15 98 00 00 1F 6D 48 65 61 64 65 72 54 72 61 64 65 50 61 72 74 6E 65 72 50 61 67 65 00 16 
      mHeaderTradePartnerPage.SetSolidBackground(186.00000000,179.00000000,197.00000000);//00BE : 19 01 40 78 06 1B 15 00 00 1B 52 98 00 00 1E 00 00 3A 43 1E 00 00 33 43 1E 00 00 45 43 16 
      mOtherName = GUI_Label(Editor.RetrieveComponent("mOtherName"));           //00DC : 0F 01 F8 3B 06 1B 2E 38 15 2F 1D 19 00 88 DF 2A 26 12 00 04 1B 15 98 00 00 1F 6D 4F 74 68 65 72 4E 61 6D 65 00 16 
      mOtherTradePage = HUD_TradeSelection(Editor.RetrieveComponent("mOtherTradePage"));//0102 : 0F 01 A8 6A 04 1B 2E 08 00 2C 26 19 00 88 DF 2A 26 17 00 04 1B 15 98 00 00 1F 6D 4F 74 68 65 72 54 72 61 64 65 50 61 67 65 00 16 
      mOtherTradePage.SetReadOnly(True);                                        //012D : 19 01 A8 6A 04 1B 07 00 00 1B 36 99 00 00 27 16 
      mOtherSunplates = GUI_Label(Editor.RetrieveComponent("mOtherSunplates")); //013D : 0F 01 C8 97 07 1B 2E 38 15 2F 1D 19 00 88 DF 2A 26 17 00 04 1B 15 98 00 00 1F 6D 4F 74 68 65 72 53 75 6E 70 6C 61 74 65 73 00 16 
      mOtherQuarternails = GUI_Label(Editor.RetrieveComponent("mOtherQuarternails"));//0168 : 0F 01 40 98 07 1B 2E 38 15 2F 1D 19 00 88 DF 2A 26 1A 00 04 1B 15 98 00 00 1F 6D 4F 74 68 65 72 51 75 61 72 74 65 72 6E 61 69 6C 73 00 16 
      mOtherLoderings = GUI_Label(Editor.RetrieveComponent("mOtherLoderings")); //0196 : 0F 01 B8 98 07 1B 2E 38 15 2F 1D 19 00 88 DF 2A 26 17 00 04 1B 15 98 00 00 1F 6D 4F 74 68 65 72 4C 6F 64 65 72 69 6E 67 73 00 16 
      mHeaderTradePlayerPage = GUI_Page(Editor.RetrieveComponent("mHeaderTradePlayerPage"));//01C1 : 0F 01 38 DA 04 1B 2E D8 E5 2E 1D 19 00 88 DF 2A 26 1E 00 04 1B 15 98 00 00 1F 6D 48 65 61 64 65 72 54 72 61 64 65 50 6C 61 79 65 72 50 61 67 65 00 16 
      mHeaderTradePlayerPage.SetSolidBackground(186.00000000,179.00000000,197.00000000);//01F3 : 19 01 38 DA 04 1B 15 00 00 1B 52 98 00 00 1E 00 00 3A 43 1E 00 00 33 43 1E 00 00 45 43 16 
      mPlayerName = GUI_Label(Editor.RetrieveComponent("mPlayerName"));         //0211 : 0F 01 70 1B 08 1B 2E 38 15 2F 1D 19 00 88 DF 2A 26 13 00 04 1B 15 98 00 00 1F 6D 50 6C 61 79 65 72 4E 61 6D 65 00 16 
      mPlayerTradePage = HUD_TradeSelection(Editor.RetrieveComponent("mPlayerTradePage"));//0238 : 0F 01 38 39 2B 26 2E 08 00 2C 26 19 00 88 DF 2A 26 18 00 04 1B 15 98 00 00 1F 6D 50 6C 61 79 65 72 54 72 61 64 65 50 61 67 65 00 16 
      mPlayerTradePage.SetReadOnly(False);                                      //0264 : 19 01 38 39 2B 26 07 00 00 1B 36 99 00 00 28 16 
      mPlayerTradePage.__OnSetTradeItem__Delegate = OnSetTradeItemHandler;      //0274 : 45 19 01 38 39 2B 26 05 00 08 01 68 BF 07 1B 44 57 99 00 00 
      mPlayerSunplates = GUI_EditBox(Editor.RetrieveComponent("mPlayerSunplates"));//0288 : 0F 01 20 1F 04 1B 2E 38 00 2F 1D 19 00 88 DF 2A 26 18 00 04 1B 15 98 00 00 1F 6D 50 6C 61 79 65 72 53 75 6E 70 6C 61 74 65 73 00 16 
      mPlayerSunplates.SetNumericalLimitation(True,False,False);                //02B4 : 19 01 20 1F 04 1B 09 00 00 1B B8 98 00 00 27 28 28 16 
      mPlayerSunplates.__OnTextChanged__Delegate = MoneyChangeHandler;          //02C6 : 45 19 01 20 1F 04 1B 05 00 08 01 10 CF A4 19 44 5F 99 00 00 
      mPlayerQuarternails = GUI_EditBox(Editor.RetrieveComponent("mPlayerQuarternails"));//02DA : 0F 01 28 C8 2C 26 2E 38 00 2F 1D 19 00 88 DF 2A 26 1B 00 04 1B 15 98 00 00 1F 6D 50 6C 61 79 65 72 51 75 61 72 74 65 72 6E 61 69 6C 73 00 16 
      mPlayerQuarternails.SetNumericalLimitation(True,False,False);             //0309 : 19 01 28 C8 2C 26 09 00 00 1B B8 98 00 00 27 28 28 16 
      mPlayerQuarternails.mMaxLength = 2;                                       //031B : 0F 19 01 28 C8 2C 26 05 00 04 01 F0 E5 A4 19 2C 02 
      mPlayerQuarternails.__OnTextChanged__Delegate = MoneyChangeHandler;       //032C : 45 19 01 28 C8 2C 26 05 00 08 01 10 CF A4 19 44 5F 99 00 00 
      mPlayerLoderings = GUI_EditBox(Editor.RetrieveComponent("mPlayerLoderings"));//0340 : 0F 01 90 C9 2C 26 2E 38 00 2F 1D 19 00 88 DF 2A 26 18 00 04 1B 15 98 00 00 1F 6D 50 6C 61 79 65 72 4C 6F 64 65 72 69 6E 67 73 00 16 
      mPlayerLoderings.SetNumericalLimitation(True,False,False);                //036C : 19 01 90 C9 2C 26 09 00 00 1B B8 98 00 00 27 28 28 16 
      mPlayerLoderings.mMaxLength = 2;                                          //037E : 0F 19 01 90 C9 2C 26 05 00 04 01 F0 E5 A4 19 2C 02 
      mPlayerLoderings.__OnTextChanged__Delegate = MoneyChangeHandler;          //038F : 45 19 01 90 C9 2C 26 05 00 08 01 10 CF A4 19 44 5F 99 00 00 
      mRemoveItemButton = GUI_Button(Editor.RetrieveComponent("mRemoveItemButton"));//03A3 : 0F 01 C8 D6 2C 26 2E 78 F0 2E 1D 19 00 88 DF 2A 26 19 00 04 1B 15 98 00 00 1F 6D 52 65 6D 6F 76 65 49 74 65 6D 42 75 74 74 6F 6E 00 16 
      mRemoveItemButton.SetText(Class'SBGuiStrings'.default.Remove_Item.Text);  //03D0 : 19 01 C8 D6 2C 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 50 E5 98 19 16 
      mRemoveItemButton.SetEnabled(False);                                      //03F2 : 19 01 C8 D6 2C 26 07 00 00 1B 5F 32 00 00 28 16 
      mRemoveItemButton.mIntTag = 2;                                            //0402 : 0F 19 01 C8 D6 2C 26 05 00 04 01 58 90 31 16 2C 02 
      mRemoveItemButton.__OnClick__Delegate = ClickHandler;                     //0413 : 45 19 01 C8 D6 2C 26 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
      mRemoveAllButton = GUI_Button(Editor.RetrieveComponent("mRemoveAllButton"));//0427 : 0F 01 60 A4 2C 26 2E 78 F0 2E 1D 19 00 88 DF 2A 26 18 00 04 1B 15 98 00 00 1F 6D 52 65 6D 6F 76 65 41 6C 6C 42 75 74 74 6F 6E 00 16 
      mRemoveAllButton.SetText(Class'SBGuiStrings'.default.Remove_All.Text);    //0453 : 19 01 60 A4 2C 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C8 E5 98 19 16 
      mRemoveAllButton.SetEnabled(False);                                       //0475 : 19 01 60 A4 2C 26 07 00 00 1B 5F 32 00 00 28 16 
      mRemoveAllButton.mIntTag = 3;                                             //0485 : 0F 19 01 60 A4 2C 26 05 00 04 01 58 90 31 16 2C 03 
      mRemoveAllButton.__OnClick__Delegate = ClickHandler;                      //0496 : 45 19 01 60 A4 2C 26 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
      mCancelButton = GUI_Button(Editor.RetrieveComponent("mCancelButton"));    //04AA : 0F 01 70 43 06 1B 2E 78 F0 2E 1D 19 00 88 DF 2A 26 15 00 04 1B 15 98 00 00 1F 6D 43 61 6E 63 65 6C 42 75 74 74 6F 6E 00 16 
      mCancelButton.SetText(Class'SBGuiStrings'.default.Cancel.Text);           //04D3 : 19 01 70 43 06 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 43 98 19 16 
      mCancelButton.mIntTag = 0;                                                //04F5 : 0F 19 01 70 43 06 1B 05 00 04 01 58 90 31 16 25 
      mCancelButton.__OnClick__Delegate = ClickHandler;                         //0505 : 45 19 01 70 43 06 1B 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
      mAcceptOfferButton = GUI_Button(Editor.RetrieveComponent("mAcceptOfferButton"));//0519 : 0F 01 D8 DC 2C 26 2E 78 F0 2E 1D 19 00 88 DF 2A 26 1A 00 04 1B 15 98 00 00 1F 6D 41 63 63 65 70 74 4F 66 66 65 72 42 75 74 74 6F 6E 00 16 
      mAcceptOfferButton.SetText(Class'SBGuiStrings'.default.Accept_Offer.Text);//0547 : 19 01 D8 DC 2C 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 70 3E 99 19 16 
      mAcceptOfferButton.mIntTag = 1;                                           //0569 : 0F 19 01 D8 DC 2C 26 05 00 04 01 58 90 31 16 26 
      mAcceptOfferButton.__OnClick__Delegate = ClickHandler;                    //0579 : 45 19 01 D8 DC 2C 26 05 00 08 01 98 EB 9D 19 44 21 98 00 00 
      mHelpLabel1 = GUI_Label(Editor.RetrieveComponent("mHelpLabel1"));         //058D : 0F 01 F8 1A 08 1B 2E 38 15 2F 1D 19 00 88 DF 2A 26 13 00 04 1B 15 98 00 00 1F 6D 48 65 6C 70 4C 61 62 65 6C 31 00 16 
      mHelpLabel1.SetText(Class'SBGuiStrings'.default.Drag_the_items_you_wish_to_trade_in_here.Text);//05B4 : 19 01 F8 1A 08 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 31 99 19 16 
      mHelpLabel2 = GUI_Label(Editor.RetrieveComponent("mHelpLabel2"));         //05D6 : 0F 01 08 1A 08 1B 2E 38 15 2F 1D 19 00 88 DF 2A 26 13 00 04 1B 15 98 00 00 1F 6D 48 65 6C 70 4C 61 62 65 6C 32 00 16 
      mHelpLabel2.SetText(Class'SBGuiStrings'.default.Add_money_you_wish_to_trade.Text);//05FD : 19 01 08 1A 08 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 32 99 19 16 
    }
    Reset();                                                                    //061F : 1B 53 12 00 00 16 
    //1C 28 9E 9E 19 16 0F 00 88 DF 2A 26 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 
    //20 00 68 D7 00 02 00 04 2C 2D 16 07 1F 06 77 00 88 DF 2A 26 2A 16 19 00 88 DF 2A 26 18 00 00 1B 
    //3F 01 00 00 17 1F 54 72 61 64 65 57 69 6E 64 6F 77 2E 74 78 74 00 16 1B 28 98 00 00 1F 68 65 61 
    //64 65 72 5F 74 72 61 64 65 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 
    //55 49 5F 53 74 79 6C 65 73 00 16 0F 01 40 78 06 1B 2E D8 E5 2E 1D 19 00 88 DF 2A 26 1F 00 04 1B 
    //15 98 00 00 1F 6D 48 65 61 64 65 72 54 72 61 64 65 50 61 72 74 6E 65 72 50 61 67 65 00 16 19 01 
    //40 78 06 1B 15 00 00 1B 52 98 00 00 1E 00 00 3A 43 1E 00 00 33 43 1E 00 00 45 43 16 0F 01 F8 3B 
    //06 1B 2E 38 15 2F 1D 19 00 88 DF 2A 26 12 00 04 1B 15 98 00 00 1F 6D 4F 74 68 65 72 4E 61 6D 65 
    //00 16 0F 01 A8 6A 04 1B 2E 08 00 2C 26 19 00 88 DF 2A 26 17 00 04 1B 15 98 00 00 1F 6D 4F 74 68 
    //65 72 54 72 61 64 65 50 61 67 65 00 16 19 01 A8 6A 04 1B 07 00 00 1B 36 99 00 00 27 16 0F 01 C8 
    //97 07 1B 2E 38 15 2F 1D 19 00 88 DF 2A 26 17 00 04 1B 15 98 00 00 1F 6D 4F 74 68 65 72 53 75 6E 
    //70 6C 61 74 65 73 00 16 0F 01 40 98 07 1B 2E 38 15 2F 1D 19 00 88 DF 2A 26 1A 00 04 1B 15 98 00 
    //00 1F 6D 4F 74 68 65 72 51 75 61 72 74 65 72 6E 61 69 6C 73 00 16 0F 01 B8 98 07 1B 2E 38 15 2F 
    //1D 19 00 88 DF 2A 26 17 00 04 1B 15 98 00 00 1F 6D 4F 74 68 65 72 4C 6F 64 65 72 69 6E 67 73 00 
    //16 0F 01 38 DA 04 1B 2E D8 E5 2E 1D 19 00 88 DF 2A 26 1E 00 04 1B 15 98 00 00 1F 6D 48 65 61 64 
    //65 72 54 72 61 64 65 50 6C 61 79 65 72 50 61 67 65 00 16 19 01 38 DA 04 1B 15 00 00 1B 52 98 00 
    //00 1E 00 00 3A 43 1E 00 00 33 43 1E 00 00 45 43 16 0F 01 70 1B 08 1B 2E 38 15 2F 1D 19 00 88 DF 
    //2A 26 13 00 04 1B 15 98 00 00 1F 6D 50 6C 61 79 65 72 4E 61 6D 65 00 16 0F 01 38 39 2B 26 2E 08 
    //00 2C 26 19 00 88 DF 2A 26 18 00 04 1B 15 98 00 00 1F 6D 50 6C 61 79 65 72 54 72 61 64 65 50 61 
    //67 65 00 16 19 01 38 39 2B 26 07 00 00 1B 36 99 00 00 28 16 45 19 01 38 39 2B 26 05 00 08 01 68 
    //BF 07 1B 44 57 99 00 00 0F 01 20 1F 04 1B 2E 38 00 2F 1D 19 00 88 DF 2A 26 18 00 04 1B 15 98 00 
    //00 1F 6D 50 6C 61 79 65 72 53 75 6E 70 6C 61 74 65 73 00 16 19 01 20 1F 04 1B 09 00 00 1B B8 98 
    //00 00 27 28 28 16 45 19 01 20 1F 04 1B 05 00 08 01 10 CF A4 19 44 5F 99 00 00 0F 01 28 C8 2C 26 
    //2E 38 00 2F 1D 19 00 88 DF 2A 26 1B 00 04 1B 15 98 00 00 1F 6D 50 6C 61 79 65 72 51 75 61 72 74 
    //65 72 6E 61 69 6C 73 00 16 19 01 28 C8 2C 26 09 00 00 1B B8 98 00 00 27 28 28 16 0F 19 01 28 C8 
    //2C 26 05 00 04 01 F0 E5 A4 19 2C 02 45 19 01 28 C8 2C 26 05 00 08 01 10 CF A4 19 44 5F 99 00 00 
    //0F 01 90 C9 2C 26 2E 38 00 2F 1D 19 00 88 DF 2A 26 18 00 04 1B 15 98 00 00 1F 6D 50 6C 61 79 65 
    //72 4C 6F 64 65 72 69 6E 67 73 00 16 19 01 90 C9 2C 26 09 00 00 1B B8 98 00 00 27 28 28 16 0F 19 
    //01 90 C9 2C 26 05 00 04 01 F0 E5 A4 19 2C 02 45 19 01 90 C9 2C 26 05 00 08 01 10 CF A4 19 44 5F 
    //99 00 00 0F 01 C8 D6 2C 26 2E 78 F0 2E 1D 19 00 88 DF 2A 26 19 00 04 1B 15 98 00 00 1F 6D 52 65 
    //6D 6F 76 65 49 74 65 6D 42 75 74 74 6F 6E 00 16 19 01 C8 D6 2C 26 19 00 00 1B 13 98 00 00 36 58 
    //C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 50 E5 98 19 16 19 01 C8 D6 2C 26 07 00 00 1B 5F 32 00 00 
    //28 16 0F 19 01 C8 D6 2C 26 05 00 04 01 58 90 31 16 2C 02 45 19 01 C8 D6 2C 26 05 00 08 01 98 EB 
    //9D 19 44 21 98 00 00 0F 01 60 A4 2C 26 2E 78 F0 2E 1D 19 00 88 DF 2A 26 18 00 04 1B 15 98 00 00 
    //1F 6D 52 65 6D 6F 76 65 41 6C 6C 42 75 74 74 6F 6E 00 16 19 01 60 A4 2C 26 19 00 00 1B 13 98 00 
    //00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C8 E5 98 19 16 19 01 60 A4 2C 26 07 00 00 1B 5F 
    //32 00 00 28 16 0F 19 01 60 A4 2C 26 05 00 04 01 58 90 31 16 2C 03 45 19 01 60 A4 2C 26 05 00 08 
    //01 98 EB 9D 19 44 21 98 00 00 0F 01 70 43 06 1B 2E 78 F0 2E 1D 19 00 88 DF 2A 26 15 00 04 1B 15 
    //98 00 00 1F 6D 43 61 6E 63 65 6C 42 75 74 74 6F 6E 00 16 19 01 70 43 06 1B 19 00 00 1B 13 98 00 
    //00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 43 98 19 16 0F 19 01 70 43 06 1B 05 00 04 01 
    //58 90 31 16 25 45 19 01 70 43 06 1B 05 00 08 01 98 EB 9D 19 44 21 98 00 00 0F 01 D8 DC 2C 26 2E 
    //78 F0 2E 1D 19 00 88 DF 2A 26 1A 00 04 1B 15 98 00 00 1F 6D 41 63 63 65 70 74 4F 66 66 65 72 42 
    //75 74 74 6F 6E 00 16 19 01 D8 DC 2C 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 
    //05 00 0C 02 70 3E 99 19 16 0F 19 01 D8 DC 2C 26 05 00 04 01 58 90 31 16 26 45 19 01 D8 DC 2C 26 
    //05 00 08 01 98 EB 9D 19 44 21 98 00 00 0F 01 F8 1A 08 1B 2E 38 15 2F 1D 19 00 88 DF 2A 26 13 00 
    //04 1B 15 98 00 00 1F 6D 48 65 6C 70 4C 61 62 65 6C 31 00 16 19 01 F8 1A 08 1B 19 00 00 1B 13 98 
    //00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 31 99 19 16 0F 01 08 1A 08 1B 2E 38 15 2F 
    //1D 19 00 88 DF 2A 26 13 00 04 1B 15 98 00 00 1F 6D 48 65 6C 70 4C 61 62 65 6C 32 00 16 19 01 08 
    //1A 08 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 32 99 19 16 1B 
    //53 12 00 00 16 04 0B 47 
  }



