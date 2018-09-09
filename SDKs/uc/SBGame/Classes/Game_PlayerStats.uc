//==============================================================================
//  Game_PlayerStats
//==============================================================================

class Game_PlayerStats extends Game_CharacterStats within Game_Pawn
    native
    dependsOn(StringReferences,SBDBAsync,Game_BodySlots,Game_PlayerController,Player,Game_Desktop,Game_PlayerConversation,Game_Controller,DB_CharacterSheet)
    Config(charstats)
  ;

  var const globalconfig float FreeToPlayMaxFamePoints;
  var bool mFreeToPlayLimitReached;
  var int mFamePoints;
  var int mPePPoints;
  var const bool mMayChooseClass;
  var const byte mAvailableAttributePoints;


  function LocalizedString GetPePRankDescription() {
    local LocalizedString emptyLS;
    switch (mRecord.PePRank) {                                                  //0000 : 05 04 36 78 96 1F 11 01 78 2D 34 0F 
      case 1 :                                                                  //000C : 0A 1F 00 26 
        return Class'StringReferences'.default.PePRank1Description;             //0010 : 04 12 20 20 F7 60 01 05 00 0C 02 E0 07 1C 11 
      case 2 :                                                                  //001F : 0A 33 00 2C 02 
        return Class'StringReferences'.default.PePRank2Description;             //0024 : 04 12 20 20 F7 60 01 05 00 0C 02 58 08 1C 11 
      case 3 :                                                                  //0033 : 0A 47 00 2C 03 
        return Class'StringReferences'.default.PePRank3Description;             //0038 : 04 12 20 20 F7 60 01 05 00 0C 02 D0 08 1C 11 
      case 4 :                                                                  //0047 : 0A 5B 00 2C 04 
        return Class'StringReferences'.default.PePRank4Description;             //004C : 04 12 20 20 F7 60 01 05 00 0C 02 48 09 1C 11 
      case 5 :                                                                  //005B : 0A 6F 00 2C 05 
        return Class'StringReferences'.default.PePRank5Description;             //0060 : 04 12 20 20 F7 60 01 05 00 0C 02 C0 09 1C 11 
      default:                                                                  //006F : 0A FF FF 
        return emptyLS;                                                         //0072 : 04 00 E0 C6 24 11 
      }
    }
    //05 04 36 78 96 1F 11 01 78 2D 34 0F 0A 1F 00 26 04 12 20 20 F7 60 01 05 00 0C 02 E0 07 1C 11 0A 
    //33 00 2C 02 04 12 20 20 F7 60 01 05 00 0C 02 58 08 1C 11 0A 47 00 2C 03 04 12 20 20 F7 60 01 05 
    //00 0C 02 D0 08 1C 11 0A 5B 00 2C 04 04 12 20 20 F7 60 01 05 00 0C 02 48 09 1C 11 0A 6F 00 2C 05 
    //04 12 20 20 F7 60 01 05 00 0C 02 C0 09 1C 11 0A FF FF 04 00 E0 C6 24 11 04 0B 47 
  }


  protected native function sv2cl_UpdateFocusAndSoulAffinity_CallStub();


  protected native event sv2cl_UpdateFocusAndSoulAffinity(int aFocus,float aSoulAffinity);


  protected native function sv2cl_UpdateMindAndSpiritAffinity_CallStub();


  protected native event sv2cl_UpdateMindAndSpiritAffinity(int aMind,float aSpiritAffinity);


  protected native function sv2cl_UpdateBodyAndRuneAffinity_CallStub();


  protected native event sv2cl_UpdateBodyAndRuneAffinity(int aBody,float aRuneAffinity);


  protected native function sv2cl_UpdateUpgradeInfo_CallStub();


  protected native event sv2cl_UpdateUpgradeInfo(bool aMayChooseClass,byte aAvailableAttributePoints);


  protected native function sv2cl_UpdatePePPoints_CallStub();


  protected native event sv2cl_UpdatePePPoints(float aPePPoints);


  protected native function sv2cl_UpdateFamePoints_CallStub();


  protected native event sv2cl_UpdateFamePoints(float aFamePoints);


  protected native function sv2cl_SetClass_CallStub();


  protected event sv2cl_SetClass(byte aClass) {
    SetCharacterClass(aClass);                                                  //0000 : 1B AE 0C 00 00 00 C0 D6 24 11 16 
    //1B AE 0C 00 00 00 C0 D6 24 11 16 04 0B 47 
  }


  function sv_SetClass(byte aClass) {
    SetCharacterClass(aClass);                                                  //0000 : 1B AE 0C 00 00 00 28 D8 24 11 16 
    sv_UpdateStats();                                                           //000B : 1B 38 0E 00 00 16 
    sv2cl_SetClass_CallStub(aClass);                                            //0011 : 1B 3E 0E 00 00 00 28 D8 24 11 16 
    Class'SBDBAsync'.SetCharacterClass(Outer,Outer.GetCharacterID(),aClass - 1);//001C : 12 20 70 87 24 01 24 00 00 1B AE 0C 00 00 01 00 E4 6B 0F 19 01 00 E4 6B 0F 06 00 04 1C 38 DD 18 11 16 93 39 3A 00 28 D8 24 11 26 16 16 
    if (Outer.BodySlots != None) {                                              //0049 : 07 8D 00 77 19 01 00 E4 6B 0F 05 00 04 01 90 42 34 0F 2A 16 
      Outer.BodySlots.sv_SetMode(Outer.BodySlots.GetBodySlotModeByClass());     //005D : 19 19 01 00 E4 6B 0F 05 00 04 01 90 42 34 0F 1E 00 00 1C 80 43 34 0F 19 19 01 00 E4 6B 0F 05 00 04 01 90 42 34 0F 06 00 01 1C A0 D9 24 11 16 16 
    }
    SetClassToUniverse(aClass);                                                 //008D : 1B 3C 0E 00 00 00 28 D8 24 11 16 
    //1B AE 0C 00 00 00 28 D8 24 11 16 1B 38 0E 00 00 16 1B 3E 0E 00 00 00 28 D8 24 11 16 12 20 70 87 
    //24 01 24 00 00 1B AE 0C 00 00 01 00 E4 6B 0F 19 01 00 E4 6B 0F 06 00 04 1C 38 DD 18 11 16 93 39 
    //3A 00 28 D8 24 11 26 16 16 07 8D 00 77 19 01 00 E4 6B 0F 05 00 04 01 90 42 34 0F 2A 16 19 19 01 
    //00 E4 6B 0F 05 00 04 01 90 42 34 0F 1E 00 00 1C 80 43 34 0F 19 19 01 00 E4 6B 0F 05 00 04 01 90 
    //42 34 0F 06 00 01 1C A0 D9 24 11 16 16 1B 3C 0E 00 00 00 28 D8 24 11 16 04 0B 47 
  }


  protected native function cl2sv_SetClass_CallStub();


  event cl2sv_SetClass(byte aClass) {
    sv_SetClass(aClass);                                                        //0000 : 1B BD 0C 00 00 00 B0 DB 24 11 16 
    //1B BD 0C 00 00 00 B0 DB 24 11 16 04 0B 47 
  }


  native function SetClassToUniverse(byte aClass);


  native function int GetMaximumPePRank();


  native function int GetMinimumPePRank();


  native function int GetMaximumFameLevel();


  native function int GetMinimumFameLevel();


  native event int GetNextPePRankPoints(int rank);


  protected native function sv2clrel_OnUpdatePePRank_CallStub();


  event sv2clrel_OnUpdatePePRank(int aNewPePRank) {
    if (aNewPePRank > mRecord.PePRank) {                                        //0000 : 07 70 00 97 00 60 E6 24 11 36 78 96 1F 11 01 78 2D 34 0F 16 
      Outer.cl_PlayPawnEffect(1);                                               //0014 : 19 01 00 E4 6B 0F 08 00 00 1B 16 0C 00 00 24 01 16 
      if (Outer.IsLocalPlayer()) {                                              //0025 : 07 70 00 19 01 00 E4 6B 0F 06 00 04 1C 18 1A 76 0F 16 
        Game_Desktop(Game_PlayerController(Outer.Controller).Player.GUIDesktop).OnRankUp(aNewPePRank);//0037 : 19 2E 60 CE 5A 01 19 19 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0B 00 00 1B E1 05 00 00 00 60 E6 24 11 16 
      }
    }
    mRecord.PePRank = aNewPePRank;                                              //0070 : 0F 36 78 96 1F 11 01 78 2D 34 0F 00 60 E6 24 11 
    //07 70 00 97 00 60 E6 24 11 36 78 96 1F 11 01 78 2D 34 0F 16 19 01 00 E4 6B 0F 08 00 00 1B 16 0C 
    //00 00 24 01 16 07 70 00 19 01 00 E4 6B 0F 06 00 04 1C 18 1A 76 0F 16 19 2E 60 CE 5A 01 19 19 2E 
    //90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 
    //79 0F 0B 00 00 1B E1 05 00 00 00 60 E6 24 11 16 0F 36 78 96 1F 11 01 78 2D 34 0F 00 60 E6 24 11 
    //04 0B 47 
  }


  protected native function sv2clrel_OnLevelUp_CallStub();


  event sv2clrel_OnLevelUp(int aNewLevel) {
    local Game_PlayerController Controller;
    local bool levelUp;
    levelUp = aNewLevel > mRecord.FameLevel;                                    //0000 : 14 2D 00 B8 EA 24 11 97 00 18 E9 24 11 36 00 2D 34 0F 01 78 2D 34 0F 16 
    mRecord.FameLevel = aNewLevel;                                              //0018 : 0F 36 00 2D 34 0F 01 78 2D 34 0F 00 18 E9 24 11 
    if (levelUp) {                                                              //0028 : 07 B5 00 2D 00 B8 EA 24 11 
      Outer.cl_PlayPawnEffect(0);                                               //0031 : 19 01 00 E4 6B 0F 08 00 00 1B 16 0C 00 00 24 00 16 
      if (Outer.IsLocalPlayer()) {                                              //0042 : 07 B5 00 19 01 00 E4 6B 0F 06 00 04 1C 18 1A 76 0F 16 
        Controller = Game_PlayerController(Outer.Controller);                   //0054 : 0F 00 30 EB 24 11 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 
        Game_Desktop(Controller.Player.GUIDesktop).OnLevelUp(aNewLevel);        //006D : 19 2E 60 CE 5A 01 19 19 00 30 EB 24 11 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0B 00 00 1B D5 05 00 00 00 18 E9 24 11 16 
        Game_PlayerConversation(Controller.ConversationControl).cl_RefreshTopics();//0098 : 19 2E 20 80 60 01 19 00 30 EB 24 11 05 00 04 01 C8 07 1B 11 06 00 00 1C 18 38 7F 0F 16 
      }
    }
    //14 2D 00 B8 EA 24 11 97 00 18 E9 24 11 36 00 2D 34 0F 01 78 2D 34 0F 16 0F 36 00 2D 34 0F 01 78 
    //2D 34 0F 00 18 E9 24 11 07 B5 00 2D 00 B8 EA 24 11 19 01 00 E4 6B 0F 08 00 00 1B 16 0C 00 00 24 
    //00 16 07 B5 00 19 01 00 E4 6B 0F 06 00 04 1C 18 1A 76 0F 16 0F 00 30 EB 24 11 2E 90 18 5B 01 19 
    //01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 19 2E 60 CE 5A 01 19 19 00 30 EB 24 11 05 00 04 01 28 25 
    //71 0F 05 00 04 01 90 C0 79 0F 0B 00 00 1B D5 05 00 00 00 18 E9 24 11 16 19 2E 20 80 60 01 19 00 
    //30 EB 24 11 05 00 04 01 C8 07 1B 11 06 00 00 1C 18 38 7F 0F 16 04 0B 47 
  }


  native function DecreasePePRank();


  native function IncreasePePPoints(int aDelta);


  native function IncreaseFamePoints(int aDelta);


  native function cl_ClearMayChooseClass();


  native function cl_ClearAvailableAttributePoints();


  native function sv_UpdateStats();


  function cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C 88 85 1F 11 16 
    if (Outer.IsLocalPlayer()) {                                                //0006 : 07 48 00 19 01 00 E4 6B 0F 06 00 04 1C 18 1A 76 0F 16 
      SetCharacterClass(Game_Controller(Outer.Controller).DBCharacterSheet.ClassId + 1);//0018 : 1B AE 0C 00 00 39 3D 92 19 19 2E 10 0E 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 30 18 1B 11 05 00 04 01 60 F2 24 11 26 16 16 
    }
    //1C 88 85 1F 11 16 07 48 00 19 01 00 E4 6B 0F 06 00 04 1C 18 1A 76 0F 16 1B AE 0C 00 00 39 3D 92 
    //19 19 2E 10 0E 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 30 18 1B 11 05 00 04 
    //01 60 F2 24 11 26 16 16 04 0B 47 
  }



