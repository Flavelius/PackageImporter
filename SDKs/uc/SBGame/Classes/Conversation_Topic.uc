//==============================================================================
//  Conversation_Topic
//==============================================================================

class Conversation_Topic extends Content_Type
    native
    abstract
    dependsOn(Game_Pawn,Game_Controller,Game_Conversation,Content_Event)
  ;

  enum EConversationType {
    ECT_None ,
    ECT_Free ,
    ECT_Greeting ,
    ECT_Provide ,
    ECT_Mid ,
    ECT_Finish ,
    ECT_Talk ,
    ECT_LastWords ,
    ECT_Victory ,
    ECT_Thanks ,
    ECT_Deliver 
  };

  var (Type) byte TopicType;
  var (Conversation) editinline array<Conversation_Node> Conversations;
  var (Conversation) LocalizedString TopicText;
  var (Conversation) int ButtonImage;
  var (Requirements) int Priority;
  var (Requirements) array<Content_Requirement> Requirements;
  var (Requirements) string ScriptReference;
  var (Requirements) bool AvailableTopic;
  var (Requirements) bool PublicTopic;
  var (Events) editinline array<Content_Event> Events;
  var (Banner) byte Emote;
  var (Banner) LocalizedString Chat;
  var (Banner) Texture Icon;
  var (Banner) Sound Speech;
  var (Banner) class<Emitter> EmitterClass;
  var (Banner) float BannerTime;
  var (Minimap) float MinimapRange;


  function Content_Type GetContext() {
    return None;                                                                //0000 : 04 2A 
    //04 2A 04 0B 47 
  }


  function bool sv_FilterTopic(export editinline Conversation_Topic aOther) {
    if (aOther == self) {                                                       //0000 : 07 0D 00 72 00 38 A4 24 11 17 16 
      return False;                                                             //000B : 04 28 
    }
    if (!aOther.PublicTopic) {                                                  //000D : 07 23 00 81 19 00 38 A4 24 11 06 00 04 2D 01 10 A5 24 11 16 
      return False;                                                             //0021 : 04 28 
    }
    return True;                                                                //0023 : 04 27 
    //07 0D 00 72 00 38 A4 24 11 17 16 04 28 07 23 00 81 19 00 38 A4 24 11 06 00 04 2D 01 10 A5 24 11 
    //16 04 28 04 27 04 0B 47 
  }


  function sv_Start(Game_Pawn aSpeaker,Game_Pawn aPartner) {
    local export editinline Conversation_Node bestConv;
    sv_OnStart(aSpeaker,aPartner);                                              //0000 : 1B 24 07 00 00 00 B0 A6 24 11 00 E0 A7 24 11 16 
    bestConv = GetConversationNode(aSpeaker,aPartner);                          //0010 : 0F 00 58 A8 24 11 1C D0 A8 24 11 00 B0 A6 24 11 00 E0 A7 24 11 16 
    if (bestConv != None) {                                                     //0026 : 07 65 00 77 00 58 A8 24 11 2A 16 
      Game_Controller(aSpeaker.Controller).ConversationControl.Converse(aPartner,self,bestConv);//0031 : 19 19 2E 10 0E 5B 01 19 00 B0 A6 24 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 11 00 00 1B 8D 0F 00 00 00 E0 A7 24 11 17 00 58 A8 24 11 16 
      goto jl0065;                                                              //0062 : 06 65 00 
    }
    //1B 24 07 00 00 00 B0 A6 24 11 00 E0 A7 24 11 16 0F 00 58 A8 24 11 1C D0 A8 24 11 00 B0 A6 24 11 
    //00 E0 A7 24 11 16 07 65 00 77 00 58 A8 24 11 2A 16 19 19 2E 10 0E 5B 01 19 00 B0 A6 24 11 05 00 
    //04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 11 00 00 1B 8D 0F 00 00 00 E0 A7 24 11 17 00 58 A8 24 
    //11 16 06 65 00 04 0B 47 
  }


  event bool sv_OnFinish(Game_Pawn aSpeaker,Game_Pawn aPartner) {
    local int eventI;
    eventI = 0;                                                                 //0000 : 0F 00 40 AC 24 11 25 
    while (eventI < Events.Length) {                                            //0007 : 07 5A 00 96 00 40 AC 24 11 37 01 B8 AC 24 11 16 
      if (Events[eventI] != None
        && !Events[eventI].sv_CanExecute(aSpeaker,aPartner)) {//0017 : 07 50 00 82 77 10 00 40 AC 24 11 01 B8 AC 24 11 2A 16 18 22 00 81 19 10 00 40 AC 24 11 01 B8 AC 24 11 10 00 04 1B 22 0C 00 00 00 C0 AA 24 11 00 30 AD 24 11 16 16 16 
        return False;                                                           //004E : 04 28 
      }
      eventI++;                                                                 //0050 : A5 00 40 AC 24 11 16 
    }
    eventI = 0;                                                                 //005A : 0F 00 40 AC 24 11 25 
    while (eventI < Events.Length) {                                            //0061 : 07 9A 00 96 00 40 AC 24 11 37 01 B8 AC 24 11 16 
      Events[eventI].sv_Execute(aSpeaker,aPartner);                             //0071 : 19 10 00 40 AC 24 11 01 B8 AC 24 11 10 00 00 1B 23 0C 00 00 00 C0 AA 24 11 00 30 AD 24 11 16 
      eventI++;                                                                 //0090 : A5 00 40 AC 24 11 16 
    }
    return True;                                                                //009A : 04 27 
    //0F 00 40 AC 24 11 25 07 5A 00 96 00 40 AC 24 11 37 01 B8 AC 24 11 16 07 50 00 82 77 10 00 40 AC 
    //24 11 01 B8 AC 24 11 2A 16 18 22 00 81 19 10 00 40 AC 24 11 01 B8 AC 24 11 10 00 04 1B 22 0C 00 
    //00 00 C0 AA 24 11 00 30 AD 24 11 16 16 16 04 28 A5 00 40 AC 24 11 16 06 07 00 0F 00 40 AC 24 11 
    //25 07 9A 00 96 00 40 AC 24 11 37 01 B8 AC 24 11 16 19 10 00 40 AC 24 11 01 B8 AC 24 11 10 00 00 
    //1B 23 0C 00 00 00 C0 AA 24 11 00 30 AD 24 11 16 A5 00 40 AC 24 11 16 06 61 00 04 27 04 0B 47 
  }


  event sv_OnStart(Game_Pawn aSpeaker,Game_Pawn aPartner) {
    //04 0B 47 
  }


  protected final native function bool CheckPawn(Game_Pawn aSpeaker,Game_Pawn aPartner);


  protected final native function Conversation_Node GetConversationNode(Game_Pawn aSpeaker,Game_Pawn aPartner);


  final native function Conversation_Node CheckConversation(Game_Pawn aSpeaker,Game_Pawn aPartner);


  function string GetText() {
    return TopicText.Text;                                                      //0000 : 04 36 58 C6 6B 0F 01 60 B7 24 11 
    //04 36 58 C6 6B 0F 01 60 B7 24 11 04 0B 47 
  }



