//==============================================================================
//  Game_PlayerCharacter
//==============================================================================

class Game_PlayerCharacter extends Game_Character within Game_Pawn
    native
    exportstructs
    dependsOn(Game_Controller,Game_PlayerConversation,SBDBAsync,EventNotification)
  ;

  var private string mName;
  var private int mMoney;
  var private string mGuildName;
  var EventNotification mMoneyChanged;


  protected event cl_SetFaction(int aFactionId) {
    Super.cl_SetFaction(aFactionId);                                            //0000 : 1C 50 31 34 0F 00 C0 65 34 11 16 
    if (Outer.IsLocalPlayer()) {                                                //000B : 07 48 00 19 01 00 E4 6B 0F 06 00 04 1C 18 1A 76 0F 16 
      Game_PlayerConversation(Game_Controller(Outer.Controller).ConversationControl).cl_RefreshTopics();//001D : 19 2E 20 80 60 01 19 2E 10 0E 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 06 00 00 1C 18 38 7F 0F 16 
    }
    //1C 50 31 34 0F 00 C0 65 34 11 16 07 48 00 19 01 00 E4 6B 0F 06 00 04 1C 18 1A 76 0F 16 19 2E 20 
    //80 60 01 19 2E 10 0E 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 06 
    //00 00 1C 18 38 7F 0F 16 04 0B 47 
  }


  function string cl_GetBaseFullName() {
    return mName;                                                               //0000 : 04 01 98 67 34 11 
    //04 01 98 67 34 11 04 0B 47 
  }


  event string cl_GetBaseName() {
    return mName;                                                               //0000 : 04 01 98 67 34 11 
    //04 01 98 67 34 11 04 0B 47 
  }


  function string GetGuildName() {
    return mGuildName;                                                          //0000 : 04 01 D0 6A 34 11 
    //04 01 D0 6A 34 11 04 0B 47 
  }


  protected native function sv2clrel_UpdateGuildName_CallStub();


  event sv2clrel_UpdateGuildName(string aGuildName) {
    mGuildName = aGuildName;                                                    //0000 : 0F 01 D0 6A 34 11 00 A8 6C 34 11 
    //0F 01 D0 6A 34 11 00 A8 6C 34 11 04 0B 47 
  }


  event sv_SetGuildName(string aGuildName) {
    mGuildName = aGuildName;                                                    //0000 : 0F 01 D0 6A 34 11 00 D0 6D 34 11 
    sv2clrel_UpdateGuildName_CallStub(mGuildName);                              //000B : 1B 01 0E 00 00 01 D0 6A 34 11 16 
    //0F 01 D0 6A 34 11 00 D0 6D 34 11 1B 01 0E 00 00 01 D0 6A 34 11 16 04 0B 47 
  }


  event sv_SetFaction(export editinline NPC_Taxonomy aFaction) {
    Super.sv_SetFaction(aFaction);                                              //0000 : 1C 48 99 25 11 00 48 6F 34 11 16 
    if (mFaction != None) {                                                     //000B : 07 60 00 77 01 28 33 34 0F 2A 16 
      sv2clrel_SetFaction_CallStub(mFaction.GetResourceId());                   //0016 : 1B D7 0C 00 00 19 01 28 33 34 0F 06 00 04 1C 08 90 20 11 16 16 
      Class'SBDBAsync'.SetCharacterFaction(Outer,Outer.GetCharacterID(),mFaction.GetResourceId());//002B : 12 20 70 87 24 01 29 00 00 1B D2 0D 00 00 01 00 E4 6B 0F 19 01 00 E4 6B 0F 06 00 04 1C 38 DD 18 11 16 19 01 28 33 34 0F 06 00 04 1C 08 90 20 11 16 16 
    } else {                                                                    //005D : 06 8B 00 
      sv2clrel_SetFaction_CallStub(0);                                          //0060 : 1B D7 0C 00 00 25 16 
      Class'SBDBAsync'.SetCharacterFaction(Outer,Outer.GetCharacterID(),0);     //0067 : 12 20 70 87 24 01 1B 00 00 1B D2 0D 00 00 01 00 E4 6B 0F 19 01 00 E4 6B 0F 06 00 04 1C 38 DD 18 11 16 25 16 
    }
    //1C 48 99 25 11 00 48 6F 34 11 16 07 60 00 77 01 28 33 34 0F 2A 16 1B D7 0C 00 00 19 01 28 33 34 
    //0F 06 00 04 1C 08 90 20 11 16 16 12 20 70 87 24 01 29 00 00 1B D2 0D 00 00 01 00 E4 6B 0F 19 01 
    //00 E4 6B 0F 06 00 04 1C 38 DD 18 11 16 19 01 28 33 34 0F 06 00 04 1C 08 90 20 11 16 16 06 8B 00 
    //1B D7 0C 00 00 25 16 12 20 70 87 24 01 1B 00 00 1B D2 0D 00 00 01 00 E4 6B 0F 19 01 00 E4 6B 0F 
    //06 00 04 1C 38 DD 18 11 16 25 16 04 0B 47 
  }


  protected native function sv2cl_UpdateMoney_CallStub();


  protected event sv2cl_UpdateMoney(int aMoney) {
    mMoney = aMoney;                                                            //0000 : 0F 01 A8 A2 34 11 00 C0 6F 34 11 
    mMoneyChanged.Trigger();                                                    //000B : 19 01 20 A3 34 11 06 00 00 1C 00 96 84 0F 16 
    //0F 01 A8 A2 34 11 00 C0 6F 34 11 19 01 20 A3 34 11 06 00 00 1C 00 96 84 0F 16 04 0B 47 
  }


  event sv_SetMoney(int aMoney) {
    mMoney = aMoney;                                                            //0000 : 0F 01 A8 A2 34 11 00 48 A4 34 11 
    sv2cl_UpdateMoney_CallStub(mMoney);                                         //000B : 1B 62 0D 00 00 01 A8 A2 34 11 16 
    //0F 01 A8 A2 34 11 00 48 A4 34 11 1B 62 0D 00 00 01 A8 A2 34 11 16 04 0B 47 
  }


  event sv_ChangeMoney(int aDelta) {
    mMoney += aDelta;                                                           //0000 : A1 01 A8 A2 34 11 00 C0 A5 34 11 16 
    sv2cl_UpdateMoney_CallStub(mMoney);                                         //000C : 1B 62 0D 00 00 01 A8 A2 34 11 16 
    //A1 01 A8 A2 34 11 00 C0 A5 34 11 16 1B 62 0D 00 00 01 A8 A2 34 11 16 04 0B 47 
  }


  function cl_OnShutdown() {
    Super.cl_OnShutdown();                                                      //0000 : 1C 00 C4 19 11 16 
    mMoneyChanged.Delete();                                                     //0006 : 19 01 20 A3 34 11 06 00 00 1B 7B 0C 00 00 16 
    //1C 00 C4 19 11 16 19 01 20 A3 34 11 06 00 00 1B 7B 0C 00 00 16 04 0B 47 
  }


  function cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C C0 A1 25 11 16 
    Init();                                                                     //0006 : 1C 88 A7 34 11 16 
    mMoneyChanged = new Class'EventNotification';                               //000C : 0F 01 20 A3 34 11 11 0B 0B 0B 20 70 52 5B 01 
    //1C C0 A1 25 11 16 1C 88 A7 34 11 16 0F 01 20 A3 34 11 11 0B 0B 0B 20 70 52 5B 01 04 0B 47 
  }


  private final native function Init();



