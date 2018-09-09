//==============================================================================
//  QT_Hunt
//==============================================================================

class QT_Hunt extends Quest_Target
    native
    collapsecategories
    editinlinenew
    dependsOn(NPC_Type,Class,StringReferences)
  ;

  var (Hunt) const export editinline NPC_Type Target;
  var (Hunt) const int Amount;


  event string GetActiveText(Game_ActiveTextItem aItem) {
    if (aItem.Tag == "T") {                                                     //0000 : 07 37 00 7A 19 00 18 46 33 19 05 00 00 01 08 9B 18 11 1F 54 00 16 
      return Target.GetActiveText(aItem.SubItem);                               //0016 : 04 19 01 50 47 33 19 14 00 00 1B 60 05 00 00 19 00 18 46 33 19 05 00 04 01 20 9D 18 11 16 
    } else {                                                                    //0034 : 06 68 00 
      if (aItem.Tag == "Q") {                                                   //0037 : 07 5C 00 7A 19 00 18 46 33 19 05 00 00 01 08 9B 18 11 1F 51 00 16 
        return "" @ string(Amount);                                             //004D : 04 A8 1F 00 39 53 01 C8 47 33 19 16 
      } else {                                                                  //0059 : 06 68 00 
        return Super.GetActiveText(aItem);                                      //005C : 04 1C 18 CF 2F 11 00 18 46 33 19 16 
      }
    }
    //07 37 00 7A 19 00 18 46 33 19 05 00 00 01 08 9B 18 11 1F 54 00 16 04 19 01 50 47 33 19 14 00 00 
    //1B 60 05 00 00 19 00 18 46 33 19 05 00 04 01 20 9D 18 11 16 06 68 00 07 5C 00 7A 19 00 18 46 33 
    //19 05 00 00 01 08 9B 18 11 1F 51 00 16 04 A8 1F 00 39 53 01 C8 47 33 19 16 06 68 00 04 1C 18 CF 
    //2F 11 00 18 46 33 19 16 04 0B 47 
  }


  protected function AppendProgressText(out string aDescription,int aProgress) {
    if (Amount > 1) {                                                           //0000 : 07 22 00 97 01 C8 47 33 19 26 16 
    }
    //07 22 00 97 01 C8 47 33 19 26 16 0E 61 43 00 68 49 33 19 70 39 53 00 40 4A 33 19 1F 2F 25 51 00 
    //16 16 04 0B 47 
  }


  protected function string GetDefaultDescription() {
    return Class'StringReferences'.default.QT_HuntText.Text;                    //0000 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 E8 1D 1C 11 
    //04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 E8 1D 1C 11 04 0B 47 
  }



