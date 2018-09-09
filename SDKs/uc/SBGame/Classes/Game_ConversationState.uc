//==============================================================================
//  Game_ConversationState
//==============================================================================

class Game_ConversationState extends Object
    native
    dependsOn(Conversation_Topic,Conversation_Node,Class,SBDBSync,Conversation_Response,Game_Pawn,Game_Controller,Game_Conversation)
  ;

  var Game_Pawn partner;
  var export editinline Conversation_Topic CurrentTopic;
  var export editinline Conversation_Node CurrentState;
  var array<Conversation_Response> Responses;
  var array<Conversation_Topic> Topics;
  var bool Failed;


  function ConstructTopicList(out array<int> ret) {
    local int ti;
    ti = 0;                                                                     //0000 : 0F 00 E8 11 34 11 25 
    while (ti < Topics.Length) {                                                //0007 : 07 42 00 96 00 E8 11 34 11 37 01 18 B2 30 11 16 
      ret[ti] = Topics[ti].GetResourceId();                                     //0017 : 0F 10 00 E8 11 34 11 00 E8 10 34 11 19 10 00 E8 11 34 11 01 18 B2 30 11 06 00 04 1C 08 90 20 11 16 
      ti++;                                                                     //0038 : A5 00 E8 11 34 11 16 
    }
    //0F 00 E8 11 34 11 25 07 42 00 96 00 E8 11 34 11 37 01 18 B2 30 11 16 0F 10 00 E8 11 34 11 00 E8 
    //10 34 11 19 10 00 E8 11 34 11 01 18 B2 30 11 06 00 04 1C 08 90 20 11 16 A5 00 E8 11 34 11 16 06 
    //07 00 04 0B 47 
  }


  function int ConstructResponseFlags() {
    local int ret;
    local int rii;
    local int rio;
    rii = 0;                                                                    //0000 : 0F 00 F0 14 34 11 25 
    while (rii < Responses.Length) {                                            //0007 : 07 87 00 96 00 F0 14 34 11 37 01 28 B1 30 11 16 
      rio = 0;                                                                  //0017 : 0F 00 68 15 34 11 25 
      while (rio < CurrentState.Responses.Length) {                             //001E : 07 7D 00 96 00 68 15 34 11 37 19 01 38 B0 30 11 05 00 00 01 60 69 30 11 16 
        if (CurrentState.Responses[rio] == Responses[rii]) {                    //0037 : 07 73 00 72 10 00 68 15 34 11 19 01 38 B0 30 11 05 00 00 01 60 69 30 11 10 00 F0 14 34 11 01 28 B1 30 11 16 
          ret = ret | 1 << rio;                                                 //005B : 0F 00 E0 15 34 11 9E 00 E0 15 34 11 94 26 00 68 15 34 11 16 16 
          goto jl007D;                                                          //0070 : 06 7D 00 
        }
        rio++;                                                                  //0073 : A5 00 68 15 34 11 16 
      }
      rii++;                                                                    //007D : A5 00 F0 14 34 11 16 
    }
    return ret;                                                                 //0087 : 04 00 E0 15 34 11 
    //0F 00 F0 14 34 11 25 07 87 00 96 00 F0 14 34 11 37 01 28 B1 30 11 16 0F 00 68 15 34 11 25 07 7D 
    //00 96 00 68 15 34 11 37 19 01 38 B0 30 11 05 00 00 01 60 69 30 11 16 07 73 00 72 10 00 68 15 34 
    //11 19 01 38 B0 30 11 05 00 00 01 60 69 30 11 10 00 F0 14 34 11 01 28 B1 30 11 16 0F 00 E0 15 34 
    //11 9E 00 E0 15 34 11 94 26 00 68 15 34 11 16 16 06 7D 00 A5 00 68 15 34 11 16 06 1E 00 A5 00 F0 
    //14 34 11 16 06 07 00 04 00 E0 15 34 11 04 0B 47 
  }


  function cl_Initialize(Game_Pawn aPartner,int aTopic,int aState,int aResponseFlags,array<int> aTopicList) {
    local int rii;
    local int rio;
    local int ti;
    partner = aPartner;                                                         //0000 : 0F 01 E8 98 30 11 00 08 17 34 11 
    CurrentTopic = Conversation_Topic(Class'SBDBSync'.GetResourceObject(aTopic));//000B : 0F 01 48 AF 30 11 2E 40 64 5C 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 28 19 34 11 16 
    CurrentState = Conversation_Node(Class'SBDBSync'.GetResourceObject(aState));//002A : 0F 01 38 B0 30 11 2E 80 69 5C 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 A0 19 34 11 16 
    rio = 0;                                                                    //0049 : 0F 00 18 1A 34 11 25 
    Responses.Length = 0;                                                       //0050 : 0F 37 01 28 B1 30 11 25 
    rii = 0;                                                                    //0058 : 0F 00 F0 1F 38 11 25 
    while (rii < CurrentState.Responses.Length) {                               //005F : 07 BE 00 96 00 F0 1F 38 11 37 19 01 38 B0 30 11 05 00 00 01 60 69 30 11 16 
      if ((aResponseFlags & 1 << rii) != 0) {                                   //0078 : 07 B4 00 9B 9C 00 68 20 38 11 94 26 00 F0 1F 38 11 16 16 25 16 
        Responses[rio] = CurrentState.Responses[rii];                           //008D : 0F 10 00 18 1A 34 11 01 28 B1 30 11 10 00 F0 1F 38 11 19 01 38 B0 30 11 05 00 00 01 60 69 30 11 
        rio++;                                                                  //00AD : A5 00 18 1A 34 11 16 
      }
      rii++;                                                                    //00B4 : A5 00 F0 1F 38 11 16 
    }
    Topics.Length = 0;                                                          //00BE : 0F 37 01 18 B2 30 11 25 
    ti = 0;                                                                     //00C6 : 0F 00 E0 20 38 11 25 
    while (ti < aTopicList.Length) {                                            //00CD : 07 12 01 96 00 E0 20 38 11 37 00 58 21 38 11 16 
      Topics[ti] = Conversation_Topic(Class'SBDBSync'.GetResourceObject(aTopicList[ti]));//00DD : 0F 10 00 E0 20 38 11 01 18 B2 30 11 2E 40 64 5C 01 12 20 30 82 24 01 11 00 04 1B E5 0B 00 00 10 00 E0 20 38 11 00 58 21 38 11 16 
      ti++;                                                                     //0108 : A5 00 E0 20 38 11 16 
    }
    //0F 01 E8 98 30 11 00 08 17 34 11 0F 01 48 AF 30 11 2E 40 64 5C 01 12 20 30 82 24 01 0B 00 04 1B 
    //E5 0B 00 00 00 28 19 34 11 16 0F 01 38 B0 30 11 2E 80 69 5C 01 12 20 30 82 24 01 0B 00 04 1B E5 
    //0B 00 00 00 A0 19 34 11 16 0F 00 18 1A 34 11 25 0F 37 01 28 B1 30 11 25 0F 00 F0 1F 38 11 25 07 
    //BE 00 96 00 F0 1F 38 11 37 19 01 38 B0 30 11 05 00 00 01 60 69 30 11 16 07 B4 00 9B 9C 00 68 20 
    //38 11 94 26 00 F0 1F 38 11 16 16 25 16 0F 10 00 18 1A 34 11 01 28 B1 30 11 10 00 F0 1F 38 11 19 
    //01 38 B0 30 11 05 00 00 01 60 69 30 11 A5 00 18 1A 34 11 16 A5 00 F0 1F 38 11 16 06 5F 00 0F 37 
    //01 18 B2 30 11 25 0F 00 E0 20 38 11 25 07 12 01 96 00 E0 20 38 11 37 00 58 21 38 11 16 0F 10 00 
    //E0 20 38 11 01 18 B2 30 11 2E 40 64 5C 01 12 20 30 82 24 01 11 00 04 1B E5 0B 00 00 10 00 E0 20 
    //38 11 00 58 21 38 11 16 A5 00 E0 20 38 11 16 06 CD 00 04 0B 47 
  }


  function sv_Initialize(Game_Pawn aSpeaker,Game_Pawn aPartner,export editinline Conversation_Topic aTopic,export editinline Conversation_Node aState) {
    local int responseI;
    local int topicI;
    local array<Conversation_Topic> AvailableTopics;
    partner = aPartner;                                                         //0000 : 0F 01 E8 98 30 11 00 C0 22 38 11 
    CurrentState = aState;                                                      //000B : 0F 01 38 B0 30 11 00 38 23 38 11 
    CurrentTopic = aTopic;                                                      //0016 : 0F 01 48 AF 30 11 00 B0 23 38 11 
    Failed = False;                                                             //0021 : 14 2D 01 28 24 38 11 28 
    Responses.Length = 0;                                                       //0029 : 0F 37 01 28 B1 30 11 25 
    Topics.Length = 0;                                                          //0031 : 0F 37 01 18 B2 30 11 25 
    responseI = 0;                                                              //0039 : 0F 00 A0 24 38 11 25 
    while (responseI < CurrentState.Responses.Length) {                         //0040 : 07 B4 00 96 00 A0 24 38 11 37 19 01 38 B0 30 11 05 00 00 01 60 69 30 11 16 
      if (CurrentState.Responses[responseI].sv_Check(aTopic,aPartner,aSpeaker)) {//0059 : 07 AA 00 19 10 00 A0 24 38 11 19 01 38 B0 30 11 05 00 00 01 60 69 30 11 15 00 04 1B 01 07 00 00 00 B0 23 38 11 00 C0 22 38 11 00 48 22 38 11 16 
        Responses[Responses.Length] = CurrentState.Responses[responseI];        //0089 : 0F 10 37 01 28 B1 30 11 01 28 B1 30 11 10 00 A0 24 38 11 19 01 38 B0 30 11 05 00 00 01 60 69 30 11 
      }
      responseI++;                                                              //00AA : A5 00 A0 24 38 11 16 
    }
    if (!CurrentState.locked) {                                                 //00B4 : 07 85 01 81 19 01 38 B0 30 11 06 00 04 2D 01 D8 69 30 11 16 
      AvailableTopics.Length = 0;                                               //00C8 : 0F 37 00 18 25 38 11 25 
      Game_Controller(aSpeaker.Controller).ConversationControl.GetAvailableTopics(AvailableTopics);//00D0 : 19 19 2E 10 0E 5B 01 19 00 48 22 38 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 0B 00 00 1B 62 05 00 00 00 18 25 38 11 16 
      topicI = 0;                                                               //00FB : 0F 00 90 25 38 11 25 
      while (topicI < AvailableTopics.Length) {                                 //0102 : 07 85 01 96 00 90 25 38 11 37 00 18 25 38 11 16 
        if (aTopic == None
          || aTopic.sv_FilterTopic(AvailableTopics[topicI])
          && AvailableTopics[topicI].CheckConversation(aSpeaker,aPartner) != None) {//0112 : 07 7B 01 84 72 00 B0 23 38 11 2A 16 18 42 00 82 19 00 B0 23 38 11 11 00 04 1B 0C 0E 00 00 10 00 90 25 38 11 00 18 25 38 11 16 18 23 00 77 19 10 00 90 25 38 11 00 18 25 38 11 10 00 04 1C 90 B1 24 11 00 48 22 38 11 00 C0 22 38 11 16 2A 16 16 16 
          Topics[Topics.Length] = AvailableTopics[topicI];                      //0163 : 0F 10 37 01 18 B2 30 11 01 18 B2 30 11 10 00 90 25 38 11 00 18 25 38 11 
        }
        topicI++;                                                               //017B : A5 00 90 25 38 11 16 
      }
    }
    //0F 01 E8 98 30 11 00 C0 22 38 11 0F 01 38 B0 30 11 00 38 23 38 11 0F 01 48 AF 30 11 00 B0 23 38 
    //11 14 2D 01 28 24 38 11 28 0F 37 01 28 B1 30 11 25 0F 37 01 18 B2 30 11 25 0F 00 A0 24 38 11 25 
    //07 B4 00 96 00 A0 24 38 11 37 19 01 38 B0 30 11 05 00 00 01 60 69 30 11 16 07 AA 00 19 10 00 A0 
    //24 38 11 19 01 38 B0 30 11 05 00 00 01 60 69 30 11 15 00 04 1B 01 07 00 00 00 B0 23 38 11 00 C0 
    //22 38 11 00 48 22 38 11 16 0F 10 37 01 28 B1 30 11 01 28 B1 30 11 10 00 A0 24 38 11 19 01 38 B0 
    //30 11 05 00 00 01 60 69 30 11 A5 00 A0 24 38 11 16 06 40 00 07 85 01 81 19 01 38 B0 30 11 06 00 
    //04 2D 01 D8 69 30 11 16 0F 37 00 18 25 38 11 25 19 19 2E 10 0E 5B 01 19 00 48 22 38 11 05 00 04 
    //01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 0B 00 00 1B 62 05 00 00 00 18 25 38 11 16 0F 00 90 25 38 
    //11 25 07 85 01 96 00 90 25 38 11 37 00 18 25 38 11 16 07 7B 01 84 72 00 B0 23 38 11 2A 16 18 42 
    //00 82 19 00 B0 23 38 11 11 00 04 1B 0C 0E 00 00 10 00 90 25 38 11 00 18 25 38 11 16 18 23 00 77 
    //19 10 00 90 25 38 11 00 18 25 38 11 10 00 04 1C 90 B1 24 11 00 48 22 38 11 00 C0 22 38 11 16 2A 
    //16 16 16 0F 10 37 01 18 B2 30 11 01 18 B2 30 11 10 00 90 25 38 11 00 18 25 38 11 A5 00 90 25 38 
    //11 16 06 02 01 04 0B 47 
  }



