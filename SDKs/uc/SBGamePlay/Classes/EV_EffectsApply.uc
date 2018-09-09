//==============================================================================
//  EV_EffectsApply
//==============================================================================

class EV_EffectsApply extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Game_Effects)
  ;

  var (Action) const editinline array<FSkill_EffectClass_AudioVisual> Effects;
  var (Action) const bool ApplyToObject;
  var (Action) const bool ApplyToSubject;
  var (Action) const name Tag;
  var (Action) const bool SubjectEffectIsPermanent;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 60 A9 FF 13 25 
    while (i < Effects.Length) {                                                //0007 : 07 CC 00 96 00 60 A9 FF 13 37 01 D8 A9 FF 13 16 
      if (aObject != None && ApplyToObject) {                                   //0017 : 07 55 00 82 77 00 A0 A7 FF 13 2A 16 18 07 00 2D 01 50 AA FF 13 16 
        aObject.Effects.sv_StartTagged(Effects[i],Tag);                         //002D : 19 19 00 A0 A7 FF 13 05 00 04 01 48 63 34 0F 16 00 04 1C F0 EF 20 11 10 00 60 A9 FF 13 01 D8 A9 FF 13 01 C8 AA FF 13 16 
      }
      if (aSubject != None && ApplyToSubject) {                                 //0055 : 07 C2 00 82 77 00 40 AB FF 13 2A 16 18 07 00 2D 01 B8 AB FF 13 16 
        if (SubjectEffectIsPermanent) {                                         //006B : 07 9F 00 2D 01 30 AC FF 13 
          aSubject.Effects.sv_StartTagged(Effects[i],Tag);                      //0074 : 19 19 00 40 AB FF 13 05 00 04 01 48 63 34 0F 16 00 04 1C F0 EF 20 11 10 00 60 A9 FF 13 01 D8 A9 FF 13 01 C8 AA FF 13 16 
          goto jl00C2;                                                          //009C : 06 C2 00 
        }
        aSubject.Effects.sv_StartReplicatedOneShot(Effects[i]);                 //009F : 19 19 00 40 AB FF 13 05 00 04 01 48 63 34 0F 11 00 04 1C 40 EB 20 11 10 00 60 A9 FF 13 01 D8 A9 FF 13 16 
      }
      i++;                                                                      //00C2 : A5 00 60 A9 FF 13 16 
    }
    //0F 00 60 A9 FF 13 25 07 CC 00 96 00 60 A9 FF 13 37 01 D8 A9 FF 13 16 07 55 00 82 77 00 A0 A7 FF 
    //13 2A 16 18 07 00 2D 01 50 AA FF 13 16 19 19 00 A0 A7 FF 13 05 00 04 01 48 63 34 0F 16 00 04 1C 
    //F0 EF 20 11 10 00 60 A9 FF 13 01 D8 A9 FF 13 01 C8 AA FF 13 16 07 C2 00 82 77 00 40 AB FF 13 2A 
    //16 18 07 00 2D 01 B8 AB FF 13 16 07 9F 00 2D 01 30 AC FF 13 19 19 00 40 AB FF 13 05 00 04 01 48 
    //63 34 0F 16 00 04 1C F0 EF 20 11 10 00 60 A9 FF 13 01 D8 A9 FF 13 01 C8 AA FF 13 16 06 C2 00 19 
    //19 00 40 AB FF 13 05 00 04 01 48 63 34 0F 11 00 04 1C 40 EB 20 11 10 00 60 A9 FF 13 01 D8 A9 FF 
    //13 16 A5 00 60 A9 FF 13 16 06 07 00 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    return Effects.Length > 0
      && (aObject != None || aSubject != None)
      && (ApplyToObject || ApplyToSubject)
      && Tag != 'None';//0000 : 04 82 82 82 97 37 01 D8 A9 FF 13 25 16 18 16 00 84 77 00 A8 AC FF 13 2A 16 18 09 00 77 00 B8 AD FF 13 2A 16 16 16 18 12 00 84 2D 01 50 AA FF 13 18 07 00 2D 01 B8 AB FF 13 16 16 18 0D 00 FF 01 C8 AA FF 13 21 00 00 00 00 16 16 
    //04 82 82 82 97 37 01 D8 A9 FF 13 25 16 18 16 00 84 77 00 A8 AC FF 13 2A 16 18 09 00 77 00 B8 AD 
    //FF 13 2A 16 16 16 18 12 00 84 2D 01 50 AA FF 13 18 07 00 2D 01 B8 AB FF 13 16 16 18 0D 00 FF 01 
    //C8 AA FF 13 21 00 00 00 00 16 16 04 0B 47 
  }



