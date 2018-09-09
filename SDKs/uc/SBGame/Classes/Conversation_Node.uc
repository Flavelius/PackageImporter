//==============================================================================
//  Conversation_Node
//==============================================================================

class Conversation_Node extends Content_Type
    native
    collapsecategories
    editinlinenew
    dependsOn(Content_Event)
  ;

  var (Text) LocalizedString Text;
  var (Results) editinline array<Conversation_Response> Responses;
  var (Results) bool locked;
  var (Requirements) editinline array<Content_Requirement> Requirements;
  var (Events) editinline array<Content_Event> Events;


  event bool sv_OnConversation(Game_Pawn aSpeaker,Game_Pawn aPartner) {
    local int eventI;
    eventI = 0;                                                                 //0000 : 0F 00 60 60 30 11 25 
    while (eventI < Events.Length) {                                            //0007 : 07 5A 00 96 00 60 60 30 11 37 01 D8 60 30 11 16 
      if (Events[eventI] != None
        && !Events[eventI].sv_CanExecute(aSpeaker,aPartner)) {//0017 : 07 50 00 82 77 10 00 60 60 30 11 01 D8 60 30 11 2A 16 18 22 00 81 19 10 00 60 60 30 11 01 D8 60 30 11 10 00 04 1B 22 0C 00 00 00 E0 5E 30 11 00 50 61 30 11 16 16 16 
        return False;                                                           //004E : 04 28 
      }
      eventI++;                                                                 //0050 : A5 00 60 60 30 11 16 
    }
    eventI = 0;                                                                 //005A : 0F 00 60 60 30 11 25 
    while (eventI < Events.Length) {                                            //0061 : 07 9A 00 96 00 60 60 30 11 37 01 D8 60 30 11 16 
      Events[eventI].sv_Execute(aSpeaker,aPartner);                             //0071 : 19 10 00 60 60 30 11 01 D8 60 30 11 10 00 00 1B 23 0C 00 00 00 E0 5E 30 11 00 50 61 30 11 16 
      eventI++;                                                                 //0090 : A5 00 60 60 30 11 16 
    }
    return True;                                                                //009A : 04 27 
    //0F 00 60 60 30 11 25 07 5A 00 96 00 60 60 30 11 37 01 D8 60 30 11 16 07 50 00 82 77 10 00 60 60 
    //30 11 01 D8 60 30 11 2A 16 18 22 00 81 19 10 00 60 60 30 11 01 D8 60 30 11 10 00 04 1B 22 0C 00 
    //00 00 E0 5E 30 11 00 50 61 30 11 16 16 16 04 28 A5 00 60 60 30 11 16 06 07 00 0F 00 60 60 30 11 
    //25 07 9A 00 96 00 60 60 30 11 37 01 D8 60 30 11 16 19 10 00 60 60 30 11 01 D8 60 30 11 10 00 00 
    //1B 23 0C 00 00 00 E0 5E 30 11 00 50 61 30 11 16 A5 00 60 60 30 11 16 06 61 00 04 27 04 0B 47 
  }


  final native function bool CheckNode(export editinline Conversation_Topic aTopic,Game_Pawn aSpeaker,Game_Pawn aPartner);


  function Render(export editinline Conversation_Topic aTopic,Game_Pawn aSpeaker,Game_Pawn aPartner,Object aRenderSlot) {
    //04 0B 47 
  }


  function string GetText() {
    if (Len(Text.Text) > 0) {                                                   //0000 : 07 20 00 97 7D 36 58 C6 6B 0F 01 F8 67 30 11 16 25 16 
      return Text.Text;                                                         //0012 : 04 36 58 C6 6B 0F 01 F8 67 30 11 
    } else {                                                                    //001D : 06 35 00 
      return "Empty Conversation";                                              //0020 : 04 1F 45 6D 70 74 79 20 43 6F 6E 76 65 72 73 61 74 69 6F 6E 00 
    }
    //07 20 00 97 7D 36 58 C6 6B 0F 01 F8 67 30 11 16 25 16 04 36 58 C6 6B 0F 01 F8 67 30 11 06 35 00 
    //04 1F 45 6D 70 74 79 20 43 6F 6E 76 65 72 73 61 74 69 6F 6E 00 04 0B 47 
  }



