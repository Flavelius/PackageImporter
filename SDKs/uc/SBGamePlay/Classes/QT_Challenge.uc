//==============================================================================
//  QT_Challenge
//==============================================================================

class QT_Challenge extends Quest_Target
    native
    collapsecategories
    editinlinenew
    dependsOn(Item_Type)
  ;

  var (Challenge) int TargetWorld;
  var (Challenge) name CompletionTag;
  var (Challenge) name FailureTag;
  var (Challenge) export editinline Item_Type Pass;


  event string GetActiveText(Game_ActiveTextItem aItem) {
    if (aItem.Tag == "O") {                                                     //0000 : 07 50 00 7A 19 00 58 18 33 19 05 00 00 01 08 9B 18 11 1F 4F 00 16 
      if (Pass != None) {                                                       //0016 : 07 42 00 77 01 80 19 33 19 2A 16 
        return Pass.GetActiveText(aItem.SubItem);                               //0021 : 04 19 01 80 19 33 19 14 00 00 1B 60 05 00 00 19 00 58 18 33 19 05 00 04 01 20 9D 18 11 16 
      } else {                                                                  //003F : 06 4D 00 
        return "?Object?";                                                      //0042 : 04 1F 3F 4F 62 6A 65 63 74 3F 00 
      }
    } else {                                                                    //004D : 06 5C 00 
      return Super.GetActiveText(aItem);                                        //0050 : 04 1C 18 CF 2F 11 00 58 18 33 19 16 
    }
    //07 50 00 7A 19 00 58 18 33 19 05 00 00 01 08 9B 18 11 1F 4F 00 16 07 42 00 77 01 80 19 33 19 2A 
    //16 04 19 01 80 19 33 19 14 00 00 1B 60 05 00 00 19 00 58 18 33 19 05 00 04 01 20 9D 18 11 16 06 
    //4D 00 04 1F 3F 4F 62 6A 65 63 74 3F 00 06 5C 00 04 1C 18 CF 2F 11 00 58 18 33 19 16 04 0B 47 
  }



