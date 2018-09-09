//==============================================================================
//  Game_EquippedAppearance
//==============================================================================

class Game_EquippedAppearance extends Game_Appearance within Game_Pawn
    native
    dependsOn(Appearance_Base,LevelInfo,Game_CharacterStats)
  ;

  struct Appearance_Skin {
      var Texture Torso;
      var Texture Legs;
      var Texture Head;

  };


  var byte mHead;
  var int mChestClothes;
  var byte mLeftGlove;
  var byte mRightGlove;
  var byte mPants;
  var byte mShoes;
  var byte mHeadGearArmour;
  var byte mLeftShoulderArmour;
  var byte mRightShoulderArmour;
  var byte mLeftGauntlet;
  var byte mRightGauntlet;
  var byte mChestArmour;
  var byte mBelt;
  var byte mLeftThigh;
  var byte mRightThigh;
  var byte mLeftShin;
  var byte mRightShin;
  var byte mMainWeapon;
  var byte mOffhandWeapon;
  var byte mHair;
  var byte mMainSheath;
  var byte mOffhandSheath;
  var byte mTattoo[4];
  var byte mClassTattoo[4];
  var byte mBodyColor;
  var byte mChestClothesColors[2];
  var byte mLeftGloveColors[2];
  var byte mRightGloveColors[2];
  var byte mPantsColors[2];
  var byte mShoesColors[2];
  var byte mHeadGearArmourColors[2];
  var byte mLeftShoulderArmourColors[2];
  var byte mRightShoulderArmourColors[2];
  var byte mLeftGauntletColors[2];
  var byte mRightGauntletColors[2];
  var byte mChestArmourColors[2];
  var byte mBeltColors[2];
  var byte mLeftThighColors[2];
  var byte mRightThighColors[2];
  var byte mLeftShinColors[2];
  var byte mRightShinColors[2];
  var byte mHairColor;
  var bool mDisplayLogo;
  var Appearance_Set mAppearanceSet;
  var float mFreezeTime;
  var float mFreezeStart;
  var bool mIgnoreCoversFlags;
  var private Texture mMetalEnvironmentMap;
  var private Texture mHairEnvironmentMap;


  protected native function string cl_GetPartName(byte aPart);


  native function Texture GetBodyPalette();


  native function Object GetAppearanceResource(byte aPartType,int aIndex);


  native function bool Compatible(Appearance_Base Base,bool IsCharacterCreation);


  native event CheckCompatibility(bool IsCharacterCreation);


  native function SetRandom(int aMeshMaterialBits,int aColorBits,bool aFullRandomColors,bool IsCharacterCreation,optional bool LockGloves,optional bool LockGauntlets,optional bool LockShoulderArmour,optional bool LockArmTattoos);


  function Appearance_Set GetAppearanceSet() {
    return mAppearanceSet;                                                      //0000 : 04 01 E0 44 21 11 
    //04 01 E0 44 21 11 04 0B 47 
  }


  protected native function sv2rel_SetColorValue_CallStub();


  event sv2rel_SetColorValue(byte aPart,byte aNewValue,byte aIndex) {
    SetColorValue(aPart,aNewValue,aIndex);                                      //0000 : 1B 04 0C 00 00 00 B8 46 21 11 00 88 47 21 11 00 00 48 21 11 16 
    Apply();                                                                    //0015 : 1C A0 3B 21 11 16 
    //1B 04 0C 00 00 00 B8 46 21 11 00 88 47 21 11 00 00 48 21 11 16 1C A0 3B 21 11 16 04 0B 47 
  }


  protected native function sv2rel_SetValue_CallStub();


  event sv2rel_SetValue(byte aPart,int aNewValue,byte aIndex) {
    SetValue(aPart,aNewValue,aIndex);                                           //0000 : 1B 37 0C 00 00 00 D8 49 21 11 00 A8 4A 21 11 00 20 4B 21 11 16 
    Apply();                                                                    //0015 : 1C A0 3B 21 11 16 
    //1B 37 0C 00 00 00 D8 49 21 11 00 A8 4A 21 11 00 20 4B 21 11 16 1C A0 3B 21 11 16 04 0B 47 
  }


  native event int GetNetMax(byte aPart);


  native function int GetMax(byte aPart);


  native function byte GetColorValue(byte aPart,byte aIndex);


  native function SneakySetColorValue(byte aPart,byte aNewValue,byte aIndex);


  native function SetColorValue(byte aPart,byte aNewValue,byte aIndex);


  native function int GetValue(byte aPart,optional byte aIndex);


  native function SneakySetValue(byte aPart,int aNewValue,optional byte aIndex);


  native function SetValue(byte aPart,int aNewValue,optional byte aIndex);


  function bool GetDisplayLogo() {
    return mDisplayLogo;                                                        //0000 : 04 2D 01 A8 5E 21 11 
    //04 2D 01 A8 5E 21 11 04 0B 47 
  }


  function byte GetHead() {
    return mHead;                                                               //0000 : 04 01 80 60 21 11 
    //04 01 80 60 21 11 04 0B 47 
  }


  function SetDisplayLogo(bool aNewVal) {
    mDisplayLogo = aNewVal;                                                     //0000 : 14 2D 01 A8 5E 21 11 2D 00 A8 61 21 11 
    //14 2D 01 A8 5E 21 11 2D 00 A8 61 21 11 04 0B 47 
  }


  function SetHead(byte aNewVal) {
    mHead = aNewVal;                                                            //0000 : 0F 01 80 60 21 11 00 10 63 21 11 
    //0F 01 80 60 21 11 00 10 63 21 11 04 0B 47 
  }


  function app(int A) {
    local byte appPart;
    local int maxIndex;
    local int i;
    local int j;
    local Appearance_Base appBase;
    local Object Obj;
    local byte val;
    Super.app(A);                                                               //0000 : 1C B0 14 21 11 00 78 64 21 11 16 
    cl_ConsoleMessage("----------------------------");                          //000B : 1B F1 0B 00 00 1F 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 00 16 
    appPart = 0;                                                                //002F : 0F 00 F0 6A 21 11 24 00 
    while (appPart <= 23) {                                                     //0037 : 07 3C 04 98 39 3A 00 F0 6A 21 11 39 3A 24 17 16 
      if (A > 0 && A - 1 != appPart) {                                          //0047 : 07 6B 00 82 97 00 78 64 21 11 25 16 18 12 00 9B 93 00 78 64 21 11 26 16 39 3A 00 F0 6A 21 11 16 16 
      } else {                                                                  //0068 : 06 27 04 
        if (appPart != 23 && appPart != 24) {                                   //006B : 07 97 00 82 9B 39 3A 00 F0 6A 21 11 39 3A 24 17 16 18 0E 00 9B 39 3A 00 F0 6A 21 11 39 3A 24 18 16 16 
          maxIndex = 1;                                                         //008D : 0F 00 68 6B 21 11 26 
        } else {                                                                //0094 : 06 9F 00 
          maxIndex = 4;                                                         //0097 : 0F 00 68 6B 21 11 2C 04 
        }
        i = 0;                                                                  //009F : 0F 00 E0 6B 21 11 25 
        while (i < maxIndex) {                                                  //00A6 : 07 27 04 96 00 E0 6B 21 11 00 68 6B 21 11 16 
          val = GetValue(appPart,i);                                            //00B5 : 0F 00 58 6C 21 11 39 3D 1B 7D 0C 00 00 00 F0 6A 21 11 39 3D 00 E0 6B 21 11 16 
          Obj = GetAppearanceResource(appPart,val);                             //00CF : 0F 00 D0 6C 21 11 1B 08 0D 00 00 00 F0 6A 21 11 39 3A 00 58 6C 21 11 16 
          appBase = Appearance_Base(Obj);                                       //00E7 : 0F 00 48 6D 21 11 2E 70 CD 5F 01 00 D0 6C 21 11 
          cl_ConsoleMessage("Part [" $ string(1 + appPart) $ "] "
            $ cl_GetPartName(appPart)
            $ "["
            $ string(i)
            $ "]: ("
            $ string(val)
            $ ") = "
            $ string(Obj));//00F7 : 1B F1 0B 00 00 70 70 70 70 70 70 70 70 70 1F 50 61 72 74 20 5B 00 39 53 92 26 39 3A 00 F0 6A 21 11 16 16 1F 5D 20 00 16 1B B9 0E 00 00 00 F0 6A 21 11 16 16 1F 5B 00 16 39 53 00 E0 6B 21 11 16 1F 5D 3A 20 28 00 16 39 52 00 58 6C 21 11 16 1F 29 20 3D 20 00 16 39 56 00 D0 6C 21 11 16 16 
          if (appBase != None && A - 1 == appPart) {                            //0156 : 07 1D 04 82 77 00 48 6D 21 11 2A 16 18 12 00 9A 93 00 78 64 21 11 26 16 39 3A 00 F0 6A 21 11 16 16 
            cl_ConsoleMessage("    Name:        " $ appBase.Name.Text);         //0177 : 1B F1 0B 00 00 70 1F 20 20 20 20 4E 61 6D 65 3A 20 20 20 20 20 20 20 20 00 36 58 C6 6B 0F 19 00 48 6D 21 11 05 00 0C 01 C0 6D 21 11 16 16 
            cl_ConsoleMessage("    Description: " $ appBase.Description.Text);  //01A5 : 1B F1 0B 00 00 70 1F 20 20 20 20 44 65 73 63 72 69 70 74 69 6F 6E 3A 20 00 36 58 C6 6B 0F 19 00 48 6D 21 11 05 00 0C 01 38 6E 21 11 16 16 
            cl_ConsoleMessage("    Palette1:    " $ string(appBase.Palette1));  //01D3 : 1B F1 0B 00 00 70 1F 20 20 20 20 50 61 6C 65 74 74 65 31 3A 20 20 20 20 00 39 56 19 00 48 6D 21 11 05 00 04 01 B0 6E 21 11 16 16 
            cl_ConsoleMessage("    Palette2:    " $ string(appBase.Palette2));  //01FE : 1B F1 0B 00 00 70 1F 20 20 20 20 50 61 6C 65 74 74 65 32 3A 20 20 20 20 00 39 56 19 00 48 6D 21 11 05 00 04 01 28 6F 21 11 16 16 
            cl_ConsoleMessage("    Part:        " $ string(appBase.Part));      //0229 : 1B F1 0B 00 00 70 1F 20 20 20 20 50 61 72 74 3A 20 20 20 20 20 20 20 20 00 39 52 19 00 48 6D 21 11 05 00 01 01 A0 6F 21 11 16 16 
            cl_ConsoleMessage("    Excludes:    " $ string(appBase.ExcludeHumans)
              @ string(appBase.ExcludeDaevi)
              @ string(appBase.ExcludeMale)
              @ string(appBase.ExcludeFemale)
              @ string(appBase.ExcludeFat)
              @ string(appBase.ExcludeSkinny)
              @ string(appBase.ExcludeHulk)
              @ string(appBase.ExcludeAthletic));//0254 : 1B F1 0B 00 00 A8 A8 A8 A8 A8 A8 A8 70 1F 20 20 20 20 45 78 63 6C 75 64 65 73 3A 20 20 20 20 00 39 54 19 00 48 6D 21 11 06 00 04 2D 01 18 70 21 11 16 39 54 19 00 48 6D 21 11 06 00 04 2D 01 90 70 21 11 16 39 54 19 00 48 6D 21 11 06 00 04 2D 01 08 71 21 11 16 39 54 19 00 48 6D 21 11 06 00 04 2D 01 80 71 21 11 16 39 54 19 00 48 6D 21 11 06 00 04 2D 01 F8 71 21 11 16 39 54 19 00 48 6D 21 11 06 00 04 2D 01 70 72 21 11 16 39 54 19 00 48 6D 21 11 06 00 04 2D 01 E8 72 21 11 16 39 54 19 00 48 6D 21 11 06 00 04 2D 01 60 73 21 11 16 16 
            cl_ConsoleMessage("    Item type:   " $ string(appBase._IT));       //0305 : 1B F1 0B 00 00 70 1F 20 20 20 20 49 74 65 6D 20 74 79 70 65 3A 20 20 20 00 39 56 19 00 48 6D 21 11 05 00 04 01 D8 73 21 11 16 16 
            cl_ConsoleMessage("    Set Index:   " $ string(appBase._AS_Index)
              @ string(appBase._AS_Set));//0330 : 1B F1 0B 00 00 A8 70 1F 20 20 20 20 53 65 74 20 49 6E 64 65 78 3A 20 20 20 00 39 53 19 00 48 6D 21 11 05 00 04 01 50 74 21 11 16 39 54 19 00 48 6D 21 11 06 00 04 2D 01 C8 74 21 11 16 16 
            cl_ConsoleMessage("    Attachments: "
              $ string(appBase.Attachments.Length));//036E : 1B F1 0B 00 00 70 1F 20 20 20 20 41 74 74 61 63 68 6D 65 6E 74 73 3A 20 00 39 53 37 19 00 48 6D 21 11 05 00 00 01 40 75 21 11 16 16 
            j = 0;                                                              //039A : 0F 00 B8 75 21 11 25 
            while (j < appBase.Attachments.Length) {                            //03A1 : 07 1D 04 96 00 B8 75 21 11 37 19 00 48 6D 21 11 05 00 00 01 40 75 21 11 16 
              cl_ConsoleMessage("        [" $ string(j) $ "]: "
                $ string(appBase.Attachments[j].SocketId)
                @ appBase.Attachments[j].MeshGroup);//03BA : 1B F1 0B 00 00 A8 70 70 70 1F 20 20 20 20 20 20 20 20 5B 00 39 53 00 B8 75 21 11 16 1F 5D 3A 20 00 16 39 52 36 30 76 21 11 10 00 B8 75 21 11 19 00 48 6D 21 11 05 00 00 01 40 75 21 11 16 36 A8 76 21 11 10 00 B8 75 21 11 19 00 48 6D 21 11 05 00 00 01 40 75 21 11 16 16 
              j++;                                                              //0413 : A5 00 B8 75 21 11 16 
            }
          }
          i++;                                                                  //041D : A5 00 E0 6B 21 11 16 
        }
      }
      appPart = appPart + 1;                                                    //0427 : 0F 00 F0 6A 21 11 39 3D 92 39 3A 00 F0 6A 21 11 26 16 
    }
    //1C B0 14 21 11 00 78 64 21 11 16 1B F1 0B 00 00 1F 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 
    //2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 00 16 0F 00 F0 6A 21 11 24 00 07 3C 04 98 39 3A 00 F0 6A 
    //21 11 39 3A 24 17 16 07 6B 00 82 97 00 78 64 21 11 25 16 18 12 00 9B 93 00 78 64 21 11 26 16 39 
    //3A 00 F0 6A 21 11 16 16 06 27 04 07 97 00 82 9B 39 3A 00 F0 6A 21 11 39 3A 24 17 16 18 0E 00 9B 
    //39 3A 00 F0 6A 21 11 39 3A 24 18 16 16 0F 00 68 6B 21 11 26 06 9F 00 0F 00 68 6B 21 11 2C 04 0F 
    //00 E0 6B 21 11 25 07 27 04 96 00 E0 6B 21 11 00 68 6B 21 11 16 0F 00 58 6C 21 11 39 3D 1B 7D 0C 
    //00 00 00 F0 6A 21 11 39 3D 00 E0 6B 21 11 16 0F 00 D0 6C 21 11 1B 08 0D 00 00 00 F0 6A 21 11 39 
    //3A 00 58 6C 21 11 16 0F 00 48 6D 21 11 2E 70 CD 5F 01 00 D0 6C 21 11 1B F1 0B 00 00 70 70 70 70 
    //70 70 70 70 70 1F 50 61 72 74 20 5B 00 39 53 92 26 39 3A 00 F0 6A 21 11 16 16 1F 5D 20 00 16 1B 
    //B9 0E 00 00 00 F0 6A 21 11 16 16 1F 5B 00 16 39 53 00 E0 6B 21 11 16 1F 5D 3A 20 28 00 16 39 52 
    //00 58 6C 21 11 16 1F 29 20 3D 20 00 16 39 56 00 D0 6C 21 11 16 16 07 1D 04 82 77 00 48 6D 21 11 
    //2A 16 18 12 00 9A 93 00 78 64 21 11 26 16 39 3A 00 F0 6A 21 11 16 16 1B F1 0B 00 00 70 1F 20 20 
    //20 20 4E 61 6D 65 3A 20 20 20 20 20 20 20 20 00 36 58 C6 6B 0F 19 00 48 6D 21 11 05 00 0C 01 C0 
    //6D 21 11 16 16 1B F1 0B 00 00 70 1F 20 20 20 20 44 65 73 63 72 69 70 74 69 6F 6E 3A 20 00 36 58 
    //C6 6B 0F 19 00 48 6D 21 11 05 00 0C 01 38 6E 21 11 16 16 1B F1 0B 00 00 70 1F 20 20 20 20 50 61 
    //6C 65 74 74 65 31 3A 20 20 20 20 00 39 56 19 00 48 6D 21 11 05 00 04 01 B0 6E 21 11 16 16 1B F1 
    //0B 00 00 70 1F 20 20 20 20 50 61 6C 65 74 74 65 32 3A 20 20 20 20 00 39 56 19 00 48 6D 21 11 05 
    //00 04 01 28 6F 21 11 16 16 1B F1 0B 00 00 70 1F 20 20 20 20 50 61 72 74 3A 20 20 20 20 20 20 20 
    //20 00 39 52 19 00 48 6D 21 11 05 00 01 01 A0 6F 21 11 16 16 1B F1 0B 00 00 A8 A8 A8 A8 A8 A8 A8 
    //70 1F 20 20 20 20 45 78 63 6C 75 64 65 73 3A 20 20 20 20 00 39 54 19 00 48 6D 21 11 06 00 04 2D 
    //01 18 70 21 11 16 39 54 19 00 48 6D 21 11 06 00 04 2D 01 90 70 21 11 16 39 54 19 00 48 6D 21 11 
    //06 00 04 2D 01 08 71 21 11 16 39 54 19 00 48 6D 21 11 06 00 04 2D 01 80 71 21 11 16 39 54 19 00 
    //48 6D 21 11 06 00 04 2D 01 F8 71 21 11 16 39 54 19 00 48 6D 21 11 06 00 04 2D 01 70 72 21 11 16 
    //39 54 19 00 48 6D 21 11 06 00 04 2D 01 E8 72 21 11 16 39 54 19 00 48 6D 21 11 06 00 04 2D 01 60 
    //73 21 11 16 16 1B F1 0B 00 00 70 1F 20 20 20 20 49 74 65 6D 20 74 79 70 65 3A 20 20 20 00 39 56 
    //19 00 48 6D 21 11 05 00 04 01 D8 73 21 11 16 16 1B F1 0B 00 00 A8 70 1F 20 20 20 20 53 65 74 20 
    //49 6E 64 65 78 3A 20 20 20 00 39 53 19 00 48 6D 21 11 05 00 04 01 50 74 21 11 16 39 54 19 00 48 
    //6D 21 11 06 00 04 2D 01 C8 74 21 11 16 16 1B F1 0B 00 00 70 1F 20 20 20 20 41 74 74 61 63 68 6D 
    //65 6E 74 73 3A 20 00 39 53 37 19 00 48 6D 21 11 05 00 00 01 40 75 21 11 16 16 0F 00 B8 75 21 11 
    //25 07 1D 04 96 00 B8 75 21 11 37 19 00 48 6D 21 11 05 00 00 01 40 75 21 11 16 1B F1 0B 00 00 A8 
    //70 70 70 1F 20 20 20 20 20 20 20 20 5B 00 39 53 00 B8 75 21 11 16 1F 5D 3A 20 00 16 39 52 36 30 
    //76 21 11 10 00 B8 75 21 11 19 00 48 6D 21 11 05 00 00 01 40 75 21 11 16 36 A8 76 21 11 10 00 B8 
    //75 21 11 19 00 48 6D 21 11 05 00 00 01 40 75 21 11 16 16 A5 00 B8 75 21 11 16 06 A1 03 A5 00 E0 
    //6B 21 11 16 06 A6 00 0F 00 F0 6A 21 11 39 3D 92 39 3A 00 F0 6A 21 11 26 16 06 37 00 04 0B 47 
  }


  function bool Check() {
    if (GetAppearanceSet() == None) {                                           //0000 : 07 0E 00 72 1B B4 0E 00 00 16 2A 16 
      return False;                                                             //000C : 04 28 
    }
    return Super.Check();                                                       //000E : 04 1C A0 2F 21 11 16 
    //07 0E 00 72 1B B4 0E 00 00 16 2A 16 04 28 04 1C A0 2F 21 11 16 04 0B 47 
  }


  event cl_OnFrame(float DeltaTime) {
    if (mFreezeTime > 0) {                                                      //0000 : 07 59 00 B1 01 78 7A 21 11 39 3F 25 16 
      if (Outer.Level.TimeSeconds - mFreezeStart >= mFreezeTime) {              //000D : 07 59 00 B3 AF 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 F0 7A 21 11 16 01 78 7A 21 11 16 
        mFreezeTime = 0.00000000;                                               //0035 : 0F 01 78 7A 21 11 1E 00 00 00 00 
        Outer.CharacterStats.FreezeMovement(False);                             //0040 : 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 07 00 00 1B A1 0C 00 00 28 16 
      }
    }
    Super.cl_OnFrame(DeltaTime);                                                //0059 : 1C F8 3C 21 11 00 48 79 21 11 16 
    //07 59 00 B1 01 78 7A 21 11 39 3F 25 16 07 59 00 B3 AF 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 
    //0F 05 00 04 01 A8 81 6C 0F 01 F0 7A 21 11 16 01 78 7A 21 11 16 0F 01 78 7A 21 11 1E 00 00 00 00 
    //19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 07 00 00 1B A1 0C 00 00 28 16 1C F8 3C 21 11 00 48 
    //79 21 11 16 04 0B 47 
  }


  event OnConstruct() {
    Super.OnConstruct();                                                        //0000 : 1C 30 3F 21 11 16 
    InitAppearanceSet();                                                        //0006 : 1B 13 0E 00 00 16 
    //1C 30 3F 21 11 16 1B 13 0E 00 00 16 04 0B 47 
  }


  protected native function InitAppearanceSet();



