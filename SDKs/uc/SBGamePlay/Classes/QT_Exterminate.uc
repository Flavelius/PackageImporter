//==============================================================================
//  QT_Exterminate
//==============================================================================

class QT_Exterminate extends Quest_Target
    native
    collapsecategories
    editinlinenew
    dependsOn(NPC_Taxonomy,Class,StringReferences)
  ;

  var (Kill) const export editinline NPC_Taxonomy Target;
  var (Kill) const editinline int KillAmount;


  event string GetActiveText(Game_ActiveTextItem aItem) {
    if (aItem.Tag == "T") {                                                     //0000 : 07 50 00 7A 19 00 98 27 33 19 05 00 00 01 08 9B 18 11 1F 54 00 16 
      if (Target != None) {                                                     //0016 : 07 42 00 77 01 F0 28 33 19 2A 16 
        return Target.GetActiveText(aItem.SubItem);                             //0021 : 04 19 01 F0 28 33 19 14 00 00 1B 60 05 00 00 19 00 98 27 33 19 05 00 04 01 20 9D 18 11 16 
      } else {                                                                  //003F : 06 4D 00 
        return "?Target?";                                                      //0042 : 04 1F 3F 54 61 72 67 65 74 3F 00 
      }
    } else {                                                                    //004D : 06 81 00 
      if (aItem.Tag == "Q") {                                                   //0050 : 07 75 00 7A 19 00 98 27 33 19 05 00 00 01 08 9B 18 11 1F 51 00 16 
        return "" @ string(KillAmount);                                         //0066 : 04 A8 1F 00 39 53 01 68 29 33 19 16 
      } else {                                                                  //0072 : 06 81 00 
        return Super.GetActiveText(aItem);                                      //0075 : 04 1C 18 CF 2F 11 00 98 27 33 19 16 
      }
    }
    //07 50 00 7A 19 00 98 27 33 19 05 00 00 01 08 9B 18 11 1F 54 00 16 07 42 00 77 01 F0 28 33 19 2A 
    //16 04 19 01 F0 28 33 19 14 00 00 1B 60 05 00 00 19 00 98 27 33 19 05 00 04 01 20 9D 18 11 16 06 
    //4D 00 04 1F 3F 54 61 72 67 65 74 3F 00 06 81 00 07 75 00 7A 19 00 98 27 33 19 05 00 00 01 08 9B 
    //18 11 1F 51 00 16 04 A8 1F 00 39 53 01 68 29 33 19 16 06 81 00 04 1C 18 CF 2F 11 00 98 27 33 19 
    //16 04 0B 47 
  }


  protected function AppendProgressText(out string aDescription,int aProgress) {
    if (KillAmount > 1) {                                                       //0000 : 07 22 00 97 01 68 29 33 19 26 16 
    }
    //07 22 00 97 01 68 29 33 19 26 16 0E 61 43 00 08 2B 33 19 70 39 53 00 E0 2B 33 19 1F 2F 25 51 00 
    //16 16 04 0B 47 
  }


  protected function string GetDefaultDescription() {
    return Class'StringReferences'.default.QT_ExterminateText.Text;             //0000 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 80 1C 1C 11 
    //04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 80 1C 1C 11 04 0B 47 
  }



