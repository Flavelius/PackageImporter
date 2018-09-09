//==============================================================================
//  QT_Talk
//==============================================================================

class QT_Talk extends Quest_Target
    native
    collapsecategories
    editinlinenew
    dependsOn(NPC_Type,Class,StringReferences)
  ;

  var (Talk) const export editinline NPC_Type Person;
  var (Talk) const export editconst editinline Conversation_Topic Topic;


  protected final native function NPC_Type GetTarget();


  event string GetActiveText(Game_ActiveTextItem aItem) {
    local export editinline NPC_Type t;
    if (aItem.Tag == "T") {                                                     //0000 : 07 5C 00 7A 19 00 30 03 FB 13 05 00 00 01 08 9B 18 11 1F 54 00 16 
      t = GetTarget();                                                          //0016 : 0F 00 68 04 FB 13 1C 78 00 FB 13 16 
      if (t != None) {                                                          //0022 : 07 4E 00 77 00 68 04 FB 13 2A 16 
        return t.GetActiveText(aItem.SubItem);                                  //002D : 04 19 00 68 04 FB 13 14 00 00 1B 60 05 00 00 19 00 30 03 FB 13 05 00 04 01 20 9D 18 11 16 
      } else {                                                                  //004B : 06 59 00 
        return "?Target?";                                                      //004E : 04 1F 3F 54 61 72 67 65 74 3F 00 
      }
    } else {                                                                    //0059 : 06 68 00 
      return Super.GetActiveText(aItem);                                        //005C : 04 1C 18 CF 2F 11 00 30 03 FB 13 16 
    }
    //07 5C 00 7A 19 00 30 03 FB 13 05 00 00 01 08 9B 18 11 1F 54 00 16 0F 00 68 04 FB 13 1C 78 00 FB 
    //13 16 07 4E 00 77 00 68 04 FB 13 2A 16 04 19 00 68 04 FB 13 14 00 00 1B 60 05 00 00 19 00 30 03 
    //FB 13 05 00 04 01 20 9D 18 11 16 06 59 00 04 1F 3F 54 61 72 67 65 74 3F 00 06 68 00 04 1C 18 CF 
    //2F 11 00 30 03 FB 13 16 04 0B 47 
  }


  protected function string GetDefaultDescription() {
    return Class'StringReferences'.default.QT_TalkText.Text;                    //0000 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 30 21 1C 11 
    //04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 30 21 1C 11 04 0B 47 
  }



