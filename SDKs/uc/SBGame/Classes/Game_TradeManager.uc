//==============================================================================
//  Game_TradeManager
//==============================================================================

class Game_TradeManager extends Base_Component within Game_GameInfo
    native
    exportstructs
    dependsOn(Game_Trading,Trade_Transaction,Game_Pawn,Game_ItemManager,Game_Item,Game_CombatState,Game_CombatStats)
  ;

  var private array<Trade_Transaction> mTransactions;


  function OnPerformedTransactionHandler(Trade_Transaction aTransaction,bool aSuccess) {
    local byte Message;
    if (aSuccess) {                                                             //0000 : 07 1D 00 2D 00 88 F0 30 11 
      Message = Class'Game_Trading'.16;                                         //0009 : 0F 00 00 F1 30 11 12 20 B0 78 5F 01 02 00 01 24 10 
    } else {                                                                    //001A : 06 2E 00 
      Message = Class'Game_Trading'.15;                                         //001D : 0F 00 00 F1 30 11 12 20 B0 78 5F 01 02 00 01 24 0F 
    }
    if (aTransaction.mInitiator != None
      && aTransaction.mInitiator.Trading != None) {//002E : 07 87 00 82 77 19 00 A0 EE 30 11 05 00 04 01 78 F1 30 11 2A 16 18 1B 00 77 19 19 00 A0 EE 30 11 05 00 04 01 78 F1 30 11 05 00 04 01 C0 43 32 0F 2A 16 16 
      aTransaction.mInitiator.Trading.sv2cl_TradingMessage_CallStub(Message);   //0061 : 19 19 19 00 A0 EE 30 11 05 00 04 01 78 F1 30 11 05 00 04 01 C0 43 32 0F 0B 00 00 1B F8 0B 00 00 00 00 F1 30 11 16 
    }
    if (aTransaction.mPartner != None
      && aTransaction.mPartner.Trading != None) {//0087 : 07 E0 00 82 77 19 00 A0 EE 30 11 05 00 04 01 F0 F1 30 11 2A 16 18 1B 00 77 19 19 00 A0 EE 30 11 05 00 04 01 F0 F1 30 11 05 00 04 01 C0 43 32 0F 2A 16 16 
      aTransaction.mPartner.Trading.sv2cl_TradingMessage_CallStub(Message);     //00BA : 19 19 19 00 A0 EE 30 11 05 00 04 01 F0 F1 30 11 05 00 04 01 C0 43 32 0F 0B 00 00 1B F8 0B 00 00 00 00 F1 30 11 16 
    }
    EndTransaction(aTransaction);                                               //00E0 : 1C E0 17 30 11 00 A0 EE 30 11 16 
    //07 1D 00 2D 00 88 F0 30 11 0F 00 00 F1 30 11 12 20 B0 78 5F 01 02 00 01 24 10 06 2E 00 0F 00 00 
    //F1 30 11 12 20 B0 78 5F 01 02 00 01 24 0F 07 87 00 82 77 19 00 A0 EE 30 11 05 00 04 01 78 F1 30 
    //11 2A 16 18 1B 00 77 19 19 00 A0 EE 30 11 05 00 04 01 78 F1 30 11 05 00 04 01 C0 43 32 0F 2A 16 
    //16 19 19 19 00 A0 EE 30 11 05 00 04 01 78 F1 30 11 05 00 04 01 C0 43 32 0F 0B 00 00 1B F8 0B 00 
    //00 00 00 F1 30 11 16 07 E0 00 82 77 19 00 A0 EE 30 11 05 00 04 01 F0 F1 30 11 2A 16 18 1B 00 77 
    //19 19 00 A0 EE 30 11 05 00 04 01 F0 F1 30 11 05 00 04 01 C0 43 32 0F 2A 16 16 19 19 19 00 A0 EE 
    //30 11 05 00 04 01 F0 F1 30 11 05 00 04 01 C0 43 32 0F 0B 00 00 1B F8 0B 00 00 00 00 F1 30 11 16 
    //1C E0 17 30 11 00 A0 EE 30 11 16 04 0B 47 
  }


  private final function CreateTransaction(Game_Pawn aInitiator,Game_Pawn aPartner) {
    local Trade_Transaction newTransaction;
    newTransaction = new Class'Trade_Transaction';                              //0000 : 0F 00 A0 19 30 11 11 0B 0B 0B 20 00 5F 5C 01 
    newTransaction.sv_InitTransaction(aInitiator,aPartner);                     //000F : 19 00 A0 19 30 11 10 00 00 1B 0A 0E 00 00 00 90 18 30 11 00 18 1A 30 11 16 
    newTransaction.__OnPerformedTransaction__Delegate = OnPerformedTransactionHandler;//0028 : 45 19 00 A0 19 30 11 05 00 08 01 90 1A 30 11 44 9C 0E 00 00 
    mTransactions[mTransactions.Length] = newTransaction;                       //003C : 0F 10 37 01 08 1B 30 11 01 08 1B 30 11 00 A0 19 30 11 
    //0F 00 A0 19 30 11 11 0B 0B 0B 20 00 5F 5C 01 19 00 A0 19 30 11 10 00 00 1B 0A 0E 00 00 00 90 18 
    //30 11 00 18 1A 30 11 16 45 19 00 A0 19 30 11 05 00 08 01 90 1A 30 11 44 9C 0E 00 00 0F 10 37 01 
    //08 1B 30 11 01 08 1B 30 11 00 A0 19 30 11 04 0B 47 
  }


  private final native function EndTransaction(Trade_Transaction aTransaction);


  private final native function Trade_Transaction GetTransaction(Game_Pawn aPawn);


  function sv_AcceptOffer(Game_Pawn aTrader) {
    local Game_Pawn otherTrader;
    local Trade_Transaction Transaction;
    Transaction = GetTransaction(aTrader);                                      //0000 : 0F 00 E0 1F 30 11 1C 80 1B 30 11 00 68 1F 30 11 16 
    if (Transaction != None) {                                                  //0011 : 07 DD 01 77 00 E0 1F 30 11 2A 16 
      if (Transaction.sv_IsTransactionValid()) {                                //001C : 07 DD 01 19 00 E0 1F 30 11 06 00 04 1B 14 0C 00 00 16 
        if (!Transaction.sv_HasSufficientSpace(aTrader)) {                      //002E : 07 6D 00 81 19 00 E0 1F 30 11 0B 00 04 1B 5B 0D 00 00 00 68 1F 30 11 16 16 
          aTrader.Trading.sv2cl_TradingMessage_CallStub(Class'Game_Trading'.12);//0047 : 19 19 00 68 1F 30 11 05 00 04 01 C0 43 32 0F 11 00 00 1B F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 0C 16 
        } else {                                                                //006A : 06 DD 01 
          otherTrader = Transaction.sv_GetOtherTrader(aTrader);                 //006D : 0F 00 58 20 30 11 19 00 E0 1F 30 11 0B 00 04 1B 2A 0C 00 00 00 68 1F 30 11 16 
          switch (Transaction.sv_GetState()) {                                  //0087 : 05 01 19 00 E0 1F 30 11 06 00 01 1B 4F 0C 00 00 16 
            case Class'Trade_Transaction'.2 :                                   //0098 : 0A 8C 01 12 20 00 5F 5C 01 02 00 01 24 02 
              if (!Transaction.sv_HasSufficientSpace(otherTrader)) {            //00A6 : 07 22 01 81 19 00 E0 1F 30 11 0B 00 04 1B 5B 0D 00 00 00 58 20 30 11 16 16 
                aTrader.Trading.sv2cl_TradingMessage_CallStub(Class'Game_Trading'.13);//00BF : 19 19 00 68 1F 30 11 05 00 04 01 C0 43 32 0F 11 00 00 1B F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 0D 16 
                otherTrader.Trading.sv2cl_TradingMessage_CallStub(Class'Game_Trading'.12);//00E2 : 19 19 00 58 20 30 11 05 00 04 01 C0 43 32 0F 11 00 00 1B F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 0C 16 
                Transaction.sv_SetState(Class'Trade_Transaction'.1);            //0105 : 19 00 E0 1F 30 11 11 00 00 1B 1D 0C 00 00 12 20 00 5F 5C 01 02 00 01 24 01 16 
              } else {                                                          //011F : 06 89 01 
                Transaction.mInitiator.Trading.sv2cl_TradingMessage_CallStub(Class'Game_Trading'.14);//0122 : 19 19 19 00 E0 1F 30 11 05 00 04 01 78 F1 30 11 05 00 04 01 C0 43 32 0F 11 00 00 1B F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 0E 16 
                Transaction.mPartner.Trading.sv2cl_TradingMessage_CallStub(Class'Game_Trading'.14);//014E : 19 19 19 00 E0 1F 30 11 05 00 04 01 F0 F1 30 11 05 00 04 01 C0 43 32 0F 11 00 00 1B F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 0E 16 
                Transaction.sv_PerformTransaction();                            //017A : 19 00 E0 1F 30 11 06 00 00 1B E2 0D 00 00 16 
              }
              break;                                                            //0189 : 06 DD 01 
            case Class'Trade_Transaction'.1 :                                   //018C : 0A DA 01 12 20 00 5F 5C 01 02 00 01 24 01 
              Transaction.sv_SetState(Class'Trade_Transaction'.2);              //019A : 19 00 E0 1F 30 11 11 00 00 1B 1D 0C 00 00 12 20 00 5F 5C 01 02 00 01 24 02 16 
              otherTrader.Trading.sv2cl_TradingMessage_CallStub(Class'Game_Trading'.10);//01B4 : 19 19 00 58 20 30 11 05 00 04 01 C0 43 32 0F 11 00 00 1B F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 0A 16 
              break;                                                            //01D7 : 06 DD 01 
            default:                                                            //01DA : 0A FF FF 
          }
        }
      }
    }
    //0F 00 E0 1F 30 11 1C 80 1B 30 11 00 68 1F 30 11 16 07 DD 01 77 00 E0 1F 30 11 2A 16 07 DD 01 19 
    //00 E0 1F 30 11 06 00 04 1B 14 0C 00 00 16 07 6D 00 81 19 00 E0 1F 30 11 0B 00 04 1B 5B 0D 00 00 
    //00 68 1F 30 11 16 16 19 19 00 68 1F 30 11 05 00 04 01 C0 43 32 0F 11 00 00 1B F8 0B 00 00 12 20 
    //B0 78 5F 01 02 00 01 24 0C 16 06 DD 01 0F 00 58 20 30 11 19 00 E0 1F 30 11 0B 00 04 1B 2A 0C 00 
    //00 00 68 1F 30 11 16 05 01 19 00 E0 1F 30 11 06 00 01 1B 4F 0C 00 00 16 0A 8C 01 12 20 00 5F 5C 
    //01 02 00 01 24 02 07 22 01 81 19 00 E0 1F 30 11 0B 00 04 1B 5B 0D 00 00 00 58 20 30 11 16 16 19 
    //19 00 68 1F 30 11 05 00 04 01 C0 43 32 0F 11 00 00 1B F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 
    //0D 16 19 19 00 58 20 30 11 05 00 04 01 C0 43 32 0F 11 00 00 1B F8 0B 00 00 12 20 B0 78 5F 01 02 
    //00 01 24 0C 16 19 00 E0 1F 30 11 11 00 00 1B 1D 0C 00 00 12 20 00 5F 5C 01 02 00 01 24 01 16 06 
    //89 01 19 19 19 00 E0 1F 30 11 05 00 04 01 78 F1 30 11 05 00 04 01 C0 43 32 0F 11 00 00 1B F8 0B 
    //00 00 12 20 B0 78 5F 01 02 00 01 24 0E 16 19 19 19 00 E0 1F 30 11 05 00 04 01 F0 F1 30 11 05 00 
    //04 01 C0 43 32 0F 11 00 00 1B F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 0E 16 19 00 E0 1F 30 11 
    //06 00 00 1B E2 0D 00 00 16 06 DD 01 0A DA 01 12 20 00 5F 5C 01 02 00 01 24 01 19 00 E0 1F 30 11 
    //11 00 00 1B 1D 0C 00 00 12 20 00 5F 5C 01 02 00 01 24 02 16 19 19 00 58 20 30 11 05 00 04 01 C0 
    //43 32 0F 11 00 00 1B F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 0A 16 06 DD 01 0A FF FF 04 0B 47 
    //
  }


  function sv_CancelOffer(Game_Pawn aTrader) {
    local Game_Pawn otherTrader;
    local Trade_Transaction Transaction;
    Transaction = GetTransaction(aTrader);                                      //0000 : 0F 00 F8 21 30 11 1C 80 1B 30 11 00 80 21 30 11 16 
    if (Transaction != None) {                                                  //0011 : 07 A1 00 77 00 F8 21 30 11 2A 16 
      if (Transaction.sv_IsTransactionValid()
        && Transaction.sv_GetState() == Class'Trade_Transaction'.3) {//001C : 07 A1 00 82 19 00 F8 21 30 11 06 00 04 1B 14 0C 00 00 16 18 21 00 9A 39 3A 19 00 F8 21 30 11 06 00 01 1B 4F 0C 00 00 16 39 3A 12 20 00 5F 5C 01 02 00 01 24 03 16 16 
        Transaction.sv_SetState(1);                                             //0053 : 19 00 F8 21 30 11 08 00 00 1B 1D 0C 00 00 24 01 16 
        otherTrader = Transaction.sv_GetOtherTrader(aTrader);                   //0064 : 0F 00 70 22 30 11 19 00 F8 21 30 11 0B 00 04 1B 2A 0C 00 00 00 80 21 30 11 16 
        otherTrader.Trading.sv2cl_TradingMessage_CallStub(Class'Game_Trading'.11);//007E : 19 19 00 70 22 30 11 05 00 04 01 C0 43 32 0F 11 00 00 1B F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 0B 16 
      }
    }
    //0F 00 F8 21 30 11 1C 80 1B 30 11 00 80 21 30 11 16 07 A1 00 77 00 F8 21 30 11 2A 16 07 A1 00 82 
    //19 00 F8 21 30 11 06 00 04 1B 14 0C 00 00 16 18 21 00 9A 39 3A 19 00 F8 21 30 11 06 00 01 1B 4F 
    //0C 00 00 16 39 3A 12 20 00 5F 5C 01 02 00 01 24 03 16 16 19 00 F8 21 30 11 08 00 00 1B 1D 0C 00 
    //00 24 01 16 0F 00 70 22 30 11 19 00 F8 21 30 11 0B 00 04 1B 2A 0C 00 00 00 80 21 30 11 16 19 19 
    //00 70 22 30 11 05 00 04 01 C0 43 32 0F 11 00 00 1B F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 0B 
    //16 04 0B 47 
  }


  function sv_CancelTrade(Game_Pawn aTrader) {
    local Game_Pawn otherTrader;
    local Trade_Transaction Transaction;
    Transaction = GetTransaction(aTrader);                                      //0000 : 0F 00 18 25 30 11 1C 80 1B 30 11 00 98 23 30 11 16 
    if (Transaction != None) {                                                  //0011 : 07 9B 00 77 00 18 25 30 11 2A 16 
      if (Transaction.sv_IsTransactionValid()
        && Transaction.sv_GetState() != Class'Trade_Transaction'.3) {//001C : 07 9B 00 82 19 00 18 25 30 11 06 00 04 1B 14 0C 00 00 16 18 21 00 9B 39 3A 19 00 18 25 30 11 06 00 01 1B 4F 0C 00 00 16 39 3A 12 20 00 5F 5C 01 02 00 01 24 03 16 16 
        otherTrader = Transaction.sv_GetOtherTrader(aTrader);                   //0053 : 0F 00 90 25 30 11 19 00 18 25 30 11 0B 00 04 1B 2A 0C 00 00 00 98 23 30 11 16 
        otherTrader.Trading.sv2cl_TradingMessage_CallStub(Class'Game_Trading'.9);//006D : 19 19 00 90 25 30 11 05 00 04 01 C0 43 32 0F 11 00 00 1B F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 09 16 
        EndTransaction(Transaction);                                            //0090 : 1C E0 17 30 11 00 18 25 30 11 16 
      }
    }
    //0F 00 18 25 30 11 1C 80 1B 30 11 00 98 23 30 11 16 07 9B 00 77 00 18 25 30 11 2A 16 07 9B 00 82 
    //19 00 18 25 30 11 06 00 04 1B 14 0C 00 00 16 18 21 00 9B 39 3A 19 00 18 25 30 11 06 00 01 1B 4F 
    //0C 00 00 16 39 3A 12 20 00 5F 5C 01 02 00 01 24 03 16 16 0F 00 90 25 30 11 19 00 18 25 30 11 0B 
    //00 04 1B 2A 0C 00 00 00 98 23 30 11 16 19 19 00 90 25 30 11 05 00 04 01 C0 43 32 0F 11 00 00 1B 
    //F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 09 16 1C E0 17 30 11 00 18 25 30 11 16 04 0B 47 
  }


  function sv_ResetOffer(Game_Pawn aTrader) {
    local Game_Pawn otherTrader;
    local Trade_Transaction Transaction;
    Transaction = GetTransaction(aTrader);                                      //0000 : 0F 00 30 27 30 11 1C 80 1B 30 11 00 B8 26 30 11 16 
    if (Transaction != None) {                                                  //0011 : 07 62 00 77 00 30 27 30 11 2A 16 
      Transaction.sv_ResetOffer(aTrader);                                       //001C : 19 00 30 27 30 11 0B 00 00 1B 06 0D 00 00 00 B8 26 30 11 16 
      otherTrader = Transaction.sv_GetOtherTrader(aTrader);                     //0030 : 0F 00 18 09 31 11 19 00 30 27 30 11 0B 00 04 1B 2A 0C 00 00 00 B8 26 30 11 16 
      otherTrader.Trading.sv2cl_ResetPartnerOffer_CallStub();                   //004A : 19 19 00 18 09 31 11 05 00 04 01 C0 43 32 0F 06 00 00 1B 06 0F 00 00 16 
    }
    //0F 00 30 27 30 11 1C 80 1B 30 11 00 B8 26 30 11 16 07 62 00 77 00 30 27 30 11 2A 16 19 00 30 27 
    //30 11 0B 00 00 1B 06 0D 00 00 00 B8 26 30 11 16 0F 00 18 09 31 11 19 00 30 27 30 11 0B 00 04 1B 
    //2A 0C 00 00 00 B8 26 30 11 16 19 19 00 18 09 31 11 05 00 04 01 C0 43 32 0F 06 00 00 1B 06 0F 00 
    //00 16 04 0B 47 
  }


  function sv_SetTradeMoney(Game_Pawn aTrader,int aMoney) {
    local Game_Pawn otherTrader;
    local Trade_Transaction Transaction;
    Transaction = GetTransaction(aTrader);                                      //0000 : 0F 00 98 0B 31 11 1C 80 1B 30 11 00 40 0A 31 11 16 
    if (Transaction != None) {                                                  //0011 : 07 7E 00 77 00 98 0B 31 11 2A 16 
      if (Transaction.sv_SetTradeMoney(aTrader,aMoney)) {                       //001C : 07 7E 00 19 00 98 0B 31 11 10 00 04 1B 05 0D 00 00 00 40 0A 31 11 00 10 0C 31 11 16 
        otherTrader = Transaction.sv_GetOtherTrader(aTrader);                   //0038 : 0F 00 88 0C 31 11 19 00 98 0B 31 11 0B 00 04 1B 2A 0C 00 00 00 40 0A 31 11 16 
        otherTrader.Trading.sv2cl_SetPartnerMoney_CallStub(Transaction.sv_GetTradeMoney(aTrader));//0052 : 19 19 00 88 0C 31 11 05 00 04 01 C0 43 32 0F 1A 00 00 1B 56 0F 00 00 19 00 98 0B 31 11 0B 00 04 1B EB 0D 00 00 00 40 0A 31 11 16 16 
      }
    }
    //0F 00 98 0B 31 11 1C 80 1B 30 11 00 40 0A 31 11 16 07 7E 00 77 00 98 0B 31 11 2A 16 07 7E 00 19 
    //00 98 0B 31 11 10 00 04 1B 05 0D 00 00 00 40 0A 31 11 00 10 0C 31 11 16 0F 00 88 0C 31 11 19 00 
    //98 0B 31 11 0B 00 04 1B 2A 0C 00 00 00 40 0A 31 11 16 19 19 00 88 0C 31 11 05 00 04 01 C0 43 32 
    //0F 1A 00 00 1B 56 0F 00 00 19 00 98 0B 31 11 0B 00 04 1B EB 0D 00 00 00 40 0A 31 11 16 16 04 0B 
    //47 
  }


  function sv_RemoveItem(Game_Pawn aTrader,int aLocationSlot) {
    local Game_Pawn otherTrader;
    local Trade_Transaction Transaction;
    Transaction = GetTransaction(aTrader);                                      //0000 : 0F 00 28 0E 31 11 1C 80 1B 30 11 00 B0 0D 31 11 16 
    if (Transaction != None) {                                                  //0011 : 07 6F 00 77 00 28 0E 31 11 2A 16 
      if (Transaction.sv_RemoveItem(aTrader,aLocationSlot)) {                   //001C : 07 6F 00 19 00 28 0E 31 11 10 00 04 1B 04 0D 00 00 00 B0 0D 31 11 00 A0 0E 31 11 16 
        otherTrader = Transaction.sv_GetOtherTrader(aTrader);                   //0038 : 0F 00 18 0F 31 11 19 00 28 0E 31 11 0B 00 04 1B 2A 0C 00 00 00 B0 0D 31 11 16 
        otherTrader.Trading.sv2cl_RemovePartnerItem_CallStub(aLocationSlot);    //0052 : 19 19 00 18 0F 31 11 05 00 04 01 C0 43 32 0F 0B 00 00 1B 47 0F 00 00 00 A0 0E 31 11 16 
      }
    }
    //0F 00 28 0E 31 11 1C 80 1B 30 11 00 B0 0D 31 11 16 07 6F 00 77 00 28 0E 31 11 2A 16 07 6F 00 19 
    //00 28 0E 31 11 10 00 04 1B 04 0D 00 00 00 B0 0D 31 11 00 A0 0E 31 11 16 0F 00 18 0F 31 11 19 00 
    //28 0E 31 11 0B 00 04 1B 2A 0C 00 00 00 B0 0D 31 11 16 19 19 00 18 0F 31 11 05 00 04 01 C0 43 32 
    //0F 0B 00 00 1B 47 0F 00 00 00 A0 0E 31 11 16 04 0B 47 
  }


  function sv_SetTradeItem(Game_Pawn aTrader,int aDBID,int aAmount,int aLocationSlot) {
    local Game_Item Item;
    local ReplicatedItem repItem;
    local Game_Pawn otherTrader;
    local Trade_Transaction Transaction;
    Transaction = GetTransaction(aTrader);                                      //0000 : 0F 00 18 12 31 11 1C 80 1B 30 11 00 40 10 31 11 16 
    if (Transaction != None) {                                                  //0011 : 07 DE 00 77 00 18 12 31 11 2A 16 
      if (aDBID > 0) {                                                          //001C : 07 4A 00 97 00 90 12 31 11 25 16 
        Item = aTrader.itemManager.GetItemByID(aDBID);                          //0027 : 0F 00 08 13 31 11 19 19 00 40 10 31 11 05 00 04 01 B0 2D 19 11 0B 00 04 1B 7A 0C 00 00 00 90 12 31 11 16 
      }
      if (Item != None
        && Transaction.sv_SetTradeItem(aTrader,Item,aAmount,aLocationSlot)) {//004A : 07 DE 00 82 77 00 08 13 31 11 2A 16 18 24 00 19 00 18 12 31 11 1A 00 04 1B 03 0D 00 00 00 40 10 31 11 00 08 13 31 11 00 80 13 31 11 00 F8 13 31 11 16 16 
        repItem = Item.GetReplicated();                                         //007D : 0F 00 70 14 31 11 19 00 08 13 31 11 06 00 10 1C 98 3A 2E 11 16 
        repItem.StackSize = aAmount;                                            //0092 : 0F 36 60 CC 22 11 00 70 14 31 11 00 80 13 31 11 
        otherTrader = Transaction.sv_GetOtherTrader(aTrader);                   //00A2 : 0F 00 E8 14 31 11 19 00 18 12 31 11 0B 00 04 1B 2A 0C 00 00 00 40 10 31 11 16 
        otherTrader.Trading.sv2cl_SetPartnerItem_CallStub(repItem,aLocationSlot);//00BC : 19 19 00 E8 14 31 11 05 00 04 01 C0 43 32 0F 10 00 00 1B 2D 0F 00 00 00 70 14 31 11 00 F8 13 31 11 16 
      }
    }
    //0F 00 18 12 31 11 1C 80 1B 30 11 00 40 10 31 11 16 07 DE 00 77 00 18 12 31 11 2A 16 07 4A 00 97 
    //00 90 12 31 11 25 16 0F 00 08 13 31 11 19 19 00 40 10 31 11 05 00 04 01 B0 2D 19 11 0B 00 04 1B 
    //7A 0C 00 00 00 90 12 31 11 16 07 DE 00 82 77 00 08 13 31 11 2A 16 18 24 00 19 00 18 12 31 11 1A 
    //00 04 1B 03 0D 00 00 00 40 10 31 11 00 08 13 31 11 00 80 13 31 11 00 F8 13 31 11 16 16 0F 00 70 
    //14 31 11 19 00 08 13 31 11 06 00 10 1C 98 3A 2E 11 16 0F 36 60 CC 22 11 00 70 14 31 11 00 80 13 
    //31 11 0F 00 E8 14 31 11 19 00 18 12 31 11 0B 00 04 1B 2A 0C 00 00 00 40 10 31 11 16 19 19 00 E8 
    //14 31 11 05 00 04 01 C0 43 32 0F 10 00 00 1B 2D 0F 00 00 00 70 14 31 11 00 F8 13 31 11 16 04 0B 
    //47 
  }


  function sv_AcceptRequest(Game_Pawn aTrader) {
    local Trade_Transaction Transaction;
    Transaction = GetTransaction(aTrader);                                      //0000 : 0F 00 98 17 31 11 1C 80 1B 30 11 00 10 16 31 11 16 
    if (Transaction != None
      && Transaction.mPartner == aTrader) {         //0011 : 07 A4 00 82 77 00 98 17 31 11 2A 16 18 16 00 72 19 00 98 17 31 11 05 00 04 01 F0 F1 30 11 00 10 16 31 11 16 16 
      if (Transaction.sv_IsTransactionValid()) {                                //0036 : 07 A4 00 19 00 98 17 31 11 06 00 04 1B 14 0C 00 00 16 
        Transaction.sv_SetState(Class'Trade_Transaction'.1);                    //0048 : 19 00 98 17 31 11 11 00 00 1B 1D 0C 00 00 12 20 00 5F 5C 01 02 00 01 24 01 16 
        Transaction.mInitiator.Trading.sv2cl_RequestAccepted_CallStub();        //0062 : 19 19 19 00 98 17 31 11 05 00 04 01 78 F1 30 11 05 00 04 01 C0 43 32 0F 06 00 00 1B 28 0D 00 00 16 
        Transaction.mPartner.Trading.sv2cl_RequestAccepted_CallStub();          //0083 : 19 19 19 00 98 17 31 11 05 00 04 01 F0 F1 30 11 05 00 04 01 C0 43 32 0F 06 00 00 1B 28 0D 00 00 16 
      }
    }
    //0F 00 98 17 31 11 1C 80 1B 30 11 00 10 16 31 11 16 07 A4 00 82 77 00 98 17 31 11 2A 16 18 16 00 
    //72 19 00 98 17 31 11 05 00 04 01 F0 F1 30 11 00 10 16 31 11 16 16 07 A4 00 19 00 98 17 31 11 06 
    //00 04 1B 14 0C 00 00 16 19 00 98 17 31 11 11 00 00 1B 1D 0C 00 00 12 20 00 5F 5C 01 02 00 01 24 
    //01 16 19 19 19 00 98 17 31 11 05 00 04 01 78 F1 30 11 05 00 04 01 C0 43 32 0F 06 00 00 1B 28 0D 
    //00 00 16 19 19 19 00 98 17 31 11 05 00 04 01 F0 F1 30 11 05 00 04 01 C0 43 32 0F 06 00 00 1B 28 
    //0D 00 00 16 04 0B 47 
  }


  function sv_RejectRequest(Game_Pawn aPartner,byte aMessage) {
    local Trade_Transaction Transaction;
    Transaction = GetTransaction(aPartner);                                     //0000 : 0F 00 10 1A 31 11 1C 80 1B 30 11 00 C0 18 31 11 16 
    if (Transaction != None
      && Transaction.mPartner == aPartner) {        //0011 : 07 79 00 82 77 00 10 1A 31 11 2A 16 18 16 00 72 19 00 10 1A 31 11 05 00 04 01 F0 F1 30 11 00 C0 18 31 11 16 16 
      if (Transaction.sv_IsTransactionValid()) {                                //0036 : 07 6E 00 19 00 10 1A 31 11 06 00 04 1B 14 0C 00 00 16 
        Transaction.mInitiator.Trading.sv2cl_TradingMessage_CallStub(aMessage); //0048 : 19 19 19 00 10 1A 31 11 05 00 04 01 78 F1 30 11 05 00 04 01 C0 43 32 0F 0B 00 00 1B F8 0B 00 00 00 88 1A 31 11 16 
      }
      EndTransaction(Transaction);                                              //006E : 1C E0 17 30 11 00 10 1A 31 11 16 
    }
    //0F 00 10 1A 31 11 1C 80 1B 30 11 00 C0 18 31 11 16 07 79 00 82 77 00 10 1A 31 11 2A 16 18 16 00 
    //72 19 00 10 1A 31 11 05 00 04 01 F0 F1 30 11 00 C0 18 31 11 16 16 07 6E 00 19 00 10 1A 31 11 06 
    //00 04 1B 14 0C 00 00 16 19 19 19 00 10 1A 31 11 05 00 04 01 78 F1 30 11 05 00 04 01 C0 43 32 0F 
    //0B 00 00 1B F8 0B 00 00 00 88 1A 31 11 16 1C E0 17 30 11 00 10 1A 31 11 16 04 0B 47 
  }


  function sv_CancelRequest(Game_Pawn aInitiator) {
    local Trade_Transaction Transaction;
    Transaction = GetTransaction(aInitiator);                                   //0000 : 0F 00 08 1D 31 11 1C 80 1B 30 11 00 B0 1B 31 11 16 
    if (Transaction != None
      && Transaction.mInitiator == aInitiator) {    //0011 : 07 7F 00 82 77 00 08 1D 31 11 2A 16 18 16 00 72 19 00 08 1D 31 11 05 00 04 01 78 F1 30 11 00 B0 1B 31 11 16 16 
      if (Transaction.sv_IsTransactionValid()) {                                //0036 : 07 74 00 19 00 08 1D 31 11 06 00 04 1B 14 0C 00 00 16 
        Transaction.mPartner.Trading.sv2cl_TradingMessage_CallStub(Class'Game_Trading'.6);//0048 : 19 19 19 00 08 1D 31 11 05 00 04 01 F0 F1 30 11 05 00 04 01 C0 43 32 0F 11 00 00 1B F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 06 16 
      }
      EndTransaction(Transaction);                                              //0074 : 1C E0 17 30 11 00 08 1D 31 11 16 
    }
    //0F 00 08 1D 31 11 1C 80 1B 30 11 00 B0 1B 31 11 16 07 7F 00 82 77 00 08 1D 31 11 2A 16 18 16 00 
    //72 19 00 08 1D 31 11 05 00 04 01 78 F1 30 11 00 B0 1B 31 11 16 16 07 74 00 19 00 08 1D 31 11 06 
    //00 04 1B 14 0C 00 00 16 19 19 19 00 08 1D 31 11 05 00 04 01 F0 F1 30 11 05 00 04 01 C0 43 32 0F 
    //11 00 00 1B F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 06 16 1C E0 17 30 11 00 08 1D 31 11 16 04 
    //0B 47 
  }


  function sv_RequestTrade(Game_Pawn aInitiator,Game_Pawn aPartner) {
    local Trade_Transaction initiatorTransaction;
    local Trade_Transaction partnerTransaction;
    if (aInitiator == None || aInitiator.Trading == None) {                     //0000 : 07 23 00 84 72 00 30 1E 31 11 2A 16 18 12 00 72 19 00 30 1E 31 11 05 00 04 01 C0 43 32 0F 2A 16 16 
      return;                                                                   //0021 : 04 0B 
    }
    if (aPartner == None || aPartner.Trading == None) {                         //0023 : 07 69 00 84 72 00 18 21 31 11 2A 16 18 12 00 72 19 00 18 21 31 11 05 00 04 01 C0 43 32 0F 2A 16 16 
      aInitiator.Trading.sv2cl_TradingMessage_CallStub(Class'Game_Trading'.3);  //0044 : 19 19 00 30 1E 31 11 05 00 04 01 C0 43 32 0F 11 00 00 1B F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 03 16 
      return;                                                                   //0067 : 04 0B 
    }
    if (aPartner.combatState != None
      && aPartner.combatState.CombatReady()
      || aPartner.CombatStats != None
      && aPartner.CombatStats.InCombat()) {//0069 : 07 F2 00 84 82 77 19 00 18 21 31 11 05 00 04 01 B8 40 18 11 2A 16 18 19 00 19 19 00 18 21 31 11 05 00 04 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 16 18 2F 00 82 77 19 00 18 21 31 11 05 00 04 01 30 41 18 11 2A 16 18 19 00 19 19 00 18 21 31 11 05 00 04 01 30 41 18 11 06 00 04 1B 93 05 00 00 16 16 16 
      aInitiator.Trading.sv2cl_TradingMessage_CallStub(Class'Game_Trading'.1);  //00CD : 19 19 00 30 1E 31 11 05 00 04 01 C0 43 32 0F 11 00 00 1B F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 01 16 
      return;                                                                   //00F0 : 04 0B 
    }
    initiatorTransaction = GetTransaction(aInitiator);                          //00F2 : 0F 00 90 21 31 11 1C 80 1B 30 11 00 30 1E 31 11 16 
    partnerTransaction = GetTransaction(aPartner);                              //0103 : 0F 00 08 22 31 11 1C 80 1B 30 11 00 18 21 31 11 16 
    if (initiatorTransaction != None) {                                         //0114 : 07 45 01 77 00 90 21 31 11 2A 16 
      aInitiator.Trading.sv2cl_TradingMessage_CallStub(Class'Game_Trading'.0);  //011F : 19 19 00 30 1E 31 11 05 00 04 01 C0 43 32 0F 11 00 00 1B F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 00 16 
    } else {                                                                    //0142 : 06 A3 01 
      if (partnerTransaction != None) {                                         //0145 : 07 76 01 77 00 08 22 31 11 2A 16 
        aInitiator.Trading.sv2cl_TradingMessage_CallStub(Class'Game_Trading'.1);//0150 : 19 19 00 30 1E 31 11 05 00 04 01 C0 43 32 0F 11 00 00 1B F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 01 16 
      } else {                                                                  //0173 : 06 A3 01 
        CreateTransaction(aInitiator,aPartner);                                 //0176 : 1C F0 ED 30 11 00 30 1E 31 11 00 18 21 31 11 16 
        aPartner.Trading.sv2cl_RequestTrade_CallStub(aInitiator);               //0186 : 19 19 00 18 21 31 11 05 00 04 01 C0 43 32 0F 0B 00 00 1B 07 0F 00 00 00 30 1E 31 11 16 
      }
    }
    //07 23 00 84 72 00 30 1E 31 11 2A 16 18 12 00 72 19 00 30 1E 31 11 05 00 04 01 C0 43 32 0F 2A 16 
    //16 04 0B 07 69 00 84 72 00 18 21 31 11 2A 16 18 12 00 72 19 00 18 21 31 11 05 00 04 01 C0 43 32 
    //0F 2A 16 16 19 19 00 30 1E 31 11 05 00 04 01 C0 43 32 0F 11 00 00 1B F8 0B 00 00 12 20 B0 78 5F 
    //01 02 00 01 24 03 16 04 0B 07 F2 00 84 82 77 19 00 18 21 31 11 05 00 04 01 B8 40 18 11 2A 16 18 
    //19 00 19 19 00 18 21 31 11 05 00 04 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 16 18 2F 00 82 77 
    //19 00 18 21 31 11 05 00 04 01 30 41 18 11 2A 16 18 19 00 19 19 00 18 21 31 11 05 00 04 01 30 41 
    //18 11 06 00 04 1B 93 05 00 00 16 16 16 19 19 00 30 1E 31 11 05 00 04 01 C0 43 32 0F 11 00 00 1B 
    //F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 01 16 04 0B 0F 00 90 21 31 11 1C 80 1B 30 11 00 30 1E 
    //31 11 16 0F 00 08 22 31 11 1C 80 1B 30 11 00 18 21 31 11 16 07 45 01 77 00 90 21 31 11 2A 16 19 
    //19 00 30 1E 31 11 05 00 04 01 C0 43 32 0F 11 00 00 1B F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 
    //00 16 06 A3 01 07 76 01 77 00 08 22 31 11 2A 16 19 19 00 30 1E 31 11 05 00 04 01 C0 43 32 0F 11 
    //00 00 1B F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 01 16 06 A3 01 1C F0 ED 30 11 00 30 1E 31 11 
    //00 18 21 31 11 16 19 19 00 18 21 31 11 05 00 04 01 C0 43 32 0F 0B 00 00 1B 07 0F 00 00 00 30 1E 
    //31 11 16 04 0B 47 
  }


  function sv_HandleDeath(Game_Pawn aTrader) {
    local Game_Pawn otherTrader;
    local Trade_Transaction Transaction;
    if (aTrader != None) {                                                      //0000 : 07 D8 00 77 00 30 23 31 11 2A 16 
      Transaction = GetTransaction(aTrader);                                    //000B : 0F 00 00 25 31 11 1C 80 1B 30 11 00 30 23 31 11 16 
      if (Transaction != None) {                                                //001C : 07 D8 00 77 00 00 25 31 11 2A 16 
        if (Transaction.sv_GetState() != Class'Trade_Transaction'.3
          && Transaction.sv_GetState() != Class'Trade_Transaction'.4) {//0027 : 07 D8 00 82 9B 39 3A 19 00 00 25 31 11 06 00 01 1B 4F 0C 00 00 16 39 3A 12 20 00 5F 5C 01 02 00 01 24 03 16 18 21 00 9B 39 3A 19 00 00 25 31 11 06 00 01 1B 4F 0C 00 00 16 39 3A 12 20 00 5F 5C 01 02 00 01 24 04 16 16 
          otherTrader = Transaction.sv_GetOtherTrader(aTrader);                 //006F : 0F 00 78 25 31 11 19 00 00 25 31 11 0B 00 04 1B 2A 0C 00 00 00 30 23 31 11 16 
          if (otherTrader != None && !otherTrader.IsDead()) {                   //0089 : 07 CD 00 82 77 00 78 25 31 11 2A 16 18 12 00 81 19 00 78 25 31 11 06 00 04 1C D8 52 34 0F 16 16 16 
            otherTrader.Trading.sv2cl_TradingMessage_CallStub(Class'Game_Trading'.5);//00AA : 19 19 00 78 25 31 11 05 00 04 01 C0 43 32 0F 11 00 00 1B F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 05 16 
          }
          EndTransaction(Transaction);                                          //00CD : 1C E0 17 30 11 00 00 25 31 11 16 
        }
      }
    }
    //07 D8 00 77 00 30 23 31 11 2A 16 0F 00 00 25 31 11 1C 80 1B 30 11 00 30 23 31 11 16 07 D8 00 77 
    //00 00 25 31 11 2A 16 07 D8 00 82 9B 39 3A 19 00 00 25 31 11 06 00 01 1B 4F 0C 00 00 16 39 3A 12 
    //20 00 5F 5C 01 02 00 01 24 03 16 18 21 00 9B 39 3A 19 00 00 25 31 11 06 00 01 1B 4F 0C 00 00 16 
    //39 3A 12 20 00 5F 5C 01 02 00 01 24 04 16 16 0F 00 78 25 31 11 19 00 00 25 31 11 0B 00 04 1B 2A 
    //0C 00 00 00 30 23 31 11 16 07 CD 00 82 77 00 78 25 31 11 2A 16 18 12 00 81 19 00 78 25 31 11 06 
    //00 04 1C D8 52 34 0F 16 16 16 19 19 00 78 25 31 11 05 00 04 01 C0 43 32 0F 11 00 00 1B F8 0B 00 
    //00 12 20 B0 78 5F 01 02 00 01 24 05 16 1C E0 17 30 11 00 00 25 31 11 16 04 0B 47 
  }


  function sv_OnLogout(Game_PlayerPawn aPawn) {
    local Game_Pawn otherTrader;
    local Trade_Transaction Transaction;
    Transaction = GetTransaction(aPawn);                                        //0000 : 0F 00 88 27 31 11 1C 80 1B 30 11 00 F0 25 31 11 16 
    if (Transaction != None) {                                                  //0011 : 07 B2 00 77 00 88 27 31 11 2A 16 
      if (Transaction.sv_IsTransactionValid()
        && Transaction.sv_GetState() != Class'Trade_Transaction'.3) {//001C : 07 9E 00 82 19 00 88 27 31 11 06 00 04 1B 14 0C 00 00 16 18 21 00 9B 39 3A 19 00 88 27 31 11 06 00 01 1B 4F 0C 00 00 16 39 3A 12 20 00 5F 5C 01 02 00 01 24 03 16 16 
        otherTrader = Transaction.sv_GetOtherTrader(aPawn);                     //0053 : 0F 00 00 28 31 11 19 00 88 27 31 11 0B 00 04 1B 2A 0C 00 00 00 F0 25 31 11 16 
        otherTrader.Trading.sv2cl_TradingMessage_CallStub(Class'Game_Trading'.4);//006D : 19 19 00 00 28 31 11 05 00 04 01 C0 43 32 0F 11 00 00 1B F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 04 16 
        EndTransaction(Transaction);                                            //0090 : 1C E0 17 30 11 00 88 27 31 11 16 
      } else {                                                                  //009B : 06 B2 00 
        Transaction.sv_TraderDisconnected(aPawn);                               //009E : 19 00 88 27 31 11 0B 00 00 1B 09 0E 00 00 00 F0 25 31 11 16 
      }
    }
    //0F 00 88 27 31 11 1C 80 1B 30 11 00 F0 25 31 11 16 07 B2 00 77 00 88 27 31 11 2A 16 07 9E 00 82 
    //19 00 88 27 31 11 06 00 04 1B 14 0C 00 00 16 18 21 00 9B 39 3A 19 00 88 27 31 11 06 00 01 1B 4F 
    //0C 00 00 16 39 3A 12 20 00 5F 5C 01 02 00 01 24 03 16 16 0F 00 00 28 31 11 19 00 88 27 31 11 0B 
    //00 04 1B 2A 0C 00 00 00 F0 25 31 11 16 19 19 00 00 28 31 11 05 00 04 01 C0 43 32 0F 11 00 00 1B 
    //F8 0B 00 00 12 20 B0 78 5F 01 02 00 01 24 04 16 1C E0 17 30 11 00 88 27 31 11 16 06 B2 00 19 00 
    //88 27 31 11 0B 00 00 1B 09 0E 00 00 00 F0 25 31 11 16 04 0B 47 
  }



