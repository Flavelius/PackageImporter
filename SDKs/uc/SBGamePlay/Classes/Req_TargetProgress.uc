//==============================================================================
//  Req_TargetProgress
//==============================================================================

class Req_TargetProgress extends Content_Requirement
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (Requirement) const export editinline Quest_Type quest;
  var (Requirement) const int objective;
  var (Requirement) const int Progress;
  var (Requirement) const byte Operator;



