//==============================================================================
//  Interaction_EffectOn
//==============================================================================

class Interaction_EffectOn extends Interaction_Component
    native
    collapsecategories
    editinlinenew
    dependsOn(InteractiveLevelElement)
  ;

  var (Interaction_EffectOn) name EffectTag;
  var (Interaction_EffectOn) editinline array<FSkill_EffectClass_AudioVisual> Effects;


  function ClOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local InteractiveLevelElement ile;
    local int ei;
    Super.ClOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 78 A8 32 13 00 E0 01 F9 13 00 58 02 F9 13 2D 00 D0 02 F9 13 16 
    ile = InteractiveLevelElement(aOwner);                                      //0016 : 0F 00 48 03 F9 13 2E F8 C7 5C 01 00 E0 01 F9 13 
    if (ile != None) {                                                          //0026 : 07 A4 00 77 00 48 03 F9 13 2A 16 
      if (!aReverse) {                                                          //0031 : 07 90 00 81 2D 00 D0 02 F9 13 16 
        ei = 0;                                                                 //003C : 0F 00 C0 03 F9 13 25 
        while (ei < Effects.Length) {                                           //0043 : 07 8D 00 96 00 C0 03 F9 13 37 01 38 04 F9 13 16 
          if (Effects[ei] != None) {                                            //0053 : 07 83 00 77 10 00 C0 03 F9 13 01 38 04 F9 13 2A 16 
            ile.cl_StartTaggedEffect(EffectTag,Effects[ei]);                    //0064 : 19 00 48 03 F9 13 16 00 00 1B 66 10 00 00 01 B0 04 F9 13 10 00 C0 03 F9 13 01 38 04 F9 13 16 
          }
          ei++;                                                                 //0083 : A5 00 C0 03 F9 13 16 
        }
      } else {                                                                  //008D : 06 A4 00 
        ile.cl_StopTaggedEffects(EffectTag);                                    //0090 : 19 00 48 03 F9 13 0B 00 00 1B F7 0F 00 00 01 B0 04 F9 13 16 
      }
    }
    //1C 78 A8 32 13 00 E0 01 F9 13 00 58 02 F9 13 2D 00 D0 02 F9 13 16 0F 00 48 03 F9 13 2E F8 C7 5C 
    //01 00 E0 01 F9 13 07 A4 00 77 00 48 03 F9 13 2A 16 07 90 00 81 2D 00 D0 02 F9 13 16 0F 00 C0 03 
    //F9 13 25 07 8D 00 96 00 C0 03 F9 13 37 01 38 04 F9 13 16 07 83 00 77 10 00 C0 03 F9 13 01 38 04 
    //F9 13 2A 16 19 00 48 03 F9 13 16 00 00 1B 66 10 00 00 01 B0 04 F9 13 10 00 C0 03 F9 13 01 38 04 
    //F9 13 16 A5 00 C0 03 F9 13 16 06 43 00 06 A4 00 19 00 48 03 F9 13 0B 00 00 1B F7 0F 00 00 01 B0 
    //04 F9 13 16 04 0B 47 
  }


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local InteractiveLevelElement ile;
    Super.SvOnStart(aOwner,aInstigator);                                        //0000 : 1C 60 AF 32 13 00 28 05 F9 13 00 20 06 F9 13 16 
    ile = InteractiveLevelElement(aOwner);                                      //0010 : 0F 00 98 06 F9 13 2E F8 C7 5C 01 00 28 05 F9 13 
    if (ile != None) {                                                          //0020 : 07 3A 00 77 00 98 06 F9 13 2A 16 
      ile.sv_StartClientSubAction();                                            //002B : 19 00 98 06 F9 13 06 00 00 1B C3 0F 00 00 16 
    }
    //1C 60 AF 32 13 00 28 05 F9 13 00 20 06 F9 13 16 0F 00 98 06 F9 13 2E F8 C7 5C 01 00 28 05 F9 13 
    //07 3A 00 77 00 98 06 F9 13 2A 16 19 00 98 06 F9 13 06 00 00 1B C3 0F 00 00 16 04 0B 47 
  }



