//==============================================================================
//  Character_GameInfo
//==============================================================================

class Character_GameInfo extends Game_GameInfo
    native
    dependsOn(GUI_BaseDesktop,Item_Type)
    Config(charstats)
  ;

  const MAX_CHARACTERS_PER_UNIVERSE =  7;
  enum ECharacterCreationState {
    CCS_SELECT_CHARACTER ,
    CCS_CREATE_CHARACTER ,
    CCS_ENTER_WORLD ,
    CCS_PREPARE_UNIVERSE_ENTRY 
  };

  var byte mState;
  var const globalconfig int mMaxHealthDefaults[12];
  var const globalconfig float FreeToPlayMaxFamePoints;
  var (null);
  var (null);
  var (null);
  var private transient int mServerCharacters;
  var private transient int mClientCharacters;


  final native function Character_Pawn cl_GetFirstCharacter();


  final native function int cl_GetCharacterCount();


  final native function cl_SelectCharacter(int aCharacterId);


  final native function cl_DeleteCharacter(int aCharacterId,string aPassword);


  final native function cl_CreateCharacter(array<byte> aLOD0,array<byte> aLOD1,array<byte> aLOD2,array<byte> aLOD3,string aName,int aArchetype,int aSkillID1,int aSkillID2,int aSkillID3,int aSkillID4,int aSkillID5,int aRangedWeaponID);


  final function cl_GotoCharacterCreation() {
    cl_SetState(1);                                                             //0000 : 1C E0 3F 37 19 24 01 16 
    //1C E0 3F 37 19 24 01 16 04 0B 47 
  }


  final function cl_GotoCharacterSelection() {
    cl_SetState(0);                                                             //0000 : 1C E0 3F 37 19 24 00 16 
    //1C E0 3F 37 19 24 00 16 04 0B 47 
  }


  private final event cl_SetState(byte aNewState) {
    local Game_Desktop desktop;
    mState = aNewState;                                                         //0000 : 0F 01 78 43 37 19 00 78 41 37 19 
    desktop = cl_GetDesktop();                                                  //000B : 0F 00 F0 43 37 19 1C E8 95 28 11 16 
    desktop.HideAllWindows();                                                   //0017 : 19 00 F0 43 37 19 06 00 00 1B 49 0F 00 00 16 
    switch (mState) {                                                           //0026 : 05 01 01 78 43 37 19 
      case 1 :                                                                  //002D : 0A 77 00 24 01 
        desktop.ShowStdWindow(Class'GUI_BaseDesktop'.25,Class'GUI_BaseDesktop'.1);//0032 : 19 00 F0 43 37 19 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 19 12 20 00 68 D7 00 01 00 04 26 16 
        desktop.UpdateStdWindow(Class'GUI_BaseDesktop'.25,0,None,"");           //0056 : 19 00 F0 43 37 19 15 00 00 1B 02 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 19 25 2A 1F 00 16 
        break;                                                                  //0074 : 06 FA 00 
      case 0 :                                                                  //0077 : 0A E7 00 24 00 
        desktop.ShowStdWindow(Class'GUI_BaseDesktop'.22,Class'GUI_BaseDesktop'.1);//007C : 19 00 F0 43 37 19 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 16 12 20 00 68 D7 00 01 00 04 26 16 
        desktop.ShowStdWindow(Class'GUI_BaseDesktop'.25,Class'GUI_BaseDesktop'.2);//00A0 : 19 00 F0 43 37 19 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 19 12 20 00 68 D7 00 02 00 04 2C 02 16 
        desktop.UpdateStdWindow(Class'GUI_BaseDesktop'.22,0,None,"",0);         //00C5 : 19 00 F0 43 37 19 16 00 00 1B 02 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 16 25 2A 1F 00 25 16 
        break;                                                                  //00E4 : 06 FA 00 
      case 2 :                                                                  //00E7 : 0A EF 00 24 02 
        break;                                                                  //00EC : 06 FA 00 
      case 3 :                                                                  //00EF : 0A F7 00 24 03 
        break;                                                                  //00F4 : 06 FA 00 
      default:                                                                  //00F7 : 0A FF FF 
    }
    //0F 01 78 43 37 19 00 78 41 37 19 0F 00 F0 43 37 19 1C E8 95 28 11 16 19 00 F0 43 37 19 06 00 00 
    //1B 49 0F 00 00 16 05 01 01 78 43 37 19 0A 77 00 24 01 19 00 F0 43 37 19 1B 00 04 1B DF 0B 00 00 
    //12 20 00 68 D7 00 02 00 04 2C 19 12 20 00 68 D7 00 01 00 04 26 16 19 00 F0 43 37 19 15 00 00 1B 
    //02 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 19 25 2A 1F 00 16 06 FA 00 0A E7 00 24 00 19 00 F0 43 
    //37 19 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 16 12 20 00 68 D7 00 01 00 04 26 16 
    //19 00 F0 43 37 19 1C 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 19 12 20 00 68 D7 00 02 
    //00 04 2C 02 16 19 00 F0 43 37 19 16 00 00 1B 02 0C 00 00 12 20 00 68 D7 00 02 00 04 2C 16 25 2A 
    //1F 00 25 16 06 FA 00 0A EF 00 24 02 06 FA 00 0A F7 00 24 03 06 FA 00 0A FF FF 04 0B 47 
  }


  private final function PreloadItems() {
    Class'Item_Type'.LoadAllItems();                                            //0000 : 12 20 70 EB 5B 01 06 00 00 1B BB 0E 00 00 16 
    //12 20 70 EB 5B 01 06 00 00 1B BB 0E 00 00 16 04 0B 47 
  }


  private final native function sv_CleanUpServerCharacters(int aAccountID);


  event cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C 30 00 75 0F 16 
    PreloadItems();                                                             //0006 : 1C C8 40 37 19 16 
    //1C 30 00 75 0F 16 1C C8 40 37 19 16 04 0B 47 
  }


  event sv_OnLogout(int aAccountID,Base_Pawn aPawn) {
    sv_CleanUpServerCharacters(aAccountID);                                     //0000 : 1C B8 44 37 19 00 A8 48 37 19 16 
    Super.sv_OnLogout(aAccountID,aPawn);                                        //000B : 1C 48 AA 28 11 00 A8 48 37 19 00 20 49 37 19 16 
    //1C B8 44 37 19 00 A8 48 37 19 16 1C 48 AA 28 11 00 A8 48 37 19 00 20 49 37 19 16 04 0B 47 
  }


  event sv_OnInit() {
    Super.sv_OnInit();                                                          //0000 : 1C 48 B5 28 11 16 
    PreloadItems();                                                             //0006 : 1C C8 40 37 19 16 
    //1C 48 B5 28 11 16 1C C8 40 37 19 16 04 0B 47 
  }


  delegate HandleCharacterSelectionResult(bool aSuccess,string Message);


  delegate HandleCharacterDeletionResult(bool aSuccess,string Message);


  delegate HandleCharacterCreationResult(bool aSuccess,string Message);



