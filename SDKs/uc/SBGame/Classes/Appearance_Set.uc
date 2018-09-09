//==============================================================================
//  Appearance_Set
//==============================================================================

class Appearance_Set extends Object
    native
    exportstructs
    dependsOn(Appearance_Base,Class)
  ;

  struct BodyFlaps {
      var SkeletalMesh Foot_l;
      var SkeletalMesh Foot_r;
      var SkeletalMesh LoLeg_l;
      var SkeletalMesh LoLeg_r;
      var SkeletalMesh UpLeg;
      var SkeletalMesh LoArm_l;
      var SkeletalMesh LoArm_r;
      var SkeletalMesh UpArm_l;
      var SkeletalMesh UpArm_r;

  };


  var array<Mesh> BodySet;
  var array<Mesh> LowQualBodySet;
  var array<BodyFlaps> FlapSet;
  var array<BodyFlaps> LowQualFlapSet;
  var array<string> HeadSet;
  var Texture BodyPalette[5];
  var array<Material> TorsoSkin;
  var array<Material> LegsSkin;
  var array<Material> HeadSkin1;
  var array<Material> HeadSkin2;
  var array<Material> HeadSkin3;
  var array<Material> HeadSkin4;
  var array<Appearance_Base> ChestClothesSet;
  var array<Appearance_Base> LeftGloveSet;
  var array<Appearance_Base> RightGloveSet;
  var array<Appearance_Base> PantsSet;
  var array<Appearance_Base> ShoesSet;
  var array<Appearance_Base> HeadGearSet;
  var array<Appearance_Base> LeftShoulderSet;
  var array<Appearance_Base> RightShoulderSet;
  var array<Appearance_Base> LeftGauntletSet;
  var array<Appearance_Base> RightGauntletSet;
  var array<Appearance_Base> ChestSet;
  var array<Appearance_Base> BeltSet;
  var array<Appearance_Base> LeftThighSet;
  var array<Appearance_Base> RightThighSet;
  var array<Appearance_Base> LeftShinSet;
  var array<Appearance_Base> RightShinSet;
  var array<Appearance_Base> MainWeaponSet;
  var array<Appearance_Base> OffhandWeaponSet;
  var array<Appearance_Base> MainSheathSet;
  var array<Appearance_Base> OffhandSheathSet;
  var array<Appearance_Base> HairSet;
  var array<Appearance_Tattoo> PCTattooSet;
  var array<Appearance_Tattoo> ClassTattooSet;
  var private bool mInitialized;


  native function UnloadResources();


  private function SheathArray(array<Appearance_Base> orgArray,out array<Appearance_Base> OutArray) {
    local int i;
    local int aI;
    i = 0;                                                                      //0000 : 0F 00 D8 50 35 11 25 
    while (i < orgArray.Length) {                                               //0007 : 07 91 02 96 00 D8 50 35 11 37 00 60 50 35 11 16 
      if (orgArray[i] != None) {                                                //0017 : 07 7A 02 77 10 00 D8 50 35 11 00 60 50 35 11 2A 16 
        OutArray[i] = Appearance_Base(orgArray[i].Clone(True));                 //0028 : 0F 10 00 D8 50 35 11 00 50 51 35 11 2E 70 CD 5F 01 19 10 00 D8 50 35 11 00 60 50 35 11 07 00 04 1B 67 0F 00 00 27 16 
        if (orgArray[i].Part == 16) {                                           //004F : 07 88 00 9A 39 3A 19 10 00 D8 50 35 11 00 60 50 35 11 05 00 01 01 A0 6F 21 11 39 3A 24 10 16 
          OutArray[i].Part = 19;                                                //006E : 0F 19 10 00 D8 50 35 11 00 50 51 35 11 05 00 01 01 A0 6F 21 11 24 13 
        } else {                                                                //0085 : 06 C1 00 
          if (orgArray[i].Part == 17) {                                         //0088 : 07 C1 00 9A 39 3A 19 10 00 D8 50 35 11 00 60 50 35 11 05 00 01 01 A0 6F 21 11 39 3A 24 11 16 
            OutArray[i].Part = 20;                                              //00A7 : 0F 19 10 00 D8 50 35 11 00 50 51 35 11 05 00 01 01 A0 6F 21 11 24 14 
            goto jl00C1;                                                        //00BE : 06 C1 00 
          }
        }
        aI = 0;                                                                 //00C1 : 0F 00 C8 51 35 11 25 
        while (aI < orgArray[i].Attachments.Length) {                           //00C8 : 07 77 02 96 00 C8 51 35 11 37 19 10 00 D8 50 35 11 00 60 50 35 11 05 00 00 01 40 75 21 11 16 
          if (orgArray[i].Attachments[aI].SocketId == Class'Appearance_Base'.6) {//00E7 : 07 6A 01 9A 39 3A 36 30 76 21 11 10 00 C8 51 35 11 19 10 00 D8 50 35 11 00 60 50 35 11 05 00 00 01 40 75 21 11 39 3A 12 20 70 CD 5F 01 02 00 01 24 06 16 
            OutArray[i].Attachments[aI].SocketId = Class'Appearance_Base'.15;   //011A : 0F 36 30 76 21 11 10 00 C8 51 35 11 19 10 00 D8 50 35 11 00 50 51 35 11 05 00 00 01 40 75 21 11 12 20 70 CD 5F 01 02 00 01 24 0F 
            OutArray[i].Attachments[aI].Covers = 16;                            //0145 : 0F 36 60 0A 2C 11 10 00 C8 51 35 11 19 10 00 D8 50 35 11 00 50 51 35 11 05 00 00 01 40 75 21 11 24 10 
          } else {                                                              //0167 : 06 6D 02 
            if (orgArray[i].Attachments[aI].SocketId == Class'Appearance_Base'.5) {//016A : 07 ED 01 9A 39 3A 36 30 76 21 11 10 00 C8 51 35 11 19 10 00 D8 50 35 11 00 60 50 35 11 05 00 00 01 40 75 21 11 39 3A 12 20 70 CD 5F 01 02 00 01 24 05 16 
              OutArray[i].Attachments[aI].SocketId = Class'Appearance_Base'.16; //019D : 0F 36 30 76 21 11 10 00 C8 51 35 11 19 10 00 D8 50 35 11 00 50 51 35 11 05 00 00 01 40 75 21 11 12 20 70 CD 5F 01 02 00 01 24 10 
              OutArray[i].Attachments[aI].Covers = 16;                          //01C8 : 0F 36 60 0A 2C 11 10 00 C8 51 35 11 19 10 00 D8 50 35 11 00 50 51 35 11 05 00 00 01 40 75 21 11 24 10 
              goto jl026D;                                                      //01EA : 06 6D 02 
            }
            if (orgArray[i].Attachments[aI].SocketId == Class'Appearance_Base'.17) {//01ED : 07 6D 02 9A 39 3A 36 30 76 21 11 10 00 C8 51 35 11 19 10 00 D8 50 35 11 00 60 50 35 11 05 00 00 01 40 75 21 11 39 3A 12 20 70 CD 5F 01 02 00 01 24 11 16 
              OutArray[i].Attachments[aI].SocketId = Class'Appearance_Base'.18; //0220 : 0F 36 30 76 21 11 10 00 C8 51 35 11 19 10 00 D8 50 35 11 00 50 51 35 11 05 00 00 01 40 75 21 11 12 20 70 CD 5F 01 02 00 01 24 12 
              OutArray[i].Attachments[aI].Covers = 16;                          //024B : 0F 36 60 0A 2C 11 10 00 C8 51 35 11 19 10 00 D8 50 35 11 00 50 51 35 11 05 00 00 01 40 75 21 11 24 10 
            }
          }
          aI++;                                                                 //026D : A5 00 C8 51 35 11 16 
        }
        break;                                                                  //0277 : 06 87 02 
      }
      OutArray[i] = None;                                                       //027A : 0F 10 00 D8 50 35 11 00 50 51 35 11 2A 
      ++i;                                                                      //0287 : A3 00 D8 50 35 11 16 
    }
    //0F 00 D8 50 35 11 25 07 91 02 96 00 D8 50 35 11 37 00 60 50 35 11 16 07 7A 02 77 10 00 D8 50 35 
    //11 00 60 50 35 11 2A 16 0F 10 00 D8 50 35 11 00 50 51 35 11 2E 70 CD 5F 01 19 10 00 D8 50 35 11 
    //00 60 50 35 11 07 00 04 1B 67 0F 00 00 27 16 07 88 00 9A 39 3A 19 10 00 D8 50 35 11 00 60 50 35 
    //11 05 00 01 01 A0 6F 21 11 39 3A 24 10 16 0F 19 10 00 D8 50 35 11 00 50 51 35 11 05 00 01 01 A0 
    //6F 21 11 24 13 06 C1 00 07 C1 00 9A 39 3A 19 10 00 D8 50 35 11 00 60 50 35 11 05 00 01 01 A0 6F 
    //21 11 39 3A 24 11 16 0F 19 10 00 D8 50 35 11 00 50 51 35 11 05 00 01 01 A0 6F 21 11 24 14 06 C1 
    //00 0F 00 C8 51 35 11 25 07 77 02 96 00 C8 51 35 11 37 19 10 00 D8 50 35 11 00 60 50 35 11 05 00 
    //00 01 40 75 21 11 16 07 6A 01 9A 39 3A 36 30 76 21 11 10 00 C8 51 35 11 19 10 00 D8 50 35 11 00 
    //60 50 35 11 05 00 00 01 40 75 21 11 39 3A 12 20 70 CD 5F 01 02 00 01 24 06 16 0F 36 30 76 21 11 
    //10 00 C8 51 35 11 19 10 00 D8 50 35 11 00 50 51 35 11 05 00 00 01 40 75 21 11 12 20 70 CD 5F 01 
    //02 00 01 24 0F 0F 36 60 0A 2C 11 10 00 C8 51 35 11 19 10 00 D8 50 35 11 00 50 51 35 11 05 00 00 
    //01 40 75 21 11 24 10 06 6D 02 07 ED 01 9A 39 3A 36 30 76 21 11 10 00 C8 51 35 11 19 10 00 D8 50 
    //35 11 00 60 50 35 11 05 00 00 01 40 75 21 11 39 3A 12 20 70 CD 5F 01 02 00 01 24 05 16 0F 36 30 
    //76 21 11 10 00 C8 51 35 11 19 10 00 D8 50 35 11 00 50 51 35 11 05 00 00 01 40 75 21 11 12 20 70 
    //CD 5F 01 02 00 01 24 10 0F 36 60 0A 2C 11 10 00 C8 51 35 11 19 10 00 D8 50 35 11 00 50 51 35 11 
    //05 00 00 01 40 75 21 11 24 10 06 6D 02 07 6D 02 9A 39 3A 36 30 76 21 11 10 00 C8 51 35 11 19 10 
    //00 D8 50 35 11 00 60 50 35 11 05 00 00 01 40 75 21 11 39 3A 12 20 70 CD 5F 01 02 00 01 24 11 16 
    //0F 36 30 76 21 11 10 00 C8 51 35 11 19 10 00 D8 50 35 11 00 50 51 35 11 05 00 00 01 40 75 21 11 
    //12 20 70 CD 5F 01 02 00 01 24 12 0F 36 60 0A 2C 11 10 00 C8 51 35 11 19 10 00 D8 50 35 11 00 50 
    //51 35 11 05 00 00 01 40 75 21 11 24 10 A5 00 C8 51 35 11 16 06 C8 00 06 87 02 0F 10 00 D8 50 35 
    //11 00 50 51 35 11 2A A3 00 D8 50 35 11 16 06 07 00 04 0B 47 
  }


  private function InitArray(out array<Appearance_Base> OutArray) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 10 55 35 11 25 
    while (i < OutArray.Length) {                                               //0007 : 07 63 00 96 00 10 55 35 11 37 00 E0 53 35 11 16 
      if (OutArray[i] != None) {                                                //0017 : 07 59 00 77 10 00 10 55 35 11 00 E0 53 35 11 2A 16 
        OutArray[i]._AS_Index = i;                                              //0028 : 0F 19 10 00 10 55 35 11 00 E0 53 35 11 05 00 04 01 50 74 21 11 00 10 55 35 11 
        OutArray[i]._AS_Set = True;                                             //0042 : 14 19 10 00 10 55 35 11 00 E0 53 35 11 06 00 04 2D 01 C8 74 21 11 27 
      }
      ++i;                                                                      //0059 : A3 00 10 55 35 11 16 
    }
    //0F 00 10 55 35 11 25 07 63 00 96 00 10 55 35 11 37 00 E0 53 35 11 16 07 59 00 77 10 00 10 55 35 
    //11 00 E0 53 35 11 2A 16 0F 19 10 00 10 55 35 11 00 E0 53 35 11 05 00 04 01 50 74 21 11 00 10 55 
    //35 11 14 19 10 00 10 55 35 11 00 E0 53 35 11 06 00 04 2D 01 C8 74 21 11 27 A3 00 10 55 35 11 16 
    //06 07 00 04 0B 47 
  }


  event OnInit() {
    if (mInitialized) {                                                         //0000 : 07 0B 00 2D 01 18 58 35 11 
      return;                                                                   //0009 : 04 0B 
    }
    mInitialized = True;                                                        //000B : 14 2D 01 18 58 35 11 27 
    InitArray(ChestClothesSet);                                                 //0013 : 1B F5 0B 00 00 01 90 58 35 11 16 
    InitArray(LeftGloveSet);                                                    //001E : 1B F5 0B 00 00 01 08 59 35 11 16 
    InitArray(RightGloveSet);                                                   //0029 : 1B F5 0B 00 00 01 80 59 35 11 16 
    InitArray(PantsSet);                                                        //0034 : 1B F5 0B 00 00 01 F8 59 35 11 16 
    InitArray(ShoesSet);                                                        //003F : 1B F5 0B 00 00 01 70 5A 35 11 16 
    InitArray(HeadGearSet);                                                     //004A : 1B F5 0B 00 00 01 E8 5A 35 11 16 
    InitArray(LeftShoulderSet);                                                 //0055 : 1B F5 0B 00 00 01 60 5B 35 11 16 
    InitArray(RightShoulderSet);                                                //0060 : 1B F5 0B 00 00 01 D8 5B 35 11 16 
    InitArray(LeftGauntletSet);                                                 //006B : 1B F5 0B 00 00 01 50 5C 35 11 16 
    InitArray(RightGauntletSet);                                                //0076 : 1B F5 0B 00 00 01 C8 5C 35 11 16 
    InitArray(ChestSet);                                                        //0081 : 1B F5 0B 00 00 01 40 5D 35 11 16 
    InitArray(BeltSet);                                                         //008C : 1B F5 0B 00 00 01 B8 5D 35 11 16 
    InitArray(LeftThighSet);                                                    //0097 : 1B F5 0B 00 00 01 30 5E 35 11 16 
    InitArray(RightThighSet);                                                   //00A2 : 1B F5 0B 00 00 01 A8 5E 35 11 16 
    InitArray(LeftShinSet);                                                     //00AD : 1B F5 0B 00 00 01 20 5F 35 11 16 
    InitArray(RightShinSet);                                                    //00B8 : 1B F5 0B 00 00 01 98 5F 35 11 16 
    InitArray(MainWeaponSet);                                                   //00C3 : 1B F5 0B 00 00 01 10 60 35 11 16 
    InitArray(OffhandWeaponSet);                                                //00CE : 1B F5 0B 00 00 01 88 60 35 11 16 
    if (!IsEditor()) {                                                          //00D9 : 07 04 01 81 1B 63 0C 00 00 16 16 
      SheathArray(MainWeaponSet,MainSheathSet);                                 //00E4 : 1B 47 0D 00 00 01 10 60 35 11 01 00 61 35 11 16 
      SheathArray(OffhandWeaponSet,OffhandSheathSet);                           //00F4 : 1B 47 0D 00 00 01 88 60 35 11 01 78 61 35 11 16 
    }
    InitArray(HairSet);                                                         //0104 : 1B F5 0B 00 00 01 F0 61 35 11 16 
    //07 0B 00 2D 01 18 58 35 11 04 0B 14 2D 01 18 58 35 11 27 1B F5 0B 00 00 01 90 58 35 11 16 1B F5 
    //0B 00 00 01 08 59 35 11 16 1B F5 0B 00 00 01 80 59 35 11 16 1B F5 0B 00 00 01 F8 59 35 11 16 1B 
    //F5 0B 00 00 01 70 5A 35 11 16 1B F5 0B 00 00 01 E8 5A 35 11 16 1B F5 0B 00 00 01 60 5B 35 11 16 
    //1B F5 0B 00 00 01 D8 5B 35 11 16 1B F5 0B 00 00 01 50 5C 35 11 16 1B F5 0B 00 00 01 C8 5C 35 11 
    //16 1B F5 0B 00 00 01 40 5D 35 11 16 1B F5 0B 00 00 01 B8 5D 35 11 16 1B F5 0B 00 00 01 30 5E 35 
    //11 16 1B F5 0B 00 00 01 A8 5E 35 11 16 1B F5 0B 00 00 01 20 5F 35 11 16 1B F5 0B 00 00 01 98 5F 
    //35 11 16 1B F5 0B 00 00 01 10 60 35 11 16 1B F5 0B 00 00 01 88 60 35 11 16 07 04 01 81 1B 63 0C 
    //00 00 16 16 1B 47 0D 00 00 01 10 60 35 11 01 00 61 35 11 16 1B 47 0D 00 00 01 88 60 35 11 01 78 
    //61 35 11 16 1B F5 0B 00 00 01 F0 61 35 11 16 04 0B 47 
  }



