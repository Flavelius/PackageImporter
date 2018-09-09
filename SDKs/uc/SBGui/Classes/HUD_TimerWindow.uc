//==============================================================================
//  HUD_TimerWindow
//==============================================================================

class HUD_TimerWindow extends GUI_Window
    native
    exportstructs
    dependsOn(Quest_Type,Quest_Target,QC_Timed,QT_Wait,Game_PlayerPawn,Game_QuestLog,GUI_Label)
    Transient
    Config(User)
  ;

  const HTW_FADEOUT_TIME =  1;
  const HTW_FADEIN_TIME =  0.5;
  const HTW_TIMERLABELOFFSET =  4;
  const HTW_TIMERLABELHEIGHT =  26;
  const HTW_TIMERLABELWIDTH =  52;
  const HTW_TITLEBARHEIGHT =  25;
  enum ESortingTypes {
    ESO_Expiration ,
    ESO_Creation 
  };

  enum ETimerTypes {
    ETI_Quest 
  };

  struct HUDQuestTimer {
      var export editinline Quest_Type quest;
      var int TargetIndex;
      var int TimerID;
      var int GoalTime;
      var int PreviousProgress;

  };


  struct OnScreenTimer {
      var GUI_Label TimerLabel;
      var byte TimerType;
      var float Time;
      var float CreationTime;
      var int TimerID;
      var bool Active;

  };


  var private GUI_Button mSystemButton;
  var array<OnScreenTimer> OnScreenTimers;
  var array<HUDQuestTimer> QuestTimers;
  var byte Sorting;
  var int CurrentTimerID;
  var float InternalTimer;
  var float NextUpdateTime;
  var GUI_Page TimerPage;
  var Color TimerColor;
  var Color TimerColorWarning1;
  var Color TimerColorWarning2;


  private function CreateQuestTimer(export editinline Quest_Type aQuest,int aTargetNr,int aProgress) {
    local int pos;
    local HUDQuestTimer newTimer;
    local string tooltipText;
    local int newIdx;
    newTimer.quest = aQuest;                                                    //0000 : 0F 36 68 B2 A3 19 00 E0 B2 A3 19 00 F0 B1 A3 19 
    newTimer.TargetIndex = aTargetNr;                                           //0010 : 0F 36 58 B3 A3 19 00 E0 B2 A3 19 00 D0 B3 A3 19 
    if (aQuest.Targets[aTargetNr].IsA('QC_Timed')) {                            //0020 : 07 73 00 19 10 00 D0 B3 A3 19 19 00 F0 B1 A3 19 05 00 00 01 08 4D 2E 11 08 00 04 61 2F 21 8B 08 00 00 16 
      newTimer.GoalTime = QC_Timed(aQuest.Targets[aTargetNr]).Seconds;          //0043 : 0F 36 48 B4 A3 19 00 E0 B2 A3 19 19 2E 10 F7 8D 01 10 00 D0 B3 A3 19 19 00 F0 B1 A3 19 05 00 00 01 08 4D 2E 11 05 00 04 01 F8 54 32 19 
    } else {                                                                    //0070 : 06 A0 00 
      newTimer.GoalTime = QT_Wait(aQuest.Targets[aTargetNr]).Seconds;           //0073 : 0F 36 48 B4 A3 19 00 E0 B2 A3 19 19 2E 10 E2 8D 01 10 00 D0 B3 A3 19 19 00 F0 B1 A3 19 05 00 00 01 08 4D 2E 11 05 00 04 01 D8 65 32 19 
    }
    newTimer.PreviousProgress = aProgress;                                      //00A0 : 0F 36 C0 B4 A3 19 00 E0 B2 A3 19 00 38 B5 A3 19 
    tooltipText = aQuest.ParseText(aQuest.Targets[aTargetNr].GetDescription(aProgress),aQuest.Provider,aQuest.Targets[aTargetNr],GetPawn());//00B0 : 0F 00 B0 B5 A3 19 19 00 F0 B1 A3 19 51 00 00 1B D8 0C 00 00 19 10 00 D0 B3 A3 19 19 00 F0 B1 A3 19 05 00 00 01 08 4D 2E 11 0B 00 00 1C 18 D3 2F 11 00 38 B5 A3 19 16 19 00 F0 B1 A3 19 05 00 04 01 70 4E 2E 11 10 00 D0 B3 A3 19 19 00 F0 B1 A3 19 05 00 00 01 08 4D 2E 11 1B 2B 0C 00 00 16 16 
    pos = InStr(tooltipText,":");                                               //0110 : 0F 00 28 B6 A3 19 7E 00 B0 B5 A3 19 1F 3A 00 16 
    if (pos >= 0) {                                                             //0120 : 07 3D 01 99 00 28 B6 A3 19 25 16 
      tooltipText = Left(tooltipText,pos);                                      //012B : 0F 00 B0 B5 A3 19 80 00 B0 B5 A3 19 00 28 B6 A3 19 16 
    }
    tooltipText = aQuest.GetName() $ ":~" $ tooltipText;                        //013D : 0F 00 B0 B5 A3 19 70 70 19 00 F0 B1 A3 19 06 00 00 1B F9 03 00 00 16 1F 3A 7E 00 16 00 B0 B5 A3 19 16 
    newTimer.TimerID = CreateOnScreenTimer(newTimer.GoalTime - aProgress,0,tooltipText);//015F : 0F 36 A0 B6 A3 19 00 E0 B2 A3 19 1B D4 9A 00 00 39 3F 93 36 48 B4 A3 19 00 E0 B2 A3 19 00 38 B5 A3 19 16 24 00 00 B0 B5 A3 19 16 
    newIdx = QuestTimers.Length;                                                //018A : 0F 00 18 B7 A3 19 37 01 90 B7 A3 19 
    QuestTimers[newIdx] = newTimer;                                             //0196 : 0F 10 00 18 B7 A3 19 01 90 B7 A3 19 00 E0 B2 A3 19 
    //0F 36 68 B2 A3 19 00 E0 B2 A3 19 00 F0 B1 A3 19 0F 36 58 B3 A3 19 00 E0 B2 A3 19 00 D0 B3 A3 19 
    //07 73 00 19 10 00 D0 B3 A3 19 19 00 F0 B1 A3 19 05 00 00 01 08 4D 2E 11 08 00 04 61 2F 21 8B 08 
    //00 00 16 0F 36 48 B4 A3 19 00 E0 B2 A3 19 19 2E 10 F7 8D 01 10 00 D0 B3 A3 19 19 00 F0 B1 A3 19 
    //05 00 00 01 08 4D 2E 11 05 00 04 01 F8 54 32 19 06 A0 00 0F 36 48 B4 A3 19 00 E0 B2 A3 19 19 2E 
    //10 E2 8D 01 10 00 D0 B3 A3 19 19 00 F0 B1 A3 19 05 00 00 01 08 4D 2E 11 05 00 04 01 D8 65 32 19 
    //0F 36 C0 B4 A3 19 00 E0 B2 A3 19 00 38 B5 A3 19 0F 00 B0 B5 A3 19 19 00 F0 B1 A3 19 51 00 00 1B 
    //D8 0C 00 00 19 10 00 D0 B3 A3 19 19 00 F0 B1 A3 19 05 00 00 01 08 4D 2E 11 0B 00 00 1C 18 D3 2F 
    //11 00 38 B5 A3 19 16 19 00 F0 B1 A3 19 05 00 04 01 70 4E 2E 11 10 00 D0 B3 A3 19 19 00 F0 B1 A3 
    //19 05 00 00 01 08 4D 2E 11 1B 2B 0C 00 00 16 16 0F 00 28 B6 A3 19 7E 00 B0 B5 A3 19 1F 3A 00 16 
    //07 3D 01 99 00 28 B6 A3 19 25 16 0F 00 B0 B5 A3 19 80 00 B0 B5 A3 19 00 28 B6 A3 19 16 0F 00 B0 
    //B5 A3 19 70 70 19 00 F0 B1 A3 19 06 00 00 1B F9 03 00 00 16 1F 3A 7E 00 16 00 B0 B5 A3 19 16 0F 
    //36 A0 B6 A3 19 00 E0 B2 A3 19 1B D4 9A 00 00 39 3F 93 36 48 B4 A3 19 00 E0 B2 A3 19 00 38 B5 A3 
    //19 16 24 00 00 B0 B5 A3 19 16 0F 00 18 B7 A3 19 37 01 90 B7 A3 19 0F 10 00 18 B7 A3 19 01 90 B7 
    //A3 19 00 E0 B2 A3 19 04 0B 47 
  }


  private function UpdateQuestTimers() {
    local int i;
    local int j;
    local int k;
    local int targetProgress;
    local export editinline Game_QuestLog lQuestLog;
    local bool found;
    lQuestLog = Game_PlayerPawn(GetPawn()).questLog;                            //0000 : 0F 00 A0 BE A3 19 19 2E F0 47 5B 01 1B 2B 0C 00 00 16 05 00 04 01 F0 2F 7F 0F 
    if (lQuestLog != None) {                                                    //001A : 07 70 03 77 00 A0 BE A3 19 2A 16 
      i = 0;                                                                    //0025 : 0F 00 40 B9 A3 19 25 
      while (i < QuestTimers.Length) {                                          //002C : 07 0E 01 96 00 40 B9 A3 19 37 01 90 B7 A3 19 16 
        found = False;                                                          //003C : 14 2D 00 18 BF A3 19 28 
        j = 0;                                                                  //0044 : 0F 00 90 BF A3 19 25 
        while (j < lQuestLog.Quests.Length) {                                   //004B : 07 DE 00 96 00 90 BF A3 19 37 19 00 A0 BE A3 19 05 00 00 01 18 31 2F 11 16 
          if (QuestTimers[i].quest == lQuestLog.Quests[j]) {                    //0064 : 07 D4 00 72 36 68 B2 A3 19 10 00 40 B9 A3 19 01 90 B7 A3 19 10 00 90 BF A3 19 19 00 A0 BE A3 19 05 00 00 01 18 31 2F 11 16 
            if (lQuestLog.GetActivation(QuestTimers[i].quest.Targets[QuestTimers[i].TargetIndex])) {//008D : 07 D1 00 19 00 A0 BE A3 19 30 00 04 1C 68 2D 30 11 10 36 58 B3 A3 19 10 00 40 B9 A3 19 01 90 B7 A3 19 19 36 68 B2 A3 19 10 00 40 B9 A3 19 01 90 B7 A3 19 05 00 00 01 08 4D 2E 11 16 
              found = True;                                                     //00C9 : 14 2D 00 18 BF A3 19 27 
            }
            goto jl00DE;                                                        //00D1 : 06 DE 00 
          }
          ++j;                                                                  //00D4 : A3 00 90 BF A3 19 16 
        }
        if (!found) {                                                           //00DE : 07 04 01 81 2D 00 18 BF A3 19 16 
          UpdateOnScreenTimer(QuestTimers[i].TimerID,-1.00000000);              //00E9 : 1B C7 99 00 00 36 A0 B6 A3 19 10 00 40 B9 A3 19 01 90 B7 A3 19 1E 00 00 80 BF 16 
        }
        ++i;                                                                    //0104 : A3 00 40 B9 A3 19 16 
      }
      i = 0;                                                                    //010E : 0F 00 40 B9 A3 19 25 
      while (i < lQuestLog.Quests.Length) {                                     //0115 : 07 70 03 96 00 40 B9 A3 19 37 19 00 A0 BE A3 19 05 00 00 01 18 31 2F 11 16 
        j = 0;                                                                  //012E : 0F 00 90 BF A3 19 25 
        while (j < lQuestLog.Quests[i].Targets.Length) {                        //0135 : 07 66 03 96 00 90 BF A3 19 37 19 10 00 40 B9 A3 19 19 00 A0 BE A3 19 05 00 00 01 18 31 2F 11 05 00 00 01 08 4D 2E 11 16 
          if ((lQuestLog.Quests[i].Targets[j].IsA('QC_Timed')
            || lQuestLog.Quests[i].Targets[j].IsA('QT_Wait'))
            && lQuestLog.IsTargetVisible(lQuestLog.Quests[i],j)
            && lQuestLog.GetActivation(lQuestLog.Quests[i].Targets[j])) {//015D : 07 5C 03 82 82 84 19 10 00 90 BF A3 19 19 10 00 40 B9 A3 19 19 00 A0 BE A3 19 05 00 00 01 18 31 2F 11 05 00 00 01 08 4D 2E 11 08 00 04 61 2F 21 8B 08 00 00 16 18 30 00 19 10 00 90 BF A3 19 19 10 00 40 B9 A3 19 19 00 A0 BE A3 19 05 00 00 01 18 31 2F 11 05 00 00 01 08 4D 2E 11 08 00 04 61 2F 21 8F 08 00 00 16 16 18 29 00 19 00 A0 BE A3 19 1F 00 04 1C 90 2B 30 11 10 00 40 B9 A3 19 19 00 A0 BE A3 19 05 00 00 01 18 31 2F 11 00 90 BF A3 19 16 16 18 33 00 19 00 A0 BE A3 19 29 00 04 1C 68 2D 30 11 10 00 90 BF A3 19 19 10 00 40 B9 A3 19 19 00 A0 BE A3 19 05 00 00 01 18 31 2F 11 05 00 00 01 08 4D 2E 11 16 16 
            targetProgress = lQuestLog.GetTargetProgress(lQuestLog.Quests[i],j);//0227 : 0F 00 08 C0 A3 19 19 00 A0 BE A3 19 1F 00 04 1C 10 1C 20 11 10 00 40 B9 A3 19 19 00 A0 BE A3 19 05 00 00 01 18 31 2F 11 00 90 BF A3 19 16 
            found = False;                                                      //0255 : 14 2D 00 18 BF A3 19 28 
            k = 0;                                                              //025D : 0F 00 80 C0 A3 19 25 
            while (k < QuestTimers.Length) {                                    //0264 : 07 2D 03 96 00 80 C0 A3 19 37 01 90 B7 A3 19 16 
              if (QuestTimers[k].quest == lQuestLog.Quests[i]
                && QuestTimers[k].TargetIndex == j) {//0274 : 07 23 03 82 72 36 68 B2 A3 19 10 00 80 C0 A3 19 01 90 B7 A3 19 10 00 40 B9 A3 19 19 00 A0 BE A3 19 05 00 00 01 18 31 2F 11 16 18 18 00 9A 36 58 B3 A3 19 10 00 80 C0 A3 19 01 90 B7 A3 19 00 90 BF A3 19 16 16 
                if (QuestTimers[k].PreviousProgress != targetProgress) {        //02B9 : 07 18 03 9B 36 C0 B4 A3 19 10 00 80 C0 A3 19 01 90 B7 A3 19 00 08 C0 A3 19 16 
                  QuestTimers[k].PreviousProgress = targetProgress;             //02D3 : 0F 36 C0 B4 A3 19 10 00 80 C0 A3 19 01 90 B7 A3 19 00 08 C0 A3 19 
                  UpdateOnScreenTimer(QuestTimers[k].TimerID,QuestTimers[k].GoalTime - targetProgress);//02E9 : 1B C7 99 00 00 36 A0 B6 A3 19 10 00 80 C0 A3 19 01 90 B7 A3 19 39 3F 93 36 48 B4 A3 19 10 00 80 C0 A3 19 01 90 B7 A3 19 00 08 C0 A3 19 16 16 
                }
                found = True;                                                   //0318 : 14 2D 00 18 BF A3 19 27 
                goto jl032D;                                                    //0320 : 06 2D 03 
              }
              ++k;                                                              //0323 : A3 00 80 C0 A3 19 16 
            }
            if (!found) {                                                       //032D : 07 5C 03 81 2D 00 18 BF A3 19 16 
              CreateQuestTimer(lQuestLog.Quests[i],j,targetProgress);           //0338 : 1B D1 9A 00 00 10 00 40 B9 A3 19 19 00 A0 BE A3 19 05 00 00 01 18 31 2F 11 00 90 BF A3 19 00 08 C0 A3 19 16 
            }
          }
          ++j;                                                                  //035C : A3 00 90 BF A3 19 16 
        }
        ++i;                                                                    //0366 : A3 00 40 B9 A3 19 16 
      }
    }
    //0F 00 A0 BE A3 19 19 2E F0 47 5B 01 1B 2B 0C 00 00 16 05 00 04 01 F0 2F 7F 0F 07 70 03 77 00 A0 
    //BE A3 19 2A 16 0F 00 40 B9 A3 19 25 07 0E 01 96 00 40 B9 A3 19 37 01 90 B7 A3 19 16 14 2D 00 18 
    //BF A3 19 28 0F 00 90 BF A3 19 25 07 DE 00 96 00 90 BF A3 19 37 19 00 A0 BE A3 19 05 00 00 01 18 
    //31 2F 11 16 07 D4 00 72 36 68 B2 A3 19 10 00 40 B9 A3 19 01 90 B7 A3 19 10 00 90 BF A3 19 19 00 
    //A0 BE A3 19 05 00 00 01 18 31 2F 11 16 07 D1 00 19 00 A0 BE A3 19 30 00 04 1C 68 2D 30 11 10 36 
    //58 B3 A3 19 10 00 40 B9 A3 19 01 90 B7 A3 19 19 36 68 B2 A3 19 10 00 40 B9 A3 19 01 90 B7 A3 19 
    //05 00 00 01 08 4D 2E 11 16 14 2D 00 18 BF A3 19 27 06 DE 00 A3 00 90 BF A3 19 16 06 4B 00 07 04 
    //01 81 2D 00 18 BF A3 19 16 1B C7 99 00 00 36 A0 B6 A3 19 10 00 40 B9 A3 19 01 90 B7 A3 19 1E 00 
    //00 80 BF 16 A3 00 40 B9 A3 19 16 06 2C 00 0F 00 40 B9 A3 19 25 07 70 03 96 00 40 B9 A3 19 37 19 
    //00 A0 BE A3 19 05 00 00 01 18 31 2F 11 16 0F 00 90 BF A3 19 25 07 66 03 96 00 90 BF A3 19 37 19 
    //10 00 40 B9 A3 19 19 00 A0 BE A3 19 05 00 00 01 18 31 2F 11 05 00 00 01 08 4D 2E 11 16 07 5C 03 
    //82 82 84 19 10 00 90 BF A3 19 19 10 00 40 B9 A3 19 19 00 A0 BE A3 19 05 00 00 01 18 31 2F 11 05 
    //00 00 01 08 4D 2E 11 08 00 04 61 2F 21 8B 08 00 00 16 18 30 00 19 10 00 90 BF A3 19 19 10 00 40 
    //B9 A3 19 19 00 A0 BE A3 19 05 00 00 01 18 31 2F 11 05 00 00 01 08 4D 2E 11 08 00 04 61 2F 21 8F 
    //08 00 00 16 16 18 29 00 19 00 A0 BE A3 19 1F 00 04 1C 90 2B 30 11 10 00 40 B9 A3 19 19 00 A0 BE 
    //A3 19 05 00 00 01 18 31 2F 11 00 90 BF A3 19 16 16 18 33 00 19 00 A0 BE A3 19 29 00 04 1C 68 2D 
    //30 11 10 00 90 BF A3 19 19 10 00 40 B9 A3 19 19 00 A0 BE A3 19 05 00 00 01 18 31 2F 11 05 00 00 
    //01 08 4D 2E 11 16 16 0F 00 08 C0 A3 19 19 00 A0 BE A3 19 1F 00 04 1C 10 1C 20 11 10 00 40 B9 A3 
    //19 19 00 A0 BE A3 19 05 00 00 01 18 31 2F 11 00 90 BF A3 19 16 14 2D 00 18 BF A3 19 28 0F 00 80 
    //C0 A3 19 25 07 2D 03 96 00 80 C0 A3 19 37 01 90 B7 A3 19 16 07 23 03 82 72 36 68 B2 A3 19 10 00 
    //80 C0 A3 19 01 90 B7 A3 19 10 00 40 B9 A3 19 19 00 A0 BE A3 19 05 00 00 01 18 31 2F 11 16 18 18 
    //00 9A 36 58 B3 A3 19 10 00 80 C0 A3 19 01 90 B7 A3 19 00 90 BF A3 19 16 16 07 18 03 9B 36 C0 B4 
    //A3 19 10 00 80 C0 A3 19 01 90 B7 A3 19 00 08 C0 A3 19 16 0F 36 C0 B4 A3 19 10 00 80 C0 A3 19 01 
    //90 B7 A3 19 00 08 C0 A3 19 1B C7 99 00 00 36 A0 B6 A3 19 10 00 80 C0 A3 19 01 90 B7 A3 19 39 3F 
    //93 36 48 B4 A3 19 10 00 80 C0 A3 19 01 90 B7 A3 19 00 08 C0 A3 19 16 16 14 2D 00 18 BF A3 19 27 
    //06 2D 03 A3 00 80 C0 A3 19 16 06 64 02 07 5C 03 81 2D 00 18 BF A3 19 16 1B D1 9A 00 00 10 00 40 
    //B9 A3 19 19 00 A0 BE A3 19 05 00 00 01 18 31 2F 11 00 90 BF A3 19 00 08 C0 A3 19 16 A3 00 90 BF 
    //A3 19 16 06 35 01 A3 00 40 B9 A3 19 16 06 15 01 04 0B 47 
  }


  function UpdateOnScreenTimer(int aTimerID,float aTime,optional string aTooltipText) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 20 C2 A3 19 25 
    while (i < OnScreenTimers.Length) {                                         //0007 : 07 F6 00 96 00 20 C2 A3 19 37 01 98 C2 A3 19 16 
      if (OnScreenTimers[i].TimerID == aTimerID) {                              //0017 : 07 EC 00 9A 36 10 C3 A3 19 10 00 20 C2 A3 19 01 98 C2 A3 19 00 A8 C1 A3 19 16 
        if (aTime == -1) {                                                      //0031 : 07 A1 00 B4 00 88 C3 A3 19 39 3F 1D FF FF FF FF 16 
          if (OnScreenTimers[i].Active) {                                       //0042 : 07 9E 00 2D 36 00 C4 A3 19 10 00 20 C2 A3 19 01 98 C2 A3 19 
            OnScreenTimers[i].Time = 0.00000000;                                //0056 : 0F 36 78 C4 A3 19 10 00 20 C2 A3 19 01 98 C2 A3 19 1E 00 00 00 00 
            OnScreenTimers[i].Active = False;                                   //006C : 14 2D 36 00 C4 A3 19 10 00 20 C2 A3 19 01 98 C2 A3 19 28 
            OnScreenTimers[i].TimerLabel.FadeOut(1.00000000);                   //007F : 19 36 F0 C4 A3 19 10 00 20 C2 A3 19 01 98 C2 A3 19 0B 00 00 1B 7E 34 00 00 1E 00 00 80 3F 16 
          }
        } else {                                                                //009E : 06 B7 00 
          OnScreenTimers[i].Time = aTime;                                       //00A1 : 0F 36 78 C4 A3 19 10 00 20 C2 A3 19 01 98 C2 A3 19 00 88 C3 A3 19 
        }
        if (Len(aTooltipText) > 0) {                                            //00B7 : 07 E3 00 97 7D 00 68 C5 A3 19 16 25 16 
          OnScreenTimers[i].TimerLabel.SetTooltipText(aTooltipText);            //00C4 : 19 36 F0 C4 A3 19 10 00 20 C2 A3 19 01 98 C2 A3 19 0B 00 00 1B 54 97 00 00 00 68 C5 A3 19 16 
        }
        SortTimers();                                                           //00E3 : 1B F3 98 00 00 16 
        goto jl00F6;                                                            //00E9 : 06 F6 00 
      }
      ++i;                                                                      //00EC : A3 00 20 C2 A3 19 16 
    }
    //0F 00 20 C2 A3 19 25 07 F6 00 96 00 20 C2 A3 19 37 01 98 C2 A3 19 16 07 EC 00 9A 36 10 C3 A3 19 
    //10 00 20 C2 A3 19 01 98 C2 A3 19 00 A8 C1 A3 19 16 07 A1 00 B4 00 88 C3 A3 19 39 3F 1D FF FF FF 
    //FF 16 07 9E 00 2D 36 00 C4 A3 19 10 00 20 C2 A3 19 01 98 C2 A3 19 0F 36 78 C4 A3 19 10 00 20 C2 
    //A3 19 01 98 C2 A3 19 1E 00 00 00 00 14 2D 36 00 C4 A3 19 10 00 20 C2 A3 19 01 98 C2 A3 19 28 19 
    //36 F0 C4 A3 19 10 00 20 C2 A3 19 01 98 C2 A3 19 0B 00 00 1B 7E 34 00 00 1E 00 00 80 3F 16 06 B7 
    //00 0F 36 78 C4 A3 19 10 00 20 C2 A3 19 01 98 C2 A3 19 00 88 C3 A3 19 07 E3 00 97 7D 00 68 C5 A3 
    //19 16 25 16 19 36 F0 C4 A3 19 10 00 20 C2 A3 19 01 98 C2 A3 19 0B 00 00 1B 54 97 00 00 00 68 C5 
    //A3 19 16 1B F3 98 00 00 16 06 F6 00 A3 00 20 C2 A3 19 16 06 07 00 04 0B 47 
  }


  function int CreateOnScreenTimer(float aTime,byte aTimerType,string aTooltipText) {
    local OnScreenTimer newTimer;
    local int newIdx;
    newTimer.TimerLabel = TimerPage.CreateLabel("GUI_Label",0,4096 | 512 | 2048,0,0,52,26);//0000 : 0F 36 F0 C4 A3 19 00 28 C9 A3 19 19 01 A0 C9 A3 19 2B 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 9E 1D 00 10 00 00 1D 00 02 00 00 16 1D 00 08 00 00 16 25 25 2C 34 2C 1A 16 
    newTimer.TimerLabel.SetTooltipText(aTooltipText);                           //003F : 19 36 F0 C4 A3 19 00 28 C9 A3 19 0B 00 00 1B 54 97 00 00 00 18 CA A3 19 16 
    newTimer.TimerLabel.SetColor(TimerColor.R,TimerColor.G,TimerColor.B);       //0058 : 19 36 F0 C4 A3 19 00 28 C9 A3 19 2A 00 00 1B 19 98 00 00 39 3A 36 D0 90 6A 0F 01 90 CA A3 19 39 3A 36 58 90 6A 0F 01 90 CA A3 19 39 3A 36 E0 8F 6A 0F 01 90 CA A3 19 16 
    newTimer.TimerLabel.SetBackground("timer_box","SBGuiTX.GUI_Styles","GUI_Styles");//0090 : 19 36 F0 C4 A3 19 00 28 C9 A3 19 31 00 00 1B 1A 98 00 00 1F 74 69 6D 65 72 5F 62 6F 78 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    newTimer.TimerType = aTimerType;                                            //00CF : 0F 36 08 CB A3 19 00 28 C9 A3 19 00 80 CB A3 19 
    newTimer.TimerID = CurrentTimerID;                                          //00DF : 0F 36 10 C3 A3 19 00 28 C9 A3 19 01 F8 CB A3 19 
    newTimer.Time = aTime;                                                      //00EF : 0F 36 78 C4 A3 19 00 28 C9 A3 19 00 90 C6 A3 19 
    newTimer.CreationTime = InternalTimer;                                      //00FF : 0F 36 70 CC A3 19 00 28 C9 A3 19 01 E8 CC A3 19 
    newTimer.Active = True;                                                     //010F : 14 2D 36 00 C4 A3 19 00 28 C9 A3 19 27 
    newIdx = OnScreenTimers.Length;                                             //011C : 0F 00 60 CD A3 19 37 01 98 C2 A3 19 
    OnScreenTimers[newIdx] = newTimer;                                          //0128 : 0F 10 00 60 CD A3 19 01 98 C2 A3 19 00 28 C9 A3 19 
    SortTimers();                                                               //0139 : 1B F3 98 00 00 16 
    mDesktop.ShowStdWindow(Class'GUI_Desktop'.74,Class'GUI_Desktop'.1);         //013F : 19 01 48 0C 9D 19 1B 00 04 1B DF 0B 00 00 12 20 48 DB 2E 1D 02 00 04 2C 4A 12 20 48 DB 2E 1D 01 00 04 26 16 
    return CurrentTimerID++;                                                    //0163 : 04 A5 01 F8 CB A3 19 16 
    //0F 36 F0 C4 A3 19 00 28 C9 A3 19 19 01 A0 C9 A3 19 2B 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 
    //62 65 6C 00 25 9E 9E 1D 00 10 00 00 1D 00 02 00 00 16 1D 00 08 00 00 16 25 25 2C 34 2C 1A 16 19 
    //36 F0 C4 A3 19 00 28 C9 A3 19 0B 00 00 1B 54 97 00 00 00 18 CA A3 19 16 19 36 F0 C4 A3 19 00 28 
    //C9 A3 19 2A 00 00 1B 19 98 00 00 39 3A 36 D0 90 6A 0F 01 90 CA A3 19 39 3A 36 58 90 6A 0F 01 90 
    //CA A3 19 39 3A 36 E0 8F 6A 0F 01 90 CA A3 19 16 19 36 F0 C4 A3 19 00 28 C9 A3 19 31 00 00 1B 1A 
    //98 00 00 1F 74 69 6D 65 72 5F 62 6F 78 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 
    //73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 0F 36 08 CB A3 19 00 28 C9 A3 19 00 80 CB A3 19 0F 
    //36 10 C3 A3 19 00 28 C9 A3 19 01 F8 CB A3 19 0F 36 78 C4 A3 19 00 28 C9 A3 19 00 90 C6 A3 19 0F 
    //36 70 CC A3 19 00 28 C9 A3 19 01 E8 CC A3 19 14 2D 36 00 C4 A3 19 00 28 C9 A3 19 27 0F 00 60 CD 
    //A3 19 37 01 98 C2 A3 19 0F 10 00 60 CD A3 19 01 98 C2 A3 19 00 28 C9 A3 19 1B F3 98 00 00 16 19 
    //01 48 0C 9D 19 1B 00 04 1B DF 0B 00 00 12 20 48 DB 2E 1D 02 00 04 2C 4A 12 20 48 DB 2E 1D 01 00 
    //04 26 16 04 A5 01 F8 CB A3 19 16 04 0B 47 
  }


  private function string FormatTimeText(int aTime) {
    local string timeText;
    local int Seconds;
    Seconds = aTime % 60;                                                       //0000 : 0F 00 D8 D0 A3 19 39 44 AD 39 3F 00 A0 CF A3 19 39 3F 2C 3C 16 
    if (Seconds < 10) {                                                         //0015 : 07 44 00 96 00 D8 D0 A3 19 2C 0A 16 
      timeText = string(aTime / 60) $ ":0" $ string(Seconds);                   //0021 : 0F 00 50 D1 A3 19 70 70 39 53 91 00 A0 CF A3 19 2C 3C 16 1F 3A 30 00 16 39 53 00 D8 D0 A3 19 16 
    } else {                                                                    //0041 : 06 63 00 
      timeText = string(aTime / 60) $ ":" $ string(Seconds);                    //0044 : 0F 00 50 D1 A3 19 70 70 39 53 91 00 A0 CF A3 19 2C 3C 16 1F 3A 00 16 39 53 00 D8 D0 A3 19 16 
    }
    return timeText;                                                            //0063 : 04 00 50 D1 A3 19 
    //0F 00 D8 D0 A3 19 39 44 AD 39 3F 00 A0 CF A3 19 39 3F 2C 3C 16 07 44 00 96 00 D8 D0 A3 19 2C 0A 
    //16 0F 00 50 D1 A3 19 70 70 39 53 91 00 A0 CF A3 19 2C 3C 16 1F 3A 30 00 16 39 53 00 D8 D0 A3 19 
    //16 06 63 00 0F 00 50 D1 A3 19 70 70 39 53 91 00 A0 CF A3 19 2C 3C 16 1F 3A 00 16 39 53 00 D8 D0 
    //A3 19 16 04 00 50 D1 A3 19 04 0B 47 
  }


  function TickHandler(float aDeltaTime) {
    local int i;
    local int j;
    local int Y;
    local float perc;
    local string timerText;
    InternalTimer += aDeltaTime;                                                //0000 : B8 01 E8 CC A3 19 00 F0 D2 A3 19 16 
    if (InternalTimer >= 1) {                                                   //000C : 07 2F 00 B3 01 E8 CC A3 19 39 3F 26 16 
      InternalTimer = InternalTimer - 1;                                        //0019 : 0F 01 E8 CC A3 19 AF 01 E8 CC A3 19 39 3F 26 16 
      UpdateQuestTimers();                                                      //0029 : 1B C8 99 00 00 16 
    }
    i = OnScreenTimers.Length - 1;                                              //002F : 0F 00 F8 D9 A3 19 93 37 01 98 C2 A3 19 26 16 
    while (i > -1) {                                                            //003E : 07 4A 04 97 00 F8 D9 A3 19 1D FF FF FF FF 16 
      OnScreenTimers[i].Time -= aDeltaTime;                                     //004D : B9 36 78 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 00 F0 D2 A3 19 16 
      if (OnScreenTimers[i].Time < -1) {                                        //0064 : 07 28 01 B0 36 78 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 39 3F 8F 26 16 16 
        switch (OnScreenTimers[i].TimerType) {                                  //007E : 05 01 36 08 CB A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 
          case 0 :                                                              //0090 : 0A F4 00 24 00 
            j = QuestTimers.Length - 1;                                         //0095 : 0F 00 70 DA A3 19 93 37 01 90 B7 A3 19 26 16 
            while (j > -1) {                                                    //00A4 : 07 F1 00 97 00 70 DA A3 19 1D FF FF FF FF 16 
              if (QuestTimers[j].TimerID == OnScreenTimers[i].TimerID) {        //00B3 : 07 E7 00 9A 36 A0 B6 A3 19 10 00 70 DA A3 19 01 90 B7 A3 19 36 10 C3 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 16 
                QuestTimers.Remove(j,1);                                        //00D8 : 41 01 90 B7 A3 19 00 70 DA A3 19 26 
                goto jl00F1;                                                    //00E4 : 06 F1 00 
              }
              --j;                                                              //00E7 : A4 00 70 DA A3 19 16 
          }
          break;                                                                //00F1 : 06 F7 00 
        default:                                                                //00F4 : 0A FF FF 
          TimerPage.DestroyComponent(OnScreenTimers[i].TimerLabel);             //00F7 : 19 01 A0 C9 A3 19 16 00 00 1B 4D 98 00 00 36 F0 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 16 
          OnScreenTimers.Remove(i,1);                                           //0116 : 41 01 98 C2 A3 19 00 F8 D9 A3 19 26 
          break;                                                                //0122 : 06 40 04 
        } else {                                                                //0125 : 06 0D 04 
          if (OnScreenTimers[i].Time <= 0) {                                    //0128 : 07 F5 01 B2 36 78 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 39 3F 25 16 
            if (OnScreenTimers[i].Active) {                                     //0140 : 07 A6 01 2D 36 00 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 
              OnScreenTimers[i].TimerLabel.SetText("0:00");                     //0154 : 19 36 F0 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 0C 00 00 1B 13 98 00 00 1F 30 3A 30 30 00 16 
              OnScreenTimers[i].Active = False;                                 //0174 : 14 2D 36 00 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 28 
              OnScreenTimers[i].TimerLabel.FadeOut(1.00000000);                 //0187 : 19 36 F0 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 0B 00 00 1B 7E 34 00 00 1E 00 00 80 3F 16 
            }
            if (OnScreenTimers.Length == 1 && !OnScreenTimers[0].Active
              && !mFadeOut) {//01A6 : 07 F2 01 82 82 9A 37 01 98 C2 A3 19 26 16 18 10 00 81 2D 36 00 C4 A3 19 10 25 01 98 C2 A3 19 16 16 18 09 00 81 2D 01 38 92 31 16 16 16 
              FadeOut(1.00000000);                                              //01D3 : 1B 7E 34 00 00 1E 00 00 80 3F 16 
              mTitleBar.FadeOut(1.00000000);                                    //01DE : 19 01 D8 63 9E 19 0B 00 00 1B 7E 34 00 00 1E 00 00 80 3F 16 
            }
            goto jl040D;                                                        //01F2 : 06 0D 04 
          }
          timerText = FormatTimeText(OnScreenTimers[i].Time);                   //01F5 : 0F 00 E8 DA A3 19 1B D5 9A 00 00 39 44 36 78 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 16 
          if (OnScreenTimers[i].Time <= 30) {                                   //0213 : 07 FF 02 B2 36 78 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 39 3F 2C 1E 16 
            perc = OnScreenTimers[i].Time / 30.00000000;                        //022C : 0F 00 60 DB A3 19 AC 36 78 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 1E 00 00 F0 41 16 
            OnScreenTimers[i].TimerLabel.SetColor(TimerColorWarning2.R + (TimerColorWarning1.R - TimerColorWarning2.R) * perc,TimerColorWarning2.G + (TimerColorWarning1.G - TimerColorWarning2.G) * perc,TimerColorWarning2.B + (TimerColorWarning1.B - TimerColorWarning2.B) * perc);//0249 : 19 36 F0 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 9F 00 00 1B 19 98 00 00 39 44 AE 39 3C 36 D0 90 6A 0F 01 D8 DB A3 19 AB 39 3F 93 39 3A 36 D0 90 6A 0F 01 50 DC A3 19 39 3A 36 D0 90 6A 0F 01 D8 DB A3 19 16 00 60 DB A3 19 16 16 39 44 AE 39 3C 36 58 90 6A 0F 01 D8 DB A3 19 AB 39 3F 93 39 3A 36 58 90 6A 0F 01 50 DC A3 19 39 3A 36 58 90 6A 0F 01 D8 DB A3 19 16 00 60 DB A3 19 16 16 39 44 AE 39 3C 36 E0 8F 6A 0F 01 D8 DB A3 19 AB 39 3F 93 39 3A 36 E0 8F 6A 0F 01 50 DC A3 19 39 3A 36 E0 8F 6A 0F 01 D8 DB A3 19 16 00 60 DB A3 19 16 16 16 
          } else {                                                              //02FC : 06 EE 03 
            if (OnScreenTimers[i].Time <= 60) {                                 //02FF : 07 EE 03 B2 36 78 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 39 3F 2C 3C 16 
              perc = (OnScreenTimers[i].Time - 30) / 30.00000000;               //0318 : 0F 00 60 DB A3 19 AC AF 36 78 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 39 3F 2C 1E 16 1E 00 00 F0 41 16 
              OnScreenTimers[i].TimerLabel.SetColor(TimerColorWarning1.R + (TimerColor.R - TimerColorWarning1.R) * perc,TimerColorWarning1.G + (TimerColor.G - TimerColorWarning1.G) * perc,TimerColorWarning1.B + (TimerColor.B - TimerColorWarning1.B) * perc);//033B : 19 36 F0 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 9F 00 00 1B 19 98 00 00 39 44 AE 39 3C 36 D0 90 6A 0F 01 50 DC A3 19 AB 39 3F 93 39 3A 36 D0 90 6A 0F 01 90 CA A3 19 39 3A 36 D0 90 6A 0F 01 50 DC A3 19 16 00 60 DB A3 19 16 16 39 44 AE 39 3C 36 58 90 6A 0F 01 50 DC A3 19 AB 39 3F 93 39 3A 36 58 90 6A 0F 01 90 CA A3 19 39 3A 36 58 90 6A 0F 01 50 DC A3 19 16 00 60 DB A3 19 16 16 39 44 AE 39 3C 36 E0 8F 6A 0F 01 50 DC A3 19 AB 39 3F 93 39 3A 36 E0 8F 6A 0F 01 90 CA A3 19 39 3A 36 E0 8F 6A 0F 01 50 DC A3 19 16 00 60 DB A3 19 16 16 16 
            }
          }
          OnScreenTimers[i].TimerLabel.SetText(timerText);                      //03EE : 19 36 F0 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 0B 00 00 1B 13 98 00 00 00 E8 DA A3 19 16 
        }
        OnScreenTimers[i].TimerLabel.SetPosition(0.00000000,Y);                 //040D : 19 36 F0 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 12 00 00 1B 23 98 00 00 1E 00 00 00 00 39 3F 00 C8 DC A3 19 16 
        Y += 26 + 4;                                                            //0433 : A1 00 C8 DC A3 19 92 2C 1A 2C 04 16 16 
        --i;                                                                    //0440 : A4 00 F8 D9 A3 19 16 
      }
      if (OnScreenTimers.Length > 0) {                                          //044A : 07 A1 04 97 37 01 98 C2 A3 19 25 16 
        TimerPage.SetClientHeight(Y - 4);                                       //0456 : 19 01 A0 C9 A3 19 11 00 00 1B 0B 99 00 00 39 3F 93 00 C8 DC A3 19 2C 04 16 16 
        SetClientHeight(25.00000000 + TimerPage.mHeight);                       //0470 : 1B 0B 99 00 00 AE 1E 00 00 C8 41 19 01 A0 C9 A3 19 05 00 04 01 40 88 31 16 16 16 
        Invalidate();                                                           //048B : 1B 1D 98 00 00 16 
        mDesktop.UpdateWindowPositioning(self);                                 //0491 : 19 01 48 0C 9D 19 07 00 00 1C 98 01 89 19 17 16 
      }
    }
    //B8 01 E8 CC A3 19 00 F0 D2 A3 19 16 07 2F 00 B3 01 E8 CC A3 19 39 3F 26 16 0F 01 E8 CC A3 19 AF 
    //01 E8 CC A3 19 39 3F 26 16 1B C8 99 00 00 16 0F 00 F8 D9 A3 19 93 37 01 98 C2 A3 19 26 16 07 4A 
    //04 97 00 F8 D9 A3 19 1D FF FF FF FF 16 B9 36 78 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 00 F0 
    //D2 A3 19 16 07 28 01 B0 36 78 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 39 3F 8F 26 16 16 05 01 
    //36 08 CB A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 0A F4 00 24 00 0F 00 70 DA A3 19 93 37 01 90 B7 
    //A3 19 26 16 07 F1 00 97 00 70 DA A3 19 1D FF FF FF FF 16 07 E7 00 9A 36 A0 B6 A3 19 10 00 70 DA 
    //A3 19 01 90 B7 A3 19 36 10 C3 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 16 41 01 90 B7 A3 19 00 70 
    //DA A3 19 26 06 F1 00 A4 00 70 DA A3 19 16 06 A4 00 06 F7 00 0A FF FF 19 01 A0 C9 A3 19 16 00 00 
    //1B 4D 98 00 00 36 F0 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 16 41 01 98 C2 A3 19 00 F8 D9 A3 
    //19 26 06 40 04 06 0D 04 07 F5 01 B2 36 78 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 39 3F 25 16 
    //07 A6 01 2D 36 00 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 19 36 F0 C4 A3 19 10 00 F8 D9 A3 19 
    //01 98 C2 A3 19 0C 00 00 1B 13 98 00 00 1F 30 3A 30 30 00 16 14 2D 36 00 C4 A3 19 10 00 F8 D9 A3 
    //19 01 98 C2 A3 19 28 19 36 F0 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 0B 00 00 1B 7E 34 00 00 
    //1E 00 00 80 3F 16 07 F2 01 82 82 9A 37 01 98 C2 A3 19 26 16 18 10 00 81 2D 36 00 C4 A3 19 10 25 
    //01 98 C2 A3 19 16 16 18 09 00 81 2D 01 38 92 31 16 16 16 1B 7E 34 00 00 1E 00 00 80 3F 16 19 01 
    //D8 63 9E 19 0B 00 00 1B 7E 34 00 00 1E 00 00 80 3F 16 06 0D 04 0F 00 E8 DA A3 19 1B D5 9A 00 00 
    //39 44 36 78 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 16 07 FF 02 B2 36 78 C4 A3 19 10 00 F8 D9 
    //A3 19 01 98 C2 A3 19 39 3F 2C 1E 16 0F 00 60 DB A3 19 AC 36 78 C4 A3 19 10 00 F8 D9 A3 19 01 98 
    //C2 A3 19 1E 00 00 F0 41 16 19 36 F0 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 9F 00 00 1B 19 98 
    //00 00 39 44 AE 39 3C 36 D0 90 6A 0F 01 D8 DB A3 19 AB 39 3F 93 39 3A 36 D0 90 6A 0F 01 50 DC A3 
    //19 39 3A 36 D0 90 6A 0F 01 D8 DB A3 19 16 00 60 DB A3 19 16 16 39 44 AE 39 3C 36 58 90 6A 0F 01 
    //D8 DB A3 19 AB 39 3F 93 39 3A 36 58 90 6A 0F 01 50 DC A3 19 39 3A 36 58 90 6A 0F 01 D8 DB A3 19 
    //16 00 60 DB A3 19 16 16 39 44 AE 39 3C 36 E0 8F 6A 0F 01 D8 DB A3 19 AB 39 3F 93 39 3A 36 E0 8F 
    //6A 0F 01 50 DC A3 19 39 3A 36 E0 8F 6A 0F 01 D8 DB A3 19 16 00 60 DB A3 19 16 16 16 06 EE 03 07 
    //EE 03 B2 36 78 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 39 3F 2C 3C 16 0F 00 60 DB A3 19 AC AF 
    //36 78 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 39 3F 2C 1E 16 1E 00 00 F0 41 16 19 36 F0 C4 A3 
    //19 10 00 F8 D9 A3 19 01 98 C2 A3 19 9F 00 00 1B 19 98 00 00 39 44 AE 39 3C 36 D0 90 6A 0F 01 50 
    //DC A3 19 AB 39 3F 93 39 3A 36 D0 90 6A 0F 01 90 CA A3 19 39 3A 36 D0 90 6A 0F 01 50 DC A3 19 16 
    //00 60 DB A3 19 16 16 39 44 AE 39 3C 36 58 90 6A 0F 01 50 DC A3 19 AB 39 3F 93 39 3A 36 58 90 6A 
    //0F 01 90 CA A3 19 39 3A 36 58 90 6A 0F 01 50 DC A3 19 16 00 60 DB A3 19 16 16 39 44 AE 39 3C 36 
    //E0 8F 6A 0F 01 50 DC A3 19 AB 39 3F 93 39 3A 36 E0 8F 6A 0F 01 90 CA A3 19 39 3A 36 E0 8F 6A 0F 
    //01 50 DC A3 19 16 00 60 DB A3 19 16 16 16 19 36 F0 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 0B 
    //00 00 1B 13 98 00 00 00 E8 DA A3 19 16 19 36 F0 C4 A3 19 10 00 F8 D9 A3 19 01 98 C2 A3 19 12 00 
    //00 1B 23 98 00 00 1E 00 00 00 00 39 3F 00 C8 DC A3 19 16 A1 00 C8 DC A3 19 92 2C 1A 2C 04 16 16 
    //A4 00 F8 D9 A3 19 16 06 3E 00 07 A1 04 97 37 01 98 C2 A3 19 25 16 19 01 A0 C9 A3 19 11 00 00 1B 
    //0B 99 00 00 39 3F 93 00 C8 DC A3 19 2C 04 16 16 1B 0B 99 00 00 AE 1E 00 00 C8 41 19 01 A0 C9 A3 
    //19 05 00 04 01 40 88 31 16 16 16 1B 1D 98 00 00 16 19 01 48 0C 9D 19 07 00 00 1C 98 01 89 19 17 
    //16 04 0B 47 
  }


  event DoShowWindow(int flags) {
    Super.DoShowWindow(flags);                                                  //0000 : 1C 20 7A 9E 19 00 F0 DD A3 19 16 
    if (flags == Class'GUI_BaseDesktop'.1) {                                    //000B : 07 72 00 9A 00 F0 DD A3 19 12 20 00 68 D7 00 01 00 04 26 16 
      if (OnScreenTimers.Length != 0) {                                         //001F : 07 4D 00 9B 37 01 98 C2 A3 19 25 16 
        FadeIn(0.50000000);                                                     //002B : 1B 72 34 00 00 1E 00 00 00 3F 16 
        mTitleBar.FadeIn(0.50000000);                                           //0036 : 19 01 D8 63 9E 19 0B 00 00 1B 72 34 00 00 1E 00 00 00 3F 16 
      } else {                                                                  //004A : 06 72 00 
        mDesktop.ShowStdWindow(Class'GUI_Desktop'.74,Class'GUI_Desktop'.2);     //004D : 19 01 48 0C 9D 19 1C 00 04 1B DF 0B 00 00 12 20 48 DB 2E 1D 02 00 04 2C 4A 12 20 48 DB 2E 1D 02 00 04 2C 02 16 
      }
    }
    //1C 20 7A 9E 19 00 F0 DD A3 19 16 07 72 00 9A 00 F0 DD A3 19 12 20 00 68 D7 00 01 00 04 26 16 07 
    //4D 00 9B 37 01 98 C2 A3 19 25 16 1B 72 34 00 00 1E 00 00 00 3F 16 19 01 D8 63 9E 19 0B 00 00 1B 
    //72 34 00 00 1E 00 00 00 3F 16 06 72 00 19 01 48 0C 9D 19 1C 00 04 1B DF 0B 00 00 12 20 48 DB 2E 
    //1D 02 00 04 2C 4A 12 20 48 DB 2E 1D 02 00 04 2C 02 16 04 0B 47 
  }


  private function bool SetSortByExpriationTime(GUI_Component aClickedComponent) {
    mDesktop.CloseContextWindows();                                             //0000 : 19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 
    Sorting = 0;                                                                //000F : 0F 01 90 DF A3 19 24 00 
    SortTimers();                                                               //0017 : 1B F3 98 00 00 16 
    return True;                                                                //001D : 04 27 
    //19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 0F 01 90 DF A3 19 24 00 1B F3 98 00 00 16 04 27 04 
    //0B 47 
  }


  private function bool SetSortByCreationTime(GUI_Component aClickedComponent) {
    mDesktop.CloseContextWindows();                                             //0000 : 19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 
    Sorting = 1;                                                                //000F : 0F 01 90 DF A3 19 24 01 
    SortTimers();                                                               //0017 : 1B F3 98 00 00 16 
    return True;                                                                //001D : 04 27 
    //19 01 48 0C 9D 19 06 00 00 1C 88 0F 89 19 16 0F 01 90 DF A3 19 24 01 1B F3 98 00 00 16 04 27 04 
    //0B 47 
  }


  event InitializeMenu(GUI_Menu Menu) {
    local GUI_TextButton menuSortCreationButton;
    local GUI_TextButton menuSortExpirationButton;
    menuSortCreationButton = Menu.CreateMenuItem(Class'SBGuiStrings'.default.Sort_by_added.Text);//0000 : 0F 00 78 E4 A3 19 19 00 28 E3 A3 19 19 00 04 1B 38 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 63 2F 16 16 
    menuSortCreationButton.__OnClick__Delegate = SetSortByCreationTime;         //0028 : 45 19 00 78 E4 A3 19 05 00 08 01 98 EB 9D 19 44 D9 9A 00 00 
    menuSortExpirationButton = Menu.CreateMenuItem(Class'SBGuiStrings'.default.Sort_by_expiration.Text);//003C : 0F 00 F0 E4 A3 19 19 00 28 E3 A3 19 19 00 04 1B 38 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 88 63 2F 16 16 
    menuSortExpirationButton.__OnClick__Delegate = SetSortByExpriationTime;     //0064 : 45 19 00 F0 E4 A3 19 05 00 08 01 98 EB 9D 19 44 D8 9A 00 00 
    //0F 00 78 E4 A3 19 19 00 28 E3 A3 19 19 00 04 1B 38 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 
    //00 0C 02 10 63 2F 16 16 45 19 00 78 E4 A3 19 05 00 08 01 98 EB 9D 19 44 D9 9A 00 00 0F 00 F0 E4 
    //A3 19 19 00 28 E3 A3 19 19 00 04 1B 38 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 88 
    //63 2F 16 16 45 19 00 F0 E4 A3 19 05 00 08 01 98 EB 9D 19 44 D8 9A 00 00 04 0B 47 
  }


  function bool SystemClickHandler(GUI_Component aClickedButton) {
    ToggleContextMenu(aClickedButton);                                          //0000 : 1B 6F 98 00 00 00 18 E6 A3 19 16 
    return True;                                                                //000B : 04 27 
    //1B 6F 98 00 00 00 18 E6 A3 19 16 04 27 04 0B 47 
  }


  function Initialize() {
    mWidth = 68.00000000;                                                       //0000 : 0F 01 60 87 31 16 1E 00 00 88 42 
    mHeight = 25.00000000;                                                      //000B : 0F 01 40 88 31 16 1E 00 00 C8 41 
    Super.Initialize();                                                         //0016 : 1C 28 9E 9E 19 16 
    SetBackground("timer_window","SBGuiTX.GUI_Styles","GUI_Styles");            //001C : 1B 1A 98 00 00 1F 74 69 6D 65 72 5F 77 69 6E 64 6F 77 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    SetBorder(3,3,3,3);                                                         //0050 : 1B 2B 98 00 00 2C 03 2C 03 2C 03 2C 03 16 
    mSystemButton = CreateButton("GUI_IconButton",0,0,0,0,17,23);               //005E : 0F 01 B0 E9 A3 19 1B 18 98 00 00 1F 47 55 49 5F 49 63 6F 6E 42 75 74 74 6F 6E 00 25 25 25 25 2C 11 2C 17 16 
    mSystemButton.__OnClick__Delegate = SystemClickHandler;                     //0082 : 45 19 01 B0 E9 A3 19 05 00 08 01 98 EB 9D 19 44 58 98 00 00 
    mSystemButton.SetContextMenuEnabled(True);                                  //0096 : 19 01 B0 E9 A3 19 07 00 00 1B 77 98 00 00 27 16 
    TimerPage = CreatePage("GUI_Page",0,0,0,25,62,0);                           //00A6 : 0F 01 A0 C9 A3 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 2C 19 2C 3E 25 16 
    TimerPage.SetBorder(5,5,4,5);                                               //00C4 : 19 01 A0 C9 A3 19 0E 00 00 1B 2B 98 00 00 2C 05 2C 05 2C 04 2C 05 16 
    TimerPage.SetAnchors(0.00000000,0.00000000,1.00000000,0.00000000);          //00DB : 19 01 A0 C9 A3 19 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 00 00 16 
    __OnTick__Delegate = TickHandler;                                           //00FE : 45 01 70 E6 9D 19 44 4B 98 00 00 
    Move(520.00000000,0.00000000);                                              //0109 : 1B A5 2F 00 00 1E 00 00 02 44 1E 00 00 00 00 16 
    UpdateQuestTimers();                                                        //0119 : 1B C8 99 00 00 16 
    //0F 01 60 87 31 16 1E 00 00 88 42 0F 01 40 88 31 16 1E 00 00 C8 41 1C 28 9E 9E 19 16 1B 1A 98 00 
    //00 1F 74 69 6D 65 72 5F 77 69 6E 64 6F 77 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 
    //65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 1B 2B 98 00 00 2C 03 2C 03 2C 03 2C 03 16 0F 01 
    //B0 E9 A3 19 1B 18 98 00 00 1F 47 55 49 5F 49 63 6F 6E 42 75 74 74 6F 6E 00 25 25 25 25 2C 11 2C 
    //17 16 45 19 01 B0 E9 A3 19 05 00 08 01 98 EB 9D 19 44 58 98 00 00 19 01 B0 E9 A3 19 07 00 00 1B 
    //77 98 00 00 27 16 0F 01 A0 C9 A3 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 2C 19 
    //2C 3E 25 16 19 01 A0 C9 A3 19 0E 00 00 1B 2B 98 00 00 2C 05 2C 05 2C 04 2C 05 16 19 01 A0 C9 A3 
    //19 1A 00 00 1B 24 98 00 00 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 80 3F 1E 00 00 00 00 16 45 01 
    //70 E6 9D 19 44 4B 98 00 00 1B A5 2F 00 00 1E 00 00 02 44 1E 00 00 00 00 16 1B C8 99 00 00 16 04 
    //0B 47 
  }


  native function SortTimers();



