//==============================================================================
//  QR_QuestPoints
//==============================================================================

class QR_QuestPoints extends Quest_Reward
    native
    collapsecategories
    editinlinenew
    dependsOn(Class,SBGamePlayStrings)
  ;

  var (reward) const int QP;
  var (reward) const int QPFrac;


  function string GetText() {
    return string(QP)
      @ Class'SBGamePlayStrings'.default.Quest_Points.Text;//0000 : 04 A8 39 53 01 70 5C 33 19 36 58 C6 6B 0F 12 20 68 D9 92 01 05 00 0C 02 A0 6F 67 0F 16 
    //04 A8 39 53 01 70 5C 33 19 36 58 C6 6B 0F 12 20 68 D9 92 01 05 00 0C 02 A0 6F 67 0F 16 04 0B 47 
    //
  }



