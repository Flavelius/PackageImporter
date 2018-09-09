//==============================================================================
//  QT_Defeat
//==============================================================================

class QT_Defeat extends Quest_Target
    native
    collapsecategories
    editinlinenew
    dependsOn(NPC_Type,Class,StringReferences)
  ;

  var (Defeat) const export editinline NPC_Type Target;
  var (Defeat) const float DefeatFraction;
  var (Defeat) const export editinline Conversation_Topic LastWords;


  event string GetActiveText(Game_ActiveTextItem aItem) {
    if (aItem.Tag == "T") {                                                     //0000 : 07 37 00 7A 19 00 70 0E FB 13 05 00 00 01 08 9B 18 11 1F 54 00 16 
      return Target.GetActiveText(aItem.SubItem);                               //0016 : 04 19 01 70 0F FB 13 14 00 00 1B 60 05 00 00 19 00 70 0E FB 13 05 00 04 01 20 9D 18 11 16 
    } else {                                                                    //0034 : 06 43 00 
      return Super.GetActiveText(aItem);                                        //0037 : 04 1C 18 CF 2F 11 00 70 0E FB 13 16 
    }
    //07 37 00 7A 19 00 70 0E FB 13 05 00 00 01 08 9B 18 11 1F 54 00 16 04 19 01 70 0F FB 13 14 00 00 
    //1B 60 05 00 00 19 00 70 0E FB 13 05 00 04 01 20 9D 18 11 16 06 43 00 04 1C 18 CF 2F 11 00 70 0E 
    //FB 13 16 04 0B 47 
  }


  protected function string GetDefaultDescription() {
    return Class'StringReferences'.default.QT_DefeatText.Text;                  //0000 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 18 1B 1C 11 
    //04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 18 1B 1C 11 04 0B 47 
  }



