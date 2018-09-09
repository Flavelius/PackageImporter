//==============================================================================
//  QR_Item
//==============================================================================

class QR_Item extends Quest_Reward
    native
    collapsecategories
    editinlinenew
    dependsOn(Content_Inventory)
  ;

  var (reward) Content_Inventory RewardItems;


  function string GetText() {
    return RewardItems.Description();                                           //0000 : 04 19 01 30 5A 33 19 06 00 00 1B 56 05 00 00 16 
    //04 19 01 30 5A 33 19 06 00 00 1B 56 05 00 00 16 04 0B 47 
  }



