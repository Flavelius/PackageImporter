//==============================================================================
//  NPC_Appearance
//==============================================================================

class NPC_Appearance extends Content_API
    native
    abstract
    collapsecategories
    editinlinenew
    dependsOn(Game_Appearance)
  ;

  const SMALL_RADIUS =  21;
  const LARGE_RADIUS =  150;
  const MAX_NPC_VOICE =  14;
  const MAX_KID_MALE_VOICE =  1;
  const MAX_KID_FEMALE_VOICE =  2;
  enum EVoiceType {
    VT_NONE ,
    VT_Raw ,
    VT_Military ,
    VT_Egocentric ,
    VT_Neurotic ,
    VT_Seductive ,
    VT_Wise ,
    VT_Sneering ,
    VT_Shy ,
    VT_RANDOM ,
    VT_1 ,
    VT_2 ,
    VT_3 ,
    VT_4 ,
    VT_5 ,
    VT_6 ,
    VT_7 ,
    VT_8 ,
    VT_9 ,
    VT_10 ,
    VT_11 ,
    VT_12 ,
    VT_13 ,
    VT_14 
  };

  var (Voice) byte Voice;
  var (NPC_Appearance) Material AvatarTexture;


  event byte GetGender() {
    return 2;                                                                   //0000 : 04 24 02 
    //04 24 02 04 0B 47 
  }


  protected function Game_Appearance ForceAppearanceClass(Game_Pawn aPawn,export editinline Game_Appearance aAppearance,class<Game_Appearance> AppearanceClass) {
    if (None == aAppearance
      || False == aPawn.ClassIsChildOf(aAppearance.Class,AppearanceClass)) {//0000 : 07 63 00 84 72 2A 00 70 00 31 11 16 18 23 00 F2 28 19 00 38 FF 30 11 16 00 04 61 02 19 00 70 00 31 11 05 00 04 01 68 E5 6B 0F 00 E8 00 31 11 16 16 16 
      aAppearance = new (aPawn) AppearanceClass;                                //0032 : 0F 00 70 00 31 11 11 00 38 FF 30 11 0B 0B 00 E8 00 31 11 
      aAppearance.OnConstruct();                                                //0045 : 19 00 70 00 31 11 06 00 00 1B BC 05 00 00 16 
      aAppearance.cl_OnInit();                                                  //0054 : 19 00 70 00 31 11 06 00 00 1B 3F 05 00 00 16 
    }
    return aAppearance;                                                         //0063 : 04 00 70 00 31 11 
    //07 63 00 84 72 2A 00 70 00 31 11 16 18 23 00 F2 28 19 00 38 FF 30 11 16 00 04 61 02 19 00 70 00 
    //31 11 05 00 04 01 68 E5 6B 0F 00 E8 00 31 11 16 16 16 0F 00 70 00 31 11 11 00 38 FF 30 11 0B 0B 
    //00 E8 00 31 11 19 00 70 00 31 11 06 00 00 1B BC 05 00 00 16 19 00 70 00 31 11 06 00 00 1B 3F 05 
    //00 00 16 04 00 70 00 31 11 04 0B 47 
  }


  event int GetHead() {
    return 0;                                                                   //0000 : 04 25 
    //04 25 04 0B 47 
  }


  event SetHead(int NewHead) {
    //04 0B 47 
  }


  event EditorVerify();


  native function float GetSkillRadius();


  native function float GetCollisionRadius();


  native function float GetCollisionHeight();


  function Game_Appearance CreateAppearance(Game_Pawn aPawn,export editinline Game_Appearance aAppearance,bool aShifting) {
    local float R;
    local float H;
    aPawn.SkillRadius = GetSkillRadius();                                       //0000 : 0F 19 00 70 70 32 11 05 00 04 01 C0 57 19 11 1B 9E 0F 00 00 16 
    if (!aShifting) {                                                           //0015 : 07 6E 00 81 2D 00 F8 72 32 11 16 
      R = GetCollisionRadius();                                                 //0020 : 0F 00 70 73 32 11 1B 9B 0C 00 00 16 
      H = GetCollisionHeight();                                                 //002C : 0F 00 E8 73 32 11 1B 5D 0C 00 00 16 
      if (R >= 0.00000000 && H >= 0.00000000) {                                 //0038 : 07 6E 00 82 B3 00 70 73 32 11 1E 00 00 00 00 16 18 0D 00 B3 00 E8 73 32 11 1E 00 00 00 00 16 16 
        aPawn.SetCollisionSize(R,H);                                            //0058 : 19 00 70 70 32 11 0D 00 04 61 1B 00 70 73 32 11 00 E8 73 32 11 16 
      }
    }
    if (aAppearance != None) {                                                  //006E : 07 57 01 77 00 60 74 32 11 2A 16 
      switch (Voice) {                                                          //0079 : 05 01 01 D8 74 32 11 
        case 0 :                                                                //0080 : 0A 9B 00 24 00 
          aAppearance.SetVoice(255);                                            //0085 : 19 00 60 74 32 11 0A 00 00 1B 75 0C 00 00 39 3D 2C FF 16 
          break;                                                                //0098 : 06 43 01 
        case 9 :                                                                //009B : 0A 22 01 24 09 
          if (aAppearance.IsKid()) {                                            //00A0 : 07 04 01 19 00 60 74 32 11 06 00 04 1B C3 0C 00 00 16 
            if (aAppearance.GetGender() == Class'Content_API'.0) {              //00B2 : 07 EC 00 9A 39 3A 19 00 60 74 32 11 06 00 01 1B 6F 05 00 00 16 39 3A 12 20 40 5D 5B 01 02 00 01 24 00 16 
              aAppearance.SetVoice(Rand(1));                                    //00D5 : 19 00 60 74 32 11 0B 00 00 1B 75 0C 00 00 39 3D A7 26 16 16 
            } else {                                                            //00E9 : 06 01 01 
              aAppearance.SetVoice(Rand(2));                                    //00EC : 19 00 60 74 32 11 0C 00 00 1B 75 0C 00 00 39 3D A7 2C 02 16 16 
            }
          } else {                                                              //0101 : 06 1F 01 
            aAppearance.SetVoice(10 + Rand(14));                                //0104 : 19 00 60 74 32 11 12 00 00 1B 75 0C 00 00 39 3D 92 39 3A 24 0A A7 2C 0E 16 16 16 
          }
          break;                                                                //011F : 06 43 01 
        default:                                                                //0122 : 0A FF FF 
          aAppearance.SetVoice(Voice - 1);                                      //0125 : 19 00 60 74 32 11 12 00 00 1B 75 0C 00 00 39 3D 93 39 3A 01 D8 74 32 11 26 16 16 
          break;                                                                //0140 : 06 43 01 
      }
      aAppearance.SetAvatarTexture(AvatarTexture);                              //0143 : 19 00 60 74 32 11 0B 00 00 1B 45 0F 00 00 01 50 75 32 11 16 
    }
    return aAppearance;                                                         //0157 : 04 00 60 74 32 11 
    //0F 19 00 70 70 32 11 05 00 04 01 C0 57 19 11 1B 9E 0F 00 00 16 07 6E 00 81 2D 00 F8 72 32 11 16 
    //0F 00 70 73 32 11 1B 9B 0C 00 00 16 0F 00 E8 73 32 11 1B 5D 0C 00 00 16 07 6E 00 82 B3 00 70 73 
    //32 11 1E 00 00 00 00 16 18 0D 00 B3 00 E8 73 32 11 1E 00 00 00 00 16 16 19 00 70 70 32 11 0D 00 
    //04 61 1B 00 70 73 32 11 00 E8 73 32 11 16 07 57 01 77 00 60 74 32 11 2A 16 05 01 01 D8 74 32 11 
    //0A 9B 00 24 00 19 00 60 74 32 11 0A 00 00 1B 75 0C 00 00 39 3D 2C FF 16 06 43 01 0A 22 01 24 09 
    //07 04 01 19 00 60 74 32 11 06 00 04 1B C3 0C 00 00 16 07 EC 00 9A 39 3A 19 00 60 74 32 11 06 00 
    //01 1B 6F 05 00 00 16 39 3A 12 20 40 5D 5B 01 02 00 01 24 00 16 19 00 60 74 32 11 0B 00 00 1B 75 
    //0C 00 00 39 3D A7 26 16 16 06 01 01 19 00 60 74 32 11 0C 00 00 1B 75 0C 00 00 39 3D A7 2C 02 16 
    //16 06 1F 01 19 00 60 74 32 11 12 00 00 1B 75 0C 00 00 39 3D 92 39 3A 24 0A A7 2C 0E 16 16 16 06 
    //43 01 0A FF FF 19 00 60 74 32 11 12 00 00 1B 75 0C 00 00 39 3D 93 39 3A 01 D8 74 32 11 26 16 16 
    //06 43 01 19 00 60 74 32 11 0B 00 00 1B 45 0F 00 00 01 50 75 32 11 16 04 00 60 74 32 11 04 0B 47 
    //
  }



