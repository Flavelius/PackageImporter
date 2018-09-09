//==============================================================================
//  QT_Subquest
//==============================================================================

class QT_Subquest extends Quest_Target
    native
    collapsecategories
    editinlinenew
    dependsOn(Class,StringReferences)
  ;

  var export editinline Quest_Type SubQuest;


  event string GetActiveText(Game_ActiveTextItem aItem) {
    if (aItem.Tag == "T") {                                                     //0000 : 07 4F 00 7A 19 00 58 69 32 19 05 00 00 01 08 9B 18 11 1F 54 00 16 
      if (SubQuest != None) {                                                   //0016 : 07 42 00 77 01 80 6A 32 19 2A 16 
        return SubQuest.GetActiveText(aItem.SubItem);                           //0021 : 04 19 01 80 6A 32 19 14 00 00 1B 60 05 00 00 19 00 58 69 32 19 05 00 04 01 20 9D 18 11 16 
      } else {                                                                  //003F : 06 4C 00 
        return "?Quest?";                                                       //0042 : 04 1F 3F 51 75 65 73 74 3F 00 
      }
    } else {                                                                    //004C : 06 5B 00 
      return Super.GetActiveText(aItem);                                        //004F : 04 1C 18 CF 2F 11 00 58 69 32 19 16 
    }
    //07 4F 00 7A 19 00 58 69 32 19 05 00 00 01 08 9B 18 11 1F 54 00 16 07 42 00 77 01 80 6A 32 19 2A 
    //16 04 19 01 80 6A 32 19 14 00 00 1B 60 05 00 00 19 00 58 69 32 19 05 00 04 01 20 9D 18 11 16 06 
    //4C 00 04 1F 3F 51 75 65 73 74 3F 00 06 5B 00 04 1C 18 CF 2F 11 00 58 69 32 19 16 04 0B 47 
  }


  protected function string GetDefaultDescription() {
    return Class'StringReferences'.default.QT_SubQuestText.Text;                //0000 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 40 20 1C 11 
    //04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 40 20 1C 11 04 0B 47 
  }



