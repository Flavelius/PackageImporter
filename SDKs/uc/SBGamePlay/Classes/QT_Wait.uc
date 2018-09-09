//==============================================================================
//  QT_Wait
//==============================================================================

class QT_Wait extends Quest_Target
    native
    collapsecategories
    editinlinenew
    dependsOn(Class,StringReferences)
  ;

  var (Condition) const int Seconds;


  event string GetActiveText(Game_ActiveTextItem aItem) {
    if (aItem.Tag == "Q") {                                                     //0000 : 07 25 00 7A 19 00 F0 64 32 19 05 00 00 01 08 9B 18 11 1F 51 00 16 
      return GetTimeText(Seconds);                                              //0016 : 04 1B FA 0F 00 00 01 D8 65 32 19 16 
    } else {                                                                    //0022 : 06 31 00 
      return Super.GetActiveText(aItem);                                        //0025 : 04 1C 18 CF 2F 11 00 F0 64 32 19 16 
    }
    //07 25 00 7A 19 00 F0 64 32 19 05 00 00 01 08 9B 18 11 1F 51 00 16 04 1B FA 0F 00 00 01 D8 65 32 
    //19 16 06 31 00 04 1C 18 CF 2F 11 00 F0 64 32 19 16 04 0B 47 
  }


  protected function string GetDefaultDescription() {
    return Class'StringReferences'.default.QT_WaitText.Text;                    //0000 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 70 2E 1C 11 
    //04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 70 2E 1C 11 04 0B 47 
  }



