//==============================================================================
//  FSkill_EffectClass
//==============================================================================

class FSkill_EffectClass extends Content_Type
    native
    abstract
    dependsOn()
  ;

  var transient int mhasskillpower_vtbl;
  var transient int mhasskillpower_data;
  var (Group) const editconst byte Category;
  var (aI) const float Aggro;


  native function float sv_GetAggroValue(Game_Pawn aPawn,float aValue);


  native event cl_CombatLogMessage(string aPrefixFormatString,string aMessageFormatString,export editinline FSkill_Type aSkill,export editinline FSkill_Event_Duff aDuffEvent,Game_Pawn aSource,Game_Pawn aTarget,int aAmount1,int aAmount2,int aAmount3);


  event cl_CombatMessage(export editinline FSkill_Type aSkill,export editinline FSkill_Event_Duff aDuffEvent,Game_Pawn aSource,Game_Pawn aTarget,int aAmount,int aAmount2,int aAmount3) {
    //04 0B 47 
  }



