//==============================================================================
//  Req_QuestFinished
//==============================================================================

class Req_QuestFinished extends Content_Requirement
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (Requirement) const export editinline Quest_Type RequiredQuest;
  var (Requirement) const int TimesFinished;



