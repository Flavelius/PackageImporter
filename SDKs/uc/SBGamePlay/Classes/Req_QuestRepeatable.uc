//==============================================================================
//  Req_QuestRepeatable
//==============================================================================

class Req_QuestRepeatable extends Content_Requirement
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (Requirement) const bool Repeatable;
  var (quest) const export editinline Quest_Type quest;



