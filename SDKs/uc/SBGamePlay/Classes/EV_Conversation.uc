//==============================================================================
//  EV_Conversation
//==============================================================================

class EV_Conversation extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Conversation_Topic,Game_Controller,Game_Conversation)
  ;

  var (Action) const export editinline Conversation_Topic Conversation;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    local Game_Controller cont;
    local export editinline Conversation_Node Start;
    cont = Game_Controller(aObject.Controller);                                 //0000 : 0F 00 B8 14 00 14 2E 10 0E 5B 01 19 00 90 13 00 14 05 00 04 01 00 6E 6C 0F 
    Start = Conversation.CheckConversation(aObject,aSubject);                   //0019 : 0F 00 30 15 00 14 19 01 A8 15 00 14 10 00 04 1C 90 B1 24 11 00 90 13 00 14 00 20 16 00 14 16 
    cont.ConversationControl.Converse(aSubject,Conversation,Start);             //0038 : 19 19 00 B8 14 00 14 05 00 04 01 C8 07 1B 11 15 00 00 1B 8D 0F 00 00 00 20 16 00 14 01 A8 15 00 14 00 30 15 00 14 16 
    //0F 00 B8 14 00 14 2E 10 0E 5B 01 19 00 90 13 00 14 05 00 04 01 00 6E 6C 0F 0F 00 30 15 00 14 19 
    //01 A8 15 00 14 10 00 04 1C 90 B1 24 11 00 90 13 00 14 00 20 16 00 14 16 19 19 00 B8 14 00 14 05 
    //00 04 01 C8 07 1B 11 15 00 00 1B 8D 0F 00 00 00 20 16 00 14 01 A8 15 00 14 00 30 15 00 14 16 04 
    //0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    local Game_Controller cont;
    local export editinline Conversation_Node Start;
    cont = Game_Controller(aObject.Controller);                                 //0000 : 0F 00 D8 17 00 14 2E 10 0E 5B 01 19 00 98 16 00 14 05 00 04 01 00 6E 6C 0F 
    if (cont != None) {                                                         //0019 : 07 70 00 77 00 D8 17 00 14 2A 16 
      if (cont.ConversationControl.CanConverse(aSubject)) {                     //0024 : 07 70 00 19 19 00 D8 17 00 14 05 00 04 01 C8 07 1B 11 0B 00 04 1C 68 4D 25 11 00 50 18 00 14 16 
        Start = Conversation.CheckConversation(aObject,aSubject);               //0044 : 0F 00 C8 18 00 14 19 01 A8 15 00 14 10 00 04 1C 90 B1 24 11 00 98 16 00 14 00 50 18 00 14 16 
        if (Start != None) {                                                    //0063 : 07 70 00 77 00 C8 18 00 14 2A 16 
          return True;                                                          //006E : 04 27 
        }
      }
    }
    return False;                                                               //0070 : 04 28 
    //0F 00 D8 17 00 14 2E 10 0E 5B 01 19 00 98 16 00 14 05 00 04 01 00 6E 6C 0F 07 70 00 77 00 D8 17 
    //00 14 2A 16 07 70 00 19 19 00 D8 17 00 14 05 00 04 01 C8 07 1B 11 0B 00 04 1C 68 4D 25 11 00 50 
    //18 00 14 16 0F 00 C8 18 00 14 19 01 A8 15 00 14 10 00 04 1C 90 B1 24 11 00 98 16 00 14 00 50 18 
    //00 14 16 07 70 00 77 00 C8 18 00 14 2A 16 04 27 04 28 04 0B 47 
  }



