//==============================================================================
//  CT_Greeting
//==============================================================================

class CT_Greeting extends Conversation_Topic
    native
    dependsOn()
  ;

  var LocalizedString DefaultText;


  function string GetText() {
    if (Len(TopicText.Text) != 0) {                                             //0000 : 07 1C 00 9B 7D 36 58 C6 6B 0F 01 60 B7 24 11 16 25 16 
      return Super.GetText();                                                   //0012 : 04 1C E0 B3 24 11 16 
    } else {                                                                    //0019 : 06 27 00 
      return DefaultText.Text;                                                  //001C : 04 36 58 C6 6B 0F 01 D8 4B FB 13 
    }
    //07 1C 00 9B 7D 36 58 C6 6B 0F 01 60 B7 24 11 16 25 16 04 1C E0 B3 24 11 16 06 27 00 04 36 58 C6 
    //6B 0F 01 D8 4B FB 13 04 0B 47 
  }



