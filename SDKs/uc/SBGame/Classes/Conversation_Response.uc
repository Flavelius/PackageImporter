//==============================================================================
//  Conversation_Response
//==============================================================================

class Conversation_Response extends Content_Type
    native
    collapsecategories
    editinlinenew
    dependsOn(Conversation_Node,Content_Event,Content_Requirement)
  ;

  var (Text) LocalizedString Text;
  var (Results) editinline array<Conversation_Node> Conversations;
  var (Requirements) editinline array<Content_Requirement> Requirements;
  var (Events) editinline array<Content_Event> Events;
  var (Text) int ButtonImage;


  function Conversation_Node sv_SelectConversation(export editinline Conversation_Topic aTopic,Game_Pawn aSpeaker,Game_Pawn aPartner) {
    local export editinline Conversation_Node Node;
    local int convI;
    convI = 0;                                                                  //0000 : 0F 00 80 38 38 11 25 
    while (convI < Conversations.Length) {                                      //0007 : 07 59 00 96 00 80 38 38 11 37 01 F8 38 38 11 16 
      Node = Conversations[convI];                                              //0017 : 0F 00 70 39 38 11 10 00 80 38 38 11 01 F8 38 38 11 
      if (Node.CheckNode(aTopic,aSpeaker,aPartner)) {                           //0028 : 07 4F 00 19 00 70 39 38 11 15 00 04 1C 30 5E 30 11 00 58 37 38 11 00 E8 39 38 11 00 60 3A 38 11 16 
        return Node;                                                            //0049 : 04 00 70 39 38 11 
      }
      convI++;                                                                  //004F : A5 00 80 38 38 11 16 
    }
    return None;                                                                //0059 : 04 2A 
    //0F 00 80 38 38 11 25 07 59 00 96 00 80 38 38 11 37 01 F8 38 38 11 16 0F 00 70 39 38 11 10 00 80 
    //38 38 11 01 F8 38 38 11 07 4F 00 19 00 70 39 38 11 15 00 04 1C 30 5E 30 11 00 58 37 38 11 00 E8 
    //39 38 11 00 60 3A 38 11 16 04 00 70 39 38 11 A5 00 80 38 38 11 16 06 07 00 04 2A 04 0B 47 
  }


  event bool sv_OnResponse(Game_Pawn aSpeaker,Game_Pawn aPartner) {
    local int eventI;
    eventI = 0;                                                                 //0000 : 0F 00 78 3C 38 11 25 
    while (eventI < Events.Length) {                                            //0007 : 07 5A 00 96 00 78 3C 38 11 37 01 F0 3C 38 11 16 
      if (Events[eventI] != None
        && !Events[eventI].sv_CanExecute(aSpeaker,aPartner)) {//0017 : 07 50 00 82 77 10 00 78 3C 38 11 01 F0 3C 38 11 2A 16 18 22 00 81 19 10 00 78 3C 38 11 01 F0 3C 38 11 10 00 04 1B 22 0C 00 00 00 00 3C 38 11 00 68 3D 38 11 16 16 16 
        return False;                                                           //004E : 04 28 
      }
      eventI++;                                                                 //0050 : A5 00 78 3C 38 11 16 
    }
    eventI = 0;                                                                 //005A : 0F 00 78 3C 38 11 25 
    while (eventI < Events.Length) {                                            //0061 : 07 9A 00 96 00 78 3C 38 11 37 01 F0 3C 38 11 16 
      Events[eventI].sv_Execute(aSpeaker,aPartner);                             //0071 : 19 10 00 78 3C 38 11 01 F0 3C 38 11 10 00 00 1B 23 0C 00 00 00 00 3C 38 11 00 68 3D 38 11 16 
      eventI++;                                                                 //0090 : A5 00 78 3C 38 11 16 
    }
    return True;                                                                //009A : 04 27 
    //0F 00 78 3C 38 11 25 07 5A 00 96 00 78 3C 38 11 37 01 F0 3C 38 11 16 07 50 00 82 77 10 00 78 3C 
    //38 11 01 F0 3C 38 11 2A 16 18 22 00 81 19 10 00 78 3C 38 11 01 F0 3C 38 11 10 00 04 1B 22 0C 00 
    //00 00 00 3C 38 11 00 68 3D 38 11 16 16 16 04 28 A5 00 78 3C 38 11 16 06 07 00 0F 00 78 3C 38 11 
    //25 07 9A 00 96 00 78 3C 38 11 37 01 F0 3C 38 11 16 19 10 00 78 3C 38 11 01 F0 3C 38 11 10 00 00 
    //1B 23 0C 00 00 00 00 3C 38 11 00 68 3D 38 11 16 A5 00 78 3C 38 11 16 06 61 00 04 27 04 0B 47 
  }


  function string GetText() {
    if (Len(Text.Text) > 0) {                                                   //0000 : 07 20 00 97 7D 36 58 C6 6B 0F 01 F0 3F 38 11 16 25 16 
      return Text.Text;                                                         //0012 : 04 36 58 C6 6B 0F 01 F0 3F 38 11 
    } else {                                                                    //001D : 06 31 00 
      return "Empty Response";                                                  //0020 : 04 1F 45 6D 70 74 79 20 52 65 73 70 6F 6E 73 65 00 
    }
    //07 20 00 97 7D 36 58 C6 6B 0F 01 F0 3F 38 11 16 25 16 04 36 58 C6 6B 0F 01 F0 3F 38 11 06 31 00 
    //04 1F 45 6D 70 74 79 20 52 65 73 70 6F 6E 73 65 00 04 0B 47 
  }


  event bool sv_Check(export editinline Conversation_Topic aTopic,Game_Pawn aSpeaker,Game_Pawn aPartner) {
    local int reqI;
    reqI = 0;                                                                   //0000 : 0F 00 E0 40 38 11 25 
    while (reqI < Requirements.Length) {                                        //0007 : 07 55 00 96 00 E0 40 38 11 37 01 58 41 38 11 16 
      if (Requirements[reqI] != None
        && !Requirements[reqI].CheckPawn(aSpeaker)) {//0017 : 07 4B 00 82 77 10 00 E0 40 38 11 01 58 41 38 11 2A 16 18 1D 00 81 19 10 00 E0 40 38 11 01 58 41 38 11 0B 00 04 1C 90 E6 2B 11 00 D0 41 38 11 16 16 16 
        return False;                                                           //0049 : 04 28 
      }
      reqI++;                                                                   //004B : A5 00 E0 40 38 11 16 
    }
    return True;                                                                //0055 : 04 27 
    //0F 00 E0 40 38 11 25 07 55 00 96 00 E0 40 38 11 37 01 58 41 38 11 16 07 4B 00 82 77 10 00 E0 40 
    //38 11 01 58 41 38 11 2A 16 18 1D 00 81 19 10 00 E0 40 38 11 01 58 41 38 11 0B 00 04 1C 90 E6 2B 
    //11 00 D0 41 38 11 16 16 16 04 28 A5 00 E0 40 38 11 16 06 07 00 04 27 04 0B 47 
  }



