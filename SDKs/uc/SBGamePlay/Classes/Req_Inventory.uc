//==============================================================================
//  Req_Inventory
//==============================================================================

class Req_Inventory extends Content_Requirement
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (Requirement) const export editinline Item_Type Item;
  var (Requirement) const int Amount;
  var (Requirement) const byte Operator;



