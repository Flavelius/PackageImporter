//==============================================================================
//  Quest_Type
//==============================================================================

class Quest_Type extends Content_Type
    native
    dependsOn(Game_ActiveTextItem,Quest_Target,Quest_Reward,NPC_Type)
  ;

  enum EQuestArea {
    QA_Tech ,
    QA_Carnyx ,
    QA_Quarterstone ,
    QA_Ringfell ,
    QA_MountOfHeroes ,
    QA_Parliament ,
    QA_DeadspellStorm ,
    QA_Ancestral 
  };

  var (Information) byte QuestArea;
  var (Information) LocalizedString Name;
  var (Information) const LocalizedString Summary;
  var (Information) const string Tag;
  var (Information) const string Note;
  var (Information) const export editinline Quest_Chain QuestChain;
  var (Information) const int Level;
  var (ProvideChat) const bool DeliverByMail;
  var (ProvideChat) const export editinline NPC_Type Provider;
  var (ProvideChat) const export editinline Conversation_Topic ProvideTopic;
  var (MidChat) const export editinline Conversation_Topic MidTopic;
  var (MidChat) const bool ProviderMidChat;
  var (MidChat) const bool FinisherMidChat;
  var (FinishChat) const export editinline NPC_Type Finisher;
  var (FinishChat) const export editinline Conversation_Topic FinishTopic;
  var (Requirement) const editinline array<Content_Requirement> Requirements;
  var (Requirement) const editinline array<Quest_Type> Prequests;
  var (Requirement) const bool Disabled;
  var (Target) const editinline array<Quest_Target> Targets;
  var (Rewards) const editinline array<Quest_Reward> Rewards;
  var const int QuestLevelLowerDelta;


  event string GetActiveText(Game_ActiveTextItem aItem) {
    local export editinline Quest_Target Target;
    local export editinline Quest_Reward reward;
    if (aItem == None || aItem.Tag == "N") {                                    //0000 : 07 2D 00 84 72 00 98 49 2E 11 2A 16 18 14 00 7A 19 00 98 49 2E 11 05 00 00 01 08 9B 18 11 1F 4E 00 16 16 
      return GetName();                                                         //0023 : 04 1B F9 03 00 00 16 
    } else {                                                                    //002A : 06 B1 01 
      if (aItem.Tag == "T") {                                                   //002D : 07 97 00 7A 19 00 98 49 2E 11 05 00 00 01 08 9B 18 11 1F 54 00 16 
        Target = Targets[aItem.Ordinality];                                     //0043 : 0F 00 90 4C 2E 11 10 19 00 98 49 2E 11 05 00 04 01 08 9F 24 11 01 08 4D 2E 11 
        if (Target != None) {                                                   //005D : 07 89 00 77 00 90 4C 2E 11 2A 16 
          return Target.GetActiveText(aItem.SubItem);                           //0068 : 04 19 00 90 4C 2E 11 14 00 00 1B 60 05 00 00 19 00 98 49 2E 11 05 00 04 01 20 9D 18 11 16 
        } else {                                                                //0086 : 06 94 00 
          return "?Target?";                                                    //0089 : 04 1F 3F 54 61 72 67 65 74 3F 00 
        }
      } else {                                                                  //0094 : 06 B1 01 
        if (aItem.Tag == "R") {                                                 //0097 : 07 01 01 7A 19 00 98 49 2E 11 05 00 00 01 08 9B 18 11 1F 52 00 16 
          reward = Rewards[aItem.Ordinality];                                   //00AD : 0F 00 80 4D 2E 11 10 19 00 98 49 2E 11 05 00 04 01 08 9F 24 11 01 F8 4D 2E 11 
          if (reward != None) {                                                 //00C7 : 07 F3 00 77 00 80 4D 2E 11 2A 16 
          } else {                                                              //00F0 : 06 FE 00 
            return "?Reward?";                                                  //00F3 : 04 1F 3F 52 65 77 61 72 64 3F 00 
          }
        } else {                                                                //00FE : 06 B1 01 
          if (aItem.Tag == "P") {                                               //0101 : 07 53 01 7A 19 00 98 49 2E 11 05 00 00 01 08 9B 18 11 1F 50 00 16 
            if (Provider != None) {                                             //0117 : 07 43 01 77 01 70 4E 2E 11 2A 16 
              return Provider.GetActiveText(aItem.SubItem);                     //0122 : 04 19 01 70 4E 2E 11 14 00 00 1B 60 05 00 00 19 00 98 49 2E 11 05 00 04 01 20 9D 18 11 16 
            } else {                                                            //0140 : 06 50 01 
              return "?Provider?";                                              //0143 : 04 1F 3F 50 72 6F 76 69 64 65 72 3F 00 
            }
          } else {                                                              //0150 : 06 B1 01 
            if (aItem.Tag == "F") {                                             //0153 : 07 A5 01 7A 19 00 98 49 2E 11 05 00 00 01 08 9B 18 11 1F 46 00 16 
              if (Finisher != None) {                                           //0169 : 07 95 01 77 01 E8 4E 2E 11 2A 16 
                return Finisher.GetActiveText(aItem.SubItem);                   //0174 : 04 19 01 E8 4E 2E 11 14 00 00 1B 60 05 00 00 19 00 98 49 2E 11 05 00 04 01 20 9D 18 11 16 
              } else {                                                          //0192 : 06 A2 01 
                return "?Finisher?";                                            //0195 : 04 1F 3F 46 69 6E 69 73 68 65 72 3F 00 
              }
            } else {                                                            //01A2 : 06 B1 01 
              return Super.GetActiveText(aItem);                                //01A5 : 04 1C 60 3C 1F 11 00 98 49 2E 11 16 
            }
          }
        }
      }
    }
    //07 2D 00 84 72 00 98 49 2E 11 2A 16 18 14 00 7A 19 00 98 49 2E 11 05 00 00 01 08 9B 18 11 1F 4E 
    //00 16 16 04 1B F9 03 00 00 16 06 B1 01 07 97 00 7A 19 00 98 49 2E 11 05 00 00 01 08 9B 18 11 1F 
    //54 00 16 0F 00 90 4C 2E 11 10 19 00 98 49 2E 11 05 00 04 01 08 9F 24 11 01 08 4D 2E 11 07 89 00 
    //77 00 90 4C 2E 11 2A 16 04 19 00 90 4C 2E 11 14 00 00 1B 60 05 00 00 19 00 98 49 2E 11 05 00 04 
    //01 20 9D 18 11 16 06 94 00 04 1F 3F 54 61 72 67 65 74 3F 00 06 B1 01 07 01 01 7A 19 00 98 49 2E 
    //11 05 00 00 01 08 9B 18 11 1F 52 00 16 0F 00 80 4D 2E 11 10 19 00 98 49 2E 11 05 00 04 01 08 9F 
    //24 11 01 F8 4D 2E 11 07 F3 00 77 00 80 4D 2E 11 2A 16 0E 19 00 80 4D 2E 11 14 00 00 1B 60 05 00 
    //00 19 00 98 49 2E 11 05 00 04 01 20 9D 18 11 16 06 FE 00 04 1F 3F 52 65 77 61 72 64 3F 00 06 B1 
    //01 07 53 01 7A 19 00 98 49 2E 11 05 00 00 01 08 9B 18 11 1F 50 00 16 07 43 01 77 01 70 4E 2E 11 
    //2A 16 04 19 01 70 4E 2E 11 14 00 00 1B 60 05 00 00 19 00 98 49 2E 11 05 00 04 01 20 9D 18 11 16 
    //06 50 01 04 1F 3F 50 72 6F 76 69 64 65 72 3F 00 06 B1 01 07 A5 01 7A 19 00 98 49 2E 11 05 00 00 
    //01 08 9B 18 11 1F 46 00 16 07 95 01 77 01 E8 4E 2E 11 2A 16 04 19 01 E8 4E 2E 11 14 00 00 1B 60 
    //05 00 00 19 00 98 49 2E 11 05 00 04 01 20 9D 18 11 16 06 A2 01 04 1F 3F 46 69 6E 69 73 68 65 72 
    //3F 00 06 B1 01 04 1C 60 3C 1F 11 00 98 49 2E 11 16 04 0B 47 
  }


  final native function bool CheckPawn(Game_Pawn aCandidate);


  final native function sv_OnComplete(Game_Pawn aPawn);


  final native function bool sv_CanComplete(Game_Pawn aPawn);


  final native function sv_OnAccept(Game_Pawn aPawn);


  function string GetName() {
    if (Len(Name.Text) > 0) {                                                   //0000 : 07 20 00 97 7D 36 58 C6 6B 0F 01 70 57 2E 11 16 25 16 
      return Name.Text;                                                         //0012 : 04 36 58 C6 6B 0F 01 70 57 2E 11 
    } else {                                                                    //001D : 06 30 00 
      return "Unnamed quest";                                                   //0020 : 04 1F 55 6E 6E 61 6D 65 64 20 71 75 65 73 74 00 
    }
    //07 20 00 97 7D 36 58 C6 6B 0F 01 70 57 2E 11 16 25 16 04 36 58 C6 6B 0F 01 70 57 2E 11 06 30 00 
    //04 1F 55 6E 6E 61 6D 65 64 20 71 75 65 73 74 00 04 0B 47 
  }



