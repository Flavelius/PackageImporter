//==============================================================================
//  NPC_ClassSet
//==============================================================================

class NPC_ClassSet extends Object
    native
    dependsOn()
  ;

  var array<NPC_Type> mClasses;


  static native function NPC_ClassSet InitClassSet(export editinline NPC_Taxonomy aFaction);



