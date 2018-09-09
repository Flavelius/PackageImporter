//==============================================================================
//  Interaction_Animation
//==============================================================================

class Interaction_Animation extends Interaction_Component
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,InteractiveLevelElement)
  ;

  var (Interaction_Animation) const string animName;
  var (Interaction_Animation) const float LoopDuration;
  var (Interaction_Animation) const float speed;
  var transient float mTimer;


  function ClOnEnd(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    Super.ClOnEnd(aOwner,aInstigator,aReverse);                                 //0000 : 1C A8 A6 32 13 00 48 5C F9 13 00 C0 5C F9 13 2D 00 38 5D F9 13 16 
    if (!aReverse) {                                                            //0016 : 07 46 00 81 2D 00 38 5D F9 13 16 
      if (LoopDuration > 0.00000000) {                                          //0021 : 07 46 00 B1 01 B0 5D F9 13 1E 00 00 00 00 16 
        aInstigator.ClearAnimsByType(9,0.00000000);                             //0030 : 19 00 C0 5C F9 13 0D 00 00 1B B6 0C 00 00 24 09 1E 00 00 00 00 16 
      }
    }
    //1C A8 A6 32 13 00 48 5C F9 13 00 C0 5C F9 13 2D 00 38 5D F9 13 16 07 46 00 81 2D 00 38 5D F9 13 
    //16 07 46 00 B1 01 B0 5D F9 13 1E 00 00 00 00 16 19 00 C0 5C F9 13 0D 00 00 1B B6 0C 00 00 24 09 
    //1E 00 00 00 00 16 04 0B 47 
  }


  function ClOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    Super.ClOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 78 A8 32 13 00 D8 5E F9 13 00 50 5F F9 13 2D 00 C8 5F F9 13 16 
    if (aInstigator != None && animName != "") {                                //0016 : 07 90 00 82 77 00 50 5F F9 13 2A 16 18 0A 00 7B 01 40 60 F9 13 1F 00 16 16 
      if (!aReverse) {                                                          //002F : 07 90 00 81 2D 00 C8 5F F9 13 16 
        if (LoopDuration > 0.00000000) {                                        //003A : 07 6E 00 B1 01 B0 5D F9 13 1E 00 00 00 00 16 
          aInstigator.PlayTopLevelAnim(name(animName),speed,0.20000000,True,False);//0049 : 19 00 50 5F F9 13 19 00 00 1B B0 2D 00 00 39 5A 01 40 60 F9 13 01 B8 60 F9 13 1E CD CC 4C 3E 27 28 16 
        } else {                                                                //006B : 06 90 00 
          aInstigator.PlayTopLevelAnim(name(animName),speed,0.20000000,False,False);//006E : 19 00 50 5F F9 13 19 00 00 1B B0 2D 00 00 39 5A 01 40 60 F9 13 01 B8 60 F9 13 1E CD CC 4C 3E 28 28 16 
        }
      }
    }
    //1C 78 A8 32 13 00 D8 5E F9 13 00 50 5F F9 13 2D 00 C8 5F F9 13 16 07 90 00 82 77 00 50 5F F9 13 
    //2A 16 18 0A 00 7B 01 40 60 F9 13 1F 00 16 16 07 90 00 81 2D 00 C8 5F F9 13 16 07 6E 00 B1 01 B0 
    //5D F9 13 1E 00 00 00 00 16 19 00 50 5F F9 13 19 00 00 1B B0 2D 00 00 39 5A 01 40 60 F9 13 01 B8 
    //60 F9 13 1E CD CC 4C 3E 27 28 16 06 90 00 19 00 50 5F F9 13 19 00 00 1B B0 2D 00 00 39 5A 01 40 
    //60 F9 13 01 B8 60 F9 13 1E CD CC 4C 3E 28 28 16 04 0B 47 
  }


  function SvOnEnd(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local InteractiveLevelElement ile;
    ile = InteractiveLevelElement(aOwner);                                      //0000 : 0F 00 10 63 F9 13 2E F8 C7 5C 01 00 E0 61 F9 13 
    if (ile != None) {                                                          //0010 : 07 4F 00 77 00 10 63 F9 13 2A 16 
      if (!aReverse) {                                                          //001B : 07 4F 00 81 2D 00 88 63 F9 13 16 
        mTimer = LoopDuration;                                                  //0026 : 0F 01 00 64 F9 13 01 B0 5D F9 13 
        if (LoopDuration > 0.00000000) {                                        //0031 : 07 4F 00 B1 01 B0 5D F9 13 1E 00 00 00 00 16 
          ile.sv_EndClientSubAction();                                          //0040 : 19 00 10 63 F9 13 06 00 00 1B F6 0F 00 00 16 
        }
      }
    }
    Super.SvOnEnd(aOwner,aInstigator,aReverse);                                 //004F : 1C 88 AD 32 13 00 E0 61 F9 13 00 78 64 F9 13 2D 00 88 63 F9 13 16 
    //0F 00 10 63 F9 13 2E F8 C7 5C 01 00 E0 61 F9 13 07 4F 00 77 00 10 63 F9 13 2A 16 07 4F 00 81 2D 
    //00 88 63 F9 13 16 0F 01 00 64 F9 13 01 B0 5D F9 13 07 4F 00 B1 01 B0 5D F9 13 1E 00 00 00 00 16 
    //19 00 10 63 F9 13 06 00 00 1B F6 0F 00 00 16 1C 88 AD 32 13 00 E0 61 F9 13 00 78 64 F9 13 2D 00 
    //88 63 F9 13 16 04 0B 47 
  }


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local InteractiveLevelElement ile;
    Super.SvOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 60 AF 32 13 00 F0 64 F9 13 00 20 66 F9 13 2D 00 98 66 F9 13 16 
    ile = InteractiveLevelElement(aOwner);                                      //0016 : 0F 00 10 67 F9 13 2E F8 C7 5C 01 00 F0 64 F9 13 
    if (ile != None && animName != "") {                                        //0026 : 07 64 00 82 77 00 10 67 F9 13 2A 16 18 0A 00 7B 01 40 60 F9 13 1F 00 16 16 
      if (!aReverse) {                                                          //003F : 07 64 00 81 2D 00 98 66 F9 13 16 
        ile.sv_StartClientSubAction();                                          //004A : 19 00 10 67 F9 13 06 00 00 1B C3 0F 00 00 16 
        mTimer = 0.00000000;                                                    //0059 : 0F 01 00 64 F9 13 1E 00 00 00 00 
      }
    }
    //1C 60 AF 32 13 00 F0 64 F9 13 00 20 66 F9 13 2D 00 98 66 F9 13 16 0F 00 10 67 F9 13 2E F8 C7 5C 
    //01 00 F0 64 F9 13 07 64 00 82 77 00 10 67 F9 13 2A 16 18 0A 00 7B 01 40 60 F9 13 1F 00 16 16 07 
    //64 00 81 2D 00 98 66 F9 13 16 19 00 10 67 F9 13 06 00 00 1B C3 0F 00 00 16 0F 01 00 64 F9 13 1E 
    //00 00 00 00 04 0B 47 
  }



