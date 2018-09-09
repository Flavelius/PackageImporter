//==============================================================================
//  QR_Money
//==============================================================================

class QR_Money extends Quest_Reward
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (reward) int Money;


  function string GetText() {
    return GetMoneyText(Money);                                                 //0000 : 04 1B 6D 10 00 00 01 08 58 33 19 16 
    //04 1B 6D 10 00 00 01 08 58 33 19 16 04 0B 47 
  }



