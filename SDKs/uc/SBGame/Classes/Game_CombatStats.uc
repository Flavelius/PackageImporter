//==============================================================================
//  Game_CombatStats
//==============================================================================

class Game_CombatStats extends Base_Component within Actor
    native
    exportstructs
    dependsOn(Game_Pawn,Game_CharacterStats,Game_PlayerStats,SBDBSync)
    Config(charstats)
  ;

  struct SocialStruct {
      var export editinline Game_CombatStats LinkedStats;
      var float Weight;

  };


  struct ParticipantStruct {
      var Game_Pawn Pwnie;
      var float PositiveContribution;
      var float NegativeContribution;
      var float LastContributionTime;
      var float FirstContributionTime;
      var bool ScriptedClaim;

  };


  var Game_Pawn mScriptedClaim;
  var bool mInCombat;
  var float mCombatDuration;
  var float mIdleDuration;
  var array<ParticipantStruct> mParticipants;
  var array<Game_Pawn> mAggroDistribution;
  var float mTotalPositiveContribution;
  var float mTotalNegativeContribution;
  var float mReceivedAggro;
  var bool mGatherStatistics;
  var int mSkillsExecuted;
  var int mSkillsHit;
  var int mSkillsMissed;
  var array<SocialStruct> mSocialStats;
  var config float AggroDecay;
  var config float CreditRange;
  var config float CreditIdle;
  var config float BasePep;
  var config float LevelBonus;
  var config float MaxLevelBonus;
  var config float LevelPenalty;
  var config float MaxLevelPenalty;
  var config float DistributionFudge;
  var Game_Pawn mLastAttackedPawn;


  protected native function bool GetOuterDead();


  protected event string GetOuterName() {
    return "Unknown";                                                           //0000 : 04 1F 55 6E 6B 6E 6F 77 6E 00 
    //04 1F 55 6E 6B 6E 6F 77 6E 00 04 0B 47 
  }


  protected native function sv2cl_UpdateInCombat_CallStub();


  protected event sv2cl_UpdateInCombat(bool aInCombat) {
    mInCombat = aInCombat;                                                      //0000 : 14 2D 01 C0 C8 28 11 2D 00 08 C8 28 11 
    //14 2D 01 C0 C8 28 11 2D 00 08 C8 28 11 04 0B 47 
  }


  native function sv_ExitCombat();


  native function sv_EnterCombat();


  function LinkSocialStats(export editinline Game_CombatStats aStats,float aWeight) {
    local SocialStruct newSocialLink;
    newSocialLink.LinkedStats = aStats;                                         //0000 : 0F 36 90 CC 28 11 00 08 CD 28 11 00 A8 CB 28 11 
    newSocialLink.Weight = aWeight;                                             //0010 : 0F 36 80 CD 28 11 00 08 CD 28 11 00 F8 CD 28 11 
    mSocialStats[mSocialStats.Length] = newSocialLink;                          //0020 : 0F 10 37 01 70 CE 28 11 01 70 CE 28 11 00 08 CD 28 11 
    //0F 36 90 CC 28 11 00 08 CD 28 11 00 A8 CB 28 11 0F 36 80 CD 28 11 00 08 CD 28 11 00 F8 CD 28 11 
    //0F 10 37 01 70 CE 28 11 01 70 CE 28 11 00 08 CD 28 11 04 0B 47 
  }


  function sv_FamePepDistribution(array<Game_Pawn> Enemies,float aFame,float aPep) {
    local int enemyI;
    local int AverageLevel;
    local array<float> ContributionMultipliers;
    local float TotalContribution;
    local int LevelDifference;
    if (aFame <= 0.00000000 && aPep <= 0.00000000) {                            //0000 : 07 22 00 82 B2 00 28 D3 28 11 1E 00 00 00 00 16 18 0D 00 B2 00 A0 D3 28 11 1E 00 00 00 00 16 16 
      return;                                                                   //0020 : 04 0B 
    }
    AverageLevel = 0;                                                           //0022 : 0F 00 18 D4 28 11 25 
    enemyI = 0;                                                                 //0029 : 0F 00 90 D4 28 11 25 
    while (enemyI < Enemies.Length) {                                           //0030 : 07 6F 00 96 00 90 D4 28 11 37 00 10 D0 28 11 16 
      AverageLevel += Enemies[enemyI].CharacterStats.GetFameLevel();            //0040 : A1 00 18 D4 28 11 19 19 10 00 90 D4 28 11 00 10 D0 28 11 05 00 04 01 08 43 34 0F 06 00 04 1C F8 1E 1F 11 16 16 
      enemyI++;                                                                 //0065 : A5 00 90 D4 28 11 16 
    }
    AverageLevel /= Enemies.Length;                                             //006F : A0 00 18 D4 28 11 39 3F 37 00 10 D0 28 11 16 
    TotalContribution = 0.00000000;                                             //007E : 0F 00 08 D5 28 11 1E 00 00 00 00 
    enemyI = 0;                                                                 //0089 : 0F 00 90 D4 28 11 25 
    while (enemyI < Enemies.Length) {                                           //0090 : 07 FE 00 96 00 90 D4 28 11 37 00 10 D0 28 11 16 
      LevelDifference = Enemies[enemyI].CharacterStats.GetFameLevel() - AverageLevel;//00A0 : 0F 00 80 D5 28 11 93 19 19 10 00 90 D4 28 11 00 10 D0 28 11 05 00 04 01 08 43 34 0F 06 00 04 1C F8 1E 1F 11 16 00 18 D4 28 11 16 
      ContributionMultipliers[enemyI] = GetTeamContributionMultiplier(LevelDifference);//00CB : 0F 10 00 90 D4 28 11 00 F8 D5 28 11 1B 18 0F 00 00 00 80 D5 28 11 16 
      TotalContribution += ContributionMultipliers[enemyI];                     //00E2 : B8 00 08 D5 28 11 10 00 90 D4 28 11 00 F8 D5 28 11 16 
      enemyI++;                                                                 //00F4 : A5 00 90 D4 28 11 16 
    }
    enemyI = 0;                                                                 //00FE : 0F 00 90 D4 28 11 25 
    while (enemyI < ContributionMultipliers.Length) {                           //0105 : 07 31 01 96 00 90 D4 28 11 37 00 F8 D5 28 11 16 
      ContributionMultipliers[enemyI] /= TotalContribution;                     //0115 : B7 10 00 90 D4 28 11 00 F8 D5 28 11 00 08 D5 28 11 16 
      enemyI++;                                                                 //0127 : A5 00 90 D4 28 11 16 
    }
    enemyI = 0;                                                                 //0131 : 0F 00 90 D4 28 11 25 
    while (enemyI < Enemies.Length) {                                           //0138 : 07 C6 01 96 00 90 D4 28 11 37 00 10 D0 28 11 16 
      Game_PlayerStats(Enemies[enemyI].CharacterStats).IncreaseFamePoints(Round(ContributionMultipliers[enemyI] * aFame));//0148 : 19 2E 10 A3 5F 01 19 10 00 90 D4 28 11 00 10 D0 28 11 05 00 04 01 08 43 34 0F 1D 00 00 1B 70 0D 00 00 39 44 61 01 AB 10 00 90 D4 28 11 00 F8 D5 28 11 00 28 D3 28 11 16 16 16 
      Game_PlayerStats(Enemies[enemyI].CharacterStats).IncreasePePPoints(Round(ContributionMultipliers[enemyI] * aPep));//0182 : 19 2E 10 A3 5F 01 19 10 00 90 D4 28 11 00 10 D0 28 11 05 00 04 01 08 43 34 0F 1D 00 00 1B 3A 0E 00 00 39 44 61 01 AB 10 00 90 D4 28 11 00 F8 D5 28 11 00 A0 D3 28 11 16 16 16 
      enemyI++;                                                                 //01BC : A5 00 90 D4 28 11 16 
    }
    //07 22 00 82 B2 00 28 D3 28 11 1E 00 00 00 00 16 18 0D 00 B2 00 A0 D3 28 11 1E 00 00 00 00 16 16 
    //04 0B 0F 00 18 D4 28 11 25 0F 00 90 D4 28 11 25 07 6F 00 96 00 90 D4 28 11 37 00 10 D0 28 11 16 
    //A1 00 18 D4 28 11 19 19 10 00 90 D4 28 11 00 10 D0 28 11 05 00 04 01 08 43 34 0F 06 00 04 1C F8 
    //1E 1F 11 16 16 A5 00 90 D4 28 11 16 06 30 00 A0 00 18 D4 28 11 39 3F 37 00 10 D0 28 11 16 0F 00 
    //08 D5 28 11 1E 00 00 00 00 0F 00 90 D4 28 11 25 07 FE 00 96 00 90 D4 28 11 37 00 10 D0 28 11 16 
    //0F 00 80 D5 28 11 93 19 19 10 00 90 D4 28 11 00 10 D0 28 11 05 00 04 01 08 43 34 0F 06 00 04 1C 
    //F8 1E 1F 11 16 00 18 D4 28 11 16 0F 10 00 90 D4 28 11 00 F8 D5 28 11 1B 18 0F 00 00 00 80 D5 28 
    //11 16 B8 00 08 D5 28 11 10 00 90 D4 28 11 00 F8 D5 28 11 16 A5 00 90 D4 28 11 16 06 90 00 0F 00 
    //90 D4 28 11 25 07 31 01 96 00 90 D4 28 11 37 00 F8 D5 28 11 16 B7 10 00 90 D4 28 11 00 F8 D5 28 
    //11 00 08 D5 28 11 16 A5 00 90 D4 28 11 16 06 05 01 0F 00 90 D4 28 11 25 07 C6 01 96 00 90 D4 28 
    //11 37 00 10 D0 28 11 16 19 2E 10 A3 5F 01 19 10 00 90 D4 28 11 00 10 D0 28 11 05 00 04 01 08 43 
    //34 0F 1D 00 00 1B 70 0D 00 00 39 44 61 01 AB 10 00 90 D4 28 11 00 F8 D5 28 11 00 28 D3 28 11 16 
    //16 16 19 2E 10 A3 5F 01 19 10 00 90 D4 28 11 00 10 D0 28 11 05 00 04 01 08 43 34 0F 1D 00 00 1B 
    //3A 0E 00 00 39 44 61 01 AB 10 00 90 D4 28 11 00 F8 D5 28 11 00 A0 D3 28 11 16 16 16 A5 00 90 D4 
    //28 11 16 06 38 01 04 0B 47 
  }


  function sv_FamePepCredit(array<Game_Pawn> Enemies,float aMultiplier,int aLevel,int aPePRank,out float oFame,out float oPep) {
    local float Multiplier;
    local float killFame;
    killFame = Class'SBDBSync'.GetKillFame(aLevel);                             //0000 : 0F 00 48 D9 28 11 12 20 30 82 24 01 0B 00 04 1B 62 13 00 00 00 C0 D9 28 11 16 
    Multiplier = GetKillMultiplier(Enemies,aLevel,aPePRank);                    //001A : 0F 00 38 DA 28 11 1B F2 0E 00 00 00 10 D8 28 11 00 C0 D9 28 11 00 B0 DA 28 11 16 
    oFame = aMultiplier * Multiplier * killFame;                                //0035 : 0F 00 28 DB 28 11 AB AB 00 A0 DB 28 11 00 38 DA 28 11 16 00 48 D9 28 11 16 
    oPep = aMultiplier * Multiplier * BasePep;                                  //004E : 0F 00 18 DC 28 11 AB AB 00 A0 DB 28 11 00 38 DA 28 11 16 01 90 DC 28 11 16 
    //0F 00 48 D9 28 11 12 20 30 82 24 01 0B 00 04 1B 62 13 00 00 00 C0 D9 28 11 16 0F 00 38 DA 28 11 
    //1B F2 0E 00 00 00 10 D8 28 11 00 C0 D9 28 11 00 B0 DA 28 11 16 0F 00 28 DB 28 11 AB AB 00 A0 DB 
    //28 11 00 38 DA 28 11 16 00 48 D9 28 11 16 0F 00 18 DC 28 11 AB AB 00 A0 DB 28 11 00 38 DA 28 11 
    //16 01 90 DC 28 11 16 04 0B 47 
  }


  protected function float GetTeamContributionMultiplier(int aLevelDifference) {
    return 1.00000000 / (1 + Exp(-DistributionFudge * aLevelDifference));       //0000 : 04 AC 1E 00 00 80 3F AE 39 3F 26 BF AB A9 01 00 DF 28 11 16 39 3F 00 30 DE 28 11 16 16 16 16 
    //04 AC 1E 00 00 80 3F AE 39 3F 26 BF AB A9 01 00 DF 28 11 16 39 3F 00 30 DE 28 11 16 16 16 16 04 
    //0B 47 
  }


  protected function float GetKillMultiplier(array<Game_Pawn> Enemies,int aLevel,int aPep) {
    local int enemyI;
    local int GroupLevel;
    local int LevelDifference;
    local float ret;
    GroupLevel = 0;                                                             //0000 : 0F 00 38 E2 28 11 25 
    enemyI = 0;                                                                 //0007 : 0F 00 B0 E2 28 11 25 
    while (enemyI < Enemies.Length) {                                           //000E : 07 74 00 96 00 B0 E2 28 11 37 00 A0 E0 28 11 16 
      if (Enemies[enemyI].CharacterStats.GetFameLevel() > GroupLevel) {         //001E : 07 6A 00 97 19 19 10 00 B0 E2 28 11 00 A0 E0 28 11 05 00 04 01 08 43 34 0F 06 00 04 1C F8 1E 1F 11 16 00 38 E2 28 11 16 
        GroupLevel = Enemies[enemyI].CharacterStats.GetFameLevel();             //0046 : 0F 00 38 E2 28 11 19 19 10 00 B0 E2 28 11 00 A0 E0 28 11 05 00 04 01 08 43 34 0F 06 00 04 1C F8 1E 1F 11 16 
      }
      enemyI++;                                                                 //006A : A5 00 B0 E2 28 11 16 
    }
    LevelDifference = aLevel - GroupLevel;                                      //0074 : 0F 00 28 E3 28 11 93 00 A0 E3 28 11 00 38 E2 28 11 16 
    ret = GetPepMultiplier(aPep);                                               //0086 : 0F 00 18 E4 28 11 1B 4F 0E 00 00 00 90 E4 28 11 16 
    ret *= GetLevelDifferenceMultiplier(LevelDifference);                       //0097 : B6 00 18 E4 28 11 1C 08 E5 28 11 00 28 E3 28 11 16 16 
    return ret;                                                                 //00A9 : 04 00 18 E4 28 11 
    //0F 00 38 E2 28 11 25 0F 00 B0 E2 28 11 25 07 74 00 96 00 B0 E2 28 11 37 00 A0 E0 28 11 16 07 6A 
    //00 97 19 19 10 00 B0 E2 28 11 00 A0 E0 28 11 05 00 04 01 08 43 34 0F 06 00 04 1C F8 1E 1F 11 16 
    //00 38 E2 28 11 16 0F 00 38 E2 28 11 19 19 10 00 B0 E2 28 11 00 A0 E0 28 11 05 00 04 01 08 43 34 
    //0F 06 00 04 1C F8 1E 1F 11 16 A5 00 B0 E2 28 11 16 06 0E 00 0F 00 28 E3 28 11 93 00 A0 E3 28 11 
    //00 38 E2 28 11 16 0F 00 18 E4 28 11 1B 4F 0E 00 00 00 90 E4 28 11 16 B6 00 18 E4 28 11 1C 08 E5 
    //28 11 00 28 E3 28 11 16 16 04 00 18 E4 28 11 04 0B 47 
  }


  protected function float GetPepMultiplier(int aPep) {
    switch (aPep) {                                                             //0000 : 05 04 00 A8 E6 28 11 
      case 0 :                                                                  //0007 : 0A 11 00 25 
        return 1.00000000;                                                      //000B : 04 1E 00 00 80 3F 
      case 1 :                                                                  //0011 : 0A 1B 00 26 
        return 1.20000005;                                                      //0015 : 04 1E 9A 99 99 3F 
      case 2 :                                                                  //001B : 0A 26 00 2C 02 
        return 1.50000000;                                                      //0020 : 04 1E 00 00 C0 3F 
      case 3 :                                                                  //0026 : 0A 31 00 2C 03 
        return 2.00000000;                                                      //002B : 04 1E 00 00 00 40 
      case 4 :                                                                  //0031 : 0A 3C 00 2C 04 
        return 3.00000000;                                                      //0036 : 04 1E 00 00 40 40 
      case 5 :                                                                  //003C : 0A 47 00 2C 05 
        return 5.00000000;                                                      //0041 : 04 1E 00 00 A0 40 
      default:                                                                  //0047 : 0A FF FF 
        return 1.00000000;                                                      //004A : 04 1E 00 00 80 3F 
      }
    }
    //05 04 00 A8 E6 28 11 0A 11 00 25 04 1E 00 00 80 3F 0A 1B 00 26 04 1E 9A 99 99 3F 0A 26 00 2C 02 
    //04 1E 00 00 C0 3F 0A 31 00 2C 03 04 1E 00 00 00 40 0A 3C 00 2C 04 04 1E 00 00 40 40 0A 47 00 2C 
    //05 04 1E 00 00 A0 40 0A FF FF 04 1E 00 00 80 3F 04 0B 47 
  }


  final native function float GetLevelDifferenceMultiplier(int aLevelDifference);


  function sv_QuestCredit(array<Game_Pawn> Enemies) {
    //04 0B 47 
  }


  event Game_Pawn sv_GetLastAttackedPawn() {
    return mLastAttackedPawn;                                                   //0000 : 04 01 40 ED 28 11 
    //04 01 40 ED 28 11 04 0B 47 
  }


  function sv_SetLastAttackedPawn(Game_Pawn Pawn) {
    mLastAttackedPawn = Pawn;                                                   //0000 : 0F 01 40 ED 28 11 00 68 EE 28 11 
    //0F 01 40 ED 28 11 00 68 EE 28 11 04 0B 47 
  }


  event Game_Pawn sv_GetLastAttacker() {
    local int partI;
    local float lastParticipation;
    local int lastIndex;
    lastIndex = -1;                                                             //0000 : 0F 00 78 F1 28 11 1D FF FF FF FF 
    partI = 0;                                                                  //000B : 0F 00 F0 F1 28 11 25 
    while (partI < mParticipants.Length) {                                      //0012 : 07 97 00 96 00 F0 F1 28 11 37 01 68 F2 28 11 16 
      if (mParticipants[partI].NegativeContribution > 0.00000000) {             //0022 : 07 8D 00 B1 36 68 F3 28 11 10 00 F0 F1 28 11 01 68 F2 28 11 1E 00 00 00 00 16 
        if (mParticipants[partI].Pwnie != None) {                               //003C : 07 8D 00 77 36 E0 F3 28 11 10 00 F0 F1 28 11 01 68 F2 28 11 2A 16 
          if (mParticipants[partI].LastContributionTime > lastParticipation) {  //0052 : 07 8D 00 B1 36 58 F4 28 11 10 00 F0 F1 28 11 01 68 F2 28 11 00 D0 F4 28 11 16 
            lastIndex = partI;                                                  //006C : 0F 00 78 F1 28 11 00 F0 F1 28 11 
            lastParticipation = mParticipants[partI].LastContributionTime;      //0077 : 0F 00 D0 F4 28 11 36 58 F4 28 11 10 00 F0 F1 28 11 01 68 F2 28 11 
          }
        }
      }
      partI++;                                                                  //008D : A5 00 F0 F1 28 11 16 
    }
    if (lastIndex != -1) {                                                      //0097 : 07 BA 00 9B 00 78 F1 28 11 1D FF FF FF FF 16 
      return mParticipants[lastIndex].Pwnie;                                    //00A6 : 04 36 E0 F3 28 11 10 00 78 F1 28 11 01 68 F2 28 11 
    } else {                                                                    //00B7 : 06 BC 00 
      return None;                                                              //00BA : 04 2A 
    }
    //0F 00 78 F1 28 11 1D FF FF FF FF 0F 00 F0 F1 28 11 25 07 97 00 96 00 F0 F1 28 11 37 01 68 F2 28 
    //11 16 07 8D 00 B1 36 68 F3 28 11 10 00 F0 F1 28 11 01 68 F2 28 11 1E 00 00 00 00 16 07 8D 00 77 
    //36 E0 F3 28 11 10 00 F0 F1 28 11 01 68 F2 28 11 2A 16 07 8D 00 B1 36 58 F4 28 11 10 00 F0 F1 28 
    //11 01 68 F2 28 11 00 D0 F4 28 11 16 0F 00 78 F1 28 11 00 F0 F1 28 11 0F 00 D0 F4 28 11 36 58 F4 
    //28 11 10 00 F0 F1 28 11 01 68 F2 28 11 A5 00 F0 F1 28 11 16 06 12 00 07 BA 00 9B 00 78 F1 28 11 
    //1D FF FF FF FF 16 04 36 E0 F3 28 11 10 00 78 F1 28 11 01 68 F2 28 11 06 BC 00 04 2A 04 0B 47 
  }


  function bool sv_InCombatWith(Game_Pawn aPawn) {
    local int partI;
    if (mScriptedClaim != None && mScriptedClaim == aPawn) {                    //0000 : 07 1E 00 82 77 01 E8 CE 28 11 2A 16 18 0D 00 72 01 E8 CE 28 11 00 48 F5 28 11 16 16 
      return True;                                                              //001C : 04 27 
    }
    partI = 0;                                                                  //001E : 0F 00 70 F6 28 11 25 
    while (partI < mParticipants.Length) {                                      //0025 : 07 5B 00 96 00 70 F6 28 11 37 01 68 F2 28 11 16 
      if (mParticipants[partI].Pwnie == aPawn) {                                //0035 : 07 51 00 72 36 E0 F3 28 11 10 00 70 F6 28 11 01 68 F2 28 11 00 48 F5 28 11 16 
        return True;                                                            //004F : 04 27 
      }
      partI++;                                                                  //0051 : A5 00 70 F6 28 11 16 
    }
    return False;                                                               //005B : 04 28 
    //07 1E 00 82 77 01 E8 CE 28 11 2A 16 18 0D 00 72 01 E8 CE 28 11 00 48 F5 28 11 16 16 04 27 0F 00 
    //70 F6 28 11 25 07 5B 00 96 00 70 F6 28 11 37 01 68 F2 28 11 16 07 51 00 72 36 E0 F3 28 11 10 00 
    //70 F6 28 11 01 68 F2 28 11 00 48 F5 28 11 16 04 27 A5 00 70 F6 28 11 16 06 25 00 04 28 04 0B 47 
    //
  }


  final native function Game_Pawn sv_GetKiller();


  final native function sv_AddParticipants(out array<Game_Pawn> oParticipants);


  native function sv_ScriptedClaim(Game_Pawn aClaimer);


  native function sv_CombatParticipation(Game_Pawn aParticipant,float Contribution);


  event bool InCombat() {
    return mInCombat;                                                           //0000 : 04 2D 01 C0 C8 28 11 
    //04 2D 01 C0 C8 28 11 04 0B 47 
  }



