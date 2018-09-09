//==============================================================================
//  Req_PePRank
//==============================================================================

class Req_PePRank extends Content_Requirement
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (Requirement) const int RequiredPep;
  var (Requirement) const byte Operator;


  event string ToString() {
    return "P" $ OperatorToString(Operator)
      $ string(RequiredPep);        //0000 : 04 70 70 1F 50 00 1B FC 0F 00 00 01 10 CB F9 13 16 16 39 53 01 20 CA F9 13 16 
    //04 70 70 1F 50 00 1B FC 0F 00 00 01 10 CB F9 13 16 16 39 53 01 20 CA F9 13 16 04 0B 47 
  }



