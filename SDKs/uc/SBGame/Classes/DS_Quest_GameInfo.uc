//==============================================================================
//  DS_Quest_GameInfo
//==============================================================================

class DS_Quest_GameInfo extends Deadspell_GameInfo
    native
    exportstructs
    dependsOn()
  ;

  struct QuestEvent {
      var (QuestEvent) name Event;
      var (QuestEvent) float Duration;
      var (QuestEvent) float TargetPerc;

  };


  var (QuestEvents) editinline array<QuestEvent> QuestEvents;
  var (QuestEvents) editinline name QuestStartEvent;
  var (QuestEvents) string StartPortalNavigationTag;
  var int CurrentEvent;
  var float CurrentPerc;
  var float TargetPerc;
  var float PercPerSec;
  var (Travel) float WaitSecHack;
  var (Travel) float OutroSecHack;
  var float mTime;
  var float mOutroTime;
  var transient bool mQuestStarted;
  var bool mQuestFinished;


  event Trigger(Actor Other,Pawn EventInstigator) {
    TargetPerc = QuestEvents[CurrentEvent].TargetPerc;                          //0000 : 0F 01 88 55 34 19 36 00 56 34 19 10 01 78 56 34 19 01 F0 56 34 19 
    PercPerSec = (TargetPerc - CurrentPerc) / Max(QuestEvents[CurrentEvent].Duration,1);//0016 : 0F 01 68 57 34 19 AC AF 01 88 55 34 19 01 E0 57 34 19 16 39 3F FA 39 44 36 58 58 34 19 10 01 78 56 34 19 01 F0 56 34 19 26 16 16 
    if (++CurrentEvent <= QuestEvents.Length) {                                 //0041 : 07 69 00 98 A3 01 78 56 34 19 16 37 01 F0 56 34 19 16 
      Tag = QuestEvents[CurrentEvent].Event;                                    //0053 : 0F 01 C0 9E 6C 0F 36 D0 58 34 19 10 01 78 56 34 19 01 F0 56 34 19 
    }
    //0F 01 88 55 34 19 36 00 56 34 19 10 01 78 56 34 19 01 F0 56 34 19 0F 01 68 57 34 19 AC AF 01 88 
    //55 34 19 01 E0 57 34 19 16 39 3F FA 39 44 36 58 58 34 19 10 01 78 56 34 19 01 F0 56 34 19 26 16 
    //16 07 69 00 98 A3 01 78 56 34 19 16 37 01 F0 56 34 19 16 0F 01 C0 9E 6C 0F 36 D0 58 34 19 10 01 
    //78 56 34 19 01 F0 56 34 19 04 0B 47 
  }


  event PostBeginPlay() {
    Super.PostBeginPlay();                                                      //0000 : 1C 18 48 34 19 16 
    DSQuestParseInstanceOptions("");                                            //0006 : 1B 3F 0F 00 00 1F 00 16 
    mTime = -WaitSecHack;                                                       //000E : 0F 01 70 5A 34 19 A9 01 E8 5A 34 19 16 
    if (QuestEvents.Length > 0) {                                               //001B : 07 4B 00 97 37 01 F0 56 34 19 25 16 
      Tag = QuestEvents[0].Event;                                               //0027 : 0F 01 C0 9E 6C 0F 36 D0 58 34 19 10 25 01 F0 56 34 19 
      CurrentEvent = 0;                                                         //0039 : 0F 01 78 56 34 19 25 
      CurrentPerc = 0.00000000;                                                 //0040 : 0F 01 E0 57 34 19 1E 00 00 00 00 
    }
    //1C 18 48 34 19 16 1B 3F 0F 00 00 1F 00 16 0F 01 70 5A 34 19 A9 01 E8 5A 34 19 16 07 4B 00 97 37 
    //01 F0 56 34 19 25 16 0F 01 C0 9E 6C 0F 36 D0 58 34 19 10 25 01 F0 56 34 19 0F 01 78 56 34 19 25 
    //0F 01 E0 57 34 19 1E 00 00 00 00 04 0B 47 
  }


  native function DSQuestParseInstanceOptions(string Options);



