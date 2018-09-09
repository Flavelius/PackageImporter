//==============================================================================
//  AI_Script
//==============================================================================

class AI_Script extends Annotation_Script
    native
    exportstructs
    dependsOn(Game_GameInfo,SBClock,Content_Type,Game_Pawn,Game_Controller,Game_NPCSkills,Game_CharacterStats,Game_Skills,FSkill_Event_Duff,Object,Game_PlayerPawn,Game_Effects,Actor,Game_Character,Game_PlayerController,Game_PlayerTeams,Game_NPCPawn,Pawn,NPC_Type,Game_Emotes,Class,SBDBAsync,Quest_Type,Quest_Target,Game_QuestLog,Base_Pawn,HormoneComponent,Game_Conversation,Conversation_Topic,Game_NPCCombatState,Game_CombatState,FSkill_Type,LevelInfo,TargetComponent,MovementComponent,Content_API,AIStateMachine,AIState)
  ;

  struct AppliedEffect {
      var Game_Pawn Pawn;
      var int EffectHandle;

  };


  var (AI_Script) AI_Script NextScript;
  var (AI_Script) bool TriggerNextScript;
  var (Debugging) bool LogDebug;
  var bool acceptsTicks;
  var array<AppliedEffect> AppliedEffects;
  var bool mWantsScriptFrame;
  var float mScriptFrameTime;
  var transient float mFrameTimer;


  function float GetDayNightTime() {
    local Game_GameInfo GameInfo;
    GameInfo = Game_GameInfo(GetGameInfo());                                    //0000 : 0F 00 F0 E2 FD 13 2E 10 F9 5A 01 1C 38 E1 6C 0F 16 
    ScriptAssert(GameInfo != None && GameInfo.mClock != None,"GetDayNightTime; no clock can be found");//0011 : 1B FB 72 00 00 82 77 00 F0 E2 FD 13 2A 16 18 12 00 77 19 00 F0 E2 FD 13 05 00 04 01 38 FE 34 0F 2A 16 16 1F 47 65 74 44 61 79 4E 69 67 68 74 54 69 6D 65 3B 20 6E 6F 20 63 6C 6F 63 6B 20 63 61 6E 20 62 65 20 66 6F 75 6E 64 00 16 
    if (GameInfo != None && GameInfo.mClock != None) {                          //005D : 07 9A 00 82 77 00 F0 E2 FD 13 2A 16 18 12 00 77 19 00 F0 E2 FD 13 05 00 04 01 38 FE 34 0F 2A 16 16 
      return GameInfo.mClock.GetRelativeTimeOfDay();                            //007E : 04 19 19 00 F0 E2 FD 13 05 00 04 01 38 FE 34 0F 06 00 04 1B 91 3F 00 00 16 
    } else {                                                                    //0097 : 06 A0 00 
      return 0.00000000;                                                        //009A : 04 1E 00 00 00 00 
    }
    //0F 00 F0 E2 FD 13 2E 10 F9 5A 01 1C 38 E1 6C 0F 16 1B FB 72 00 00 82 77 00 F0 E2 FD 13 2A 16 18 
    //12 00 77 19 00 F0 E2 FD 13 05 00 04 01 38 FE 34 0F 2A 16 16 1F 47 65 74 44 61 79 4E 69 67 68 74 
    //54 69 6D 65 3B 20 6E 6F 20 63 6C 6F 63 6B 20 63 61 6E 20 62 65 20 66 6F 75 6E 64 00 16 07 9A 00 
    //82 77 00 F0 E2 FD 13 2A 16 18 12 00 77 19 00 F0 E2 FD 13 05 00 04 01 38 FE 34 0F 2A 16 16 04 19 
    //19 00 F0 E2 FD 13 05 00 04 01 38 FE 34 0F 06 00 04 1B 91 3F 00 00 16 06 A0 00 04 1E 00 00 00 00 
    //04 0B 47 
  }


  function int GetPersistentVariable(Game_Pawn aPawn,export editinline Content_Type aContext,int aValueId) {
    local int ContextID;
    if (aContext != None) {                                                     //0000 : 07 20 00 77 00 90 E4 FD 13 2A 16 
      ContextID = aContext.GetResourceId();                                     //000B : 0F 00 08 E5 FD 13 19 00 90 E4 FD 13 06 00 04 1C 08 90 20 11 16 
    }
    return Game_Controller(aPawn.Controller).sv_GetPersistentVariable(ContextID,aValueId);//0020 : 04 19 2E 10 0E 5B 01 19 00 18 E4 FD 13 05 00 04 01 00 6E 6C 0F 10 00 04 1B 77 0E 00 00 00 08 E5 FD 13 00 80 E5 FD 13 16 
    //07 20 00 77 00 90 E4 FD 13 2A 16 0F 00 08 E5 FD 13 19 00 90 E4 FD 13 06 00 04 1C 08 90 20 11 16 
    //04 19 2E 10 0E 5B 01 19 00 18 E4 FD 13 05 00 04 01 00 6E 6C 0F 10 00 04 1B 77 0E 00 00 00 08 E5 
    //FD 13 00 80 E5 FD 13 16 04 0B 47 
  }


  function SetPersistentVariable(Game_Pawn aPawn,export editinline Content_Type aContext,int aValueId,int aValue) {
    local int ContextID;
    ScriptAssert(aPawn != None,"SetPersistentVariable; aPawn is none");         //0000 : 1B FB 72 00 00 77 00 20 E7 FD 13 2A 16 1F 53 65 74 50 65 72 73 69 73 74 65 6E 74 56 61 72 69 61 62 6C 65 3B 20 61 50 61 77 6E 20 69 73 20 6E 6F 6E 65 00 16 
    if (aContext != None) {                                                     //0034 : 07 54 00 77 00 78 E8 FD 13 2A 16 
      ContextID = aContext.GetResourceId();                                     //003F : 0F 00 F0 E8 FD 13 19 00 78 E8 FD 13 06 00 04 1C 08 90 20 11 16 
    }
    Game_Controller(aPawn.Controller).sv_SetPersistentVariable(ContextID,aValueId,aValue);//0054 : 19 2E 10 0E 5B 01 19 00 20 E7 FD 13 05 00 04 01 00 6E 6C 0F 15 00 00 1B 37 07 00 00 00 F0 E8 FD 13 00 68 E9 FD 13 00 E0 E9 FD 13 16 
    //1B FB 72 00 00 77 00 20 E7 FD 13 2A 16 1F 53 65 74 50 65 72 73 69 73 74 65 6E 74 56 61 72 69 61 
    //62 6C 65 3B 20 61 50 61 77 6E 20 69 73 20 6E 6F 6E 65 00 16 07 54 00 77 00 78 E8 FD 13 2A 16 0F 
    //00 F0 E8 FD 13 19 00 78 E8 FD 13 06 00 04 1C 08 90 20 11 16 19 2E 10 0E 5B 01 19 00 20 E7 FD 13 
    //05 00 04 01 00 6E 6C 0F 15 00 00 1B 37 07 00 00 00 F0 E8 FD 13 00 68 E9 FD 13 00 E0 E9 FD 13 16 
    //04 0B 47 
  }


  function int RandomInt(int aMinValue,int aMaxValue) {
    ScriptAssert(aMaxValue >= aMinValue,"RandomInt; maxValue should be bigger than minValue");//0000 : 1B FB 72 00 00 99 00 30 EC FD 13 00 08 EB FD 13 16 1F 52 61 6E 64 6F 6D 49 6E 74 3B 20 6D 61 78 56 61 6C 75 65 20 73 68 6F 75 6C 64 20 62 65 20 62 69 67 67 65 72 20 74 68 61 6E 20 6D 69 6E 56 61 6C 75 65 00 16 
    return Rand(aMaxValue - aMinValue) + aMinValue;                             //0046 : 04 92 A7 93 00 30 EC FD 13 00 08 EB FD 13 16 16 00 08 EB FD 13 16 
    //1B FB 72 00 00 99 00 30 EC FD 13 00 08 EB FD 13 16 1F 52 61 6E 64 6F 6D 49 6E 74 3B 20 6D 61 78 
    //56 61 6C 75 65 20 73 68 6F 75 6C 64 20 62 65 20 62 69 67 67 65 72 20 74 68 61 6E 20 6D 69 6E 56 
    //61 6C 75 65 00 16 04 92 A7 93 00 30 EC FD 13 00 08 EB FD 13 16 16 00 08 EB FD 13 16 04 0B 47 
  }


  function float RandomFloat(float aMinValue,float aMaxValue) {
    ScriptAssert(aMaxValue >= aMinValue,"RandomFloat; maxValue should be bigger than minValue");//0000 : 1B FB 72 00 00 B3 00 F8 EE FD 13 00 D0 ED FD 13 16 1F 52 61 6E 64 6F 6D 46 6C 6F 61 74 3B 20 6D 61 78 56 61 6C 75 65 20 73 68 6F 75 6C 64 20 62 65 20 62 69 67 67 65 72 20 74 68 61 6E 20 6D 69 6E 56 61 6C 75 65 00 16 
    return FRand() * (aMaxValue - aMinValue) + aMinValue;                       //0048 : 04 AE AB C3 16 AF 00 F8 EE FD 13 00 D0 ED FD 13 16 16 00 D0 ED FD 13 16 
    //1B FB 72 00 00 B3 00 F8 EE FD 13 00 D0 ED FD 13 16 1F 52 61 6E 64 6F 6D 46 6C 6F 61 74 3B 20 6D 
    //61 78 56 61 6C 75 65 20 73 68 6F 75 6C 64 20 62 65 20 62 69 67 67 65 72 20 74 68 61 6E 20 6D 69 
    //6E 56 61 6C 75 65 00 16 04 AE AB C3 16 AF 00 F8 EE FD 13 00 D0 ED FD 13 16 16 00 D0 ED FD 13 16 
    //04 0B 47 
  }


  function bool RandomBool() {
    if (FRand() > 0.50000000) {                                                 //0000 : 07 0E 00 B1 C3 16 1E 00 00 00 3F 16 
      return True;                                                              //000C : 04 27 
    }
    return False;                                                               //000E : 04 28 
    //07 0E 00 B1 C3 16 1E 00 00 00 3F 16 04 27 04 28 04 0B 47 
  }


  function Despawn(Game_AIController aController) {
    ScriptAssert(aController != None,"Despawn; Game_AIController is none");     //0000 : 1B FB 72 00 00 77 00 08 F2 FD 13 2A 16 1F 44 65 73 70 61 77 6E 3B 20 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    aController.sv_Despawn();                                                   //0032 : 19 00 08 F2 FD 13 06 00 00 1C E0 41 34 0F 16 
    //1B FB 72 00 00 77 00 08 F2 FD 13 2A 16 1F 44 65 73 70 61 77 6E 3B 20 47 61 6D 65 5F 41 49 43 6F 
    //6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 19 00 08 F2 FD 13 06 00 00 1C E0 41 34 0F 
    //16 04 0B 47 
  }


  function NPC_SkillDeck SetSkilldeck(Game_Pawn aPawn,export editinline NPC_SkillDeck aSkilldeck) {
    local export editinline NPC_SkillDeck CurrentSkillDeck;
    local export editinline Game_NPCSkills Skills;
    ScriptAssert(aPawn != None,"AI_Script - SetSkilldeck: aPawn is none");      //0000 : 1B FB 72 00 00 77 00 B8 F3 FD 13 2A 16 1F 41 49 5F 53 63 72 69 70 74 20 2D 20 53 65 74 53 6B 69 6C 6C 64 65 63 6B 3A 20 61 50 61 77 6E 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(aPawn.IsA('Game_NPCPawn'),"AI_Script - SetSkilldeck: aPawn is not a Game_NPCPawn");//0037 : 1B FB 72 00 00 19 00 B8 F3 FD 13 08 00 04 61 2F 21 47 08 00 00 16 1F 41 49 5F 53 63 72 69 70 74 20 2D 20 53 65 74 53 6B 69 6C 6C 64 65 63 6B 3A 20 61 50 61 77 6E 20 69 73 20 6E 6F 74 20 61 20 47 61 6D 65 5F 4E 50 43 50 61 77 6E 00 16 
    ScriptAssert(aSkilldeck != None,"AI_Script - SetSkilldeck: aSkilldeck is none");//0085 : 1B FB 72 00 00 77 00 30 F4 FD 13 2A 16 1F 41 49 5F 53 63 72 69 70 74 20 2D 20 53 65 74 53 6B 69 6C 6C 64 65 63 6B 3A 20 61 53 6B 69 6C 6C 64 65 63 6B 20 69 73 20 6E 6F 6E 65 00 16 
    Skills = Game_NPCSkills(aPawn.Skills);                                      //00C1 : 0F 00 A8 F4 FD 13 2E D8 72 5F 01 19 00 B8 F3 FD 13 05 00 04 01 08 28 18 11 
    ScriptAssert(Skills != None,"AI_Script - SetSkilldeck: pawn doesn't have NPC skills component");//00DA : 1B FB 72 00 00 77 00 A8 F4 FD 13 2A 16 1F 41 49 5F 53 63 72 69 70 74 20 2D 20 53 65 74 53 6B 69 6C 6C 64 65 63 6B 3A 20 70 61 77 6E 20 64 6F 65 73 6E 27 74 20 68 61 76 65 20 4E 50 43 20 73 6B 69 6C 6C 73 20 63 6F 6D 70 6F 6E 65 6E 74 00 16 
    if (aPawn.IsA('Game_NPCPawn') && Skills != None) {                          //012A : 07 74 01 82 19 00 B8 F3 FD 13 08 00 04 61 2F 21 47 08 00 00 16 18 09 00 77 00 A8 F4 FD 13 2A 16 16 
      CurrentSkillDeck = Skills.CurrentNPCSkillDeck;                            //014B : 0F 00 20 F5 FD 13 19 00 A8 F4 FD 13 05 00 04 01 48 FD 34 11 
      Skills.sv_SetSkilldeck(aSkilldeck,None);                                  //015F : 19 00 A8 F4 FD 13 0C 00 00 1C E8 B9 21 11 00 30 F4 FD 13 2A 16 
    }
    return CurrentSkillDeck;                                                    //0174 : 04 00 20 F5 FD 13 
    //1B FB 72 00 00 77 00 B8 F3 FD 13 2A 16 1F 41 49 5F 53 63 72 69 70 74 20 2D 20 53 65 74 53 6B 69 
    //6C 6C 64 65 63 6B 3A 20 61 50 61 77 6E 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 19 00 B8 F3 
    //FD 13 08 00 04 61 2F 21 47 08 00 00 16 1F 41 49 5F 53 63 72 69 70 74 20 2D 20 53 65 74 53 6B 69 
    //6C 6C 64 65 63 6B 3A 20 61 50 61 77 6E 20 69 73 20 6E 6F 74 20 61 20 47 61 6D 65 5F 4E 50 43 50 
    //61 77 6E 00 16 1B FB 72 00 00 77 00 30 F4 FD 13 2A 16 1F 41 49 5F 53 63 72 69 70 74 20 2D 20 53 
    //65 74 53 6B 69 6C 6C 64 65 63 6B 3A 20 61 53 6B 69 6C 6C 64 65 63 6B 20 69 73 20 6E 6F 6E 65 00 
    //16 0F 00 A8 F4 FD 13 2E D8 72 5F 01 19 00 B8 F3 FD 13 05 00 04 01 08 28 18 11 1B FB 72 00 00 77 
    //00 A8 F4 FD 13 2A 16 1F 41 49 5F 53 63 72 69 70 74 20 2D 20 53 65 74 53 6B 69 6C 6C 64 65 63 6B 
    //3A 20 70 61 77 6E 20 64 6F 65 73 6E 27 74 20 68 61 76 65 20 4E 50 43 20 73 6B 69 6C 6C 73 20 63 
    //6F 6D 70 6F 6E 65 6E 74 00 16 07 74 01 82 19 00 B8 F3 FD 13 08 00 04 61 2F 21 47 08 00 00 16 18 
    //09 00 77 00 A8 F4 FD 13 2A 16 16 0F 00 20 F5 FD 13 19 00 A8 F4 FD 13 05 00 04 01 48 FD 34 11 19 
    //00 A8 F4 FD 13 0C 00 00 1C E8 B9 21 11 00 30 F4 FD 13 2A 16 04 00 20 F5 FD 13 04 0B 47 
  }


  function SetFreeze(Game_Pawn aPawn,bool aOnOff,bool Movement,bool Rotation,bool Animation,optional bool Stats) {
    if (Movement) {                                                             //0000 : 07 27 00 2D 00 40 F8 FD 13 
      aPawn.CharacterStats.FreezeMovement(aOnOff);                              //0009 : 19 19 00 C0 F6 FD 13 05 00 04 01 08 43 34 0F 0C 00 00 1B A1 0C 00 00 2D 00 B8 F8 FD 13 16 
    }
    if (Rotation) {                                                             //0027 : 07 4E 00 2D 00 30 F9 FD 13 
      aPawn.CharacterStats.FreezeRotation(aOnOff);                              //0030 : 19 19 00 C0 F6 FD 13 05 00 04 01 08 43 34 0F 0C 00 00 1B B8 0C 00 00 2D 00 B8 F8 FD 13 16 
    }
    if (Animation) {                                                            //004E : 07 75 00 2D 00 A8 F9 FD 13 
      aPawn.CharacterStats.FreezeAnimation(aOnOff);                             //0057 : 19 19 00 C0 F6 FD 13 05 00 04 01 08 43 34 0F 0C 00 00 1B 0B 10 00 00 2D 00 B8 F8 FD 13 16 
    }
    if (Stats) {                                                                //0075 : 07 9C 00 2D 00 20 FA FD 13 
      aPawn.CharacterStats.FreezeStats(aOnOff);                                 //007E : 19 19 00 C0 F6 FD 13 05 00 04 01 08 43 34 0F 0C 00 00 1B 95 18 00 00 2D 00 B8 F8 FD 13 16 
    }
    //07 27 00 2D 00 40 F8 FD 13 19 19 00 C0 F6 FD 13 05 00 04 01 08 43 34 0F 0C 00 00 1B A1 0C 00 00 
    //2D 00 B8 F8 FD 13 16 07 4E 00 2D 00 30 F9 FD 13 19 19 00 C0 F6 FD 13 05 00 04 01 08 43 34 0F 0C 
    //00 00 1B B8 0C 00 00 2D 00 B8 F8 FD 13 16 07 75 00 2D 00 A8 F9 FD 13 19 19 00 C0 F6 FD 13 05 00 
    //04 01 08 43 34 0F 0C 00 00 1B 0B 10 00 00 2D 00 B8 F8 FD 13 16 07 9C 00 2D 00 20 FA FD 13 19 19 
    //00 C0 F6 FD 13 05 00 04 01 08 43 34 0F 0C 00 00 1B 95 18 00 00 2D 00 B8 F8 FD 13 16 04 0B 47 
  }


  function bool RemoveEachDuff(Object aParameter,export editinline FSkill_Event_Duff aDuffEvent) {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }


  function RemoveAllDuffs(Game_Pawn aPawn) {
    ScriptAssert(aPawn != None,"RemoveAllDuffs; aPawn is none");                //0000 : 1B FB 72 00 00 77 00 90 FD FD 13 2A 16 1F 52 65 6D 6F 76 65 41 6C 6C 44 75 66 66 73 3B 20 61 50 61 77 6E 20 69 73 20 6E 6F 6E 65 00 16 
    aPawn.Skills.__RemoveDuffFilter__Delegate = RemoveEachDuff;                 //002D : 45 19 19 00 90 FD FD 13 05 00 04 01 08 28 18 11 05 00 08 01 00 59 24 11 44 26 73 00 00 
    aPawn.Skills.sv_RemoveDuffs(None);                                          //004A : 19 19 00 90 FD FD 13 05 00 04 01 08 28 18 11 07 00 00 1B 4B 0F 00 00 2A 16 
    //1B FB 72 00 00 77 00 90 FD FD 13 2A 16 1F 52 65 6D 6F 76 65 41 6C 6C 44 75 66 66 73 3B 20 61 50 
    //61 77 6E 20 69 73 20 6E 6F 6E 65 00 16 45 19 19 00 90 FD FD 13 05 00 04 01 08 28 18 11 05 00 08 
    //01 00 59 24 11 44 26 73 00 00 19 19 00 90 FD FD 13 05 00 04 01 08 28 18 11 07 00 00 1B 4B 0F 00 
    //00 2A 16 04 0B 47 
  }


  function bool RemoveSkillDuff(Object aParameter,export editinline FSkill_Event_Duff aDuffEvent) {
    ScriptAssert(aDuffEvent != None,"Duff event is none");                      //0000 : 1B FB 72 00 00 77 00 D8 00 FE 13 2A 16 1F 44 75 66 66 20 65 76 65 6E 74 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(aDuffEvent.Outer.IsA('FSkill_Type'),"Duff event's outer is not a skill");//0022 : 1B FB 72 00 00 19 19 00 D8 00 FE 13 05 00 04 01 00 E4 6B 0F 08 00 04 61 2F 21 27 0A 00 00 16 1F 44 75 66 66 20 65 76 65 6E 74 27 73 20 6F 75 74 65 72 20 69 73 20 6E 6F 74 20 61 20 73 6B 69 6C 6C 00 16 
    if (aDuffEvent != None) {                                                   //0065 : 07 8A 00 77 00 D8 00 FE 13 2A 16 
      if (aDuffEvent.Outer == aParameter) {                                     //0070 : 07 8A 00 72 19 00 D8 00 FE 13 05 00 04 01 00 E4 6B 0F 00 70 FF FD 13 16 
        return True;                                                            //0088 : 04 27 
      }
    }
    return False;                                                               //008A : 04 28 
    //1B FB 72 00 00 77 00 D8 00 FE 13 2A 16 1F 44 75 66 66 20 65 76 65 6E 74 20 69 73 20 6E 6F 6E 65 
    //00 16 1B FB 72 00 00 19 19 00 D8 00 FE 13 05 00 04 01 00 E4 6B 0F 08 00 04 61 2F 21 27 0A 00 00 
    //16 1F 44 75 66 66 20 65 76 65 6E 74 27 73 20 6F 75 74 65 72 20 69 73 20 6E 6F 74 20 61 20 73 6B 
    //69 6C 6C 00 16 07 8A 00 77 00 D8 00 FE 13 2A 16 07 8A 00 72 19 00 D8 00 FE 13 05 00 04 01 00 E4 
    //6B 0F 00 70 FF FD 13 16 04 27 04 28 04 0B 47 
  }


  function RemoveSkillDuffs(Game_Pawn aPawn,export editinline FSkill_Type aSkill) {
    ScriptAssert(aPawn != None,"RemoveSkillDuffs; aPawn is none");              //0000 : 1B FB 72 00 00 77 00 78 02 FE 13 2A 16 1F 52 65 6D 6F 76 65 53 6B 69 6C 6C 44 75 66 66 73 3B 20 61 50 61 77 6E 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(aSkill != None,"RemoveSkillDuffs; aSkill is none");            //002F : 1B FB 72 00 00 77 00 F0 02 FE 13 2A 16 1F 52 65 6D 6F 76 65 53 6B 69 6C 6C 44 75 66 66 73 3B 20 61 53 6B 69 6C 6C 20 69 73 20 6E 6F 6E 65 00 16 
    aPawn.Skills.__RemoveDuffFilter__Delegate = RemoveSkillDuff;                //005F : 45 19 19 00 78 02 FE 13 05 00 04 01 08 28 18 11 05 00 08 01 00 59 24 11 44 25 73 00 00 
    aPawn.Skills.sv_RemoveDuffs(aSkill);                                        //007C : 19 19 00 78 02 FE 13 05 00 04 01 08 28 18 11 0B 00 00 1B 4B 0F 00 00 00 F0 02 FE 13 16 
    //1B FB 72 00 00 77 00 78 02 FE 13 2A 16 1F 52 65 6D 6F 76 65 53 6B 69 6C 6C 44 75 66 66 73 3B 20 
    //61 50 61 77 6E 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 77 00 F0 02 FE 13 2A 16 1F 52 65 6D 
    //6F 76 65 53 6B 69 6C 6C 44 75 66 66 73 3B 20 61 53 6B 69 6C 6C 20 69 73 20 6E 6F 6E 65 00 16 45 
    //19 19 00 78 02 FE 13 05 00 04 01 08 28 18 11 05 00 08 01 00 59 24 11 44 25 73 00 00 19 19 00 78 
    //02 FE 13 05 00 04 01 08 28 18 11 0B 00 00 1B 4B 0F 00 00 00 F0 02 FE 13 16 04 0B 47 
  }


  function AllPlayerClientTrigger(Game_Pawn aInstigator,string aEventTag) {
    local Game_PlayerPawn Player;
    ScriptAssert(aEventTag != "None" && aEventTag != "","AllPlayerClientTrigger; no aEventTag found!");//0000 : 1B FB 72 00 00 82 7B 00 60 05 FE 13 1F 4E 6F 6E 65 00 16 18 0A 00 7B 00 60 05 FE 13 1F 00 16 16 1F 41 6C 6C 50 6C 61 79 65 72 43 6C 69 65 6E 74 54 72 69 67 67 65 72 3B 20 6E 6F 20 61 45 76 65 6E 74 54 61 67 20 66 6F 75 6E 64 21 00 16 
    foreach AllActors(Class'Game_PlayerPawn',Player) {                          //004E : 2F 61 30 20 F0 47 5B 01 00 D8 05 FE 13 16 74 00 
      ClientSideTrigger(aInstigator,aEventTag,Player);                          //005E : 1B 23 73 00 00 00 18 04 FE 13 00 60 05 FE 13 00 D8 05 FE 13 16 
    }
    //1B FB 72 00 00 82 7B 00 60 05 FE 13 1F 4E 6F 6E 65 00 16 18 0A 00 7B 00 60 05 FE 13 1F 00 16 16 
    //1F 41 6C 6C 50 6C 61 79 65 72 43 6C 69 65 6E 74 54 72 69 67 67 65 72 3B 20 6E 6F 20 61 45 76 65 
    //6E 74 54 61 67 20 66 6F 75 6E 64 21 00 16 2F 61 30 20 F0 47 5B 01 00 D8 05 FE 13 16 74 00 1B 23 
    //73 00 00 00 18 04 FE 13 00 60 05 FE 13 00 D8 05 FE 13 16 31 30 04 0B 47 
  }


  function ClientSideTrigger(Game_Pawn aInstigator,string aEventTag,Game_PlayerPawn aClient) {
    ScriptAssert(aClient != None,"ClientSideTrigger; aClient is none");         //0000 : 1B FB 72 00 00 77 00 70 08 FE 13 2A 16 1F 43 6C 69 65 6E 74 53 69 64 65 54 72 69 67 67 65 72 3B 20 61 43 6C 69 65 6E 74 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(aEventTag != "None" && aEventTag != "","ClientSideTrigger; no aEventTag found!");//0032 : 1B FB 72 00 00 82 7B 00 E8 08 FE 13 1F 4E 6F 6E 65 00 16 18 0A 00 7B 00 E8 08 FE 13 1F 00 16 16 1F 43 6C 69 65 6E 74 53 69 64 65 54 72 69 67 67 65 72 3B 20 6E 6F 20 61 45 76 65 6E 74 54 61 67 20 66 6F 75 6E 64 21 00 16 
    aClient.sv_ClientSideTrigger(aEventTag,aInstigator);                        //007B : 19 00 70 08 FE 13 10 00 00 1B 1B 10 00 00 00 E8 08 FE 13 00 00 07 FE 13 16 
    //1B FB 72 00 00 77 00 70 08 FE 13 2A 16 1F 43 6C 69 65 6E 74 53 69 64 65 54 72 69 67 67 65 72 3B 
    //20 61 43 6C 69 65 6E 74 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 82 7B 00 E8 08 FE 13 1F 4E 
    //6F 6E 65 00 16 18 0A 00 7B 00 E8 08 FE 13 1F 00 16 16 1F 43 6C 69 65 6E 74 53 69 64 65 54 72 69 
    //67 67 65 72 3B 20 6E 6F 20 61 45 76 65 6E 74 54 61 67 20 66 6F 75 6E 64 21 00 16 19 00 70 08 FE 
    //13 10 00 00 1B 1B 10 00 00 00 E8 08 FE 13 00 00 07 FE 13 16 04 0B 47 
  }


  function RemoveAudioVisualEffects(Game_Pawn aPawn) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 D8 0B FE 13 25 
    while (i < AppliedEffects.Length) {                                         //0007 : 07 D1 00 96 00 D8 0B FE 13 37 01 50 0C FE 13 16 
      if (aPawn != None) {                                                      //0017 : 07 78 00 77 00 10 0A FE 13 2A 16 
        if (AppliedEffects[i].Pawn == aPawn) {                                  //0022 : 07 75 00 72 36 50 0D FE 13 10 00 D8 0B FE 13 01 50 0C FE 13 00 10 0A FE 13 16 
          RemoveAudioVisualEffect(AppliedEffects[i].Pawn,AppliedEffects[i].EffectHandle);//003C : 1B 12 73 00 00 36 50 0D FE 13 10 00 D8 0B FE 13 01 50 0C FE 13 36 C8 0D FE 13 10 00 D8 0B FE 13 01 50 0C FE 13 16 
          AppliedEffects.Remove(i,1);                                           //0062 : 41 01 50 0C FE 13 00 D8 0B FE 13 26 
          i--;                                                                  //006E : A6 00 D8 0B FE 13 16 
        }
      } else {                                                                  //0075 : 06 C7 00 
        if (AppliedEffects[i].Pawn != None) {                                   //0078 : 07 B4 00 77 36 50 0D FE 13 10 00 D8 0B FE 13 01 50 0C FE 13 2A 16 
          RemoveAudioVisualEffect(AppliedEffects[i].Pawn,AppliedEffects[i].EffectHandle);//008E : 1B 12 73 00 00 36 50 0D FE 13 10 00 D8 0B FE 13 01 50 0C FE 13 36 C8 0D FE 13 10 00 D8 0B FE 13 01 50 0C FE 13 16 
        }
        AppliedEffects.Remove(i,1);                                             //00B4 : 41 01 50 0C FE 13 00 D8 0B FE 13 26 
        i--;                                                                    //00C0 : A6 00 D8 0B FE 13 16 
      }
      i++;                                                                      //00C7 : A5 00 D8 0B FE 13 16 
    }
    //0F 00 D8 0B FE 13 25 07 D1 00 96 00 D8 0B FE 13 37 01 50 0C FE 13 16 07 78 00 77 00 10 0A FE 13 
    //2A 16 07 75 00 72 36 50 0D FE 13 10 00 D8 0B FE 13 01 50 0C FE 13 00 10 0A FE 13 16 1B 12 73 00 
    //00 36 50 0D FE 13 10 00 D8 0B FE 13 01 50 0C FE 13 36 C8 0D FE 13 10 00 D8 0B FE 13 01 50 0C FE 
    //13 16 41 01 50 0C FE 13 00 D8 0B FE 13 26 A6 00 D8 0B FE 13 16 06 C7 00 07 B4 00 77 36 50 0D FE 
    //13 10 00 D8 0B FE 13 01 50 0C FE 13 2A 16 1B 12 73 00 00 36 50 0D FE 13 10 00 D8 0B FE 13 01 50 
    //0C FE 13 36 C8 0D FE 13 10 00 D8 0B FE 13 01 50 0C FE 13 16 41 01 50 0C FE 13 00 D8 0B FE 13 26 
    //A6 00 D8 0B FE 13 16 A5 00 D8 0B FE 13 16 06 07 00 04 0B 47 
  }


  function bool RemoveAudioVisualEffect(Game_Pawn aPawn,int aServerSideEffectHandle) {
    return aPawn.Effects.sv_StopReplicated(aServerSideEffectHandle);            //0000 : 04 19 19 00 F0 0E FE 13 05 00 04 01 48 63 34 0F 0B 00 04 1C 60 E5 20 11 00 C0 0F FE 13 16 
    //04 19 19 00 F0 0E FE 13 05 00 04 01 48 63 34 0F 0B 00 04 1C 60 E5 20 11 00 C0 0F FE 13 16 04 0B 
    //47 
  }


  function int ApplyAudioVisualEffect(Game_Pawn aPawn,export editinline FSkill_EffectClass_AudioVisual aEffect) {
    local AppliedEffect lEffect;
    ScriptAssert(aPawn != None,"ApplyAudioVisualEffect; aPawn is none");        //0000 : 1B FB 72 00 00 77 00 60 11 FE 13 2A 16 1F 41 70 70 6C 79 41 75 64 69 6F 56 69 73 75 61 6C 45 66 66 65 63 74 3B 20 61 50 61 77 6E 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(aEffect != None,"ApplyAudioVisualEffect; aEffect is none");    //0035 : 1B FB 72 00 00 77 00 10 13 FE 13 2A 16 1F 41 70 70 6C 79 41 75 64 69 6F 56 69 73 75 61 6C 45 66 66 65 63 74 3B 20 61 45 66 66 65 63 74 20 69 73 20 6E 6F 6E 65 00 16 
    lEffect.Pawn = aPawn;                                                       //006C : 0F 36 50 0D FE 13 00 88 13 FE 13 00 60 11 FE 13 
    lEffect.EffectHandle = aPawn.Effects.sv_StartReplicated(aEffect);           //007C : 0F 36 C8 0D FE 13 00 88 13 FE 13 19 19 00 60 11 FE 13 05 00 04 01 48 63 34 0F 0B 00 04 1C 90 E7 20 11 00 10 13 FE 13 16 
    AppliedEffects[AppliedEffects.Length] = lEffect;                            //00A4 : 0F 10 37 01 50 0C FE 13 01 50 0C FE 13 00 88 13 FE 13 
    return lEffect.EffectHandle;                                                //00B6 : 04 36 C8 0D FE 13 00 88 13 FE 13 
    //1B FB 72 00 00 77 00 60 11 FE 13 2A 16 1F 41 70 70 6C 79 41 75 64 69 6F 56 69 73 75 61 6C 45 66 
    //66 65 63 74 3B 20 61 50 61 77 6E 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 77 00 10 13 FE 13 
    //2A 16 1F 41 70 70 6C 79 41 75 64 69 6F 56 69 73 75 61 6C 45 66 66 65 63 74 3B 20 61 45 66 66 65 
    //63 74 20 69 73 20 6E 6F 6E 65 00 16 0F 36 50 0D FE 13 00 88 13 FE 13 00 60 11 FE 13 0F 36 C8 0D 
    //FE 13 00 88 13 FE 13 19 19 00 60 11 FE 13 05 00 04 01 48 63 34 0F 0B 00 04 1C 90 E7 20 11 00 10 
    //13 FE 13 16 0F 10 37 01 50 0C FE 13 01 50 0C FE 13 00 88 13 FE 13 04 36 C8 0D FE 13 00 88 13 FE 
    //13 04 0B 47 
  }


  function bool ApplyOneShotAudioVisualEffect(Game_Pawn aPawn,export editinline FSkill_EffectClass_AudioVisual aEffect) {
    local AppliedEffect lEffect;
    ScriptAssert(aPawn != None,"ApplyOneShotAudioVisualEffect; aPawn is none"); //0000 : 1B FB 72 00 00 77 00 28 15 FE 13 2A 16 1F 41 70 70 6C 79 4F 6E 65 53 68 6F 74 41 75 64 69 6F 56 69 73 75 61 6C 45 66 66 65 63 74 3B 20 61 50 61 77 6E 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(aEffect != None,"ApplyOneShotAudioVisualEffect; aEffect is none");//003C : 1B FB 72 00 00 77 00 D8 16 FE 13 2A 16 1F 41 70 70 6C 79 4F 6E 65 53 68 6F 74 41 75 64 69 6F 56 69 73 75 61 6C 45 66 66 65 63 74 3B 20 61 45 66 66 65 63 74 20 69 73 20 6E 6F 6E 65 00 16 
    lEffect.Pawn = aPawn;                                                       //007A : 0F 36 50 0D FE 13 00 50 17 FE 13 00 28 15 FE 13 
    lEffect.EffectHandle = aPawn.Effects.sv_StartReplicatedOneShot(aEffect);    //008A : 0F 36 C8 0D FE 13 00 50 17 FE 13 19 19 00 28 15 FE 13 05 00 04 01 48 63 34 0F 0B 00 04 1C 40 EB 20 11 00 D8 16 FE 13 16 
    return lEffect.EffectHandle > 0;                                            //00B2 : 04 97 36 C8 0D FE 13 00 50 17 FE 13 25 16 
    //1B FB 72 00 00 77 00 28 15 FE 13 2A 16 1F 41 70 70 6C 79 4F 6E 65 53 68 6F 74 41 75 64 69 6F 56 
    //69 73 75 61 6C 45 66 66 65 63 74 3B 20 61 50 61 77 6E 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 
    //00 77 00 D8 16 FE 13 2A 16 1F 41 70 70 6C 79 4F 6E 65 53 68 6F 74 41 75 64 69 6F 56 69 73 75 61 
    //6C 45 66 66 65 63 74 3B 20 61 45 66 66 65 63 74 20 69 73 20 6E 6F 6E 65 00 16 0F 36 50 0D FE 13 
    //00 50 17 FE 13 00 28 15 FE 13 0F 36 C8 0D FE 13 00 50 17 FE 13 19 19 00 28 15 FE 13 05 00 04 01 
    //48 63 34 0F 0B 00 04 1C 40 EB 20 11 00 D8 16 FE 13 16 04 97 36 C8 0D FE 13 00 50 17 FE 13 25 16 
    //04 0B 47 
  }


  function RemoveSkillEffectsFromPlayers(export editinline FSkill_Type aSkill) {
    local Game_PlayerPawn lPlayer;
    ScriptAssert(aSkill != None,"RemoveSkillEffectsFromPlayers: aSkill == none");//0000 : 1B FB 72 00 00 77 00 F0 18 FE 13 2A 16 1F 52 65 6D 6F 76 65 53 6B 69 6C 6C 45 66 66 65 63 74 73 46 72 6F 6D 50 6C 61 79 65 72 73 3A 20 61 53 6B 69 6C 6C 20 3D 3D 20 6E 6F 6E 65 00 16 
    foreach AllActors(Class'Game_PlayerPawn',lPlayer) {                         //003D : 2F 61 30 20 F0 47 5B 01 00 18 1A FE 13 16 5E 00 
      RemoveSkillDuffs(lPlayer,aSkill);                                         //004D : 1B 24 73 00 00 00 18 1A FE 13 00 F0 18 FE 13 16 
    }
    //1B FB 72 00 00 77 00 F0 18 FE 13 2A 16 1F 52 65 6D 6F 76 65 53 6B 69 6C 6C 45 66 66 65 63 74 73 
    //46 72 6F 6D 50 6C 61 79 65 72 73 3A 20 61 53 6B 69 6C 6C 20 3D 3D 20 6E 6F 6E 65 00 16 2F 61 30 
    //20 F0 47 5B 01 00 18 1A FE 13 16 5E 00 1B 24 73 00 00 00 18 1A FE 13 00 F0 18 FE 13 16 31 30 04 
    //0B 47 
  }


  function ApplySkillEffectsToPlayers(export editinline FSkill_Type aSkill,Game_Pawn aExecutor) {
    local Game_PlayerPawn lPlayer;
    ScriptAssert(aSkill != None,"ApplySkillEffectsToPlayers: aSkill == none");  //0000 : 1B FB 72 00 00 77 00 40 1B FE 13 2A 16 1F 41 70 70 6C 79 53 6B 69 6C 6C 45 66 66 65 63 74 73 54 6F 50 6C 61 79 65 72 73 3A 20 61 53 6B 69 6C 6C 20 3D 3D 20 6E 6F 6E 65 00 16 
    ScriptAssert(aExecutor != None,"ApplySkillEffectsToPlayers: aExecutor == none");//003A : 1B FB 72 00 00 77 00 C0 1C FE 13 2A 16 1F 41 70 70 6C 79 53 6B 69 6C 6C 45 66 66 65 63 74 73 54 6F 50 6C 61 79 65 72 73 3A 20 61 45 78 65 63 75 74 6F 72 20 3D 3D 20 6E 6F 6E 65 00 16 
    foreach AllActors(Class'Game_PlayerPawn',lPlayer) {                         //0077 : 2F 61 30 20 F0 47 5B 01 00 38 1D FE 13 16 9D 00 
      ApplySkillEffects(aSkill,aExecutor,lPlayer);                              //0087 : 1B 22 73 00 00 00 40 1B FE 13 00 C0 1C FE 13 00 38 1D FE 13 16 
    }
    //1B FB 72 00 00 77 00 40 1B FE 13 2A 16 1F 41 70 70 6C 79 53 6B 69 6C 6C 45 66 66 65 63 74 73 54 
    //6F 50 6C 61 79 65 72 73 3A 20 61 53 6B 69 6C 6C 20 3D 3D 20 6E 6F 6E 65 00 16 1B FB 72 00 00 77 
    //00 C0 1C FE 13 2A 16 1F 41 70 70 6C 79 53 6B 69 6C 6C 45 66 66 65 63 74 73 54 6F 50 6C 61 79 65 
    //72 73 3A 20 61 45 78 65 63 75 74 6F 72 20 3D 3D 20 6E 6F 6E 65 00 16 2F 61 30 20 F0 47 5B 01 00 
    //38 1D FE 13 16 9D 00 1B 22 73 00 00 00 40 1B FE 13 00 C0 1C FE 13 00 38 1D FE 13 16 31 30 04 0B 
    //47 
  }


  function bool ApplySkillEffects(export editinline FSkill_Type aSkill,Game_Pawn aExecutor,Game_Pawn aTarget) {
    ScriptAssert(aSkill != None,"ApplySkillEffects; aSkill is none");           //0000 : 1B FB 72 00 00 77 00 60 1E FE 13 2A 16 1F 41 70 70 6C 79 53 6B 69 6C 6C 45 66 66 65 63 74 73 3B 20 61 53 6B 69 6C 6C 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(aExecutor.Skills != None,"ApplySkillEffects; Executing pawn has no skill component");//0031 : 1B FB 72 00 00 77 19 00 D8 1E FE 13 05 00 04 01 08 28 18 11 2A 16 1F 41 70 70 6C 79 53 6B 69 6C 6C 45 66 66 65 63 74 73 3B 20 45 78 65 63 75 74 69 6E 67 20 70 61 77 6E 20 68 61 73 20 6E 6F 20 73 6B 69 6C 6C 20 63 6F 6D 70 6F 6E 65 6E 74 00 16 
    aExecutor.Skills.sv_DirectSkillEffects(aSkill,aTarget);                     //0082 : 19 19 00 D8 1E FE 13 05 00 04 01 08 28 18 11 10 00 00 1C D0 C5 21 11 00 60 1E FE 13 00 50 1F FE 13 16 
    return True;                                                                //00A4 : 04 27 
    //1B FB 72 00 00 77 00 60 1E FE 13 2A 16 1F 41 70 70 6C 79 53 6B 69 6C 6C 45 66 66 65 63 74 73 3B 
    //20 61 53 6B 69 6C 6C 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 77 19 00 D8 1E FE 13 05 00 04 
    //01 08 28 18 11 2A 16 1F 41 70 70 6C 79 53 6B 69 6C 6C 45 66 66 65 63 74 73 3B 20 45 78 65 63 75 
    //74 69 6E 67 20 70 61 77 6E 20 68 61 73 20 6E 6F 20 73 6B 69 6C 6C 20 63 6F 6D 70 6F 6E 65 6E 74 
    //00 16 19 19 00 D8 1E FE 13 05 00 04 01 08 28 18 11 10 00 00 1C D0 C5 21 11 00 60 1E FE 13 00 50 
    //1F FE 13 16 04 27 04 0B 47 
  }


  function SitStand(Game_AIController aController,bool aSit,Actor aStool) {
    local Game_Pawn pwn;
    ScriptAssert(aController != None,"Sit; Game_AIController is none");         //0000 : 1B FB 72 00 00 77 00 F0 20 FE 13 2A 16 1F 53 69 74 3B 20 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    pwn = Game_Pawn(aController.Pawn);                                          //002E : 0F 00 78 22 FE 13 2E 18 38 5B 01 19 00 F0 20 FE 13 05 00 04 01 88 83 6C 0F 
    if (aStool != None) {                                                       //0047 : 07 89 00 77 00 F0 22 FE 13 2A 16 
      pwn.SetLocation(aStool.Location);                                         //0052 : 19 00 78 22 FE 13 11 00 04 61 0B 19 00 F0 22 FE 13 05 00 0C 01 30 81 6C 0F 16 
      pwn.SetRotation(aStool.Rotation);                                         //006C : 19 00 78 22 FE 13 14 00 04 1C 70 01 6E 0F 19 00 F0 22 FE 13 05 00 0C 01 00 84 6C 0F 16 
    }
    pwn.sv_Sit(aSit,aStool != None);                                            //0089 : 19 00 78 22 FE 13 14 00 00 1B 94 0C 00 00 2D 00 68 23 FE 13 77 00 F0 22 FE 13 2A 16 16 
    //1B FB 72 00 00 77 00 F0 20 FE 13 2A 16 1F 53 69 74 3B 20 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 
    //6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 0F 00 78 22 FE 13 2E 18 38 5B 01 19 00 F0 20 FE 13 05 
    //00 04 01 88 83 6C 0F 07 89 00 77 00 F0 22 FE 13 2A 16 19 00 78 22 FE 13 11 00 04 61 0B 19 00 F0 
    //22 FE 13 05 00 0C 01 30 81 6C 0F 16 19 00 78 22 FE 13 14 00 04 1C 70 01 6E 0F 19 00 F0 22 FE 13 
    //05 00 0C 01 00 84 6C 0F 16 19 00 78 22 FE 13 14 00 00 1B 94 0C 00 00 2D 00 68 23 FE 13 77 00 F0 
    //22 FE 13 2A 16 16 04 0B 47 
  }


  function string CharName(Actor aActor) {
    local Game_Pawn gp;
    local Game_Controller cont;
    if (aActor == None) {                                                       //0000 : 07 12 00 72 00 90 24 FE 13 2A 16 
      return "None";                                                            //000B : 04 1F 4E 6F 6E 65 00 
    }
    cont = Game_Controller(aActor);                                             //0012 : 0F 00 20 26 FE 13 2E 10 0E 5B 01 00 90 24 FE 13 
    if (cont != None) {                                                         //0022 : 07 41 00 77 00 20 26 FE 13 2A 16 
      aActor = cont.Pawn;                                                       //002D : 0F 00 90 24 FE 13 19 00 20 26 FE 13 05 00 04 01 88 83 6C 0F 
    }
    gp = Game_Pawn(aActor);                                                     //0041 : 0F 00 98 26 FE 13 2E 18 38 5B 01 00 90 24 FE 13 
    if (gp != None && gp.Character != None) {                                   //0051 : 07 98 00 82 77 00 98 26 FE 13 2A 16 18 12 00 77 19 00 98 26 FE 13 05 00 04 01 68 2E 34 0F 2A 16 16 
      return "'" $ gp.Character.sv_GetName()
        $ "'";                     //0072 : 04 70 70 1F 27 00 19 19 00 98 26 FE 13 05 00 04 01 68 2E 34 0F 06 00 00 1C 78 E1 18 11 16 16 1F 27 00 16 
    } else {                                                                    //0095 : 06 A9 00 
      return string(aActor.Name);                                               //0098 : 04 39 57 19 00 90 24 FE 13 05 00 04 01 F0 E4 6B 0F 
    }
    //07 12 00 72 00 90 24 FE 13 2A 16 04 1F 4E 6F 6E 65 00 0F 00 20 26 FE 13 2E 10 0E 5B 01 00 90 24 
    //FE 13 07 41 00 77 00 20 26 FE 13 2A 16 0F 00 90 24 FE 13 19 00 20 26 FE 13 05 00 04 01 88 83 6C 
    //0F 0F 00 98 26 FE 13 2E 18 38 5B 01 00 90 24 FE 13 07 98 00 82 77 00 98 26 FE 13 2A 16 18 12 00 
    //77 19 00 98 26 FE 13 05 00 04 01 68 2E 34 0F 2A 16 16 04 70 70 1F 27 00 19 19 00 98 26 FE 13 05 
    //00 04 01 68 2E 34 0F 06 00 00 1C 78 E1 18 11 16 16 1F 27 00 16 06 A9 00 04 39 57 19 00 90 24 FE 
    //13 05 00 04 01 F0 E4 6B 0F 04 0B 47 
  }


  native function ScriptAssert(bool aCheck,string aMessage);


  native function Failure(string aWarning);


  native function Warning(string aWarning);


  native function Debug(string aWarning);


  native function string ScriptName();


  function FrameOff() {
    mScriptFrameTime = -1.00000000;                                             //0000 : 0F 01 D8 2F FE 13 1E 00 00 80 BF 
    mFrameTimer = 0.00000000;                                                   //000B : 0F 01 50 30 FE 13 1E 00 00 00 00 
    //0F 01 D8 2F FE 13 1E 00 00 80 BF 0F 01 50 30 FE 13 1E 00 00 00 00 04 0B 47 
  }


  function FrameOn(optional float aFrameTime) {
    if (aFrameTime < 0.00000000) {                                              //0000 : 07 7E 00 B0 00 78 31 FE 13 1E 00 00 00 00 16 
      Warning("FrameTick; called with negative time"
        @ string(aFrameTime)
        @ " this will turn the tick off. Call FrameOff() instead.");//000F : 1B FF 02 00 00 A8 A8 1F 46 72 61 6D 65 54 69 63 6B 3B 20 63 61 6C 6C 65 64 20 77 69 74 68 20 6E 65 67 61 74 69 76 65 20 74 69 6D 65 00 39 55 00 78 31 FE 13 16 1F 20 74 68 69 73 20 77 69 6C 6C 20 74 75 72 6E 20 74 68 65 20 74 69 63 6B 20 6F 66 66 2E 20 43 61 6C 6C 20 46 72 61 6D 65 4F 66 66 28 29 20 69 6E 73 74 65 61 64 2E 00 16 16 
    }
    mScriptFrameTime = aFrameTime;                                              //007E : 0F 01 D8 2F FE 13 00 78 31 FE 13 
    mFrameTimer = 0.00000000;                                                   //0089 : 0F 01 50 30 FE 13 1E 00 00 00 00 
    //07 7E 00 B0 00 78 31 FE 13 1E 00 00 00 00 16 1B FF 02 00 00 A8 A8 1F 46 72 61 6D 65 54 69 63 6B 
    //3B 20 63 61 6C 6C 65 64 20 77 69 74 68 20 6E 65 67 61 74 69 76 65 20 74 69 6D 65 00 39 55 00 78 
    //31 FE 13 16 1F 20 74 68 69 73 20 77 69 6C 6C 20 74 75 72 6E 20 74 68 65 20 74 69 63 6B 20 6F 66 
    //66 2E 20 43 61 6C 6C 20 46 72 61 6D 65 4F 66 66 28 29 20 69 6E 73 74 65 61 64 2E 00 16 16 0F 01 
    //D8 2F FE 13 00 78 31 FE 13 0F 01 50 30 FE 13 1E 00 00 00 00 04 0B 47 
  }


  function GetTeam(Game_Pawn aMember,out array<Game_Pawn> oTeam) {
    local Game_PlayerController PlayerController;
    PlayerController = Game_PlayerController(aMember.Controller);               //0000 : 0F 00 B8 34 FE 13 2E 90 18 5B 01 19 00 98 33 FE 13 05 00 04 01 00 6E 6C 0F 
    if (aMember != None && PlayerController != None) {                          //0019 : 07 51 00 82 77 00 98 33 FE 13 2A 16 18 09 00 77 00 B8 34 FE 13 2A 16 16 
      PlayerController.GroupingTeams.sv_GetTeamMembersOrSolo(oTeam);            //0031 : 19 19 00 B8 34 FE 13 05 00 04 01 48 C2 18 11 0B 00 00 1B 13 07 00 00 00 30 35 FE 13 16 
    } else {                                                                    //004E : 06 59 00 
      oTeam.Length = 0;                                                         //0051 : 0F 37 00 30 35 FE 13 25 
    }
    //0F 00 B8 34 FE 13 2E 90 18 5B 01 19 00 98 33 FE 13 05 00 04 01 00 6E 6C 0F 07 51 00 82 77 00 98 
    //33 FE 13 2A 16 18 09 00 77 00 B8 34 FE 13 2A 16 16 19 19 00 B8 34 FE 13 05 00 04 01 48 C2 18 11 
    //0B 00 00 1B 13 07 00 00 00 30 35 FE 13 16 06 59 00 0F 37 00 30 35 FE 13 25 04 0B 47 
  }


  function Game_Pawn GetNPC(export editinline NPC_Type aType) {
    local Game_NPCPawn someNPC;
    foreach AllActors(Class'Game_NPCPawn',someNPC) {                            //0000 : 2F 61 30 20 D0 32 5B 01 00 48 37 FE 13 16 46 00 
      if (someNPC.NPCType == aType && !someNPC.IsDead()) {                      //0010 : 07 45 00 82 72 19 00 48 37 FE 13 05 00 04 01 00 47 1B 11 00 D0 36 FE 13 16 18 12 00 81 19 00 48 37 FE 13 06 00 04 1C D8 52 34 0F 16 16 16 
        return someNPC;                                                         //003F : 04 00 48 37 FE 13 
      }
    }
    return None;                                                                //0047 : 04 2A 
    //2F 61 30 20 D0 32 5B 01 00 48 37 FE 13 16 46 00 07 45 00 82 72 19 00 48 37 FE 13 05 00 04 01 00 
    //47 1B 11 00 D0 36 FE 13 16 18 12 00 81 19 00 48 37 FE 13 06 00 04 1C D8 52 34 0F 16 16 16 30 04 
    //00 48 37 FE 13 31 30 04 2A 04 0B 47 
  }


  function Actor GetActor(name aName) {
    local Actor someActor;
    foreach AllActors(Class'Actor',someActor) {                                 //0000 : 2F 61 30 20 F8 8B C1 00 00 D8 39 FE 13 16 30 00 
      if (someActor.Name == aName) {                                            //0010 : 07 2F 00 FE 19 00 D8 39 FE 13 05 00 04 01 F0 E4 6B 0F 00 E8 38 FE 13 16 
        return someActor;                                                       //0029 : 04 00 D8 39 FE 13 
      }
    }
    return None;                                                                //0031 : 04 2A 
    //2F 61 30 20 F8 8B C1 00 00 D8 39 FE 13 16 30 00 07 2F 00 FE 19 00 D8 39 FE 13 05 00 04 01 F0 E4 
    //6B 0F 00 E8 38 FE 13 16 30 04 00 D8 39 FE 13 31 30 04 2A 04 0B 47 
  }


  function bool GetInvulnerable(Game_AIController aGame_AIController) {
    local Game_Pawn pwn;
    ScriptAssert(aGame_AIController != None,"SetInvulnerable; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 78 3B FE 13 2A 16 1F 53 65 74 49 6E 76 75 6C 6E 65 72 61 62 6C 65 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    pwn = Game_Pawn(aGame_AIController.Pawn);                                   //003B : 0F 00 C0 3C FE 13 2E 18 38 5B 01 19 00 78 3B FE 13 05 00 04 01 88 83 6C 0F 
    if (pwn != None) {                                                          //0054 : 07 72 00 77 00 C0 3C FE 13 2A 16 
      return pwn.IsInvulnerable();                                              //005F : 04 19 00 C0 3C FE 13 06 00 04 1B A0 05 00 00 16 
    } else {                                                                    //006F : 06 74 00 
      return False;                                                             //0072 : 04 28 
    }
    //1B FB 72 00 00 77 00 78 3B FE 13 2A 16 1F 53 65 74 49 6E 76 75 6C 6E 65 72 61 62 6C 65 3B 20 61 
    //47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 0F 00 C0 3C FE 
    //13 2E 18 38 5B 01 19 00 78 3B FE 13 05 00 04 01 88 83 6C 0F 07 72 00 77 00 C0 3C FE 13 2A 16 04 
    //19 00 C0 3C FE 13 06 00 04 1B A0 05 00 00 16 06 74 00 04 28 04 0B 47 
  }


  function SetInvulnerable(Game_AIController aGame_AIController,bool aInvulnerable) {
    local Game_Pawn pwn;
    ScriptAssert(aGame_AIController != None,"SetInvulnerable; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 60 3E FE 13 2A 16 1F 53 65 74 49 6E 76 75 6C 6E 65 72 61 62 6C 65 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    pwn = Game_Pawn(aGame_AIController.Pawn);                                   //003B : 0F 00 A8 3F FE 13 2E 18 38 5B 01 19 00 60 3E FE 13 05 00 04 01 88 83 6C 0F 
    if (pwn != None) {                                                          //0054 : 07 74 00 77 00 A8 3F FE 13 2A 16 
      pwn.SetInvulnerable(aInvulnerable);                                       //005F : 19 00 A8 3F FE 13 0C 00 00 1B 1A 06 00 00 2D 00 20 40 FE 13 16 
    }
    //1B FB 72 00 00 77 00 60 3E FE 13 2A 16 1F 53 65 74 49 6E 76 75 6C 6E 65 72 61 62 6C 65 3B 20 61 
    //47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 0F 00 A8 3F FE 
    //13 2E 18 38 5B 01 19 00 60 3E FE 13 05 00 04 01 88 83 6C 0F 07 74 00 77 00 A8 3F FE 13 2A 16 19 
    //00 A8 3F FE 13 0C 00 00 1B 1A 06 00 00 2D 00 20 40 FE 13 16 04 0B 47 
  }


  function ReceiveDamage(Game_AIController aGame_AIController,Game_Pawn aInstigator,float aDamage) {
    local Game_Pawn Target;
    ScriptAssert(aGame_AIController != None,"TakeDamage; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 48 41 FE 13 2A 16 1F 54 61 6B 65 44 61 6D 61 67 65 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    if (aInstigator != None) {                                                  //0036 : 07 96 00 77 00 E8 42 FE 13 2A 16 
      Target = Game_Pawn(aGame_AIController.Pawn);                              //0041 : 0F 00 60 43 FE 13 2E 18 38 5B 01 19 00 48 41 FE 13 05 00 04 01 88 83 6C 0F 
      Target.TakeEffectDamage(aDamage,aInstigator,Target.Location,vect(0.000000, 0.000000, 0.000000),Class'DamageType');//005A : 19 00 60 43 FE 13 30 00 00 1B 53 07 00 00 00 D8 43 FE 13 00 E8 42 FE 13 19 00 60 43 FE 13 05 00 0C 01 30 81 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 20 18 44 C2 00 16 
    } else {                                                                    //0093 : 06 B5 00 
      aGame_AIController.Pawn.IncreaseHealth(-aDamage);                         //0096 : 19 19 00 48 41 FE 13 05 00 04 01 88 83 6C 0F 0D 00 00 1B 31 10 00 00 A9 00 D8 43 FE 13 16 16 
    }
    //1B FB 72 00 00 77 00 48 41 FE 13 2A 16 1F 54 61 6B 65 44 61 6D 61 67 65 3B 20 61 47 61 6D 65 5F 
    //41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 07 96 00 77 00 E8 42 FE 13 2A 
    //16 0F 00 60 43 FE 13 2E 18 38 5B 01 19 00 48 41 FE 13 05 00 04 01 88 83 6C 0F 19 00 60 43 FE 13 
    //30 00 00 1B 53 07 00 00 00 D8 43 FE 13 00 E8 42 FE 13 19 00 60 43 FE 13 05 00 0C 01 30 81 6C 0F 
    //23 00 00 00 00 00 00 00 00 00 00 00 00 20 18 44 C2 00 16 06 B5 00 19 19 00 48 41 FE 13 05 00 04 
    //01 88 83 6C 0F 0D 00 00 1B 31 10 00 00 A9 00 D8 43 FE 13 16 16 04 0B 47 
  }


  function DealDamage(Game_AIController aGame_AIController,Game_Pawn aTarget,float aDamage) {
    ScriptAssert(aTarget != None,"DealDamage; aTarget is none");                //0000 : 1B FB 72 00 00 77 00 78 46 FE 13 2A 16 1F 44 65 61 6C 44 61 6D 61 67 65 3B 20 61 54 61 72 67 65 74 20 69 73 20 6E 6F 6E 65 00 16 
    if (aGame_AIController != None) {                                           //002B : 07 80 00 77 00 00 45 FE 13 2A 16 
      aTarget.TakeEffectDamage(aDamage,Game_Pawn(aGame_AIController.Pawn),aTarget.Location,vect(0.000000, 0.000000, 0.000000),Class'DamageType');//0036 : 19 00 78 46 FE 13 3E 00 00 1B 53 07 00 00 00 F0 46 FE 13 2E 18 38 5B 01 19 00 00 45 FE 13 05 00 04 01 88 83 6C 0F 19 00 78 46 FE 13 05 00 0C 01 30 81 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 20 18 44 C2 00 16 
    } else {                                                                    //007D : 06 96 00 
      aTarget.IncreaseHealth(-aDamage);                                         //0080 : 19 00 78 46 FE 13 0D 00 00 1B 31 10 00 00 A9 00 F0 46 FE 13 16 16 
    }
    //1B FB 72 00 00 77 00 78 46 FE 13 2A 16 1F 44 65 61 6C 44 61 6D 61 67 65 3B 20 61 54 61 72 67 65 
    //74 20 69 73 20 6E 6F 6E 65 00 16 07 80 00 77 00 00 45 FE 13 2A 16 19 00 78 46 FE 13 3E 00 00 1B 
    //53 07 00 00 00 F0 46 FE 13 2E 18 38 5B 01 19 00 00 45 FE 13 05 00 04 01 88 83 6C 0F 19 00 78 46 
    //FE 13 05 00 0C 01 30 81 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 20 18 44 C2 00 16 06 96 00 
    //19 00 78 46 FE 13 0D 00 00 1B 31 10 00 00 A9 00 F0 46 FE 13 16 16 04 0B 47 
  }


  protected function float GetMaxHealth(Game_AIController aGame_AIController) {
    local Game_Pawn pwn;
    ScriptAssert(aGame_AIController != None,"GetMaxHealth; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 18 48 FE 13 2A 16 1F 47 65 74 4D 61 78 48 65 61 6C 74 68 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    pwn = Game_Pawn(aGame_AIController.Pawn);                                   //0038 : 0F 00 C8 49 FE 13 2E 18 38 5B 01 19 00 18 48 FE 13 05 00 04 01 88 83 6C 0F 
    ScriptAssert(pwn != None,"GetMaxHealth; aGame_AIController pawn is none");  //0051 : 1B FB 72 00 00 77 00 C8 49 FE 13 2A 16 1F 47 65 74 4D 61 78 48 65 61 6C 74 68 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 70 61 77 6E 20 69 73 20 6E 6F 6E 65 00 16 
    if (pwn != None) {                                                          //008E : 07 BB 00 77 00 C8 49 FE 13 2A 16 
      return pwn.CharacterStats.mRecord.MaxHealth;                              //0099 : 04 39 3F 36 D8 91 18 11 19 19 00 C8 49 FE 13 05 00 04 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 
    } else {                                                                    //00B8 : 06 C1 00 
      return 0.00000000;                                                        //00BB : 04 1E 00 00 00 00 
    }
    //1B FB 72 00 00 77 00 18 48 FE 13 2A 16 1F 47 65 74 4D 61 78 48 65 61 6C 74 68 3B 20 61 47 61 6D 
    //65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 0F 00 C8 49 FE 13 2E 18 
    //38 5B 01 19 00 18 48 FE 13 05 00 04 01 88 83 6C 0F 1B FB 72 00 00 77 00 C8 49 FE 13 2A 16 1F 47 
    //65 74 4D 61 78 48 65 61 6C 74 68 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 
    //70 61 77 6E 20 69 73 20 6E 6F 6E 65 00 16 07 BB 00 77 00 C8 49 FE 13 2A 16 04 39 3F 36 D8 91 18 
    //11 19 19 00 C8 49 FE 13 05 00 04 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 06 C1 00 04 1E 00 00 00 
    //00 04 0B 47 
  }


  function float GetHealth(Game_AIController aGame_AIController) {
    local Game_Pawn lPawn;
    ScriptAssert(aGame_AIController != None,"GetHealth; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 68 4B FE 13 2A 16 1F 47 65 74 48 65 61 6C 74 68 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    lPawn = Game_Pawn(aGame_AIController.Pawn);                                 //0035 : 0F 00 E0 4C FE 13 2E 18 38 5B 01 19 00 68 4B FE 13 05 00 04 01 88 83 6C 0F 
    ScriptAssert(lPawn != None,"GetHealth; aGame_AIController pawn is none");   //004E : 1B FB 72 00 00 77 00 E0 4C FE 13 2A 16 1F 47 65 74 48 65 61 6C 74 68 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 70 61 77 6E 20 69 73 20 6E 6F 6E 65 00 16 
    return lPawn.GetHealth();                                                   //0088 : 04 19 00 E0 4C FE 13 06 00 04 1B 12 10 00 00 16 
    //1B FB 72 00 00 77 00 68 4B FE 13 2A 16 1F 47 65 74 48 65 61 6C 74 68 3B 20 61 47 61 6D 65 5F 41 
    //49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 0F 00 E0 4C FE 13 2E 18 38 5B 01 
    //19 00 68 4B FE 13 05 00 04 01 88 83 6C 0F 1B FB 72 00 00 77 00 E0 4C FE 13 2A 16 1F 47 65 74 48 
    //65 61 6C 74 68 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 70 61 77 6E 20 69 
    //73 20 6E 6F 6E 65 00 16 04 19 00 E0 4C FE 13 06 00 04 1B 12 10 00 00 16 04 0B 47 
  }


  function float GetSpeed(Game_AIController aGame_AIController) {
    ScriptAssert(aGame_AIController != None,"GetSpeed; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 80 4E FE 13 2A 16 1F 47 65 74 53 70 65 65 64 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    return Game_Pawn(aGame_AIController.Pawn).CharacterStats.mBaseMovementSpeed;//0034 : 04 39 3F 19 19 2E 18 38 5B 01 19 00 80 4E FE 13 05 00 04 01 88 83 6C 0F 05 00 04 01 08 43 34 0F 05 00 04 01 50 91 1F 11 
    //1B FB 72 00 00 77 00 80 4E FE 13 2A 16 1F 47 65 74 53 70 65 65 64 3B 20 61 47 61 6D 65 5F 41 49 
    //43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 04 39 3F 19 19 2E 18 38 5B 01 19 00 
    //80 4E FE 13 05 00 04 01 88 83 6C 0F 05 00 04 01 08 43 34 0F 05 00 04 01 50 91 1F 11 04 0B 47 
  }


  function ResetSpeed(Game_AIController aGame_AIController) {
    ScriptAssert(aGame_AIController != None,"ResetSpeed; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 D0 50 FE 13 2A 16 1F 52 65 73 65 74 53 70 65 65 64 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(Game_NPCPawn(aGame_AIController.Pawn) != None,"ResetSpeed; aGame_AIController is not an NPC");//0036 : 1B FB 72 00 00 77 2E D0 32 5B 01 19 00 D0 50 FE 13 05 00 04 01 88 83 6C 0F 2A 16 1F 52 65 73 65 74 53 70 65 65 64 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 74 20 61 6E 20 4E 50 43 00 16 
    aGame_AIController.Pawn.GroundSpeed = Game_NPCPawn(aGame_AIController.Pawn).NPCType.GroundSpeed;//0080 : 0F 19 19 00 D0 50 FE 13 05 00 04 01 88 83 6C 0F 05 00 04 01 18 A9 76 0F 19 19 2E D0 32 5B 01 19 00 D0 50 FE 13 05 00 04 01 88 83 6C 0F 05 00 04 01 00 47 1B 11 05 00 04 01 28 BD 21 11 
    aGame_AIController.Pawn.AirSpeed = Game_NPCPawn(aGame_AIController.Pawn).NPCType.AirSpeed;//00BD : 0F 19 19 00 D0 50 FE 13 05 00 04 01 88 83 6C 0F 05 00 04 01 D8 A9 76 0F 19 19 2E D0 32 5B 01 19 00 D0 50 FE 13 05 00 04 01 88 83 6C 0F 05 00 04 01 00 47 1B 11 05 00 04 01 A0 BD 21 11 
    Game_Pawn(aGame_AIController.Pawn).CharacterStats.mBaseMovementSpeed = Game_Pawn(aGame_AIController.Pawn).CharacterStats.mMovementSpeedDefault;//00FA : 0F 19 19 2E 18 38 5B 01 19 00 D0 50 FE 13 05 00 04 01 88 83 6C 0F 05 00 04 01 08 43 34 0F 05 00 04 01 50 91 1F 11 19 19 2E 18 38 5B 01 19 00 D0 50 FE 13 05 00 04 01 88 83 6C 0F 05 00 04 01 08 43 34 0F 05 00 04 01 E0 B5 1F 11 
    //1B FB 72 00 00 77 00 D0 50 FE 13 2A 16 1F 52 65 73 65 74 53 70 65 65 64 3B 20 61 47 61 6D 65 5F 
    //41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 77 2E D0 32 5B 
    //01 19 00 D0 50 FE 13 05 00 04 01 88 83 6C 0F 2A 16 1F 52 65 73 65 74 53 70 65 65 64 3B 20 61 47 
    //61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 74 20 61 6E 20 4E 50 43 00 16 
    //0F 19 19 00 D0 50 FE 13 05 00 04 01 88 83 6C 0F 05 00 04 01 18 A9 76 0F 19 19 2E D0 32 5B 01 19 
    //00 D0 50 FE 13 05 00 04 01 88 83 6C 0F 05 00 04 01 00 47 1B 11 05 00 04 01 28 BD 21 11 0F 19 19 
    //00 D0 50 FE 13 05 00 04 01 88 83 6C 0F 05 00 04 01 D8 A9 76 0F 19 19 2E D0 32 5B 01 19 00 D0 50 
    //FE 13 05 00 04 01 88 83 6C 0F 05 00 04 01 00 47 1B 11 05 00 04 01 A0 BD 21 11 0F 19 19 2E 18 38 
    //5B 01 19 00 D0 50 FE 13 05 00 04 01 88 83 6C 0F 05 00 04 01 08 43 34 0F 05 00 04 01 50 91 1F 11 
    //19 19 2E 18 38 5B 01 19 00 D0 50 FE 13 05 00 04 01 88 83 6C 0F 05 00 04 01 08 43 34 0F 05 00 04 
    //01 E0 B5 1F 11 04 0B 47 
  }


  function SetSpeed(Game_AIController aGame_AIController,float newSpeed) {
    ScriptAssert(aGame_AIController != None,"SetSpeed; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 E8 53 FE 13 2A 16 1F 53 65 74 53 70 65 65 64 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(newSpeed >= 0.00000000,"SetSpeed; newSpeed is negative");      //0034 : 1B FB 72 00 00 B3 00 A8 55 FE 13 1E 00 00 00 00 16 1F 53 65 74 53 70 65 65 64 3B 20 6E 65 77 53 70 65 65 64 20 69 73 20 6E 65 67 61 74 69 76 65 00 16 
    aGame_AIController.Pawn.GroundSpeed = newSpeed;                             //0066 : 0F 19 19 00 E8 53 FE 13 05 00 04 01 88 83 6C 0F 05 00 04 01 18 A9 76 0F 00 A8 55 FE 13 
    aGame_AIController.Pawn.AirSpeed = newSpeed;                                //0083 : 0F 19 19 00 E8 53 FE 13 05 00 04 01 88 83 6C 0F 05 00 04 01 D8 A9 76 0F 00 A8 55 FE 13 
    Game_Pawn(aGame_AIController.Pawn).CharacterStats.mBaseMovementSpeed = newSpeed;//00A0 : 0F 19 19 2E 18 38 5B 01 19 00 E8 53 FE 13 05 00 04 01 88 83 6C 0F 05 00 04 01 08 43 34 0F 05 00 04 01 50 91 1F 11 39 44 00 A8 55 FE 13 
    //1B FB 72 00 00 77 00 E8 53 FE 13 2A 16 1F 53 65 74 53 70 65 65 64 3B 20 61 47 61 6D 65 5F 41 49 
    //43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 B3 00 A8 55 FE 13 1E 
    //00 00 00 00 16 1F 53 65 74 53 70 65 65 64 3B 20 6E 65 77 53 70 65 65 64 20 69 73 20 6E 65 67 61 
    //74 69 76 65 00 16 0F 19 19 00 E8 53 FE 13 05 00 04 01 88 83 6C 0F 05 00 04 01 18 A9 76 0F 00 A8 
    //55 FE 13 0F 19 19 00 E8 53 FE 13 05 00 04 01 88 83 6C 0F 05 00 04 01 D8 A9 76 0F 00 A8 55 FE 13 
    //0F 19 19 2E 18 38 5B 01 19 00 E8 53 FE 13 05 00 04 01 88 83 6C 0F 05 00 04 01 08 43 34 0F 05 00 
    //04 01 50 91 1F 11 39 44 00 A8 55 FE 13 04 0B 47 
  }


  function Vector GetHomeLocation(Game_AIController aGame_AIController) {
    ScriptAssert(aGame_AIController != None,"AIScript.SetHomeLocation; aGame_AIController != none");//0000 : 1B FB 72 00 00 77 00 D0 56 FE 13 2A 16 1F 41 49 53 63 72 69 70 74 2E 53 65 74 48 6F 6D 65 4C 6F 63 61 74 69 6F 6E 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 21 3D 20 6E 6F 6E 65 00 16 
    return aGame_AIController.GetHomeLocation();                                //0044 : 04 19 00 D0 56 FE 13 06 00 0C 1C F8 3E FC 13 16 
    //1B FB 72 00 00 77 00 D0 56 FE 13 2A 16 1F 41 49 53 63 72 69 70 74 2E 53 65 74 48 6F 6D 65 4C 6F 
    //63 61 74 69 6F 6E 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 21 3D 20 6E 6F 
    //6E 65 00 16 04 19 00 D0 56 FE 13 06 00 0C 1C F8 3E FC 13 16 04 0B 47 
  }


  function SetHomeLocation(Game_AIController aGame_AIController,Vector aHomeLocation) {
    ScriptAssert(aGame_AIController != None,"AIScript.SetHomeLocation; aGame_AIController != none");//0000 : 1B FB 72 00 00 77 00 10 59 FE 13 2A 16 1F 41 49 53 63 72 69 70 74 2E 53 65 74 48 6F 6D 65 4C 6F 63 61 74 69 6F 6E 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 21 3D 20 6E 6F 6E 65 00 16 
    if (!aGame_AIController.SetHomeLocation(aHomeLocation)) {                   //0044 : 07 9C 00 81 19 00 10 59 FE 13 0B 00 04 1C 08 D9 31 0F 00 90 5A FE 13 16 16 
      Warning("Failed to set homelocation" @ string(aHomeLocation)
        @ "for"
        @ CharName(aGame_AIController));//005D : 1B FF 02 00 00 A8 A8 A8 1F 46 61 69 6C 65 64 20 74 6F 20 73 65 74 20 68 6F 6D 65 6C 6F 63 61 74 69 6F 6E 00 39 58 00 90 5A FE 13 16 1F 66 6F 72 00 16 1B 05 73 00 00 00 10 59 FE 13 16 16 16 
    }
    //1B FB 72 00 00 77 00 10 59 FE 13 2A 16 1F 41 49 53 63 72 69 70 74 2E 53 65 74 48 6F 6D 65 4C 6F 
    //63 61 74 69 6F 6E 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 21 3D 20 6E 6F 
    //6E 65 00 16 07 9C 00 81 19 00 10 59 FE 13 0B 00 04 1C 08 D9 31 0F 00 90 5A FE 13 16 16 1B FF 02 
    //00 00 A8 A8 A8 1F 46 61 69 6C 65 64 20 74 6F 20 73 65 74 20 68 6F 6D 65 6C 6F 63 61 74 69 6F 6E 
    //00 39 58 00 90 5A FE 13 16 1F 66 6F 72 00 16 1B 05 73 00 00 00 10 59 FE 13 16 16 16 04 0B 47 
  }


  function float Distance(Game_AIController aGame_AIController,Actor anActor) {
    ScriptAssert(aGame_AIController != None,"AIScript.Distance; aGame_AIController != none");//0000 : 1B FB 72 00 00 77 00 B8 5B FE 13 2A 16 1F 41 49 53 63 72 69 70 74 2E 44 69 73 74 61 6E 63 65 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 21 3D 20 6E 6F 6E 65 00 16 
    ScriptAssert(anActor != None,"AIScript.Distance; anActor != none");         //003D : 1B FB 72 00 00 77 00 30 5D FE 13 2A 16 1F 41 49 53 63 72 69 70 74 2E 44 69 73 74 61 6E 63 65 3B 20 61 6E 41 63 74 6F 72 20 21 3D 20 6E 6F 6E 65 00 16 
    return VSize(aGame_AIController.Pawn.Location - anActor.Location);          //006F : 04 E1 D8 19 19 00 B8 5B FE 13 05 00 04 01 88 83 6C 0F 05 00 0C 01 30 81 6C 0F 19 00 30 5D FE 13 05 00 0C 01 30 81 6C 0F 16 16 
    //1B FB 72 00 00 77 00 B8 5B FE 13 2A 16 1F 41 49 53 63 72 69 70 74 2E 44 69 73 74 61 6E 63 65 3B 
    //20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 21 3D 20 6E 6F 6E 65 00 16 1B FB 72 
    //00 00 77 00 30 5D FE 13 2A 16 1F 41 49 53 63 72 69 70 74 2E 44 69 73 74 61 6E 63 65 3B 20 61 6E 
    //41 63 74 6F 72 20 21 3D 20 6E 6F 6E 65 00 16 04 E1 D8 19 19 00 B8 5B FE 13 05 00 04 01 88 83 6C 
    //0F 05 00 0C 01 30 81 6C 0F 19 00 30 5D FE 13 05 00 0C 01 30 81 6C 0F 16 16 04 0B 47 
  }


  function Vector GetLocation(Game_AIController aGame_AIController) {
    ScriptAssert(aGame_AIController != None,"AIScript.GetLocation; aGame_AIController != none");//0000 : 1B FB 72 00 00 77 00 D0 5E FE 13 2A 16 1F 41 49 53 63 72 69 70 74 2E 47 65 74 4C 6F 63 61 74 69 6F 6E 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 21 3D 20 6E 6F 6E 65 00 16 
    return aGame_AIController.Pawn.Location;                                    //0040 : 04 19 19 00 D0 5E FE 13 05 00 04 01 88 83 6C 0F 05 00 0C 01 30 81 6C 0F 
    //1B FB 72 00 00 77 00 D0 5E FE 13 2A 16 1F 41 49 53 63 72 69 70 74 2E 47 65 74 4C 6F 63 61 74 69 
    //6F 6E 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 21 3D 20 6E 6F 6E 65 00 16 
    //04 19 19 00 D0 5E FE 13 05 00 04 01 88 83 6C 0F 05 00 0C 01 30 81 6C 0F 04 0B 47 
  }


  function bool ChangeToNextScript(Game_AIController aGame_AIController,optional Pawn aInstigator) {
    if (NextScript != None) {                                                   //0000 : 07 5B 00 77 01 40 62 FE 13 2A 16 
      SwitchScript(aGame_AIController,self,NextScript);                         //000B : 1B 1E 73 00 00 00 18 61 FE 13 17 01 40 62 FE 13 16 
      if (TriggerNextScript) {                                                  //001C : 07 59 00 2D 01 B8 62 FE 13 
        if (aInstigator == None) {                                              //0025 : 07 44 00 72 00 30 63 FE 13 2A 16 
          aInstigator = aGame_AIController.Pawn;                                //0030 : 0F 00 30 63 FE 13 19 00 18 61 FE 13 05 00 04 01 88 83 6C 0F 
        }
        NextScript.Trigger(self,aInstigator);                                   //0044 : 19 01 40 62 FE 13 0C 00 00 1B 32 01 00 00 17 00 30 63 FE 13 16 
      }
      return True;                                                              //0059 : 04 27 
    }
    return False;                                                               //005B : 04 28 
    //07 5B 00 77 01 40 62 FE 13 2A 16 1B 1E 73 00 00 00 18 61 FE 13 17 01 40 62 FE 13 16 07 59 00 2D 
    //01 B8 62 FE 13 07 44 00 72 00 30 63 FE 13 2A 16 0F 00 30 63 FE 13 19 00 18 61 FE 13 05 00 04 01 
    //88 83 6C 0F 19 01 40 62 FE 13 0C 00 00 1B 32 01 00 00 17 00 30 63 FE 13 16 04 27 04 28 04 0B 47 
    //
  }


  function SwitchScript(Game_AIController aGame_AIController,AI_Script oldScript,AI_Script NewScript) {
    ScriptAssert(aGame_AIController != None,"AIScript.SwitchScript; aGame_AIController != none");//0000 : 1B FB 72 00 00 77 00 D0 64 FE 13 2A 16 1F 41 49 53 63 72 69 70 74 2E 53 77 69 74 63 68 53 63 72 69 70 74 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 21 3D 20 6E 6F 6E 65 00 16 
    ScriptAssert(oldScript != None,"AIScript.SwitchScript; oldScript is none"); //0041 : 1B FB 72 00 00 77 00 98 68 FE 13 2A 16 1F 41 49 53 63 72 69 70 74 2E 53 77 69 74 63 68 53 63 72 69 70 74 3B 20 6F 6C 64 53 63 72 69 70 74 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(NewScript != None,"AIScript.SwitchScript; newScript is none"); //0079 : 1B FB 72 00 00 77 00 10 69 FE 13 2A 16 1F 41 49 53 63 72 69 70 74 2E 53 77 69 74 63 68 53 63 72 69 70 74 3B 20 6E 65 77 53 63 72 69 70 74 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(aGame_AIController.HasMetaController(oldScript),"AIScript.SwitchScript; oldScript is not running for that controller");//00B1 : 1B FB 72 00 00 19 00 D0 64 FE 13 0B 00 04 1B FF 72 00 00 00 98 68 FE 13 16 1F 41 49 53 63 72 69 70 74 2E 53 77 69 74 63 68 53 63 72 69 70 74 3B 20 6F 6C 64 53 63 72 69 70 74 20 69 73 20 6E 6F 74 20 72 75 6E 6E 69 6E 67 20 66 6F 72 20 74 68 61 74 20 63 6F 6E 74 72 6F 6C 6C 65 72 00 16 
    ScriptAssert(!aGame_AIController.HasMetaController(NewScript),"AIScript.SwitchScript; newScript is already running for that controller");//0110 : 1B FB 72 00 00 81 19 00 D0 64 FE 13 0B 00 04 1B FF 72 00 00 00 10 69 FE 13 16 16 1F 41 49 53 63 72 69 70 74 2E 53 77 69 74 63 68 53 63 72 69 70 74 3B 20 6E 65 77 53 63 72 69 70 74 20 69 73 20 61 6C 72 65 61 64 79 20 72 75 6E 6E 69 6E 67 20 66 6F 72 20 74 68 61 74 20 63 6F 6E 74 72 6F 6C 6C 65 72 00 16 
    if (aGame_AIController != None) {                                           //0175 : 07 46 02 77 00 D0 64 FE 13 2A 16 
      if (oldScript != None
        && aGame_AIController.HasMetaController(oldScript)) {//0180 : 07 E2 01 82 77 00 98 68 FE 13 2A 16 18 15 00 19 00 D0 64 FE 13 0B 00 04 1B FF 72 00 00 00 98 68 FE 13 16 16 
        aGame_AIController.MetaControllerMessage(5,oldScript);                  //01A4 : 19 00 D0 64 FE 13 0D 00 04 1B FE 72 00 00 24 05 00 98 68 FE 13 16 
        oldScript.OnEnd(aGame_AIController);                                    //01BA : 19 00 98 68 FE 13 0B 00 00 1B CB 08 00 00 00 D0 64 FE 13 16 
        aGame_AIController.RemoveMetaController(oldScript);                     //01CE : 19 00 D0 64 FE 13 0B 00 00 1B 02 73 00 00 00 98 68 FE 13 16 
      }
      if (NewScript != None
        && !aGame_AIController.HasMetaController(NewScript)) {//01E2 : 07 46 02 82 77 00 10 69 FE 13 2A 16 18 17 00 81 19 00 D0 64 FE 13 0B 00 04 1B FF 72 00 00 00 10 69 FE 13 16 16 16 
        aGame_AIController.AddMetaController(NewScript);                        //0208 : 19 00 D0 64 FE 13 0B 00 04 1B 01 73 00 00 00 10 69 FE 13 16 
        NewScript.OnBegin(aGame_AIController);                                  //021C : 19 00 10 69 FE 13 0B 00 00 1B BA 08 00 00 00 D0 64 FE 13 16 
        aGame_AIController.MetaControllerMessage(4,NewScript);                  //0230 : 19 00 D0 64 FE 13 0D 00 04 1B FE 72 00 00 24 04 00 10 69 FE 13 16 
      }
    }
    //1B FB 72 00 00 77 00 D0 64 FE 13 2A 16 1F 41 49 53 63 72 69 70 74 2E 53 77 69 74 63 68 53 63 72 
    //69 70 74 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 21 3D 20 6E 6F 6E 65 00 
    //16 1B FB 72 00 00 77 00 98 68 FE 13 2A 16 1F 41 49 53 63 72 69 70 74 2E 53 77 69 74 63 68 53 63 
    //72 69 70 74 3B 20 6F 6C 64 53 63 72 69 70 74 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 77 00 
    //10 69 FE 13 2A 16 1F 41 49 53 63 72 69 70 74 2E 53 77 69 74 63 68 53 63 72 69 70 74 3B 20 6E 65 
    //77 53 63 72 69 70 74 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 19 00 D0 64 FE 13 0B 00 04 1B 
    //FF 72 00 00 00 98 68 FE 13 16 1F 41 49 53 63 72 69 70 74 2E 53 77 69 74 63 68 53 63 72 69 70 74 
    //3B 20 6F 6C 64 53 63 72 69 70 74 20 69 73 20 6E 6F 74 20 72 75 6E 6E 69 6E 67 20 66 6F 72 20 74 
    //68 61 74 20 63 6F 6E 74 72 6F 6C 6C 65 72 00 16 1B FB 72 00 00 81 19 00 D0 64 FE 13 0B 00 04 1B 
    //FF 72 00 00 00 10 69 FE 13 16 16 1F 41 49 53 63 72 69 70 74 2E 53 77 69 74 63 68 53 63 72 69 70 
    //74 3B 20 6E 65 77 53 63 72 69 70 74 20 69 73 20 61 6C 72 65 61 64 79 20 72 75 6E 6E 69 6E 67 20 
    //66 6F 72 20 74 68 61 74 20 63 6F 6E 74 72 6F 6C 6C 65 72 00 16 07 46 02 77 00 D0 64 FE 13 2A 16 
    //07 E2 01 82 77 00 98 68 FE 13 2A 16 18 15 00 19 00 D0 64 FE 13 0B 00 04 1B FF 72 00 00 00 98 68 
    //FE 13 16 16 19 00 D0 64 FE 13 0D 00 04 1B FE 72 00 00 24 05 00 98 68 FE 13 16 19 00 98 68 FE 13 
    //0B 00 00 1B CB 08 00 00 00 D0 64 FE 13 16 19 00 D0 64 FE 13 0B 00 00 1B 02 73 00 00 00 98 68 FE 
    //13 16 07 46 02 82 77 00 10 69 FE 13 2A 16 18 17 00 81 19 00 D0 64 FE 13 0B 00 04 1B FF 72 00 00 
    //00 10 69 FE 13 16 16 16 19 00 D0 64 FE 13 0B 00 04 1B 01 73 00 00 00 10 69 FE 13 16 19 00 10 69 
    //FE 13 0B 00 00 1B BA 08 00 00 00 D0 64 FE 13 16 19 00 D0 64 FE 13 0D 00 04 1B FE 72 00 00 24 04 
    //00 10 69 FE 13 16 04 0B 47 
  }


  function StopScript(Game_AIController aGame_AIController,AI_Script oldScript) {
    ScriptAssert(aGame_AIController != None,"AIScript.StopScript; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 38 6A FE 13 2A 16 1F 41 49 53 63 72 69 70 74 2E 53 74 6F 70 53 63 72 69 70 74 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(oldScript != None,"AIScript.StopScript; oldScript is none");   //003F : 1B FB 72 00 00 77 00 98 6C FE 13 2A 16 1F 41 49 53 63 72 69 70 74 2E 53 74 6F 70 53 63 72 69 70 74 3B 20 6F 6C 64 53 63 72 69 70 74 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(aGame_AIController.HasMetaController(oldScript),"AIScript.StopScript; oldScript is not running for that controller");//0075 : 1B FB 72 00 00 19 00 38 6A FE 13 0B 00 04 1B FF 72 00 00 00 98 6C FE 13 16 1F 41 49 53 63 72 69 70 74 2E 53 74 6F 70 53 63 72 69 70 74 3B 20 6F 6C 64 53 63 72 69 70 74 20 69 73 20 6E 6F 74 20 72 75 6E 6E 69 6E 67 20 66 6F 72 20 74 68 61 74 20 63 6F 6E 74 72 6F 6C 6C 65 72 00 16 
    if (aGame_AIController != None && oldScript != None
      && aGame_AIController.HasMetaController(oldScript)) {//00D2 : 07 41 01 82 82 77 00 38 6A FE 13 2A 16 18 09 00 77 00 98 6C FE 13 2A 16 16 18 15 00 19 00 38 6A FE 13 0B 00 04 1B FF 72 00 00 00 98 6C FE 13 16 16 
      aGame_AIController.MetaControllerMessage(5,oldScript);                    //0103 : 19 00 38 6A FE 13 0D 00 04 1B FE 72 00 00 24 05 00 98 6C FE 13 16 
      oldScript.OnEnd(aGame_AIController);                                      //0119 : 19 00 98 6C FE 13 0B 00 00 1B CB 08 00 00 00 38 6A FE 13 16 
      aGame_AIController.RemoveMetaController(oldScript);                       //012D : 19 00 38 6A FE 13 0B 00 00 1B 02 73 00 00 00 98 6C FE 13 16 
    }
    //1B FB 72 00 00 77 00 38 6A FE 13 2A 16 1F 41 49 53 63 72 69 70 74 2E 53 74 6F 70 53 63 72 69 70 
    //74 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 1B 
    //FB 72 00 00 77 00 98 6C FE 13 2A 16 1F 41 49 53 63 72 69 70 74 2E 53 74 6F 70 53 63 72 69 70 74 
    //3B 20 6F 6C 64 53 63 72 69 70 74 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 19 00 38 6A FE 13 
    //0B 00 04 1B FF 72 00 00 00 98 6C FE 13 16 1F 41 49 53 63 72 69 70 74 2E 53 74 6F 70 53 63 72 69 
    //70 74 3B 20 6F 6C 64 53 63 72 69 70 74 20 69 73 20 6E 6F 74 20 72 75 6E 6E 69 6E 67 20 66 6F 72 
    //20 74 68 61 74 20 63 6F 6E 74 72 6F 6C 6C 65 72 00 16 07 41 01 82 82 77 00 38 6A FE 13 2A 16 18 
    //09 00 77 00 98 6C FE 13 2A 16 16 18 15 00 19 00 38 6A FE 13 0B 00 04 1B FF 72 00 00 00 98 6C FE 
    //13 16 16 19 00 38 6A FE 13 0D 00 04 1B FE 72 00 00 24 05 00 98 6C FE 13 16 19 00 98 6C FE 13 0B 
    //00 00 1B CB 08 00 00 00 38 6A FE 13 16 19 00 38 6A FE 13 0B 00 00 1B 02 73 00 00 00 98 6C FE 13 
    //16 04 0B 47 
  }


  function StartScript(Game_AIController aGame_AIController,AI_Script NewScript) {
    ScriptAssert(aGame_AIController != None,"AIScript.StartScript; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 C0 6D FE 13 2A 16 1F 41 49 53 63 72 69 70 74 2E 53 74 61 72 74 53 63 72 69 70 74 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(NewScript != None,"AIScript.StartScript; newScript is none");  //0040 : 1B FB 72 00 00 77 00 30 70 FE 13 2A 16 1F 41 49 53 63 72 69 70 74 2E 53 74 61 72 74 53 63 72 69 70 74 3B 20 6E 65 77 53 63 72 69 70 74 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(!aGame_AIController.HasMetaController(NewScript),"AIScript.StartScript; newScript is already running for that controller");//0077 : 1B FB 72 00 00 81 19 00 C0 6D FE 13 0B 00 04 1B FF 72 00 00 00 30 70 FE 13 16 16 1F 41 49 53 63 72 69 70 74 2E 53 74 61 72 74 53 63 72 69 70 74 3B 20 6E 65 77 53 63 72 69 70 74 20 69 73 20 61 6C 72 65 61 64 79 20 72 75 6E 6E 69 6E 67 20 66 6F 72 20 74 68 61 74 20 63 6F 6E 74 72 6F 6C 6C 65 72 00 16 
    if (aGame_AIController != None && NewScript != None
      && !aGame_AIController.HasMetaController(NewScript)) {//00DB : 07 4C 01 82 82 77 00 C0 6D FE 13 2A 16 18 09 00 77 00 30 70 FE 13 2A 16 16 18 17 00 81 19 00 C0 6D FE 13 0B 00 04 1B FF 72 00 00 00 30 70 FE 13 16 16 16 
      aGame_AIController.AddMetaController(NewScript);                          //010E : 19 00 C0 6D FE 13 0B 00 04 1B 01 73 00 00 00 30 70 FE 13 16 
      NewScript.OnBegin(aGame_AIController);                                    //0122 : 19 00 30 70 FE 13 0B 00 00 1B BA 08 00 00 00 C0 6D FE 13 16 
      aGame_AIController.MetaControllerMessage(4,NewScript);                    //0136 : 19 00 C0 6D FE 13 0D 00 04 1B FE 72 00 00 24 04 00 30 70 FE 13 16 
    }
    //1B FB 72 00 00 77 00 C0 6D FE 13 2A 16 1F 41 49 53 63 72 69 70 74 2E 53 74 61 72 74 53 63 72 69 
    //70 74 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    //1B FB 72 00 00 77 00 30 70 FE 13 2A 16 1F 41 49 53 63 72 69 70 74 2E 53 74 61 72 74 53 63 72 69 
    //70 74 3B 20 6E 65 77 53 63 72 69 70 74 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 81 19 00 C0 
    //6D FE 13 0B 00 04 1B FF 72 00 00 00 30 70 FE 13 16 16 1F 41 49 53 63 72 69 70 74 2E 53 74 61 72 
    //74 53 63 72 69 70 74 3B 20 6E 65 77 53 63 72 69 70 74 20 69 73 20 61 6C 72 65 61 64 79 20 72 75 
    //6E 6E 69 6E 67 20 66 6F 72 20 74 68 61 74 20 63 6F 6E 74 72 6F 6C 6C 65 72 00 16 07 4C 01 82 82 
    //77 00 C0 6D FE 13 2A 16 18 09 00 77 00 30 70 FE 13 2A 16 16 18 17 00 81 19 00 C0 6D FE 13 0B 00 
    //04 1B FF 72 00 00 00 30 70 FE 13 16 16 16 19 00 C0 6D FE 13 0B 00 04 1B 01 73 00 00 00 30 70 FE 
    //13 16 19 00 30 70 FE 13 0B 00 00 1B BA 08 00 00 00 C0 6D FE 13 16 19 00 C0 6D FE 13 0D 00 04 1B 
    //FE 72 00 00 24 04 00 30 70 FE 13 16 04 0B 47 
  }


  function StopTimer(Game_AIController aGame_AIController,name aTimer) {
    ScriptAssert(aGame_AIController != None,"StopTimer; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 58 71 FE 13 2A 16 1F 53 74 6F 70 54 69 6D 65 72 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    aGame_AIController.RemoveTimer(aTimer);                                     //0035 : 19 00 58 71 FE 13 0B 00 00 1B 2B 73 00 00 00 60 72 FE 13 16 
    //1B FB 72 00 00 77 00 58 71 FE 13 2A 16 1F 53 74 6F 70 54 69 6D 65 72 3B 20 61 47 61 6D 65 5F 41 
    //49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 19 00 58 71 FE 13 0B 00 00 1B 2B 
    //73 00 00 00 60 72 FE 13 16 04 0B 47 
  }


  function StartTimer(Game_AIController aGame_AIController,name aTimer,float aTime) {
    ScriptAssert(aGame_AIController != None,"StartTimer; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 88 73 FE 13 2A 16 1F 53 74 61 72 74 54 69 6D 65 72 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    aGame_AIController.SetTimerTimeout(self,aTimer,aTime);                      //0036 : 19 00 88 73 FE 13 11 00 00 1B 2A 73 00 00 17 00 A0 74 FE 13 00 18 75 FE 13 16 
    //1B FB 72 00 00 77 00 88 73 FE 13 2A 16 1F 53 74 61 72 74 54 69 6D 65 72 3B 20 61 47 61 6D 65 5F 
    //41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 19 00 88 73 FE 13 11 00 00 1B 
    //2A 73 00 00 17 00 A0 74 FE 13 00 18 75 FE 13 16 04 0B 47 
  }


  function PerformEmote(Game_AIController aGame_AIController,byte aEmote) {
    local Game_Pawn aPawn;
    aPawn = Game_Pawn(aGame_AIController.Pawn);                                 //0000 : 0F 00 80 77 FE 13 2E 18 38 5B 01 19 00 40 76 FE 13 05 00 04 01 88 83 6C 0F 
    ScriptAssert(aPawn != None,"AI_Script Emote: aPawn is none");               //0019 : 1B FB 72 00 00 77 00 80 77 FE 13 2A 16 1F 41 49 5F 53 63 72 69 70 74 20 45 6D 6F 74 65 3A 20 61 50 61 77 6E 20 69 73 20 6E 6F 6E 65 00 16 
    if (aEmote > 0) {                                                           //0047 : 07 71 00 97 39 3A 00 F8 77 FE 13 25 16 
      aPawn.Emotes.sv_PlayContentEmote(aEmote);                                 //0054 : 19 19 00 80 77 FE 13 05 00 04 01 F0 51 18 11 0B 00 00 1C 90 B7 2A 11 00 F8 77 FE 13 16 
    }
    //0F 00 80 77 FE 13 2E 18 38 5B 01 19 00 40 76 FE 13 05 00 04 01 88 83 6C 0F 1B FB 72 00 00 77 00 
    //80 77 FE 13 2A 16 1F 41 49 5F 53 63 72 69 70 74 20 45 6D 6F 74 65 3A 20 61 50 61 77 6E 20 69 73 
    //20 6E 6F 6E 65 00 16 07 71 00 97 39 3A 00 F8 77 FE 13 25 16 19 19 00 80 77 FE 13 05 00 04 01 F0 
    //51 18 11 0B 00 00 1C 90 B7 2A 11 00 F8 77 FE 13 16 04 0B 47 
  }


  function LocalizedChat(Game_AIController aGame_AIController,LocalizedString aText,optional Object aTopic,optional Object aTarget) {
    local Game_NPCPawn npcPawn;
    local Game_Pawn pawnTarget;
    local int topicId;
    local int targetId;
    ScriptAssert(aGame_AIController != None,"LocalizedChat; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 20 79 FE 13 2A 16 1F 4C 6F 63 61 6C 69 7A 65 64 43 68 61 74 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    npcPawn = Game_NPCPawn(aGame_AIController.Pawn);                            //0039 : 0F 00 78 7B FE 13 2E D0 32 5B 01 19 00 20 79 FE 13 05 00 04 01 88 83 6C 0F 
    ScriptAssert(aGame_AIController != None,"LocalizedChat; aGame_AIController has no NPC Pawn");//0052 : 1B FB 72 00 00 77 00 20 79 FE 13 2A 16 1F 4C 6F 63 61 6C 69 7A 65 64 43 68 61 74 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 68 61 73 20 6E 6F 20 4E 50 43 20 50 61 77 6E 00 16 
    if (aTopic.IsA('Content_Type')) {                                           //0093 : 07 C1 00 19 00 50 81 FE 13 08 00 04 61 2F 21 93 07 00 00 16 
      topicId = Content_Type(aTopic).GetResourceId();                           //00A7 : 0F 00 C8 81 FE 13 19 2E 80 62 5B 01 00 50 81 FE 13 06 00 04 1C 08 90 20 11 16 
    }
    if (aTarget.IsA('Content_Type')) {                                          //00C1 : 07 F9 00 19 00 40 82 FE 13 08 00 04 61 2F 21 93 07 00 00 16 
      targetId = Content_Type(aTarget).GetResourceId();                         //00D5 : 0F 00 B8 82 FE 13 19 2E 80 62 5B 01 00 40 82 FE 13 06 00 04 1C 08 90 20 11 16 
      pawnTarget = None;                                                        //00EF : 0F 00 30 83 FE 13 2A 
    } else {                                                                    //00F6 : 06 10 01 
      pawnTarget = Game_Pawn(aTarget);                                          //00F9 : 0F 00 30 83 FE 13 2E 18 38 5B 01 00 40 82 FE 13 
      targetId = 0;                                                             //0109 : 0F 00 B8 82 FE 13 25 
    }
    npcPawn.sv2rel_Chat_CallStub(aText.Id,topicId,targetId,pawnTarget);         //0110 : 19 00 78 7B FE 13 1F 00 00 1B 16 18 00 00 36 D0 C6 6B 0F 00 A8 83 FE 13 00 C8 81 FE 13 00 B8 82 FE 13 00 30 83 FE 13 16 
    //1B FB 72 00 00 77 00 20 79 FE 13 2A 16 1F 4C 6F 63 61 6C 69 7A 65 64 43 68 61 74 3B 20 61 47 61 
    //6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 0F 00 78 7B FE 13 2E 
    //D0 32 5B 01 19 00 20 79 FE 13 05 00 04 01 88 83 6C 0F 1B FB 72 00 00 77 00 20 79 FE 13 2A 16 1F 
    //4C 6F 63 61 6C 69 7A 65 64 43 68 61 74 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 
    //72 20 68 61 73 20 6E 6F 20 4E 50 43 20 50 61 77 6E 00 16 07 C1 00 19 00 50 81 FE 13 08 00 04 61 
    //2F 21 93 07 00 00 16 0F 00 C8 81 FE 13 19 2E 80 62 5B 01 00 50 81 FE 13 06 00 04 1C 08 90 20 11 
    //16 07 F9 00 19 00 40 82 FE 13 08 00 04 61 2F 21 93 07 00 00 16 0F 00 B8 82 FE 13 19 2E 80 62 5B 
    //01 00 40 82 FE 13 06 00 04 1C 08 90 20 11 16 0F 00 30 83 FE 13 2A 06 10 01 0F 00 30 83 FE 13 2E 
    //18 38 5B 01 00 40 82 FE 13 0F 00 B8 82 FE 13 25 19 00 78 7B FE 13 1F 00 00 1B 16 18 00 00 36 D0 
    //C6 6B 0F 00 A8 83 FE 13 00 C8 81 FE 13 00 B8 82 FE 13 00 30 83 FE 13 16 04 0B 47 
  }


  function SetHealth(Game_AIController aGame_AIController,float aNewHealth,optional bool aIsRelative) {
    local Game_Pawn lPawn;
    ScriptAssert(aGame_AIController != None,"SetHealth; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 D0 84 FE 13 2A 16 1F 53 65 74 48 65 61 6C 74 68 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    lPawn = Game_Pawn(aGame_AIController.Pawn);                                 //0035 : 0F 00 90 86 FE 13 2E 18 38 5B 01 19 00 D0 84 FE 13 05 00 04 01 88 83 6C 0F 
    ScriptAssert(lPawn != None,"SetHealth; aGame_AIController Pawn is none");   //004E : 1B FB 72 00 00 77 00 90 86 FE 13 2A 16 1F 53 65 74 48 65 61 6C 74 68 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 50 61 77 6E 20 69 73 20 6E 6F 6E 65 00 16 
    if (aIsRelative) {                                                          //0088 : 07 B9 00 2D 00 08 87 FE 13 
      lPawn.SetHealth(lPawn.GetHealth() + aNewHealth);                          //0091 : 19 00 90 86 FE 13 1C 00 00 1B AC 0F 00 00 AE 19 00 90 86 FE 13 06 00 04 1B 12 10 00 00 16 00 80 87 FE 13 16 16 
    } else {                                                                    //00B6 : 06 CD 00 
      lPawn.SetHealth(aNewHealth);                                              //00B9 : 19 00 90 86 FE 13 0B 00 00 1B AC 0F 00 00 00 80 87 FE 13 16 
    }
    //1B FB 72 00 00 77 00 D0 84 FE 13 2A 16 1F 53 65 74 48 65 61 6C 74 68 3B 20 61 47 61 6D 65 5F 41 
    //49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 0F 00 90 86 FE 13 2E 18 38 5B 01 
    //19 00 D0 84 FE 13 05 00 04 01 88 83 6C 0F 1B FB 72 00 00 77 00 90 86 FE 13 2A 16 1F 53 65 74 48 
    //65 61 6C 74 68 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 50 61 77 6E 20 69 
    //73 20 6E 6F 6E 65 00 16 07 B9 00 2D 00 08 87 FE 13 19 00 90 86 FE 13 1C 00 00 1B AC 0F 00 00 AE 
    //19 00 90 86 FE 13 06 00 04 1B 12 10 00 00 16 00 80 87 FE 13 16 16 06 CD 00 19 00 90 86 FE 13 0B 
    //00 00 1B AC 0F 00 00 00 80 87 FE 13 16 04 0B 47 
  }


  protected function sv_DBQuestProgressSet(bool success,array<DatabaseRow> rows,int auto_increment_id,int affected_rows,int UserData) {
    if (!success) {                                                             //0000 : 07 41 00 81 2D 00 A8 88 FE 13 16 
      Error("DB Quest progress for character"
        @ string(UserData)
        @ "failed");//000B : E9 A8 A8 1F 44 42 20 51 75 65 73 74 20 70 72 6F 67 72 65 73 73 20 66 6F 72 20 63 68 61 72 61 63 74 65 72 00 39 53 00 A8 89 FE 13 16 1F 66 61 69 6C 65 64 00 16 16 
    }
    //07 41 00 81 2D 00 A8 88 FE 13 16 E9 A8 A8 1F 44 42 20 51 75 65 73 74 20 70 72 6F 67 72 65 73 73 
    //20 66 6F 72 20 63 68 61 72 61 63 74 65 72 00 39 53 00 A8 89 FE 13 16 1F 66 61 69 6C 65 64 00 16 
    //16 04 0B 47 
  }


  function SetDBQuestProgress(int aCharacterId,export editinline Quest_Type aQuest,int aObjective,int aProgress) {
    local SBDBAsyncCallback callback;
    ScriptAssert(aCharacterId != 0,"SetQuestProgress; aCharacterId is invalid");//0000 : 1B FB 72 00 00 9B 00 B0 8C FE 13 25 16 1F 53 65 74 51 75 65 73 74 50 72 6F 67 72 65 73 73 3B 20 61 43 68 61 72 61 63 74 65 72 49 64 20 69 73 20 69 6E 76 61 6C 69 64 00 16 
    ScriptAssert(aQuest != None,"SetQuestProgress; Quest_Type is none");        //0039 : 1B FB 72 00 00 77 00 A0 8E FE 13 2A 16 1F 53 65 74 51 75 65 73 74 50 72 6F 67 72 65 73 73 3B 20 51 75 65 73 74 5F 54 79 70 65 20 69 73 20 6E 6F 6E 65 00 16 
    callback.ObjectName = static.GetFName();                                    //006D : 0F 36 D0 01 20 11 00 18 8F FE 13 1C F0 06 6A 0F 16 
    callback.funcName = name("sv_DBQuestProgressSet");                          //007E : 0F 36 48 02 20 11 00 18 8F FE 13 39 5A 1F 73 76 5F 44 42 51 75 65 73 74 50 72 6F 67 72 65 73 73 53 65 74 00 
    callback.UserData = aCharacterId;                                           //00A2 : 0F 36 C0 02 20 11 00 18 8F FE 13 00 B0 8C FE 13 
    Class'SBDBAsync'.SetQuestObjective(None,aCharacterId,aQuest.Targets[aObjective].GetResourceId(),aProgress,callback);//00B2 : 12 20 70 87 24 01 34 00 00 1B 9D 3F 00 00 2A 00 B0 8C FE 13 19 10 00 90 8F FE 13 19 00 A0 8E FE 13 05 00 00 01 08 4D 2E 11 06 00 04 1C 08 90 20 11 16 00 08 90 FE 13 00 18 8F FE 13 16 
    //1B FB 72 00 00 9B 00 B0 8C FE 13 25 16 1F 53 65 74 51 75 65 73 74 50 72 6F 67 72 65 73 73 3B 20 
    //61 43 68 61 72 61 63 74 65 72 49 64 20 69 73 20 69 6E 76 61 6C 69 64 00 16 1B FB 72 00 00 77 00 
    //A0 8E FE 13 2A 16 1F 53 65 74 51 75 65 73 74 50 72 6F 67 72 65 73 73 3B 20 51 75 65 73 74 5F 54 
    //79 70 65 20 69 73 20 6E 6F 6E 65 00 16 0F 36 D0 01 20 11 00 18 8F FE 13 1C F0 06 6A 0F 16 0F 36 
    //48 02 20 11 00 18 8F FE 13 39 5A 1F 73 76 5F 44 42 51 75 65 73 74 50 72 6F 67 72 65 73 73 53 65 
    //74 00 0F 36 C0 02 20 11 00 18 8F FE 13 00 B0 8C FE 13 12 20 70 87 24 01 34 00 00 1B 9D 3F 00 00 
    //2A 00 B0 8C FE 13 19 10 00 90 8F FE 13 19 00 A0 8E FE 13 05 00 00 01 08 4D 2E 11 06 00 04 1C 08 
    //90 20 11 16 00 08 90 FE 13 00 18 8F FE 13 16 04 0B 47 
  }


  function SetQuestProgress(Game_Pawn aPawn,export editinline Quest_Type aQuest,int aObjective,int aProgress,optional Game_Pawn aTargetPawn) {
    local Game_PlayerPawn playerPawn;
    ScriptAssert(aPawn != None,"SetQuestProgress; aPawn is none");              //0000 : 1B FB 72 00 00 77 00 30 91 FE 13 2A 16 1F 53 65 74 51 75 65 73 74 50 72 6F 67 72 65 73 73 3B 20 61 50 61 77 6E 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(aQuest != None,"SetQuestProgress; Quest_Type is none");        //002F : 1B FB 72 00 00 77 00 F0 92 FE 13 2A 16 1F 53 65 74 51 75 65 73 74 50 72 6F 67 72 65 73 73 3B 20 51 75 65 73 74 5F 54 79 70 65 20 69 73 20 6E 6F 6E 65 00 16 
    playerPawn = Game_PlayerPawn(aPawn);                                        //0063 : 0F 00 68 93 FE 13 2E F0 47 5B 01 00 30 91 FE 13 
    if (playerPawn != None) {                                                   //0073 : 07 CD 00 77 00 68 93 FE 13 2A 16 
      if (aObjective < aQuest.Targets.Length) {                                 //007E : 07 CD 00 96 00 E0 93 FE 13 37 19 00 F0 92 FE 13 05 00 00 01 08 4D 2E 11 16 
        playerPawn.questLog.sv_SetTargetProgress(aQuest.Targets[aObjective],aProgress,aTargetPawn);//0097 : 19 19 00 68 93 FE 13 05 00 04 01 F0 2F 7F 0F 24 00 00 1C 20 02 30 11 10 00 E0 93 FE 13 19 00 F0 92 FE 13 05 00 00 01 08 4D 2E 11 00 58 94 FE 13 00 D0 94 FE 13 16 
      }
    }
    //1B FB 72 00 00 77 00 30 91 FE 13 2A 16 1F 53 65 74 51 75 65 73 74 50 72 6F 67 72 65 73 73 3B 20 
    //61 50 61 77 6E 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 77 00 F0 92 FE 13 2A 16 1F 53 65 74 
    //51 75 65 73 74 50 72 6F 67 72 65 73 73 3B 20 51 75 65 73 74 5F 54 79 70 65 20 69 73 20 6E 6F 6E 
    //65 00 16 0F 00 68 93 FE 13 2E F0 47 5B 01 00 30 91 FE 13 07 CD 00 77 00 68 93 FE 13 2A 16 07 CD 
    //00 96 00 E0 93 FE 13 37 19 00 F0 92 FE 13 05 00 00 01 08 4D 2E 11 16 19 19 00 68 93 FE 13 05 00 
    //04 01 F0 2F 7F 0F 24 00 00 1C 20 02 30 11 10 00 E0 93 FE 13 19 00 F0 92 FE 13 05 00 00 01 08 4D 
    //2E 11 00 58 94 FE 13 00 D0 94 FE 13 16 04 0B 47 
  }


  function FireScriptHook(Game_Controller aDestination,name aTag,optional int aNumParam) {
    local name StoreTag;
    ScriptAssert(aDestination != None,"FireScriptHook; aDestination is none");  //0000 : 1B FB 72 00 00 77 00 F8 95 FE 13 2A 16 1F 46 69 72 65 53 63 72 69 70 74 48 6F 6F 6B 3B 20 61 44 65 73 74 69 6E 61 74 69 6F 6E 20 69 73 20 6E 6F 6E 65 00 16 
    StoreTag = Tag;                                                             //0034 : 0F 00 40 97 FE 13 01 C0 9E 6C 0F 
    Tag = aTag;                                                                 //003F : 0F 01 C0 9E 6C 0F 00 B8 97 FE 13 
    aDestination.sv_FireHook(Class'Content_Type'.13,self,aNumParam);            //004A : 19 00 F8 95 FE 13 17 00 00 1B 0D 07 00 00 12 20 80 62 5B 01 02 00 01 24 0D 17 00 30 98 FE 13 16 
    Tag = StoreTag;                                                             //006A : 0F 01 C0 9E 6C 0F 00 40 97 FE 13 
    //1B FB 72 00 00 77 00 F8 95 FE 13 2A 16 1F 46 69 72 65 53 63 72 69 70 74 48 6F 6F 6B 3B 20 61 44 
    //65 73 74 69 6E 61 74 69 6F 6E 20 69 73 20 6E 6F 6E 65 00 16 0F 00 40 97 FE 13 01 C0 9E 6C 0F 0F 
    //01 C0 9E 6C 0F 00 B8 97 FE 13 19 00 F8 95 FE 13 17 00 00 1B 0D 07 00 00 12 20 80 62 5B 01 02 00 
    //01 24 0D 17 00 30 98 FE 13 16 0F 01 C0 9E 6C 0F 00 40 97 FE 13 04 0B 47 
  }


  function FireHook(Game_Controller aDestination,byte aHook,Object aObjParam,int aNumParam) {
    ScriptAssert(aDestination != None,"FireHook; aDestination is none");        //0000 : 1B FB 72 00 00 77 00 58 99 FE 13 2A 16 1F 46 69 72 65 48 6F 6F 6B 3B 20 61 44 65 73 74 69 6E 61 74 69 6F 6E 20 69 73 20 6E 6F 6E 65 00 16 
    aDestination.sv_FireHook(aHook,aObjParam,aNumParam);                        //002E : 19 00 58 99 FE 13 15 00 00 1B 0D 07 00 00 00 68 9A FE 13 00 E0 9A FE 13 00 58 9B FE 13 16 
    //1B FB 72 00 00 77 00 58 99 FE 13 2A 16 1F 46 69 72 65 48 6F 6F 6B 3B 20 61 44 65 73 74 69 6E 61 
    //74 69 6F 6E 20 69 73 20 6E 6F 6E 65 00 16 19 00 58 99 FE 13 15 00 00 1B 0D 07 00 00 00 68 9A FE 
    //13 00 E0 9A FE 13 00 58 9B FE 13 16 04 0B 47 
  }


  function PlayControllerSound(Game_AIController aGame_AIController,string SoundName) {
    local Sound ASound;
    ScriptAssert(aGame_AIController != None,"PlayGame_AIControllerSound; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 80 9C FE 13 2A 16 1F 50 6C 61 79 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 53 6F 75 6E 64 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    ASound = Sound(static.DynamicLoadObject(SoundName,Class'Sound',True));      //0046 : 0F 00 50 9E FE 13 2E 60 9D C2 00 1C 60 E7 69 0F 00 C8 9E FE 13 20 60 9D C2 00 27 16 
    ScriptAssert(ASound != None,"PlayGame_AIControllerSound; provided soundName cannot be found");//0062 : 1B FB 72 00 00 77 00 50 9E FE 13 2A 16 1F 50 6C 61 79 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 53 6F 75 6E 64 3B 20 70 72 6F 76 69 64 65 64 20 73 6F 75 6E 64 4E 61 6D 65 20 63 61 6E 6E 6F 74 20 62 65 20 66 6F 75 6E 64 00 16 
    if (ASound != None) {                                                       //00B0 : 07 D5 00 77 00 50 9E FE 13 2A 16 
      aGame_AIController.Pawn.PlaySound(ASound);                                //00BB : 19 19 00 80 9C FE 13 05 00 04 01 88 83 6C 0F 08 00 00 61 08 00 50 9E FE 13 16 
    }
    //1B FB 72 00 00 77 00 80 9C FE 13 2A 16 1F 50 6C 61 79 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 
    //6C 65 72 53 6F 75 6E 64 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 
    //6E 6F 6E 65 00 16 0F 00 50 9E FE 13 2E 60 9D C2 00 1C 60 E7 69 0F 00 C8 9E FE 13 20 60 9D C2 00 
    //27 16 1B FB 72 00 00 77 00 50 9E FE 13 2A 16 1F 50 6C 61 79 47 61 6D 65 5F 41 49 43 6F 6E 74 72 
    //6F 6C 6C 65 72 53 6F 75 6E 64 3B 20 70 72 6F 76 69 64 65 64 20 73 6F 75 6E 64 4E 61 6D 65 20 63 
    //61 6E 6E 6F 74 20 62 65 20 66 6F 75 6E 64 00 16 07 D5 00 77 00 50 9E FE 13 2A 16 19 19 00 80 9C 
    //FE 13 05 00 04 01 88 83 6C 0F 08 00 00 61 08 00 50 9E FE 13 16 04 0B 47 
  }


  event OnDetach(Game_AIController aController,AIPoint aPoint) {
    Debug("Detached" @ CharName(aController)
      @ "from"
      @ string(aPoint));//0000 : 1B 4B 03 00 00 A8 A8 A8 1F 44 65 74 61 63 68 65 64 00 1B 05 73 00 00 00 F0 9F FE 13 16 16 1F 66 72 6F 6D 00 16 39 56 00 18 A1 FE 13 16 16 
    aController.MetaControllerMessage(5,self);                                  //002E : 19 00 F0 9F FE 13 09 00 04 1B FE 72 00 00 24 05 17 16 
    OnEnd(aController);                                                         //0040 : 1B CB 08 00 00 00 F0 9F FE 13 16 
    Super.OnDetach(aController,aPoint);                                         //004B : 1C 78 D2 FC 13 00 F0 9F FE 13 00 18 A1 FE 13 16 
    //1B 4B 03 00 00 A8 A8 A8 1F 44 65 74 61 63 68 65 64 00 1B 05 73 00 00 00 F0 9F FE 13 16 16 1F 66 
    //72 6F 6D 00 16 39 56 00 18 A1 FE 13 16 16 19 00 F0 9F FE 13 09 00 04 1B FE 72 00 00 24 05 17 16 
    //1B CB 08 00 00 00 F0 9F FE 13 16 1C 78 D2 FC 13 00 F0 9F FE 13 00 18 A1 FE 13 16 04 0B 47 
  }


  event OnAttach(Game_AIController aController,AIPoint aPoint) {
    Super.OnAttach(aController,aPoint);                                         //0000 : 1C 48 D4 FC 13 00 40 A2 FE 13 00 60 A3 FE 13 16 
    OnBegin(aController);                                                       //0010 : 1B BA 08 00 00 00 40 A2 FE 13 16 
    aController.MetaControllerMessage(4,self);                                  //001B : 19 00 40 A2 FE 13 09 00 04 1B FE 72 00 00 24 04 17 16 
    Debug("Attached" @ CharName(aController)
      @ "to"
      @ string(aPoint));//002D : 1B 4B 03 00 00 A8 A8 A8 1F 41 74 74 61 63 68 65 64 00 1B 05 73 00 00 00 40 A2 FE 13 16 16 1F 74 6F 00 16 39 56 00 60 A3 FE 13 16 16 
    //1C 48 D4 FC 13 00 40 A2 FE 13 00 60 A3 FE 13 16 1B BA 08 00 00 00 40 A2 FE 13 16 19 00 40 A2 FE 
    //13 09 00 04 1B FE 72 00 00 24 04 17 16 1B 4B 03 00 00 A8 A8 A8 1F 41 74 74 61 63 68 65 64 00 1B 
    //05 73 00 00 00 40 A2 FE 13 16 16 1F 74 6F 00 16 39 56 00 60 A3 FE 13 16 16 04 0B 47 
  }


  function PlayControllerAnimation(Game_AIController aGame_AIController,byte variation,byte flag1,optional byte flag2,optional byte flag3,optional bool isLooping) {
    ScriptAssert(aGame_AIController != None,"PlayGame_AIControllerAnimation; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 88 A4 FE 13 2A 16 1F 50 6C 61 79 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 41 6E 69 6D 61 74 69 6F 6E 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(aGame_AIController.Pawn != None,"PlayGame_AIControllerAnimation; aGame_AIController has a none pawn");//004A : 1B FB 72 00 00 77 19 00 88 A4 FE 13 05 00 04 01 88 83 6C 0F 2A 16 1F 50 6C 61 79 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 41 6E 69 6D 61 74 69 6F 6E 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 68 61 73 20 61 20 6E 6F 6E 65 20 70 61 77 6E 00 16 
    if (aGame_AIController.Pawn != None) {                                      //00A5 : 07 F0 00 77 19 00 88 A4 FE 13 05 00 04 01 88 83 6C 0F 2A 16 
      Base_Pawn(aGame_AIController.Pawn).sv_ForwardAnimation(flag1,flag2,flag3,variation,isLooping);//00B9 : 19 2E B8 42 24 01 19 00 88 A4 FE 13 05 00 04 01 88 83 6C 0F 20 00 00 1B 19 3F 00 00 00 78 A6 FE 13 00 F0 A6 FE 13 00 68 A7 FE 13 00 E0 A7 FE 13 2D 00 58 A8 FE 13 16 
    }
    //1B FB 72 00 00 77 00 88 A4 FE 13 2A 16 1F 50 6C 61 79 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 
    //6C 65 72 41 6E 69 6D 61 74 69 6F 6E 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 
    //20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 77 19 00 88 A4 FE 13 05 00 04 01 88 83 6C 0F 2A 16 
    //1F 50 6C 61 79 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 41 6E 69 6D 61 74 69 6F 6E 3B 
    //20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 68 61 73 20 61 20 6E 6F 6E 65 20 70 
    //61 77 6E 00 16 07 F0 00 77 19 00 88 A4 FE 13 05 00 04 01 88 83 6C 0F 2A 16 19 2E B8 42 24 01 19 
    //00 88 A4 FE 13 05 00 04 01 88 83 6C 0F 20 00 00 1B 19 3F 00 00 00 78 A6 FE 13 00 F0 A6 FE 13 00 
    //68 A7 FE 13 00 E0 A7 FE 13 2D 00 58 A8 FE 13 16 04 0B 47 
  }


  function AdjustHormone(Game_AIController aGame_AIController,name Hormone,float aRate) {
    if (aRate < -1.00000000) {                                                  //0000 : 07 1A 00 B0 00 A0 AA FE 13 1E 00 00 80 BF 16 
      aRate = -1.00000000;                                                      //000F : 0F 00 A0 AA FE 13 1E 00 00 80 BF 
    }
    if (aRate > 1.00000000) {                                                   //001A : 07 34 00 B1 00 A0 AA FE 13 1E 00 00 80 3F 16 
      aRate = 1.00000000;                                                       //0029 : 0F 00 A0 AA FE 13 1E 00 00 80 3F 
    }
    aGame_AIController.mHypothalamus.AdjustHormone(Hormone,aRate);              //0034 : 19 19 00 80 A9 FE 13 05 00 04 01 B0 53 FC 13 10 00 00 1B 0D 73 00 00 00 18 AB FE 13 00 A0 AA FE 13 16 
    //07 1A 00 B0 00 A0 AA FE 13 1E 00 00 80 BF 16 0F 00 A0 AA FE 13 1E 00 00 80 BF 07 34 00 B1 00 A0 
    //AA FE 13 1E 00 00 80 3F 16 0F 00 A0 AA FE 13 1E 00 00 80 3F 19 19 00 80 A9 FE 13 05 00 04 01 B0 
    //53 FC 13 10 00 00 1B 0D 73 00 00 00 18 AB FE 13 00 A0 AA FE 13 16 04 0B 47 
  }


  function Flee(Game_AIController aGame_AIController) {
    ScriptAssert(aGame_AIController != None,"Flee; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 40 AC FE 13 2A 16 1F 46 6C 65 65 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    aGame_AIController.StateSignal(45);                                         //0030 : 19 00 40 AC FE 13 08 00 00 1B E0 08 00 00 24 2D 16 
    //1B FB 72 00 00 77 00 40 AC FE 13 2A 16 1F 46 6C 65 65 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 
    //72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 19 00 40 AC FE 13 08 00 00 1B E0 08 00 00 24 2D 
    //16 04 0B 47 
  }


  function Patrol(Game_AIController aGame_AIController,AIPoint aFrom) {
    ScriptAssert(aGame_AIController != None,"Patrol; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 F0 AD FE 13 2A 16 1F 50 61 74 72 6F 6C 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(!IsAIPaused(aGame_AIController)
      && !IsAIOff(aGame_AIController),"Patrol; NPC's standard AI is not running");//0032 : 1B FB 72 00 00 82 81 1B FC 72 00 00 00 F0 AD FE 13 16 16 18 0E 00 81 1B FD 72 00 00 00 F0 AD FE 13 16 16 16 1F 50 61 74 72 6F 6C 3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 6E 6F 74 20 72 75 6E 6E 69 6E 67 00 16 
    ScriptAssert(aFrom != None,"Patrol; aFrom is none");                        //0081 : 1B FB 72 00 00 77 00 B0 AF FE 13 2A 16 1F 50 61 74 72 6F 6C 3B 20 61 46 72 6F 6D 20 69 73 20 6E 6F 6E 65 00 16 
    aGame_AIController.SetControlPoint(aFrom);                                  //00A6 : 19 00 F0 AD FE 13 0B 00 00 1B 29 73 00 00 00 B0 AF FE 13 16 
    aGame_AIController.StateSignal(47);                                         //00BA : 19 00 F0 AD FE 13 08 00 00 1B E0 08 00 00 24 2F 16 
    //1B FB 72 00 00 77 00 F0 AD FE 13 2A 16 1F 50 61 74 72 6F 6C 3B 20 61 47 61 6D 65 5F 41 49 43 6F 
    //6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 82 81 1B FC 72 00 00 00 F0 
    //AD FE 13 16 16 18 0E 00 81 1B FD 72 00 00 00 F0 AD FE 13 16 16 16 1F 50 61 74 72 6F 6C 3B 20 4E 
    //50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 6E 6F 74 20 72 75 6E 6E 69 6E 67 00 
    //16 1B FB 72 00 00 77 00 B0 AF FE 13 2A 16 1F 50 61 74 72 6F 6C 3B 20 61 46 72 6F 6D 20 69 73 20 
    //6E 6F 6E 65 00 16 19 00 F0 AD FE 13 0B 00 00 1B 29 73 00 00 00 B0 AF FE 13 16 19 00 F0 AD FE 13 
    //08 00 00 1B E0 08 00 00 24 2F 16 04 0B 47 
  }


  function Aggro(Game_AIController aGame_AIController) {
    ScriptAssert(aGame_AIController != None,"Aggro; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 D8 B0 FE 13 2A 16 1F 41 67 67 72 6F 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(!IsAIPaused(aGame_AIController)
      && !IsAIOff(aGame_AIController),"Aggro; NPC's standard AI is not running");//0031 : 1B FB 72 00 00 82 81 1B FC 72 00 00 00 D8 B0 FE 13 16 16 18 0E 00 81 1B FD 72 00 00 00 D8 B0 FE 13 16 16 16 1F 41 67 67 72 6F 3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 6E 6F 74 20 72 75 6E 6E 69 6E 67 00 16 
    aGame_AIController.StateSignal(43);                                         //007F : 19 00 D8 B0 FE 13 08 00 00 1B E0 08 00 00 24 2B 16 
    //1B FB 72 00 00 77 00 D8 B0 FE 13 2A 16 1F 41 67 67 72 6F 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 
    //74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 82 81 1B FC 72 00 00 00 D8 B0 
    //FE 13 16 16 18 0E 00 81 1B FD 72 00 00 00 D8 B0 FE 13 16 16 16 1F 41 67 67 72 6F 3B 20 4E 50 43 
    //27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 6E 6F 74 20 72 75 6E 6E 69 6E 67 00 16 19 
    //00 D8 B0 FE 13 08 00 00 1B E0 08 00 00 24 2B 16 04 0B 47 
  }


  function ReturnHome(Game_AIController aGame_AIController,optional Vector aReturnLocation) {
    ScriptAssert(aGame_AIController != None,"ReturnHome; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 F8 B2 FE 13 2A 16 1F 52 65 74 75 72 6E 48 6F 6D 65 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(!IsAIPaused(aGame_AIController)
      && !IsAIOff(aGame_AIController),"ReturnHome; NPC's standard AI is not running");//0036 : 1B FB 72 00 00 82 81 1B FC 72 00 00 00 F8 B2 FE 13 16 16 18 0E 00 81 1B FD 72 00 00 00 F8 B2 FE 13 16 16 16 1F 52 65 74 75 72 6E 48 6F 6D 65 3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 6E 6F 74 20 72 75 6E 6E 69 6E 67 00 16 
    if (aReturnLocation != vect(0.000000, 0.000000, 0.000000)) {                //0089 : 07 B4 00 DA 00 70 B3 FE 13 23 00 00 00 00 00 00 00 00 00 00 00 00 16 
      aGame_AIController.SetHomeLocation(aReturnLocation);                      //00A0 : 19 00 F8 B2 FE 13 0B 00 04 1C 08 D9 31 0F 00 70 B3 FE 13 16 
    }
    aGame_AIController.StateSignal(44);                                         //00B4 : 19 00 F8 B2 FE 13 08 00 00 1B E0 08 00 00 24 2C 16 
    //1B FB 72 00 00 77 00 F8 B2 FE 13 2A 16 1F 52 65 74 75 72 6E 48 6F 6D 65 3B 20 61 47 61 6D 65 5F 
    //41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 82 81 1B FC 72 
    //00 00 00 F8 B2 FE 13 16 16 18 0E 00 81 1B FD 72 00 00 00 F8 B2 FE 13 16 16 16 1F 52 65 74 75 72 
    //6E 48 6F 6D 65 3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 6E 6F 74 20 
    //72 75 6E 6E 69 6E 67 00 16 07 B4 00 DA 00 70 B3 FE 13 23 00 00 00 00 00 00 00 00 00 00 00 00 16 
    //19 00 F8 B2 FE 13 0B 00 04 1C 08 D9 31 0F 00 70 B3 FE 13 16 19 00 F8 B2 FE 13 08 00 00 1B E0 08 
    //00 00 24 2C 16 04 0B 47 
  }


  function Idle(Game_AIController aGame_AIController) {
    ScriptAssert(aGame_AIController != None,"Idle; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 98 B4 FE 13 2A 16 1F 49 64 6C 65 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(!IsAIPaused(aGame_AIController)
      && !IsAIOff(aGame_AIController),"Idle; NPC's standard AI is not running");//0030 : 1B FB 72 00 00 82 81 1B FC 72 00 00 00 98 B4 FE 13 16 16 18 0E 00 81 1B FD 72 00 00 00 98 B4 FE 13 16 16 16 1F 49 64 6C 65 3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 6E 6F 74 20 72 75 6E 6E 69 6E 67 00 16 
    aGame_AIController.StateSignal(41);                                         //007D : 19 00 98 B4 FE 13 08 00 00 1B E0 08 00 00 24 29 16 
    //1B FB 72 00 00 77 00 98 B4 FE 13 2A 16 1F 49 64 6C 65 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 
    //72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 82 81 1B FC 72 00 00 00 98 B4 FE 
    //13 16 16 18 0E 00 81 1B FD 72 00 00 00 98 B4 FE 13 16 16 16 1F 49 64 6C 65 3B 20 4E 50 43 27 73 
    //20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 6E 6F 74 20 72 75 6E 6E 69 6E 67 00 16 19 00 98 
    //B4 FE 13 08 00 00 1B E0 08 00 00 24 29 16 04 0B 47 
  }


  function Follow(Game_AIController aGame_AIController,optional float aDistance) {
    ScriptAssert(aGame_AIController != None,"Follow; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 B0 B6 FE 13 2A 16 1F 46 6F 6C 6C 6F 77 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(!IsAIPaused(aGame_AIController)
      && !IsAIOff(aGame_AIController),"Follow; NPC's standard AI is not running");//0032 : 1B FB 72 00 00 82 81 1B FC 72 00 00 00 B0 B6 FE 13 16 16 18 0E 00 81 1B FD 72 00 00 00 B0 B6 FE 13 16 16 16 1F 46 6F 6C 6C 6F 77 3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 6E 6F 74 20 72 75 6E 6E 69 6E 67 00 16 
    if (aDistance > 0.00000000) {                                               //0081 : 07 A4 00 B1 00 50 B8 FE 13 1E 00 00 00 00 16 
      aGame_AIController.FollowRange = aDistance;                               //0090 : 0F 19 00 B0 B6 FE 13 05 00 04 01 98 58 FC 13 00 50 B8 FE 13 
    }
    aGame_AIController.StateSignal(46);                                         //00A4 : 19 00 B0 B6 FE 13 08 00 00 1B E0 08 00 00 24 2E 16 
    //1B FB 72 00 00 77 00 B0 B6 FE 13 2A 16 1F 46 6F 6C 6C 6F 77 3B 20 61 47 61 6D 65 5F 41 49 43 6F 
    //6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 82 81 1B FC 72 00 00 00 B0 
    //B6 FE 13 16 16 18 0E 00 81 1B FD 72 00 00 00 B0 B6 FE 13 16 16 16 1F 46 6F 6C 6C 6F 77 3B 20 4E 
    //50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 6E 6F 74 20 72 75 6E 6E 69 6E 67 00 
    //16 07 A4 00 B1 00 50 B8 FE 13 1E 00 00 00 00 16 0F 19 00 B0 B6 FE 13 05 00 04 01 98 58 FC 13 00 
    //50 B8 FE 13 19 00 B0 B6 FE 13 08 00 00 1B E0 08 00 00 24 2E 16 04 0B 47 
  }


  function EndConversation(Game_AIController aSpeaker,optional Game_Pawn aPartner) {
    ScriptAssert(aSpeaker != None,"EndConversation; aSpeaker is none");         //0000 : 1B FB 72 00 00 77 00 78 B9 FE 13 2A 16 1F 45 6E 64 43 6F 6E 76 65 72 73 61 74 69 6F 6E 3B 20 61 53 70 65 61 6B 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(IsAIPaused(aSpeaker) || IsAIOff(aSpeaker),"EndConversation; NPC's standard AI is still running");//0031 : 1B FB 72 00 00 84 1B FC 72 00 00 00 78 B9 FE 13 16 18 0C 00 1B FD 72 00 00 00 78 B9 FE 13 16 16 1F 45 6E 64 43 6F 6E 76 65 72 73 61 74 69 6F 6E 3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 73 74 69 6C 6C 20 72 75 6E 6E 69 6E 67 00 16 
    if (aPartner != None) {                                                     //0087 : 07 B2 00 77 00 38 BB FE 13 2A 16 
      aSpeaker.ConversationControl.EndConversation(aPartner);                   //0092 : 19 19 00 78 B9 FE 13 05 00 04 01 C8 07 1B 11 0B 00 00 1B 5E 05 00 00 00 38 BB FE 13 16 
    } else {                                                                    //00AF : 06 CA 00 
      aSpeaker.ConversationControl.EndAllConversations();                       //00B2 : 19 19 00 78 B9 FE 13 05 00 04 01 C8 07 1B 11 06 00 00 1B 5D 05 00 00 16 
    }
    //1B FB 72 00 00 77 00 78 B9 FE 13 2A 16 1F 45 6E 64 43 6F 6E 76 65 72 73 61 74 69 6F 6E 3B 20 61 
    //53 70 65 61 6B 65 72 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 84 1B FC 72 00 00 00 78 B9 FE 
    //13 16 18 0C 00 1B FD 72 00 00 00 78 B9 FE 13 16 16 1F 45 6E 64 43 6F 6E 76 65 72 73 61 74 69 6F 
    //6E 3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 73 74 69 6C 6C 20 72 75 
    //6E 6E 69 6E 67 00 16 07 B2 00 77 00 38 BB FE 13 2A 16 19 19 00 78 B9 FE 13 05 00 04 01 C8 07 1B 
    //11 0B 00 00 1B 5E 05 00 00 00 38 BB FE 13 16 06 CA 00 19 19 00 78 B9 FE 13 05 00 04 01 C8 07 1B 
    //11 06 00 00 1B 5D 05 00 00 16 04 0B 47 
  }


  function bool StartConversation(Game_AIController aSpeaker,Game_Pawn aPartner,export editinline Conversation_Topic aTopic) {
    local export editinline Conversation_Topic convTopic;
    local export editinline Conversation_Node convState;
    local Game_Controller partnerController;
    ScriptAssert(IsAIPaused(aSpeaker) || IsAIOff(aSpeaker),"StartConversation; NPC's standard AI is still running");//0000 : 1B FB 72 00 00 84 1B FC 72 00 00 00 60 BC FE 13 16 18 0C 00 1B FD 72 00 00 00 60 BC FE 13 16 16 1F 53 74 61 72 74 43 6F 6E 76 65 72 73 61 74 69 6F 6E 3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 73 74 69 6C 6C 20 72 75 6E 6E 69 6E 67 00 16 
    ScriptAssert(aSpeaker != None,"StartConversation; aSpeaker is none");       //0058 : 1B FB 72 00 00 77 00 60 BC FE 13 2A 16 1F 53 74 61 72 74 43 6F 6E 76 65 72 73 61 74 69 6F 6E 3B 20 61 53 70 65 61 6B 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(aPartner != None,"StartConversation; aPartner is none");       //008B : 1B FB 72 00 00 77 00 30 C1 FE 13 2A 16 1F 53 74 61 72 74 43 6F 6E 76 65 72 73 61 74 69 6F 6E 3B 20 61 50 61 72 74 6E 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    if (aPartner == None) {                                                     //00BE : 07 CB 00 72 00 30 C1 FE 13 2A 16 
      return False;                                                             //00C9 : 04 28 
    }
    partnerController = Game_Controller(aPartner.Controller);                   //00CB : 0F 00 A8 C1 FE 13 2E 10 0E 5B 01 19 00 30 C1 FE 13 05 00 04 01 00 6E 6C 0F 
    ScriptAssert(partnerController != None,"StartConversation; Partner doesn't have a controller");//00E4 : 1B FB 72 00 00 77 00 A8 C1 FE 13 2A 16 1F 53 74 61 72 74 43 6F 6E 76 65 72 73 61 74 69 6F 6E 3B 20 50 61 72 74 6E 65 72 20 64 6F 65 73 6E 27 74 20 68 61 76 65 20 61 20 63 6F 6E 74 72 6F 6C 6C 65 72 00 16 
    if (!aSpeaker.ConversationControl.CanConverse(aPartner)) {                  //0128 : 07 88 01 81 19 19 00 60 BC FE 13 05 00 04 01 C8 07 1B 11 0B 00 04 1C 68 4D 25 11 00 30 C1 FE 13 16 16 
      Warning("StartConversation; AI script: speaker can't converse");          //014A : 1B FF 02 00 00 1F 53 74 61 72 74 43 6F 6E 76 65 72 73 61 74 69 6F 6E 3B 20 41 49 20 73 63 72 69 70 74 3A 20 73 70 65 61 6B 65 72 20 63 61 6E 27 74 20 63 6F 6E 76 65 72 73 65 00 16 
      return False;                                                             //0186 : 04 28 
    }
    if (!partnerController.ConversationControl.CanConverse(Game_Pawn(aSpeaker.Pawn))) {//0188 : 07 F6 01 81 19 19 00 A8 C1 FE 13 05 00 04 01 C8 07 1B 11 19 00 04 1C 68 4D 25 11 2E 18 38 5B 01 19 00 60 BC FE 13 05 00 04 01 88 83 6C 0F 16 16 
      Warning("StartConversation; AI script: partner can't converse");          //01B8 : 1B FF 02 00 00 1F 53 74 61 72 74 43 6F 6E 76 65 72 73 61 74 69 6F 6E 3B 20 41 49 20 73 63 72 69 70 74 3A 20 70 61 72 74 6E 65 72 20 63 61 6E 27 74 20 63 6F 6E 76 65 72 73 65 00 16 
      return False;                                                             //01F4 : 04 28 
    }
    aSpeaker.StateSignal(48);                                                   //01F6 : 19 00 60 BC FE 13 08 00 00 1B E0 08 00 00 24 30 16 
    convTopic = aTopic;                                                         //0207 : 0F 00 20 C2 FE 13 00 98 C2 FE 13 
    ScriptAssert(convTopic != None,"StartConversation; no conversation"
      @ string(aTopic)
      @ "found in Speaker NPC Type");//0212 : 1B FB 72 00 00 77 00 20 C2 FE 13 2A 16 A8 A8 1F 53 74 61 72 74 43 6F 6E 76 65 72 73 61 74 69 6F 6E 3B 20 6E 6F 20 63 6F 6E 76 65 72 73 61 74 69 6F 6E 00 39 56 00 98 C2 FE 13 16 1F 66 6F 75 6E 64 20 69 6E 20 53 70 65 61 6B 65 72 20 4E 50 43 20 54 79 70 65 00 16 16 
    convState = convTopic.CheckConversation(Game_Pawn(aSpeaker.Pawn),aPartner); //026A : 0F 00 10 C3 FE 13 19 00 20 C2 FE 13 1E 00 04 1C 90 B1 24 11 2E 18 38 5B 01 19 00 60 BC FE 13 05 00 04 01 88 83 6C 0F 00 30 C1 FE 13 16 
    if (convState == None) {                                                    //0297 : 07 DF 02 72 00 10 C3 FE 13 2A 16 
      Warning("StartConversation; AI script: nothing to talk about");           //02A2 : 1B FF 02 00 00 1F 53 74 61 72 74 43 6F 6E 76 65 72 73 61 74 69 6F 6E 3B 20 41 49 20 73 63 72 69 70 74 3A 20 6E 6F 74 68 69 6E 67 20 74 6F 20 74 61 6C 6B 20 61 62 6F 75 74 00 16 
      return False;                                                             //02DD : 04 28 
    }
    aSpeaker.ConversationControl.Converse(aPartner,convTopic,convState);        //02DF : 19 19 00 60 BC FE 13 05 00 04 01 C8 07 1B 11 15 00 00 1B 8D 0F 00 00 00 30 C1 FE 13 00 20 C2 FE 13 00 10 C3 FE 13 16 
    return True;                                                                //0306 : 04 27 
    //1B FB 72 00 00 84 1B FC 72 00 00 00 60 BC FE 13 16 18 0C 00 1B FD 72 00 00 00 60 BC FE 13 16 16 
    //1F 53 74 61 72 74 43 6F 6E 76 65 72 73 61 74 69 6F 6E 3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 
    //72 64 20 41 49 20 69 73 20 73 74 69 6C 6C 20 72 75 6E 6E 69 6E 67 00 16 1B FB 72 00 00 77 00 60 
    //BC FE 13 2A 16 1F 53 74 61 72 74 43 6F 6E 76 65 72 73 61 74 69 6F 6E 3B 20 61 53 70 65 61 6B 65 
    //72 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 77 00 30 C1 FE 13 2A 16 1F 53 74 61 72 74 43 6F 
    //6E 76 65 72 73 61 74 69 6F 6E 3B 20 61 50 61 72 74 6E 65 72 20 69 73 20 6E 6F 6E 65 00 16 07 CB 
    //00 72 00 30 C1 FE 13 2A 16 04 28 0F 00 A8 C1 FE 13 2E 10 0E 5B 01 19 00 30 C1 FE 13 05 00 04 01 
    //00 6E 6C 0F 1B FB 72 00 00 77 00 A8 C1 FE 13 2A 16 1F 53 74 61 72 74 43 6F 6E 76 65 72 73 61 74 
    //69 6F 6E 3B 20 50 61 72 74 6E 65 72 20 64 6F 65 73 6E 27 74 20 68 61 76 65 20 61 20 63 6F 6E 74 
    //72 6F 6C 6C 65 72 00 16 07 88 01 81 19 19 00 60 BC FE 13 05 00 04 01 C8 07 1B 11 0B 00 04 1C 68 
    //4D 25 11 00 30 C1 FE 13 16 16 1B FF 02 00 00 1F 53 74 61 72 74 43 6F 6E 76 65 72 73 61 74 69 6F 
    //6E 3B 20 41 49 20 73 63 72 69 70 74 3A 20 73 70 65 61 6B 65 72 20 63 61 6E 27 74 20 63 6F 6E 76 
    //65 72 73 65 00 16 04 28 07 F6 01 81 19 19 00 A8 C1 FE 13 05 00 04 01 C8 07 1B 11 19 00 04 1C 68 
    //4D 25 11 2E 18 38 5B 01 19 00 60 BC FE 13 05 00 04 01 88 83 6C 0F 16 16 1B FF 02 00 00 1F 53 74 
    //61 72 74 43 6F 6E 76 65 72 73 61 74 69 6F 6E 3B 20 41 49 20 73 63 72 69 70 74 3A 20 70 61 72 74 
    //6E 65 72 20 63 61 6E 27 74 20 63 6F 6E 76 65 72 73 65 00 16 04 28 19 00 60 BC FE 13 08 00 00 1B 
    //E0 08 00 00 24 30 16 0F 00 20 C2 FE 13 00 98 C2 FE 13 1B FB 72 00 00 77 00 20 C2 FE 13 2A 16 A8 
    //A8 1F 53 74 61 72 74 43 6F 6E 76 65 72 73 61 74 69 6F 6E 3B 20 6E 6F 20 63 6F 6E 76 65 72 73 61 
    //74 69 6F 6E 00 39 56 00 98 C2 FE 13 16 1F 66 6F 75 6E 64 20 69 6E 20 53 70 65 61 6B 65 72 20 4E 
    //50 43 20 54 79 70 65 00 16 16 0F 00 10 C3 FE 13 19 00 20 C2 FE 13 1E 00 04 1C 90 B1 24 11 2E 18 
    //38 5B 01 19 00 60 BC FE 13 05 00 04 01 88 83 6C 0F 00 30 C1 FE 13 16 07 DF 02 72 00 10 C3 FE 13 
    //2A 16 1B FF 02 00 00 1F 53 74 61 72 74 43 6F 6E 76 65 72 73 61 74 69 6F 6E 3B 20 41 49 20 73 63 
    //72 69 70 74 3A 20 6E 6F 74 68 69 6E 67 20 74 6F 20 74 61 6C 6B 20 61 62 6F 75 74 00 16 04 28 19 
    //19 00 60 BC FE 13 05 00 04 01 C8 07 1B 11 15 00 00 1B 8D 0F 00 00 00 30 C1 FE 13 00 20 C2 FE 13 
    //00 10 C3 FE 13 16 04 27 04 0B 47 
  }


  function bool HasWeaponDrawn(Game_AIController aGame_AIController) {
    local export editinline Game_NPCCombatState combatState;
    ScriptAssert(aGame_AIController != None,"HasWeaponDrawn; Game_AIController is none");//0000 : 1B FB 72 00 00 77 00 B0 C4 FE 13 2A 16 1F 48 61 73 57 65 61 70 6F 6E 44 72 61 77 6E 3B 20 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    combatState = Game_NPCCombatState(Game_Pawn(aGame_AIController.Pawn).combatState);//0039 : 0F 00 40 C6 FE 13 2E 48 33 5F 01 19 2E 18 38 5B 01 19 00 B0 C4 FE 13 05 00 04 01 88 83 6C 0F 05 00 04 01 B8 40 18 11 
    ScriptAssert(combatState != None,"HasWeaponDrawn; NPC has no NPC combat state");//0060 : 1B FB 72 00 00 77 00 40 C6 FE 13 2A 16 1F 48 61 73 57 65 61 70 6F 6E 44 72 61 77 6E 3B 20 4E 50 43 20 68 61 73 20 6E 6F 20 4E 50 43 20 63 6F 6D 62 61 74 20 73 74 61 74 65 00 16 
    return combatState.CombatReady();                                           //009B : 04 19 00 40 C6 FE 13 06 00 04 1B 19 0C 00 00 16 
    //1B FB 72 00 00 77 00 B0 C4 FE 13 2A 16 1F 48 61 73 57 65 61 70 6F 6E 44 72 61 77 6E 3B 20 47 61 
    //6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 0F 00 40 C6 FE 13 2E 
    //48 33 5F 01 19 2E 18 38 5B 01 19 00 B0 C4 FE 13 05 00 04 01 88 83 6C 0F 05 00 04 01 B8 40 18 11 
    //1B FB 72 00 00 77 00 40 C6 FE 13 2A 16 1F 48 61 73 57 65 61 70 6F 6E 44 72 61 77 6E 3B 20 4E 50 
    //43 20 68 61 73 20 6E 6F 20 4E 50 43 20 63 6F 6D 62 61 74 20 73 74 61 74 65 00 16 04 19 00 40 C6 
    //FE 13 06 00 04 1B 19 0C 00 00 16 04 0B 47 
  }


  function bool SheathWeapon(Game_AIController aGame_AIController) {
    local export editinline Game_NPCCombatState combatState;
    ScriptAssert(aGame_AIController != None,"SheathWeapon; Game_AIController is none");//0000 : 1B FB 72 00 00 77 00 E0 C7 FE 13 2A 16 1F 53 68 65 61 74 68 57 65 61 70 6F 6E 3B 20 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(IsAIPaused(aGame_AIController) || IsAIOff(aGame_AIController),"SheathWeapon; NPC's standard AI is still running");//0037 : 1B FB 72 00 00 84 1B FC 72 00 00 00 E0 C7 FE 13 16 18 0C 00 1B FD 72 00 00 00 E0 C7 FE 13 16 16 1F 53 68 65 61 74 68 57 65 61 70 6F 6E 3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 73 74 69 6C 6C 20 72 75 6E 6E 69 6E 67 00 16 
    combatState = Game_NPCCombatState(Game_Pawn(aGame_AIController.Pawn).combatState);//008A : 0F 00 00 CA FE 13 2E 48 33 5F 01 19 2E 18 38 5B 01 19 00 E0 C7 FE 13 05 00 04 01 88 83 6C 0F 05 00 04 01 B8 40 18 11 
    ScriptAssert(combatState != None,"SheathWeapon; NPC has no NPC combat state");//00B1 : 1B FB 72 00 00 77 00 00 CA FE 13 2A 16 1F 53 68 65 61 74 68 57 65 61 70 6F 6E 3B 20 4E 50 43 20 68 61 73 20 6E 6F 20 4E 50 43 20 63 6F 6D 62 61 74 20 73 74 61 74 65 00 16 
    if (!combatState.CombatReady()) {                                           //00EA : 07 03 01 81 19 00 00 CA FE 13 06 00 04 1B 19 0C 00 00 16 16 
      return True;                                                              //00FE : 04 27 
    } else {                                                                    //0100 : 06 13 01 
      return combatState.EnsureIdle();                                          //0103 : 04 19 00 00 CA FE 13 06 00 04 1B 4D 10 00 00 16 
    }
    //1B FB 72 00 00 77 00 E0 C7 FE 13 2A 16 1F 53 68 65 61 74 68 57 65 61 70 6F 6E 3B 20 47 61 6D 65 
    //5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 84 1B FC 72 
    //00 00 00 E0 C7 FE 13 16 18 0C 00 1B FD 72 00 00 00 E0 C7 FE 13 16 16 1F 53 68 65 61 74 68 57 65 
    //61 70 6F 6E 3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 73 74 69 6C 6C 
    //20 72 75 6E 6E 69 6E 67 00 16 0F 00 00 CA FE 13 2E 48 33 5F 01 19 2E 18 38 5B 01 19 00 E0 C7 FE 
    //13 05 00 04 01 88 83 6C 0F 05 00 04 01 B8 40 18 11 1B FB 72 00 00 77 00 00 CA FE 13 2A 16 1F 53 
    //68 65 61 74 68 57 65 61 70 6F 6E 3B 20 4E 50 43 20 68 61 73 20 6E 6F 20 4E 50 43 20 63 6F 6D 62 
    //61 74 20 73 74 61 74 65 00 16 07 03 01 81 19 00 00 CA FE 13 06 00 04 1B 19 0C 00 00 16 16 04 27 
    //06 13 01 04 19 00 00 CA FE 13 06 00 04 1B 4D 10 00 00 16 04 0B 47 
  }


  function bool DrawWeapon(Game_AIController aGame_AIController,optional byte aPreferedMode) {
    local export editinline Game_NPCCombatState combatState;
    ScriptAssert(aGame_AIController != None,"DrawWeapon; Game_AIController is none");//0000 : 1B FB 72 00 00 77 00 A0 CB FE 13 2A 16 1F 44 72 61 77 57 65 61 70 6F 6E 3B 20 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(IsAIPaused(aGame_AIController) || IsAIOff(aGame_AIController),"DrawWeapon; NPC's standard AI is still running");//0035 : 1B FB 72 00 00 84 1B FC 72 00 00 00 A0 CB FE 13 16 18 0C 00 1B FD 72 00 00 00 A0 CB FE 13 16 16 1F 44 72 61 77 57 65 61 70 6F 6E 3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 73 74 69 6C 6C 20 72 75 6E 6E 69 6E 67 00 16 
    combatState = Game_NPCCombatState(Game_Pawn(aGame_AIController.Pawn).combatState);//0086 : 0F 00 D8 CD FE 13 2E 48 33 5F 01 19 2E 18 38 5B 01 19 00 A0 CB FE 13 05 00 04 01 88 83 6C 0F 05 00 04 01 B8 40 18 11 
    ScriptAssert(combatState != None,"DrawWeapon; NPC has no NPC combat state");//00AD : 1B FB 72 00 00 77 00 D8 CD FE 13 2A 16 1F 44 72 61 77 57 65 61 70 6F 6E 3B 20 4E 50 43 20 68 61 73 20 6E 6F 20 4E 50 43 20 63 6F 6D 62 61 74 20 73 74 61 74 65 00 16 
    if (combatState.CombatReady()) {                                            //00E4 : 07 0F 01 19 00 D8 CD FE 13 06 00 04 1B 19 0C 00 00 16 
      combatState.sv_SwitchToMode(aPreferedMode);                               //00F6 : 19 00 D8 CD FE 13 0B 00 04 1B 5E 0C 00 00 00 50 CE FE 13 16 
      return True;                                                              //010A : 04 27 
    } else {                                                                    //010C : 06 24 01 
      return combatState.EnsureCombat(aPreferedMode);                           //010F : 04 19 00 D8 CD FE 13 0B 00 04 1B 4F 10 00 00 00 50 CE FE 13 16 
    }
    //1B FB 72 00 00 77 00 A0 CB FE 13 2A 16 1F 44 72 61 77 57 65 61 70 6F 6E 3B 20 47 61 6D 65 5F 41 
    //49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 84 1B FC 72 00 00 
    //00 A0 CB FE 13 16 18 0C 00 1B FD 72 00 00 00 A0 CB FE 13 16 16 1F 44 72 61 77 57 65 61 70 6F 6E 
    //3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 73 74 69 6C 6C 20 72 75 6E 
    //6E 69 6E 67 00 16 0F 00 D8 CD FE 13 2E 48 33 5F 01 19 2E 18 38 5B 01 19 00 A0 CB FE 13 05 00 04 
    //01 88 83 6C 0F 05 00 04 01 B8 40 18 11 1B FB 72 00 00 77 00 D8 CD FE 13 2A 16 1F 44 72 61 77 57 
    //65 61 70 6F 6E 3B 20 4E 50 43 20 68 61 73 20 6E 6F 20 4E 50 43 20 63 6F 6D 62 61 74 20 73 74 61 
    //74 65 00 16 07 0F 01 19 00 D8 CD FE 13 06 00 04 1B 19 0C 00 00 16 19 00 D8 CD FE 13 0B 00 04 1B 
    //5E 0C 00 00 00 50 CE FE 13 16 04 27 06 24 01 04 19 00 D8 CD FE 13 0B 00 04 1B 4F 10 00 00 00 50 
    //CE FE 13 16 04 0B 47 
  }


  function bool CanPerformSkill(Game_AIController aGame_AIController,export editinline FSkill_Type aSkill) {
    local Game_Pawn pwn;
    ScriptAssert(aGame_AIController != None,"CanPerformSkill; Game_AIController is none");//0000 : 1B FB 72 00 00 77 00 F0 CF FE 13 2A 16 1F 43 61 6E 50 65 72 66 6F 72 6D 53 6B 69 6C 6C 3B 20 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(aSkill != None,"CanPerformSkill; aSkill is none");             //003A : 1B FB 72 00 00 77 00 F8 D1 FE 13 2A 16 1F 43 61 6E 50 65 72 66 6F 72 6D 53 6B 69 6C 6C 3B 20 61 53 6B 69 6C 6C 20 69 73 20 6E 6F 6E 65 00 16 
    pwn = Game_Pawn(aGame_AIController.Pawn);                                   //0069 : 0F 00 70 D2 FE 13 2E 18 38 5B 01 19 00 F0 CF FE 13 05 00 04 01 88 83 6C 0F 
    if (!pwn.combatState.CombatReady()) {                                       //0082 : 07 A4 00 81 19 19 00 70 D2 FE 13 05 00 04 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 16 
      return False;                                                             //009F : 04 28 
    } else {                                                                    //00A1 : 06 03 01 
      if (!pwn.combatState.sv_CanSwitchToWeapon(aSkill.RequiredWeapon)) {       //00A4 : 07 D4 00 81 19 19 00 70 D2 FE 13 05 00 04 01 B8 40 18 11 14 00 04 1B 9A 11 00 00 19 00 F8 D1 FE 13 05 00 01 01 10 B6 20 11 16 16 
        return False;                                                           //00CF : 04 28 
      } else {                                                                  //00D1 : 06 03 01 
        if (pwn.Skills.CanActivateSpecificSkill(aSkill) != 0) {                 //00D4 : 07 01 01 9B 39 3A 19 19 00 70 D2 FE 13 05 00 04 01 08 28 18 11 0B 00 01 1C 30 D4 21 11 00 F8 D1 FE 13 16 39 3A 24 00 16 
          return False;                                                         //00FC : 04 28 
        } else {                                                                //00FE : 06 03 01 
          return True;                                                          //0101 : 04 27 
        }
      }
    }
    //1B FB 72 00 00 77 00 F0 CF FE 13 2A 16 1F 43 61 6E 50 65 72 66 6F 72 6D 53 6B 69 6C 6C 3B 20 47 
    //61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 77 
    //00 F8 D1 FE 13 2A 16 1F 43 61 6E 50 65 72 66 6F 72 6D 53 6B 69 6C 6C 3B 20 61 53 6B 69 6C 6C 20 
    //69 73 20 6E 6F 6E 65 00 16 0F 00 70 D2 FE 13 2E 18 38 5B 01 19 00 F0 CF FE 13 05 00 04 01 88 83 
    //6C 0F 07 A4 00 81 19 19 00 70 D2 FE 13 05 00 04 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 16 04 
    //28 06 03 01 07 D4 00 81 19 19 00 70 D2 FE 13 05 00 04 01 B8 40 18 11 14 00 04 1B 9A 11 00 00 19 
    //00 F8 D1 FE 13 05 00 01 01 10 B6 20 11 16 16 04 28 06 03 01 07 01 01 9B 39 3A 19 19 00 70 D2 FE 
    //13 05 00 04 01 08 28 18 11 0B 00 01 1C 30 D4 21 11 00 F8 D1 FE 13 16 39 3A 24 00 16 04 28 06 03 
    //01 04 27 04 0B 47 
  }


  function PerformSkill(Game_AIController aGame_AIController,export editinline FSkill_Type aSkill,Vector aTarget) {
    local Game_Pawn pwn;
    ScriptAssert(aGame_AIController != None,"PerfomSkill; Game_AIController is none");//0000 : 1B FB 72 00 00 77 00 10 D4 FE 13 2A 16 1F 50 65 72 66 6F 6D 53 6B 69 6C 6C 3B 20 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(aSkill != None,"PerfomSkill; aSkill is none");                 //0036 : 1B FB 72 00 00 77 00 88 D4 FE 13 2A 16 1F 50 65 72 66 6F 6D 53 6B 69 6C 6C 3B 20 61 53 6B 69 6C 6C 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(IsAIPaused(aGame_AIController) || IsAIOff(aGame_AIController),"PerformSkill; NPC's standard AI is still running");//0061 : 1B FB 72 00 00 84 1B FC 72 00 00 00 10 D4 FE 13 16 18 0C 00 1B FD 72 00 00 00 10 D4 FE 13 16 16 1F 50 65 72 66 6F 72 6D 53 6B 69 6C 6C 3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 73 74 69 6C 6C 20 72 75 6E 6E 69 6E 67 00 16 
    pwn = Game_Pawn(aGame_AIController.Pawn);                                   //00B4 : 0F 00 00 D5 FE 13 2E 18 38 5B 01 19 00 10 D4 FE 13 05 00 04 01 88 83 6C 0F 
    if (pwn.Skills.CanActivateSpecificSkill(aSkill) == 0) {                     //00CD : 07 7C 01 9A 39 3A 19 19 00 00 D5 FE 13 05 00 04 01 08 28 18 11 0B 00 01 1C 30 D4 21 11 00 88 D4 FE 13 16 39 3A 24 00 16 
      if (aTarget != vect(0.000000, 0.000000, 0.000000)) {                      //00F5 : 07 48 01 DA 00 78 D5 FE 13 23 00 00 00 00 00 00 00 00 00 00 00 00 16 
        pwn.Skills.ExecuteL(aSkill,aTarget,aGame_AIController.Level.TimeSeconds);//010C : 19 19 00 00 D5 FE 13 05 00 04 01 08 28 18 11 27 00 00 1C F0 C9 21 11 00 88 D4 FE 13 00 78 D5 FE 13 19 19 00 10 D4 FE 13 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 16 
      } else {                                                                  //0145 : 06 7C 01 
        pwn.Skills.Execute(aSkill,aGame_AIController.Level.TimeSeconds);        //0148 : 19 19 00 00 D5 FE 13 05 00 04 01 08 28 18 11 22 00 00 1C A8 CD 21 11 00 88 D4 FE 13 19 19 00 10 D4 FE 13 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 16 
      }
    }
    //1B FB 72 00 00 77 00 10 D4 FE 13 2A 16 1F 50 65 72 66 6F 6D 53 6B 69 6C 6C 3B 20 47 61 6D 65 5F 
    //41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 77 00 88 D4 FE 
    //13 2A 16 1F 50 65 72 66 6F 6D 53 6B 69 6C 6C 3B 20 61 53 6B 69 6C 6C 20 69 73 20 6E 6F 6E 65 00 
    //16 1B FB 72 00 00 84 1B FC 72 00 00 00 10 D4 FE 13 16 18 0C 00 1B FD 72 00 00 00 10 D4 FE 13 16 
    //16 1F 50 65 72 66 6F 72 6D 53 6B 69 6C 6C 3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 
    //49 20 69 73 20 73 74 69 6C 6C 20 72 75 6E 6E 69 6E 67 00 16 0F 00 00 D5 FE 13 2E 18 38 5B 01 19 
    //00 10 D4 FE 13 05 00 04 01 88 83 6C 0F 07 7C 01 9A 39 3A 19 19 00 00 D5 FE 13 05 00 04 01 08 28 
    //18 11 0B 00 01 1C 30 D4 21 11 00 88 D4 FE 13 16 39 3A 24 00 16 07 48 01 DA 00 78 D5 FE 13 23 00 
    //00 00 00 00 00 00 00 00 00 00 00 16 19 19 00 00 D5 FE 13 05 00 04 01 08 28 18 11 27 00 00 1C F0 
    //C9 21 11 00 88 D4 FE 13 00 78 D5 FE 13 19 19 00 10 D4 FE 13 05 00 04 01 D8 7E 6C 0F 05 00 04 01 
    //A8 81 6C 0F 16 06 7C 01 19 19 00 00 D5 FE 13 05 00 04 01 08 28 18 11 22 00 00 1C A8 CD 21 11 00 
    //88 D4 FE 13 19 19 00 10 D4 FE 13 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 16 04 0B 47 
  }


  function LookAt(Game_AIController aGame_AIController,Vector Target) {
    ScriptAssert(aGame_AIController != None,"LookAt; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 A0 D6 FE 13 2A 16 1F 4C 6F 6F 6B 41 74 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(IsAIPaused(aGame_AIController) || IsAIOff(aGame_AIController),"LookAt; NPC's standard AI is still running");//0032 : 1B FB 72 00 00 84 1B FC 72 00 00 00 A0 D6 FE 13 16 18 0C 00 1B FD 72 00 00 00 A0 D6 FE 13 16 16 1F 4C 6F 6F 6B 41 74 3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 73 74 69 6C 6C 20 72 75 6E 6E 69 6E 67 00 16 
    aGame_AIController.mTargeting.SetLocation(Target);                          //007F : 19 19 00 A0 D6 FE 13 05 00 04 01 30 55 32 0F 0B 00 00 1B A6 2F 00 00 00 20 D8 FE 13 16 
    //1B FB 72 00 00 77 00 A0 D6 FE 13 2A 16 1F 4C 6F 6F 6B 41 74 3B 20 61 47 61 6D 65 5F 41 49 43 6F 
    //6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 84 1B FC 72 00 00 00 A0 D6 
    //FE 13 16 18 0C 00 1B FD 72 00 00 00 A0 D6 FE 13 16 16 1F 4C 6F 6F 6B 41 74 3B 20 4E 50 43 27 73 
    //20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 73 74 69 6C 6C 20 72 75 6E 6E 69 6E 67 00 16 19 
    //19 00 A0 D6 FE 13 05 00 04 01 30 55 32 0F 0B 00 00 1B A6 2F 00 00 00 20 D8 FE 13 16 04 0B 47 
  }


  function bool IsDetecting(Game_AIController aGame_AIController) {
    ScriptAssert(aGame_AIController != None,"IsDetecting; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 48 D9 FE 13 2A 16 1F 49 73 44 65 74 65 63 74 69 6E 67 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    return aGame_AIController.mTargeting.IsDetecting();                         //0037 : 04 19 19 00 48 D9 FE 13 05 00 04 01 30 55 32 0F 06 00 04 1B 0E 73 00 00 16 
    //1B FB 72 00 00 77 00 48 D9 FE 13 2A 16 1F 49 73 44 65 74 65 63 74 69 6E 67 3B 20 61 47 61 6D 65 
    //5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 04 19 19 00 48 D9 FE 13 05 
    //00 04 01 30 55 32 0F 06 00 04 1B 0E 73 00 00 16 04 0B 47 
  }


  function SetDetection(Game_AIController aGame_AIController,bool aOnOff) {
    ScriptAssert(aGame_AIController != None,"SetDetection; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 A0 7C FE 13 2A 16 1F 53 65 74 44 65 74 65 63 74 69 6F 6E 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    aGame_AIController.mTargeting.SetDetection(aOnOff);                         //0038 : 19 19 00 A0 7C FE 13 05 00 04 01 30 55 32 0F 0C 00 00 1B 0F 73 00 00 2D 00 C0 7D FE 13 16 
    //1B FB 72 00 00 77 00 A0 7C FE 13 2A 16 1F 53 65 74 44 65 74 65 63 74 69 6F 6E 3B 20 61 47 61 6D 
    //65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 19 19 00 A0 7C FE 13 05 
    //00 04 01 30 55 32 0F 0C 00 00 1B 0F 73 00 00 2D 00 C0 7D FE 13 16 04 0B 47 
  }


  function SetTarget(Game_AIController aGame_AIController,Actor aTarget) {
    ScriptAssert(aGame_AIController != None,"SetTarget; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 E8 7E FE 13 2A 16 1F 53 65 74 54 61 72 67 65 74 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(aTarget != None,"SetTarget; aTarget is none");                 //0035 : 1B FB 72 00 00 77 00 D8 80 FE 13 2A 16 1F 53 65 74 54 61 72 67 65 74 3B 20 61 54 61 72 67 65 74 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(IsAIPaused(aGame_AIController) || IsAIOff(aGame_AIController),"SetTarget; NPC's standard AI is still running");//005F : 1B FB 72 00 00 84 1B FC 72 00 00 00 E8 7E FE 13 16 18 0C 00 1B FD 72 00 00 00 E8 7E FE 13 16 16 1F 53 65 74 54 61 72 67 65 74 3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 73 74 69 6C 6C 20 72 75 6E 6E 69 6E 67 00 16 
    if (aTarget != None) {                                                      //00AF : 07 DA 00 77 00 D8 80 FE 13 2A 16 
      aGame_AIController.mTargeting.SetActor(aTarget);                          //00BA : 19 19 00 E8 7E FE 13 05 00 04 01 30 55 32 0F 0B 00 00 1B 2D 73 00 00 00 D8 80 FE 13 16 
    } else {                                                                    //00D7 : 06 F2 00 
      aGame_AIController.mTargeting.SetDisabled();                              //00DA : 19 19 00 E8 7E FE 13 05 00 04 01 30 55 32 0F 06 00 00 1B EC 6F 00 00 16 
    }
    //1B FB 72 00 00 77 00 E8 7E FE 13 2A 16 1F 53 65 74 54 61 72 67 65 74 3B 20 61 47 61 6D 65 5F 41 
    //49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 77 00 D8 80 FE 13 
    //2A 16 1F 53 65 74 54 61 72 67 65 74 3B 20 61 54 61 72 67 65 74 20 69 73 20 6E 6F 6E 65 00 16 1B 
    //FB 72 00 00 84 1B FC 72 00 00 00 E8 7E FE 13 16 18 0C 00 1B FD 72 00 00 00 E8 7E FE 13 16 16 1F 
    //53 65 74 54 61 72 67 65 74 3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 
    //73 74 69 6C 6C 20 72 75 6E 6E 69 6E 67 00 16 07 DA 00 77 00 D8 80 FE 13 2A 16 19 19 00 E8 7E FE 
    //13 05 00 04 01 30 55 32 0F 0B 00 00 1B 2D 73 00 00 00 D8 80 FE 13 16 06 F2 00 19 19 00 E8 7E FE 
    //13 05 00 04 01 30 55 32 0F 06 00 00 1B EC 6F 00 00 16 04 0B 47 
  }


  function bool IsMoving(Game_AIController aGame_AIController) {
    ScriptAssert(aGame_AIController != None,"IsMoving; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 70 E3 FE 13 2A 16 1F 49 73 4D 6F 76 69 6E 67 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    return aGame_AIController.mMovement.MoveMode != 0;                          //0034 : 04 9B 39 3A 19 19 00 70 E3 FE 13 05 00 04 01 38 53 FC 13 05 00 01 01 B8 65 FD 13 39 3A 24 00 16 
    //1B FB 72 00 00 77 00 70 E3 FE 13 2A 16 1F 49 73 4D 6F 76 69 6E 67 3B 20 61 47 61 6D 65 5F 41 49 
    //43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 04 9B 39 3A 19 19 00 70 E3 FE 13 05 
    //00 04 01 38 53 FC 13 05 00 01 01 B8 65 FD 13 39 3A 24 00 16 04 0B 47 
  }


  function StopMovement(Game_AIController aGame_AIController) {
    ScriptAssert(aGame_AIController != None,"StopMovement; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 B0 E5 FE 13 2A 16 1F 53 74 6F 70 4D 6F 76 65 6D 65 6E 74 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(IsAIPaused(aGame_AIController) || IsAIOff(aGame_AIController),"StopMovement; NPC's standard AI is still running");//0038 : 1B FB 72 00 00 84 1B FC 72 00 00 00 B0 E5 FE 13 16 18 0C 00 1B FD 72 00 00 00 B0 E5 FE 13 16 16 1F 53 74 6F 70 4D 6F 76 65 6D 65 6E 74 3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 73 74 69 6C 6C 20 72 75 6E 6E 69 6E 67 00 16 
    aGame_AIController.mMovement.NoMovement();                                  //008B : 19 19 00 B0 E5 FE 13 05 00 04 01 38 53 FC 13 06 00 00 1B 2E 73 00 00 16 
    //1B FB 72 00 00 77 00 B0 E5 FE 13 2A 16 1F 53 74 6F 70 4D 6F 76 65 6D 65 6E 74 3B 20 61 47 61 6D 
    //65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 84 1B FC 
    //72 00 00 00 B0 E5 FE 13 16 18 0C 00 1B FD 72 00 00 00 B0 E5 FE 13 16 16 1F 53 74 6F 70 4D 6F 76 
    //65 6D 65 6E 74 3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 73 74 69 6C 
    //6C 20 72 75 6E 6E 69 6E 67 00 16 19 19 00 B0 E5 FE 13 05 00 04 01 38 53 FC 13 06 00 00 1B 2E 73 
    //00 00 16 04 0B 47 
  }


  function bool Teleport(Game_AIController aGame_AIController,Vector aLocation,float aRadius) {
    local Vector loc;
    local Game_Pawn pwn;
    local Vector OldLocation;
    ScriptAssert(aGame_AIController != None,"Teleport; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 E8 E7 FE 13 2A 16 1F 54 65 6C 65 70 6F 72 74 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(IsAIPaused(aGame_AIController) || IsAIOff(aGame_AIController),"Teleport; NPC's standard AI is still running");//0034 : 1B FB 72 00 00 84 1B FC 72 00 00 00 E8 E7 FE 13 16 18 0C 00 1B FD 72 00 00 00 E8 E7 FE 13 16 16 1F 54 65 6C 65 70 6F 72 74 3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 73 74 69 6C 6C 20 72 75 6E 6E 69 6E 67 00 16 
    pwn = Game_Pawn(aGame_AIController.Pawn);                                   //0083 : 0F 00 78 EA FE 13 2E 18 38 5B 01 19 00 E8 E7 FE 13 05 00 04 01 88 83 6C 0F 
    if (pwn != None) {                                                          //009C : 07 62 01 77 00 78 EA FE 13 2A 16 
      OldLocation = pwn.Location;                                               //00A7 : 0F 00 F0 EA FE 13 19 00 78 EA FE 13 05 00 0C 01 30 81 6C 0F 
      pwn.SetLocation(aLocation);                                               //00BB : 19 00 78 EA FE 13 08 00 04 61 0B 00 68 EB FE 13 16 
      loc = Class'Content_API'.RandomRadiusLocation(pwn,aRadius,aRadius,True,pwn.GetCollisionExtent(),pwn.IsGrounded());//00CC : 0F 00 E0 EB FE 13 12 20 40 5D 5B 01 34 00 0C 1B 6E 10 00 00 00 78 EA FE 13 00 58 EC FE 13 00 58 EC FE 13 27 19 00 78 EA FE 13 06 00 0C 1B 9C 2B 00 00 16 19 00 78 EA FE 13 06 00 04 1B 90 0F 00 00 16 16 
      if (loc != vect(0.000000, 0.000000, 0.000000)) {                          //010F : 07 4C 01 DA 00 E0 EB FE 13 23 00 00 00 00 00 00 00 00 00 00 00 00 16 
        return pwn.sv_TeleportTo(loc,pwn.DesiredRotation);                      //0126 : 04 19 00 78 EA FE 13 19 00 04 1B 4A 07 00 00 00 E0 EB FE 13 19 00 78 EA FE 13 05 00 0C 01 D0 E8 6E 0F 16 
      } else {                                                                  //0149 : 06 5F 01 
        pwn.SetLocation(OldLocation);                                           //014C : 19 00 78 EA FE 13 08 00 04 61 0B 00 F0 EA FE 13 16 
        return False;                                                           //015D : 04 28 
      }
    } else {                                                                    //015F : 06 64 01 
      return False;                                                             //0162 : 04 28 
    }
    //1B FB 72 00 00 77 00 E8 E7 FE 13 2A 16 1F 54 65 6C 65 70 6F 72 74 3B 20 61 47 61 6D 65 5F 41 49 
    //43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 84 1B FC 72 00 00 00 
    //E8 E7 FE 13 16 18 0C 00 1B FD 72 00 00 00 E8 E7 FE 13 16 16 1F 54 65 6C 65 70 6F 72 74 3B 20 4E 
    //50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 73 74 69 6C 6C 20 72 75 6E 6E 69 6E 
    //67 00 16 0F 00 78 EA FE 13 2E 18 38 5B 01 19 00 E8 E7 FE 13 05 00 04 01 88 83 6C 0F 07 62 01 77 
    //00 78 EA FE 13 2A 16 0F 00 F0 EA FE 13 19 00 78 EA FE 13 05 00 0C 01 30 81 6C 0F 19 00 78 EA FE 
    //13 08 00 04 61 0B 00 68 EB FE 13 16 0F 00 E0 EB FE 13 12 20 40 5D 5B 01 34 00 0C 1B 6E 10 00 00 
    //00 78 EA FE 13 00 58 EC FE 13 00 58 EC FE 13 27 19 00 78 EA FE 13 06 00 0C 1B 9C 2B 00 00 16 19 
    //00 78 EA FE 13 06 00 04 1B 90 0F 00 00 16 16 07 4C 01 DA 00 E0 EB FE 13 23 00 00 00 00 00 00 00 
    //00 00 00 00 00 16 04 19 00 78 EA FE 13 19 00 04 1B 4A 07 00 00 00 E0 EB FE 13 19 00 78 EA FE 13 
    //05 00 0C 01 D0 E8 6E 0F 16 06 5F 01 19 00 78 EA FE 13 08 00 04 61 0B 00 F0 EA FE 13 16 04 28 06 
    //64 01 04 28 04 0B 47 
  }


  function SetControllerLocation(Game_AIController aGame_AIController,Vector NewLocation) {
    local Game_Pawn pwn;
    ScriptAssert(aGame_AIController != None,"SetLocation; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 F8 ED FE 13 2A 16 1F 53 65 74 4C 6F 63 61 74 69 6F 6E 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(IsAIPaused(aGame_AIController) || IsAIOff(aGame_AIController),"SetControllerLocation; NPC's standard AI is still running");//0037 : 1B FB 72 00 00 84 1B FC 72 00 00 00 F8 ED FE 13 16 18 0C 00 1B FD 72 00 00 00 F8 ED FE 13 16 16 1F 53 65 74 43 6F 6E 74 72 6F 6C 6C 65 72 4C 6F 63 61 74 69 6F 6E 3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 73 74 69 6C 6C 20 72 75 6E 6E 69 6E 67 00 16 
    pwn = Game_Pawn(aGame_AIController.Pawn);                                   //0093 : 0F 00 F0 EF FE 13 2E 18 38 5B 01 19 00 F8 ED FE 13 05 00 04 01 88 83 6C 0F 
    if (pwn != None) {                                                          //00AC : 07 F3 00 77 00 F0 EF FE 13 2A 16 
      aGame_AIController.SetLocation(NewLocation);                              //00B7 : 19 00 F8 ED FE 13 08 00 04 61 0B 00 68 F0 FE 13 16 
      pwn.sv_TeleportTo(NewLocation,aGame_AIController.Pawn.DesiredRotation);   //00C8 : 19 00 F0 EF FE 13 22 00 04 1B 4A 07 00 00 00 68 F0 FE 13 19 19 00 F8 ED FE 13 05 00 04 01 88 83 6C 0F 05 00 0C 01 D0 E8 6E 0F 16 
    }
    //1B FB 72 00 00 77 00 F8 ED FE 13 2A 16 1F 53 65 74 4C 6F 63 61 74 69 6F 6E 3B 20 61 47 61 6D 65 
    //5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 84 1B FC 72 
    //00 00 00 F8 ED FE 13 16 18 0C 00 1B FD 72 00 00 00 F8 ED FE 13 16 16 1F 53 65 74 43 6F 6E 74 72 
    //6F 6C 6C 65 72 4C 6F 63 61 74 69 6F 6E 3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 
    //20 69 73 20 73 74 69 6C 6C 20 72 75 6E 6E 69 6E 67 00 16 0F 00 F0 EF FE 13 2E 18 38 5B 01 19 00 
    //F8 ED FE 13 05 00 04 01 88 83 6C 0F 07 F3 00 77 00 F0 EF FE 13 2A 16 19 00 F8 ED FE 13 08 00 04 
    //61 0B 00 68 F0 FE 13 16 19 00 F0 EF FE 13 22 00 04 1B 4A 07 00 00 00 68 F0 FE 13 19 19 00 F8 ED 
    //FE 13 05 00 04 01 88 83 6C 0F 05 00 0C 01 D0 E8 6E 0F 16 04 0B 47 
  }


  native function bool SetTouching(Game_AIController aGame_AIController,bool aTouch);


  function MoveTo(Game_AIController aGame_AIController,Vector aLocation,optional float aRange) {
    ScriptAssert(aGame_AIController != None,"MoveTo; aGame_AIController is none");//0000 : 1B FB 72 00 00 77 00 E0 F3 FE 13 2A 16 1F 4D 6F 76 65 54 6F 3B 20 61 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    ScriptAssert(IsAIPaused(aGame_AIController) || IsAIOff(aGame_AIController),"MoveTo; NPC's standard AI is still running");//0032 : 1B FB 72 00 00 84 1B FC 72 00 00 00 E0 F3 FE 13 16 18 0C 00 1B FD 72 00 00 00 E0 F3 FE 13 16 16 1F 4D 6F 76 65 54 6F 3B 20 4E 50 43 27 73 20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 73 74 69 6C 6C 20 72 75 6E 6E 69 6E 67 00 16 
    if (aGame_AIController != None) {                                           //007F : 07 DB 00 77 00 E0 F3 FE 13 2A 16 
      if (aRange <= 0.00000000) {                                               //008A : 07 B9 00 B2 00 58 F4 FE 13 1E 00 00 00 00 16 
        aGame_AIController.mMovement.MoveTo(aLocation);                         //0099 : 19 19 00 E0 F3 FE 13 05 00 04 01 38 53 FC 13 0B 00 00 1B 0A 33 00 00 00 D0 F4 FE 13 16 
      } else {                                                                  //00B6 : 06 DB 00 
        aGame_AIController.mMovement.Approach(aLocation,aRange);                //00B9 : 19 19 00 E0 F3 FE 13 05 00 04 01 38 53 FC 13 10 00 00 1B 2F 73 00 00 00 D0 F4 FE 13 00 58 F4 FE 13 16 
      }
    }
    //1B FB 72 00 00 77 00 E0 F3 FE 13 2A 16 1F 4D 6F 76 65 54 6F 3B 20 61 47 61 6D 65 5F 41 49 43 6F 
    //6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 1B FB 72 00 00 84 1B FC 72 00 00 00 E0 F3 
    //FE 13 16 18 0C 00 1B FD 72 00 00 00 E0 F3 FE 13 16 16 1F 4D 6F 76 65 54 6F 3B 20 4E 50 43 27 73 
    //20 73 74 61 6E 64 61 72 64 20 41 49 20 69 73 20 73 74 69 6C 6C 20 72 75 6E 6E 69 6E 67 00 16 07 
    //DB 00 77 00 E0 F3 FE 13 2A 16 07 B9 00 B2 00 58 F4 FE 13 1E 00 00 00 00 16 19 19 00 E0 F3 FE 13 
    //05 00 04 01 38 53 FC 13 0B 00 00 1B 0A 33 00 00 00 D0 F4 FE 13 16 06 DB 00 19 19 00 E0 F3 FE 13 
    //05 00 04 01 38 53 FC 13 10 00 00 1B 2F 73 00 00 00 D0 F4 FE 13 00 58 F4 FE 13 16 04 0B 47 
  }


  function bool InAIState(Game_AIController aController,name StateClass) {
    ScriptAssert(aController != None,"InAIState; Game_AIController is none");   //0000 : 1B FB 72 00 00 77 00 F8 F5 FE 13 2A 16 1F 49 6E 41 49 53 74 61 74 65 3B 20 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    if (aController.mStateMachine != None) {                                    //0034 : 07 70 00 77 19 00 F8 F5 FE 13 05 00 04 01 D8 54 FC 13 2A 16 
      if (aController.mStateMachine.mCurrentState.IsA(StateClass)) {            //0048 : 07 70 00 19 19 19 00 F8 F5 FE 13 05 00 04 01 D8 54 FC 13 05 00 04 01 A0 D9 FC 13 08 00 04 61 2F 00 38 F7 FE 13 16 
        return True;                                                            //006E : 04 27 
      }
    }
    return False;                                                               //0070 : 04 28 
    //1B FB 72 00 00 77 00 F8 F5 FE 13 2A 16 1F 49 6E 41 49 53 74 61 74 65 3B 20 47 61 6D 65 5F 41 49 
    //43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 07 70 00 77 19 00 F8 F5 FE 13 05 00 
    //04 01 D8 54 FC 13 2A 16 07 70 00 19 19 19 00 F8 F5 FE 13 05 00 04 01 D8 54 FC 13 05 00 04 01 A0 
    //D9 FC 13 08 00 04 61 2F 00 38 F7 FE 13 16 04 27 04 28 04 0B 47 
  }


  function bool IsAIOff(Game_AIController aController) {
    ScriptAssert(aController != None,"IsAIOff; Game_AIController is none");     //0000 : 1B FB 72 00 00 77 00 D8 F8 FE 13 2A 16 1F 49 73 41 49 4F 66 66 3B 20 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    return aController.mAbortedMachine == None
      && aController.mStateMachine == None;//0032 : 04 82 72 19 00 D8 F8 FE 13 05 00 04 01 58 5C FC 13 2A 16 18 12 00 72 19 00 D8 F8 FE 13 05 00 04 01 D8 54 FC 13 2A 16 16 
    //1B FB 72 00 00 77 00 D8 F8 FE 13 2A 16 1F 49 73 41 49 4F 66 66 3B 20 47 61 6D 65 5F 41 49 43 6F 
    //6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 04 82 72 19 00 D8 F8 FE 13 05 00 04 01 58 
    //5C FC 13 2A 16 18 12 00 72 19 00 D8 F8 FE 13 05 00 04 01 D8 54 FC 13 2A 16 16 04 0B 47 
  }


  function bool IsAIPaused(Game_AIController aController) {
    ScriptAssert(aController != None,"IsAIPaused; Game_AIController is none");  //0000 : 1B FB 72 00 00 77 00 20 FB FE 13 2A 16 1F 49 73 41 49 50 61 75 73 65 64 3B 20 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    if (aController != None) {                                                  //0035 : 07 53 00 77 00 20 FB FE 13 2A 16 
      return aController.IsAIPaused();                                          //0040 : 04 19 00 20 FB FE 13 06 00 04 1B FC 72 00 00 16 
    } else {                                                                    //0050 : 06 55 00 
      return False;                                                             //0053 : 04 28 
    }
    //1B FB 72 00 00 77 00 20 FB FE 13 2A 16 1F 49 73 41 49 50 61 75 73 65 64 3B 20 47 61 6D 65 5F 41 
    //49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 07 53 00 77 00 20 FB FE 13 2A 16 
    //04 19 00 20 FB FE 13 06 00 04 1B FC 72 00 00 16 06 55 00 04 28 04 0B 47 
  }


  function bool HasPausedAI(Game_AIController aController) {
    ScriptAssert(aController != None,"HasPausedAI; Game_AIController is none"); //0000 : 1B FB 72 00 00 77 00 68 FD FE 13 2A 16 1F 48 61 73 50 61 75 73 65 64 41 49 3B 20 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    if (aController != None) {                                                  //0036 : 07 55 00 77 00 68 FD FE 13 2A 16 
      return aController.IsAIPausedBy(self);                                    //0041 : 04 19 00 68 FD FE 13 07 00 04 1B 2C 73 00 00 17 16 
    } else {                                                                    //0052 : 06 57 00 
      return False;                                                             //0055 : 04 28 
    }
    //1B FB 72 00 00 77 00 68 FD FE 13 2A 16 1F 48 61 73 50 61 75 73 65 64 41 49 3B 20 47 61 6D 65 5F 
    //41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 07 55 00 77 00 68 FD FE 13 2A 
    //16 04 19 00 68 FD FE 13 07 00 04 1B 2C 73 00 00 17 16 06 57 00 04 28 04 0B 47 
  }


  function ContinueAI(Game_AIController aController) {
    ScriptAssert(aController != None,"ContinueAI; Game_AIController is none");  //0000 : 1B FB 72 00 00 77 00 B0 FF FE 13 2A 16 1F 43 6F 6E 74 69 6E 75 65 41 49 3B 20 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    Debug("continued AI for" @ string(aController));                            //0035 : 1B 4B 03 00 00 A8 1F 63 6F 6E 74 69 6E 75 65 64 20 41 49 20 66 6F 72 00 39 56 00 B0 FF FE 13 16 16 
    if (aController != None) {                                                  //0056 : 07 71 00 77 00 B0 FF FE 13 2A 16 
      aController.ContinueAI(self);                                             //0061 : 19 00 B0 FF FE 13 07 00 00 1B 06 73 00 00 17 16 
    }
    //1B FB 72 00 00 77 00 B0 FF FE 13 2A 16 1F 43 6F 6E 74 69 6E 75 65 41 49 3B 20 47 61 6D 65 5F 41 
    //49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 1B 4B 03 00 00 A8 1F 63 6F 6E 74 
    //69 6E 75 65 64 20 41 49 20 66 6F 72 00 39 56 00 B0 FF FE 13 16 16 07 71 00 77 00 B0 FF FE 13 2A 
    //16 19 00 B0 FF FE 13 07 00 00 1B 06 73 00 00 17 16 04 0B 47 
  }


  function PauseAI(Game_AIController aController) {
    ScriptAssert(aController != None,"PauseAI; Game_AIController is none");     //0000 : 1B FB 72 00 00 77 00 A0 01 FF 13 2A 16 1F 50 61 75 73 65 41 49 3B 20 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    Debug("pause AI for" @ string(aController));                                //0032 : 1B 4B 03 00 00 A8 1F 70 61 75 73 65 20 41 49 20 66 6F 72 00 39 56 00 A0 01 FF 13 16 16 
    if (aController != None) {                                                  //004F : 07 6A 00 77 00 A0 01 FF 13 2A 16 
      aController.PauseAI(self);                                                //005A : 19 00 A0 01 FF 13 07 00 00 1B 08 73 00 00 17 16 
    }
    //1B FB 72 00 00 77 00 A0 01 FF 13 2A 16 1F 50 61 75 73 65 41 49 3B 20 47 61 6D 65 5F 41 49 43 6F 
    //6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 1B 4B 03 00 00 A8 1F 70 61 75 73 65 20 41 
    //49 20 66 6F 72 00 39 56 00 A0 01 FF 13 16 16 07 6A 00 77 00 A0 01 FF 13 2A 16 19 00 A0 01 FF 13 
    //07 00 00 1B 08 73 00 00 17 16 04 0B 47 
  }


  function AIStateMachine SwapStateMachine(Game_AIController aController,AIStateMachine aNewMachine) {
    ScriptAssert(aController != None,"SwapStateMachine; Game_AIController is none");//0000 : 1B FB 72 00 00 77 00 88 03 FF 13 2A 16 1F 53 77 61 70 53 74 61 74 65 4D 61 63 68 69 6E 65 3B 20 47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 
    return aController.SetStateMachine(aNewMachine);                            //003B : 04 19 00 88 03 FF 13 0B 00 04 1B 0A 73 00 00 00 A0 04 FF 13 16 
    //1B FB 72 00 00 77 00 88 03 FF 13 2A 16 1F 53 77 61 70 53 74 61 74 65 4D 61 63 68 69 6E 65 3B 20 
    //47 61 6D 65 5F 41 49 43 6F 6E 74 72 6F 6C 6C 65 72 20 69 73 20 6E 6F 6E 65 00 16 04 19 00 88 03 
    //FF 13 0B 00 04 1B 0A 73 00 00 00 A0 04 FF 13 16 04 0B 47 
  }


  protected native function AI_Script SpawnScript(class<AI_Script> SpawnClass);


  protected event AutoFix() {
    //04 0B 47 
  }


  protected event GetActorRelations(out array<ActorRelation> oRelations) {
    local ActorRelation newRelation;
    if (NextScript != None) {                                                   //0000 : 07 72 00 77 01 40 62 FE 13 2A 16 
      newRelation.mActor = NextScript;                                          //000B : 0F 36 D0 50 6C 0F 00 40 0A FF 13 01 40 62 FE 13 
      newRelation.mDescription = "NextScript:" @ string(NextScript.Name);       //001B : 0F 36 48 51 6C 0F 00 40 0A FF 13 A8 1F 4E 65 78 74 53 63 72 69 70 74 3A 00 39 57 19 01 40 62 FE 13 05 00 04 01 F0 E4 6B 0F 16 
      newRelation.mColour = static.RGB(255,255,50);                             //0045 : 0F 36 C0 51 6C 0F 00 40 0A FF 13 1C B8 8B 6A 0F 39 3D 2C FF 39 3D 2C FF 24 32 16 
      oRelations[oRelations.Length] = newRelation;                              //0060 : 0F 10 37 00 00 09 FF 13 00 00 09 FF 13 00 40 0A FF 13 
    }
    //07 72 00 77 01 40 62 FE 13 2A 16 0F 36 D0 50 6C 0F 00 40 0A FF 13 01 40 62 FE 13 0F 36 48 51 6C 
    //0F 00 40 0A FF 13 A8 1F 4E 65 78 74 53 63 72 69 70 74 3A 00 39 57 19 01 40 62 FE 13 05 00 04 01 
    //F0 E4 6B 0F 16 0F 36 C0 51 6C 0F 00 40 0A FF 13 1C B8 8B 6A 0F 39 3D 2C FF 39 3D 2C FF 24 32 16 
    //0F 10 37 00 00 09 FF 13 00 00 09 FF 13 00 40 0A FF 13 04 0B 47 
  }


  protected event sv_OnScriptFrame(float DeltaTime) {
    //04 0B 47 
  }



