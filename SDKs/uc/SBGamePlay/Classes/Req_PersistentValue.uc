//==============================================================================
//  Req_PersistentValue
//==============================================================================

class Req_PersistentValue extends Content_Requirement
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var export editinline Content_Type context;
  var (Requirement) int VariableID;
  var (Requirement) int Value;
  var (Requirement) const byte Operator;


  function bool ApiTracing() {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }



