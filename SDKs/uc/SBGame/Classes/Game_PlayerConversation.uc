//==============================================================================
//  Game_PlayerConversation
//==============================================================================

class Game_PlayerConversation extends Game_Conversation within Game_PlayerController
    native
    exportstructs
    dependsOn(Class,SBDBSync,Game_ConversationState,Game_NPCPawn,Game_PlayerController,Game_GUI,Conversation_Topic,Conversation_Node)
  ;

  var Game_ConversationState Conversation;


  final native function cl_RefreshTopics();


  protected native function sv2cl_Banner_CallStub();


  protected event sv2cl_Banner(Game_Pawn aSource,int aTopicID) {
    local export editinline Conversation_Topic bannerTopic;
    bannerTopic = Conversation_Topic(Class'SBDBSync'.GetResourceObject(aTopicID));//0000 : 0F 00 10 95 30 11 2E 40 64 5C 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 88 95 30 11 16 
    aSource.cl_Banner(GetPawn(),bannerTopic);                                   //001F : 19 00 18 94 30 11 11 00 00 1B E8 0C 00 00 1B 2B 0C 00 00 16 00 10 95 30 11 16 
    //0F 00 10 95 30 11 2E 40 64 5C 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 88 95 30 11 16 19 
    //00 18 94 30 11 11 00 00 1B E8 0C 00 00 1B 2B 0C 00 00 16 00 10 95 30 11 16 04 0B 47 
  }


  protected native function sv2cl_EndConverse_CallStub();


  protected event sv2cl_EndConverse(Game_Pawn aPartner) {
    if (Conversation.partner == aPartner) {                                     //0000 : 07 4C 00 72 19 01 70 98 30 11 05 00 04 01 E8 98 30 11 00 60 97 30 11 16 
      Game_NPCPawn(aPartner).ClientFocus = None;                                //0018 : 0F 19 2E D0 32 5B 01 00 60 97 30 11 05 00 04 01 C8 14 25 11 2A 
      Conversation = None;                                                      //002D : 0F 01 70 98 30 11 2A 
      Outer.GUI.HideDialogue();                                                 //0034 : 19 19 01 00 E4 6B 0F 05 00 04 01 40 8A 1B 11 06 00 00 1B BD 0E 00 00 16 
    }
    //07 4C 00 72 19 01 70 98 30 11 05 00 04 01 E8 98 30 11 00 60 97 30 11 16 0F 19 2E D0 32 5B 01 00 
    //60 97 30 11 05 00 04 01 C8 14 25 11 2A 0F 01 70 98 30 11 2A 19 19 01 00 E4 6B 0F 05 00 04 01 40 
    //8A 1B 11 06 00 00 1B BD 0E 00 00 16 04 0B 47 
  }


  protected native function sv2cl_Converse_CallStub();


  protected event sv2cl_Converse(Game_Pawn aPartner,int aTopic,int aState,int aResponseFlags,array<int> aTopics) {
    Conversation = new Class'Game_ConversationState';                           //0000 : 0F 01 70 98 30 11 11 0B 0B 0B 20 60 70 60 01 
    Conversation.cl_Initialize(aPartner,aTopic,aState,aResponseFlags,aTopics);  //000F : 19 01 70 98 30 11 1F 00 00 1B 7C 0F 00 00 00 C0 9A 30 11 00 00 9C 30 11 00 78 9C 30 11 00 F0 9C 30 11 00 68 9D 30 11 16 
    Outer.GUI.ShowDialogue(Conversation);                                       //0037 : 19 19 01 00 E4 6B 0F 05 00 04 01 40 8A 1B 11 0B 00 00 1B BA 0E 00 00 01 70 98 30 11 16 
    Game_NPCPawn(aPartner).ClientFocus = GetPawn();                             //0054 : 0F 19 2E D0 32 5B 01 00 C0 9A 30 11 05 00 04 01 C8 14 25 11 1B 2B 0C 00 00 16 
    //0F 01 70 98 30 11 11 0B 0B 0B 20 60 70 60 01 19 01 70 98 30 11 1F 00 00 1B 7C 0F 00 00 00 C0 9A 
    //30 11 00 00 9C 30 11 00 78 9C 30 11 00 F0 9C 30 11 00 68 9D 30 11 16 19 19 01 00 E4 6B 0F 05 00 
    //04 01 40 8A 1B 11 0B 00 00 1B BA 0E 00 00 01 70 98 30 11 16 0F 19 2E D0 32 5B 01 00 C0 9A 30 11 
    //05 00 04 01 C8 14 25 11 1B 2B 0C 00 00 16 04 0B 47 
  }


  protected native function cl2sv_Respond_CallStub();


  event cl2sv_Respond(int aResponseId) {
    local export editinline Content_Type resptopic;
    local export editinline Conversation_Response foundResponse;
    local export editinline Conversation_Topic foundTopic;
    if (aResponseId == 0) {                                                     //0000 : 07 22 00 9A 00 B8 9F 30 11 25 16 
      EndConversation(Conversation.partner);                                    //000B : 1B 5E 05 00 00 19 01 70 98 30 11 05 00 04 01 E8 98 30 11 16 
    } else {                                                                    //001F : 06 C1 00 
      resptopic = Content_Type(Class'SBDBSync'.GetResourceObject(aResponseId)); //0022 : 0F 00 68 A1 30 11 2E 80 62 5B 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 B8 9F 30 11 16 
      foundResponse = Conversation_Response(resptopic);                         //0041 : 0F 00 E0 A1 30 11 2E C0 6E 5C 01 00 68 A1 30 11 
      foundTopic = Conversation_Topic(resptopic);                               //0051 : 0F 00 58 A2 30 11 2E 40 64 5C 01 00 68 A1 30 11 
      if (foundResponse != None) {                                              //0061 : 07 85 00 77 00 E0 A1 30 11 2A 16 
        Response(Conversation.partner,foundResponse);                           //006C : 1B 11 0F 00 00 19 01 70 98 30 11 05 00 04 01 E8 98 30 11 00 E0 A1 30 11 16 
      }
      if (foundTopic != None) {                                                 //0085 : 07 A9 00 77 00 58 A2 30 11 2A 16 
        Topic(Conversation.partner,foundTopic);                                 //0090 : 1B 71 0F 00 00 19 01 70 98 30 11 05 00 04 01 E8 98 30 11 00 58 A2 30 11 16 
      }
      if (foundTopic == None && foundResponse == None) {                        //00A9 : 07 C1 00 82 72 00 58 A2 30 11 2A 16 18 09 00 72 00 E0 A1 30 11 2A 16 16 
      }
    }
    //07 22 00 9A 00 B8 9F 30 11 25 16 1B 5E 05 00 00 19 01 70 98 30 11 05 00 04 01 E8 98 30 11 16 06 
    //C1 00 0F 00 68 A1 30 11 2E 80 62 5B 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 B8 9F 30 11 
    //16 0F 00 E0 A1 30 11 2E C0 6E 5C 01 00 68 A1 30 11 0F 00 58 A2 30 11 2E 40 64 5C 01 00 68 A1 30 
    //11 07 85 00 77 00 E0 A1 30 11 2A 16 1B 11 0F 00 00 19 01 70 98 30 11 05 00 04 01 E8 98 30 11 00 
    //E0 A1 30 11 16 07 A9 00 77 00 58 A2 30 11 2A 16 1B 71 0F 00 00 19 01 70 98 30 11 05 00 04 01 E8 
    //98 30 11 00 58 A2 30 11 16 07 C1 00 82 72 00 58 A2 30 11 2A 16 18 09 00 72 00 E0 A1 30 11 2A 16 
    //16 04 0B 47 
  }


  protected native function cl2sv_Interact_CallStub();


  event cl2sv_Interact(Game_Pawn aTarget) {
    Interact(aTarget);                                                          //0000 : 1B AA 0F 00 00 00 30 A4 30 11 16 
    //1B AA 0F 00 00 00 30 A4 30 11 16 04 0B 47 
  }


  protected native function cl2sv_React_CallStub();


  event cl2sv_React(Game_Pawn aPawn) {
    Game_Controller(aPawn.Controller).ConversationControl.OnReact(GetPawn());   //0000 : 19 19 2E 10 0E 5B 01 19 00 48 A6 30 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 0C 00 00 1B E2 05 00 00 1B 2B 0C 00 00 16 16 
    //19 19 2E 10 0E 5B 01 19 00 48 A6 30 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 0C 00 00 
    //1B E2 05 00 00 1B 2B 0C 00 00 16 16 04 0B 47 
  }


  native function IsConversing();


  event OnEndConversation(Game_Pawn aPartner) {
    if (Conversation.partner != None
      && Conversation.partner == aPartner) {//0000 : 07 4B 00 82 77 19 01 70 98 30 11 05 00 04 01 E8 98 30 11 2A 16 18 16 00 72 19 01 70 98 30 11 05 00 04 01 E8 98 30 11 00 B8 A8 30 11 16 16 
      sv2cl_EndConverse_CallStub(aPartner);                                     //002E : 1B C8 0C 00 00 00 B8 A8 30 11 16 
      Conversation = None;                                                      //0039 : 0F 01 70 98 30 11 2A 
      Super.OnEndConversation(aPartner);                                        //0040 : 1C E0 6F 30 11 00 B8 A8 30 11 16 
    }
    //07 4B 00 82 77 19 01 70 98 30 11 05 00 04 01 E8 98 30 11 2A 16 18 16 00 72 19 01 70 98 30 11 05 
    //00 04 01 E8 98 30 11 00 B8 A8 30 11 16 16 1B C8 0C 00 00 00 B8 A8 30 11 16 0F 01 70 98 30 11 2A 
    //1C E0 6F 30 11 00 B8 A8 30 11 16 04 0B 47 
  }


  event EndAllConversations() {
    if (Conversation != None) {                                                 //0000 : 07 3A 00 77 01 70 98 30 11 2A 16 
      sv2cl_EndConverse_CallStub(Conversation.partner);                         //000B : 1B C8 0C 00 00 19 01 70 98 30 11 05 00 04 01 E8 98 30 11 16 
      EndConversation(Conversation.partner);                                    //001F : 1C 50 73 30 11 19 01 70 98 30 11 05 00 04 01 E8 98 30 11 16 
      Conversation = None;                                                      //0033 : 0F 01 70 98 30 11 2A 
    }
    //07 3A 00 77 01 70 98 30 11 2A 16 1B C8 0C 00 00 19 01 70 98 30 11 05 00 04 01 E8 98 30 11 16 1C 
    //50 73 30 11 19 01 70 98 30 11 05 00 04 01 E8 98 30 11 16 0F 01 70 98 30 11 2A 04 0B 47 
  }


  function EndConversation(Game_Pawn aPartner) {
    if (aPartner != None
      && aPartner == Conversation.partner) {           //0000 : 07 42 00 82 77 00 A8 AB 30 11 2A 16 18 16 00 72 00 A8 AB 30 11 19 01 70 98 30 11 05 00 04 01 E8 98 30 11 16 16 
      sv2cl_EndConverse_CallStub(aPartner);                                     //0025 : 1B C8 0C 00 00 00 A8 AB 30 11 16 
      Conversation = None;                                                      //0030 : 0F 01 70 98 30 11 2A 
      Super.EndConversation(aPartner);                                          //0037 : 1C 50 73 30 11 00 A8 AB 30 11 16 
    }
    //07 42 00 82 77 00 A8 AB 30 11 2A 16 18 16 00 72 00 A8 AB 30 11 19 01 70 98 30 11 05 00 04 01 E8 
    //98 30 11 16 16 1B C8 0C 00 00 00 A8 AB 30 11 16 0F 01 70 98 30 11 2A 1C 50 73 30 11 00 A8 AB 30 
    //11 16 04 0B 47 
  }


  event OnConversation(Game_Pawn aPartner,export editinline Conversation_Topic aTopic,export editinline Conversation_Node aState,array<Conversation_Response> aResponses,array<Conversation_Topic> aTopics) {
    local int responseFlags;
    local array<int> topicList;
    Conversation = new Class'Game_ConversationState';                           //0000 : 0F 01 70 98 30 11 11 0B 0B 0B 20 60 70 60 01 
    Conversation.partner = aPartner;                                            //000F : 0F 19 01 70 98 30 11 05 00 04 01 E8 98 30 11 00 58 AD 30 11 
    Conversation.CurrentTopic = aTopic;                                         //0023 : 0F 19 01 70 98 30 11 05 00 04 01 48 AF 30 11 00 C0 AF 30 11 
    Conversation.CurrentState = aState;                                         //0037 : 0F 19 01 70 98 30 11 05 00 04 01 38 B0 30 11 00 B0 B0 30 11 
    Conversation.Responses = aResponses;                                        //004B : 0F 19 01 70 98 30 11 05 00 00 01 28 B1 30 11 00 A0 B1 30 11 
    Conversation.Topics = aTopics;                                              //005F : 0F 19 01 70 98 30 11 05 00 00 01 18 B2 30 11 00 90 B2 30 11 
    responseFlags = Conversation.ConstructResponseFlags();                      //0073 : 0F 00 08 B3 30 11 19 01 70 98 30 11 06 00 04 1B 74 0F 00 00 16 
    Conversation.ConstructTopicList(topicList);                                 //0088 : 19 01 70 98 30 11 0B 00 00 1B 72 0F 00 00 00 80 B3 30 11 16 
    sv2cl_Converse_CallStub(aPartner,aTopic.GetResourceId(),aState.GetResourceId(),responseFlags,topicList);//009C : 1B BC 0D 00 00 00 58 AD 30 11 19 00 C0 AF 30 11 06 00 04 1C 08 90 20 11 16 19 00 B0 B0 30 11 06 00 04 1C 08 90 20 11 16 00 08 B3 30 11 00 80 B3 30 11 16 
    Super.OnConversation(aPartner,aTopic,aState,aResponses,aTopics);            //00CF : 1C 80 7C 30 11 00 58 AD 30 11 00 C0 AF 30 11 00 B0 B0 30 11 00 A0 B1 30 11 00 90 B2 30 11 16 
    //0F 01 70 98 30 11 11 0B 0B 0B 20 60 70 60 01 0F 19 01 70 98 30 11 05 00 04 01 E8 98 30 11 00 58 
    //AD 30 11 0F 19 01 70 98 30 11 05 00 04 01 48 AF 30 11 00 C0 AF 30 11 0F 19 01 70 98 30 11 05 00 
    //04 01 38 B0 30 11 00 B0 B0 30 11 0F 19 01 70 98 30 11 05 00 00 01 28 B1 30 11 00 A0 B1 30 11 0F 
    //19 01 70 98 30 11 05 00 00 01 18 B2 30 11 00 90 B2 30 11 0F 00 08 B3 30 11 19 01 70 98 30 11 06 
    //00 04 1B 74 0F 00 00 16 19 01 70 98 30 11 0B 00 00 1B 72 0F 00 00 00 80 B3 30 11 16 1B BC 0D 00 
    //00 00 58 AD 30 11 19 00 C0 AF 30 11 06 00 04 1C 08 90 20 11 16 19 00 B0 B0 30 11 06 00 04 1C 08 
    //90 20 11 16 00 08 B3 30 11 00 80 B3 30 11 16 1C 80 7C 30 11 00 58 AD 30 11 00 C0 AF 30 11 00 B0 
    //B0 30 11 00 A0 B1 30 11 00 90 B2 30 11 16 04 0B 47 
  }


  function Banner(Game_Pawn aSource,export editinline Conversation_Topic aTopic) {
    sv2cl_Banner_CallStub(aSource,aTopic.GetResourceId());                      //0000 : 1B D4 0D 00 00 00 60 B5 30 11 19 00 28 B6 30 11 06 00 04 1C 08 90 20 11 16 16 
    //1B D4 0D 00 00 00 60 B5 30 11 19 00 28 B6 30 11 06 00 04 1C 08 90 20 11 16 16 04 0B 47 
  }



