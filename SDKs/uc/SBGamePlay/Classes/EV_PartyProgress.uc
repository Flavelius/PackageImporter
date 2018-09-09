//==============================================================================
//  EV_PartyProgress
//==============================================================================

class EV_PartyProgress extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Object,Quest_Target,Quest_Type,Conversation_Topic,Game_Pawn,Game_Team,Game_PlayerPawn,Game_QuestLog)
  ;

  var (Action) const export editinline Quest_Type quest;
  var (Action) const int ObjectiveNr;
  var transient Game_Team TeamLock;


  function int FindObjective(export editinline Quest_Type aQuest) {
    local int oi;
    local int aI;
    if (ObjectiveNr >= 0) {                                                     //0000 : 07 11 00 99 01 20 DB FF 13 25 16 
      return ObjectiveNr;                                                       //000B : 04 01 20 DB FF 13 
    }
    if (Outer.IsA('Quest_Target')) {                                            //0011 : 07 3D 00 19 01 00 E4 6B 0F 08 00 04 61 2F 21 8A 08 00 00 16 
      return Quest_Target(Outer).GetIndex();                                    //0025 : 04 19 2E 30 A3 5C 01 01 00 E4 6B 0F 06 00 04 1C 70 1D 20 11 16 
    } else {                                                                    //003A : 06 CF 00 
      oi = 0;                                                                   //003D : 0F 00 98 DB FF 13 25 
      while (oi < aQuest.Targets.Length) {                                      //0044 : 07 CF 00 96 00 98 DB FF 13 37 19 00 50 D9 FF 13 05 00 00 01 08 4D 2E 11 16 
        aI = 0;                                                                 //005D : 0F 00 10 DC FF 13 25 
        while (aI < aQuest.Targets[oi].CompleteEvents.Length) {                 //0064 : 07 C5 00 96 00 10 DC FF 13 37 19 10 00 98 DB FF 13 19 00 50 D9 FF 13 05 00 00 01 08 4D 2E 11 05 00 00 01 28 F2 2F 11 16 
          if (aQuest.Targets[oi].CompleteEvents[aI] == self) {                  //008C : 07 BB 00 72 10 00 10 DC FF 13 19 10 00 98 DB FF 13 19 00 50 D9 FF 13 05 00 00 01 08 4D 2E 11 05 00 00 01 28 F2 2F 11 17 16 
            return oi;                                                          //00B5 : 04 00 98 DB FF 13 
          }
          aI++;                                                                 //00BB : A5 00 10 DC FF 13 16 
        }
        oi++;                                                                   //00C5 : A5 00 98 DB FF 13 16 
      }
    }
    return -1;                                                                  //00CF : 04 1D FF FF FF FF 
    //07 11 00 99 01 20 DB FF 13 25 16 04 01 20 DB FF 13 07 3D 00 19 01 00 E4 6B 0F 08 00 04 61 2F 21 
    //8A 08 00 00 16 04 19 2E 30 A3 5C 01 01 00 E4 6B 0F 06 00 04 1C 70 1D 20 11 16 06 CF 00 0F 00 98 
    //DB FF 13 25 07 CF 00 96 00 98 DB FF 13 37 19 00 50 D9 FF 13 05 00 00 01 08 4D 2E 11 16 0F 00 10 
    //DC FF 13 25 07 C5 00 96 00 10 DC FF 13 37 19 10 00 98 DB FF 13 19 00 50 D9 FF 13 05 00 00 01 08 
    //4D 2E 11 05 00 00 01 28 F2 2F 11 16 07 BB 00 72 10 00 10 DC FF 13 19 10 00 98 DB FF 13 19 00 50 
    //D9 FF 13 05 00 00 01 08 4D 2E 11 05 00 00 01 28 F2 2F 11 17 16 04 00 98 DB FF 13 A5 00 10 DC FF 
    //13 16 06 64 00 A5 00 98 DB FF 13 16 06 44 00 04 1D FF FF FF FF 04 0B 47 
  }


  function Quest_Type FindQuest() {
    if (quest != None) {                                                        //0000 : 07 11 00 77 01 00 DF FF 13 2A 16 
      return quest;                                                             //000B : 04 01 00 DF FF 13 
    }
    if (Outer.IsA('Quest_Target')) {                                            //0011 : 07 3D 00 19 01 00 E4 6B 0F 08 00 04 61 2F 21 8A 08 00 00 16 
      return Quest_Target(Outer).GetQuest();                                    //0025 : 04 19 2E 30 A3 5C 01 01 00 E4 6B 0F 06 00 04 1C C0 1C 20 11 16 
    } else {                                                                    //003A : 06 79 00 
      if (Outer.IsA('Conversation_Topic')) {                                    //003D : 07 6E 00 19 01 00 E4 6B 0F 08 00 04 61 2F 21 FA 07 00 00 16 
        return Quest_Type(Conversation_Topic(Outer).GetContext());              //0051 : 04 2E F0 9D 5C 01 19 2E 40 64 5C 01 01 00 E4 6B 0F 06 00 04 1B D5 0F 00 00 16 
      } else {                                                                  //006B : 06 79 00 
        return Quest_Type(Outer);                                               //006E : 04 2E F0 9D 5C 01 01 00 E4 6B 0F 
      }
    }
    //07 11 00 77 01 00 DF FF 13 2A 16 04 01 00 DF FF 13 07 3D 00 19 01 00 E4 6B 0F 08 00 04 61 2F 21 
    //8A 08 00 00 16 04 19 2E 30 A3 5C 01 01 00 E4 6B 0F 06 00 04 1C C0 1C 20 11 16 06 79 00 07 6E 00 
    //19 01 00 E4 6B 0F 08 00 04 61 2F 21 FA 07 00 00 16 04 2E F0 9D 5C 01 19 2E 40 64 5C 01 01 00 E4 
    //6B 0F 06 00 04 1B D5 0F 00 00 16 06 79 00 04 2E F0 9D 5C 01 01 00 E4 6B 0F 04 0B 47 
  }


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    local export editinline Quest_Type q;
    local int objnr;
    local export editinline Quest_Target Obj;
    local Game_Team team;
    local int ti;
    local Game_PlayerPawn pm;
    q = FindQuest();                                                            //0000 : 0F 00 58 E2 FF 13 1B D7 6F 00 00 16 
    objnr = FindObjective(q);                                                   //000C : 0F 00 D0 E2 FF 13 1B D4 6F 00 00 00 58 E2 FF 13 16 
    Obj = q.Targets[objnr];                                                     //001D : 0F 00 48 E3 FF 13 10 00 D0 E2 FF 13 19 00 58 E2 FF 13 05 00 00 01 08 4D 2E 11 
    team = aSubject.GetTeam();                                                  //0037 : 0F 00 C0 E3 FF 13 19 00 38 E4 FF 13 06 00 04 1B E0 0F 00 00 16 
    if (team == None) {                                                         //004C : 07 59 00 72 00 C0 E3 FF 13 2A 16 
      return;                                                                   //0057 : 04 0B 
    }
    if (TeamLock == team) {                                                     //0059 : 07 6D 00 72 01 B0 E4 FF 13 00 C0 E3 FF 13 16 
      return;                                                                   //0068 : 04 0B 
    } else {                                                                    //006A : 06 78 00 
      TeamLock = team;                                                          //006D : 0F 01 B0 E4 FF 13 00 C0 E3 FF 13 
    }
    ti = 0;                                                                     //0078 : 0F 00 28 E5 FF 13 25 
    while (ti < team.mMembers.Length) {                                         //007F : 07 14 01 96 00 28 E5 FF 13 37 19 00 C0 E3 FF 13 05 00 00 01 10 C1 27 11 16 
      pm = Game_PlayerPawn(team.mMembers[ti]);                                  //0098 : 0F 00 A0 E5 FF 13 2E F0 47 5B 01 10 00 28 E5 FF 13 19 00 C0 E3 FF 13 05 00 00 01 10 C1 27 11 
      if (pm != None && pm != aSubject && HasTargetActive(pm,Obj)) {            //00B7 : 07 0A 01 82 82 77 00 A0 E5 FF 13 2A 16 18 0D 00 77 00 A0 E5 FF 13 00 38 E4 FF 13 16 16 18 11 00 1C 40 30 DB 09 00 A0 E5 FF 13 00 48 E3 FF 13 16 16 
        pm.questLog.sv_SetTargetAsCompleted(Obj,aObject);                       //00E8 : 19 19 00 A0 E5 FF 13 05 00 04 01 F0 2F 7F 0F 10 00 04 1C 28 05 30 11 00 48 E3 FF 13 00 28 E0 FF 13 16 
      }
      ti++;                                                                     //010A : A5 00 28 E5 FF 13 16 
    }
    TeamLock = None;                                                            //0114 : 0F 01 B0 E4 FF 13 2A 
    //0F 00 58 E2 FF 13 1B D7 6F 00 00 16 0F 00 D0 E2 FF 13 1B D4 6F 00 00 00 58 E2 FF 13 16 0F 00 48 
    //E3 FF 13 10 00 D0 E2 FF 13 19 00 58 E2 FF 13 05 00 00 01 08 4D 2E 11 0F 00 C0 E3 FF 13 19 00 38 
    //E4 FF 13 06 00 04 1B E0 0F 00 00 16 07 59 00 72 00 C0 E3 FF 13 2A 16 04 0B 07 6D 00 72 01 B0 E4 
    //FF 13 00 C0 E3 FF 13 16 04 0B 06 78 00 0F 01 B0 E4 FF 13 00 C0 E3 FF 13 0F 00 28 E5 FF 13 25 07 
    //14 01 96 00 28 E5 FF 13 37 19 00 C0 E3 FF 13 05 00 00 01 10 C1 27 11 16 0F 00 A0 E5 FF 13 2E F0 
    //47 5B 01 10 00 28 E5 FF 13 19 00 C0 E3 FF 13 05 00 00 01 10 C1 27 11 07 0A 01 82 82 77 00 A0 E5 
    //FF 13 2A 16 18 0D 00 77 00 A0 E5 FF 13 00 38 E4 FF 13 16 16 18 11 00 1C 40 30 DB 09 00 A0 E5 FF 
    //13 00 48 E3 FF 13 16 16 19 19 00 A0 E5 FF 13 05 00 04 01 F0 2F 7F 0F 10 00 04 1C 28 05 30 11 00 
    //48 E3 FF 13 00 28 E0 FF 13 16 A5 00 28 E5 FF 13 16 06 7F 00 0F 01 B0 E4 FF 13 2A 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    local export editinline Quest_Type q;
    local int objnr;
    q = FindQuest();                                                            //0000 : 0F 00 30 E7 FF 13 1B D7 6F 00 00 16 
    if (q == None) {                                                            //000C : 07 19 00 72 00 30 E7 FF 13 2A 16 
      return False;                                                             //0017 : 04 28 
    }
    objnr = FindObjective(q);                                                   //0019 : 0F 00 A8 E7 FF 13 1B D4 6F 00 00 00 30 E7 FF 13 16 
    if (objnr < 0) {                                                            //002A : 07 37 00 96 00 A8 E7 FF 13 25 16 
      return False;                                                             //0035 : 04 28 
    }
    if (objnr >= q.Targets.Length) {                                            //0037 : 07 52 00 99 00 A8 E7 FF 13 37 19 00 30 E7 FF 13 05 00 00 01 08 4D 2E 11 16 
      return False;                                                             //0050 : 04 28 
    }
    return True;                                                                //0052 : 04 27 
    //0F 00 30 E7 FF 13 1B D7 6F 00 00 16 07 19 00 72 00 30 E7 FF 13 2A 16 04 28 0F 00 A8 E7 FF 13 1B 
    //D4 6F 00 00 00 30 E7 FF 13 16 07 37 00 96 00 A8 E7 FF 13 25 16 04 28 07 52 00 99 00 A8 E7 FF 13 
    //37 19 00 30 E7 FF 13 05 00 00 01 08 4D 2E 11 16 04 28 04 27 04 0B 47 
  }



