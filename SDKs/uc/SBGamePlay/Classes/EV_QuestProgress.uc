//==============================================================================
//  EV_QuestProgress
//==============================================================================

class EV_QuestProgress extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Quest_Type,Game_PlayerPawn,Game_QuestLog)
  ;

  var (Action) const export editinline Quest_Type quest;
  var (Action) const int TargetNr;
  var (Action) const int Progress;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    local export editinline Quest_Target Target;
    Target = quest.Targets[TargetNr];                                           //0000 : 0F 00 D0 EC FF 13 10 01 48 ED FF 13 19 01 C0 ED FF 13 05 00 00 01 08 4D 2E 11 
    Game_PlayerPawn(aSubject).questLog.sv_SetTargetProgress(Target,Progress,aObject);//001A : 19 19 2E F0 47 5B 01 00 38 EE FF 13 05 00 04 01 F0 2F 7F 0F 15 00 00 1C 20 02 30 11 00 D0 EC FF 13 01 B0 EE FF 13 00 C8 EB FF 13 16 
    //0F 00 D0 EC FF 13 10 01 48 ED FF 13 19 01 C0 ED FF 13 05 00 00 01 08 4D 2E 11 19 19 2E F0 47 5B 
    //01 00 38 EE FF 13 05 00 04 01 F0 2F 7F 0F 15 00 00 1C 20 02 30 11 00 D0 EC FF 13 01 B0 EE FF 13 
    //00 C8 EB FF 13 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    local export editinline Quest_Target Target;
    Target = quest.Targets[TargetNr];                                           //0000 : 0F 00 20 F0 FF 13 10 01 48 ED FF 13 19 01 C0 ED FF 13 05 00 00 01 08 4D 2E 11 
    if (Target != None) {                                                       //001A : 07 3A 00 77 00 20 F0 FF 13 2A 16 
      if (HasQuest(aSubject,quest)) {                                           //0025 : 07 3A 00 1C 28 2A 20 11 00 98 F0 FF 13 01 C0 ED FF 13 16 
        return True;                                                            //0038 : 04 27 
      }
    }
    return False;                                                               //003A : 04 28 
    //0F 00 20 F0 FF 13 10 01 48 ED FF 13 19 01 C0 ED FF 13 05 00 00 01 08 4D 2E 11 07 3A 00 77 00 20 
    //F0 FF 13 2A 16 07 3A 00 1C 28 2A 20 11 00 98 F0 FF 13 01 C0 ED FF 13 16 04 27 04 28 04 0B 47 
  }



