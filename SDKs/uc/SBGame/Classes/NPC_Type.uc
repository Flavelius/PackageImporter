//==============================================================================
//  NPC_Type
//==============================================================================

class NPC_Type extends Content_Type
    native
    abstract
    dependsOn(NPC_StatTable,Game_ActiveTextItem,Game_NPCPawn,Game_ShiftableAppearance,NPC_Effects,Game_NPCSkills,Game_Pawn,Game_CharacterStats)
  ;

  enum ENPC_Category {
    ENPC_Human ,
    ENPC_Wildlife ,
    ENPC_Boss 
  };

  var (Basics) const bool ShowNameAboveHeads;
  var (Basics) const LocalizedString LongName;
  var (Basics) const LocalizedString ShortName;
  var (Basics) const string Note;
  var (Basics) const byte Category;
  var (Basics) const float CorpseTimeout;
  var (Combat) const bool Invulnerable;
  var (Sheet) const int FameLevel;
  var (Sheet) const int PePRank;
  var (Sheet) const float CreditMultiplier;
  var (Combat) byte NPCClassClassification;
  var (Combat) export editinline NPC_SkillDeck SkillDeck;
  var (Combat) export editinline NPC_AttackSheet AttackSheet;
  var (Sheet) export editinline NPC_StatTable Stats;
  var (Movement) const byte Movement;
  var (Movement) const float AccelRate;
  var (Movement) const float JumpSpeed;
  var (Movement) const float GroundSpeed;
  var (Movement) const float CombatSpeed;
  var (Movement) const float StrollSpeed;
  var (Movement) const float WaterSpeed;
  var (Movement) const float AirSpeed;
  var (Movement) const float AirControl;
  var (Movement) const float AirMinSpeed;
  var (Movement) const float ClimbSpeed;
  var (Movement) const float TurnSpeed;
  var (Movement) const float TerminalVelocity;
  var (Movement) const bool CanStrafe;
  var (Movement) const bool CanRest;
  var (Movement) const bool CanWalkBackwards;
  var (Movement) const deprecated bool bAlignToFloor;
  var (Movement) const bool bAlignToFloorRoll;
  var (Movement) const bool bAlignToFloorPitch;
  var (Movement) const bool bForceAttachmentUpdates;
  var (Spawning) const class<Game_NPCPawn> PawnType;
  var (Spawning) const int BossPriority;
  var (Appearance) const editconst editinline NPC_Appearance Appearance;
  var (Appearance) const editconst editinline NPC_Effects Effects;
  var (Items) const editconst editinline NPC_Equipment Equipment;
  var (Items) const editinline Content_Inventory Inventory;
  var (Items) const editinline array<LootTable> Loot;
  var (Items) const bool IndividualKillCredit;
  var (Conversations) const editinline array<Conversation_Topic> Topics;
  var const transient array<Conversation_Topic> QuestTopics;
  var bool TriggersKilledHook;
  var (Faction) export editinline NPC_Taxonomy TaxonomyFaction;
  var (Services) const bool Travel;
  var (Services) const bool Arena;
  var (Services) const editinline Shop_Base Shop;


  final native function cl_CreateQuestsTopics(Game_NPCPawn aPawn);


  event InitializeStats(int aFameLevel,int aPePRank,out int oMaxHp,out int oLevelHp,out int oBody,out int oMind,out int oFocus,out float oRuneResistance,out float oSpiritResistance,out float oSoulResistance) {
    if (Stats != None) {                                                        //0000 : 07 90 00 77 01 30 A0 21 11 2A 16 
      oMaxHp = Stats.GetBaseHitpoints(aFameLevel);                              //000B : 0F 00 A8 A0 21 11 19 01 30 A0 21 11 0B 00 04 1B A1 0F 00 00 00 60 9E 21 11 16 
      oLevelHp = Stats.GetHitpointsPerLevel(aFameLevel);                        //0025 : 0F 00 20 A1 21 11 19 01 30 A0 21 11 0B 00 04 1B A0 0F 00 00 00 60 9E 21 11 16 
      oBody = Stats.GetBody(aFameLevel);                                        //003F : 0F 00 98 A1 21 11 19 01 30 A0 21 11 0B 00 04 1B 9A 0C 00 00 00 60 9E 21 11 16 
      oMind = Stats.GetMind(aFameLevel);                                        //0059 : 0F 00 10 A2 21 11 19 01 30 A0 21 11 0B 00 04 1B 0E 0D 00 00 00 60 9E 21 11 16 
      oFocus = Stats.GetFocus(aFameLevel);                                      //0073 : 0F 00 88 A2 21 11 19 01 30 A0 21 11 0B 00 04 1B 0F 0D 00 00 00 60 9E 21 11 16 
    } else {                                                                    //008D : 06 D9 00 
      oMaxHp = 100;                                                             //0090 : 0F 00 A8 A0 21 11 2C 64 
      oLevelHp = 10;                                                            //0098 : 0F 00 20 A1 21 11 2C 0A 
      oBody = 7 + aFameLevel / 9;                                               //00A0 : 0F 00 98 A1 21 11 92 2C 07 91 00 60 9E 21 11 2C 09 16 16 
      oMind = 7 + aFameLevel / 9;                                               //00B3 : 0F 00 10 A2 21 11 92 2C 07 91 00 60 9E 21 11 2C 09 16 16 
      oFocus = 7 + aFameLevel / 9;                                              //00C6 : 0F 00 88 A2 21 11 92 2C 07 91 00 60 9E 21 11 2C 09 16 16 
    }
    //07 90 00 77 01 30 A0 21 11 2A 16 0F 00 A8 A0 21 11 19 01 30 A0 21 11 0B 00 04 1B A1 0F 00 00 00 
    //60 9E 21 11 16 0F 00 20 A1 21 11 19 01 30 A0 21 11 0B 00 04 1B A0 0F 00 00 00 60 9E 21 11 16 0F 
    //00 98 A1 21 11 19 01 30 A0 21 11 0B 00 04 1B 9A 0C 00 00 00 60 9E 21 11 16 0F 00 10 A2 21 11 19 
    //01 30 A0 21 11 0B 00 04 1B 0E 0D 00 00 00 60 9E 21 11 16 0F 00 88 A2 21 11 19 01 30 A0 21 11 0B 
    //00 04 1B 0F 0D 00 00 00 60 9E 21 11 16 06 D9 00 0F 00 A8 A0 21 11 2C 64 0F 00 20 A1 21 11 2C 0A 
    //0F 00 98 A1 21 11 92 2C 07 91 00 60 9E 21 11 2C 09 16 16 0F 00 10 A2 21 11 92 2C 07 91 00 60 9E 
    //21 11 2C 09 16 16 0F 00 88 A2 21 11 92 2C 07 91 00 60 9E 21 11 2C 09 16 16 04 0B 47 
  }


  function NPC_Taxonomy GetFaction() {
    return TaxonomyFaction;                                                     //0000 : 04 01 40 A6 21 11 
    //04 01 40 A6 21 11 04 0B 47 
  }


  native function int GetClassRank();


  native function float CalcRequestedClassMatch(array<byte> ForbiddenClassTypes);


  native function bool CalcForbiddenClassMatch(array<byte> ForbiddenClassTypes);


  event string GetActiveText(Game_ActiveTextItem aItem) {
    if (aItem == None || aItem.Tag == "N") {                                    //0000 : 07 2D 00 84 72 00 60 AD 21 11 2A 16 18 14 00 7A 19 00 60 AD 21 11 05 00 00 01 08 9B 18 11 1F 4E 00 16 16 
      return GetShortName();                                                    //0023 : 04 1B 9C 0C 00 00 16 
    } else {                                                                    //002A : 06 59 00 
      if (aItem.Tag == "F") {                                                   //002D : 07 4D 00 7A 19 00 60 AD 21 11 05 00 00 01 08 9B 18 11 1F 46 00 16 
        return GetLongName();                                                   //0043 : 04 1B 98 0C 00 00 16 
      } else {                                                                  //004A : 06 59 00 
        return Super.GetActiveText(aItem);                                      //004D : 04 1C 60 3C 1F 11 00 60 AD 21 11 16 
      }
    }
    //07 2D 00 84 72 00 60 AD 21 11 2A 16 18 14 00 7A 19 00 60 AD 21 11 05 00 00 01 08 9B 18 11 1F 4E 
    //00 16 16 04 1B 9C 0C 00 00 16 06 59 00 07 4D 00 7A 19 00 60 AD 21 11 05 00 00 01 08 9B 18 11 1F 
    //46 00 16 04 1B 98 0C 00 00 16 06 59 00 04 1C 60 3C 1F 11 00 60 AD 21 11 16 04 0B 47 
  }


  native function float GetCollisionRadius();


  native function float GetCollisionHeight();


  function string GetLongName() {
    if (Len(LongName.Text) > 0) {                                               //0000 : 07 1D 00 97 7D 36 58 C6 6B 0F 01 30 B3 21 11 16 25 16 
      return LongName.Text;                                                     //0012 : 04 36 58 C6 6B 0F 01 30 B3 21 11 
    }
    return GetShortName();                                                      //001D : 04 1B 9C 0C 00 00 16 
    //07 1D 00 97 7D 36 58 C6 6B 0F 01 30 B3 21 11 16 25 16 04 36 58 C6 6B 0F 01 30 B3 21 11 04 1B 9C 
    //0C 00 00 16 04 0B 47 
  }


  function string GetShortName() {
    if (Len(ShortName.Text) > 0) {                                              //0000 : 07 20 00 97 7D 36 58 C6 6B 0F 01 30 B5 21 11 16 25 16 
      return ShortName.Text;                                                    //0012 : 04 36 58 C6 6B 0F 01 30 B5 21 11 
    } else {                                                                    //001D : 06 26 00 
      return "NPC";                                                             //0020 : 04 1F 4E 50 43 00 
    }
    //07 20 00 97 7D 36 58 C6 6B 0F 01 30 B5 21 11 16 25 16 04 36 58 C6 6B 0F 01 30 B5 21 11 06 26 00 
    //04 1F 4E 50 43 00 04 0B 47 
  }


  event cl_OnInit(Game_NPCPawn aPawn) {
    aPawn.Appearance.InstallBaseAppearance(self);                               //0000 : 19 19 00 58 B6 21 11 05 00 04 01 A8 83 18 11 07 00 00 1B E0 0C 00 00 17 16 
    if (Effects != None) {                                                      //0019 : 07 38 00 77 01 58 B7 21 11 2A 16 
      Effects.Apply(aPawn);                                                     //0024 : 19 01 58 B7 21 11 0B 00 00 1B 80 04 00 00 00 58 B6 21 11 16 
    }
    InitMovement(aPawn);                                                        //0038 : 1B 96 05 00 00 00 58 B6 21 11 16 
    //19 19 00 58 B6 21 11 05 00 04 01 A8 83 18 11 07 00 00 1B E0 0C 00 00 17 16 07 38 00 77 01 58 B7 
    //21 11 2A 16 19 01 58 B7 21 11 0B 00 00 1B 80 04 00 00 00 58 B6 21 11 16 1B 96 05 00 00 00 58 B6 
    //21 11 16 04 0B 47 
  }


  event sv_OnInit(Game_NPCPawn aPawn) {
    aPawn.Appearance.InstallBaseAppearance(self);                               //0000 : 19 19 00 80 B8 21 11 05 00 04 01 A8 83 18 11 07 00 00 1B E0 0C 00 00 17 16 
    aPawn.bInvulnerable = Invulnerable;                                         //0019 : 14 19 00 80 B8 21 11 06 00 04 2D 01 38 D6 18 11 2D 01 F8 B8 21 11 
    InitMovement(aPawn);                                                        //002F : 1B 96 05 00 00 00 80 B8 21 11 16 
    if (SkillDeck != None) {                                                    //003A : 07 6C 00 77 01 70 B9 21 11 2A 16 
      Game_NPCSkills(aPawn.Skills).sv_SetSkilldeck(SkillDeck,Equipment);        //0045 : 19 2E D8 72 5F 01 19 00 80 B8 21 11 05 00 04 01 08 28 18 11 10 00 00 1C E8 B9 21 11 01 70 B9 21 11 01 98 BA 21 11 16 
    }
    if (Inventory != None) {                                                    //006C : 07 87 00 77 01 10 BB 21 11 2A 16 
      GiveItems(aPawn,Inventory);                                               //0077 : 1C D8 07 20 11 00 80 B8 21 11 01 10 BB 21 11 16 
    }
    //19 19 00 80 B8 21 11 05 00 04 01 A8 83 18 11 07 00 00 1B E0 0C 00 00 17 16 14 19 00 80 B8 21 11 
    //06 00 04 2D 01 38 D6 18 11 2D 01 F8 B8 21 11 1B 96 05 00 00 00 80 B8 21 11 16 07 6C 00 77 01 70 
    //B9 21 11 2A 16 19 2E D8 72 5F 01 19 00 80 B8 21 11 05 00 04 01 08 28 18 11 10 00 00 1C E8 B9 21 
    //11 01 70 B9 21 11 01 98 BA 21 11 16 07 87 00 77 01 10 BB 21 11 2A 16 1C D8 07 20 11 00 80 B8 21 
    //11 01 10 BB 21 11 16 04 0B 47 
  }


  event InitMovement(Game_Pawn aPawn) {
    aPawn.SetPhysics(Movement);                                                 //0000 : 19 00 38 BC 21 11 08 00 00 6F 82 01 B0 BC 21 11 16 
    aPawn.GroundSpeed = GroundSpeed;                                            //0011 : 0F 19 00 38 BC 21 11 05 00 04 01 18 A9 76 0F 01 28 BD 21 11 
    aPawn.bCanWalk = GroundSpeed > 0.00000000;                                  //0025 : 14 19 00 38 BC 21 11 06 00 04 2D 01 30 73 76 0F B1 01 28 BD 21 11 1E 00 00 00 00 16 
    aPawn.AirSpeed = AirSpeed;                                                  //0041 : 0F 19 00 38 BC 21 11 05 00 04 01 D8 A9 76 0F 01 A0 BD 21 11 
    aPawn.bCanFly = AirSpeed > 0.00000000;                                      //0055 : 14 19 00 38 BC 21 11 06 00 04 2D 01 78 74 76 0F B1 01 A0 BD 21 11 1E 00 00 00 00 16 
    aPawn.MinFlySpeed = AirMinSpeed;                                            //0071 : 0F 19 00 38 BC 21 11 05 00 04 01 98 D2 76 0F 01 18 BE 21 11 
    aPawn.AirControl = AirControl;                                              //0085 : 0F 19 00 38 BC 21 11 05 00 04 01 C8 AB 76 0F 01 90 BE 21 11 
    aPawn.bCanStrafe = CanStrafe;                                               //0099 : 14 19 00 38 BC 21 11 06 00 04 2D 01 F0 74 76 0F 2D 01 08 BF 21 11 
    aPawn.bCanRest = CanRest;                                                   //00AF : 14 19 00 38 BC 21 11 06 00 04 2D 01 68 75 76 0F 2D 01 80 BF 21 11 
    aPawn.bCanWalkBackwards = CanWalkBackwards;                                 //00C5 : 14 19 00 38 BC 21 11 06 00 04 2D 01 E0 75 76 0F 2D 01 00 8A 34 0F 
    if (aPawn.bCanFly) {                                                        //00DB : 07 0F 01 19 00 38 BC 21 11 06 00 04 2D 01 78 74 76 0F 
      aPawn.CharacterStats.mBaseMovementSpeed = AirSpeed;                       //00ED : 0F 19 19 00 38 BC 21 11 05 00 04 01 08 43 34 0F 05 00 04 01 50 91 1F 11 39 44 01 A0 BD 21 11 
    } else {                                                                    //010C : 06 2E 01 
      aPawn.CharacterStats.mBaseMovementSpeed = GroundSpeed;                    //010F : 0F 19 19 00 38 BC 21 11 05 00 04 01 08 43 34 0F 05 00 04 01 50 91 1F 11 39 44 01 28 BD 21 11 
    }
    if (CombatSpeed >= 0.00000000) {                                            //012E : 07 63 01 B3 01 78 8A 34 0F 1E 00 00 00 00 16 
      aPawn.CharacterStats.mMovementSpeedMultiplier[1] = CombatSpeed / GroundSpeed;//013D : 0F 1A 26 19 19 00 38 BC 21 11 05 00 04 01 08 43 34 0F 05 00 14 01 48 B4 1F 11 AC 01 78 8A 34 0F 01 28 BD 21 11 16 
    }
    if (GroundSpeed >= 1.00000000) {                                            //0163 : 07 8D 01 B3 01 28 BD 21 11 1E 00 00 80 3F 16 
      aPawn.WalkingPct = StrollSpeed / GroundSpeed;                             //0172 : 0F 19 00 38 BC 21 11 05 00 04 01 88 AC 76 0F AC 01 F0 8A 34 0F 01 28 BD 21 11 16 
    }
    aPawn.WaterSpeed = WaterSpeed;                                              //018D : 0F 19 00 38 BC 21 11 05 00 04 01 A0 F5 75 0F 01 68 8B 34 0F 
    aPawn.bCanSwim = WaterSpeed > 0.00000000;                                   //01A1 : 14 19 00 38 BC 21 11 06 00 04 2D 01 00 74 76 0F B1 01 68 8B 34 0F 1E 00 00 00 00 16 
    aPawn.JumpZ = JumpSpeed;                                                    //01BD : 0F 19 00 38 BC 21 11 05 00 04 01 20 E4 75 0F 01 E0 8B 34 0F 
    aPawn.bCanJump = JumpSpeed > 0.00000000;                                    //01D1 : 14 19 00 38 BC 21 11 06 00 04 2D 01 B8 72 76 0F B1 01 E0 8B 34 0F 1E 00 00 00 00 16 
    aPawn.LadderSpeed = ClimbSpeed;                                             //01ED : 0F 19 00 38 BC 21 11 05 00 04 01 98 AA 76 0F 01 58 8C 34 0F 
    aPawn.bCanClimbLadders = ClimbSpeed > 0.00000000;                           //0201 : 14 19 00 38 BC 21 11 06 00 04 2D 01 68 2E 76 0F B1 01 58 8C 34 0F 1E 00 00 00 00 16 
    aPawn.AccelRate = AccelRate;                                                //021D : 0F 19 00 38 BC 21 11 05 00 04 01 18 F6 75 0F 01 D0 8C 34 0F 
    aPawn.RotationRate.Yaw = TurnSpeed;                                         //0231 : 0F 36 20 BF 69 0F 19 00 38 BC 21 11 05 00 0C 01 30 E8 6E 0F 39 44 01 48 8D 34 0F 
    aPawn.RotationRate.Pitch = TurnSpeed;                                       //024C : 0F 36 A8 BE 69 0F 19 00 38 BC 21 11 05 00 0C 01 30 E8 6E 0F 39 44 01 48 8D 34 0F 
    aPawn.RotationRate.Roll = TurnSpeed;                                        //0267 : 0F 36 98 BF 69 0F 19 00 38 BC 21 11 05 00 0C 01 30 E8 6E 0F 39 44 01 48 8D 34 0F 
    aPawn.bAlignToFloor = bAlignToFloor;                                        //0282 : 14 19 00 38 BC 21 11 06 00 04 2D 01 38 06 6F 0F 2D 01 C0 8D 34 0F 
    aPawn.bAlignToFloorRoll = bAlignToFloorRoll;                                //0298 : 14 19 00 38 BC 21 11 06 00 04 2D 01 B0 06 6F 0F 2D 01 38 8E 34 0F 
    aPawn.bAlignToFloorPitch = bAlignToFloorPitch;                              //02AE : 14 19 00 38 BC 21 11 06 00 04 2D 01 28 07 6F 0F 2D 01 B0 8E 34 0F 
    aPawn.bForceSkelUpdate = bForceAttachmentUpdates;                           //02C4 : 14 19 00 38 BC 21 11 06 00 04 2D 01 A8 CD 6E 0F 2D 01 28 8F 34 0F 
    aPawn.SetCollisionSize(GetCollisionRadius(),GetCollisionHeight());          //02DA : 19 00 38 BC 21 11 0F 00 04 61 1B 1B 9B 0C 00 00 16 1B 5D 0C 00 00 16 16 
    aPawn.mMaxDamageFallSpeed = TerminalVelocity;                               //02F2 : 0F 19 00 38 BC 21 11 05 00 04 01 10 D1 18 11 01 A0 8F 34 0F 
    aPawn.mMinDamageFallSpeed = TerminalVelocity * 0.75000000;                  //0306 : 0F 19 00 38 BC 21 11 05 00 04 01 78 D2 18 11 AB 01 A0 8F 34 0F 1E 00 00 40 3F 16 
    if (Movement == 4) {                                                        //0321 : 07 42 03 9A 39 3A 01 B0 BC 21 11 39 3A 24 04 16 
      aPawn.bCanFly = True;                                                     //0331 : 14 19 00 38 BC 21 11 06 00 04 2D 01 78 74 76 0F 27 
    }
    //19 00 38 BC 21 11 08 00 00 6F 82 01 B0 BC 21 11 16 0F 19 00 38 BC 21 11 05 00 04 01 18 A9 76 0F 
    //01 28 BD 21 11 14 19 00 38 BC 21 11 06 00 04 2D 01 30 73 76 0F B1 01 28 BD 21 11 1E 00 00 00 00 
    //16 0F 19 00 38 BC 21 11 05 00 04 01 D8 A9 76 0F 01 A0 BD 21 11 14 19 00 38 BC 21 11 06 00 04 2D 
    //01 78 74 76 0F B1 01 A0 BD 21 11 1E 00 00 00 00 16 0F 19 00 38 BC 21 11 05 00 04 01 98 D2 76 0F 
    //01 18 BE 21 11 0F 19 00 38 BC 21 11 05 00 04 01 C8 AB 76 0F 01 90 BE 21 11 14 19 00 38 BC 21 11 
    //06 00 04 2D 01 F0 74 76 0F 2D 01 08 BF 21 11 14 19 00 38 BC 21 11 06 00 04 2D 01 68 75 76 0F 2D 
    //01 80 BF 21 11 14 19 00 38 BC 21 11 06 00 04 2D 01 E0 75 76 0F 2D 01 00 8A 34 0F 07 0F 01 19 00 
    //38 BC 21 11 06 00 04 2D 01 78 74 76 0F 0F 19 19 00 38 BC 21 11 05 00 04 01 08 43 34 0F 05 00 04 
    //01 50 91 1F 11 39 44 01 A0 BD 21 11 06 2E 01 0F 19 19 00 38 BC 21 11 05 00 04 01 08 43 34 0F 05 
    //00 04 01 50 91 1F 11 39 44 01 28 BD 21 11 07 63 01 B3 01 78 8A 34 0F 1E 00 00 00 00 16 0F 1A 26 
    //19 19 00 38 BC 21 11 05 00 04 01 08 43 34 0F 05 00 14 01 48 B4 1F 11 AC 01 78 8A 34 0F 01 28 BD 
    //21 11 16 07 8D 01 B3 01 28 BD 21 11 1E 00 00 80 3F 16 0F 19 00 38 BC 21 11 05 00 04 01 88 AC 76 
    //0F AC 01 F0 8A 34 0F 01 28 BD 21 11 16 0F 19 00 38 BC 21 11 05 00 04 01 A0 F5 75 0F 01 68 8B 34 
    //0F 14 19 00 38 BC 21 11 06 00 04 2D 01 00 74 76 0F B1 01 68 8B 34 0F 1E 00 00 00 00 16 0F 19 00 
    //38 BC 21 11 05 00 04 01 20 E4 75 0F 01 E0 8B 34 0F 14 19 00 38 BC 21 11 06 00 04 2D 01 B8 72 76 
    //0F B1 01 E0 8B 34 0F 1E 00 00 00 00 16 0F 19 00 38 BC 21 11 05 00 04 01 98 AA 76 0F 01 58 8C 34 
    //0F 14 19 00 38 BC 21 11 06 00 04 2D 01 68 2E 76 0F B1 01 58 8C 34 0F 1E 00 00 00 00 16 0F 19 00 
    //38 BC 21 11 05 00 04 01 18 F6 75 0F 01 D0 8C 34 0F 0F 36 20 BF 69 0F 19 00 38 BC 21 11 05 00 0C 
    //01 30 E8 6E 0F 39 44 01 48 8D 34 0F 0F 36 A8 BE 69 0F 19 00 38 BC 21 11 05 00 0C 01 30 E8 6E 0F 
    //39 44 01 48 8D 34 0F 0F 36 98 BF 69 0F 19 00 38 BC 21 11 05 00 0C 01 30 E8 6E 0F 39 44 01 48 8D 
    //34 0F 14 19 00 38 BC 21 11 06 00 04 2D 01 38 06 6F 0F 2D 01 C0 8D 34 0F 14 19 00 38 BC 21 11 06 
    //00 04 2D 01 B0 06 6F 0F 2D 01 38 8E 34 0F 14 19 00 38 BC 21 11 06 00 04 2D 01 28 07 6F 0F 2D 01 
    //B0 8E 34 0F 14 19 00 38 BC 21 11 06 00 04 2D 01 A8 CD 6E 0F 2D 01 28 8F 34 0F 19 00 38 BC 21 11 
    //0F 00 04 61 1B 1B 9B 0C 00 00 16 1B 5D 0C 00 00 16 16 0F 19 00 38 BC 21 11 05 00 04 01 10 D1 18 
    //11 01 A0 8F 34 0F 0F 19 00 38 BC 21 11 05 00 04 01 78 D2 18 11 AB 01 A0 8F 34 0F 1E 00 00 40 3F 
    //16 07 42 03 9A 39 3A 01 B0 BC 21 11 39 3A 24 04 16 14 19 00 38 BC 21 11 06 00 04 2D 01 78 74 76 
    //0F 27 04 0B 47 
  }


  native function sv_OnSpawn(Game_NPCPawn aPawn);



