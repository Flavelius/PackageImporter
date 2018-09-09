//==============================================================================
//  ConversationComponent
//==============================================================================

class ConversationComponent extends Game_Conversation within Game_AIController
    native
    exportstructs
    dependsOn(Game_ConversationState,Game_AIController,Conversation_Topic,Conversation_Node,Conversation_Response,Class,Content_Type)
  ;

  var bool mEnabled;
  var array<Game_ConversationState> mConversations;
  var array<Game_Pawn> mQueuedConversations;


  event OnFailConversation(Game_Pawn aPartner) {
    local Game_ConversationState convState;
    Super.OnFailConversation(aPartner);                                         //0000 : 1C 18 6D 30 11 00 58 49 FD 13 16 
    convState = FindConversation(aPartner);                                     //000B : 0F 00 40 4A FD 13 1B 00 73 00 00 00 58 49 FD 13 16 
    convState.Failed = True;                                                    //001C : 14 19 00 40 4A FD 13 06 00 04 2D 01 28 24 38 11 27 
    //1C 18 6D 30 11 00 58 49 FD 13 16 0F 00 40 4A FD 13 1B 00 73 00 00 00 58 49 FD 13 16 14 19 00 40 
    //4A FD 13 06 00 04 2D 01 28 24 38 11 27 04 0B 47 
  }


  function FailConversation(Game_Pawn aPartner) {
    local Game_ConversationState convState;
    Super.FailConversation(aPartner);                                           //0000 : 1C 88 6E 30 11 00 B8 A0 FD 13 16 
    convState = FindConversation(aPartner);                                     //000B : 0F 00 A0 A1 FD 13 1B 00 73 00 00 00 B8 A0 FD 13 16 
    convState.Failed = True;                                                    //001C : 14 19 00 A0 A1 FD 13 06 00 04 2D 01 28 24 38 11 27 
    //1C 88 6E 30 11 00 B8 A0 FD 13 16 0F 00 A0 A1 FD 13 1B 00 73 00 00 00 B8 A0 FD 13 16 14 19 00 A0 
    //A1 FD 13 06 00 04 2D 01 28 24 38 11 27 04 0B 47 
  }


  event OnEndConversation(Game_Pawn aPartner) {
    local int confFound;
    confFound = FindConversationIndex(aPartner);                                //0000 : 0F 00 F8 A3 FD 13 1B 09 73 00 00 00 C8 A2 FD 13 16 
    if (confFound == -1) {                                                      //0011 : 07 23 00 9A 00 F8 A3 FD 13 1D FF FF FF FF 16 
    } else {                                                                    //0020 : 06 66 00 
      if (!Outer.MetaControllerMessage(25,aPartner)) {                          //0023 : 07 3E 00 81 19 01 00 E4 6B 0F 0D 00 04 1B FE 72 00 00 24 19 00 C8 A2 FD 13 16 16 
      }
      Super.OnEndConversation(aPartner);                                        //003E : 1C E0 6F 30 11 00 C8 A2 FD 13 16 
      mConversations.Remove(confFound,1);                                       //0049 : 41 01 70 A4 FD 13 00 F8 A3 FD 13 26 
      Outer.StateSignal(17);                                                    //0055 : 19 01 00 E4 6B 0F 08 00 00 1B E0 08 00 00 24 11 16 
    }
    //0F 00 F8 A3 FD 13 1B 09 73 00 00 00 C8 A2 FD 13 16 07 23 00 9A 00 F8 A3 FD 13 1D FF FF FF FF 16 
    //06 66 00 07 3E 00 81 19 01 00 E4 6B 0F 0D 00 04 1B FE 72 00 00 24 19 00 C8 A2 FD 13 16 16 1C E0 
    //6F 30 11 00 C8 A2 FD 13 16 41 01 70 A4 FD 13 00 F8 A3 FD 13 26 19 01 00 E4 6B 0F 08 00 00 1B E0 
    //08 00 00 24 11 16 04 0B 47 
  }


  event EndAllConversations() {
    local int convI;
    convI = 0;                                                                  //0000 : 0F 00 98 A5 FD 13 25 
    while (convI < mConversations.Length) {                                     //0007 : 07 3B 00 96 00 98 A5 FD 13 37 01 70 A4 FD 13 16 
      StopConversation(mConversations[convI].partner);                          //0017 : 1B E1 08 00 00 19 10 00 98 A5 FD 13 01 70 A4 FD 13 05 00 04 01 E8 98 30 11 16 
      convI++;                                                                  //0031 : A5 00 98 A5 FD 13 16 
    }
    mConversations.Remove(0,mConversations.Length);                             //003B : 41 01 70 A4 FD 13 25 37 01 70 A4 FD 13 
    mQueuedConversations.Remove(0,mQueuedConversations.Length);                 //0048 : 41 01 B8 A6 FD 13 25 37 01 B8 A6 FD 13 
    //0F 00 98 A5 FD 13 25 07 3B 00 96 00 98 A5 FD 13 37 01 70 A4 FD 13 16 1B E1 08 00 00 19 10 00 98 
    //A5 FD 13 01 70 A4 FD 13 05 00 04 01 E8 98 30 11 16 A5 00 98 A5 FD 13 16 06 07 00 41 01 70 A4 FD 
    //13 25 37 01 70 A4 FD 13 41 01 B8 A6 FD 13 25 37 01 B8 A6 FD 13 04 0B 47 
  }


  event EndConversation(Game_Pawn aPartner) {
    local int confFound;
    confFound = FindConversationIndex(aPartner);                                //0000 : 0F 00 10 A9 FD 13 1B 09 73 00 00 00 E0 A7 FD 13 16 
    if (confFound == -1) {                                                      //0011 : 07 23 00 9A 00 10 A9 FD 13 1D FF FF FF FF 16 
    } else {                                                                    //0020 : 06 66 00 
      if (!Outer.MetaControllerMessage(25,aPartner)) {                          //0023 : 07 3E 00 81 19 01 00 E4 6B 0F 0D 00 04 1B FE 72 00 00 24 19 00 E0 A7 FD 13 16 16 
      }
      StopConversation(aPartner);                                               //003E : 1B E1 08 00 00 00 E0 A7 FD 13 16 
      mConversations.Remove(confFound,1);                                       //0049 : 41 01 70 A4 FD 13 00 10 A9 FD 13 26 
      Outer.StateSignal(17);                                                    //0055 : 19 01 00 E4 6B 0F 08 00 00 1B E0 08 00 00 24 11 16 
    }
    //0F 00 10 A9 FD 13 1B 09 73 00 00 00 E0 A7 FD 13 16 07 23 00 9A 00 10 A9 FD 13 1D FF FF FF FF 16 
    //06 66 00 07 3E 00 81 19 01 00 E4 6B 0F 0D 00 04 1B FE 72 00 00 24 19 00 E0 A7 FD 13 16 16 1B E1 
    //08 00 00 00 E0 A7 FD 13 16 41 01 70 A4 FD 13 00 10 A9 FD 13 26 19 01 00 E4 6B 0F 08 00 00 1B E0 
    //08 00 00 24 11 16 04 0B 47 
  }


  function OnTopic(Game_Pawn aPartner,export editinline Conversation_Topic aTopic) {
    local bool topicFound;
    local int topicI;
    local Game_ConversationState convState;
    convState = FindConversation(aPartner);                                     //0000 : 0F 00 E8 AB FD 13 1B 00 73 00 00 00 38 AA FD 13 16 
    if (convState == None) {                                                    //0011 : 07 29 00 72 00 E8 AB FD 13 2A 16 
      EndConversation(aPartner);                                                //001C : 1B 5E 05 00 00 00 38 AA FD 13 16 
      return;                                                                   //0027 : 04 0B 
    }
    topicFound = False;                                                         //0029 : 14 2D 00 60 AC FD 13 28 
    topicI = 0;                                                                 //0031 : 0F 00 D8 AC FD 13 25 
    while (topicI < convState.Topics.Length) {                                  //0038 : 07 84 00 96 00 D8 AC FD 13 37 19 00 E8 AB FD 13 05 00 00 01 18 B2 30 11 16 
      if (convState.Topics[topicI] == aTopic) {                                 //0051 : 07 7A 00 72 10 00 D8 AC FD 13 19 00 E8 AB FD 13 05 00 00 01 18 B2 30 11 00 50 AD FD 13 16 
        topicFound = True;                                                      //006F : 14 2D 00 60 AC FD 13 27 
        goto jl0084;                                                            //0077 : 06 84 00 
      }
      topicI++;                                                                 //007A : A5 00 D8 AC FD 13 16 
    }
    if (!topicFound) {                                                          //0084 : 07 9C 00 81 2D 00 60 AC FD 13 16 
      EndConversation(aPartner);                                                //008F : 1B 5E 05 00 00 00 38 AA FD 13 16 
      return;                                                                   //009A : 04 0B 
    }
    aTopic.sv_Start(Outer.GetNPCPawn(),aPartner);                               //009C : 19 00 50 AD FD 13 1A 00 00 1B 69 15 00 00 19 01 00 E4 6B 0F 06 00 04 1B D7 12 00 00 16 00 38 AA FD 13 16 
    //0F 00 E8 AB FD 13 1B 00 73 00 00 00 38 AA FD 13 16 07 29 00 72 00 E8 AB FD 13 2A 16 1B 5E 05 00 
    //00 00 38 AA FD 13 16 04 0B 14 2D 00 60 AC FD 13 28 0F 00 D8 AC FD 13 25 07 84 00 96 00 D8 AC FD 
    //13 37 19 00 E8 AB FD 13 05 00 00 01 18 B2 30 11 16 07 7A 00 72 10 00 D8 AC FD 13 19 00 E8 AB FD 
    //13 05 00 00 01 18 B2 30 11 00 50 AD FD 13 16 14 2D 00 60 AC FD 13 27 06 84 00 A5 00 D8 AC FD 13 
    //16 06 38 00 07 9C 00 81 2D 00 60 AC FD 13 16 1B 5E 05 00 00 00 38 AA FD 13 16 04 0B 19 00 50 AD 
    //FD 13 1A 00 00 1B 69 15 00 00 19 01 00 E4 6B 0F 06 00 04 1B D7 12 00 00 16 00 38 AA FD 13 16 04 
    //0B 47 
  }


  function OnResponse(Game_Pawn aPartner,export editinline Conversation_Response aResponse) {
    local int responseI;
    local bool responseFound;
    local Game_ConversationState convState;
    local export editinline Conversation_Node nextState;
    convState = FindConversation(aPartner);                                     //0000 : 0F 00 98 B1 FD 13 1B 00 73 00 00 00 78 AE FD 13 16 
    if (convState == None) {                                                    //0011 : 07 29 00 72 00 98 B1 FD 13 2A 16 
      EndConversation(aPartner);                                                //001C : 1B 5E 05 00 00 00 78 AE FD 13 16 
      return;                                                                   //0027 : 04 0B 
    }
    responseFound = False;                                                      //0029 : 14 2D 00 10 B2 FD 13 28 
    responseI = 0;                                                              //0031 : 0F 00 88 B2 FD 13 25 
    while (responseI < convState.CurrentState.Responses.Length) {               //0038 : 07 8D 00 96 00 88 B2 FD 13 37 19 19 00 98 B1 FD 13 05 00 04 01 38 B0 30 11 05 00 00 01 60 69 30 11 16 
      if (convState.Responses[responseI] == aResponse) {                        //005A : 07 83 00 72 10 00 88 B2 FD 13 19 00 98 B1 FD 13 05 00 00 01 28 B1 30 11 00 00 B3 FD 13 16 
        responseFound = True;                                                   //0078 : 14 2D 00 10 B2 FD 13 27 
        goto jl008D;                                                            //0080 : 06 8D 00 
      }
      responseI++;                                                              //0083 : A5 00 88 B2 FD 13 16 
    }
    if (!responseFound) {                                                       //008D : 07 A6 00 81 2D 00 10 B2 FD 13 16 
      EndConversation(aPartner);                                                //0098 : 1B 5E 05 00 00 00 78 AE FD 13 16 
    } else {                                                                    //00A3 : 06 CC 01 
      aResponse.sv_OnResponse(aPartner,Outer.GetNPCPawn());                     //00A6 : 19 00 00 B3 FD 13 1A 00 04 1B 22 07 00 00 00 78 AE FD 13 19 01 00 E4 6B 0F 06 00 04 1B D7 12 00 00 16 16 
      if (!convState.Failed) {                                                  //00C9 : 07 C1 01 81 19 00 98 B1 FD 13 06 00 04 2D 01 28 24 38 11 16 
        if (aResponse.Conversations.Length == 0) {                              //00DD : 07 23 01 9A 37 19 00 00 B3 FD 13 05 00 00 01 F8 38 38 11 25 16 
          convState.CurrentTopic.sv_OnFinish(GetPawn(),aPartner);               //00F2 : 19 19 00 98 B1 FD 13 05 00 04 01 48 AF 30 11 11 00 04 1B 1C 07 00 00 1B 2B 0C 00 00 16 00 78 AE FD 13 16 
          EndConversation(aPartner);                                            //0115 : 1B 5E 05 00 00 00 78 AE FD 13 16 
        } else {                                                                //0120 : 06 BE 01 
          nextState = aResponse.sv_SelectConversation(convState.CurrentTopic,Outer.GetNPCPawn(),aPartner);//0123 : 0F 00 78 B3 FD 13 19 00 00 B3 FD 13 28 00 04 1B 52 15 00 00 19 00 98 B1 FD 13 05 00 04 01 48 AF 30 11 19 01 00 E4 6B 0F 06 00 04 1B D7 12 00 00 16 00 78 AE FD 13 16 
          if (nextState != None) {                                              //015A : 07 86 01 77 00 78 B3 FD 13 2A 16 
            Converse(aPartner,convState.CurrentTopic,nextState);                //0165 : 1B 8D 0F 00 00 00 78 AE FD 13 19 00 98 B1 FD 13 05 00 04 01 48 AF 30 11 00 78 B3 FD 13 16 
          } else {                                                              //0183 : 06 BE 01 
            if (convState.CurrentState.Responses[responseI].Conversations.Length > 0) {//0186 : 07 B3 01 97 37 19 10 00 88 B2 FD 13 19 19 00 98 B1 FD 13 05 00 04 01 38 B0 30 11 05 00 00 01 60 69 30 11 05 00 00 01 F8 38 38 11 25 16 
            }
            EndConversation(aPartner);                                          //01B3 : 1B 5E 05 00 00 00 78 AE FD 13 16 
          }
        }
      } else {                                                                  //01BE : 06 CC 01 
        EndConversation(aPartner);                                              //01C1 : 1B 5E 05 00 00 00 78 AE FD 13 16 
      }
    }
    //0F 00 98 B1 FD 13 1B 00 73 00 00 00 78 AE FD 13 16 07 29 00 72 00 98 B1 FD 13 2A 16 1B 5E 05 00 
    //00 00 78 AE FD 13 16 04 0B 14 2D 00 10 B2 FD 13 28 0F 00 88 B2 FD 13 25 07 8D 00 96 00 88 B2 FD 
    //13 37 19 19 00 98 B1 FD 13 05 00 04 01 38 B0 30 11 05 00 00 01 60 69 30 11 16 07 83 00 72 10 00 
    //88 B2 FD 13 19 00 98 B1 FD 13 05 00 00 01 28 B1 30 11 00 00 B3 FD 13 16 14 2D 00 10 B2 FD 13 27 
    //06 8D 00 A5 00 88 B2 FD 13 16 06 38 00 07 A6 00 81 2D 00 10 B2 FD 13 16 1B 5E 05 00 00 00 78 AE 
    //FD 13 16 06 CC 01 19 00 00 B3 FD 13 1A 00 04 1B 22 07 00 00 00 78 AE FD 13 19 01 00 E4 6B 0F 06 
    //00 04 1B D7 12 00 00 16 16 07 C1 01 81 19 00 98 B1 FD 13 06 00 04 2D 01 28 24 38 11 16 07 23 01 
    //9A 37 19 00 00 B3 FD 13 05 00 00 01 F8 38 38 11 25 16 19 19 00 98 B1 FD 13 05 00 04 01 48 AF 30 
    //11 11 00 04 1B 1C 07 00 00 1B 2B 0C 00 00 16 00 78 AE FD 13 16 1B 5E 05 00 00 00 78 AE FD 13 16 
    //06 BE 01 0F 00 78 B3 FD 13 19 00 00 B3 FD 13 28 00 04 1B 52 15 00 00 19 00 98 B1 FD 13 05 00 04 
    //01 48 AF 30 11 19 01 00 E4 6B 0F 06 00 04 1B D7 12 00 00 16 00 78 AE FD 13 16 07 86 01 77 00 78 
    //B3 FD 13 2A 16 1B 8D 0F 00 00 00 78 AE FD 13 19 00 98 B1 FD 13 05 00 04 01 48 AF 30 11 00 78 B3 
    //FD 13 16 06 BE 01 07 B3 01 97 37 19 10 00 88 B2 FD 13 19 19 00 98 B1 FD 13 05 00 04 01 38 B0 30 
    //11 05 00 00 01 60 69 30 11 05 00 00 01 F8 38 38 11 25 16 1B 5E 05 00 00 00 78 AE FD 13 16 06 CC 
    //01 1B 5E 05 00 00 00 78 AE FD 13 16 04 0B 47 
  }


  function Converse(Game_Pawn aPartner,export editinline Conversation_Topic aTopic,export editinline Conversation_Node aState) {
    local int convI;
    local Game_ConversationState convState;
    if (aState != None) {                                                       //0000 : 07 B8 01 77 00 B0 B7 FD 13 2A 16 
      convState = FindConversation(aPartner);                                   //000B : 0F 00 28 B8 FD 13 1B 00 73 00 00 00 A0 B4 FD 13 16 
      if (convState == None) {                                                  //001C : 07 53 00 72 00 28 B8 FD 13 2A 16 
        convI = mConversations.Length;                                          //0027 : 0F 00 A0 B8 FD 13 37 01 70 A4 FD 13 
        convState = new Class'Game_ConversationState';                          //0033 : 0F 00 28 B8 FD 13 11 0B 0B 0B 20 60 70 60 01 
        mConversations[convI] = convState;                                      //0042 : 0F 10 00 A0 B8 FD 13 01 70 A4 FD 13 00 28 B8 FD 13 
      }
      convState.sv_Initialize(Outer.GetNPCPawn(),aPartner,aTopic,aState);       //0053 : 19 00 28 B8 FD 13 24 00 00 1B D2 11 00 00 19 01 00 E4 6B 0F 06 00 04 1B D7 12 00 00 16 00 A0 B4 FD 13 00 18 B9 FD 13 00 B0 B7 FD 13 16 
      aState.sv_OnConversation(Outer.GetNPCPawn(),aPartner);                    //0080 : 19 00 B0 B7 FD 13 1A 00 04 1B 19 07 00 00 19 01 00 E4 6B 0F 06 00 04 1B D7 12 00 00 16 00 A0 B4 FD 13 16 
      if (!convState.Failed) {                                                  //00A3 : 07 7A 01 81 19 00 28 B8 FD 13 06 00 04 2D 01 28 24 38 11 16 
        if (aState.Responses.Length == 0) {                                     //00B7 : 07 E6 00 9A 37 19 00 B0 B7 FD 13 05 00 00 01 60 69 30 11 25 16 
          aTopic.sv_OnFinish(GetPawn(),aPartner);                               //00CC : 19 00 18 B9 FD 13 11 00 04 1B 1C 07 00 00 1B 2B 0C 00 00 16 00 A0 B4 FD 13 16 
        }
        convState.sv_Initialize(Outer.GetNPCPawn(),aPartner,aTopic,aState);     //00E6 : 19 00 28 B8 FD 13 24 00 00 1B D2 11 00 00 19 01 00 E4 6B 0F 06 00 04 1B D7 12 00 00 16 00 A0 B4 FD 13 00 18 B9 FD 13 00 B0 B7 FD 13 16 
        Game_Controller(aPartner.Controller).ConversationControl.OnConversation(GetPawn(),convState.CurrentTopic,convState.CurrentState,convState.Responses,convState.Topics);//0113 : 19 19 2E 10 0E 5B 01 19 00 A0 B4 FD 13 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 44 00 00 1B BD 05 00 00 1B 2B 0C 00 00 16 19 00 28 B8 FD 13 05 00 04 01 48 AF 30 11 19 00 28 B8 FD 13 05 00 04 01 38 B0 30 11 19 00 28 B8 FD 13 05 00 00 01 28 B1 30 11 19 00 28 B8 FD 13 05 00 00 01 18 B2 30 11 16 
      } else {                                                                  //0177 : 06 85 01 
        EndConversation(aPartner);                                              //017A : 1B 5E 05 00 00 00 A0 B4 FD 13 16 
      }
      Super.Converse(convState.partner,convState.CurrentTopic,convState.CurrentState);//0185 : 1C 18 7F 30 11 19 00 28 B8 FD 13 05 00 04 01 E8 98 30 11 19 00 28 B8 FD 13 05 00 04 01 48 AF 30 11 19 00 28 B8 FD 13 05 00 04 01 38 B0 30 11 16 
    } else {                                                                    //01B5 : 06 C3 01 
      EndConversation(aPartner);                                                //01B8 : 1B 5E 05 00 00 00 A0 B4 FD 13 16 
    }
    //07 B8 01 77 00 B0 B7 FD 13 2A 16 0F 00 28 B8 FD 13 1B 00 73 00 00 00 A0 B4 FD 13 16 07 53 00 72 
    //00 28 B8 FD 13 2A 16 0F 00 A0 B8 FD 13 37 01 70 A4 FD 13 0F 00 28 B8 FD 13 11 0B 0B 0B 20 60 70 
    //60 01 0F 10 00 A0 B8 FD 13 01 70 A4 FD 13 00 28 B8 FD 13 19 00 28 B8 FD 13 24 00 00 1B D2 11 00 
    //00 19 01 00 E4 6B 0F 06 00 04 1B D7 12 00 00 16 00 A0 B4 FD 13 00 18 B9 FD 13 00 B0 B7 FD 13 16 
    //19 00 B0 B7 FD 13 1A 00 04 1B 19 07 00 00 19 01 00 E4 6B 0F 06 00 04 1B D7 12 00 00 16 00 A0 B4 
    //FD 13 16 07 7A 01 81 19 00 28 B8 FD 13 06 00 04 2D 01 28 24 38 11 16 07 E6 00 9A 37 19 00 B0 B7 
    //FD 13 05 00 00 01 60 69 30 11 25 16 19 00 18 B9 FD 13 11 00 04 1B 1C 07 00 00 1B 2B 0C 00 00 16 
    //00 A0 B4 FD 13 16 19 00 28 B8 FD 13 24 00 00 1B D2 11 00 00 19 01 00 E4 6B 0F 06 00 04 1B D7 12 
    //00 00 16 00 A0 B4 FD 13 00 18 B9 FD 13 00 B0 B7 FD 13 16 19 19 2E 10 0E 5B 01 19 00 A0 B4 FD 13 
    //05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 44 00 00 1B BD 05 00 00 1B 2B 0C 00 00 16 19 00 
    //28 B8 FD 13 05 00 04 01 48 AF 30 11 19 00 28 B8 FD 13 05 00 04 01 38 B0 30 11 19 00 28 B8 FD 13 
    //05 00 00 01 28 B1 30 11 19 00 28 B8 FD 13 05 00 00 01 18 B2 30 11 16 06 85 01 1B 5E 05 00 00 00 
    //A0 B4 FD 13 16 1C 18 7F 30 11 19 00 28 B8 FD 13 05 00 04 01 E8 98 30 11 19 00 28 B8 FD 13 05 00 
    //04 01 48 AF 30 11 19 00 28 B8 FD 13 05 00 04 01 38 B0 30 11 16 06 C3 01 1B 5E 05 00 00 00 A0 B4 
    //FD 13 16 04 0B 47 
  }


  event OnInteraction(Game_Pawn aSource) {
    if (!Outer.MetaControllerMessage(15,aSource,)) {                            //0000 : 07 68 00 81 19 01 00 E4 6B 0F 0E 00 04 1B FE 72 00 00 24 0F 00 40 BA FD 13 0B 16 16 
      if (CanConverse(aSource)) {                                               //001C : 07 5D 00 1C 68 4D 25 11 00 40 BA FD 13 16 
        Outer.StateSignal(16);                                                  //002A : 19 01 00 E4 6B 0F 08 00 00 1B E0 08 00 00 24 10 16 
        if (mEnabled) {                                                         //003B : 07 52 00 2D 01 78 BB FD 13 
          StartConversation(aSource);                                           //0044 : 1B DF 08 00 00 00 40 BA FD 13 16 
        } else {                                                                //004F : 06 5D 00 
          QueueConversation(aSource);                                           //0052 : 1B 13 73 00 00 00 40 BA FD 13 16 
        }
      }
      Super.OnInteraction(aSource);                                             //005D : 1C 40 83 30 11 00 40 BA FD 13 16 
    }
    //07 68 00 81 19 01 00 E4 6B 0F 0E 00 04 1B FE 72 00 00 24 0F 00 40 BA FD 13 0B 16 16 07 5D 00 1C 
    //68 4D 25 11 00 40 BA FD 13 16 19 01 00 E4 6B 0F 08 00 00 1B E0 08 00 00 24 10 16 07 52 00 2D 01 
    //78 BB FD 13 1B DF 08 00 00 00 40 BA FD 13 16 06 5D 00 1B 13 73 00 00 00 40 BA FD 13 16 1C 40 83 
    //30 11 00 40 BA FD 13 16 04 0B 47 
  }


  event OnReact(Game_Pawn aSource) {
    local Game_Controller partnerController;
    local export editinline Conversation_Topic bestTopic;
    partnerController = Game_Controller(aSource.Controller);                    //0000 : 0F 00 E0 BD FD 13 2E 10 0E 5B 01 19 00 A0 BC FD 13 05 00 04 01 00 6E 6C 0F 
    if (partnerController != None) {                                            //0019 : 07 63 00 77 00 E0 BD FD 13 2A 16 
      bestTopic = ChooseTopic(aSource);                                         //0024 : 0F 00 58 BE FD 13 1C 20 8C 30 11 00 A0 BC FD 13 16 
      if (bestTopic != None) {                                                  //0035 : 07 63 00 77 00 58 BE FD 13 2A 16 
        partnerController.ConversationControl.Banner(GetPawn(),bestTopic);      //0040 : 19 19 00 E0 BD FD 13 05 00 04 01 C8 07 1B 11 11 00 00 1B 44 0C 00 00 1B 2B 0C 00 00 16 00 58 BE FD 13 16 
      }
    }
    Super.OnReact(aSource);                                                     //0063 : 1C F8 88 30 11 00 A0 BC FD 13 16 
    //0F 00 E0 BD FD 13 2E 10 0E 5B 01 19 00 A0 BC FD 13 05 00 04 01 00 6E 6C 0F 07 63 00 77 00 E0 BD 
    //FD 13 2A 16 0F 00 58 BE FD 13 1C 20 8C 30 11 00 A0 BC FD 13 16 07 63 00 77 00 58 BE FD 13 2A 16 
    //19 19 00 E0 BD FD 13 05 00 04 01 C8 07 1B 11 11 00 00 1B 44 0C 00 00 1B 2B 0C 00 00 16 00 58 BE 
    //FD 13 16 1C F8 88 30 11 00 A0 BC FD 13 16 04 0B 47 
  }


  protected event StopConversation(Game_Pawn aPawn) {
    EndConversation(aPawn);                                                     //0000 : 1C 50 73 30 11 00 80 BF FD 13 16 
    //1C 50 73 30 11 00 80 BF FD 13 16 04 0B 47 
  }


  protected event StartConversation(Game_Pawn aPawn) {
    local export editinline Conversation_Topic bestTopic;
    Game_Controller(aPawn.Controller).sv_FireHook(Class'Content_Type'.4,Outer.Pawn,0);//0000 : 19 2E 10 0E 5B 01 19 00 A8 C0 FD 13 05 00 04 01 00 6E 6C 0F 20 00 00 1B 0D 07 00 00 12 20 80 62 5B 01 02 00 01 24 04 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 25 16 
    bestTopic = ChooseTopic(aPawn);                                             //0037 : 0F 00 E8 C1 FD 13 1C 20 8C 30 11 00 A8 C0 FD 13 16 
    if (bestTopic != None) {                                                    //0048 : 07 6D 00 77 00 E8 C1 FD 13 2A 16 
      bestTopic.sv_Start(GetPawn(),aPawn);                                      //0053 : 19 00 E8 C1 FD 13 11 00 00 1B 69 15 00 00 1B 2B 0C 00 00 16 00 A8 C0 FD 13 16 
    }
    //19 2E 10 0E 5B 01 19 00 A8 C0 FD 13 05 00 04 01 00 6E 6C 0F 20 00 00 1B 0D 07 00 00 12 20 80 62 
    //5B 01 02 00 01 24 04 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 25 16 0F 00 E8 C1 FD 13 1C 20 8C 
    //30 11 00 A8 C0 FD 13 16 07 6D 00 77 00 E8 C1 FD 13 2A 16 19 00 E8 C1 FD 13 11 00 00 1B 69 15 00 
    //00 1B 2B 0C 00 00 16 00 A8 C0 FD 13 16 04 0B 47 
  }


  protected function QueueConversation(Game_Pawn aPawn) {
    local int qi;
    qi = 0;                                                                     //0000 : 0F 00 20 C4 FD 13 25 
    while (qi < mQueuedConversations.Length) {                                  //0007 : 07 38 00 96 00 20 C4 FD 13 37 01 B8 A6 FD 13 16 
      if (mQueuedConversations[qi] == aPawn) {                                  //0017 : 07 2E 00 72 10 00 20 C4 FD 13 01 B8 A6 FD 13 00 10 C3 FD 13 16 
        return;                                                                 //002C : 04 0B 
      }
      qi++;                                                                     //002E : A5 00 20 C4 FD 13 16 
    }
    mQueuedConversations[mQueuedConversations.Length] = aPawn;                  //0038 : 0F 10 37 01 B8 A6 FD 13 01 B8 A6 FD 13 00 10 C3 FD 13 
    //0F 00 20 C4 FD 13 25 07 38 00 96 00 20 C4 FD 13 37 01 B8 A6 FD 13 16 07 2E 00 72 10 00 20 C4 FD 
    //13 01 B8 A6 FD 13 00 10 C3 FD 13 16 04 0B A5 00 20 C4 FD 13 16 06 07 00 0F 10 37 01 B8 A6 FD 13 
    //01 B8 A6 FD 13 00 10 C3 FD 13 04 0B 47 
  }


  function int FindConversationIndex(Game_Pawn aPartner) {
    local int confFound;
    local int convI;
    confFound = -1;                                                             //0000 : 0F 00 68 C6 FD 13 1D FF FF FF FF 
    convI = 0;                                                                  //000B : 0F 00 E0 C6 FD 13 25 
    while (convI < mConversations.Length) {                                     //0012 : 07 50 00 96 00 E0 C6 FD 13 37 01 70 A4 FD 13 16 
      if (mConversations[convI].partner == aPartner) {                          //0022 : 07 46 00 72 19 10 00 E0 C6 FD 13 01 70 A4 FD 13 05 00 04 01 E8 98 30 11 00 48 C5 FD 13 16 
        return convI;                                                           //0040 : 04 00 E0 C6 FD 13 
      }
      convI++;                                                                  //0046 : A5 00 E0 C6 FD 13 16 
    }
    return -1;                                                                  //0050 : 04 1D FF FF FF FF 
    //0F 00 68 C6 FD 13 1D FF FF FF FF 0F 00 E0 C6 FD 13 25 07 50 00 96 00 E0 C6 FD 13 37 01 70 A4 FD 
    //13 16 07 46 00 72 19 10 00 E0 C6 FD 13 01 70 A4 FD 13 05 00 04 01 E8 98 30 11 00 48 C5 FD 13 16 
    //04 00 E0 C6 FD 13 A5 00 E0 C6 FD 13 16 06 12 00 04 1D FF FF FF FF 04 0B 47 
  }


  function Game_ConversationState FindConversation(Game_Pawn aPartner) {
    local int convI;
    local Game_PlayerPawn playerPawn;
    playerPawn = Game_PlayerPawn(aPartner);                                     //0000 : 0F 00 B8 C9 FD 13 2E F0 47 5B 01 00 80 C8 FD 13 
    if (playerPawn == None) {                                                   //0010 : 07 1D 00 72 00 B8 C9 FD 13 2A 16 
      return None;                                                              //001B : 04 2A 
    }
    convI = 0;                                                                  //001D : 0F 00 30 CA FD 13 25 
    while (convI < mConversations.Length) {                                     //0024 : 07 68 00 96 00 30 CA FD 13 37 01 70 A4 FD 13 16 
      if (mConversations[convI].partner == aPartner) {                          //0034 : 07 5E 00 72 19 10 00 30 CA FD 13 01 70 A4 FD 13 05 00 04 01 E8 98 30 11 00 80 C8 FD 13 16 
        return mConversations[convI];                                           //0052 : 04 10 00 30 CA FD 13 01 70 A4 FD 13 
      }
      convI++;                                                                  //005E : A5 00 30 CA FD 13 16 
    }
    return None;                                                                //0068 : 04 2A 
    //0F 00 B8 C9 FD 13 2E F0 47 5B 01 00 80 C8 FD 13 07 1D 00 72 00 B8 C9 FD 13 2A 16 04 2A 0F 00 30 
    //CA FD 13 25 07 68 00 96 00 30 CA FD 13 37 01 70 A4 FD 13 16 07 5E 00 72 19 10 00 30 CA FD 13 01 
    //70 A4 FD 13 05 00 04 01 E8 98 30 11 00 80 C8 FD 13 16 04 10 00 30 CA FD 13 01 70 A4 FD 13 A5 00 
    //30 CA FD 13 16 06 24 00 04 2A 04 0B 47 
  }


  native function GetAvailableTopics(out array<Conversation_Topic> ret);



