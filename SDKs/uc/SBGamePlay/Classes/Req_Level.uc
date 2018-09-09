//==============================================================================
//  Req_Level
//==============================================================================

class Req_Level extends Content_Requirement
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (Requirement) const int RequiredLevel;
  var (Requirement) const byte Operator;


  event string ToString() {
    return "L" $ OperatorToString(Operator)
      $ string(RequiredLevel);      //0000 : 04 70 70 1F 4C 00 1B FC 0F 00 00 01 88 D8 F9 13 16 16 39 53 01 98 D7 F9 13 16 
    //04 70 70 1F 4C 00 1B FC 0F 00 00 01 88 D8 F9 13 16 16 39 53 01 98 D7 F9 13 16 04 0B 47 
  }



