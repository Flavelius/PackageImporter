//==============================================================================
//  Game_GameMasterUtils
//==============================================================================

class Game_GameMasterUtils extends Game_DebugUtils within Game_Controller
    native
    exportstructs
    dependsOn(LevelInfo,PlayerStart,Game_GameMasterController,Game_Chat,Quest_Target,Item_Type,FSkill_Type,Object,Game_PlayerSkills,DB_SkillDeck,Game_PlayerItemManager,SBDBSync,SBDBAsync,Base_Controller,Game_GameServer,Game_GameInfo)
  ;

  const Concentration =  "c";
  const Physique =  "p";
  const Morale =  "m";
  const DISGUISE =  "disguise";
  const INVIS =  "invis";
  const OFF =  "off";
  const On =  "on";
  struct CommandInfo {
      var int MinLevel;
      var int selfLevel;
      var string Command;
      var string help;
      var string example;

  };


  var array<CommandInfo> mCommandInfos;
  var Game_GameMasterController mGameMaster;


  private function Game_Pawn sv_FindPawnByName(string aName) {
    local Game_PlayerController GPC;
    local string characterName;
    local int useLen;
    if (aName != "") {                                                          //0000 : 07 92 00 7B 00 A0 C2 38 11 1F 00 16 
      foreach Outer.AllActors(Class'Game_PlayerController',GPC,'None') {        //000C : 2F 19 01 00 E4 6B 0F 12 00 00 61 30 20 90 18 5B 01 00 48 C4 38 11 21 00 00 00 00 16 91 00 
        characterName = Game_Pawn(GPC.Pawn).GetCharacterName();                 //002A : 0F 00 C0 C4 38 11 19 2E 18 38 5B 01 19 00 48 C4 38 11 05 00 04 01 88 83 6C 0F 06 00 00 1B 67 05 00 00 16 
        useLen = Max(Len(characterName),Len(aName));                            //004D : 0F 00 38 C5 38 11 FA 7D 00 C0 C4 38 11 16 7D 00 A0 C2 38 11 16 16 
        if (StrCmp(aName,characterName,useLen,False) == 0) {                    //0063 : 07 90 00 9A C8 00 A0 C2 38 11 00 C0 C4 38 11 00 38 C5 38 11 28 16 25 16 
          return Game_Pawn(GPC.Pawn);                                           //007C : 04 2E 18 38 5B 01 19 00 48 C4 38 11 05 00 04 01 88 83 6C 0F 
        }
      }
    }
    sv2cl_ConsoleLog_CallStub("No player named '" $ aName $ "'.");              //0092 : 1B E7 0B 00 00 70 70 1F 4E 6F 20 70 6C 61 79 65 72 20 6E 61 6D 65 64 20 27 00 00 A0 C2 38 11 16 1F 27 2E 00 16 16 
    return None;                                                                //00B8 : 04 2A 
    //07 92 00 7B 00 A0 C2 38 11 1F 00 16 2F 19 01 00 E4 6B 0F 12 00 00 61 30 20 90 18 5B 01 00 48 C4 
    //38 11 21 00 00 00 00 16 91 00 0F 00 C0 C4 38 11 19 2E 18 38 5B 01 19 00 48 C4 38 11 05 00 04 01 
    //88 83 6C 0F 06 00 00 1B 67 05 00 00 16 0F 00 38 C5 38 11 FA 7D 00 C0 C4 38 11 16 7D 00 A0 C2 38 
    //11 16 16 07 90 00 9A C8 00 A0 C2 38 11 00 C0 C4 38 11 00 38 C5 38 11 28 16 25 16 30 04 2E 18 38 
    //5B 01 19 00 48 C4 38 11 05 00 04 01 88 83 6C 0F 31 30 1B E7 0B 00 00 70 70 1F 4E 6F 20 70 6C 61 
    //79 65 72 20 6E 61 6D 65 64 20 27 00 00 A0 C2 38 11 16 1F 27 2E 00 16 16 04 2A 04 0B 47 
  }


  function PlayerStart sv_FindNearestPlayerstart(Game_Pawn aPlayer) {
    local NavigationPoint navpoint;
    local PlayerStart curStart;
    local int shortestDistance;
    local int curLen;
    local PlayerStart ret;
    shortestDistance = 9999;                                                    //0000 : 0F 00 80 C8 38 11 1D 0F 27 00 00 
    navpoint = Outer.Level.NavigationPointList;                                 //000B : 0F 00 F8 C8 38 11 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 D8 E0 74 0F 
    while (navpoint != None) {                                                  //0028 : 07 B2 00 77 00 F8 C8 38 11 2A 16 
      curStart = PlayerStart(navpoint);                                         //0033 : 0F 00 70 C9 38 11 2E 98 FA C1 00 00 F8 C8 38 11 
      if (curStart != None) {                                                   //0043 : 07 9B 00 77 00 70 C9 38 11 2A 16 
        curLen = VSize(curStart.Location - aPlayer.Location);                   //004E : 0F 00 E8 C9 38 11 39 44 E1 D8 19 00 70 C9 38 11 05 00 0C 01 30 81 6C 0F 19 00 D8 C6 38 11 05 00 0C 01 30 81 6C 0F 16 16 
        if (curLen < shortestDistance) {                                        //0076 : 07 9B 00 96 00 E8 C9 38 11 00 80 C8 38 11 16 
          shortestDistance = curLen;                                            //0085 : 0F 00 80 C8 38 11 00 E8 C9 38 11 
          ret = curStart;                                                       //0090 : 0F 00 60 CA 38 11 00 70 C9 38 11 
        }
      }
      navpoint = navpoint.nextNavigationPoint;                                  //009B : 0F 00 F8 C8 38 11 19 00 F8 C8 38 11 05 00 04 01 F8 FD 74 0F 
    }
    return ret;                                                                 //00B2 : 04 00 60 CA 38 11 
    //0F 00 80 C8 38 11 1D 0F 27 00 00 0F 00 F8 C8 38 11 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 
    //05 00 04 01 D8 E0 74 0F 07 B2 00 77 00 F8 C8 38 11 2A 16 0F 00 70 C9 38 11 2E 98 FA C1 00 00 F8 
    //C8 38 11 07 9B 00 77 00 70 C9 38 11 2A 16 0F 00 E8 C9 38 11 39 44 E1 D8 19 00 70 C9 38 11 05 00 
    //0C 01 30 81 6C 0F 19 00 D8 C6 38 11 05 00 0C 01 30 81 6C 0F 16 16 07 9B 00 96 00 E8 C9 38 11 00 
    //80 C8 38 11 16 0F 00 80 C8 38 11 00 E8 C9 38 11 0F 00 60 CA 38 11 00 70 C9 38 11 0F 00 F8 C8 38 
    //11 19 00 F8 C8 38 11 05 00 04 01 F8 FD 74 0F 06 28 00 04 00 60 CA 38 11 04 0B 47 
  }


  private function Game_Pawn sv_GetTarget(optional string aPlayer) {
    if (aPlayer != "") {                                                        //0000 : 07 1B 00 7B 00 00 CC 38 11 1F 00 16 
      return sv_FindPawnByName(aPlayer);                                        //000C : 04 1B 0C 0C 00 00 00 00 CC 38 11 16 
    } else {                                                                    //0018 : 06 2F 00 
      return Game_Pawn(mGameMaster.Pawn);                                       //001B : 04 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 
    }
    //07 1B 00 7B 00 00 CC 38 11 1F 00 16 04 1B 0C 0C 00 00 00 00 CC 38 11 16 06 2F 00 04 2E 18 38 5B 
    //01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 04 0B 47 
  }


  private function bool sv_HigherLevelThan(Controller aController) {
    local Game_GameMasterController GMC;
    GMC = Game_GameMasterController(aController);                               //0000 : 0F 00 D8 CF 38 11 2E D0 1D 5B 01 00 88 CE 38 11 
    if (GMC == None
      || GMC.GetAuthorityLevel() <= mGameMaster.GetAuthorityLevel()) {//0010 : 07 45 00 84 72 00 D8 CF 38 11 2A 16 18 21 00 98 19 00 D8 CF 38 11 06 00 04 1B 42 0C 00 00 16 19 01 E8 CC 38 11 06 00 04 1B 42 0C 00 00 16 16 16 
      return True;                                                              //0040 : 04 27 
    } else {                                                                    //0042 : 06 79 00 
      sv2cl_ConsoleLog_CallStub("This player is resistent to your commands.");  //0045 : 1B E7 0B 00 00 1F 54 68 69 73 20 70 6C 61 79 65 72 20 69 73 20 72 65 73 69 73 74 65 6E 74 20 74 6F 20 79 6F 75 72 20 63 6F 6D 6D 61 6E 64 73 2E 00 16 
      return False;                                                             //0077 : 04 28 
    }
    //0F 00 D8 CF 38 11 2E D0 1D 5B 01 00 88 CE 38 11 07 45 00 84 72 00 D8 CF 38 11 2A 16 18 21 00 98 
    //19 00 D8 CF 38 11 06 00 04 1B 42 0C 00 00 16 19 01 E8 CC 38 11 06 00 04 1B 42 0C 00 00 16 16 16 
    //04 27 06 79 00 1B E7 0B 00 00 1F 54 68 69 73 20 70 6C 61 79 65 72 20 69 73 20 72 65 73 69 73 74 
    //65 6E 74 20 74 6F 20 79 6F 75 72 20 63 6F 6D 6D 61 6E 64 73 2E 00 16 04 28 04 0B 47 
  }


  private function int GetMinimumLevelFor(string aCommand,optional bool aOnSelf) {
    local int Index;
    Index = 0;                                                                  //0000 : 0F 00 C0 D2 38 11 25 
    while (Index < mCommandInfos.Length) {                                      //0007 : 07 6D 00 96 00 C0 D2 38 11 37 01 38 D3 38 11 16 
      if (Locs(aCommand) == Locs(mCommandInfos[Index].Command)) {               //0017 : 07 63 00 7A EE 00 78 D1 38 11 16 EE 36 38 D4 38 11 10 00 C0 D2 38 11 01 38 D3 38 11 16 16 
        if (aOnSelf) {                                                          //0035 : 07 52 00 2D 00 B0 D4 38 11 
          return mCommandInfos[Index].selfLevel;                                //003E : 04 36 28 D5 38 11 10 00 C0 D2 38 11 01 38 D3 38 11 
          goto jl0063;                                                          //004F : 06 63 00 
        }
        return mCommandInfos[Index].MinLevel;                                   //0052 : 04 36 A0 D5 38 11 10 00 C0 D2 38 11 01 38 D3 38 11 
      }
      Index++;                                                                  //0063 : A5 00 C0 D2 38 11 16 
    }
    return -1;                                                                  //006D : 04 1D FF FF FF FF 
    //0F 00 C0 D2 38 11 25 07 6D 00 96 00 C0 D2 38 11 37 01 38 D3 38 11 16 07 63 00 7A EE 00 78 D1 38 
    //11 16 EE 36 38 D4 38 11 10 00 C0 D2 38 11 01 38 D3 38 11 16 16 07 52 00 2D 00 B0 D4 38 11 04 36 
    //28 D5 38 11 10 00 C0 D2 38 11 01 38 D3 38 11 06 63 00 04 36 A0 D5 38 11 10 00 C0 D2 38 11 01 38 
    //D3 38 11 A5 00 C0 D2 38 11 16 06 07 00 04 1D FF FF FF FF 04 0B 47 
  }


  private function bool AuthorizeCommand(string aCommand,optional bool aOnSelf) {
    local int MinLevel;
    MinLevel = GetMinimumLevelFor(aCommand,aOnSelf);                            //0000 : 0F 00 B8 D7 38 11 1B F1 0E 00 00 00 40 D7 38 11 2D 00 30 D8 38 11 16 
    if (MinLevel == -1
      || mGameMaster.GetAuthorityLevel() < MinLevel) {   //0017 : 07 B5 00 84 9A 00 B8 D7 38 11 1D FF FF FF FF 16 18 17 00 96 19 01 E8 CC 38 11 06 00 04 1B 42 0C 00 00 16 00 B8 D7 38 11 16 16 
      if (IsClient()) {                                                         //0041 : 07 80 00 1B 1C 0C 00 00 16 
        cl_ConsoleLog("You are not authorized to run this command.");           //004A : 1B E1 0B 00 00 1F 59 6F 75 20 61 72 65 20 6E 6F 74 20 61 75 74 68 6F 72 69 7A 65 64 20 74 6F 20 72 75 6E 20 74 68 69 73 20 63 6F 6D 6D 61 6E 64 2E 00 16 
      } else {                                                                  //007D : 06 B3 00 
        sv2cl_ConsoleLog_CallStub("You are not authorized to run this command.");//0080 : 1B E7 0B 00 00 1F 59 6F 75 20 61 72 65 20 6E 6F 74 20 61 75 74 68 6F 72 69 7A 65 64 20 74 6F 20 72 75 6E 20 74 68 69 73 20 63 6F 6D 6D 61 6E 64 2E 00 16 
      }
      return False;                                                             //00B3 : 04 28 
    }
    return True;                                                                //00B5 : 04 27 
    //0F 00 B8 D7 38 11 1B F1 0E 00 00 00 40 D7 38 11 2D 00 30 D8 38 11 16 07 B5 00 84 9A 00 B8 D7 38 
    //11 1D FF FF FF FF 16 18 17 00 96 19 01 E8 CC 38 11 06 00 04 1B 42 0C 00 00 16 00 B8 D7 38 11 16 
    //16 07 80 00 1B 1C 0C 00 00 16 1B E1 0B 00 00 1F 59 6F 75 20 61 72 65 20 6E 6F 74 20 61 75 74 68 
    //6F 72 69 7A 65 64 20 74 6F 20 72 75 6E 20 74 68 69 73 20 63 6F 6D 6D 61 6E 64 2E 00 16 06 B3 00 
    //1B E7 0B 00 00 1F 59 6F 75 20 61 72 65 20 6E 6F 74 20 61 75 74 68 6F 72 69 7A 65 64 20 74 6F 20 
    //72 75 6E 20 74 68 69 73 20 63 6F 6D 6D 61 6E 64 2E 00 16 04 28 04 27 04 0B 47 
  }


  private function cl_ConsoleLog(string aLog) {
    mGameMaster.Player.Console.Message(aLog,0.00000000);                        //0000 : 19 19 19 01 E8 CC 38 11 05 00 04 01 28 25 71 0F 05 00 04 01 10 76 6D 0F 10 00 00 1B 37 03 00 00 00 D0 D9 38 11 1E 00 00 00 00 16 
    //19 19 19 01 E8 CC 38 11 05 00 04 01 28 25 71 0F 05 00 04 01 10 76 6D 0F 10 00 00 1B 37 03 00 00 
    //00 D0 D9 38 11 1E 00 00 00 00 16 04 0B 47 
  }


  protected native function sv2cl_ConsoleLog_CallStub();


  private event sv2cl_ConsoleLog(string aLog) {
    cl_ConsoleLog(aLog);                                                        //0000 : 1B E1 0B 00 00 00 10 DC 38 11 16 
    //1B E1 0B 00 00 00 10 DC 38 11 16 04 0B 47 
  }


  protected native function cl2sv_CSBroadcast_CallStub();


  private event cl2sv_CSBroadcast(string aMessage) {
    if (AuthorizeCommand("CSBroadcast")) {                                      //0000 : 07 54 00 1B E6 0B 00 00 1F 43 53 42 72 6F 61 64 63 61 73 74 00 16 
      mGameMaster.Chat.SendMessageToUniverse(8,Game_PlayerPawn(mGameMaster.Pawn).GetCharacterID(),"",aMessage);//0016 : 19 19 01 E8 CC 38 11 05 00 04 01 E8 A0 1B 11 2C 00 00 1B 00 0D 00 00 24 08 19 2E F0 47 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 06 00 04 1C 38 DD 18 11 16 1F 00 00 28 DE 38 11 16 
    }
    //07 54 00 1B E6 0B 00 00 1F 43 53 42 72 6F 61 64 63 61 73 74 00 16 19 19 01 E8 CC 38 11 05 00 04 
    //01 E8 A0 1B 11 2C 00 00 1B 00 0D 00 00 24 08 19 2E F0 47 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 
    //83 6C 0F 06 00 04 1C 38 DD 18 11 16 1F 00 00 28 DE 38 11 16 04 0B 47 
  }


  exec function CSBroadcast(string aMessage) {
    cl_ConsoleLog("CSBroadcast" @ aMessage);                                    //0000 : 1B E1 0B 00 00 A8 1F 43 53 42 72 6F 61 64 63 61 73 74 00 00 F0 DF 38 11 16 16 
    if (AuthorizeCommand("CSBroadcast")) {                                      //001A : 07 7B 00 1B E6 0B 00 00 1F 43 53 42 72 6F 61 64 63 61 73 74 00 16 
      if (aMessage == "") {                                                     //0030 : 07 70 00 7A 00 F0 DF 38 11 1F 00 16 
        cl_ConsoleLog("Missing parameter(s)!:");                                //003C : 1B E1 0B 00 00 1F 4D 69 73 73 69 6E 67 20 70 61 72 61 6D 65 74 65 72 28 73 29 21 3A 00 16 
        CSHelp("CSBroadcast");                                                  //005A : 1B 01 0C 00 00 1F 43 53 42 72 6F 61 64 63 61 73 74 00 16 
      } else {                                                                  //006D : 06 7B 00 
        cl2sv_CSBroadcast_CallStub(aMessage);                                   //0070 : 1B C8 0D 00 00 00 F0 DF 38 11 16 
      }
    }
    //1B E1 0B 00 00 A8 1F 43 53 42 72 6F 61 64 63 61 73 74 00 00 F0 DF 38 11 16 16 07 7B 00 1B E6 0B 
    //00 00 1F 43 53 42 72 6F 61 64 63 61 73 74 00 16 07 70 00 7A 00 F0 DF 38 11 1F 00 16 1B E1 0B 00 
    //00 1F 4D 69 73 73 69 6E 67 20 70 61 72 61 6D 65 74 65 72 28 73 29 21 3A 00 16 1B 01 0C 00 00 1F 
    //43 53 42 72 6F 61 64 63 61 73 74 00 16 06 7B 00 1B C8 0D 00 00 00 F0 DF 38 11 16 04 0B 47 
  }


  exec function CSQuests() {
    local int qi;
    local int ti;
    local int targetProgress;
    local export editinline Game_QuestLog questLog;
    local export editinline Quest_Type quest;
    local array<QuestInventory> QuestInv;
    local string Description;
    cl_ConsoleLog("CSQuests");                                                  //0000 : 1B E1 0B 00 00 1F 43 53 51 75 65 73 74 73 00 16 
    if (AuthorizeCommand("CSQuests")) {                                         //0010 : 07 B9 03 1B E6 0B 00 00 1F 43 53 51 75 65 73 74 73 00 16 
      questLog = Game_PlayerPawn(mGameMaster.Pawn).questLog;                    //0023 : 0F 00 B8 E7 38 11 19 2E F0 47 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 05 00 04 01 F0 2F 7F 0F 
      if (questLog != None) {                                                   //0045 : 07 B9 03 77 00 B8 E7 38 11 2A 16 
        cl_ConsoleLog("= Active Quests:  ============");                        //0050 : 1B E1 0B 00 00 1F 3D 20 41 63 74 69 76 65 20 51 75 65 73 74 73 3A 20 20 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 00 16 
        qi = 0;                                                                 //0076 : 0F 00 F0 E1 38 11 25 
        while (qi < questLog.Quests.Length) {                                   //007D : 07 89 03 96 00 F0 E1 38 11 37 19 00 B8 E7 38 11 05 00 00 01 18 31 2F 11 16 
          quest = questLog.Quests[qi];                                          //0096 : 0F 00 30 E8 38 11 10 00 F0 E1 38 11 19 00 B8 E7 38 11 05 00 00 01 18 31 2F 11 
          cl_ConsoleLog(quest.GetName() @ "-" @ quest.Tag);                     //00B0 : 1B E1 0B 00 00 A8 A8 19 00 30 E8 38 11 06 00 00 1B F9 03 00 00 16 1F 2D 00 16 19 00 30 E8 38 11 05 00 00 01 B0 58 2E 11 16 16 
          ti = 0;                                                               //00DA : 0F 00 A8 E8 38 11 25 
          while (ti < quest.Targets.Length) {                                   //00E1 : 07 97 02 96 00 A8 E8 38 11 37 19 00 30 E8 38 11 05 00 00 01 08 4D 2E 11 16 
            targetProgress = questLog.GetTargetProgress(quest,ti);              //00FA : 0F 00 20 E9 38 11 19 00 B8 E7 38 11 10 00 04 1C 10 1C 20 11 00 30 E8 38 11 00 A8 E8 38 11 16 
            Description = quest.ParseText(quest.Targets[ti].GetDescription(targetProgress),quest.Provider,quest.Targets[ti],self);//0119 : 0F 00 98 E9 38 11 19 00 30 E8 38 11 4C 00 00 1B D8 0C 00 00 19 10 00 A8 E8 38 11 19 00 30 E8 38 11 05 00 00 01 08 4D 2E 11 0B 00 00 1C 18 D3 2F 11 00 20 E9 38 11 16 19 00 30 E8 38 11 05 00 04 01 70 4E 2E 11 10 00 A8 E8 38 11 19 00 30 E8 38 11 05 00 00 01 08 4D 2E 11 17 16 
            if (quest.Targets[ti].Check(targetProgress)) {                      //0174 : 07 B4 01 19 10 00 A8 E8 38 11 19 00 30 E8 38 11 05 00 00 01 08 4D 2E 11 0B 00 04 1C 10 22 20 11 00 20 E9 38 11 16 
              cl_ConsoleLog("* (done)" @ Description);                          //019A : 1B E1 0B 00 00 A8 1F 2A 20 28 64 6F 6E 65 29 00 00 98 E9 38 11 16 16 
            } else {                                                            //01B1 : 06 8D 02 
              if (quest.Targets[ti].Failed(targetProgress)) {                   //01B4 : 07 F6 01 19 10 00 A8 E8 38 11 19 00 30 E8 38 11 05 00 00 01 08 4D 2E 11 0B 00 04 1C 60 1B 20 11 00 20 E9 38 11 16 
                cl_ConsoleLog("* (failed)" @ Description);                      //01DA : 1B E1 0B 00 00 A8 1F 2A 20 28 66 61 69 6C 65 64 29 00 00 98 E9 38 11 16 16 
                goto jl028D;                                                    //01F3 : 06 8D 02 
              }
              if (questLog.GetTargetActivation(quest,ti)) {                     //01F6 : 07 35 02 19 00 B8 E7 38 11 10 00 04 1B 93 0D 00 00 00 30 E8 38 11 00 A8 E8 38 11 16 
                cl_ConsoleLog("* (" @ string(targetProgress) @ ")"
                  @ Description);//0212 : 1B E1 0B 00 00 A8 A8 A8 1F 2A 20 28 00 39 53 00 20 E9 38 11 16 1F 29 00 16 00 98 E9 38 11 16 16 
                goto jl028D;                                                    //0232 : 06 8D 02 
              }
              if (questLog.IsTargetVisible(quest,ti)) {                         //0235 : 07 70 02 19 00 B8 E7 38 11 10 00 04 1C 90 2B 30 11 00 30 E8 38 11 00 A8 E8 38 11 16 
                cl_ConsoleLog("* (inactive) " @ Description);                   //0251 : 1B E1 0B 00 00 A8 1F 2A 20 28 69 6E 61 63 74 69 76 65 29 20 00 00 98 E9 38 11 16 16 
                goto jl028D;                                                    //026D : 06 8D 02 
              }
              cl_ConsoleLog("* (invisible) " @ Description);                    //0270 : 1B E1 0B 00 00 A8 1F 2A 20 28 69 6E 76 69 73 69 62 6C 65 29 20 00 00 98 E9 38 11 16 16 
            }
            ti++;                                                               //028D : A5 00 A8 E8 38 11 16 
          }
          questLog.GetQuestInventory(quest,QuestInv);                           //0297 : 19 00 B8 E7 38 11 10 00 00 1C D8 2A 2F 11 00 30 E8 38 11 00 10 EA 38 11 16 
          if (QuestInv.Length > 0) {                                            //02B0 : 07 4F 03 97 37 00 10 EA 38 11 25 16 
            cl_ConsoleLog("----------------------------------------");          //02BC : 1B E1 0B 00 00 1F 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 00 16 
            ti = 0;                                                             //02EC : 0F 00 A8 E8 38 11 25 
            while (ti < QuestInv.Length) {                                      //02F3 : 07 4F 03 96 00 A8 E8 38 11 37 00 10 EA 38 11 16 
              cl_ConsoleLog(QuestInv[ti].Item.Name.Text @ "("
                $ string(QuestInv[ti].Amount)
                $ ")");//0303 : 1B E1 0B 00 00 70 70 A8 36 58 C6 6B 0F 19 36 50 00 30 11 10 00 A8 E8 38 11 00 10 EA 38 11 05 00 0C 01 88 9E 1A 11 1F 28 00 16 39 53 36 C8 00 30 11 10 00 A8 E8 38 11 00 10 EA 38 11 16 1F 29 00 16 16 
              ti++;                                                             //0345 : A5 00 A8 E8 38 11 16 
            }
          }
          cl_ConsoleLog("----------------------------------------");            //034F : 1B E1 0B 00 00 1F 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 00 16 
          qi++;                                                                 //037F : A5 00 F0 E1 38 11 16 
        }
        cl_ConsoleLog("========================================");              //0389 : 1B E1 0B 00 00 1F 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 00 16 
      }
    }
    //1B E1 0B 00 00 1F 43 53 51 75 65 73 74 73 00 16 07 B9 03 1B E6 0B 00 00 1F 43 53 51 75 65 73 74 
    //73 00 16 0F 00 B8 E7 38 11 19 2E F0 47 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 05 00 04 
    //01 F0 2F 7F 0F 07 B9 03 77 00 B8 E7 38 11 2A 16 1B E1 0B 00 00 1F 3D 20 41 63 74 69 76 65 20 51 
    //75 65 73 74 73 3A 20 20 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 00 16 0F 00 F0 E1 38 11 25 07 89 03 
    //96 00 F0 E1 38 11 37 19 00 B8 E7 38 11 05 00 00 01 18 31 2F 11 16 0F 00 30 E8 38 11 10 00 F0 E1 
    //38 11 19 00 B8 E7 38 11 05 00 00 01 18 31 2F 11 1B E1 0B 00 00 A8 A8 19 00 30 E8 38 11 06 00 00 
    //1B F9 03 00 00 16 1F 2D 00 16 19 00 30 E8 38 11 05 00 00 01 B0 58 2E 11 16 16 0F 00 A8 E8 38 11 
    //25 07 97 02 96 00 A8 E8 38 11 37 19 00 30 E8 38 11 05 00 00 01 08 4D 2E 11 16 0F 00 20 E9 38 11 
    //19 00 B8 E7 38 11 10 00 04 1C 10 1C 20 11 00 30 E8 38 11 00 A8 E8 38 11 16 0F 00 98 E9 38 11 19 
    //00 30 E8 38 11 4C 00 00 1B D8 0C 00 00 19 10 00 A8 E8 38 11 19 00 30 E8 38 11 05 00 00 01 08 4D 
    //2E 11 0B 00 00 1C 18 D3 2F 11 00 20 E9 38 11 16 19 00 30 E8 38 11 05 00 04 01 70 4E 2E 11 10 00 
    //A8 E8 38 11 19 00 30 E8 38 11 05 00 00 01 08 4D 2E 11 17 16 07 B4 01 19 10 00 A8 E8 38 11 19 00 
    //30 E8 38 11 05 00 00 01 08 4D 2E 11 0B 00 04 1C 10 22 20 11 00 20 E9 38 11 16 1B E1 0B 00 00 A8 
    //1F 2A 20 28 64 6F 6E 65 29 00 00 98 E9 38 11 16 16 06 8D 02 07 F6 01 19 10 00 A8 E8 38 11 19 00 
    //30 E8 38 11 05 00 00 01 08 4D 2E 11 0B 00 04 1C 60 1B 20 11 00 20 E9 38 11 16 1B E1 0B 00 00 A8 
    //1F 2A 20 28 66 61 69 6C 65 64 29 00 00 98 E9 38 11 16 16 06 8D 02 07 35 02 19 00 B8 E7 38 11 10 
    //00 04 1B 93 0D 00 00 00 30 E8 38 11 00 A8 E8 38 11 16 1B E1 0B 00 00 A8 A8 A8 1F 2A 20 28 00 39 
    //53 00 20 E9 38 11 16 1F 29 00 16 00 98 E9 38 11 16 16 06 8D 02 07 70 02 19 00 B8 E7 38 11 10 00 
    //04 1C 90 2B 30 11 00 30 E8 38 11 00 A8 E8 38 11 16 1B E1 0B 00 00 A8 1F 2A 20 28 69 6E 61 63 74 
    //69 76 65 29 20 00 00 98 E9 38 11 16 16 06 8D 02 1B E1 0B 00 00 A8 1F 2A 20 28 69 6E 76 69 73 69 
    //62 6C 65 29 20 00 00 98 E9 38 11 16 16 A5 00 A8 E8 38 11 16 06 E1 00 19 00 B8 E7 38 11 10 00 00 
    //1C D8 2A 2F 11 00 30 E8 38 11 00 10 EA 38 11 16 07 4F 03 97 37 00 10 EA 38 11 25 16 1B E1 0B 00 
    //00 1F 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 
    //2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 00 16 0F 00 A8 E8 38 11 25 07 4F 03 96 00 A8 E8 38 11 37 00 10 EA 
    //38 11 16 1B E1 0B 00 00 70 70 A8 36 58 C6 6B 0F 19 36 50 00 30 11 10 00 A8 E8 38 11 00 10 EA 38 
    //11 05 00 0C 01 88 9E 1A 11 1F 28 00 16 39 53 36 C8 00 30 11 10 00 A8 E8 38 11 00 10 EA 38 11 16 
    //1F 29 00 16 16 A5 00 A8 E8 38 11 16 06 F3 02 1B E1 0B 00 00 1F 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 
    //2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 00 16 A5 
    //00 F0 E1 38 11 16 06 7D 00 1B E1 0B 00 00 1F 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 
    //3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 00 16 04 0B 47 
  }


  private native function bool sv_TeleportToNPC(Game_Pawn aPawn,string npcName);


  protected native function cl2sv_CSGotoNPC_CallStub();


  private event cl2sv_CSGotoNPC(string npcName,optional string aPlayer) {
    local Game_Pawn targetPawn;
    if (AuthorizeCommand("CSGotoNPC")) {                                        //0000 : 07 9B 00 1B E6 0B 00 00 1F 43 53 47 6F 74 6F 4E 50 43 00 16 
      targetPawn = sv_GetTarget(aPlayer);                                       //0014 : 0F 00 30 F0 38 11 1B 61 0C 00 00 00 A8 F0 38 11 16 
      if (targetPawn != None) {                                                 //0025 : 07 9B 00 77 00 30 F0 38 11 2A 16 
        if (!sv_TeleportToNPC(targetPawn,npcName)) {                            //0030 : 07 75 00 81 1B D9 0D 00 00 00 30 F0 38 11 00 B0 EE 38 11 16 16 
          sv2cl_ConsoleLog_CallStub("Couldn't teleport" @ aPlayer @ "to"
            @ npcName);//0045 : 1B E7 0B 00 00 A8 A8 A8 1F 43 6F 75 6C 64 6E 27 74 20 74 65 6C 65 70 6F 72 74 00 00 A8 F0 38 11 16 1F 74 6F 00 16 00 B0 EE 38 11 16 16 
        } else {                                                                //0072 : 06 9B 00 
          sv2cl_ConsoleLog_CallStub("Teleported" @ aPlayer @ "to" @ npcName);   //0075 : 1B E7 0B 00 00 A8 A8 A8 1F 54 65 6C 65 70 6F 72 74 65 64 00 00 A8 F0 38 11 16 1F 74 6F 00 16 00 B0 EE 38 11 16 16 
        }
      }
    }
    //07 9B 00 1B E6 0B 00 00 1F 43 53 47 6F 74 6F 4E 50 43 00 16 0F 00 30 F0 38 11 1B 61 0C 00 00 00 
    //A8 F0 38 11 16 07 9B 00 77 00 30 F0 38 11 2A 16 07 75 00 81 1B D9 0D 00 00 00 30 F0 38 11 00 B0 
    //EE 38 11 16 16 1B E7 0B 00 00 A8 A8 A8 1F 43 6F 75 6C 64 6E 27 74 20 74 65 6C 65 70 6F 72 74 00 
    //00 A8 F0 38 11 16 1F 74 6F 00 16 00 B0 EE 38 11 16 16 06 9B 00 1B E7 0B 00 00 A8 A8 A8 1F 54 65 
    //6C 65 70 6F 72 74 65 64 00 00 A8 F0 38 11 16 1F 74 6F 00 16 00 B0 EE 38 11 16 16 04 0B 47 
  }


  exec function CSGotoNPC(string npcName,optional string aPlayer) {
    cl_ConsoleLog("CSGotoNPC" @ npcName @ aPlayer);                             //0000 : 1B E1 0B 00 00 A8 A8 1F 43 53 47 6F 74 6F 4E 50 43 00 00 B8 95 38 11 16 00 30 96 38 11 16 16 
    if (AuthorizeCommand("CSGotoNPC")) {                                        //001F : 07 81 00 1B E6 0B 00 00 1F 43 53 47 6F 74 6F 4E 50 43 00 16 
      if (npcName == "") {                                                      //0033 : 07 71 00 7A 00 B8 95 38 11 1F 00 16 
        cl_ConsoleLog("Missing parameter(s)!:");                                //003F : 1B E1 0B 00 00 1F 4D 69 73 73 69 6E 67 20 70 61 72 61 6D 65 74 65 72 28 73 29 21 3A 00 16 
        CSHelp("CSGotoNPC");                                                    //005D : 1B 01 0C 00 00 1F 43 53 47 6F 74 6F 4E 50 43 00 16 
      } else {                                                                  //006E : 06 81 00 
        cl2sv_CSGotoNPC_CallStub(npcName,aPlayer);                              //0071 : 1B DB 0D 00 00 00 B8 95 38 11 00 30 96 38 11 16 
      }
    }
    //1B E1 0B 00 00 A8 A8 1F 43 53 47 6F 74 6F 4E 50 43 00 00 B8 95 38 11 16 00 30 96 38 11 16 16 07 
    //81 00 1B E6 0B 00 00 1F 43 53 47 6F 74 6F 4E 50 43 00 16 07 71 00 7A 00 B8 95 38 11 1F 00 16 1B 
    //E1 0B 00 00 1F 4D 69 73 73 69 6E 67 20 70 61 72 61 6D 65 74 65 72 28 73 29 21 3A 00 16 1B 01 0C 
    //00 00 1F 43 53 47 6F 74 6F 4E 50 43 00 16 06 81 00 1B DB 0D 00 00 00 B8 95 38 11 00 30 96 38 11 
    //16 04 0B 47 
  }


  protected native function cl2sv_CSSetClass_CallStub();


  private event cl2sv_CSSetClass(byte aClass,optional string aPlayer) {
    local Game_Pawn targetPawn;
    local export editinline Game_PlayerStats statsComponent;
    if (AuthorizeCommand("CSSetClass")) {                                       //0000 : 07 DD 01 1B E6 0B 00 00 1F 43 53 53 65 74 43 6C 61 73 73 00 16 
      if (aPlayer != "") {                                                      //0015 : 07 35 00 7B 00 80 98 38 11 1F 00 16 
        targetPawn = sv_FindPawnByName(aPlayer);                                //0021 : 0F 00 F8 98 38 11 1B 0C 0C 00 00 00 80 98 38 11 16 
      } else {                                                                  //0032 : 06 4E 00 
        targetPawn = Game_Pawn(mGameMaster.Pawn);                               //0035 : 0F 00 F8 98 38 11 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 
      }
      if (targetPawn != None
        && targetPawn.CharacterStats != None) {    //004E : 07 DD 01 82 77 00 F8 98 38 11 2A 16 18 12 00 77 19 00 F8 98 38 11 05 00 04 01 08 43 34 0F 2A 16 16 
        statsComponent = Game_PlayerStats(targetPawn.CharacterStats);           //006F : 0F 00 70 99 38 11 2E 10 A3 5F 01 19 00 F8 98 38 11 05 00 04 01 08 43 34 0F 
        switch (aClass) {                                                       //0088 : 05 01 00 08 98 38 11 
          case 3 :                                                              //008F : 0A 94 00 24 03 
          case 2 :                                                              //0094 : 0A 99 00 24 02 
          case 1 :                                                              //0099 : 0A DE 00 24 01 
            statsComponent.sv_SetClass(aClass);                                 //009E : 19 00 70 99 38 11 0B 00 00 1B BD 0C 00 00 00 08 98 38 11 16 
            sv2cl_ConsoleLog_CallStub("CSSetClass: class set to" @ string(aClass));//00B2 : 1B E7 0B 00 00 A8 1F 43 53 53 65 74 43 6C 61 73 73 3A 20 63 6C 61 73 73 20 73 65 74 20 74 6F 00 39 52 00 08 98 38 11 16 16 
            break;                                                              //00DB : 06 DD 01 
          case 4 :                                                              //00DE : 0A E3 00 24 04 
          case 6 :                                                              //00E3 : 0A E8 00 24 06 
          case 5 :                                                              //00E8 : 0A ED 00 24 05 
          case 7 :                                                              //00ED : 0A F2 00 24 07 
          case 8 :                                                              //00F2 : 0A F7 00 24 08 
          case 9 :                                                              //00F7 : 0A FC 00 24 09 
          case 10 :                                                             //00FC : 0A 01 01 24 0A 
          case 11 :                                                             //0101 : 0A 06 01 24 0B 
          case 12 :                                                             //0106 : 0A AC 01 24 0C 
            if (statsComponent.mRecord.FameLevel >= 5) {                        //010B : 07 65 01 99 36 00 2D 34 0F 19 00 70 99 38 11 05 00 68 01 78 2D 34 0F 2C 05 16 
              statsComponent.sv_SetClass(aClass);                               //0125 : 19 00 70 99 38 11 0B 00 00 1B BD 0C 00 00 00 08 98 38 11 16 
              sv2cl_ConsoleLog_CallStub("CSSetClass: class set to" @ string(aClass));//0139 : 1B E7 0B 00 00 A8 1F 43 53 53 65 74 43 6C 61 73 73 3A 20 63 6C 61 73 73 20 73 65 74 20 74 6F 00 39 52 00 08 98 38 11 16 16 
            } else {                                                            //0162 : 06 A9 01 
              sv2cl_ConsoleLog_CallStub("CSSetClass: fame level too low ("
                $ string(statsComponent.mRecord.FameLevel)
                $ ")");//0165 : 1B E7 0B 00 00 70 70 1F 43 53 53 65 74 43 6C 61 73 73 3A 20 66 61 6D 65 20 6C 65 76 65 6C 20 74 6F 6F 20 6C 6F 77 20 28 00 39 53 36 00 2D 34 0F 19 00 70 99 38 11 05 00 68 01 78 2D 34 0F 16 1F 29 00 16 16 
            }
            break;                                                              //01A9 : 06 DD 01 
          default:                                                              //01AC : 0A FF FF 
            sv2cl_ConsoleLog_CallStub("CSSetClass: invalid class specified");   //01AF : 1B E7 0B 00 00 1F 43 53 53 65 74 43 6C 61 73 73 3A 20 69 6E 76 61 6C 69 64 20 63 6C 61 73 73 20 73 70 65 63 69 66 69 65 64 00 16 
            break;                                                              //01DA : 06 DD 01 
        }
      }
    }
    //07 DD 01 1B E6 0B 00 00 1F 43 53 53 65 74 43 6C 61 73 73 00 16 07 35 00 7B 00 80 98 38 11 1F 00 
    //16 0F 00 F8 98 38 11 1B 0C 0C 00 00 00 80 98 38 11 16 06 4E 00 0F 00 F8 98 38 11 2E 18 38 5B 01 
    //19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 07 DD 01 82 77 00 F8 98 38 11 2A 16 18 12 00 77 19 00 
    //F8 98 38 11 05 00 04 01 08 43 34 0F 2A 16 16 0F 00 70 99 38 11 2E 10 A3 5F 01 19 00 F8 98 38 11 
    //05 00 04 01 08 43 34 0F 05 01 00 08 98 38 11 0A 94 00 24 03 0A 99 00 24 02 0A DE 00 24 01 19 00 
    //70 99 38 11 0B 00 00 1B BD 0C 00 00 00 08 98 38 11 16 1B E7 0B 00 00 A8 1F 43 53 53 65 74 43 6C 
    //61 73 73 3A 20 63 6C 61 73 73 20 73 65 74 20 74 6F 00 39 52 00 08 98 38 11 16 16 06 DD 01 0A E3 
    //00 24 04 0A E8 00 24 06 0A ED 00 24 05 0A F2 00 24 07 0A F7 00 24 08 0A FC 00 24 09 0A 01 01 24 
    //0A 0A 06 01 24 0B 0A AC 01 24 0C 07 65 01 99 36 00 2D 34 0F 19 00 70 99 38 11 05 00 68 01 78 2D 
    //34 0F 2C 05 16 19 00 70 99 38 11 0B 00 00 1B BD 0C 00 00 00 08 98 38 11 16 1B E7 0B 00 00 A8 1F 
    //43 53 53 65 74 43 6C 61 73 73 3A 20 63 6C 61 73 73 20 73 65 74 20 74 6F 00 39 52 00 08 98 38 11 
    //16 16 06 A9 01 1B E7 0B 00 00 70 70 1F 43 53 53 65 74 43 6C 61 73 73 3A 20 66 61 6D 65 20 6C 65 
    //76 65 6C 20 74 6F 6F 20 6C 6F 77 20 28 00 39 53 36 00 2D 34 0F 19 00 70 99 38 11 05 00 68 01 78 
    //2D 34 0F 16 1F 29 00 16 16 06 DD 01 0A FF FF 1B E7 0B 00 00 1F 43 53 53 65 74 43 6C 61 73 73 3A 
    //20 69 6E 76 61 6C 69 64 20 63 6C 61 73 73 20 73 70 65 63 69 66 69 65 64 00 16 06 DD 01 04 0B 47 
    //
  }


  exec function CSSetClass(optional byte aClass,optional string aPlayer) {
    cl_ConsoleLog("CSSetClass" @ string(aClass) @ aPlayer);                     //0000 : 1B E1 0B 00 00 A8 A8 1F 43 53 53 65 74 43 6C 61 73 73 00 39 52 00 98 9A 38 11 16 00 C8 FF 38 11 16 16 
    if (AuthorizeCommand("CSSetClass")) {                                       //0022 : 07 48 02 1B E6 0B 00 00 1F 43 53 53 65 74 43 6C 61 73 73 00 16 
      switch (aClass) {                                                         //0037 : 05 01 00 98 9A 38 11 
        case 3 :                                                                //003E : 0A 43 00 24 03 
        case 2 :                                                                //0043 : 0A 48 00 24 02 
        case 1 :                                                                //0048 : 0A 4D 00 24 01 
        case 4 :                                                                //004D : 0A 52 00 24 04 
        case 6 :                                                                //0052 : 0A 57 00 24 06 
        case 5 :                                                                //0057 : 0A 5C 00 24 05 
        case 7 :                                                                //005C : 0A 61 00 24 07 
        case 8 :                                                                //0061 : 0A 66 00 24 08 
        case 9 :                                                                //0066 : 0A 6B 00 24 09 
        case 10 :                                                               //006B : 0A 70 00 24 0A 
        case 11 :                                                               //0070 : 0A 75 00 24 0B 
        case 12 :                                                               //0075 : 0A 8D 00 24 0C 
          cl2sv_CSSetClass_CallStub(aClass,aPlayer);                            //007A : 1B E1 0D 00 00 00 98 9A 38 11 00 C8 FF 38 11 16 
          break;                                                                //008A : 06 48 02 
        default:                                                                //008D : 0A FF FF 
          CSHelp("CSSetClass");                                                 //0090 : 1B 01 0C 00 00 1F 43 53 53 65 74 43 6C 61 73 73 00 16 
          cl_ConsoleLog("CSSetClass: invalid option (" $ string(aClass)
            $ "), listing valid options:");//00A2 : 1B E1 0B 00 00 70 70 1F 43 53 53 65 74 43 6C 61 73 73 3A 20 69 6E 76 61 6C 69 64 20 6F 70 74 69 6F 6E 20 28 00 39 52 00 98 9A 38 11 16 1F 29 2C 20 6C 69 73 74 69 6E 67 20 76 61 6C 69 64 20 6F 70 74 69 6F 6E 73 3A 00 16 16 
          cl_ConsoleLog("  Arche Types:");                                      //00EC : 1B E1 0B 00 00 1F 20 20 41 72 63 68 65 20 54 79 70 65 73 3A 00 16 
          cl_ConsoleLog("    ECC_Rogue");                                       //0102 : 1B E1 0B 00 00 1F 20 20 20 20 45 43 43 5F 52 6F 67 75 65 00 16 
          cl_ConsoleLog("    ECC_Spellcaster");                                 //0117 : 1B E1 0B 00 00 1F 20 20 20 20 45 43 43 5F 53 70 65 6C 6C 63 61 73 74 65 72 00 16 
          cl_ConsoleLog("    ECC_Warrior");                                     //0132 : 1B E1 0B 00 00 1F 20 20 20 20 45 43 43 5F 57 61 72 72 69 6F 72 00 16 
          cl_ConsoleLog("  Classes:");                                          //0149 : 1B E1 0B 00 00 1F 20 20 43 6C 61 73 73 65 73 3A 00 16 
          cl_ConsoleLog("    ECC_Trickster");                                   //015B : 1B E1 0B 00 00 1F 20 20 20 20 45 43 43 5F 54 72 69 63 6B 73 74 65 72 00 16 
          cl_ConsoleLog("    ECC_DeathHand");                                   //0174 : 1B E1 0B 00 00 1F 20 20 20 20 45 43 43 5F 44 65 61 74 68 48 61 6E 64 00 16 
          cl_ConsoleLog("    ECC_SkinShifter");                                 //018D : 1B E1 0B 00 00 1F 20 20 20 20 45 43 43 5F 53 6B 69 6E 53 68 69 66 74 65 72 00 16 
          cl_ConsoleLog("    ECC_Bloodwarrior");                                //01A8 : 1B E1 0B 00 00 1F 20 20 20 20 45 43 43 5F 42 6C 6F 6F 64 77 61 72 72 69 6F 72 00 16 
          cl_ConsoleLog("    ECC_FuryHammer");                                  //01C4 : 1B E1 0B 00 00 1F 20 20 20 20 45 43 43 5F 46 75 72 79 48 61 6D 6D 65 72 00 16 
          cl_ConsoleLog("    ECC_WrathGuard");                                  //01DE : 1B E1 0B 00 00 1F 20 20 20 20 45 43 43 5F 57 72 61 74 68 47 75 61 72 64 00 16 
          cl_ConsoleLog("    ECC_RuneMage");                                    //01F8 : 1B E1 0B 00 00 1F 20 20 20 20 45 43 43 5F 52 75 6E 65 4D 61 67 65 00 16 
          cl_ConsoleLog("    ECC_VoidSeer");                                    //0210 : 1B E1 0B 00 00 1F 20 20 20 20 45 43 43 5F 56 6F 69 64 53 65 65 72 00 16 
          cl_ConsoleLog("    ECC_AncestralMage");                               //0228 : 1B E1 0B 00 00 1F 20 20 20 20 45 43 43 5F 41 6E 63 65 73 74 72 61 6C 4D 61 67 65 00 16 
          break;                                                                //0245 : 06 48 02 
      }
    }
    //1B E1 0B 00 00 A8 A8 1F 43 53 53 65 74 43 6C 61 73 73 00 39 52 00 98 9A 38 11 16 00 C8 FF 38 11 
    //16 16 07 48 02 1B E6 0B 00 00 1F 43 53 53 65 74 43 6C 61 73 73 00 16 05 01 00 98 9A 38 11 0A 43 
    //00 24 03 0A 48 00 24 02 0A 4D 00 24 01 0A 52 00 24 04 0A 57 00 24 06 0A 5C 00 24 05 0A 61 00 24 
    //07 0A 66 00 24 08 0A 6B 00 24 09 0A 70 00 24 0A 0A 75 00 24 0B 0A 8D 00 24 0C 1B E1 0D 00 00 00 
    //98 9A 38 11 00 C8 FF 38 11 16 06 48 02 0A FF FF 1B 01 0C 00 00 1F 43 53 53 65 74 43 6C 61 73 73 
    //00 16 1B E1 0B 00 00 70 70 1F 43 53 53 65 74 43 6C 61 73 73 3A 20 69 6E 76 61 6C 69 64 20 6F 70 
    //74 69 6F 6E 20 28 00 39 52 00 98 9A 38 11 16 1F 29 2C 20 6C 69 73 74 69 6E 67 20 76 61 6C 69 64 
    //20 6F 70 74 69 6F 6E 73 3A 00 16 16 1B E1 0B 00 00 1F 20 20 41 72 63 68 65 20 54 79 70 65 73 3A 
    //00 16 1B E1 0B 00 00 1F 20 20 20 20 45 43 43 5F 52 6F 67 75 65 00 16 1B E1 0B 00 00 1F 20 20 20 
    //20 45 43 43 5F 53 70 65 6C 6C 63 61 73 74 65 72 00 16 1B E1 0B 00 00 1F 20 20 20 20 45 43 43 5F 
    //57 61 72 72 69 6F 72 00 16 1B E1 0B 00 00 1F 20 20 43 6C 61 73 73 65 73 3A 00 16 1B E1 0B 00 00 
    //1F 20 20 20 20 45 43 43 5F 54 72 69 63 6B 73 74 65 72 00 16 1B E1 0B 00 00 1F 20 20 20 20 45 43 
    //43 5F 44 65 61 74 68 48 61 6E 64 00 16 1B E1 0B 00 00 1F 20 20 20 20 45 43 43 5F 53 6B 69 6E 53 
    //68 69 66 74 65 72 00 16 1B E1 0B 00 00 1F 20 20 20 20 45 43 43 5F 42 6C 6F 6F 64 77 61 72 72 69 
    //6F 72 00 16 1B E1 0B 00 00 1F 20 20 20 20 45 43 43 5F 46 75 72 79 48 61 6D 6D 65 72 00 16 1B E1 
    //0B 00 00 1F 20 20 20 20 45 43 43 5F 57 72 61 74 68 47 75 61 72 64 00 16 1B E1 0B 00 00 1F 20 20 
    //20 20 45 43 43 5F 52 75 6E 65 4D 61 67 65 00 16 1B E1 0B 00 00 1F 20 20 20 20 45 43 43 5F 56 6F 
    //69 64 53 65 65 72 00 16 1B E1 0B 00 00 1F 20 20 20 20 45 43 43 5F 41 6E 63 65 73 74 72 61 6C 4D 
    //61 67 65 00 16 06 48 02 04 0B 47 
  }


  protected native function cl2sv_CSGiveSkill_CallStub();


  private event cl2sv_CSGiveSkill(string aSkillName,optional string aPlayer) {
    local Game_Pawn targetPawn;
    local export editinline FSkill_Type Skill;
    local array<FSkill_Type> skillTypes;
    local int i;
    local Object Obj;
    local int ResourceId;
    local Game_Controller gc;
    if (AuthorizeCommand("CSGiveSkill")) {                                      //0000 : 07 A8 02 1B E6 0B 00 00 1F 43 53 47 69 76 65 53 6B 69 6C 6C 00 16 
      if (aPlayer != "") {                                                      //0016 : 07 36 00 7B 00 18 02 39 11 1F 00 16 
        targetPawn = sv_FindPawnByName(aPlayer);                                //0022 : 0F 00 90 02 39 11 1B 0C 0C 00 00 00 18 02 39 11 16 
      } else {                                                                  //0033 : 06 4F 00 
        targetPawn = Game_Pawn(mGameMaster.Pawn);                               //0036 : 0F 00 90 02 39 11 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 
      }
      if (targetPawn != None && targetPawn.Skills != None) {                    //004F : 07 A8 02 82 77 00 90 02 39 11 2A 16 18 12 00 77 19 00 90 02 39 11 05 00 04 01 08 28 18 11 2A 16 16 
        Class'FSkill_Type'.static.GetAllSkills(skillTypes);                     //0070 : 12 20 40 36 5D 01 0B 00 00 1C B0 9D 20 11 00 08 03 39 11 16 
        if (Skill == None) {                                                    //0084 : 07 F8 00 72 00 80 03 39 11 2A 16 
          i = 0;                                                                //008F : 0F 00 F8 03 39 11 25 
          while (i < skillTypes.Length) {                                       //0096 : 07 F8 00 96 00 F8 03 39 11 37 00 08 03 39 11 16 
            Obj = skillTypes[i];                                                //00A6 : 0F 00 70 04 39 11 10 00 F8 03 39 11 00 08 03 39 11 
            if (StrCmp(string(Obj.Name),aSkillName,-1,False) == 0) {            //00B7 : 07 EE 00 9A C8 39 57 19 00 70 04 39 11 05 00 04 01 F0 E4 6B 0F 00 A0 01 39 11 1D FF FF FF FF 28 16 25 16 
              Skill = skillTypes[i];                                            //00DA : 0F 00 80 03 39 11 10 00 F8 03 39 11 00 08 03 39 11 
              goto jl00F8;                                                      //00EB : 06 F8 00 
            }
            ++i;                                                                //00EE : A3 00 F8 03 39 11 16 
          }
        }
        if (Skill == None) {                                                    //00F8 : 07 6F 01 72 00 80 03 39 11 2A 16 
          ResourceId = int(aSkillName);                                         //0103 : 0F 00 E8 04 39 11 39 4A 00 A0 01 39 11 
          if (ResourceId != 0) {                                                //0110 : 07 6F 01 9B 00 E8 04 39 11 25 16 
            i = 0;                                                              //011B : 0F 00 F8 03 39 11 25 
            while (i < skillTypes.Length) {                                     //0122 : 07 6F 01 96 00 F8 03 39 11 37 00 08 03 39 11 16 
              if (skillTypes[i].GetResourceId() == ResourceId) {                //0132 : 07 65 01 9A 19 10 00 F8 03 39 11 00 08 03 39 11 06 00 04 1C 08 90 20 11 16 00 E8 04 39 11 16 
                Skill = skillTypes[i];                                          //0151 : 0F 00 80 03 39 11 10 00 F8 03 39 11 00 08 03 39 11 
                goto jl016F;                                                    //0162 : 06 6F 01 
              }
              ++i;                                                              //0165 : A3 00 F8 03 39 11 16 
            }
          }
        }
        if (Skill != None) {                                                    //016F : 07 79 02 77 00 80 03 39 11 2A 16 
          gc = Game_Controller(targetPawn.Controller);                          //017A : 0F 00 60 05 39 11 2E 10 0E 5B 01 19 00 90 02 39 11 05 00 04 01 00 6E 6C 0F 
          i = gc.DBCharacterSkills.Length;                                      //0193 : 0F 00 F8 03 39 11 37 19 00 60 05 39 11 05 00 00 01 E0 18 1B 11 
          gc.DBCharacterSkills.Length = i + 1;                                  //01A8 : 0F 37 19 00 60 05 39 11 05 00 00 01 E0 18 1B 11 92 00 F8 03 39 11 26 16 
          gc.DBCharacterSkills[i] = Skill.GetResourceId();                      //01C0 : 0F 10 00 F8 03 39 11 19 00 60 05 39 11 05 00 00 01 E0 18 1B 11 19 00 80 03 39 11 06 00 04 1C 08 90 20 11 16 
          Game_PlayerSkills(targetPawn.Skills).sv2cl_SetSkills_CallStub(gc.DBCharacterSkills,gc.DBSkilldecks[i].mSkills);//01E4 : 19 2E C8 9D 5F 01 19 00 90 02 39 11 05 00 04 01 08 28 18 11 31 00 00 1B FA 0E 00 00 19 00 60 05 39 11 05 00 00 01 E0 18 1B 11 19 10 00 F8 03 39 11 19 00 60 05 39 11 05 00 00 01 08 1B 1B 11 05 00 00 01 28 21 2B 11 16 
          sv2cl_ConsoleLog_CallStub("CSGiveSkill: skill " $ string(Skill)
            $ " given to player "
            $ targetPawn.GetCharacterName());//022C : 1B E7 0B 00 00 70 70 70 1F 43 53 47 69 76 65 53 6B 69 6C 6C 3A 20 73 6B 69 6C 6C 20 00 39 56 00 80 03 39 11 16 1F 20 67 69 76 65 6E 20 74 6F 20 70 6C 61 79 65 72 20 00 16 19 00 90 02 39 11 06 00 00 1B 67 05 00 00 16 16 16 
        } else {                                                                //0276 : 06 A8 02 
          sv2cl_ConsoleLog_CallStub("CSGiveSkill: couldn't find skill"
            @ aSkillName);//0279 : 1B E7 0B 00 00 A8 1F 43 53 47 69 76 65 53 6B 69 6C 6C 3A 20 63 6F 75 6C 64 6E 27 74 20 66 69 6E 64 20 73 6B 69 6C 6C 00 00 A0 01 39 11 16 16 
        }
      }
    }
    //07 A8 02 1B E6 0B 00 00 1F 43 53 47 69 76 65 53 6B 69 6C 6C 00 16 07 36 00 7B 00 18 02 39 11 1F 
    //00 16 0F 00 90 02 39 11 1B 0C 0C 00 00 00 18 02 39 11 16 06 4F 00 0F 00 90 02 39 11 2E 18 38 5B 
    //01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 07 A8 02 82 77 00 90 02 39 11 2A 16 18 12 00 77 19 
    //00 90 02 39 11 05 00 04 01 08 28 18 11 2A 16 16 12 20 40 36 5D 01 0B 00 00 1C B0 9D 20 11 00 08 
    //03 39 11 16 07 F8 00 72 00 80 03 39 11 2A 16 0F 00 F8 03 39 11 25 07 F8 00 96 00 F8 03 39 11 37 
    //00 08 03 39 11 16 0F 00 70 04 39 11 10 00 F8 03 39 11 00 08 03 39 11 07 EE 00 9A C8 39 57 19 00 
    //70 04 39 11 05 00 04 01 F0 E4 6B 0F 00 A0 01 39 11 1D FF FF FF FF 28 16 25 16 0F 00 80 03 39 11 
    //10 00 F8 03 39 11 00 08 03 39 11 06 F8 00 A3 00 F8 03 39 11 16 06 96 00 07 6F 01 72 00 80 03 39 
    //11 2A 16 0F 00 E8 04 39 11 39 4A 00 A0 01 39 11 07 6F 01 9B 00 E8 04 39 11 25 16 0F 00 F8 03 39 
    //11 25 07 6F 01 96 00 F8 03 39 11 37 00 08 03 39 11 16 07 65 01 9A 19 10 00 F8 03 39 11 00 08 03 
    //39 11 06 00 04 1C 08 90 20 11 16 00 E8 04 39 11 16 0F 00 80 03 39 11 10 00 F8 03 39 11 00 08 03 
    //39 11 06 6F 01 A3 00 F8 03 39 11 16 06 22 01 07 79 02 77 00 80 03 39 11 2A 16 0F 00 60 05 39 11 
    //2E 10 0E 5B 01 19 00 90 02 39 11 05 00 04 01 00 6E 6C 0F 0F 00 F8 03 39 11 37 19 00 60 05 39 11 
    //05 00 00 01 E0 18 1B 11 0F 37 19 00 60 05 39 11 05 00 00 01 E0 18 1B 11 92 00 F8 03 39 11 26 16 
    //0F 10 00 F8 03 39 11 19 00 60 05 39 11 05 00 00 01 E0 18 1B 11 19 00 80 03 39 11 06 00 04 1C 08 
    //90 20 11 16 19 2E C8 9D 5F 01 19 00 90 02 39 11 05 00 04 01 08 28 18 11 31 00 00 1B FA 0E 00 00 
    //19 00 60 05 39 11 05 00 00 01 E0 18 1B 11 19 10 00 F8 03 39 11 19 00 60 05 39 11 05 00 00 01 08 
    //1B 1B 11 05 00 00 01 28 21 2B 11 16 1B E7 0B 00 00 70 70 70 1F 43 53 47 69 76 65 53 6B 69 6C 6C 
    //3A 20 73 6B 69 6C 6C 20 00 39 56 00 80 03 39 11 16 1F 20 67 69 76 65 6E 20 74 6F 20 70 6C 61 79 
    //65 72 20 00 16 19 00 90 02 39 11 06 00 00 1B 67 05 00 00 16 16 16 06 A8 02 1B E7 0B 00 00 A8 1F 
    //43 53 47 69 76 65 53 6B 69 6C 6C 3A 20 63 6F 75 6C 64 6E 27 74 20 66 69 6E 64 20 73 6B 69 6C 6C 
    //00 00 A0 01 39 11 16 16 04 0B 47 
  }


  exec function CSGiveSkill(string aSkillName,optional string aPlayer) {
    cl_ConsoleLog("CSGiveSkill" @ aSkillName @ aPlayer);                        //0000 : 1B E1 0B 00 00 A8 A8 1F 43 53 47 69 76 65 53 6B 69 6C 6C 00 00 00 07 39 11 16 00 60 08 39 11 16 16 
    if (AuthorizeCommand("CSGiveSkill")) {                                      //0021 : 07 88 00 1B E6 0B 00 00 1F 43 53 47 69 76 65 53 6B 69 6C 6C 00 16 
      if (Len(aSkillName) == 0) {                                               //0037 : 07 78 00 9A 7D 00 00 07 39 11 16 25 16 
        cl_ConsoleLog("Missing parameter(s)!:");                                //0044 : 1B E1 0B 00 00 1F 4D 69 73 73 69 6E 67 20 70 61 72 61 6D 65 74 65 72 28 73 29 21 3A 00 16 
        CSHelp("CSGiveSkill");                                                  //0062 : 1B 01 0C 00 00 1F 43 53 47 69 76 65 53 6B 69 6C 6C 00 16 
      } else {                                                                  //0075 : 06 88 00 
        cl2sv_CSGiveSkill_CallStub(aSkillName,aPlayer);                         //0078 : 1B FA 0D 00 00 00 00 07 39 11 00 60 08 39 11 16 
      }
    }
    //1B E1 0B 00 00 A8 A8 1F 43 53 47 69 76 65 53 6B 69 6C 6C 00 00 00 07 39 11 16 00 60 08 39 11 16 
    //16 07 88 00 1B E6 0B 00 00 1F 43 53 47 69 76 65 53 6B 69 6C 6C 00 16 07 78 00 9A 7D 00 00 07 39 
    //11 16 25 16 1B E1 0B 00 00 1F 4D 69 73 73 69 6E 67 20 70 61 72 61 6D 65 74 65 72 28 73 29 21 3A 
    //00 16 1B 01 0C 00 00 1F 43 53 47 69 76 65 53 6B 69 6C 6C 00 16 06 88 00 1B FA 0D 00 00 00 00 07 
    //39 11 00 60 08 39 11 16 04 0B 47 
  }


  protected native function cl2sv_CSGiveMoney_CallStub();


  private event cl2sv_CSGiveMoney(int aMoney,optional string aPlayer) {
    local Game_Pawn targetPawn;
    local export editinline Game_PlayerItemManager itemManager;
    local SBDBAsyncCallback callback;
    if (AuthorizeCommand("CSGiveMoney")) {                                      //0000 : 07 AD 00 1B E6 0B 00 00 1F 43 53 47 69 76 65 4D 6F 6E 65 79 00 16 
      if (aPlayer != "") {                                                      //0016 : 07 36 00 7B 00 D0 0B 39 11 1F 00 16 
        targetPawn = sv_FindPawnByName(aPlayer);                                //0022 : 0F 00 48 0C 39 11 1B 0C 0C 00 00 00 D0 0B 39 11 16 
      } else {                                                                  //0033 : 06 4F 00 
        targetPawn = Game_Pawn(mGameMaster.Pawn);                               //0036 : 0F 00 48 0C 39 11 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 
      }
      if (targetPawn != None && targetPawn.itemManager != None) {               //004F : 07 AD 00 82 77 00 48 0C 39 11 2A 16 18 12 00 77 19 00 48 0C 39 11 05 00 04 01 B0 2D 19 11 2A 16 16 
        itemManager = Game_PlayerItemManager(targetPawn.itemManager);           //0070 : 0F 00 C0 0C 39 11 2E F0 92 5F 01 19 00 48 0C 39 11 05 00 04 01 B0 2D 19 11 
        if (itemManager != None) {                                              //0089 : 07 AD 00 77 00 C0 0C 39 11 2A 16 
          itemManager.sv_UpdateMoney(aMoney,callback);                          //0094 : 19 00 C0 0C 39 11 10 00 04 1C F8 FE 1F 11 00 38 0A 39 11 00 38 0D 39 11 16 
        }
      }
    }
    //07 AD 00 1B E6 0B 00 00 1F 43 53 47 69 76 65 4D 6F 6E 65 79 00 16 07 36 00 7B 00 D0 0B 39 11 1F 
    //00 16 0F 00 48 0C 39 11 1B 0C 0C 00 00 00 D0 0B 39 11 16 06 4F 00 0F 00 48 0C 39 11 2E 18 38 5B 
    //01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 07 AD 00 82 77 00 48 0C 39 11 2A 16 18 12 00 77 19 
    //00 48 0C 39 11 05 00 04 01 B0 2D 19 11 2A 16 16 0F 00 C0 0C 39 11 2E F0 92 5F 01 19 00 48 0C 39 
    //11 05 00 04 01 B0 2D 19 11 07 AD 00 77 00 C0 0C 39 11 2A 16 19 00 C0 0C 39 11 10 00 04 1C F8 FE 
    //1F 11 00 38 0A 39 11 00 38 0D 39 11 16 04 0B 47 
  }


  exec function CSGiveMoney(int aMoney,optional string aPlayer) {
    cl_ConsoleLog("CSGiveMoney" @ string(aMoney) @ aPlayer);                    //0000 : 1B E1 0B 00 00 A8 A8 1F 43 53 47 69 76 65 4D 6F 6E 65 79 00 39 53 00 60 0E 39 11 16 00 C0 0F 39 11 16 16 
    if (AuthorizeCommand("CSGiveMoney")) {                                      //0023 : 07 88 00 1B E6 0B 00 00 1F 43 53 47 69 76 65 4D 6F 6E 65 79 00 16 
      if (aMoney == 0) {                                                        //0039 : 07 78 00 9A 00 60 0E 39 11 25 16 
        cl_ConsoleLog("Missing parameter(s)!:");                                //0044 : 1B E1 0B 00 00 1F 4D 69 73 73 69 6E 67 20 70 61 72 61 6D 65 74 65 72 28 73 29 21 3A 00 16 
        CSHelp("CSGiveMoney");                                                  //0062 : 1B 01 0C 00 00 1F 43 53 47 69 76 65 4D 6F 6E 65 79 00 16 
      } else {                                                                  //0075 : 06 88 00 
        cl2sv_CSGiveMoney_CallStub(aMoney,aPlayer);                             //0078 : 1B FB 0D 00 00 00 60 0E 39 11 00 C0 0F 39 11 16 
      }
    }
    //1B E1 0B 00 00 A8 A8 1F 43 53 47 69 76 65 4D 6F 6E 65 79 00 39 53 00 60 0E 39 11 16 00 C0 0F 39 
    //11 16 16 07 88 00 1B E6 0B 00 00 1F 43 53 47 69 76 65 4D 6F 6E 65 79 00 16 07 78 00 9A 00 60 0E 
    //39 11 25 16 1B E1 0B 00 00 1F 4D 69 73 73 69 6E 67 20 70 61 72 61 6D 65 74 65 72 28 73 29 21 3A 
    //00 16 1B 01 0C 00 00 1F 43 53 47 69 76 65 4D 6F 6E 65 79 00 16 06 88 00 1B FB 0D 00 00 00 60 0E 
    //39 11 00 C0 0F 39 11 16 04 0B 47 
  }


  protected native function cl2sv_CSGiveItem_CallStub();


  private event cl2sv_CSGiveItem(int aItemTypeID,byte Color1,byte Color2,byte Amount,optional string aPlayer) {
    local Game_Pawn targetPawn;
    local export editinline Item_Type ItemType;
    local export editinline Game_PlayerItemManager itemManager;
    local SBDBAsyncCallback callback;
    if (!AuthorizeCommand("CSGiveItem")) {                                      //0000 : 07 19 00 81 1B E6 0B 00 00 1F 43 53 47 69 76 65 49 74 65 6D 00 16 16 
      return;                                                                   //0017 : 04 0B 
    }
    if (aPlayer != "") {                                                        //0019 : 07 39 00 7B 00 C0 13 39 11 1F 00 16 
      targetPawn = sv_FindPawnByName(aPlayer);                                  //0025 : 0F 00 38 14 39 11 1B 0C 0C 00 00 00 C0 13 39 11 16 
    } else {                                                                    //0036 : 06 52 00 
      targetPawn = Game_Pawn(mGameMaster.Pawn);                                 //0039 : 0F 00 38 14 39 11 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 
    }
    if (targetPawn == None || targetPawn.itemManager == None) {                 //0052 : 07 75 00 84 72 00 38 14 39 11 2A 16 18 12 00 72 19 00 38 14 39 11 05 00 04 01 B0 2D 19 11 2A 16 16 
      return;                                                                   //0073 : 04 0B 
    }
    itemManager = Game_PlayerItemManager(targetPawn.itemManager);               //0075 : 0F 00 B0 14 39 11 2E F0 92 5F 01 19 00 38 14 39 11 05 00 04 01 B0 2D 19 11 
    ItemType = Item_Type(Class'SBDBSync'.GetResourceObject(aItemTypeID));       //008E : 0F 00 28 15 39 11 2E 70 EB 5B 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 98 11 39 11 16 
    if (itemManager != None && ItemType != None) {                              //00AD : 07 19 01 82 77 00 B0 14 39 11 2A 16 18 09 00 77 00 28 15 39 11 2A 16 16 
      if (Amount == 0) {                                                        //00C5 : 07 DA 00 9A 39 3A 00 A0 15 39 11 25 16 
        Amount = 1;                                                             //00D2 : 0F 00 A0 15 39 11 24 01 
      }
      if (itemManager.sv_QueueAddItem(ItemType,Amount,0,Color1,Color2)) {       //00DA : 07 19 01 19 00 B0 14 39 11 1D 00 04 1C 40 49 26 11 00 28 15 39 11 39 3A 00 A0 15 39 11 25 00 18 16 39 11 00 90 16 39 11 16 
        itemManager.sv_ExecuteAddItems(2,callback);                             //0103 : 19 00 B0 14 39 11 0D 00 04 1C 70 46 26 11 24 02 00 08 17 39 11 16 
      }
    }
    //07 19 00 81 1B E6 0B 00 00 1F 43 53 47 69 76 65 49 74 65 6D 00 16 16 04 0B 07 39 00 7B 00 C0 13 
    //39 11 1F 00 16 0F 00 38 14 39 11 1B 0C 0C 00 00 00 C0 13 39 11 16 06 52 00 0F 00 38 14 39 11 2E 
    //18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 07 75 00 84 72 00 38 14 39 11 2A 16 18 12 
    //00 72 19 00 38 14 39 11 05 00 04 01 B0 2D 19 11 2A 16 16 04 0B 0F 00 B0 14 39 11 2E F0 92 5F 01 
    //19 00 38 14 39 11 05 00 04 01 B0 2D 19 11 0F 00 28 15 39 11 2E 70 EB 5B 01 12 20 30 82 24 01 0B 
    //00 04 1B E5 0B 00 00 00 98 11 39 11 16 07 19 01 82 77 00 B0 14 39 11 2A 16 18 09 00 77 00 28 15 
    //39 11 2A 16 16 07 DA 00 9A 39 3A 00 A0 15 39 11 25 16 0F 00 A0 15 39 11 24 01 07 19 01 19 00 B0 
    //14 39 11 1D 00 04 1C 40 49 26 11 00 28 15 39 11 39 3A 00 A0 15 39 11 25 00 18 16 39 11 00 90 16 
    //39 11 16 19 00 B0 14 39 11 0D 00 04 1C 70 46 26 11 24 02 00 08 17 39 11 16 04 0B 47 
  }


  exec function CSGiveItem(int aItemTypeID,optional byte Color1,optional byte Color2,optional byte Amount,optional string aPlayer) {
    cl_ConsoleLog("CSGiveItem" @ string(aItemTypeID)
      @ string(Color1)
      @ string(Color2)
      @ string(Amount)
      @ aPlayer);//0000 : 1B E1 0B 00 00 A8 A8 A8 A8 A8 1F 43 53 47 69 76 65 49 74 65 6D 00 39 53 00 30 18 39 11 16 39 52 00 C8 19 39 11 16 39 52 00 40 1A 39 11 16 39 52 00 B8 1A 39 11 16 00 30 1B 39 11 16 16 
    if (AuthorizeCommand("CSGiveItem")) {                                       //003D : 07 AF 00 1B E6 0B 00 00 1F 43 53 47 69 76 65 49 74 65 6D 00 16 
      if (aItemTypeID == 0) {                                                   //0052 : 07 90 00 9A 00 30 18 39 11 25 16 
        cl_ConsoleLog("Missing parameter(s)!:");                                //005D : 1B E1 0B 00 00 1F 4D 69 73 73 69 6E 67 20 70 61 72 61 6D 65 74 65 72 28 73 29 21 3A 00 16 
        CSHelp("CSGiveItem");                                                   //007B : 1B 01 0C 00 00 1F 43 53 47 69 76 65 49 74 65 6D 00 16 
      } else {                                                                  //008D : 06 AF 00 
        cl2sv_CSGiveItem_CallStub(aItemTypeID,Color1,Color2,Amount,aPlayer);    //0090 : 1B FE 0D 00 00 00 30 18 39 11 00 C8 19 39 11 00 40 1A 39 11 00 B8 1A 39 11 00 30 1B 39 11 16 
      }
    }
    //1B E1 0B 00 00 A8 A8 A8 A8 A8 1F 43 53 47 69 76 65 49 74 65 6D 00 39 53 00 30 18 39 11 16 39 52 
    //00 C8 19 39 11 16 39 52 00 40 1A 39 11 16 39 52 00 B8 1A 39 11 16 00 30 1B 39 11 16 16 07 AF 00 
    //1B E6 0B 00 00 1F 43 53 47 69 76 65 49 74 65 6D 00 16 07 90 00 9A 00 30 18 39 11 25 16 1B E1 0B 
    //00 00 1F 4D 69 73 73 69 6E 67 20 70 61 72 61 6D 65 74 65 72 28 73 29 21 3A 00 16 1B 01 0C 00 00 
    //1F 43 53 47 69 76 65 49 74 65 6D 00 16 06 AF 00 1B FE 0D 00 00 00 30 18 39 11 00 C8 19 39 11 00 
    //40 1A 39 11 00 B8 1A 39 11 00 30 1B 39 11 16 04 0B 47 
  }


  protected native function cl2sv_CSLevelUp_CallStub();


  private event cl2sv_CSLevelUp(optional string aPlayer) {
    local Game_Pawn targetPawn;
    local export editinline Game_PlayerStats Stats;
    local int nextFamePoints;
    if (AuthorizeCommand("CSLevelUp")) {                                        //0000 : 07 BD 00 1B E6 0B 00 00 1F 43 53 4C 65 76 65 6C 55 70 00 16 
      targetPawn = sv_GetTarget(aPlayer);                                       //0014 : 0F 00 B0 1E 39 11 1B 61 0C 00 00 00 08 1D 39 11 16 
      if (targetPawn != None) {                                                 //0025 : 07 BD 00 77 00 B0 1E 39 11 2A 16 
        Stats = Game_PlayerStats(targetPawn.CharacterStats);                    //0030 : 0F 00 28 1F 39 11 2E 10 A3 5F 01 19 00 B0 1E 39 11 05 00 04 01 08 43 34 0F 
        if (Stats != None) {                                                    //0049 : 07 BD 00 77 00 28 1F 39 11 2A 16 
          if (Stats.mRecord.FameLevel < 50) {                                   //0054 : 07 BD 00 96 36 00 2D 34 0F 19 00 28 1F 39 11 05 00 68 01 78 2D 34 0F 2C 32 16 
            nextFamePoints = Stats.GetNextFameLevelPoints(Stats.mRecord.FameLevel);//006E : 0F 00 A0 1F 39 11 19 00 28 1F 39 11 19 00 04 1B 74 05 00 00 36 00 2D 34 0F 19 00 28 1F 39 11 05 00 68 01 78 2D 34 0F 16 
            Stats.IncreaseFamePoints(nextFamePoints - Stats.mFamePoints + 1);   //0096 : 19 00 28 1F 39 11 1E 00 00 1B 70 0D 00 00 92 93 00 A0 1F 39 11 19 00 28 1F 39 11 05 00 04 01 D8 F2 24 11 16 26 16 16 
          }
        }
      }
    }
    //07 BD 00 1B E6 0B 00 00 1F 43 53 4C 65 76 65 6C 55 70 00 16 0F 00 B0 1E 39 11 1B 61 0C 00 00 00 
    //08 1D 39 11 16 07 BD 00 77 00 B0 1E 39 11 2A 16 0F 00 28 1F 39 11 2E 10 A3 5F 01 19 00 B0 1E 39 
    //11 05 00 04 01 08 43 34 0F 07 BD 00 77 00 28 1F 39 11 2A 16 07 BD 00 96 36 00 2D 34 0F 19 00 28 
    //1F 39 11 05 00 68 01 78 2D 34 0F 2C 32 16 0F 00 A0 1F 39 11 19 00 28 1F 39 11 19 00 04 1B 74 05 
    //00 00 36 00 2D 34 0F 19 00 28 1F 39 11 05 00 68 01 78 2D 34 0F 16 19 00 28 1F 39 11 1E 00 00 1B 
    //70 0D 00 00 92 93 00 A0 1F 39 11 19 00 28 1F 39 11 05 00 04 01 D8 F2 24 11 16 26 16 16 04 0B 47 
    //
  }


  exec function CSLevelUp(optional string aPlayer) {
    cl_ConsoleLog("CSLevelUp" @ aPlayer);                                       //0000 : 1B E1 0B 00 00 A8 1F 43 53 4C 65 76 65 6C 55 70 00 00 C8 20 39 11 16 16 
    if (AuthorizeCommand("CSLevelUp")) {                                        //0018 : 07 37 00 1B E6 0B 00 00 1F 43 53 4C 65 76 65 6C 55 70 00 16 
      cl2sv_CSLevelUp_CallStub(aPlayer);                                        //002C : 1B FF 0D 00 00 00 C8 20 39 11 16 
    }
    //1B E1 0B 00 00 A8 1F 43 53 4C 65 76 65 6C 55 70 00 00 C8 20 39 11 16 16 07 37 00 1B E6 0B 00 00 
    //1F 43 53 4C 65 76 65 6C 55 70 00 16 1B FF 0D 00 00 00 C8 20 39 11 16 04 0B 47 
  }


  protected native function cl2sv_CSQuestObjective_CallStub();


  private event cl2sv_CSQuestObjective(string aQuestTag,int aObjective,int aValue,optional string aPlayer) {
    local Game_PlayerPawn playerPawn;
    local export editinline Quest_Type quest;
    if (AuthorizeCommand("CSQuestObjective")) {                                 //0000 : 07 D7 00 1B E6 0B 00 00 1F 43 53 51 75 65 73 74 4F 62 6A 65 63 74 69 76 65 00 16 
      playerPawn = Game_PlayerPawn(sv_GetTarget(aPlayer));                      //001B : 0F 00 E8 24 39 11 2E F0 47 5B 01 1B 61 0C 00 00 00 60 25 39 11 16 
      if (playerPawn != None && playerPawn.questLog != None) {                  //0031 : 07 D7 00 82 77 00 E8 24 39 11 2A 16 18 12 00 77 19 00 E8 24 39 11 05 00 04 01 F0 2F 7F 0F 2A 16 16 
        foreach AllObjects(Class'Quest_Type',quest) {                           //0052 : 2F C5 20 F0 9D 5C 01 00 D8 25 39 11 16 D6 00 
          if (Locs(quest.Tag) == Locs(aQuestTag)) {                             //0061 : 07 D5 00 7A EE 19 00 D8 25 39 11 05 00 00 01 B0 58 2E 11 16 EE 00 18 23 39 11 16 16 
            if (aObjective >= 0
              && aObjective < quest.Targets.Length) {//007D : 07 D5 00 82 99 00 50 26 39 11 25 16 18 17 00 96 00 50 26 39 11 37 19 00 D8 25 39 11 05 00 00 01 08 4D 2E 11 16 16 
              playerPawn.questLog.sv_SetTargetProgress(quest.Targets[aObjective],aValue,None);//00A3 : 19 19 00 E8 24 39 11 05 00 04 01 F0 2F 7F 0F 20 00 00 1C 20 02 30 11 10 00 50 26 39 11 19 00 D8 25 39 11 05 00 00 01 08 4D 2E 11 00 C8 26 39 11 2A 16 
            }
          }
        }
      }
    }
    //07 D7 00 1B E6 0B 00 00 1F 43 53 51 75 65 73 74 4F 62 6A 65 63 74 69 76 65 00 16 0F 00 E8 24 39 
    //11 2E F0 47 5B 01 1B 61 0C 00 00 00 60 25 39 11 16 07 D7 00 82 77 00 E8 24 39 11 2A 16 18 12 00 
    //77 19 00 E8 24 39 11 05 00 04 01 F0 2F 7F 0F 2A 16 16 2F C5 20 F0 9D 5C 01 00 D8 25 39 11 16 D6 
    //00 07 D5 00 7A EE 19 00 D8 25 39 11 05 00 00 01 B0 58 2E 11 16 EE 00 18 23 39 11 16 16 07 D5 00 
    //82 99 00 50 26 39 11 25 16 18 17 00 96 00 50 26 39 11 37 19 00 D8 25 39 11 05 00 00 01 08 4D 2E 
    //11 16 16 19 19 00 E8 24 39 11 05 00 04 01 F0 2F 7F 0F 20 00 00 1C 20 02 30 11 10 00 50 26 39 11 
    //19 00 D8 25 39 11 05 00 00 01 08 4D 2E 11 00 C8 26 39 11 2A 16 31 30 04 0B 47 
  }


  exec function CSQuestObjective(string aQuestTag,int aObjective,int aValue,optional string aPlayer) {
    cl_ConsoleLog("CSQuestObjective" @ aQuestTag @ string(aObjective)
      @ string(aValue)
      @ aPlayer);//0000 : 1B E1 0B 00 00 A8 A8 A8 A8 1F 43 53 51 75 65 73 74 4F 62 6A 65 63 74 69 76 65 00 00 F0 27 39 11 16 39 53 00 88 29 39 11 16 39 53 00 00 2A 39 11 16 00 78 2A 39 11 16 16 
    if (AuthorizeCommand("CSQuestObjective")) {                                 //0038 : 07 B2 00 1B E6 0B 00 00 1F 43 53 51 75 65 73 74 4F 62 6A 65 63 74 69 76 65 00 16 
      if (aQuestTag == "") {                                                    //0053 : 07 98 00 7A 00 F0 27 39 11 1F 00 16 
        cl_ConsoleLog("Missing parameter(s)!:");                                //005F : 1B E1 0B 00 00 1F 4D 69 73 73 69 6E 67 20 70 61 72 61 6D 65 74 65 72 28 73 29 21 3A 00 16 
        CSHelp("CSQuestObjective");                                             //007D : 1B 01 0C 00 00 1F 43 53 51 75 65 73 74 4F 62 6A 65 63 74 69 76 65 00 16 
      } else {                                                                  //0095 : 06 B2 00 
        cl2sv_CSQuestObjective_CallStub(aQuestTag,aObjective,aValue,aPlayer);   //0098 : 1B 05 0E 00 00 00 F0 27 39 11 00 88 29 39 11 00 00 2A 39 11 00 78 2A 39 11 16 
      }
    }
    //1B E1 0B 00 00 A8 A8 A8 A8 1F 43 53 51 75 65 73 74 4F 62 6A 65 63 74 69 76 65 00 00 F0 27 39 11 
    //16 39 53 00 88 29 39 11 16 39 53 00 00 2A 39 11 16 00 78 2A 39 11 16 16 07 B2 00 1B E6 0B 00 00 
    //1F 43 53 51 75 65 73 74 4F 62 6A 65 63 74 69 76 65 00 16 07 98 00 7A 00 F0 27 39 11 1F 00 16 1B 
    //E1 0B 00 00 1F 4D 69 73 73 69 6E 67 20 70 61 72 61 6D 65 74 65 72 28 73 29 21 3A 00 16 1B 01 0C 
    //00 00 1F 43 53 51 75 65 73 74 4F 62 6A 65 63 74 69 76 65 00 16 06 B2 00 1B 05 0E 00 00 00 F0 27 
    //39 11 00 88 29 39 11 00 00 2A 39 11 00 78 2A 39 11 16 04 0B 47 
  }


  protected native function cl2sv_CSGiveQuest_CallStub();


  private event cl2sv_CSGiveQuest(string aQuestTag,optional string aPlayer) {
    local Game_PlayerPawn playerPawn;
    local export editinline Quest_Type quest;
    if (AuthorizeCommand("CSGiveQuest")) {                                      //0000 : 07 D4 00 1B E6 0B 00 00 1F 43 53 47 69 76 65 51 75 65 73 74 00 16 
      playerPawn = Game_PlayerPawn(sv_GetTarget(aPlayer));                      //0016 : 0F 00 18 2E 39 11 2E F0 47 5B 01 1B 61 0C 00 00 00 90 2E 39 11 16 
      if (playerPawn != None && playerPawn.questLog != None) {                  //002C : 07 D4 00 82 77 00 18 2E 39 11 2A 16 18 12 00 77 19 00 18 2E 39 11 05 00 04 01 F0 2F 7F 0F 2A 16 16 
        foreach AllObjects(Class'Quest_Type',quest) {                           //004D : 2F C5 20 F0 9D 5C 01 00 08 2F 39 11 16 D3 00 
          if (Locs(quest.Tag) == Locs(aQuestTag)) {                             //005C : 07 D2 00 7A EE 19 00 08 2F 39 11 05 00 00 01 B0 58 2E 11 16 EE 00 50 2C 39 11 16 16 
            if (playerPawn.questLog.HasQuest(quest)) {                          //0078 : 07 B5 00 19 19 00 18 2E 39 11 05 00 04 01 F0 2F 7F 0F 0B 00 04 1C B8 29 30 11 00 08 2F 39 11 16 
              playerPawn.questLog.sv_AbandonQuest(quest);                       //0098 : 19 19 00 18 2E 39 11 05 00 04 01 F0 2F 7F 0F 0B 00 04 1C 30 39 30 11 00 08 2F 39 11 16 
            }
            playerPawn.questLog.sv_AcceptQuest(quest);                          //00B5 : 19 19 00 18 2E 39 11 05 00 04 01 F0 2F 7F 0F 0B 00 04 1C 98 32 20 11 00 08 2F 39 11 16 
          }
        }
      }
    }
    //07 D4 00 1B E6 0B 00 00 1F 43 53 47 69 76 65 51 75 65 73 74 00 16 0F 00 18 2E 39 11 2E F0 47 5B 
    //01 1B 61 0C 00 00 00 90 2E 39 11 16 07 D4 00 82 77 00 18 2E 39 11 2A 16 18 12 00 77 19 00 18 2E 
    //39 11 05 00 04 01 F0 2F 7F 0F 2A 16 16 2F C5 20 F0 9D 5C 01 00 08 2F 39 11 16 D3 00 07 D2 00 7A 
    //EE 19 00 08 2F 39 11 05 00 00 01 B0 58 2E 11 16 EE 00 50 2C 39 11 16 16 07 B5 00 19 19 00 18 2E 
    //39 11 05 00 04 01 F0 2F 7F 0F 0B 00 04 1C B8 29 30 11 00 08 2F 39 11 16 19 19 00 18 2E 39 11 05 
    //00 04 01 F0 2F 7F 0F 0B 00 04 1C 30 39 30 11 00 08 2F 39 11 16 19 19 00 18 2E 39 11 05 00 04 01 
    //F0 2F 7F 0F 0B 00 04 1C 98 32 20 11 00 08 2F 39 11 16 31 30 04 0B 47 
  }


  exec function CSGiveQuest(string aQuestTag,optional string aPlayer) {
    cl_ConsoleLog("CSGiveQuest" @ aQuestTag @ aPlayer);                         //0000 : 1B E1 0B 00 00 A8 A8 1F 43 53 47 69 76 65 51 75 65 73 74 00 00 30 30 39 11 16 00 90 31 39 11 16 16 
    if (AuthorizeCommand("CSGiveQuest")) {                                      //0021 : 07 87 00 1B E6 0B 00 00 1F 43 53 47 69 76 65 51 75 65 73 74 00 16 
      if (aQuestTag == "") {                                                    //0037 : 07 77 00 7A 00 30 30 39 11 1F 00 16 
        cl_ConsoleLog("Missing parameter(s)!:");                                //0043 : 1B E1 0B 00 00 1F 4D 69 73 73 69 6E 67 20 70 61 72 61 6D 65 74 65 72 28 73 29 21 3A 00 16 
        CSHelp("CSGiveQuest");                                                  //0061 : 1B 01 0C 00 00 1F 43 53 47 69 76 65 51 75 65 73 74 00 16 
      } else {                                                                  //0074 : 06 87 00 
        cl2sv_CSGiveQuest_CallStub(aQuestTag,aPlayer);                          //0077 : 1B 0B 0E 00 00 00 30 30 39 11 00 90 31 39 11 16 
      }
    }
    //1B E1 0B 00 00 A8 A8 1F 43 53 47 69 76 65 51 75 65 73 74 00 00 30 30 39 11 16 00 90 31 39 11 16 
    //16 07 87 00 1B E6 0B 00 00 1F 43 53 47 69 76 65 51 75 65 73 74 00 16 07 77 00 7A 00 30 30 39 11 
    //1F 00 16 1B E1 0B 00 00 1F 4D 69 73 73 69 6E 67 20 70 61 72 61 6D 65 74 65 72 28 73 29 21 3A 00 
    //16 1B 01 0C 00 00 1F 43 53 47 69 76 65 51 75 65 73 74 00 16 06 87 00 1B 0B 0E 00 00 00 30 30 39 
    //11 00 90 31 39 11 16 04 0B 47 
  }


  protected native function cl2sv_CSUnMute_CallStub();


  private event cl2sv_CSUnMute(string aPlayer,optional string aMessage) {
    local Game_Pawn mutePawn;
    if (AuthorizeCommand("CSMute")) {                                           //0000 : 07 8E 01 1B E6 0B 00 00 1F 43 53 4D 75 74 65 00 16 
      mutePawn = sv_FindPawnByName(aPlayer);                                    //0011 : 0F 00 30 36 39 11 1B 0C 0C 00 00 00 68 33 39 11 16 
      if (mutePawn != None) {                                                   //0022 : 07 8E 01 77 00 30 36 39 11 2A 16 
        if (sv_HigherLevelThan(mutePawn.Controller)) {                          //002D : 07 8E 01 1B 41 0C 00 00 19 00 30 36 39 11 05 00 04 01 00 6E 6C 0F 16 
          if (!mutePawn.IsMuted()) {                                            //0044 : 07 7E 00 81 19 00 30 36 39 11 06 00 04 1B EF 0C 00 00 16 16 
            sv2cl_ConsoleLog_CallStub("'" $ aPlayer $ "' is not muted.");       //0058 : 1B E7 0B 00 00 70 70 1F 27 00 00 68 33 39 11 16 1F 27 20 69 73 20 6E 6F 74 20 6D 75 74 65 64 2E 00 16 16 
          } else {                                                              //007B : 06 8E 01 
            Class'SBDBAsync'.LogCSCommand(mGameMaster.AccountID,Game_Pawn(mGameMaster.Pawn).GetCharacterName(),"CSUnMute",Base_Controller(mutePawn.Controller).AccountID,aPlayer);//007E : 12 20 70 87 24 01 5C 00 00 1B C9 0C 00 00 19 01 E8 CC 38 11 05 00 04 01 28 4D 18 11 19 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 06 00 00 1B 67 05 00 00 16 1F 43 53 55 6E 4D 75 74 65 00 19 2E 78 3D 24 01 19 00 30 36 39 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 4D 18 11 00 68 33 39 11 16 
            mutePawn.sv_Mute(False);                                            //00E3 : 19 00 30 36 39 11 07 00 00 1B 86 0D 00 00 28 16 
            Game_PlayerController(mutePawn.Controller).Chat.sv2cl_OnMessage_CallStub(Game_Pawn(mGameMaster.Pawn).GetCharacterName(),"You have been unmuted: details ("
              $ aMessage
              $ ").",8);//00F3 : 19 19 2E 90 18 5B 01 19 00 30 36 39 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 E8 A0 1B 11 54 00 00 1B 73 0C 00 00 19 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 06 00 00 1B 67 05 00 00 16 70 70 1F 59 6F 75 20 68 61 76 65 20 62 65 65 6E 20 75 6E 6D 75 74 65 64 3A 20 64 65 74 61 69 6C 73 20 28 00 00 A8 36 39 11 16 1F 29 2E 00 16 2C 08 16 
            sv2cl_ConsoleLog_CallStub("'" $ aPlayer $ "' has been unmuted.");   //0167 : 1B E7 0B 00 00 70 70 1F 27 00 00 68 33 39 11 16 1F 27 20 68 61 73 20 62 65 65 6E 20 75 6E 6D 75 74 65 64 2E 00 16 16 
          }
        }
      }
    }
    //07 8E 01 1B E6 0B 00 00 1F 43 53 4D 75 74 65 00 16 0F 00 30 36 39 11 1B 0C 0C 00 00 00 68 33 39 
    //11 16 07 8E 01 77 00 30 36 39 11 2A 16 07 8E 01 1B 41 0C 00 00 19 00 30 36 39 11 05 00 04 01 00 
    //6E 6C 0F 16 07 7E 00 81 19 00 30 36 39 11 06 00 04 1B EF 0C 00 00 16 16 1B E7 0B 00 00 70 70 1F 
    //27 00 00 68 33 39 11 16 1F 27 20 69 73 20 6E 6F 74 20 6D 75 74 65 64 2E 00 16 16 06 8E 01 12 20 
    //70 87 24 01 5C 00 00 1B C9 0C 00 00 19 01 E8 CC 38 11 05 00 04 01 28 4D 18 11 19 2E 18 38 5B 01 
    //19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 06 00 00 1B 67 05 00 00 16 1F 43 53 55 6E 4D 75 74 65 
    //00 19 2E 78 3D 24 01 19 00 30 36 39 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 4D 18 11 00 68 33 
    //39 11 16 19 00 30 36 39 11 07 00 00 1B 86 0D 00 00 28 16 19 19 2E 90 18 5B 01 19 00 30 36 39 11 
    //05 00 04 01 00 6E 6C 0F 05 00 04 01 E8 A0 1B 11 54 00 00 1B 73 0C 00 00 19 2E 18 38 5B 01 19 01 
    //E8 CC 38 11 05 00 04 01 88 83 6C 0F 06 00 00 1B 67 05 00 00 16 70 70 1F 59 6F 75 20 68 61 76 65 
    //20 62 65 65 6E 20 75 6E 6D 75 74 65 64 3A 20 64 65 74 61 69 6C 73 20 28 00 00 A8 36 39 11 16 1F 
    //29 2E 00 16 2C 08 16 1B E7 0B 00 00 70 70 1F 27 00 00 68 33 39 11 16 1F 27 20 68 61 73 20 62 65 
    //65 6E 20 75 6E 6D 75 74 65 64 2E 00 16 16 04 0B 47 
  }


  exec function CSUnMute(string aPlayer,optional string aMessage) {
    cl_ConsoleLog("CSUnMute" @ aPlayer @ aMessage);                             //0000 : 1B E1 0B 00 00 A8 A8 1F 43 53 55 6E 4D 75 74 65 00 00 D0 37 39 11 16 00 D0 38 39 11 16 16 
    if (AuthorizeCommand("CSUnMute")) {                                         //001E : 07 41 00 1B E6 0B 00 00 1F 43 53 55 6E 4D 75 74 65 00 16 
      cl2sv_CSUnMute_CallStub(aPlayer,aMessage);                                //0031 : 1B 18 0E 00 00 00 D0 37 39 11 00 D0 38 39 11 16 
    }
    //1B E1 0B 00 00 A8 A8 1F 43 53 55 6E 4D 75 74 65 00 00 D0 37 39 11 16 00 D0 38 39 11 16 16 07 41 
    //00 1B E6 0B 00 00 1F 43 53 55 6E 4D 75 74 65 00 16 1B 18 0E 00 00 00 D0 37 39 11 00 D0 38 39 11 
    //16 04 0B 47 
  }


  protected native function cl2sv_CSMute_CallStub();


  private event cl2sv_CSMute(string aPlayer,string aScope,optional int aMinutes,optional string aReason) {
    local Game_Pawn mutePawn;
    if (AuthorizeCommand("CSMute")) {                                           //0000 : 07 D3 01 1B E6 0B 00 00 1F 43 53 4D 75 74 65 00 16 
      mutePawn = sv_FindPawnByName(aPlayer);                                    //0011 : 0F 00 20 3B 39 11 1B 0C 0C 00 00 00 A8 3A 39 11 16 
      if (mutePawn != None) {                                                   //0022 : 07 D3 01 77 00 20 3B 39 11 2A 16 
        if (sv_HigherLevelThan(mutePawn.Controller)) {                          //002D : 07 D3 01 1B 41 0C 00 00 19 00 20 3B 39 11 05 00 04 01 00 6E 6C 0F 16 
          if (mutePawn.IsMuted()) {                                             //0044 : 07 80 00 19 00 20 3B 39 11 06 00 04 1B EF 0C 00 00 16 
            sv2cl_ConsoleLog_CallStub("'" $ aPlayer $ "' is already muted.");   //0056 : 1B E7 0B 00 00 70 70 1F 27 00 00 A8 3A 39 11 16 1F 27 20 69 73 20 61 6C 72 65 61 64 79 20 6D 75 74 65 64 2E 00 16 16 
          } else {                                                              //007D : 06 D3 01 
            if (aScope == "") {                                                 //0080 : 07 97 00 7A 00 98 3B 39 11 1F 00 16 
              aScope = "all";                                                   //008C : 0F 00 98 3B 39 11 1F 61 6C 6C 00 
            }
            Class'SBDBAsync'.LogCSCommand(mGameMaster.AccountID,Game_Pawn(mGameMaster.Pawn).GetCharacterName(),"CSMute",Base_Controller(mutePawn.Controller).AccountID,aPlayer,aReason,"",aScope,aMinutes);//0097 : 12 20 70 87 24 01 6B 00 00 1B C9 0C 00 00 19 01 E8 CC 38 11 05 00 04 01 28 4D 18 11 19 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 06 00 00 1B 67 05 00 00 16 1F 43 53 4D 75 74 65 00 19 2E 78 3D 24 01 19 00 20 3B 39 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 4D 18 11 00 A8 3A 39 11 00 10 3C 39 11 1F 00 00 98 3B 39 11 00 88 3C 39 11 16 
            Game_PlayerController(mutePawn.Controller).Chat.sv2cl_OnMessage_CallStub(Game_Pawn(mGameMaster.Pawn).GetCharacterName(),"You have been muted: reason ("
              $ aReason
              $ ").",8);//010B : 19 19 2E 90 18 5B 01 19 00 20 3B 39 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 E8 A0 1B 11 51 00 00 1B 73 0C 00 00 19 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 06 00 00 1B 67 05 00 00 16 70 70 1F 59 6F 75 20 68 61 76 65 20 62 65 65 6E 20 6D 75 74 65 64 3A 20 72 65 61 73 6F 6E 20 28 00 00 10 3C 39 11 16 1F 29 2E 00 16 2C 08 16 
            mutePawn.sv_Mute(True,aMinutes,aScope);                             //017C : 19 00 20 3B 39 11 11 00 00 1B 86 0D 00 00 27 00 88 3C 39 11 00 98 3B 39 11 16 
            sv2cl_ConsoleLog_CallStub("'" $ aPlayer $ "' has been muted for"
              @ string(aMinutes)
              @ "minutes.");//0196 : 1B E7 0B 00 00 A8 A8 70 70 1F 27 00 00 A8 3A 39 11 16 1F 27 20 68 61 73 20 62 65 65 6E 20 6D 75 74 65 64 20 66 6F 72 00 16 39 53 00 88 3C 39 11 16 1F 6D 69 6E 75 74 65 73 2E 00 16 16 
          }
        }
      }
    }
    //07 D3 01 1B E6 0B 00 00 1F 43 53 4D 75 74 65 00 16 0F 00 20 3B 39 11 1B 0C 0C 00 00 00 A8 3A 39 
    //11 16 07 D3 01 77 00 20 3B 39 11 2A 16 07 D3 01 1B 41 0C 00 00 19 00 20 3B 39 11 05 00 04 01 00 
    //6E 6C 0F 16 07 80 00 19 00 20 3B 39 11 06 00 04 1B EF 0C 00 00 16 1B E7 0B 00 00 70 70 1F 27 00 
    //00 A8 3A 39 11 16 1F 27 20 69 73 20 61 6C 72 65 61 64 79 20 6D 75 74 65 64 2E 00 16 16 06 D3 01 
    //07 97 00 7A 00 98 3B 39 11 1F 00 16 0F 00 98 3B 39 11 1F 61 6C 6C 00 12 20 70 87 24 01 6B 00 00 
    //1B C9 0C 00 00 19 01 E8 CC 38 11 05 00 04 01 28 4D 18 11 19 2E 18 38 5B 01 19 01 E8 CC 38 11 05 
    //00 04 01 88 83 6C 0F 06 00 00 1B 67 05 00 00 16 1F 43 53 4D 75 74 65 00 19 2E 78 3D 24 01 19 00 
    //20 3B 39 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 4D 18 11 00 A8 3A 39 11 00 10 3C 39 11 1F 00 
    //00 98 3B 39 11 00 88 3C 39 11 16 19 19 2E 90 18 5B 01 19 00 20 3B 39 11 05 00 04 01 00 6E 6C 0F 
    //05 00 04 01 E8 A0 1B 11 51 00 00 1B 73 0C 00 00 19 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 
    //88 83 6C 0F 06 00 00 1B 67 05 00 00 16 70 70 1F 59 6F 75 20 68 61 76 65 20 62 65 65 6E 20 6D 75 
    //74 65 64 3A 20 72 65 61 73 6F 6E 20 28 00 00 10 3C 39 11 16 1F 29 2E 00 16 2C 08 16 19 00 20 3B 
    //39 11 11 00 00 1B 86 0D 00 00 27 00 88 3C 39 11 00 98 3B 39 11 16 1B E7 0B 00 00 A8 A8 70 70 1F 
    //27 00 00 A8 3A 39 11 16 1F 27 20 68 61 73 20 62 65 65 6E 20 6D 75 74 65 64 20 66 6F 72 00 16 39 
    //53 00 88 3C 39 11 16 1F 6D 69 6E 75 74 65 73 2E 00 16 16 04 0B 47 
  }


  exec function CSMute(string aPlayer,string aScope,optional int aMinutes,optional string aReason) {
    cl_ConsoleLog("CSMute" @ aPlayer @ aScope @ string(aMinutes)
      @ aReason);//0000 : 1B E1 0B 00 00 A8 A8 A8 A8 1F 43 53 4D 75 74 65 00 00 B0 3D 39 11 16 00 30 3F 39 11 16 39 53 00 A8 3F 39 11 16 00 20 40 39 11 16 16 
    if (AuthorizeCommand("CSMute")) {                                           //002C : 07 A0 00 1B E6 0B 00 00 1F 43 53 4D 75 74 65 00 16 
      if (aPlayer == "" || aScope == "") {                                      //003D : 07 86 00 84 7A 00 B0 3D 39 11 1F 00 16 18 0A 00 7A 00 30 3F 39 11 1F 00 16 16 
        cl_ConsoleLog("Missing parameter(s)!:");                                //0057 : 1B E1 0B 00 00 1F 4D 69 73 73 69 6E 67 20 70 61 72 61 6D 65 74 65 72 28 73 29 21 3A 00 16 
        CSHelp("CSMute");                                                       //0075 : 1B 01 0C 00 00 1F 43 53 4D 75 74 65 00 16 
      } else {                                                                  //0083 : 06 A0 00 
        cl2sv_CSMute_CallStub(aPlayer,aScope,aMinutes,aReason);                 //0086 : 1B 1B 0E 00 00 00 B0 3D 39 11 00 30 3F 39 11 00 A8 3F 39 11 00 20 40 39 11 16 
      }
    }
    //1B E1 0B 00 00 A8 A8 A8 A8 1F 43 53 4D 75 74 65 00 00 B0 3D 39 11 16 00 30 3F 39 11 16 39 53 00 
    //A8 3F 39 11 16 00 20 40 39 11 16 16 07 A0 00 1B E6 0B 00 00 1F 43 53 4D 75 74 65 00 16 07 86 00 
    //84 7A 00 B0 3D 39 11 1F 00 16 18 0A 00 7A 00 30 3F 39 11 1F 00 16 16 1B E1 0B 00 00 1F 4D 69 73 
    //73 69 6E 67 20 70 61 72 61 6D 65 74 65 72 28 73 29 21 3A 00 16 1B 01 0C 00 00 1F 43 53 4D 75 74 
    //65 00 16 06 A0 00 1B 1B 0E 00 00 00 B0 3D 39 11 00 30 3F 39 11 00 A8 3F 39 11 00 20 40 39 11 16 
    //04 0B 47 
  }


  protected native function cl2sv_CSTravel_CallStub();


  private event cl2sv_CSTravel(int aWorld,optional string aPlayer) {
    local Game_Pawn targetPawn;
    local Base_Controller Controller;
    local Game_GameServer Engine;
    if (AuthorizeCommand("CSTravel",aPlayer == "")) {                           //0000 : 07 F1 00 1B E6 0B 00 00 1F 43 53 54 72 61 76 65 6C 00 7A 00 E8 43 39 11 1F 00 16 16 
      targetPawn = sv_GetTarget(aPlayer);                                       //001C : 0F 00 60 44 39 11 1B 61 0C 00 00 00 E8 43 39 11 16 
      if (targetPawn != None && targetPawn.Controller != None) {                //002D : 07 F1 00 82 77 00 60 44 39 11 2A 16 18 12 00 77 19 00 60 44 39 11 05 00 04 01 00 6E 6C 0F 2A 16 16 
        Controller = Base_Controller(targetPawn.Controller);                    //004E : 0F 00 D8 44 39 11 2E 78 3D 24 01 19 00 60 44 39 11 05 00 04 01 00 6E 6C 0F 
        Engine = Game_GameServer(Class'Actor'.static.GetGameEngine());          //0067 : 0F 00 50 45 39 11 2E 18 D9 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 
        if (Engine != None) {                                                   //0081 : 07 F1 00 77 00 50 45 39 11 2A 16 
          Engine.LoginToWorldByID(aWorld,Controller.CharacterID,"","");         //008C : 19 00 50 45 39 11 1D 00 04 1B C7 0C 00 00 00 F8 41 39 11 19 00 D8 44 39 11 05 00 04 01 68 3B 19 11 1F 00 1F 00 16 
          sv2cl_ConsoleLog_CallStub("CSTravel: Sending" @ targetPawn.GetCharacterName()
            @ "to world"
            @ string(aWorld));//00B2 : 1B E7 0B 00 00 A8 A8 A8 1F 43 53 54 72 61 76 65 6C 3A 20 53 65 6E 64 69 6E 67 00 19 00 60 44 39 11 06 00 00 1B 67 05 00 00 16 16 1F 74 6F 20 77 6F 72 6C 64 00 16 39 53 00 F8 41 39 11 16 16 
        }
      }
    }
    //07 F1 00 1B E6 0B 00 00 1F 43 53 54 72 61 76 65 6C 00 7A 00 E8 43 39 11 1F 00 16 16 0F 00 60 44 
    //39 11 1B 61 0C 00 00 00 E8 43 39 11 16 07 F1 00 82 77 00 60 44 39 11 2A 16 18 12 00 77 19 00 60 
    //44 39 11 05 00 04 01 00 6E 6C 0F 2A 16 16 0F 00 D8 44 39 11 2E 78 3D 24 01 19 00 60 44 39 11 05 
    //00 04 01 00 6E 6C 0F 0F 00 50 45 39 11 2E 18 D9 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 
    //16 07 F1 00 77 00 50 45 39 11 2A 16 19 00 50 45 39 11 1D 00 04 1B C7 0C 00 00 00 F8 41 39 11 19 
    //00 D8 44 39 11 05 00 04 01 68 3B 19 11 1F 00 1F 00 16 1B E7 0B 00 00 A8 A8 A8 1F 43 53 54 72 61 
    //76 65 6C 3A 20 53 65 6E 64 69 6E 67 00 19 00 60 44 39 11 06 00 00 1B 67 05 00 00 16 16 1F 74 6F 
    //20 77 6F 72 6C 64 00 16 39 53 00 F8 41 39 11 16 16 04 0B 47 
  }


  exec function CSTravel(int aWorld,optional string aPlayer) {
    cl_ConsoleLog("CSTravel" @ string(aWorld) @ aPlayer);                       //0000 : 1B E1 0B 00 00 A8 A8 1F 43 53 54 72 61 76 65 6C 00 39 53 00 78 46 39 11 16 00 F0 46 39 11 16 16 
    if (AuthorizeCommand("CSTravel",aPlayer == "")) {                           //0020 : 07 4C 00 1B E6 0B 00 00 1F 43 53 54 72 61 76 65 6C 00 7A 00 F0 46 39 11 1F 00 16 16 
      cl2sv_CSTravel_CallStub(aWorld,aPlayer);                                  //003C : 1B 1D 0E 00 00 00 78 46 39 11 00 F0 46 39 11 16 
    }
    //1B E1 0B 00 00 A8 A8 1F 43 53 54 72 61 76 65 6C 00 39 53 00 78 46 39 11 16 00 F0 46 39 11 16 16 
    //07 4C 00 1B E6 0B 00 00 1F 43 53 54 72 61 76 65 6C 00 7A 00 F0 46 39 11 1F 00 16 16 1B 1D 0E 00 
    //00 00 78 46 39 11 00 F0 46 39 11 16 04 0B 47 
  }


  protected native function cl2sv_CSStats_CallStub();


  private event cl2sv_CSStats(string aPlayer,string aStat,int aValue) {
    local Game_Pawn statPawn;
    if (AuthorizeCommand("CSStats")) {                                          //0000 : 07 C8 01 1B E6 0B 00 00 1F 43 53 53 74 61 74 73 00 16 
      statPawn = sv_FindPawnByName(aPlayer);                                    //0012 : 0F 00 E0 4B 39 11 1B 0C 0C 00 00 00 C8 48 39 11 16 
      if (statPawn != None) {                                                   //0023 : 07 C8 01 77 00 E0 4B 39 11 2A 16 
        if (sv_HigherLevelThan(statPawn.Controller)) {                          //002E : 07 C8 01 1B 41 0C 00 00 19 00 E0 4B 39 11 05 00 04 01 00 6E 6C 0F 16 
          if (StrCmp(aStat,"m",Len("m"),False) == 0) {                          //0045 : 07 C5 00 9A C8 00 58 4C 39 11 1F 6D 00 7D 1F 6D 00 16 28 16 25 16 
            statPawn.CharacterStats.SetMorale(aValue);                          //005B : 19 19 00 E0 4B 39 11 05 00 04 01 08 43 34 0F 0D 00 00 1B 35 0E 00 00 39 3F 00 D0 4C 39 11 16 
            sv2cl_ConsoleLog_CallStub("'" $ aPlayer $ "'s PHYSIQUE set to"
              @ string(statPawn.CharacterStats.mRecord.Morale)
              $ ".");//007A : 1B E7 0B 00 00 70 A8 70 70 1F 27 00 00 C8 48 39 11 16 1F 27 73 20 50 48 59 53 49 51 55 45 20 73 65 74 20 74 6F 00 16 39 55 36 88 95 1F 11 19 19 00 E0 4B 39 11 05 00 04 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 16 1F 2E 00 16 16 
          }
          if (StrCmp(aStat,"p",Len("p"),False) == 0) {                          //00C5 : 07 43 01 9A C8 00 58 4C 39 11 1F 70 00 7D 1F 70 00 16 28 16 25 16 
            statPawn.CharacterStats.SetPhysique(aValue);                        //00DB : 19 19 00 E0 4B 39 11 05 00 04 01 08 43 34 0F 0D 00 00 1B 34 0E 00 00 39 3F 00 D0 4C 39 11 16 
            sv2cl_ConsoleLog_CallStub("'" $ aPlayer $ "'s MORALE set to"
              @ string(statPawn.CharacterStats.mRecord.Physique)
              $ ".");//00FA : 1B E7 0B 00 00 70 A8 70 70 1F 27 00 00 C8 48 39 11 16 1F 27 73 20 4D 4F 52 41 4C 45 20 73 65 74 20 74 6F 00 16 39 55 36 10 95 1F 11 19 19 00 E0 4B 39 11 05 00 04 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 16 1F 2E 00 16 16 
          }
          if (StrCmp(aStat,"c",Len("c"),False) == 0) {                          //0143 : 07 C8 01 9A C8 00 58 4C 39 11 1F 63 00 7D 1F 63 00 16 28 16 25 16 
            statPawn.CharacterStats.SetConcentration(aValue);                   //0159 : 19 19 00 E0 4B 39 11 05 00 04 01 08 43 34 0F 0D 00 00 1B 37 0E 00 00 39 3F 00 D0 4C 39 11 16 
            sv2cl_ConsoleLog_CallStub("'" $ aPlayer $ "'s CONCENTRATION set to"
              @ string(statPawn.CharacterStats.mRecord.Concentration)
              $ ".");//0178 : 1B E7 0B 00 00 70 A8 70 70 1F 27 00 00 C8 48 39 11 16 1F 27 73 20 43 4F 4E 43 45 4E 54 52 41 54 49 4F 4E 20 73 65 74 20 74 6F 00 16 39 55 36 00 96 1F 11 19 19 00 E0 4B 39 11 05 00 04 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 16 1F 2E 00 16 16 
          }
        }
      }
    }
    //07 C8 01 1B E6 0B 00 00 1F 43 53 53 74 61 74 73 00 16 0F 00 E0 4B 39 11 1B 0C 0C 00 00 00 C8 48 
    //39 11 16 07 C8 01 77 00 E0 4B 39 11 2A 16 07 C8 01 1B 41 0C 00 00 19 00 E0 4B 39 11 05 00 04 01 
    //00 6E 6C 0F 16 07 C5 00 9A C8 00 58 4C 39 11 1F 6D 00 7D 1F 6D 00 16 28 16 25 16 19 19 00 E0 4B 
    //39 11 05 00 04 01 08 43 34 0F 0D 00 00 1B 35 0E 00 00 39 3F 00 D0 4C 39 11 16 1B E7 0B 00 00 70 
    //A8 70 70 1F 27 00 00 C8 48 39 11 16 1F 27 73 20 50 48 59 53 49 51 55 45 20 73 65 74 20 74 6F 00 
    //16 39 55 36 88 95 1F 11 19 19 00 E0 4B 39 11 05 00 04 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 16 
    //1F 2E 00 16 16 07 43 01 9A C8 00 58 4C 39 11 1F 70 00 7D 1F 70 00 16 28 16 25 16 19 19 00 E0 4B 
    //39 11 05 00 04 01 08 43 34 0F 0D 00 00 1B 34 0E 00 00 39 3F 00 D0 4C 39 11 16 1B E7 0B 00 00 70 
    //A8 70 70 1F 27 00 00 C8 48 39 11 16 1F 27 73 20 4D 4F 52 41 4C 45 20 73 65 74 20 74 6F 00 16 39 
    //55 36 10 95 1F 11 19 19 00 E0 4B 39 11 05 00 04 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 16 1F 2E 
    //00 16 16 07 C8 01 9A C8 00 58 4C 39 11 1F 63 00 7D 1F 63 00 16 28 16 25 16 19 19 00 E0 4B 39 11 
    //05 00 04 01 08 43 34 0F 0D 00 00 1B 37 0E 00 00 39 3F 00 D0 4C 39 11 16 1B E7 0B 00 00 70 A8 70 
    //70 1F 27 00 00 C8 48 39 11 16 1F 27 73 20 43 4F 4E 43 45 4E 54 52 41 54 49 4F 4E 20 73 65 74 20 
    //74 6F 00 16 39 55 36 00 96 1F 11 19 19 00 E0 4B 39 11 05 00 04 01 08 43 34 0F 05 00 68 01 78 2D 
    //34 0F 16 1F 2E 00 16 16 04 0B 47 
  }


  exec function CSStats(string aPlayer,string aStat,int aValue) {
    cl_ConsoleLog("CSStats" @ aPlayer @ aStat @ string(aValue));                //0000 : 1B E1 0B 00 00 A8 A8 A8 1F 43 53 53 74 61 74 73 00 00 F8 4D 39 11 16 00 70 4E 39 11 16 39 53 00 E8 4E 39 11 16 16 
    if (AuthorizeCommand("CSStats")) {                                          //0026 : 07 97 00 1B E6 0B 00 00 1F 43 53 53 74 61 74 73 00 16 
      if (aPlayer == "" || aStat == "") {                                       //0038 : 07 82 00 84 7A 00 F8 4D 39 11 1F 00 16 18 0A 00 7A 00 70 4E 39 11 1F 00 16 16 
        cl_ConsoleLog("Missing parameter(s)!:");                                //0052 : 1B E1 0B 00 00 1F 4D 69 73 73 69 6E 67 20 70 61 72 61 6D 65 74 65 72 28 73 29 21 3A 00 16 
        CSHelp("CSStats");                                                      //0070 : 1B 01 0C 00 00 1F 43 53 53 74 61 74 73 00 16 
      } else {                                                                  //007F : 06 97 00 
        cl2sv_CSStats_CallStub(aPlayer,aStat,aValue);                           //0082 : 1B 20 0E 00 00 00 F8 4D 39 11 00 70 4E 39 11 00 E8 4E 39 11 16 
      }
    }
    //1B E1 0B 00 00 A8 A8 A8 1F 43 53 53 74 61 74 73 00 00 F8 4D 39 11 16 00 70 4E 39 11 16 39 53 00 
    //E8 4E 39 11 16 16 07 97 00 1B E6 0B 00 00 1F 43 53 53 74 61 74 73 00 16 07 82 00 84 7A 00 F8 4D 
    //39 11 1F 00 16 18 0A 00 7A 00 70 4E 39 11 1F 00 16 16 1B E1 0B 00 00 1F 4D 69 73 73 69 6E 67 20 
    //70 61 72 61 6D 65 74 65 72 28 73 29 21 3A 00 16 1B 01 0C 00 00 1F 43 53 53 74 61 74 73 00 16 06 
    //97 00 1B 20 0E 00 00 00 F8 4D 39 11 00 70 4E 39 11 00 E8 4E 39 11 16 04 0B 47 
  }


  private native function sv_CSKick(Game_PlayerController aPawn,optional string aMessage);


  protected native function cl2sv_CSKick_CallStub();


  private event cl2sv_CSKick(string aPlayer,string aMessage) {
    local Game_Pawn kickPawn;
    if (AuthorizeCommand("CSKick")) {                                           //0000 : 07 EB 00 1B E6 0B 00 00 1F 43 53 4B 69 63 6B 00 16 
      kickPawn = sv_FindPawnByName(aPlayer);                                    //0011 : 0F 00 10 53 39 11 1B 0C 0C 00 00 00 98 52 39 11 16 
      if (kickPawn != None) {                                                   //0022 : 07 EB 00 77 00 10 53 39 11 2A 16 
        if (sv_HigherLevelThan(kickPawn.Controller)) {                          //002D : 07 EB 00 1B 41 0C 00 00 19 00 10 53 39 11 05 00 04 01 00 6E 6C 0F 16 
          sv_CSKick(Game_PlayerController(kickPawn.Controller),aMessage);       //0044 : 1B 25 0E 00 00 2E 90 18 5B 01 19 00 10 53 39 11 05 00 04 01 00 6E 6C 0F 00 88 53 39 11 16 
          Class'SBDBAsync'.LogCSCommand(mGameMaster.AccountID,Game_Pawn(mGameMaster.Pawn).GetCharacterName(),"CSKick",Base_Controller(kickPawn.Controller).AccountID,aPlayer,aMessage);//0062 : 12 20 70 87 24 01 5F 00 00 1B C9 0C 00 00 19 01 E8 CC 38 11 05 00 04 01 28 4D 18 11 19 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 06 00 00 1B 67 05 00 00 16 1F 43 53 4B 69 63 6B 00 19 2E 78 3D 24 01 19 00 10 53 39 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 4D 18 11 00 98 52 39 11 00 88 53 39 11 16 
          sv2cl_ConsoleLog_CallStub("You kicked '" $ aPlayer $ "'.");           //00CA : 1B E7 0B 00 00 70 70 1F 59 6F 75 20 6B 69 63 6B 65 64 20 27 00 00 98 52 39 11 16 1F 27 2E 00 16 16 
        }
      }
    }
    //07 EB 00 1B E6 0B 00 00 1F 43 53 4B 69 63 6B 00 16 0F 00 10 53 39 11 1B 0C 0C 00 00 00 98 52 39 
    //11 16 07 EB 00 77 00 10 53 39 11 2A 16 07 EB 00 1B 41 0C 00 00 19 00 10 53 39 11 05 00 04 01 00 
    //6E 6C 0F 16 1B 25 0E 00 00 2E 90 18 5B 01 19 00 10 53 39 11 05 00 04 01 00 6E 6C 0F 00 88 53 39 
    //11 16 12 20 70 87 24 01 5F 00 00 1B C9 0C 00 00 19 01 E8 CC 38 11 05 00 04 01 28 4D 18 11 19 2E 
    //18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 06 00 00 1B 67 05 00 00 16 1F 43 53 4B 69 
    //63 6B 00 19 2E 78 3D 24 01 19 00 10 53 39 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 4D 18 11 00 
    //98 52 39 11 00 88 53 39 11 16 1B E7 0B 00 00 70 70 1F 59 6F 75 20 6B 69 63 6B 65 64 20 27 00 00 
    //98 52 39 11 16 1F 27 2E 00 16 16 04 0B 47 
  }


  exec function CSKick(string aPlayer,string aMessage) {
    cl_ConsoleLog("CSKick" @ aPlayer);                                          //0000 : 1B E1 0B 00 00 A8 1F 43 53 4B 69 63 6B 00 00 B0 54 39 11 16 16 
    if (AuthorizeCommand("CSKick")) {                                           //0015 : 07 36 00 1B E6 0B 00 00 1F 43 53 4B 69 63 6B 00 16 
      cl2sv_CSKick_CallStub(aPlayer,aMessage);                                  //0026 : 1B 2D 0E 00 00 00 B0 54 39 11 00 A0 55 39 11 16 
    }
    //1B E1 0B 00 00 A8 1F 43 53 4B 69 63 6B 00 00 B0 54 39 11 16 16 07 36 00 1B E6 0B 00 00 1F 43 53 
    //4B 69 63 6B 00 16 1B 2D 0E 00 00 00 B0 54 39 11 00 A0 55 39 11 16 04 0B 47 
  }


  protected native function cl2sv_CSSummon_CallStub();


  private event cl2sv_CSSummon(string aPlayer) {
    local Game_Pawn targetPawn;
    if (AuthorizeCommand("CSSummon")) {                                         //0000 : 07 AB 00 1B E6 0B 00 00 1F 43 53 53 75 6D 6D 6F 6E 00 16 
      targetPawn = sv_FindPawnByName(aPlayer);                                  //0013 : 0F 00 08 59 39 11 1B 0C 0C 00 00 00 78 57 39 11 16 
      if (targetPawn != None) {                                                 //0024 : 07 AB 00 77 00 08 59 39 11 2A 16 
        if (sv_HigherLevelThan(targetPawn.Controller)) {                        //002F : 07 AB 00 1B 41 0C 00 00 19 00 08 59 39 11 05 00 04 01 00 6E 6C 0F 16 
          targetPawn.sv_TeleportTo(mGameMaster.Pawn.Location,mGameMaster.Pawn.Rotation);//0046 : 19 00 08 59 39 11 34 00 04 1B 4A 07 00 00 19 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 05 00 0C 01 30 81 6C 0F 19 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 05 00 0C 01 00 84 6C 0F 16 
          sv2cl_ConsoleLog_CallStub("You have summoned '" @ aPlayer
            $ "'.");//0083 : 1B E7 0B 00 00 70 A8 1F 59 6F 75 20 68 61 76 65 20 73 75 6D 6D 6F 6E 65 64 20 27 00 00 78 57 39 11 16 1F 27 2E 00 16 16 
        }
      }
    }
    //07 AB 00 1B E6 0B 00 00 1F 43 53 53 75 6D 6D 6F 6E 00 16 0F 00 08 59 39 11 1B 0C 0C 00 00 00 78 
    //57 39 11 16 07 AB 00 77 00 08 59 39 11 2A 16 07 AB 00 1B 41 0C 00 00 19 00 08 59 39 11 05 00 04 
    //01 00 6E 6C 0F 16 19 00 08 59 39 11 34 00 04 1B 4A 07 00 00 19 19 01 E8 CC 38 11 05 00 04 01 88 
    //83 6C 0F 05 00 0C 01 30 81 6C 0F 19 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 05 00 0C 01 00 84 
    //6C 0F 16 1B E7 0B 00 00 70 A8 1F 59 6F 75 20 68 61 76 65 20 73 75 6D 6D 6F 6E 65 64 20 27 00 00 
    //78 57 39 11 16 1F 27 2E 00 16 16 04 0B 47 
  }


  exec function CSSummon(string aPlayer) {
    cl_ConsoleLog("CSSummon" @ aPlayer);                                        //0000 : 1B E1 0B 00 00 A8 1F 43 53 53 75 6D 6D 6F 6E 00 00 30 5A 39 11 16 16 
    if (AuthorizeCommand("CSSummon")) {                                         //0017 : 07 6D 00 1B E6 0B 00 00 1F 43 53 53 75 6D 6D 6F 6E 00 16 
      if (aPlayer != "") {                                                      //002A : 07 44 00 7B 00 30 5A 39 11 1F 00 16 
        cl2sv_CSSummon_CallStub(aPlayer);                                       //0036 : 1B 32 0E 00 00 00 30 5A 39 11 16 
      } else {                                                                  //0041 : 06 6D 00 
        cl_ConsoleLog("You must specify a player target.");                     //0044 : 1B E1 0B 00 00 1F 59 6F 75 20 6D 75 73 74 20 73 70 65 63 69 66 79 20 61 20 70 6C 61 79 65 72 20 74 61 72 67 65 74 2E 00 16 
      }
    }
    //1B E1 0B 00 00 A8 1F 43 53 53 75 6D 6D 6F 6E 00 00 30 5A 39 11 16 16 07 6D 00 1B E6 0B 00 00 1F 
    //43 53 53 75 6D 6D 6F 6E 00 16 07 44 00 7B 00 30 5A 39 11 1F 00 16 1B 32 0E 00 00 00 30 5A 39 11 
    //16 06 6D 00 1B E1 0B 00 00 1F 59 6F 75 20 6D 75 73 74 20 73 70 65 63 69 66 79 20 61 20 70 6C 61 
    //79 65 72 20 74 61 72 67 65 74 2E 00 16 04 0B 47 
  }


  protected native function cl2sv_CSRespawn_CallStub();


  private event cl2sv_CSRespawn(optional string aPlayer,optional string aTag) {
    local Game_Pawn targetPawn;
    local PlayerStart spawnPoint;
    if (AuthorizeCommand("CSRespawn",aPlayer == "")) {                          //0000 : 07 59 01 1B E6 0B 00 00 1F 43 53 52 65 73 70 61 77 6E 00 7A 00 D0 5C 39 11 1F 00 16 16 
      targetPawn = sv_FindPawnByName(aPlayer);                                  //001D : 0F 00 50 5F 39 11 1B 0C 0C 00 00 00 D0 5C 39 11 16 
      if (targetPawn != None) {                                                 //002E : 07 59 01 77 00 50 5F 39 11 2A 16 
        if (targetPawn == mGameMaster.Pawn
          || sv_HigherLevelThan(targetPawn.Controller)) {//0039 : 07 59 01 84 72 00 50 5F 39 11 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 16 18 15 00 1B 41 0C 00 00 19 00 50 5F 39 11 05 00 04 01 00 6E 6C 0F 16 16 
          if (aTag == "") {                                                     //006A : 07 8A 00 7A 00 C8 5F 39 11 1F 00 16 
            spawnPoint = sv_FindNearestPlayerstart(targetPawn);                 //0076 : 0F 00 40 60 39 11 1B F4 0E 00 00 00 50 5F 39 11 16 
          } else {                                                              //0087 : 06 B3 00 
            spawnPoint = Game_GameInfo(targetPawn.GetGameInfo()).sv_GetPlayerStart(aTag);//008A : 0F 00 40 60 39 11 19 2E 10 F9 5A 01 19 00 50 5F 39 11 06 00 04 1C 38 E1 6C 0F 16 0B 00 04 1B 11 07 00 00 00 C8 5F 39 11 16 
          }
          sv2cl_ConsoleLog_CallStub("CSRespawn: Teleported" @ targetPawn.GetCharacterName()
            @ "to"
            @ string(spawnPoint)
            @ "@"
            @ string(spawnPoint.Location));//00B3 : 1B E7 0B 00 00 A8 A8 A8 A8 A8 1F 43 53 52 65 73 70 61 77 6E 3A 20 54 65 6C 65 70 6F 72 74 65 64 00 19 00 50 5F 39 11 06 00 00 1B 67 05 00 00 16 16 1F 74 6F 00 16 39 56 00 40 60 39 11 16 1F 40 00 16 39 58 19 00 40 60 39 11 05 00 0C 01 30 81 6C 0F 16 16 
          targetPawn.sv_TeleportTo(spawnPoint.Location,spawnPoint.Rotation);    //0107 : 19 00 50 5F 39 11 22 00 04 1B 4A 07 00 00 19 00 40 60 39 11 05 00 0C 01 30 81 6C 0F 19 00 40 60 39 11 05 00 0C 01 00 84 6C 0F 16 
          targetPawn.TriggerEvent(spawnPoint.Event,spawnPoint,targetPawn);      //0132 : 19 00 50 5F 39 11 1E 00 00 1C F8 B1 34 0F 19 00 40 60 39 11 05 00 04 01 38 9F 6C 0F 00 40 60 39 11 00 50 5F 39 11 16 
        }
      }
    }
    //07 59 01 1B E6 0B 00 00 1F 43 53 52 65 73 70 61 77 6E 00 7A 00 D0 5C 39 11 1F 00 16 16 0F 00 50 
    //5F 39 11 1B 0C 0C 00 00 00 D0 5C 39 11 16 07 59 01 77 00 50 5F 39 11 2A 16 07 59 01 84 72 00 50 
    //5F 39 11 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 16 18 15 00 1B 41 0C 00 00 19 00 50 5F 39 11 
    //05 00 04 01 00 6E 6C 0F 16 16 07 8A 00 7A 00 C8 5F 39 11 1F 00 16 0F 00 40 60 39 11 1B F4 0E 00 
    //00 00 50 5F 39 11 16 06 B3 00 0F 00 40 60 39 11 19 2E 10 F9 5A 01 19 00 50 5F 39 11 06 00 04 1C 
    //38 E1 6C 0F 16 0B 00 04 1B 11 07 00 00 00 C8 5F 39 11 16 1B E7 0B 00 00 A8 A8 A8 A8 A8 1F 43 53 
    //52 65 73 70 61 77 6E 3A 20 54 65 6C 65 70 6F 72 74 65 64 00 19 00 50 5F 39 11 06 00 00 1B 67 05 
    //00 00 16 16 1F 74 6F 00 16 39 56 00 40 60 39 11 16 1F 40 00 16 39 58 19 00 40 60 39 11 05 00 0C 
    //01 30 81 6C 0F 16 16 19 00 50 5F 39 11 22 00 04 1B 4A 07 00 00 19 00 40 60 39 11 05 00 0C 01 30 
    //81 6C 0F 19 00 40 60 39 11 05 00 0C 01 00 84 6C 0F 16 19 00 50 5F 39 11 1E 00 00 1C F8 B1 34 0F 
    //19 00 40 60 39 11 05 00 04 01 38 9F 6C 0F 00 40 60 39 11 00 50 5F 39 11 16 04 0B 47 
  }


  exec function CSRespawn(optional string aPlayer,optional string aTag) {
    cl_ConsoleLog("CSRespawn" @ aPlayer @ aTag);                                //0000 : 1B E1 0B 00 00 A8 A8 1F 43 53 52 65 73 70 61 77 6E 00 00 68 61 39 11 16 00 78 62 39 11 16 16 
    if (AuthorizeCommand("CSRespawn",aPlayer == "")) {                          //001F : 07 4C 00 1B E6 0B 00 00 1F 43 53 52 65 73 70 61 77 6E 00 7A 00 68 61 39 11 1F 00 16 16 
      cl2sv_CSRespawn_CallStub(aPlayer,aTag);                                   //003C : 1B 36 0E 00 00 00 68 61 39 11 00 78 62 39 11 16 
    }
    //1B E1 0B 00 00 A8 A8 1F 43 53 52 65 73 70 61 77 6E 00 00 68 61 39 11 16 00 78 62 39 11 16 16 07 
    //4C 00 1B E6 0B 00 00 1F 43 53 52 65 73 70 61 77 6E 00 7A 00 68 61 39 11 1F 00 16 16 1B 36 0E 00 
    //00 00 68 61 39 11 00 78 62 39 11 16 04 0B 47 
  }


  protected native function cl2sv_CSTeleport_CallStub();


  private event cl2sv_CSTeleport(string aPlayerOrX,optional string aY,optional string aZ) {
    local Game_Pawn targetPawn;
    local Vector TargetLocation;
    if (AuthorizeCommand("CSTeleport")) {                                       //0000 : 07 40 01 1B E6 0B 00 00 1F 43 53 54 65 6C 65 70 6F 72 74 00 16 
      if (aY == "" && aZ == "") {                                               //0015 : 07 96 00 82 7A 00 C8 64 39 11 1F 00 16 18 0A 00 7A 00 40 65 39 11 1F 00 16 16 
        targetPawn = sv_FindPawnByName(aPlayerOrX);                             //002F : 0F 00 B8 65 39 11 1B 0C 0C 00 00 00 50 64 39 11 16 
        if (targetPawn != None) {                                               //0040 : 07 62 00 77 00 B8 65 39 11 2A 16 
          TargetLocation = targetPawn.Location;                                 //004B : 0F 00 30 66 39 11 19 00 B8 65 39 11 05 00 0C 01 30 81 6C 0F 
        } else {                                                                //005F : 06 93 00 
          sv2cl_ConsoleLog_CallStub("CSTeleport: Couldn't find player"
            @ aPlayerOrX);//0062 : 1B E7 0B 00 00 A8 1F 43 53 54 65 6C 65 70 6F 72 74 3A 20 43 6F 75 6C 64 6E 27 74 20 66 69 6E 64 20 70 6C 61 79 65 72 00 00 50 64 39 11 16 16 
          return;                                                               //0091 : 04 0B 
        }
      } else {                                                                  //0093 : 06 CC 00 
        TargetLocation.X = float(aPlayerOrX);                                   //0096 : 0F 36 48 C4 69 0F 00 30 66 39 11 39 4C 00 50 64 39 11 
        TargetLocation.Y = float(aY);                                           //00A8 : 0F 36 C0 C4 69 0F 00 30 66 39 11 39 4C 00 C8 64 39 11 
        TargetLocation.Z = float(aZ);                                           //00BA : 0F 36 38 C5 69 0F 00 30 66 39 11 39 4C 00 40 65 39 11 
      }
      Game_Pawn(mGameMaster.Pawn).sv_TeleportTo(TargetLocation,mGameMaster.Pawn.Rotation);//00CC : 19 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 22 00 04 1B 4A 07 00 00 00 30 66 39 11 19 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 05 00 0C 01 00 84 6C 0F 16 
      sv2cl_ConsoleLog_CallStub("CSTeleport: You are teleported to location"
        @ string(TargetLocation));//0105 : 1B E7 0B 00 00 A8 1F 43 53 54 65 6C 65 70 6F 72 74 3A 20 59 6F 75 20 61 72 65 20 74 65 6C 65 70 6F 72 74 65 64 20 74 6F 20 6C 6F 63 61 74 69 6F 6E 00 39 58 00 30 66 39 11 16 16 
    }
    //07 40 01 1B E6 0B 00 00 1F 43 53 54 65 6C 65 70 6F 72 74 00 16 07 96 00 82 7A 00 C8 64 39 11 1F 
    //00 16 18 0A 00 7A 00 40 65 39 11 1F 00 16 16 0F 00 B8 65 39 11 1B 0C 0C 00 00 00 50 64 39 11 16 
    //07 62 00 77 00 B8 65 39 11 2A 16 0F 00 30 66 39 11 19 00 B8 65 39 11 05 00 0C 01 30 81 6C 0F 06 
    //93 00 1B E7 0B 00 00 A8 1F 43 53 54 65 6C 65 70 6F 72 74 3A 20 43 6F 75 6C 64 6E 27 74 20 66 69 
    //6E 64 20 70 6C 61 79 65 72 00 00 50 64 39 11 16 16 04 0B 06 CC 00 0F 36 48 C4 69 0F 00 30 66 39 
    //11 39 4C 00 50 64 39 11 0F 36 C0 C4 69 0F 00 30 66 39 11 39 4C 00 C8 64 39 11 0F 36 38 C5 69 0F 
    //00 30 66 39 11 39 4C 00 40 65 39 11 19 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 
    //22 00 04 1B 4A 07 00 00 00 30 66 39 11 19 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 05 00 0C 01 
    //00 84 6C 0F 16 1B E7 0B 00 00 A8 1F 43 53 54 65 6C 65 70 6F 72 74 3A 20 59 6F 75 20 61 72 65 20 
    //74 65 6C 65 70 6F 72 74 65 64 20 74 6F 20 6C 6F 63 61 74 69 6F 6E 00 39 58 00 30 66 39 11 16 16 
    //04 0B 47 
  }


  exec function CSTeleport(string aPlayerOrX,optional string Y,optional string Z) {
    cl_ConsoleLog("CSTeleport" @ aPlayerOrX @ Y @ Z);                           //0000 : 1B E1 0B 00 00 A8 A8 A8 1F 43 53 54 65 6C 65 70 6F 72 74 00 00 58 67 39 11 16 00 C8 68 39 11 16 00 40 69 39 11 16 16 
    if (AuthorizeCommand("CSTeleport")) {                                       //0027 : 07 90 00 1B E6 0B 00 00 1F 43 53 54 65 6C 65 70 6F 72 74 00 16 
      if (aPlayerOrX == "") {                                                   //003C : 07 7B 00 7A 00 58 67 39 11 1F 00 16 
        cl_ConsoleLog("Missing parameter(s)!:");                                //0048 : 1B E1 0B 00 00 1F 4D 69 73 73 69 6E 67 20 70 61 72 61 6D 65 74 65 72 28 73 29 21 3A 00 16 
        CSHelp("CSTeleport");                                                   //0066 : 1B 01 0C 00 00 1F 43 53 54 65 6C 65 70 6F 72 74 00 16 
      } else {                                                                  //0078 : 06 90 00 
        cl2sv_CSTeleport_CallStub(aPlayerOrX,Y,Z);                              //007B : 1B 43 0E 00 00 00 58 67 39 11 00 C8 68 39 11 00 40 69 39 11 16 
      }
    }
    //1B E1 0B 00 00 A8 A8 A8 1F 43 53 54 65 6C 65 70 6F 72 74 00 00 58 67 39 11 16 00 C8 68 39 11 16 
    //00 40 69 39 11 16 16 07 90 00 1B E6 0B 00 00 1F 43 53 54 65 6C 65 70 6F 72 74 00 16 07 7B 00 7A 
    //00 58 67 39 11 1F 00 16 1B E1 0B 00 00 1F 4D 69 73 73 69 6E 67 20 70 61 72 61 6D 65 74 65 72 28 
    //73 29 21 3A 00 16 1B 01 0C 00 00 1F 43 53 54 65 6C 65 70 6F 72 74 00 16 06 90 00 1B 43 0E 00 00 
    //00 58 67 39 11 00 C8 68 39 11 00 40 69 39 11 16 04 0B 47 
  }


  private function sv_Kill(Game_Pawn aTargetPawn) {
    if (aTargetPawn != None
      && (aTargetPawn == mGameMaster.Pawn
      || sv_HigherLevelThan(aTargetPawn.Controller))) {//0000 : 07 F3 00 82 77 00 D0 F1 38 11 2A 16 18 2F 00 84 72 00 D0 F1 38 11 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 16 18 15 00 1B 41 0C 00 00 19 00 D0 F1 38 11 05 00 04 01 00 6E 6C 0F 16 16 16 
      Class'SBDBAsync'.LogCSCommand(mGameMaster.AccountID,Game_Pawn(mGameMaster.Pawn).GetCharacterName(),"CSKill",Base_Controller(aTargetPawn.Controller).AccountID,aTargetPawn.GetCharacterName());//003E : 12 20 70 87 24 01 64 00 00 1B C9 0C 00 00 19 01 E8 CC 38 11 05 00 04 01 28 4D 18 11 19 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 06 00 00 1B 67 05 00 00 16 1F 43 53 4B 69 6C 6C 00 19 2E 78 3D 24 01 19 00 D0 F1 38 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 4D 18 11 19 00 D0 F1 38 11 06 00 00 1B 67 05 00 00 16 16 
      aTargetPawn.Died(mGameMaster,Class'Burned',vect(0.000000, 0.000000, 0.000000));//00AB : 19 00 D0 F1 38 11 1D 00 00 1B 13 0F 00 00 01 E8 CC 38 11 20 00 F4 38 11 23 00 00 00 00 00 00 00 00 00 00 00 00 16 
      sv2cl_ConsoleLog_CallStub("Killed" @ aTargetPawn.GetCharacterName());     //00D1 : 1B E7 0B 00 00 A8 1F 4B 69 6C 6C 65 64 00 19 00 D0 F1 38 11 06 00 00 1B 67 05 00 00 16 16 16 
    } else {                                                                    //00F0 : 06 1F 01 
      sv2cl_ConsoleLog_CallStub("Not allowed to kill" @ aTargetPawn.GetCharacterName());//00F3 : 1B E7 0B 00 00 A8 1F 4E 6F 74 20 61 6C 6C 6F 77 65 64 20 74 6F 20 6B 69 6C 6C 00 19 00 D0 F1 38 11 06 00 00 1B 67 05 00 00 16 16 16 
    }
    //07 F3 00 82 77 00 D0 F1 38 11 2A 16 18 2F 00 84 72 00 D0 F1 38 11 19 01 E8 CC 38 11 05 00 04 01 
    //88 83 6C 0F 16 18 15 00 1B 41 0C 00 00 19 00 D0 F1 38 11 05 00 04 01 00 6E 6C 0F 16 16 16 12 20 
    //70 87 24 01 64 00 00 1B C9 0C 00 00 19 01 E8 CC 38 11 05 00 04 01 28 4D 18 11 19 2E 18 38 5B 01 
    //19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 06 00 00 1B 67 05 00 00 16 1F 43 53 4B 69 6C 6C 00 19 
    //2E 78 3D 24 01 19 00 D0 F1 38 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 4D 18 11 19 00 D0 F1 38 
    //11 06 00 00 1B 67 05 00 00 16 16 19 00 D0 F1 38 11 1D 00 00 1B 13 0F 00 00 01 E8 CC 38 11 20 00 
    //F4 38 11 23 00 00 00 00 00 00 00 00 00 00 00 00 16 1B E7 0B 00 00 A8 1F 4B 69 6C 6C 65 64 00 19 
    //00 D0 F1 38 11 06 00 00 1B 67 05 00 00 16 16 16 06 1F 01 1B E7 0B 00 00 A8 1F 4E 6F 74 20 61 6C 
    //6C 6F 77 65 64 20 74 6F 20 6B 69 6C 6C 00 19 00 D0 F1 38 11 06 00 00 1B 67 05 00 00 16 16 16 04 
    //0B 47 
  }


  protected native function cl2sv_CSKillPlayer_CallStub();


  private event cl2sv_CSKillPlayer(optional string aPlayer) {
    local Game_Pawn targetPawn;
    if (AuthorizeCommand("CSKillPlayer",aPlayer == "")) {                       //0000 : 07 47 00 1B E6 0B 00 00 1F 43 53 4B 69 6C 6C 50 6C 61 79 65 72 00 7A 00 40 F9 38 11 1F 00 16 16 
      targetPawn = sv_GetTarget(aPlayer);                                       //0020 : 0F 00 B8 77 39 11 1B 61 0C 00 00 00 40 F9 38 11 16 
      if (targetPawn != None) {                                                 //0031 : 07 47 00 77 00 B8 77 39 11 2A 16 
        sv_Kill(targetPawn);                                                    //003C : 1B 73 0D 00 00 00 B8 77 39 11 16 
      }
    }
    //07 47 00 1B E6 0B 00 00 1F 43 53 4B 69 6C 6C 50 6C 61 79 65 72 00 7A 00 40 F9 38 11 1F 00 16 16 
    //0F 00 B8 77 39 11 1B 61 0C 00 00 00 40 F9 38 11 16 07 47 00 77 00 B8 77 39 11 2A 16 1B 73 0D 00 
    //00 00 B8 77 39 11 16 04 0B 47 
  }


  exec function CSKillPlayer(optional string aPlayer) {
    cl_ConsoleLog("CSKillPlayer" @ aPlayer);                                    //0000 : 1B E1 0B 00 00 A8 1F 43 53 4B 69 6C 6C 50 6C 61 79 65 72 00 00 E0 78 39 11 16 16 
    if (AuthorizeCommand("CSKillPlayer",aPlayer == "")) {                       //001B : 07 46 00 1B E6 0B 00 00 1F 43 53 4B 69 6C 6C 50 6C 61 79 65 72 00 7A 00 E0 78 39 11 1F 00 16 16 
      cl2sv_CSKillPlayer_CallStub(aPlayer);                                     //003B : 1B 4B 0E 00 00 00 E0 78 39 11 16 
    }
    //1B E1 0B 00 00 A8 1F 43 53 4B 69 6C 6C 50 6C 61 79 65 72 00 00 E0 78 39 11 16 16 07 46 00 1B E6 
    //0B 00 00 1F 43 53 4B 69 6C 6C 50 6C 61 79 65 72 00 7A 00 E0 78 39 11 1F 00 16 16 1B 4B 0E 00 00 
    //00 E0 78 39 11 16 04 0B 47 
  }


  protected native function cl2sv_CSKillMonster_CallStub();


  private event cl2sv_CSKillMonster(Game_Pawn aMonster) {
    if (AuthorizeCommand("CSKillMonster")) {                                    //0000 : 07 23 00 1B E6 0B 00 00 1F 43 53 4B 69 6C 6C 4D 6F 6E 73 74 65 72 00 16 
      sv_Kill(aMonster);                                                        //0018 : 1B 73 0D 00 00 00 48 7B 39 11 16 
    }
    //07 23 00 1B E6 0B 00 00 1F 43 53 4B 69 6C 6C 4D 6F 6E 73 74 65 72 00 16 1B 73 0D 00 00 00 48 7B 
    //39 11 16 04 0B 47 
  }


  exec function CSKillMonster() {
    local Game_Pawn targetPawn;
    cl_ConsoleLog("CSKillMonster");                                             //0000 : 1B E1 0B 00 00 1F 43 53 4B 69 6C 6C 4D 6F 6E 73 74 65 72 00 16 
    if (AuthorizeCommand("CSKillMonster")) {                                    //0015 : 07 C2 00 1B E6 0B 00 00 1F 43 53 4B 69 6C 6C 4D 6F 6E 73 74 65 72 00 16 
      targetPawn = mGameMaster.Input.cl_GetTargetPawn();                        //002D : 0F 00 D0 7C 39 11 19 19 01 E8 CC 38 11 05 00 04 01 B0 14 37 0F 06 00 04 1B 39 05 00 00 16 
      cl_ConsoleLog("About to kill" @ string(targetPawn));                      //004B : 1B E1 0B 00 00 A8 1F 41 62 6F 75 74 20 74 6F 20 6B 69 6C 6C 00 39 56 00 D0 7C 39 11 16 16 
      if (targetPawn != None && targetPawn.IsA('Game_NPCPawn')) {               //0069 : 07 98 00 82 77 00 D0 7C 39 11 2A 16 18 12 00 19 00 D0 7C 39 11 08 00 04 61 2F 21 47 08 00 00 16 16 
        cl2sv_CSKillMonster_CallStub(targetPawn);                               //008A : 1B 50 0E 00 00 00 D0 7C 39 11 16 
      } else {                                                                  //0095 : 06 C2 00 
        cl_ConsoleLog("You don't have a (monster) target.");                    //0098 : 1B E1 0B 00 00 1F 59 6F 75 20 64 6F 6E 27 74 20 68 61 76 65 20 61 20 28 6D 6F 6E 73 74 65 72 29 20 74 61 72 67 65 74 2E 00 16 
      }
    }
    //1B E1 0B 00 00 1F 43 53 4B 69 6C 6C 4D 6F 6E 73 74 65 72 00 16 07 C2 00 1B E6 0B 00 00 1F 43 53 
    //4B 69 6C 6C 4D 6F 6E 73 74 65 72 00 16 0F 00 D0 7C 39 11 19 19 01 E8 CC 38 11 05 00 04 01 B0 14 
    //37 0F 06 00 04 1B 39 05 00 00 16 1B E1 0B 00 00 A8 1F 41 62 6F 75 74 20 74 6F 20 6B 69 6C 6C 00 
    //39 56 00 D0 7C 39 11 16 16 07 98 00 82 77 00 D0 7C 39 11 2A 16 18 12 00 19 00 D0 7C 39 11 08 00 
    //04 61 2F 21 47 08 00 00 16 16 1B 50 0E 00 00 00 D0 7C 39 11 16 06 C2 00 1B E1 0B 00 00 1F 59 6F 
    //75 20 64 6F 6E 27 74 20 68 61 76 65 20 61 20 28 6D 6F 6E 73 74 65 72 29 20 74 61 72 67 65 74 2E 
    //00 16 04 0B 47 
  }


  protected native function cl2sv_CSReset_CallStub();


  private event cl2sv_CSReset(optional string invisible,optional string DISGUISE) {
    if (AuthorizeCommand("CSReset")) {                                          //0000 : 07 72 00 1B E6 0B 00 00 1F 43 53 52 65 73 65 74 00 16 
      sv_Invulnerable(True);                                                    //0012 : 1B F7 0C 00 00 27 16 
      if (StrCmp(invisible,"invis",Len("invis"),False) == 0) {                  //0019 : 07 3A 00 9A C8 00 A8 7E 39 11 1F 69 6E 76 69 73 00 7D 1F 69 6E 76 69 73 00 16 28 16 25 16 
      } else {                                                                  //0037 : 06 58 00 
        Game_Pawn(mGameMaster.Pawn).sv_SetVisibleInRelevance(True);             //003A : 19 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 07 00 00 1B E6 0C 00 00 27 16 
      }
      if (StrCmp(invisible,DISGUISE,Len(DISGUISE),False) == 0) {                //0058 : 07 72 00 9A C8 00 A8 7E 39 11 00 E8 7F 39 11 7D 00 E8 7F 39 11 16 28 16 25 16 
      }
    }
    //07 72 00 1B E6 0B 00 00 1F 43 53 52 65 73 65 74 00 16 1B F7 0C 00 00 27 16 07 3A 00 9A C8 00 A8 
    //7E 39 11 1F 69 6E 76 69 73 00 7D 1F 69 6E 76 69 73 00 16 28 16 25 16 06 58 00 19 2E 18 38 5B 01 
    //19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 07 00 00 1B E6 0C 00 00 27 16 07 72 00 9A C8 00 A8 7E 
    //39 11 00 E8 7F 39 11 7D 00 E8 7F 39 11 16 28 16 25 16 04 0B 47 
  }


  exec function CSReset(optional string invisible,optional string DISGUISE) {
    cl_ConsoleLog("CSReset" @ invisible @ DISGUISE);                            //0000 : 1B E1 0B 00 00 A8 A8 1F 43 53 52 65 73 65 74 00 00 10 81 39 11 16 00 10 82 39 11 16 16 
    if (AuthorizeCommand("CSReset")) {                                          //001D : 07 3F 00 1B E6 0B 00 00 1F 43 53 52 65 73 65 74 00 16 
      cl2sv_CSReset_CallStub(invisible,DISGUISE);                               //002F : 1B 52 0E 00 00 00 10 81 39 11 00 10 82 39 11 16 
    }
    //1B E1 0B 00 00 A8 A8 1F 43 53 52 65 73 65 74 00 00 10 81 39 11 16 00 10 82 39 11 16 16 07 3F 00 
    //1B E6 0B 00 00 1F 43 53 52 65 73 65 74 00 16 1B 52 0E 00 00 00 10 81 39 11 00 10 82 39 11 16 04 
    //0B 47 
  }


  protected native function cl2sv_CSSpeed_CallStub();


  private event cl2sv_CSSpeed(bool aOnFlag) {
    local Game_Pawn gp;
    if (AuthorizeCommand("CSSpeed")) {                                          //0000 : 07 C4 00 1B E6 0B 00 00 1F 43 53 53 70 65 65 64 00 16 
      gp = Game_Pawn(mGameMaster.Pawn);                                         //0012 : 0F 00 A0 85 39 11 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 
      if (gp == None) {                                                         //002B : 07 38 00 72 00 A0 85 39 11 2A 16 
        return;                                                                 //0036 : 04 0B 
      }
      if (aOnFlag) {                                                            //0038 : 07 B0 00 2D 00 E8 83 39 11 
        gp.sv_SetGroundSpeedModifier(FClamp(gp.GroundSpeedModifier * 1.25000000,1.00000000,10.00000000));//0041 : 19 00 A0 85 39 11 27 00 00 1B 80 0D 00 00 F6 AB 19 00 A0 85 39 11 05 00 04 01 30 02 35 0F 1E 00 00 A0 3F 16 1E 00 00 80 3F 1E 00 00 20 41 16 16 
        sv2cl_ConsoleLog_CallStub("CSSpeed: Updated SpeedModifier to "
          $ string(gp.GroundSpeedModifier));//0071 : 1B E7 0B 00 00 70 1F 43 53 53 70 65 65 64 3A 20 55 70 64 61 74 65 64 20 53 70 65 65 64 4D 6F 64 69 66 69 65 72 20 74 6F 20 00 39 55 19 00 A0 85 39 11 05 00 04 01 30 02 35 0F 16 16 
      } else {                                                                  //00AD : 06 C4 00 
        gp.sv_SetGroundSpeedModifier(1.00000000);                               //00B0 : 19 00 A0 85 39 11 0B 00 00 1B 80 0D 00 00 1E 00 00 80 3F 16 
      }
    }
    //07 C4 00 1B E6 0B 00 00 1F 43 53 53 70 65 65 64 00 16 0F 00 A0 85 39 11 2E 18 38 5B 01 19 01 E8 
    //CC 38 11 05 00 04 01 88 83 6C 0F 07 38 00 72 00 A0 85 39 11 2A 16 04 0B 07 B0 00 2D 00 E8 83 39 
    //11 19 00 A0 85 39 11 27 00 00 1B 80 0D 00 00 F6 AB 19 00 A0 85 39 11 05 00 04 01 30 02 35 0F 1E 
    //00 00 A0 3F 16 1E 00 00 80 3F 1E 00 00 20 41 16 16 1B E7 0B 00 00 70 1F 43 53 53 70 65 65 64 3A 
    //20 55 70 64 61 74 65 64 20 53 70 65 65 64 4D 6F 64 69 66 69 65 72 20 74 6F 20 00 39 55 19 00 A0 
    //85 39 11 05 00 04 01 30 02 35 0F 16 16 06 C4 00 19 00 A0 85 39 11 0B 00 00 1B 80 0D 00 00 1E 00 
    //00 80 3F 16 04 0B 47 
  }


  exec function CSSpeed(string aState) {
    cl_ConsoleLog("CSSpeed" @ aState);                                          //0000 : 1B E1 0B 00 00 A8 1F 43 53 53 70 65 65 64 00 00 C8 86 39 11 16 16 
    if (AuthorizeCommand("CSSpeed")) {                                          //0016 : 07 35 01 1B E6 0B 00 00 1F 43 53 53 70 65 65 64 00 16 
      if (aState == "") {                                                       //0028 : 07 7C 00 7A 00 C8 86 39 11 1F 00 16 
        cl_ConsoleLog("Current speed:"
          @ string(Game_Pawn(mGameMaster.Pawn).GroundSpeed));//0034 : 1B E1 0B 00 00 A8 1F 43 75 72 72 65 6E 74 20 73 70 65 65 64 3A 00 39 55 19 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 05 00 04 01 18 A9 76 0F 16 16 
        CSHelp("CSSpeed");                                                      //006A : 1B 01 0C 00 00 1F 43 53 53 70 65 65 64 00 16 
      } else {                                                                  //0079 : 06 35 01 
        if (StrCmp(aState,"on",Len("on"),False) != 0
          && StrCmp(aState,"off",Len("off"),False) != 0) {//007C : 07 DC 00 82 9B C8 00 C8 86 39 11 1F 6F 6E 00 7D 1F 6F 6E 00 16 28 16 25 16 18 18 00 9B C8 00 C8 86 39 11 1F 6F 66 66 00 7D 1F 6F 66 66 00 16 28 16 25 16 16 
          cl_ConsoleLog("Wrong parameters!:");                                  //00B0 : 1B E1 0B 00 00 1F 57 72 6F 6E 67 20 70 61 72 61 6D 65 74 65 72 73 21 3A 00 16 
          CSHelp("CSSpeed");                                                    //00CA : 1B 01 0C 00 00 1F 43 53 53 70 65 65 64 00 16 
        } else {                                                                //00D9 : 06 35 01 
          if (StrCmp(aState,"on",Len("on"),False) == 0) {                       //00DC : 07 FE 00 9A C8 00 C8 86 39 11 1F 6F 6E 00 7D 1F 6F 6E 00 16 28 16 25 16 
            cl2sv_CSSpeed_CallStub(True);                                       //00F4 : 1B 75 0D 00 00 27 16 
          } else {                                                              //00FB : 06 35 01 
            if (StrCmp(aState,"off",Len("off"),False) == 0) {                   //00FE : 07 35 01 9A C8 00 C8 86 39 11 1F 6F 66 66 00 7D 1F 6F 66 66 00 16 28 16 25 16 
              cl2sv_CSSpeed_CallStub(False);                                    //0118 : 1B 75 0D 00 00 28 16 
              cl_ConsoleLog("CSSpeed reset!");                                  //011F : 1B E1 0B 00 00 1F 43 53 53 70 65 65 64 20 72 65 73 65 74 21 00 16 
            }
          }
        }
      }
    }
    //1B E1 0B 00 00 A8 1F 43 53 53 70 65 65 64 00 00 C8 86 39 11 16 16 07 35 01 1B E6 0B 00 00 1F 43 
    //53 53 70 65 65 64 00 16 07 7C 00 7A 00 C8 86 39 11 1F 00 16 1B E1 0B 00 00 A8 1F 43 75 72 72 65 
    //6E 74 20 73 70 65 65 64 3A 00 39 55 19 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 
    //05 00 04 01 18 A9 76 0F 16 16 1B 01 0C 00 00 1F 43 53 53 70 65 65 64 00 16 06 35 01 07 DC 00 82 
    //9B C8 00 C8 86 39 11 1F 6F 6E 00 7D 1F 6F 6E 00 16 28 16 25 16 18 18 00 9B C8 00 C8 86 39 11 1F 
    //6F 66 66 00 7D 1F 6F 66 66 00 16 28 16 25 16 16 1B E1 0B 00 00 1F 57 72 6F 6E 67 20 70 61 72 61 
    //6D 65 74 65 72 73 21 3A 00 16 1B 01 0C 00 00 1F 43 53 53 70 65 65 64 00 16 06 35 01 07 FE 00 9A 
    //C8 00 C8 86 39 11 1F 6F 6E 00 7D 1F 6F 6E 00 16 28 16 25 16 1B 75 0D 00 00 27 16 06 35 01 07 35 
    //01 9A C8 00 C8 86 39 11 1F 6F 66 66 00 7D 1F 6F 66 66 00 16 28 16 25 16 1B 75 0D 00 00 28 16 1B 
    //E1 0B 00 00 1F 43 53 53 70 65 65 64 20 72 65 73 65 74 21 00 16 04 0B 47 
  }


  protected native function cl2sv_CSShield_CallStub();


  private event cl2sv_CSShield(string aState) {
    if (AuthorizeCommand("CSShield")) {                                         //0000 : 07 B1 00 1B E6 0B 00 00 1F 43 53 53 68 69 65 6C 64 00 16 
      if (StrCmp(aState,"on",Len(aState),False) == 0) {                         //0013 : 07 61 00 9A C8 00 78 8A 39 11 1F 6F 6E 00 7D 00 78 8A 39 11 16 28 16 25 16 
        sv_Invulnerable(True);                                                  //002C : 1B F7 0C 00 00 27 16 
        mGameMaster.sv2cl_SetShield_CallStub(True);                             //0033 : 19 01 E8 CC 38 11 07 00 00 1B 41 0D 00 00 27 16 
        sv2cl_ConsoleLog_CallStub("You are invincible!");                       //0043 : 1B E7 0B 00 00 1F 59 6F 75 20 61 72 65 20 69 6E 76 69 6E 63 69 62 6C 65 21 00 16 
      } else {                                                                  //005E : 06 B1 00 
        if (StrCmp(aState,"off",Len(aState),False) == 0) {                      //0061 : 07 B1 00 9A C8 00 78 8A 39 11 1F 6F 66 66 00 7D 00 78 8A 39 11 16 28 16 25 16 
          sv_Invulnerable(False);                                               //007B : 1B F7 0C 00 00 28 16 
          mGameMaster.sv2cl_SetShield_CallStub(False);                          //0082 : 19 01 E8 CC 38 11 07 00 00 1B 41 0D 00 00 28 16 
          sv2cl_ConsoleLog_CallStub("You are vincible again!");                 //0092 : 1B E7 0B 00 00 1F 59 6F 75 20 61 72 65 20 76 69 6E 63 69 62 6C 65 20 61 67 61 69 6E 21 00 16 
        }
      }
    }
    //07 B1 00 1B E6 0B 00 00 1F 43 53 53 68 69 65 6C 64 00 16 07 61 00 9A C8 00 78 8A 39 11 1F 6F 6E 
    //00 7D 00 78 8A 39 11 16 28 16 25 16 1B F7 0C 00 00 27 16 19 01 E8 CC 38 11 07 00 00 1B 41 0D 00 
    //00 27 16 1B E7 0B 00 00 1F 59 6F 75 20 61 72 65 20 69 6E 76 69 6E 63 69 62 6C 65 21 00 16 06 B1 
    //00 07 B1 00 9A C8 00 78 8A 39 11 1F 6F 66 66 00 7D 00 78 8A 39 11 16 28 16 25 16 1B F7 0C 00 00 
    //28 16 19 01 E8 CC 38 11 07 00 00 1B 41 0D 00 00 28 16 1B E7 0B 00 00 1F 59 6F 75 20 61 72 65 20 
    //76 69 6E 63 69 62 6C 65 20 61 67 61 69 6E 21 00 16 04 0B 47 
  }


  exec function CSShield(string aState) {
    cl_ConsoleLog("CSShield" @ aState);                                         //0000 : 1B E1 0B 00 00 A8 1F 43 53 53 68 69 65 6C 64 00 00 C0 8C 39 11 16 16 
    if (AuthorizeCommand("CSShield")) {                                         //0017 : 07 ED 00 1B E6 0B 00 00 1F 43 53 53 68 69 65 6C 64 00 16 
      if (aState == "") {                                                       //002A : 07 80 00 7A 00 C0 8C 39 11 1F 00 16 
        cl_ConsoleLog("Current state:"
          @ string(Game_Pawn(mGameMaster.Pawn).IsInvulnerable()));//0036 : 1B E1 0B 00 00 A8 1F 43 75 72 72 65 6E 74 20 73 74 61 74 65 3A 00 39 54 19 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 06 00 04 1B A0 05 00 00 16 16 16 
        CSHelp("CSShield");                                                     //006D : 1B 01 0C 00 00 1F 43 53 53 68 69 65 6C 64 00 16 
      } else {                                                                  //007D : 06 ED 00 
        if (StrCmp(aState,"on",Len(aState),False) != 0
          && StrCmp(aState,"off",Len(aState),False) != 0) {//0080 : 07 E2 00 82 9B C8 00 C0 8C 39 11 1F 6F 6E 00 7D 00 C0 8C 39 11 16 28 16 25 16 18 18 00 9B C8 00 C0 8C 39 11 1F 6F 66 66 00 7D 00 C0 8C 39 11 16 28 16 25 16 16 
          cl_ConsoleLog("Wrong parameters!:");                                  //00B5 : 1B E1 0B 00 00 1F 57 72 6F 6E 67 20 70 61 72 61 6D 65 74 65 72 73 21 3A 00 16 
          CSHelp("CSShield");                                                   //00CF : 1B 01 0C 00 00 1F 43 53 53 68 69 65 6C 64 00 16 
        } else {                                                                //00DF : 06 ED 00 
          cl2sv_CSShield_CallStub(aState);                                      //00E2 : 1B 60 0E 00 00 00 C0 8C 39 11 16 
        }
      }
    }
    //1B E1 0B 00 00 A8 1F 43 53 53 68 69 65 6C 64 00 00 C0 8C 39 11 16 16 07 ED 00 1B E6 0B 00 00 1F 
    //43 53 53 68 69 65 6C 64 00 16 07 80 00 7A 00 C0 8C 39 11 1F 00 16 1B E1 0B 00 00 A8 1F 43 75 72 
    //72 65 6E 74 20 73 74 61 74 65 3A 00 39 54 19 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 
    //6C 0F 06 00 04 1B A0 05 00 00 16 16 16 1B 01 0C 00 00 1F 43 53 53 68 69 65 6C 64 00 16 06 ED 00 
    //07 E2 00 82 9B C8 00 C0 8C 39 11 1F 6F 6E 00 7D 00 C0 8C 39 11 16 28 16 25 16 18 18 00 9B C8 00 
    //C0 8C 39 11 1F 6F 66 66 00 7D 00 C0 8C 39 11 16 28 16 25 16 16 1B E1 0B 00 00 1F 57 72 6F 6E 67 
    //20 70 61 72 61 6D 65 74 65 72 73 21 3A 00 16 1B 01 0C 00 00 1F 43 53 53 68 69 65 6C 64 00 16 06 
    //ED 00 1B 60 0E 00 00 00 C0 8C 39 11 16 04 0B 47 
  }


  protected native function cl2sv_CSIsVis_CallStub();


  private event cl2sv_CSIsVis() {
    if (AuthorizeCommand("CSIsVis")) {                                          //0000 : 07 78 00 1B E6 0B 00 00 1F 43 53 49 73 56 69 73 00 16 
      if (Game_Pawn(mGameMaster.Pawn).sv_IsVisibleInRelevance() == True) {      //0012 : 07 57 00 F2 19 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 06 00 04 1B 41 0E 00 00 16 27 16 
        sv2cl_ConsoleLog_CallStub("Current State : Visible");                   //0035 : 1B E7 0B 00 00 1F 43 75 72 72 65 6E 74 20 53 74 61 74 65 20 3A 20 56 69 73 69 62 6C 65 00 16 
      } else {                                                                  //0054 : 06 78 00 
        sv2cl_ConsoleLog_CallStub("Current State : Invisible");                 //0057 : 1B E7 0B 00 00 1F 43 75 72 72 65 6E 74 20 53 74 61 74 65 20 3A 20 49 6E 76 69 73 69 62 6C 65 00 16 
      }
    }
    //07 78 00 1B E6 0B 00 00 1F 43 53 49 73 56 69 73 00 16 07 57 00 F2 19 2E 18 38 5B 01 19 01 E8 CC 
    //38 11 05 00 04 01 88 83 6C 0F 06 00 04 1B 41 0E 00 00 16 27 16 1B E7 0B 00 00 1F 43 75 72 72 65 
    //6E 74 20 53 74 61 74 65 20 3A 20 56 69 73 69 62 6C 65 00 16 06 78 00 1B E7 0B 00 00 1F 43 75 72 
    //72 65 6E 74 20 53 74 61 74 65 20 3A 20 49 6E 76 69 73 69 62 6C 65 00 16 04 0B 47 
  }


  exec function CSIsVis() {
    cl_ConsoleLog("CSIsVis");                                                   //0000 : 1B E1 0B 00 00 1F 43 53 49 73 56 69 73 00 16 
    if (AuthorizeCommand("CSIsVis")) {                                          //000F : 07 27 00 1B E6 0B 00 00 1F 43 53 49 73 56 69 73 00 16 
      cl2sv_CSIsVis_CallStub();                                                 //0021 : 1B 62 0E 00 00 16 
    }
    //1B E1 0B 00 00 1F 43 53 49 73 56 69 73 00 16 07 27 00 1B E6 0B 00 00 1F 43 53 49 73 56 69 73 00 
    //16 1B 62 0E 00 00 16 04 0B 47 
  }


  protected native function cl2sv_CSVis_CallStub();


  private event cl2sv_CSVis() {
    if (AuthorizeCommand("CSVis")) {                                            //0000 : 07 56 00 1B E6 0B 00 00 1F 43 53 56 69 73 00 16 
      Game_Pawn(mGameMaster.Pawn).sv_SetVisibleInRelevance(True);               //0010 : 19 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 07 00 00 1B E6 0C 00 00 27 16 
      mGameMaster.sv2cl_SetVisibleInRelevance_CallStub(True);                   //002E : 19 01 E8 CC 38 11 07 00 00 1B 42 0D 00 00 27 16 
      sv2cl_ConsoleLog_CallStub("You are visible!");                            //003E : 1B E7 0B 00 00 1F 59 6F 75 20 61 72 65 20 76 69 73 69 62 6C 65 21 00 16 
    }
    //07 56 00 1B E6 0B 00 00 1F 43 53 56 69 73 00 16 19 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 
    //88 83 6C 0F 07 00 00 1B E6 0C 00 00 27 16 19 01 E8 CC 38 11 07 00 00 1B 42 0D 00 00 27 16 1B E7 
    //0B 00 00 1F 59 6F 75 20 61 72 65 20 76 69 73 69 62 6C 65 21 00 16 04 0B 47 
  }


  exec function CSVis() {
    cl_ConsoleLog("CSVis");                                                     //0000 : 1B E1 0B 00 00 1F 43 53 56 69 73 00 16 
    if (AuthorizeCommand("CSVis")) {                                            //000D : 07 23 00 1B E6 0B 00 00 1F 43 53 56 69 73 00 16 
      cl2sv_CSVis_CallStub();                                                   //001D : 1B 66 0E 00 00 16 
    }
    //1B E1 0B 00 00 1F 43 53 56 69 73 00 16 07 23 00 1B E6 0B 00 00 1F 43 53 56 69 73 00 16 1B 66 0E 
    //00 00 16 04 0B 47 
  }


  protected native function cl2sv_CSInvis_CallStub();


  private event cl2sv_CSInvis() {
    if (AuthorizeCommand("CSVis")) {                                            //0000 : 07 58 00 1B E6 0B 00 00 1F 43 53 56 69 73 00 16 
      Game_Pawn(mGameMaster.Pawn).sv_SetVisibleInRelevance(False);              //0010 : 19 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 07 00 00 1B E6 0C 00 00 28 16 
      mGameMaster.sv2cl_SetVisibleInRelevance_CallStub(False);                  //002E : 19 01 E8 CC 38 11 07 00 00 1B 42 0D 00 00 28 16 
      sv2cl_ConsoleLog_CallStub("You are invisible!");                          //003E : 1B E7 0B 00 00 1F 59 6F 75 20 61 72 65 20 69 6E 76 69 73 69 62 6C 65 21 00 16 
    }
    //07 58 00 1B E6 0B 00 00 1F 43 53 56 69 73 00 16 19 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 
    //88 83 6C 0F 07 00 00 1B E6 0C 00 00 28 16 19 01 E8 CC 38 11 07 00 00 1B 42 0D 00 00 28 16 1B E7 
    //0B 00 00 1F 59 6F 75 20 61 72 65 20 69 6E 76 69 73 69 62 6C 65 21 00 16 04 0B 47 
  }


  exec function CSInvis() {
    cl_ConsoleLog("CSInvis");                                                   //0000 : 1B E1 0B 00 00 1F 43 53 49 6E 76 69 73 00 16 
    if (AuthorizeCommand("CSInvis")) {                                          //000F : 07 27 00 1B E6 0B 00 00 1F 43 53 49 6E 76 69 73 00 16 
      cl2sv_CSInvis_CallStub();                                                 //0021 : 1B 6B 0E 00 00 16 
    }
    //1B E1 0B 00 00 1F 43 53 49 6E 76 69 73 00 16 07 27 00 1B E6 0B 00 00 1F 43 53 49 6E 76 69 73 00 
    //16 1B 6B 0E 00 00 16 04 0B 47 
  }


  protected native function cl2sv_CSLocation_CallStub();


  private event cl2sv_CSLocation(string aPlayer) {
    local Game_Pawn targetPawn;
    if (AuthorizeCommand("CSLocation")) {                                       //0000 : 07 AB 00 1B E6 0B 00 00 1F 43 53 4C 6F 63 61 74 69 6F 6E 00 16 
      targetPawn = sv_FindPawnByName(aPlayer);                                  //0015 : 0F 00 28 9B 39 11 1B 0C 0C 00 00 00 98 99 39 11 16 
      if (targetPawn != None) {                                                 //0026 : 07 7C 00 77 00 28 9B 39 11 2A 16 
        sv2cl_ConsoleLog_CallStub("CSLocation:" @ targetPawn.GetCharacterName()
          @ "is located at:"
          @ string(targetPawn.Location));//0031 : 1B E7 0B 00 00 A8 A8 A8 1F 43 53 4C 6F 63 61 74 69 6F 6E 3A 00 19 00 28 9B 39 11 06 00 00 1B 67 05 00 00 16 16 1F 69 73 20 6C 6F 63 61 74 65 64 20 61 74 3A 00 16 39 58 19 00 28 9B 39 11 05 00 0C 01 30 81 6C 0F 16 16 
      } else {                                                                  //0079 : 06 AB 00 
        sv2cl_ConsoleLog_CallStub("CSLocation: Couldn't find player"
          @ aPlayer);//007C : 1B E7 0B 00 00 A8 1F 43 53 4C 6F 63 61 74 69 6F 6E 3A 20 43 6F 75 6C 64 6E 27 74 20 66 69 6E 64 20 70 6C 61 79 65 72 00 00 98 99 39 11 16 16 
      }
    }
    //07 AB 00 1B E6 0B 00 00 1F 43 53 4C 6F 63 61 74 69 6F 6E 00 16 0F 00 28 9B 39 11 1B 0C 0C 00 00 
    //00 98 99 39 11 16 07 7C 00 77 00 28 9B 39 11 2A 16 1B E7 0B 00 00 A8 A8 A8 1F 43 53 4C 6F 63 61 
    //74 69 6F 6E 3A 00 19 00 28 9B 39 11 06 00 00 1B 67 05 00 00 16 16 1F 69 73 20 6C 6F 63 61 74 65 
    //64 20 61 74 3A 00 16 39 58 19 00 28 9B 39 11 05 00 0C 01 30 81 6C 0F 16 16 06 AB 00 1B E7 0B 00 
    //00 A8 1F 43 53 4C 6F 63 61 74 69 6F 6E 3A 20 43 6F 75 6C 64 6E 27 74 20 66 69 6E 64 20 70 6C 61 
    //79 65 72 00 00 98 99 39 11 16 16 04 0B 47 
  }


  exec function CSLocation(optional string aPlayer) {
    if (AuthorizeCommand("CSLocation")) {                                       //0000 : 07 8E 00 1B E6 0B 00 00 1F 43 53 4C 6F 63 61 74 69 6F 6E 00 16 
      if (aPlayer == "") {                                                      //0015 : 07 83 00 7A 00 50 9C 39 11 1F 00 16 
        cl_ConsoleLog("CSLocation:"
          @ Game_Pawn(mGameMaster.Pawn).GetCharacterName()
          @ "is located at:"
          @ string(mGameMaster.Pawn.Location));//0021 : 1B E1 0B 00 00 A8 A8 A8 1F 43 53 4C 6F 63 61 74 69 6F 6E 3A 00 19 2E 18 38 5B 01 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 06 00 00 1B 67 05 00 00 16 16 1F 69 73 20 6C 6F 63 61 74 65 64 20 61 74 3A 00 16 39 58 19 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 05 00 0C 01 30 81 6C 0F 16 16 
      } else {                                                                  //0080 : 06 8E 00 
        cl2sv_CSLocation_CallStub(aPlayer);                                     //0083 : 1B 6D 0E 00 00 00 50 9C 39 11 16 
      }
    }
    //07 8E 00 1B E6 0B 00 00 1F 43 53 4C 6F 63 61 74 69 6F 6E 00 16 07 83 00 7A 00 50 9C 39 11 1F 00 
    //16 1B E1 0B 00 00 A8 A8 A8 1F 43 53 4C 6F 63 61 74 69 6F 6E 3A 00 19 2E 18 38 5B 01 19 01 E8 CC 
    //38 11 05 00 04 01 88 83 6C 0F 06 00 00 1B 67 05 00 00 16 16 1F 69 73 20 6C 6F 63 61 74 65 64 20 
    //61 74 3A 00 16 39 58 19 19 01 E8 CC 38 11 05 00 04 01 88 83 6C 0F 05 00 0C 01 30 81 6C 0F 16 16 
    //06 8E 00 1B 6D 0E 00 00 00 50 9C 39 11 16 04 0B 47 
  }


  exec function CSHelp(optional string aCommand) {
    local int Index;
    cl_ConsoleLog("CSHelp" @ aCommand);                                         //0000 : 1B E1 0B 00 00 A8 1F 43 53 48 65 6C 70 00 00 68 9E 39 11 16 16 
    if (AuthorizeCommand("CSHelp")) {                                           //0015 : 07 E2 01 1B E6 0B 00 00 1F 43 53 48 65 6C 70 00 16 
      if (aCommand != "") {                                                     //0026 : 07 4A 01 7B 00 68 9E 39 11 1F 00 16 
        Index = 0;                                                              //0032 : 0F 00 E0 9E 39 11 25 
        while (Index < mCommandInfos.Length) {                                  //0039 : 07 FC 00 96 00 E0 9E 39 11 37 01 38 D3 38 11 16 
          if (StrCmp(aCommand,mCommandInfos[Index].Command,Len(mCommandInfos[Index].Command),False) == 0) {//0049 : 07 F2 00 9A C8 00 68 9E 39 11 36 38 D4 38 11 10 00 E0 9E 39 11 01 38 D3 38 11 7D 36 38 D4 38 11 10 00 E0 9E 39 11 01 38 D3 38 11 16 28 16 25 16 
            if (mGameMaster.GetAuthorityLevel() >= mCommandInfos[Index].MinLevel
              || mGameMaster.GetAuthorityLevel() >= mCommandInfos[Index].selfLevel) {//0079 : 07 F2 00 84 99 19 01 E8 CC 38 11 06 00 04 1B 42 0C 00 00 16 36 A0 D5 38 11 10 00 E0 9E 39 11 01 38 D3 38 11 16 18 22 00 99 19 01 E8 CC 38 11 06 00 04 1B 42 0C 00 00 16 36 28 D5 38 11 10 00 E0 9E 39 11 01 38 D3 38 11 16 16 
              cl_ConsoleLog(mCommandInfos[Index].Command $ ":"
                @ mCommandInfos[Index].help);//00C3 : 1B E1 0B 00 00 A8 70 36 38 D4 38 11 10 00 E0 9E 39 11 01 38 D3 38 11 1F 3A 00 16 36 58 9F 39 11 10 00 E0 9E 39 11 01 38 D3 38 11 16 16 
              return;                                                           //00F0 : 04 0B 
            }
          }
          Index++;                                                              //00F2 : A5 00 E0 9E 39 11 16 
        }
        cl_ConsoleLog("Unknown command or insufficient privileges; showing possible commands:");//00FC : 1B E1 0B 00 00 1F 55 6E 6B 6E 6F 77 6E 20 63 6F 6D 6D 61 6E 64 20 6F 72 20 69 6E 73 75 66 66 69 63 69 65 6E 74 20 70 72 69 76 69 6C 65 67 65 73 3B 20 73 68 6F 77 69 6E 67 20 70 6F 73 73 69 62 6C 65 20 63 6F 6D 6D 61 6E 64 73 3A 00 16 
      }
      Index = 0;                                                                //014A : 0F 00 E0 9E 39 11 25 
      while (Index < mCommandInfos.Length) {                                    //0151 : 07 E2 01 96 00 E0 9E 39 11 37 01 38 D3 38 11 16 
        if (mGameMaster.GetAuthorityLevel() >= mCommandInfos[Index].MinLevel
          || mGameMaster.GetAuthorityLevel() >= mCommandInfos[Index].selfLevel) {//0161 : 07 D8 01 84 99 19 01 E8 CC 38 11 06 00 04 1B 42 0C 00 00 16 36 A0 D5 38 11 10 00 E0 9E 39 11 01 38 D3 38 11 16 18 22 00 99 19 01 E8 CC 38 11 06 00 04 1B 42 0C 00 00 16 36 28 D5 38 11 10 00 E0 9E 39 11 01 38 D3 38 11 16 16 
          cl_ConsoleLog(mCommandInfos[Index].Command $ ":"
            @ mCommandInfos[Index].help);//01AB : 1B E1 0B 00 00 A8 70 36 38 D4 38 11 10 00 E0 9E 39 11 01 38 D3 38 11 1F 3A 00 16 36 58 9F 39 11 10 00 E0 9E 39 11 01 38 D3 38 11 16 16 
        }
        Index++;                                                                //01D8 : A5 00 E0 9E 39 11 16 
      }
    }
    //1B E1 0B 00 00 A8 1F 43 53 48 65 6C 70 00 00 68 9E 39 11 16 16 07 E2 01 1B E6 0B 00 00 1F 43 53 
    //48 65 6C 70 00 16 07 4A 01 7B 00 68 9E 39 11 1F 00 16 0F 00 E0 9E 39 11 25 07 FC 00 96 00 E0 9E 
    //39 11 37 01 38 D3 38 11 16 07 F2 00 9A C8 00 68 9E 39 11 36 38 D4 38 11 10 00 E0 9E 39 11 01 38 
    //D3 38 11 7D 36 38 D4 38 11 10 00 E0 9E 39 11 01 38 D3 38 11 16 28 16 25 16 07 F2 00 84 99 19 01 
    //E8 CC 38 11 06 00 04 1B 42 0C 00 00 16 36 A0 D5 38 11 10 00 E0 9E 39 11 01 38 D3 38 11 16 18 22 
    //00 99 19 01 E8 CC 38 11 06 00 04 1B 42 0C 00 00 16 36 28 D5 38 11 10 00 E0 9E 39 11 01 38 D3 38 
    //11 16 16 1B E1 0B 00 00 A8 70 36 38 D4 38 11 10 00 E0 9E 39 11 01 38 D3 38 11 1F 3A 00 16 36 58 
    //9F 39 11 10 00 E0 9E 39 11 01 38 D3 38 11 16 16 04 0B A5 00 E0 9E 39 11 16 06 39 00 1B E1 0B 00 
    //00 1F 55 6E 6B 6E 6F 77 6E 20 63 6F 6D 6D 61 6E 64 20 6F 72 20 69 6E 73 75 66 66 69 63 69 65 6E 
    //74 20 70 72 69 76 69 6C 65 67 65 73 3B 20 73 68 6F 77 69 6E 67 20 70 6F 73 73 69 62 6C 65 20 63 
    //6F 6D 6D 61 6E 64 73 3A 00 16 0F 00 E0 9E 39 11 25 07 E2 01 96 00 E0 9E 39 11 37 01 38 D3 38 11 
    //16 07 D8 01 84 99 19 01 E8 CC 38 11 06 00 04 1B 42 0C 00 00 16 36 A0 D5 38 11 10 00 E0 9E 39 11 
    //01 38 D3 38 11 16 18 22 00 99 19 01 E8 CC 38 11 06 00 04 1B 42 0C 00 00 16 36 28 D5 38 11 10 00 
    //E0 9E 39 11 01 38 D3 38 11 16 16 1B E1 0B 00 00 A8 70 36 38 D4 38 11 10 00 E0 9E 39 11 01 38 D3 
    //38 11 1F 3A 00 16 36 58 9F 39 11 10 00 E0 9E 39 11 01 38 D3 38 11 16 16 A5 00 E0 9E 39 11 16 06 
    //51 01 04 0B 47 
  }


  event cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C E0 C4 19 11 16 
    mGameMaster = Game_GameMasterController(Outer);                             //0006 : 0F 01 E8 CC 38 11 2E D0 1D 5B 01 01 00 E4 6B 0F 
    //1C E0 C4 19 11 16 0F 01 E8 CC 38 11 2E D0 1D 5B 01 01 00 E4 6B 0F 04 0B 47 
  }



