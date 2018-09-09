//==============================================================================
//  FSkill_EffectClass_Duff
//==============================================================================

class FSkill_EffectClass_Duff extends FSkill_EffectClass
    native
    abstract
    dependsOn()
  ;

  struct DuffRestoreData {
      var Game_Pawn Pawn;
      var float Value;
      var float Value2;
      var int InstallID;
      var int InstallID2;

  };


  var (XCombo) float ComboEffectDuration;


  final native function Undo(export editinline FSkill_Event_Duff aEvent,const out DuffRestoreData aRestoreData);


  final native function Apply(export editinline FSkill_Event_Duff aEvent,Game_Pawn aTarget,out array<DuffRestoreData> outHistory,float aAltBaseValue,export editinline FSkill_Event_FX aPerTargetFX);



