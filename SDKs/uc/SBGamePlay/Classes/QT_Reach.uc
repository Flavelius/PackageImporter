//==============================================================================
//  QT_Reach
//==============================================================================

class QT_Reach extends Quest_Target
    native
    collapsecategories
    editinlinenew
    dependsOn(Class,StringReferences)
  ;

  var (Reach) name GoalTag;
  var (Reach) LocalizedString GoalDescription;


  event string GetActiveText(Game_ActiveTextItem aItem) {
    if (aItem.Tag == "T") {                                                     //0000 : 07 24 00 7A 19 00 F8 21 33 19 05 00 00 01 08 9B 18 11 1F 54 00 16 
      return GoalDescription.Text;                                              //0016 : 04 36 58 C6 6B 0F 01 70 22 33 19 
    } else {                                                                    //0021 : 06 30 00 
      return Super.GetActiveText(aItem);                                        //0024 : 04 1C 18 CF 2F 11 00 F8 21 33 19 16 
    }
    //07 24 00 7A 19 00 F8 21 33 19 05 00 00 01 08 9B 18 11 1F 54 00 16 04 36 58 C6 6B 0F 01 70 22 33 
    //19 06 30 00 04 1C 18 CF 2F 11 00 F8 21 33 19 16 04 0B 47 
  }


  protected function string GetDefaultDescription() {
    return Class'StringReferences'.default.QT_ReachText.Text;                   //0000 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 C8 1F 1C 11 
    //04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 C8 1F 1C 11 04 0B 47 
  }



