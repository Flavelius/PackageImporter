//==============================================================================
//  Game_PlayerQuestLog
//==============================================================================

class Game_PlayerQuestLog extends Game_QuestLog within Game_PlayerPawn
    native
    exportstructs
    dependsOn(SBDBSync,Game_PlayerPawn,Game_Controller,Game_PlayerConversation,Game_PlayerController)
  ;


  protected event bool sv_CheckQuest(export editinline Quest_Type aQuest) {
    return aQuest.CheckPawn(Outer);                                             //0000 : 04 19 00 D8 C1 34 11 0B 00 04 1C E8 48 2E 11 01 00 E4 6B 0F 16 
    //04 19 00 D8 C1 34 11 0B 00 04 1C E8 48 2E 11 01 00 E4 6B 0F 16 04 0B 47 
  }


  protected native function sv2cl_SetTargetProgress_CallStub();


  protected event sv2cl_SetTargetProgress(int aQuestID,int TargetNr,int aProgress) {
    local export editinline Quest_Type quest;
    quest = Quest_Type(Class'SBDBSync'.GetResourceObject(aQuestID));            //0000 : 0F 00 C8 C5 34 11 2E F0 9D 5C 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 78 C4 34 11 16 
    if (quest == None) {                                                        //001F : 07 2D 00 72 00 C8 C5 34 11 2A 16 
    } else {                                                                    //002A : 06 78 00 
      SetTargetProgress(quest,TargetNr,aProgress);                              //002D : 1C 80 07 30 11 00 C8 C5 34 11 00 40 C6 34 11 00 B8 C6 34 11 16 
      ComputeTargetActivation(quest);                                           //0042 : 1C 30 11 30 11 00 C8 C5 34 11 16 
      Game_PlayerConversation(Game_Controller(Outer.Controller).ConversationControl).cl_RefreshTopics();//004D : 19 2E 20 80 60 01 19 2E 10 0E 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 06 00 00 1C 18 38 7F 0F 16 
    }
    //0F 00 C8 C5 34 11 2E F0 9D 5C 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 78 C4 34 11 16 07 
    //2D 00 72 00 C8 C5 34 11 2A 16 06 78 00 1C 80 07 30 11 00 C8 C5 34 11 00 40 C6 34 11 00 B8 C6 34 
    //11 16 1C 30 11 30 11 00 C8 C5 34 11 16 19 2E 20 80 60 01 19 2E 10 0E 5B 01 19 01 00 E4 6B 0F 05 
    //00 04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 06 00 00 1C 18 38 7F 0F 16 04 0B 47 
  }


  protected native function sv2cl_RemoveQuest_CallStub();


  event sv2cl_RemoveQuest(int aQuestID) {
    local export editinline Quest_Type quest;
    quest = Quest_Type(Class'SBDBSync'.GetResourceObject(aQuestID));            //0000 : 0F 00 08 C9 34 11 2E F0 9D 5C 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 90 C8 34 11 16 
    if (quest == None) {                                                        //001F : 07 2D 00 72 00 08 C9 34 11 2A 16 
    } else {                                                                    //002A : 06 63 00 
      RemoveQuest(quest);                                                       //002D : 1C 28 0C 30 11 00 08 C9 34 11 16 
      Game_PlayerConversation(Game_Controller(Outer.Controller).ConversationControl).cl_RefreshTopics();//0038 : 19 2E 20 80 60 01 19 2E 10 0E 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 06 00 00 1C 18 38 7F 0F 16 
    }
    //0F 00 08 C9 34 11 2E F0 9D 5C 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 90 C8 34 11 16 07 
    //2D 00 72 00 08 C9 34 11 2A 16 06 63 00 1C 28 0C 30 11 00 08 C9 34 11 16 19 2E 20 80 60 01 19 2E 
    //10 0E 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 06 00 00 1C 18 38 
    //7F 0F 16 04 0B 47 
  }


  protected function cl_CompleteQuest(int aQuestID) {
    local export editinline Quest_Type quest;
    quest = Quest_Type(Class'SBDBSync'.GetResourceObject(aQuestID));            //0000 : 0F 00 70 CB 34 11 2E F0 9D 5C 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 30 CA 34 11 16 
    if (quest == None) {                                                        //001F : 07 2D 00 72 00 70 CB 34 11 2A 16 
    } else {                                                                    //002A : 06 6E 00 
      RemoveQuest(quest);                                                       //002D : 1C 28 0C 30 11 00 70 CB 34 11 16 
      AddCompletedQuest(quest);                                                 //0038 : 1C 68 14 30 11 00 70 CB 34 11 16 
      Game_PlayerConversation(Game_Controller(Outer.Controller).ConversationControl).cl_RefreshTopics();//0043 : 19 2E 20 80 60 01 19 2E 10 0E 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 06 00 00 1C 18 38 7F 0F 16 
    }
    //0F 00 70 CB 34 11 2E F0 9D 5C 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 30 CA 34 11 16 07 
    //2D 00 72 00 70 CB 34 11 2A 16 06 6E 00 1C 28 0C 30 11 00 70 CB 34 11 16 1C 68 14 30 11 00 70 CB 
    //34 11 16 19 2E 20 80 60 01 19 2E 10 0E 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 
    //01 C8 07 1B 11 06 00 00 1C 18 38 7F 0F 16 04 0B 47 
  }


  protected native function sv2cl_CompleteQuest_CallStub();


  protected event sv2cl_CompleteQuest(int aQuestID) {
    cl_CompleteQuest(aQuestID);                                                 //0000 : 1B 90 0D 00 00 00 48 CD 34 11 16 
    //1B 90 0D 00 00 00 48 CD 34 11 16 04 0B 47 
  }


  protected function cl_AddQuest(int aQuestID,array<int> aProgress) {
    local export editinline Quest_Type quest;
    quest = Quest_Type(Class'SBDBSync'.GetResourceObject(aQuestID));            //0000 : 0F 00 A8 CF 34 11 2E F0 9D 5C 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 70 CE 34 11 16 
    if (quest == None) {                                                        //001F : 07 2D 00 72 00 A8 CF 34 11 2A 16 
    } else {                                                                    //002A : 06 68 00 
      AddQuest(quest,aProgress);                                                //002D : 1C 08 13 30 11 00 A8 CF 34 11 00 20 D0 34 11 16 
      Game_PlayerConversation(Game_Controller(Outer.Controller).ConversationControl).cl_RefreshTopics();//003D : 19 2E 20 80 60 01 19 2E 10 0E 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 06 00 00 1C 18 38 7F 0F 16 
    }
    //0F 00 A8 CF 34 11 2E F0 9D 5C 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 70 CE 34 11 16 07 
    //2D 00 72 00 A8 CF 34 11 2A 16 06 68 00 1C 08 13 30 11 00 A8 CF 34 11 00 20 D0 34 11 16 19 2E 20 
    //80 60 01 19 2E 10 0E 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 06 
    //00 00 1C 18 38 7F 0F 16 04 0B 47 
  }


  protected native function sv2cl_AddQuest_CallStub();


  protected event sv2cl_AddQuest(int aQuestID,array<int> aProgress) {
    cl_AddQuest(aQuestID,aProgress);                                            //0000 : 1B 91 0D 00 00 00 70 D2 34 11 00 30 D3 34 11 16 
    //1B 91 0D 00 00 00 70 D2 34 11 00 30 D3 34 11 16 04 0B 47 
  }


  protected native function sv2cl_FinishQuest_CallStub();


  protected event sv2cl_FinishQuest(int aQuestID) {
    cl_CompleteQuest(aQuestID);                                                 //0000 : 1B 90 0D 00 00 00 80 D5 34 11 16 
    OnFinishQuest(aQuestID);                                                    //000B : 43 00 5B 30 11 C7 05 00 00 00 80 D5 34 11 16 
    //1B 90 0D 00 00 00 80 D5 34 11 16 43 00 5B 30 11 C7 05 00 00 00 80 D5 34 11 16 04 0B 47 
  }


  protected native function sv2cl_AcceptQuest_CallStub();


  protected event sv2cl_AcceptQuest(int aQuestID,array<int> aProgress) {
    cl_AddQuest(aQuestID,aProgress);                                            //0000 : 1B 91 0D 00 00 00 A8 D7 34 11 00 20 D8 34 11 16 
    OnAcceptQuest(aQuestID);                                                    //0010 : 43 88 5A 30 11 AF 05 00 00 00 A8 D7 34 11 16 
    //1B 91 0D 00 00 00 A8 D7 34 11 00 20 D8 34 11 16 43 88 5A 30 11 AF 05 00 00 00 A8 D7 34 11 16 04 
    //0B 47 
  }


  native function CheckMailQuests();


  protected native function cl2sv_SwirlyOption_CallStub();


  event cl2sv_SwirlyOption(byte aMainOption,byte aSubOption) {
    Game_Controller(Outer.Controller).sv_FireHook(3,None,aMainOption << 16 | aSubOption);//0000 : 19 2E 10 0E 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 1D 00 00 1B 0D 07 00 00 24 03 2A 9E 94 39 3A 00 50 DB 34 11 2C 10 16 39 3A 00 40 DC 34 11 16 16 
    //19 2E 10 0E 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 1D 00 00 1B 0D 07 00 00 24 03 2A 9E 
    //94 39 3A 00 50 DB 34 11 2C 10 16 39 3A 00 40 DC 34 11 16 16 04 0B 47 
  }


  protected native function cl2sv_SwirlyOptionPawn_CallStub();


  event cl2sv_SwirlyOptionPawn(Game_Pawn aPawn,byte aMainOption,byte aSubOption) {
    Game_Controller(Outer.Controller).sv_FireHook(3,Game_NPCPawn(aPawn),aMainOption << 16 | aSubOption);//0000 : 19 2E 10 0E 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 26 00 00 1B 0D 07 00 00 24 03 2E D0 32 5B 01 00 18 DE 34 11 9E 94 39 3A 00 10 DF 34 11 2C 10 16 39 3A 00 88 DF 34 11 16 16 
    //19 2E 10 0E 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 26 00 00 1B 0D 07 00 00 24 03 2E D0 
    //32 5B 01 00 18 DE 34 11 9E 94 39 3A 00 10 DF 34 11 2C 10 16 39 3A 00 88 DF 34 11 16 16 04 0B 47 
    //
  }


  protected native function cl2sv_AbandonQuest_CallStub();


  event cl2sv_AbandonQuest(int aQuestID) {
    local export editinline Quest_Type quest;
    quest = Quest_Type(Class'SBDBSync'.GetResourceObject(aQuestID));            //0000 : 0F 00 60 E2 34 11 2E F0 9D 5C 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 68 E1 34 11 16 
    if (quest != None) {                                                        //001F : 07 3D 00 77 00 60 E2 34 11 2A 16 
      if (!sv_AbandonQuest(quest)) {                                            //002A : 07 3A 00 81 1C 30 39 30 11 00 60 E2 34 11 16 16 
      }
      goto jl003D;                                                              //003A : 06 3D 00 
    }
    //0F 00 60 E2 34 11 2E F0 9D 5C 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 68 E1 34 11 16 07 
    //3D 00 77 00 60 E2 34 11 2A 16 07 3A 00 81 1C 30 39 30 11 00 60 E2 34 11 16 16 06 3D 00 04 0B 47 
    //
  }


  function cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C E0 C4 19 11 16 
    Init();                                                                     //0006 : 1C D8 E2 34 11 16 
    Game_PlayerConversation(Game_PlayerController(Outer.Controller).ConversationControl).cl_RefreshTopics();//000C : 19 2E 20 80 60 01 19 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 06 00 00 1C 18 38 7F 0F 16 
    //1C E0 C4 19 11 16 1C D8 E2 34 11 16 19 2E 20 80 60 01 19 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 
    //04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 06 00 00 1C 18 38 7F 0F 16 04 0B 47 
  }


  private final native function Init();



