//==============================================================================
//  Game_GameMasterController
//==============================================================================

class Game_GameMasterController extends Game_PlayerController
    native
    dependsOn(Player,Console)
    Config(User)
  ;

  var int mAuthorityLevel;
  var export editinline Game_PropertyEditor PropertyEditor;
  var export editinline Editor_SpwnieControl SpwnieControl;
  var private globalconfig bool mIsVisibleInRelevance;
  var private globalconfig int mSpeedBoosts;
  var private globalconfig bool mShield;


  function int GetAuthorityLevel() {
    return mAuthorityLevel;                                                     //0000 : 04 01 A8 65 2E 11 
    //04 01 A8 65 2E 11 04 0B 47 
  }


  function SetAuthorityLevel(int aLevel) {
    mAuthorityLevel = aLevel;                                                   //0000 : 0F 01 A8 65 2E 11 00 D0 66 2E 11 
    //0F 01 A8 65 2E 11 00 D0 66 2E 11 04 0B 47 
  }


  event cl_OnInit() {
    local int Index;
    local int helpSpeed;
    Super.cl_OnInit();                                                          //0000 : 1C C0 9E 1B 11 16 
    Player.Console.MakeCSConsole();                                             //0006 : 19 19 01 28 25 71 0F 05 00 04 01 10 76 6D 0F 06 00 00 1B AE 12 00 00 16 
    if (mIsVisibleInRelevance) {                                                //001E : 07 38 00 2D 01 E8 69 2E 11 
    } else {                                                                    //0035 : 06 48 00 
    }
    helpSpeed = mSpeedBoosts;                                                   //0048 : 0F 00 60 6A 2E 11 01 D8 6A 2E 11 
    mSpeedBoosts = 0;                                                           //0053 : 0F 01 D8 6A 2E 11 25 
    Index = 0;                                                                  //005A : 0F 00 38 68 2E 11 25 
    while (Index < helpSpeed) {                                                 //0061 : 07 8D 00 96 00 38 68 2E 11 00 60 6A 2E 11 16 
      Index++;                                                                  //0083 : A5 00 38 68 2E 11 16 
    }
    if (mShield) {                                                              //008D : 07 AD 00 2D 01 50 6B 2E 11 
    } else {                                                                    //00AA : 06 C2 00 
    }
    //1C C0 9E 1B 11 16 19 19 01 28 25 71 0F 05 00 04 01 10 76 6D 0F 06 00 00 1B AE 12 00 00 16 07 38 
    //00 2D 01 E8 69 2E 11 0E 1B 65 0C 00 00 1F 43 53 56 69 73 00 16 06 48 00 0E 1B 65 0C 00 00 1F 43 
    //53 49 6E 76 69 73 00 16 0F 00 60 6A 2E 11 01 D8 6A 2E 11 0F 01 D8 6A 2E 11 25 0F 00 38 68 2E 11 
    //25 07 8D 00 96 00 38 68 2E 11 00 60 6A 2E 11 16 0E 1B 65 0C 00 00 1F 43 53 53 70 65 65 64 20 4F 
    //4E 00 16 A5 00 38 68 2E 11 16 06 61 00 07 AD 00 2D 01 50 6B 2E 11 0E 1B 65 0C 00 00 1F 43 53 53 
    //68 69 65 6C 64 20 4F 4E 00 16 06 C2 00 0E 1B 65 0C 00 00 1F 43 53 53 68 69 65 6C 64 20 4F 46 46 
    //00 16 04 0B 47 
  }


  protected native function sv2cl_SetShield_CallStub();


  event sv2cl_SetShield(bool aValue) {
    mShield = aValue;                                                           //0000 : 14 2D 01 50 6B 2E 11 2D 00 28 6D 2E 11 
    SaveConfig();                                                               //000D : 62 18 16 
    //14 2D 01 50 6B 2E 11 2D 00 28 6D 2E 11 62 18 16 04 0B 47 
  }


  protected native function sv2cl_ResetSpeedBoost_CallStub();


  event sv2cl_ResetSpeedBoost() {
    mSpeedBoosts = 0;                                                           //0000 : 0F 01 D8 6A 2E 11 25 
    SaveConfig();                                                               //0007 : 62 18 16 
    //0F 01 D8 6A 2E 11 25 62 18 16 04 0B 47 
  }


  protected native function sv2cl_AddSpeedBoost_CallStub();


  event sv2cl_AddSpeedBoost() {
    mSpeedBoosts++;                                                             //0000 : A5 01 D8 6A 2E 11 16 
    SaveConfig();                                                               //0007 : 62 18 16 
    //A5 01 D8 6A 2E 11 16 62 18 16 04 0B 47 
  }


  protected native function sv2cl_SetVisibleInRelevance_CallStub();


  event sv2cl_SetVisibleInRelevance(bool aValue) {
    mIsVisibleInRelevance = aValue;                                             //0000 : 14 2D 01 E8 69 2E 11 2D 00 88 72 2E 11 
    SaveConfig();                                                               //000D : 62 18 16 
    //14 2D 01 E8 69 2E 11 2D 00 88 72 2E 11 62 18 16 04 0B 47 
  }


  event OnCreateComponents() {
    Super.OnCreateComponents();                                                 //0000 : 1C C0 A6 1B 11 16 
    PropertyEditor = new (self) Class'Game_PropertyEditor';                     //0006 : 0F 01 A8 73 2E 11 11 17 0B 0B 20 38 C0 5E 01 
    SpwnieControl = new (self) Class'Editor_SpwnieControl';                     //0015 : 0F 01 78 AF 27 11 11 17 0B 0B 20 08 B0 27 11 
    //1C C0 A6 1B 11 16 0F 01 A8 73 2E 11 11 17 0B 0B 20 38 C0 5E 01 0F 01 78 AF 27 11 11 17 0B 0B 20 
    //08 B0 27 11 04 0B 47 
  }



