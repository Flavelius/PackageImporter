//==============================================================================
//  Travel_GameInfo
//==============================================================================

class Travel_GameInfo extends Deadspell_GameInfo
    native
    exportstructs
    dependsOn(Game_PlayerInfo,Game_Pawn,Game_CharacterStats)
  ;

  struct TravelScenario {
      var (TravelScenario) array<name> StartEvents;
      var (TravelScenario) int FromLevel;
      var (TravelScenario) int ToLevel;

  };


  var (Travel) float DurationSec;
  var (Scenarios) editinline array<TravelScenario> TravelScenarios;
  var int mDebugScenario;


  event TravelStarted(int InstanceID) {
    local int instanceIdx;
    local int eventIdx;
    local array<int> ScenarioSeverity;
    local int si;
    local int Pi;
    local int pLvl;
    local bool anyScenarios;
    local Game_Pawn gamePawn;
    instanceIdx = 0;                                                            //0000 : 0F 00 50 08 36 0F 25 
    while (instanceIdx < mInstances.Length) {                                   //0007 : 07 87 02 96 00 50 08 36 0F 37 01 28 0A 35 0F 16 
      if (mInstances[instanceIdx].mInstanceId == InstanceID) {                  //0017 : 07 7D 02 9A 19 10 00 50 08 36 0F 01 28 0A 35 0F 05 00 04 01 A0 0A 35 0F 00 D8 07 36 0F 16 
        if (mDebugScenario != -1) {                                             //0035 : 07 D0 00 9B 01 C8 08 36 0F 1D FF FF FF FF 16 
          eventIdx = Rand(TravelScenarios[mDebugScenario].StartEvents.Length);  //0044 : 0F 00 40 09 36 0F A7 37 36 40 0A 36 0F 10 01 C8 08 36 0F 01 98 25 37 19 16 
          if (TravelScenarios[mDebugScenario].StartEvents[eventIdx] != 'None') {//005D : 07 D0 00 FF 10 00 40 09 36 0F 36 40 0A 36 0F 10 01 C8 08 36 0F 01 98 25 37 19 21 00 00 00 00 16 
            gamePawn = mInstances[instanceIdx].mPlayers[0].sv_GetPawn();        //007D : 0F 00 10 26 37 19 19 10 25 19 10 00 50 08 36 0F 01 28 0A 35 0F 05 00 00 01 28 68 34 19 06 00 04 1B 83 0C 00 00 16 
            gamePawn.TriggerEvent(TravelScenarios[mDebugScenario].StartEvents[eventIdx],self,gamePawn);//00A3 : 19 00 10 26 37 19 22 00 00 1C F8 B1 34 0F 10 00 40 09 36 0F 36 40 0A 36 0F 10 01 C8 08 36 0F 01 98 25 37 19 17 00 10 26 37 19 16 
            return;                                                             //00CE : 04 0B 
          }
        }
        si = 0;                                                                 //00D0 : 0F 00 88 26 37 19 25 
        while (si < TravelScenarios.Length) {                                   //00D7 : 07 B6 01 96 00 88 26 37 19 37 01 98 25 37 19 16 
          ScenarioSeverity[si] = 0;                                             //00E7 : 0F 10 00 88 26 37 19 00 00 27 37 19 25 
          Pi = 0;                                                               //00F4 : 0F 00 78 27 37 19 25 
          while (Pi < mInstances[instanceIdx].mPlayers.Length) {                //00FB : 07 AC 01 96 00 78 27 37 19 37 19 10 00 50 08 36 0F 01 28 0A 35 0F 05 00 00 01 28 68 34 19 16 
            pLvl = mInstances[instanceIdx].mPlayers[Pi].sv_GetPawn().CharacterStats.GetFameLevel();//011A : 0F 00 F0 27 37 19 19 19 19 10 00 78 27 37 19 19 10 00 50 08 36 0F 01 28 0A 35 0F 05 00 00 01 28 68 34 19 06 00 04 1B 83 0C 00 00 16 05 00 04 01 08 43 34 0F 06 00 04 1C F8 1E 1F 11 16 
            if (pLvl >= TravelScenarios[si].FromLevel
              && pLvl <= TravelScenarios[si].ToLevel) {//0157 : 07 A2 01 82 99 00 F0 27 37 19 36 68 28 37 19 10 00 88 26 37 19 01 98 25 37 19 16 18 18 00 98 00 F0 27 37 19 36 E0 28 37 19 10 00 88 26 37 19 01 98 25 37 19 16 16 
              ScenarioSeverity[si]++;                                           //018D : A5 10 00 88 26 37 19 00 00 27 37 19 16 
              anyScenarios = True;                                              //019A : 14 2D 00 58 29 37 19 27 
            }
            Pi++;                                                               //01A2 : A5 00 78 27 37 19 16 
          }
          si++;                                                                 //01AC : A5 00 88 26 37 19 16 
        }
        if (anyScenarios) {                                                     //01B6 : 07 7B 02 2D 00 58 29 37 19 
          si = 0;                                                               //01BF : 0F 00 88 26 37 19 25 
          while (si < TravelScenarios.Length) {                                 //01C6 : 07 7B 02 96 00 88 26 37 19 37 01 98 25 37 19 16 
            if (ScenarioSeverity[si] > 0) {                                     //01D6 : 07 71 02 97 10 00 88 26 37 19 00 00 27 37 19 25 16 
              eventIdx = Rand(TravelScenarios[si].StartEvents.Length);          //01E7 : 0F 00 40 09 36 0F A7 37 36 40 0A 36 0F 10 00 88 26 37 19 01 98 25 37 19 16 
              if (TravelScenarios[si].StartEvents[eventIdx] != 'None') {        //0200 : 07 71 02 FF 10 00 40 09 36 0F 36 40 0A 36 0F 10 00 88 26 37 19 01 98 25 37 19 21 00 00 00 00 16 
                gamePawn = mInstances[instanceIdx].mPlayers[0].sv_GetPawn();    //0220 : 0F 00 10 26 37 19 19 10 25 19 10 00 50 08 36 0F 01 28 0A 35 0F 05 00 00 01 28 68 34 19 06 00 04 1B 83 0C 00 00 16 
                gamePawn.TriggerEvent(TravelScenarios[mDebugScenario].StartEvents[eventIdx],self,gamePawn);//0246 : 19 00 10 26 37 19 22 00 00 1C F8 B1 34 0F 10 00 40 09 36 0F 36 40 0A 36 0F 10 01 C8 08 36 0F 01 98 25 37 19 17 00 10 26 37 19 16 
              }
            }
            si++;                                                               //0271 : A5 00 88 26 37 19 16 
          }
        }
        return;                                                                 //027B : 04 0B 
      }
      instanceIdx++;                                                            //027D : A5 00 50 08 36 0F 16 
    }
    //0F 00 50 08 36 0F 25 07 87 02 96 00 50 08 36 0F 37 01 28 0A 35 0F 16 07 7D 02 9A 19 10 00 50 08 
    //36 0F 01 28 0A 35 0F 05 00 04 01 A0 0A 35 0F 00 D8 07 36 0F 16 07 D0 00 9B 01 C8 08 36 0F 1D FF 
    //FF FF FF 16 0F 00 40 09 36 0F A7 37 36 40 0A 36 0F 10 01 C8 08 36 0F 01 98 25 37 19 16 07 D0 00 
    //FF 10 00 40 09 36 0F 36 40 0A 36 0F 10 01 C8 08 36 0F 01 98 25 37 19 21 00 00 00 00 16 0F 00 10 
    //26 37 19 19 10 25 19 10 00 50 08 36 0F 01 28 0A 35 0F 05 00 00 01 28 68 34 19 06 00 04 1B 83 0C 
    //00 00 16 19 00 10 26 37 19 22 00 00 1C F8 B1 34 0F 10 00 40 09 36 0F 36 40 0A 36 0F 10 01 C8 08 
    //36 0F 01 98 25 37 19 17 00 10 26 37 19 16 04 0B 0F 00 88 26 37 19 25 07 B6 01 96 00 88 26 37 19 
    //37 01 98 25 37 19 16 0F 10 00 88 26 37 19 00 00 27 37 19 25 0F 00 78 27 37 19 25 07 AC 01 96 00 
    //78 27 37 19 37 19 10 00 50 08 36 0F 01 28 0A 35 0F 05 00 00 01 28 68 34 19 16 0F 00 F0 27 37 19 
    //19 19 19 10 00 78 27 37 19 19 10 00 50 08 36 0F 01 28 0A 35 0F 05 00 00 01 28 68 34 19 06 00 04 
    //1B 83 0C 00 00 16 05 00 04 01 08 43 34 0F 06 00 04 1C F8 1E 1F 11 16 07 A2 01 82 99 00 F0 27 37 
    //19 36 68 28 37 19 10 00 88 26 37 19 01 98 25 37 19 16 18 18 00 98 00 F0 27 37 19 36 E0 28 37 19 
    //10 00 88 26 37 19 01 98 25 37 19 16 16 A5 10 00 88 26 37 19 00 00 27 37 19 16 14 2D 00 58 29 37 
    //19 27 A5 00 78 27 37 19 16 06 FB 00 A5 00 88 26 37 19 16 06 D7 00 07 7B 02 2D 00 58 29 37 19 0F 
    //00 88 26 37 19 25 07 7B 02 96 00 88 26 37 19 37 01 98 25 37 19 16 07 71 02 97 10 00 88 26 37 19 
    //00 00 27 37 19 25 16 0F 00 40 09 36 0F A7 37 36 40 0A 36 0F 10 00 88 26 37 19 01 98 25 37 19 16 
    //07 71 02 FF 10 00 40 09 36 0F 36 40 0A 36 0F 10 00 88 26 37 19 01 98 25 37 19 21 00 00 00 00 16 
    //0F 00 10 26 37 19 19 10 25 19 10 00 50 08 36 0F 01 28 0A 35 0F 05 00 00 01 28 68 34 19 06 00 04 
    //1B 83 0C 00 00 16 19 00 10 26 37 19 22 00 00 1C F8 B1 34 0F 10 00 40 09 36 0F 36 40 0A 36 0F 10 
    //01 C8 08 36 0F 01 98 25 37 19 17 00 10 26 37 19 16 A5 00 88 26 37 19 16 06 C6 01 04 0B A5 00 50 
    //08 36 0F 16 06 07 00 04 0B 47 
  }


  native event UnTrigger(Actor Other,Pawn EventInstigator);


  event PostBeginPlay() {
    Super.PostBeginPlay();                                                      //0000 : 1C 18 48 34 19 16 
    Tag = 'Travel_GameInfo';                                                    //0006 : 0F 01 C0 9E 6C 0F 21 7A 0A 00 00 
    TravelParseInstanceOptions("");                                             //0011 : 1B 50 0F 00 00 1F 00 16 
    //1C 18 48 34 19 16 0F 01 C0 9E 6C 0F 21 7A 0A 00 00 1B 50 0F 00 00 1F 00 16 04 0B 47 
  }


  native function TravelParseInstanceOptions(string Options);



