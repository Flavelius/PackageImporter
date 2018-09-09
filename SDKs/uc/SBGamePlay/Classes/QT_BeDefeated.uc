//==============================================================================
//  QT_BeDefeated
//==============================================================================

class QT_BeDefeated extends Quest_Target
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (Defeat) const editinline array<NPC_Type> NamedTargets;
  var (Defeat) const editinline array<NPC_Taxonomy> GroupedTargets;
  var (Defeat) const export editinline Conversation_Topic VictorySpeech;
  var (Defeat) const float DefeatFraction;



