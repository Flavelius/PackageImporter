//==============================================================================
//  CT_Target
//==============================================================================

class CT_Target extends Conversation_Topic
    native
    dependsOn(Object,Quest_Type)
  ;


  function Content_Type GetContext() {
    return Quest_Type(Outer.Outer);                                             //0000 : 04 2E F0 9D 5C 01 19 01 00 E4 6B 0F 05 00 04 01 00 E4 6B 0F 
    //04 2E F0 9D 5C 01 19 01 00 E4 6B 0F 05 00 04 01 00 E4 6B 0F 04 0B 47 
  }


  function string GetText() {
    local export editinline Quest_Type quest;
    quest = Quest_Type(GetContext());                                           //0000 : 0F 00 88 FF F9 13 2E F0 9D 5C 01 1B D5 0F 00 00 16 
    if (Len(TopicText.Text) != 0) {                                             //0011 : 07 2D 00 9B 7D 36 58 C6 6B 0F 01 60 B7 24 11 16 25 16 
      return Super.GetText();                                                   //0023 : 04 1C E0 B3 24 11 16 
    } else {                                                                    //002A : 06 3D 00 
      return quest.GetName();                                                   //002D : 04 19 00 88 FF F9 13 06 00 00 1B F9 03 00 00 16 
    }
    //0F 00 88 FF F9 13 2E F0 9D 5C 01 1B D5 0F 00 00 16 07 2D 00 9B 7D 36 58 C6 6B 0F 01 60 B7 24 11 
    //16 25 16 04 1C E0 B3 24 11 16 06 3D 00 04 19 00 88 FF F9 13 06 00 00 1B F9 03 00 00 16 04 0B 47 
    //
  }



