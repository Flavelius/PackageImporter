//==============================================================================
//  Quest_Set
//==============================================================================

class Quest_Set extends Object
    native
    dependsOn()
  ;

  var array<Quest_Type> mQuests;
  var array<Quest_Type> mMailQuests;


  static native function Quest_Set GetQuestSet();


  static native function Quest_Set InitQuestSet();



