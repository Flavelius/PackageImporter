//==============================================================================
//  QR_Fame
//==============================================================================

class QR_Fame extends Quest_Reward
    native
    collapsecategories
    editinlinenew
    dependsOn(Class,SBGamePlayStrings)
  ;

  var (reward) const int Fame;


  function string GetText() {
    return string(Fame)
      @ Class'SBGamePlayStrings'.default.Fame.Text;     //0000 : 04 A8 39 53 01 60 5F 33 19 36 58 C6 6B 0F 12 20 68 D9 92 01 05 00 0C 02 28 6F 67 0F 16 
    //04 A8 39 53 01 60 5F 33 19 36 58 C6 6B 0F 12 20 68 D9 92 01 05 00 0C 02 28 6F 67 0F 16 04 0B 47 
    //
  }



