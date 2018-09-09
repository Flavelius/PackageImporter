//==============================================================================
//  Content_API
//==============================================================================

class Content_API extends Object
    native
    dependsOn(Game_Pawn,Game_Controller,Game_PlayerItemManager,Content_Inventory,Game_ItemManager,Quest_Target,Game_PlayerPawn,Game_QuestLog,Game_NPCPawn,Class,Actor,Game_GameServer,Game_PlayerController,StringReferences,Game_TextParser)
  ;

  enum EContentEmote {
    ECE_None ,
    ECE_wave ,
    ECE_salute ,
    ECE_great ,
    ECE_lol ,
    ECE_huh ,
    ECE_dance ,
    ECE_enemies ,
    ECE_getready ,
    ECE_charge ,
    ECE_attack ,
    ECE_retreat ,
    ECE_follow ,
    ECE_wait ,
    ECE_comeon ,
    ECE_assistance ,
    ECE_overhere ,
    ECE_backoff ,
    ECE_north ,
    ECE_east ,
    ECE_west ,
    ECE_south ,
    ECE_flank ,
    ECE_goround ,
    ECE_no ,
    ECE_yes ,
    ECE_greet ,
    ECE_bye ,
    ECE_thanks ,
    ECE_pony ,
    ECE_pwnie ,
    ECE_trade ,
    ECE_excuse ,
    ECE_waitup ,
    ECE_veto ,
    ECE_sarcasm ,
    ECE_hey ,
    ECE_oldskool ,
    ECE_outfit ,
    ECE_fashionpolice ,
    ECE_jazz ,
    ECE_clap ,
    ECE_kiss ,
    ECE_sigh ,
    ECE_bored ,
    ECE_pain ,
    ECE_pst ,
    ECE_angry ,
    ECE_cry ,
    ECE_maniacal ,
    ECE_laugh ,
    ECE_cough ,
    ECE_cheer ,
    ECE_whistlehappy ,
    ECE_whistleattention ,
    ECE_whistlemusic ,
    ECE_whistlenote ,
    ECE_ahh ,
    ECE_gasp ,
    ECE_stretch ,
    ECE_huf ,
    ECE_bah ,
    ECE_oracle ,
    ECE_battle ,
    ECE_praise ,
    ECE_mock ,
    ECE_attention ,
    ECE_death ,
    ECE_stop ,
    ECE_admireroom ,
    ECE_victory ,
    ECE_survive ,
    ECE_again ,
    ECE_try ,
    ECE_letsgo ,
    ECE_rtfm ,
    ECE_unique 
  };

  enum EContentOperator {
    ECO_Equals ,
    ECO_NotEquals ,
    ECO_Less ,
    ECO_More ,
    ECO_EqualOrLess ,
    ECO_EqualOrMore ,
    ECO_Mask ,
    ECO_NotMask 
  };

  enum NPCBodytype {
    ENB_Skinny ,
    ENB_Athletic ,
    ENB_Fat ,
    ENB_Hulky ,
    ENB_Child ,
    ENB_Monstrous 
  };

  enum NPCRace {
    ENR_Human ,
    ENR_Daevi ,
    ENR_Monster ,
    ENR_Arionite ,
    ENR_SpeyrFolk ,
    ENR_DemonArmy ,
    ENR_BotG ,
    ENR_ForgeOfWisdom ,
    ENR_Ousted ,
    ENR_Urvhail ,
    ENR_Vhuul ,
    ENR_Urgarut ,
    ENR_Shunned 
  };

  enum NPCGender {
    ENG_Male ,
    ENG_Female ,
    ENG_Neuter ,
    ENG_Hermaphrodite 
  };

  enum ENPCClassType {
    CT_HeavyMelee ,
    CT_HeavyRanged ,
    CT_ModerateMelee ,
    CT_ModerateRanged ,
    CT_LightMelee ,
    CT_LightRanged ,
    CT_DOT ,
    CT_Healer ,
    CT_Slower ,
    CT_Buffer ,
    CT_Alerter ,
    CT_Supporter ,
    CT_Rezzer ,
    CT_Debuffer ,
    CT_Blinder 
  };

  enum EContentClass {
    ECC_NoClass ,
    ECC_Rogue ,
    ECC_Warrior ,
    ECC_Spellcaster ,
    ECC_Trickster ,
    ECC_SkinShifter ,
    ECC_DeathHand ,
    ECC_Bloodwarrior ,
    ECC_FuryHammer ,
    ECC_WrathGuard ,
    ECC_RuneMage ,
    ECC_VoidSeer ,
    ECC_AncestralMage ,
    ECC_Gadgeteer ,
    ECC_Entertainer ,
    ECC_Assassin ,
    ECC_ShapeChanger ,
    ECC_Consumer ,
    ECC_Alchemist ,
    ECC_Bodyguard ,
    ECC_Flagellant ,
    ECC_Visionary ,
    ECC_MartialArtist ,
    ECC_PossessedOne ,
    ECC_FrontMan ,
    ECC_Nuker ,
    ECC_RuneMaster ,
    ECC_Priest ,
    ECC_AntiMage ,
    ECC_Summoner ,
    ECC_Infuser ,
    ECC_AnyClass 
  };


  final native function int GetPersistentVariable(Game_Pawn aPawn,int aId);


  function SetPersistentVariable(Game_Pawn aPawn,int aId,int aValue) {
    local Game_Controller cont;
    cont = Game_Controller(aPawn.Controller);                                   //0000 : 0F 00 70 F5 1F 11 2E 10 0E 5B 01 19 00 70 F4 1F 11 05 00 04 01 00 6E 6C 0F 
    if (cont != None) {                                                         //0019 : 07 3E 00 77 00 70 F5 1F 11 2A 16 
      cont.sv_SetPersistentVariable(0,aId,aValue);                              //0024 : 19 00 70 F5 1F 11 11 00 00 1B 37 07 00 00 25 00 E8 F5 1F 11 00 60 F6 1F 11 16 
    }
    //0F 00 70 F5 1F 11 2E 10 0E 5B 01 19 00 70 F4 1F 11 05 00 04 01 00 6E 6C 0F 07 3E 00 77 00 70 F5 
    //1F 11 2A 16 19 00 70 F5 1F 11 11 00 00 1B 37 07 00 00 25 00 E8 F5 1F 11 00 60 F6 1F 11 16 04 0B 
    //47 
  }


  final native function bool LearnSkill(Game_Pawn aPawn,export editinline FSkill_Type aSkill);


  final native function bool CanLearnSkill(Game_Pawn aPawn,export editinline FSkill_Type aSkill);


  function bool RemoveMoney(Game_Pawn aPawn,int aAmount) {
    local SBDBAsyncCallback callback;
    local export editinline Game_PlayerItemManager itemManager;
    if (aPawn.itemManager != None && aAmount >= 0) {                            //0000 : 07 A6 00 82 77 19 00 28 FC 1F 11 05 00 04 01 B0 2D 19 11 2A 16 18 09 00 99 00 08 FE 1F 11 25 16 16 
      itemManager = Game_PlayerItemManager(aPawn.itemManager);                  //0021 : 0F 00 80 FE 1F 11 2E F0 92 5F 01 19 00 28 FC 1F 11 05 00 04 01 B0 2D 19 11 
      if (itemManager != None
        && itemManager.sv_UpdateMoney(-aAmount,callback)) {//003A : 07 A6 00 82 77 00 80 FE 1F 11 2A 16 18 1C 00 19 00 80 FE 1F 11 12 00 04 1C F8 FE 1F 11 8F 00 08 FE 1F 11 16 00 A8 FF 1F 11 16 16 
        ApiTrace("Attempted to remove" @ string(aAmount)
          @ "money from"
          @ GetCharacterName(aPawn));//0065 : 1B F3 0B 00 00 A8 A8 A8 1F 41 74 74 65 6D 70 74 65 64 20 74 6F 20 72 65 6D 6F 76 65 00 39 53 00 08 FE 1F 11 16 1F 6D 6F 6E 65 79 20 66 72 6F 6D 00 16 1C 20 00 20 11 00 28 FC 1F 11 16 16 16 
        return True;                                                            //00A4 : 04 27 
      }
    }
    ApiTrace("Couldn't remove" @ string(aAmount)
      @ "money from"
      @ GetCharacterName(aPawn));//00A6 : 1B F3 0B 00 00 A8 A8 A8 1F 43 6F 75 6C 64 6E 27 74 20 72 65 6D 6F 76 65 00 39 53 00 08 FE 1F 11 16 1F 6D 6F 6E 65 79 20 66 72 6F 6D 00 16 1C 20 00 20 11 00 28 FC 1F 11 16 16 16 
    return False;                                                               //00E1 : 04 28 
    //07 A6 00 82 77 19 00 28 FC 1F 11 05 00 04 01 B0 2D 19 11 2A 16 18 09 00 99 00 08 FE 1F 11 25 16 
    //16 0F 00 80 FE 1F 11 2E F0 92 5F 01 19 00 28 FC 1F 11 05 00 04 01 B0 2D 19 11 07 A6 00 82 77 00 
    //80 FE 1F 11 2A 16 18 1C 00 19 00 80 FE 1F 11 12 00 04 1C F8 FE 1F 11 8F 00 08 FE 1F 11 16 00 A8 
    //FF 1F 11 16 16 1B F3 0B 00 00 A8 A8 A8 1F 41 74 74 65 6D 70 74 65 64 20 74 6F 20 72 65 6D 6F 76 
    //65 00 39 53 00 08 FE 1F 11 16 1F 6D 6F 6E 65 79 20 66 72 6F 6D 00 16 1C 20 00 20 11 00 28 FC 1F 
    //11 16 16 16 04 27 1B F3 0B 00 00 A8 A8 A8 1F 43 6F 75 6C 64 6E 27 74 20 72 65 6D 6F 76 65 00 39 
    //53 00 08 FE 1F 11 16 1F 6D 6F 6E 65 79 20 66 72 6F 6D 00 16 1C 20 00 20 11 00 28 FC 1F 11 16 16 
    //16 04 28 04 0B 47 
  }


  final native function bool GiveMoney(Game_Pawn aPawn,int aAmount);


  final native function int GetMoney(Game_Pawn aPawn);


  function bool RemoveItems(Game_Pawn aPawn,Content_Inventory aItems,optional SBDBAsyncCallback callback) {
    if (aPawn.itemManager != None && aItems != None
      && !aItems.Empty()) { //0000 : 07 54 00 82 82 77 19 00 88 08 20 11 05 00 04 01 B0 2D 19 11 2A 16 18 09 00 77 00 F8 09 20 11 2A 16 16 18 12 00 81 19 00 F8 09 20 11 06 00 04 1C 70 0A 20 11 16 16 16 
      return aItems.RemoveFromInventory(aPawn,callback);                        //0037 : 04 19 00 F8 09 20 11 10 00 04 1B 51 0E 00 00 00 88 08 20 11 00 20 0B 20 11 16 
    } else {                                                                    //0051 : 06 93 00 
      ApiTrace("Couldn't remove" @ aItems.Description()
        @ "from"
        @ GetCharacterName(aPawn));//0054 : 1B F3 0B 00 00 A8 A8 A8 1F 43 6F 75 6C 64 6E 27 74 20 72 65 6D 6F 76 65 00 19 00 F8 09 20 11 06 00 00 1B 56 05 00 00 16 16 1F 66 72 6F 6D 00 16 1C 20 00 20 11 00 88 08 20 11 16 16 16 
      return False;                                                             //0091 : 04 28 
    }
    //07 54 00 82 82 77 19 00 88 08 20 11 05 00 04 01 B0 2D 19 11 2A 16 18 09 00 77 00 F8 09 20 11 2A 
    //16 16 18 12 00 81 19 00 F8 09 20 11 06 00 04 1C 70 0A 20 11 16 16 16 04 19 00 F8 09 20 11 10 00 
    //04 1B 51 0E 00 00 00 88 08 20 11 00 20 0B 20 11 16 06 93 00 1B F3 0B 00 00 A8 A8 A8 1F 43 6F 75 
    //6C 64 6E 27 74 20 72 65 6D 6F 76 65 00 19 00 F8 09 20 11 06 00 00 1B 56 05 00 00 16 16 1F 66 72 
    //6F 6D 00 16 1C 20 00 20 11 00 88 08 20 11 16 16 16 04 28 04 0B 47 
  }


  final native function bool GiveItems(Game_Pawn aPawn,Content_Inventory aItems);


  event bool CanReceiveItems(Game_Pawn aPawn,Content_Inventory aItems) {
    local int inv;
    local int Count;
    if (aPawn.itemManager == None) {                                            //0000 : 07 3D 00 72 19 00 10 0F 20 11 05 00 04 01 B0 2D 19 11 2A 16 
      ApiTrace(GetCharacterName(aPawn) @ "has no ItemManager");                 //0014 : 1B F3 0B 00 00 A8 1C 20 00 20 11 00 10 0F 20 11 16 1F 68 61 73 20 6E 6F 20 49 74 65 6D 4D 61 6E 61 67 65 72 00 16 16 
      return False;                                                             //003B : 04 28 
    }
    Count = aItems.SlotCount();                                                 //003D : 0F 00 60 11 20 11 19 00 D8 11 20 11 06 00 04 1B 53 0E 00 00 16 
    inv = aPawn.itemManager.GetFreeSlots(1);                                    //0052 : 0F 00 50 12 20 11 19 19 00 10 0F 20 11 05 00 04 01 B0 2D 19 11 08 00 04 1B 6E 05 00 00 24 01 16 
    if (Count > inv) {                                                          //0072 : 07 DC 00 97 00 60 11 20 11 00 50 12 20 11 16 
      ApiTrace(GetCharacterName(aPawn) @ "has only"
        @ string(inv)
        @ "inventory slots available for"
        @ string(Count)
        @ "items");//0081 : 1B F3 0B 00 00 A8 A8 A8 A8 A8 1C 20 00 20 11 00 10 0F 20 11 16 1F 68 61 73 20 6F 6E 6C 79 00 16 39 53 00 50 12 20 11 16 1F 69 6E 76 65 6E 74 6F 72 79 20 73 6C 6F 74 73 20 61 76 61 69 6C 61 62 6C 65 20 66 6F 72 00 16 39 53 00 60 11 20 11 16 1F 69 74 65 6D 73 00 16 16 
      return False;                                                             //00DA : 04 28 
    }
    ApiTrace(GetCharacterName(aPawn) @ "has an"
      @ string(inv)
      @ "inventory slots available for"
      @ string(Count)
      @ "items");//00DC : 1B F3 0B 00 00 A8 A8 A8 A8 A8 1C 20 00 20 11 00 10 0F 20 11 16 1F 68 61 73 20 61 6E 00 16 39 53 00 50 12 20 11 16 1F 69 6E 76 65 6E 74 6F 72 79 20 73 6C 6F 74 73 20 61 76 61 69 6C 61 62 6C 65 20 66 6F 72 00 16 39 53 00 60 11 20 11 16 1F 69 74 65 6D 73 00 16 16 
    return True;                                                                //0133 : 04 27 
    //07 3D 00 72 19 00 10 0F 20 11 05 00 04 01 B0 2D 19 11 2A 16 1B F3 0B 00 00 A8 1C 20 00 20 11 00 
    //10 0F 20 11 16 1F 68 61 73 20 6E 6F 20 49 74 65 6D 4D 61 6E 61 67 65 72 00 16 16 04 28 0F 00 60 
    //11 20 11 19 00 D8 11 20 11 06 00 04 1B 53 0E 00 00 16 0F 00 50 12 20 11 19 19 00 10 0F 20 11 05 
    //00 04 01 B0 2D 19 11 08 00 04 1B 6E 05 00 00 24 01 16 07 DC 00 97 00 60 11 20 11 00 50 12 20 11 
    //16 1B F3 0B 00 00 A8 A8 A8 A8 A8 1C 20 00 20 11 00 10 0F 20 11 16 1F 68 61 73 20 6F 6E 6C 79 00 
    //16 39 53 00 50 12 20 11 16 1F 69 6E 76 65 6E 74 6F 72 79 20 73 6C 6F 74 73 20 61 76 61 69 6C 61 
    //62 6C 65 20 66 6F 72 00 16 39 53 00 60 11 20 11 16 1F 69 74 65 6D 73 00 16 16 04 28 1B F3 0B 00 
    //00 A8 A8 A8 A8 A8 1C 20 00 20 11 00 10 0F 20 11 16 1F 68 61 73 20 61 6E 00 16 39 53 00 50 12 20 
    //11 16 1F 69 6E 76 65 6E 74 6F 72 79 20 73 6C 6F 74 73 20 61 76 61 69 6C 61 62 6C 65 20 66 6F 72 
    //00 16 39 53 00 60 11 20 11 16 1F 69 74 65 6D 73 00 16 16 04 27 04 0B 47 
  }


  final native function int CountItems(Game_Pawn aPawn,export editinline Item_Type aItem);


  function bool HasItems(Game_Pawn aPawn,Content_Inventory aItems) {
    if (aPawn.itemManager != None && !aItems.Empty()) {                         //0000 : 07 43 00 82 77 19 00 90 15 20 11 05 00 04 01 B0 2D 19 11 2A 16 18 12 00 81 19 00 08 16 20 11 06 00 04 1C 70 0A 20 11 16 16 16 
      if (aItems.HasItemsInInventory(aPawn)) {                                  //002A : 07 43 00 19 00 08 16 20 11 0B 00 04 1B 4A 0E 00 00 00 90 15 20 11 16 
        return True;                                                            //0041 : 04 27 
      }
    }
    ApiTrace(GetCharacterName(aPawn) @ "doesn't have"
      @ aItems.Description());//0043 : 1B F3 0B 00 00 A8 A8 1C 20 00 20 11 00 90 15 20 11 16 1F 64 6F 65 73 6E 27 74 20 68 61 76 65 00 16 19 00 08 16 20 11 06 00 00 1B 56 05 00 00 16 16 16 
    return False;                                                               //0075 : 04 28 
    //07 43 00 82 77 19 00 90 15 20 11 05 00 04 01 B0 2D 19 11 2A 16 18 12 00 81 19 00 08 16 20 11 06 
    //00 04 1C 70 0A 20 11 16 16 16 07 43 00 19 00 08 16 20 11 0B 00 04 1B 4A 0E 00 00 00 90 15 20 11 
    //16 04 27 1B F3 0B 00 00 A8 A8 1C 20 00 20 11 00 90 15 20 11 16 1F 64 6F 65 73 6E 27 74 20 68 61 
    //76 65 00 16 19 00 08 16 20 11 06 00 00 1B 56 05 00 00 16 16 16 04 28 04 0B 47 
  }


  final native function bool HasTargetActive(Game_Pawn aPawn,export editinline Quest_Target aTarget);


  function bool HasFailedTarget(Game_Pawn aPawn,export editinline Quest_Target aTarget) {
    local Game_PlayerPawn playerPawn;
    playerPawn = Game_PlayerPawn(aPawn);                                        //0000 : 0F 00 70 1A 20 11 2E F0 47 5B 01 00 F8 19 20 11 
    if (playerPawn != None && aTarget != None) {                                //0010 : 07 A1 00 82 77 00 70 1A 20 11 2A 16 18 09 00 77 00 E8 1A 20 11 2A 16 16 
      if (aTarget.Failed(playerPawn.questLog.GetTargetProgress(aTarget.GetQuest(),aTarget.GetIndex()))) {//0028 : 07 A1 00 19 00 E8 1A 20 11 3C 00 04 1C 60 1B 20 11 19 19 00 70 1A 20 11 05 00 04 01 F0 2F 7F 0F 24 00 04 1C 10 1C 20 11 19 00 E8 1A 20 11 06 00 04 1C C0 1C 20 11 16 19 00 E8 1A 20 11 06 00 04 1C 70 1D 20 11 16 16 16 
        ApiTrace(GetCharacterName(aPawn) @ "has failed target"
          @ string(aTarget));//0070 : 1B F3 0B 00 00 A8 A8 1C 20 00 20 11 00 F8 19 20 11 16 1F 68 61 73 20 66 61 69 6C 65 64 20 74 61 72 67 65 74 00 16 39 56 00 E8 1A 20 11 16 16 
        return True;                                                            //009F : 04 27 
      }
    }
    ApiTrace(GetCharacterName(aPawn) @ "hasn't failed target"
      @ string(aTarget));//00A1 : 1B F3 0B 00 00 A8 A8 1C 20 00 20 11 00 F8 19 20 11 16 1F 68 61 73 6E 27 74 20 66 61 69 6C 65 64 20 74 61 72 67 65 74 00 16 39 56 00 E8 1A 20 11 16 16 
    return False;                                                               //00D3 : 04 28 
    //0F 00 70 1A 20 11 2E F0 47 5B 01 00 F8 19 20 11 07 A1 00 82 77 00 70 1A 20 11 2A 16 18 09 00 77 
    //00 E8 1A 20 11 2A 16 16 07 A1 00 19 00 E8 1A 20 11 3C 00 04 1C 60 1B 20 11 19 19 00 70 1A 20 11 
    //05 00 04 01 F0 2F 7F 0F 24 00 04 1C 10 1C 20 11 19 00 E8 1A 20 11 06 00 04 1C C0 1C 20 11 16 19 
    //00 E8 1A 20 11 06 00 04 1C 70 1D 20 11 16 16 16 1B F3 0B 00 00 A8 A8 1C 20 00 20 11 00 F8 19 20 
    //11 16 1F 68 61 73 20 66 61 69 6C 65 64 20 74 61 72 67 65 74 00 16 39 56 00 E8 1A 20 11 16 16 04 
    //27 1B F3 0B 00 00 A8 A8 1C 20 00 20 11 00 F8 19 20 11 16 1F 68 61 73 6E 27 74 20 66 61 69 6C 65 
    //64 20 74 61 72 67 65 74 00 16 39 56 00 E8 1A 20 11 16 16 04 28 04 0B 47 
  }


  function bool HasCompletedTarget(Game_Pawn aPawn,export editinline Quest_Target aTarget) {
    local Game_PlayerPawn playerPawn;
    playerPawn = Game_PlayerPawn(aPawn);                                        //0000 : 0F 00 20 21 20 11 2E F0 47 5B 01 00 48 1F 20 11 
    if (playerPawn != None && aTarget != None) {                                //0010 : 07 A4 00 82 77 00 20 21 20 11 2A 16 18 09 00 77 00 98 21 20 11 2A 16 16 
      if (aTarget.Check(playerPawn.questLog.GetTargetProgress(aTarget.GetQuest(),aTarget.GetIndex()))) {//0028 : 07 A4 00 19 00 98 21 20 11 3C 00 04 1C 10 22 20 11 19 19 00 20 21 20 11 05 00 04 01 F0 2F 7F 0F 24 00 04 1C 10 1C 20 11 19 00 98 21 20 11 06 00 04 1C C0 1C 20 11 16 19 00 98 21 20 11 06 00 04 1C 70 1D 20 11 16 16 16 
        ApiTrace(GetCharacterName(aPawn) @ "has completed target"
          @ string(aTarget));//0070 : 1B F3 0B 00 00 A8 A8 1C 20 00 20 11 00 48 1F 20 11 16 1F 68 61 73 20 63 6F 6D 70 6C 65 74 65 64 20 74 61 72 67 65 74 00 16 39 56 00 98 21 20 11 16 16 
        return True;                                                            //00A2 : 04 27 
      }
    }
    ApiTrace(GetCharacterName(aPawn) @ "hasn't completed target"
      @ string(aTarget));//00A4 : 1B F3 0B 00 00 A8 A8 1C 20 00 20 11 00 48 1F 20 11 16 1F 68 61 73 6E 27 74 20 63 6F 6D 70 6C 65 74 65 64 20 74 61 72 67 65 74 00 16 39 56 00 98 21 20 11 16 16 
    return False;                                                               //00D9 : 04 28 
    //0F 00 20 21 20 11 2E F0 47 5B 01 00 48 1F 20 11 07 A4 00 82 77 00 20 21 20 11 2A 16 18 09 00 77 
    //00 98 21 20 11 2A 16 16 07 A4 00 19 00 98 21 20 11 3C 00 04 1C 10 22 20 11 19 19 00 20 21 20 11 
    //05 00 04 01 F0 2F 7F 0F 24 00 04 1C 10 1C 20 11 19 00 98 21 20 11 06 00 04 1C C0 1C 20 11 16 19 
    //00 98 21 20 11 06 00 04 1C 70 1D 20 11 16 16 16 1B F3 0B 00 00 A8 A8 1C 20 00 20 11 00 48 1F 20 
    //11 16 1F 68 61 73 20 63 6F 6D 70 6C 65 74 65 64 20 74 61 72 67 65 74 00 16 39 56 00 98 21 20 11 
    //16 16 04 27 1B F3 0B 00 00 A8 A8 1C 20 00 20 11 00 48 1F 20 11 16 1F 68 61 73 6E 27 74 20 63 6F 
    //6D 70 6C 65 74 65 64 20 74 61 72 67 65 74 00 16 39 56 00 98 21 20 11 16 16 04 28 04 0B 47 
  }


  final native function int TimesQuestFinished(Game_Pawn aPawn,export editinline Quest_Type aQuest);


  final native function bool FinishQuest(Game_Pawn aPawn,export editinline Quest_Type aQuest);


  final native function bool HasFailedQuest(Game_Pawn aPawn,export editinline Quest_Type aQuest);


  final native function bool HasCompletedQuest(Game_Pawn aPawn,export editinline Quest_Type aQuest,optional bool aNearly);


  final native function bool HasQuest(Game_Pawn aPawn,export editinline Quest_Type aQuest);


  function bool ObtainQuest(Game_Pawn aPawn,export editinline Quest_Type aQuest) {
    local Game_PlayerPawn playerPawn;
    playerPawn = Game_PlayerPawn(aPawn);                                        //0000 : 0F 00 A8 31 20 11 2E F0 47 5B 01 00 B8 2F 20 11 
    if (playerPawn != None && aQuest != None
      && playerPawn.questLog != None) {//0010 : 07 C2 00 82 82 77 00 A8 31 20 11 2A 16 18 09 00 77 00 20 32 20 11 2A 16 16 18 12 00 77 19 00 A8 31 20 11 05 00 04 01 F0 2F 7F 0F 2A 16 16 
      if (playerPawn.questLog.sv_AcceptQuest(aQuest)) {                         //003E : 07 8A 00 19 19 00 A8 31 20 11 05 00 04 01 F0 2F 7F 0F 0B 00 04 1C 98 32 20 11 00 20 32 20 11 16 
        ApiTrace(GetCharacterName(aPawn) @ "got quest"
          @ string(aQuest));//005E : 1B F3 0B 00 00 A8 A8 1C 20 00 20 11 00 B8 2F 20 11 16 1F 67 6F 74 20 71 75 65 73 74 00 16 39 56 00 20 32 20 11 16 16 
        return True;                                                            //0085 : 04 27 
      } else {                                                                  //0087 : 06 BF 00 
        ApiTrace(GetCharacterName(aPawn) @ "couldn't accept quest"
          @ string(aQuest));//008A : 1B F3 0B 00 00 A8 A8 1C 20 00 20 11 00 B8 2F 20 11 16 1F 63 6F 75 6C 64 6E 27 74 20 61 63 63 65 70 74 20 71 75 65 73 74 00 16 39 56 00 20 32 20 11 16 16 
        return False;                                                           //00BD : 04 28 
      }
    } else {                                                                    //00BF : 06 F2 00 
      ApiTrace(GetCharacterName(aPawn) @ "didn't get quest"
        @ string(aQuest));//00C2 : 1B F3 0B 00 00 A8 A8 1C 20 00 20 11 00 B8 2F 20 11 16 1F 64 69 64 6E 27 74 20 67 65 74 20 71 75 65 73 74 00 16 39 56 00 20 32 20 11 16 16 
      return False;                                                             //00F0 : 04 28 
    }
    //0F 00 A8 31 20 11 2E F0 47 5B 01 00 B8 2F 20 11 07 C2 00 82 82 77 00 A8 31 20 11 2A 16 18 09 00 
    //77 00 20 32 20 11 2A 16 16 18 12 00 77 19 00 A8 31 20 11 05 00 04 01 F0 2F 7F 0F 2A 16 16 07 8A 
    //00 19 19 00 A8 31 20 11 05 00 04 01 F0 2F 7F 0F 0B 00 04 1C 98 32 20 11 00 20 32 20 11 16 1B F3 
    //0B 00 00 A8 A8 1C 20 00 20 11 00 B8 2F 20 11 16 1F 67 6F 74 20 71 75 65 73 74 00 16 39 56 00 20 
    //32 20 11 16 16 04 27 06 BF 00 1B F3 0B 00 00 A8 A8 1C 20 00 20 11 00 B8 2F 20 11 16 1F 63 6F 75 
    //6C 64 6E 27 74 20 61 63 63 65 70 74 20 71 75 65 73 74 00 16 39 56 00 20 32 20 11 16 16 04 28 06 
    //F2 00 1B F3 0B 00 00 A8 A8 1C 20 00 20 11 00 B8 2F 20 11 16 1F 64 69 64 6E 27 74 20 67 65 74 20 
    //71 75 65 73 74 00 16 39 56 00 20 32 20 11 16 16 04 28 04 0B 47 
  }


  final native function bool MeetsRequirementsQuest(Game_Pawn aPawn,export editinline Quest_Type aQuest);


  final native function int GetPeP(Game_Pawn aPawn);


  final native function int GetLevel(Game_Pawn aPawn);


  function Game_NPCPawn FindNPC(Game_Pawn aFrom,export editinline NPC_Type aType,float aRadius) {
    local Game_Pawn foundPawn;
    local Game_NPCPawn foundNPC;
    foreach aFrom.RadiusActors(Class'Game_Pawn',foundPawn,aRadius) {            //0000 : 2F 19 00 70 3A 20 11 12 00 00 61 36 20 18 38 5B 01 00 60 3C 20 11 00 D8 3C 20 11 16 A4 00 
      foundNPC = Game_NPCPawn(foundPawn);                                       //001E : 0F 00 50 3D 20 11 2E D0 32 5B 01 00 60 3C 20 11 
      if (foundNPC != None && foundNPC.NPCType == aType) {                      //002E : 07 A3 00 82 77 00 50 3D 20 11 2A 16 18 16 00 72 19 00 50 3D 20 11 05 00 04 01 00 47 1B 11 00 C8 3D 20 11 16 16 
        ApiTrace("Found NPC" @ string(aType) @ string(foundNPC)
          @ "within"
          @ string(aRadius)
          @ "of"
          @ GetCharacterName(aFrom));//0053 : 1B F3 0B 00 00 A8 A8 A8 A8 A8 A8 1F 46 6F 75 6E 64 20 4E 50 43 00 39 56 00 C8 3D 20 11 16 39 56 00 50 3D 20 11 16 1F 77 69 74 68 69 6E 00 16 39 55 00 D8 3C 20 11 16 1F 6F 66 00 16 1C 20 00 20 11 00 70 3A 20 11 16 16 16 
        return foundNPC;                                                        //009D : 04 00 50 3D 20 11 
      }
    }
    ApiTrace("Didn't find NPC" @ string(aType)
      @ "within"
      @ string(aRadius)
      @ "of"
      @ GetCharacterName(aFrom));//00A5 : 1B F3 0B 00 00 A8 A8 A8 A8 A8 1F 44 69 64 6E 27 74 20 66 69 6E 64 20 4E 50 43 00 39 56 00 C8 3D 20 11 16 1F 77 69 74 68 69 6E 00 16 39 55 00 D8 3C 20 11 16 1F 6F 66 00 16 1C 20 00 20 11 00 70 3A 20 11 16 16 16 
    return None;                                                                //00EB : 04 2A 
    //2F 19 00 70 3A 20 11 12 00 00 61 36 20 18 38 5B 01 00 60 3C 20 11 00 D8 3C 20 11 16 A4 00 0F 00 
    //50 3D 20 11 2E D0 32 5B 01 00 60 3C 20 11 07 A3 00 82 77 00 50 3D 20 11 2A 16 18 16 00 72 19 00 
    //50 3D 20 11 05 00 04 01 00 47 1B 11 00 C8 3D 20 11 16 16 1B F3 0B 00 00 A8 A8 A8 A8 A8 A8 1F 46 
    //6F 75 6E 64 20 4E 50 43 00 39 56 00 C8 3D 20 11 16 39 56 00 50 3D 20 11 16 1F 77 69 74 68 69 6E 
    //00 16 39 55 00 D8 3C 20 11 16 1F 6F 66 00 16 1C 20 00 20 11 00 70 3A 20 11 16 16 16 30 04 00 50 
    //3D 20 11 31 30 1B F3 0B 00 00 A8 A8 A8 A8 A8 1F 44 69 64 6E 27 74 20 66 69 6E 64 20 4E 50 43 00 
    //39 56 00 C8 3D 20 11 16 1F 77 69 74 68 69 6E 00 16 39 55 00 D8 3C 20 11 16 1F 6F 66 00 16 1C 20 
    //00 20 11 00 70 3A 20 11 16 16 16 04 2A 04 0B 47 
  }


  function bool ClaustroportPawn(Game_Pawn aPawn,Vector Location,Rotator Rotation) {
    local Game_PlayerController PlayerController;
    PlayerController = Game_PlayerController(aPawn.Controller);                 //0000 : 0F 00 00 41 20 11 2E 90 18 5B 01 19 00 68 3F 20 11 05 00 04 01 00 6E 6C 0F 
    if (aPawn.sv_TeleportTo(Location,Rotation)) {                               //0019 : 07 70 00 19 00 68 3F 20 11 10 00 04 1B 4A 07 00 00 00 78 41 20 11 00 F0 41 20 11 16 
      ApiTrace("Teleporting" @ GetCharacterName(aPawn)
        @ "to location"
        @ string(Location));//0035 : 1B F3 0B 00 00 A8 A8 A8 1F 54 65 6C 65 70 6F 72 74 69 6E 67 00 1C 20 00 20 11 00 68 3F 20 11 16 16 1F 74 6F 20 6C 6F 63 61 74 69 6F 6E 00 16 39 58 00 78 41 20 11 16 16 
    } else {                                                                    //006D : 06 AF 00 
      ApiTrace("Failed to teleport" @ GetCharacterName(aPawn)
        @ "to location"
        @ string(Location));//0070 : 1B F3 0B 00 00 A8 A8 A8 1F 46 61 69 6C 65 64 20 74 6F 20 74 65 6C 65 70 6F 72 74 00 1C 20 00 20 11 00 68 3F 20 11 16 16 1F 74 6F 20 6C 6F 63 61 74 69 6F 6E 00 16 39 58 00 78 41 20 11 16 16 
    }
    return True;                                                                //00AF : 04 27 
    //0F 00 00 41 20 11 2E 90 18 5B 01 19 00 68 3F 20 11 05 00 04 01 00 6E 6C 0F 07 70 00 19 00 68 3F 
    //20 11 10 00 04 1B 4A 07 00 00 00 78 41 20 11 00 F0 41 20 11 16 1B F3 0B 00 00 A8 A8 A8 1F 54 65 
    //6C 65 70 6F 72 74 69 6E 67 00 1C 20 00 20 11 00 68 3F 20 11 16 16 1F 74 6F 20 6C 6F 63 61 74 69 
    //6F 6E 00 16 39 58 00 78 41 20 11 16 16 06 AF 00 1B F3 0B 00 00 A8 A8 A8 1F 46 61 69 6C 65 64 20 
    //74 6F 20 74 65 6C 65 70 6F 72 74 00 1C 20 00 20 11 00 68 3F 20 11 16 16 1F 74 6F 20 6C 6F 63 61 
    //74 69 6F 6E 00 16 39 58 00 78 41 20 11 16 16 04 27 04 0B 47 
  }


  function bool TeleportPawn(Game_Pawn aPawn,int aWorld,bool Instance,string aStart) {
    local Game_PlayerController PlayerController;
    local Game_GameServer Engine;
    PlayerController = Game_PlayerController(aPawn.Controller);                 //0000 : 0F 00 78 45 20 11 2E 90 18 5B 01 19 00 90 43 20 11 05 00 04 01 00 6E 6C 0F 
    Engine = Game_GameServer(Class'Actor'.static.GetGameEngine());              //0019 : 0F 00 F0 45 20 11 2E 18 D9 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 
    if (PlayerController != None) {                                             //0033 : 07 AE 00 77 00 78 45 20 11 2A 16 
      ApiTrace("Teleporting" @ GetCharacterName(aPawn)
        @ "to world"
        @ string(aWorld)
        @ "at"
        @ aStart);//003E : 1B F3 0B 00 00 A8 A8 A8 A8 A8 1F 54 65 6C 65 70 6F 72 74 69 6E 67 00 1C 20 00 20 11 00 90 43 20 11 16 16 1F 74 6F 20 77 6F 72 6C 64 00 16 39 53 00 68 46 20 11 16 1F 61 74 00 16 00 E0 46 20 11 16 16 
      Engine.LoginToWorldByID(aWorld,PlayerController.CharacterID,aStart,"");   //0080 : 19 00 F0 45 20 11 20 00 04 1B C7 0C 00 00 00 68 46 20 11 19 00 78 45 20 11 05 00 04 01 68 3B 19 11 00 E0 46 20 11 1F 00 16 
      return True;                                                              //00A9 : 04 27 
    } else {                                                                    //00AB : 06 EA 00 
      ApiTrace("Not teleporting non-player controlled"
        @ GetCharacterName(aPawn));//00AE : 1B F3 0B 00 00 A8 1F 4E 6F 74 20 74 65 6C 65 70 6F 72 74 69 6E 67 20 6E 6F 6E 2D 70 6C 61 79 65 72 20 63 6F 6E 74 72 6F 6C 6C 65 64 00 1C 20 00 20 11 00 90 43 20 11 16 16 16 
      return False;                                                             //00E8 : 04 28 
    }
    //0F 00 78 45 20 11 2E 90 18 5B 01 19 00 90 43 20 11 05 00 04 01 00 6E 6C 0F 0F 00 F0 45 20 11 2E 
    //18 D9 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 07 AE 00 77 00 78 45 20 11 2A 16 1B F3 
    //0B 00 00 A8 A8 A8 A8 A8 1F 54 65 6C 65 70 6F 72 74 69 6E 67 00 1C 20 00 20 11 00 90 43 20 11 16 
    //16 1F 74 6F 20 77 6F 72 6C 64 00 16 39 53 00 68 46 20 11 16 1F 61 74 00 16 00 E0 46 20 11 16 16 
    //19 00 F0 45 20 11 20 00 04 1B C7 0C 00 00 00 68 46 20 11 19 00 78 45 20 11 05 00 04 01 68 3B 19 
    //11 00 E0 46 20 11 1F 00 16 04 27 06 EA 00 1B F3 0B 00 00 A8 1F 4E 6F 74 20 74 65 6C 65 70 6F 72 
    //74 69 6E 67 20 6E 6F 6E 2D 70 6C 61 79 65 72 20 63 6F 6E 74 72 6F 6C 6C 65 64 00 1C 20 00 20 11 
    //00 90 43 20 11 16 16 16 04 28 04 0B 47 
  }


  function FindRadiusActors(class<Actor> aClass,Actor aOrigin,float aRange,name aTag,out array<Actor> oActors) {
    local Actor someActor;
    ApiTrace("Finding actors of type" @ string(aClass)
      @ "with tag '"
      $ string(aTag)
      $ "' within"
      @ string(aRange)
      $ "uu of "
      @ string(aOrigin));//0000 : 1B F3 0B 00 00 A8 70 A8 70 70 A8 A8 1F 46 69 6E 64 69 6E 67 20 61 63 74 6F 72 73 20 6F 66 20 74 79 70 65 00 39 56 00 F8 48 20 11 16 1F 77 69 74 68 20 74 61 67 20 27 00 16 39 57 00 78 49 20 11 16 1F 27 20 77 69 74 68 69 6E 00 16 39 55 00 F0 49 20 11 16 1F 75 75 20 6F 66 20 00 16 39 56 00 68 4A 20 11 16 16 
    foreach aOrigin.RadiusActors(aClass,someActor,aRange) {                     //0066 : 2F 19 00 68 4A 20 11 12 00 00 61 36 00 F8 48 20 11 00 E0 4A 20 11 00 F0 49 20 11 16 C3 00 
      if (string(aTag) == "None" || someActor.Tag == aTag) {                    //0084 : 07 C2 00 84 7A 39 57 00 78 49 20 11 1F 4E 6F 6E 65 00 16 18 16 00 FE 19 00 E0 4A 20 11 05 00 04 01 C0 9E 6C 0F 00 78 49 20 11 16 16 
        oActors[oActors.Length] = someActor;                                    //00B0 : 0F 10 37 00 58 4B 20 11 00 58 4B 20 11 00 E0 4A 20 11 
      }
    }
    //1B F3 0B 00 00 A8 70 A8 70 70 A8 A8 1F 46 69 6E 64 69 6E 67 20 61 63 74 6F 72 73 20 6F 66 20 74 
    //79 70 65 00 39 56 00 F8 48 20 11 16 1F 77 69 74 68 20 74 61 67 20 27 00 16 39 57 00 78 49 20 11 
    //16 1F 27 20 77 69 74 68 69 6E 00 16 39 55 00 F0 49 20 11 16 1F 75 75 20 6F 66 20 00 16 39 56 00 
    //68 4A 20 11 16 16 2F 19 00 68 4A 20 11 12 00 00 61 36 00 F8 48 20 11 00 E0 4A 20 11 00 F0 49 20 
    //11 16 C3 00 07 C2 00 84 7A 39 57 00 78 49 20 11 1F 4E 6F 6E 65 00 16 18 16 00 FE 19 00 E0 4A 20 
    //11 05 00 04 01 C0 9E 6C 0F 00 78 49 20 11 16 16 0F 10 37 00 58 4B 20 11 00 58 4B 20 11 00 E0 4A 
    //20 11 31 30 04 0B 47 
  }


  function Actor FindClosestActor(class<Actor> aClass,Actor aOrigin,name aTag) {
    local float closestDistance;
    local Actor closestActor;
    local float Distance;
    local Actor someActor;
    ApiTrace("Finding the of type" @ string(aClass)
      @ "and tag '"
      $ string(aTag)
      $ "' closest to"
      @ string(aOrigin));//0000 : 1B F3 0B 00 00 A8 70 70 A8 A8 1F 46 69 6E 64 69 6E 67 20 74 68 65 20 6F 66 20 74 79 70 65 00 39 56 00 F8 4C 20 11 16 1F 61 6E 64 20 74 61 67 20 27 00 16 39 57 00 00 4F 20 11 16 1F 27 20 63 6C 6F 73 65 73 74 20 74 6F 00 16 39 56 00 78 4F 20 11 16 16 
    foreach aOrigin.AllActors(aClass,someActor) {                               //0053 : 2F 19 00 78 4F 20 11 0D 00 00 61 30 00 F8 4C 20 11 00 F0 4F 20 11 16 F1 00 
      if (string(aTag) == "None" || someActor.Tag == aTag) {                    //006C : 07 F0 00 84 7A 39 57 00 00 4F 20 11 1F 4E 6F 6E 65 00 16 18 16 00 FE 19 00 F0 4F 20 11 05 00 04 01 C0 9E 6C 0F 00 00 4F 20 11 16 16 
        Distance = VSize(aOrigin.Location - someActor.Location);                //0098 : 0F 00 68 50 20 11 E1 D8 19 00 78 4F 20 11 05 00 0C 01 30 81 6C 0F 19 00 F0 4F 20 11 05 00 0C 01 30 81 6C 0F 16 16 
        if (closestActor == None || Distance < closestDistance) {               //00BE : 07 F0 00 84 72 00 E0 50 20 11 2A 16 18 0D 00 B0 00 68 50 20 11 00 58 51 20 11 16 16 
          closestDistance = Distance;                                           //00DA : 0F 00 58 51 20 11 00 68 50 20 11 
          closestActor = someActor;                                             //00E5 : 0F 00 E0 50 20 11 00 F0 4F 20 11 
        }
      }
    }
    return closestActor;                                                        //00F2 : 04 00 E0 50 20 11 
    //1B F3 0B 00 00 A8 70 70 A8 A8 1F 46 69 6E 64 69 6E 67 20 74 68 65 20 6F 66 20 74 79 70 65 00 39 
    //56 00 F8 4C 20 11 16 1F 61 6E 64 20 74 61 67 20 27 00 16 39 57 00 00 4F 20 11 16 1F 27 20 63 6C 
    //6F 73 65 73 74 20 74 6F 00 16 39 56 00 78 4F 20 11 16 16 2F 19 00 78 4F 20 11 0D 00 00 61 30 00 
    //F8 4C 20 11 00 F0 4F 20 11 16 F1 00 07 F0 00 84 7A 39 57 00 00 4F 20 11 1F 4E 6F 6E 65 00 16 18 
    //16 00 FE 19 00 F0 4F 20 11 05 00 04 01 C0 9E 6C 0F 00 00 4F 20 11 16 16 0F 00 68 50 20 11 E1 D8 
    //19 00 78 4F 20 11 05 00 0C 01 30 81 6C 0F 19 00 F0 4F 20 11 05 00 0C 01 30 81 6C 0F 16 16 07 F0 
    //00 84 72 00 E0 50 20 11 2A 16 18 0D 00 B0 00 68 50 20 11 00 58 51 20 11 16 16 0F 00 58 51 20 11 
    //00 68 50 20 11 0F 00 E0 50 20 11 00 F0 4F 20 11 31 30 04 00 E0 50 20 11 04 0B 47 
  }


  static native function Vector RandomRadiusLocation(Actor aOrigin,float aRadius,float aHeight,bool aLoSSpawning,Vector aExtent,bool aOnGround);


  static native function Vector NearestValidLocation(Actor RefActor,Vector aLocation,Vector aExtent,bool aOnGround);


  static native function bool ValidLocation(Actor RefActor,Vector aLocation,Vector aExtent);


  static native function Vector ProjectLocationOnGround(Actor aActor,Vector aOrigin,optional Vector aExtent);


  final native function int GetWorld(Game_Pawn aPawn);


  final native function bool Compare(int aValue,byte aOp,int aTarget);


  function string OperatorToString(byte aOp) {
    switch (aOp) {                                                              //0000 : 05 01 00 38 84 20 11 
      case 0 :                                                                  //0007 : 0A 11 00 24 00 
        return "==";                                                            //000C : 04 1F 3D 3D 00 
      case 1 :                                                                  //0011 : 0A 1B 00 24 01 
        return "!=";                                                            //0016 : 04 1F 21 3D 00 
      case 2 :                                                                  //001B : 0A 24 00 24 02 
        return "<";                                                             //0020 : 04 1F 3C 00 
      case 3 :                                                                  //0024 : 0A 2D 00 24 03 
        return ">";                                                             //0029 : 04 1F 3E 00 
      case 4 :                                                                  //002D : 0A 37 00 24 04 
        return "<=";                                                            //0032 : 04 1F 3C 3D 00 
      case 5 :                                                                  //0037 : 0A 41 00 24 05 
        return ">=";                                                            //003C : 04 1F 3E 3D 00 
      case 6 :                                                                  //0041 : 0A 4A 00 24 06 
        return "&";                                                             //0046 : 04 1F 26 00 
      case 7 :                                                                  //004A : 0A 54 00 24 07 
        return "!&";                                                            //004F : 04 1F 21 26 00 
      default:                                                                  //0054 : 0A FF FF 
        return "INVALID";                                                       //0057 : 04 1F 49 4E 56 41 4C 49 44 00 
      }
    }
    //05 01 00 38 84 20 11 0A 11 00 24 00 04 1F 3D 3D 00 0A 1B 00 24 01 04 1F 21 3D 00 0A 24 00 24 02 
    //04 1F 3C 00 0A 2D 00 24 03 04 1F 3E 00 0A 37 00 24 04 04 1F 3C 3D 00 0A 41 00 24 05 04 1F 3E 3D 
    //00 0A 4A 00 24 06 04 1F 26 00 0A 54 00 24 07 04 1F 21 26 00 0A FF FF 04 1F 49 4E 56 41 4C 49 44 
    //00 04 0B 47 
  }


  function string GetTimeText(int aSeconds) {
    local string ret;
    if (Abs(aSeconds) > 60) {                                                   //0000 : 07 68 00 B1 BA 39 3F 00 90 86 20 11 16 39 3F 2C 3C 16 
      ret = string(aSeconds / 60)
        @ Class'StringReferences'.default.minStr.Text;//0012 : 0F 00 00 88 20 11 A8 39 53 91 00 90 86 20 11 2C 3C 16 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 88 87 1C 11 16 
    } else {                                                                    //0065 : 06 8A 00 
      ret = string(aSeconds)
        @ Class'StringReferences'.default.sec.Text;//0068 : 0F 00 00 88 20 11 A8 39 53 00 90 86 20 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 10 87 1C 11 16 
    }
    return ret;                                                                 //008A : 04 00 00 88 20 11 
    //07 68 00 B1 BA 39 3F 00 90 86 20 11 16 39 3F 2C 3C 16 0F 00 00 88 20 11 A8 39 53 91 00 90 86 20 
    //11 2C 3C 16 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 88 87 1C 11 16 0E 61 43 00 00 88 20 11 
    //A8 39 55 AD 39 3F 00 90 86 20 11 39 3F 2C 3C 16 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 10 
    //87 1C 11 16 16 06 8A 00 0F 00 00 88 20 11 A8 39 53 00 90 86 20 11 36 58 C6 6B 0F 12 20 20 F7 60 
    //01 05 00 0C 02 10 87 1C 11 16 04 00 00 88 20 11 04 0B 47 
  }


  function string GetMoneyText(int aMoney) {
    local int coins0;
    local int coins1;
    local int coins2;
    local string ret;
    coins0 = aMoney % 100;                                                      //0000 : 0F 00 38 8C 20 11 39 44 AD 39 3F 00 A0 89 20 11 39 3F 2C 64 16 
    coins1 = aMoney / 100 % 100;                                                //0015 : 0F 00 B0 8C 20 11 39 44 AD 39 3F 91 00 A0 89 20 11 2C 64 16 39 3F 2C 64 16 
    coins2 = aMoney / 10000;                                                    //002E : 0F 00 28 8D 20 11 91 00 A0 89 20 11 1D 10 27 00 00 16 
    if (aMoney > 0) {                                                           //0040 : 07 4F 01 97 00 A0 89 20 11 25 16 
      if (coins0 > 1) {                                                         //004B : 07 77 00 97 00 38 8C 20 11 26 16 
        ret = string(coins0) @ GetCoinName(0,True)
          @ ret;             //0056 : 0F 00 A0 8D 20 11 A8 A8 39 53 00 38 8C 20 11 1B 45 0C 00 00 25 27 16 16 00 A0 8D 20 11 16 
      } else {                                                                  //0074 : 06 A0 00 
        if (coins0 == 1) {                                                      //0077 : 07 A0 00 9A 00 38 8C 20 11 26 16 
          ret = string(coins0) @ GetCoinName(0,False)
            @ ret;        //0082 : 0F 00 A0 8D 20 11 A8 A8 39 53 00 38 8C 20 11 1B 45 0C 00 00 25 28 16 16 00 A0 8D 20 11 16 
        }
      }
      if (coins1 > 1) {                                                         //00A0 : 07 CC 00 97 00 B0 8C 20 11 26 16 
        ret = string(coins1) @ GetCoinName(1,True)
          @ ret;             //00AB : 0F 00 A0 8D 20 11 A8 A8 39 53 00 B0 8C 20 11 1B 45 0C 00 00 26 27 16 16 00 A0 8D 20 11 16 
      } else {                                                                  //00C9 : 06 F5 00 
        if (coins1 == 1) {                                                      //00CC : 07 F5 00 9A 00 B0 8C 20 11 26 16 
          ret = string(coins1) @ GetCoinName(1,False)
            @ ret;        //00D7 : 0F 00 A0 8D 20 11 A8 A8 39 53 00 B0 8C 20 11 1B 45 0C 00 00 26 28 16 16 00 A0 8D 20 11 16 
        }
      }
      if (coins2 > 1) {                                                         //00F5 : 07 22 01 97 00 28 8D 20 11 26 16 
        ret = string(coins2) @ GetCoinName(2,True)
          @ ret;             //0100 : 0F 00 A0 8D 20 11 A8 A8 39 53 00 28 8D 20 11 1B 45 0C 00 00 2C 02 27 16 16 00 A0 8D 20 11 16 
      } else {                                                                  //011F : 06 4C 01 
        if (coins2 == 1) {                                                      //0122 : 07 4C 01 9A 00 28 8D 20 11 26 16 
          ret = string(coins2) @ GetCoinName(2,False)
            @ ret;        //012D : 0F 00 A0 8D 20 11 A8 A8 39 53 00 28 8D 20 11 1B 45 0C 00 00 2C 02 28 16 16 00 A0 8D 20 11 16 
        }
      }
    } else {                                                                    //014C : 06 62 01 
      ret = "0" @ GetCoinName(0,True);                                          //014F : 0F 00 A0 8D 20 11 A8 1F 30 00 1B 45 0C 00 00 25 27 16 16 
    }
    return ret;                                                                 //0162 : 04 00 A0 8D 20 11 
    //0F 00 38 8C 20 11 39 44 AD 39 3F 00 A0 89 20 11 39 3F 2C 64 16 0F 00 B0 8C 20 11 39 44 AD 39 3F 
    //91 00 A0 89 20 11 2C 64 16 39 3F 2C 64 16 0F 00 28 8D 20 11 91 00 A0 89 20 11 1D 10 27 00 00 16 
    //07 4F 01 97 00 A0 89 20 11 25 16 07 77 00 97 00 38 8C 20 11 26 16 0F 00 A0 8D 20 11 A8 A8 39 53 
    //00 38 8C 20 11 1B 45 0C 00 00 25 27 16 16 00 A0 8D 20 11 16 06 A0 00 07 A0 00 9A 00 38 8C 20 11 
    //26 16 0F 00 A0 8D 20 11 A8 A8 39 53 00 38 8C 20 11 1B 45 0C 00 00 25 28 16 16 00 A0 8D 20 11 16 
    //07 CC 00 97 00 B0 8C 20 11 26 16 0F 00 A0 8D 20 11 A8 A8 39 53 00 B0 8C 20 11 1B 45 0C 00 00 26 
    //27 16 16 00 A0 8D 20 11 16 06 F5 00 07 F5 00 9A 00 B0 8C 20 11 26 16 0F 00 A0 8D 20 11 A8 A8 39 
    //53 00 B0 8C 20 11 1B 45 0C 00 00 26 28 16 16 00 A0 8D 20 11 16 07 22 01 97 00 28 8D 20 11 26 16 
    //0F 00 A0 8D 20 11 A8 A8 39 53 00 28 8D 20 11 1B 45 0C 00 00 2C 02 27 16 16 00 A0 8D 20 11 16 06 
    //4C 01 07 4C 01 9A 00 28 8D 20 11 26 16 0F 00 A0 8D 20 11 A8 A8 39 53 00 28 8D 20 11 1B 45 0C 00 
    //00 2C 02 28 16 16 00 A0 8D 20 11 16 06 62 01 0F 00 A0 8D 20 11 A8 1F 30 00 1B 45 0C 00 00 25 27 
    //16 16 04 00 A0 8D 20 11 04 0B 47 
  }


  native function string GetCoinName(int aLevel,bool aPlural);


  function string ParseText(string aActiveText,Object aSpeaker,Object aSubject,Object aTarget) {
    local Game_Controller PlayerController;
    PlayerController = GetPlayer();                                             //0000 : 0F 00 08 3A 1F 11 1B 03 0E 00 00 16 
    if (PlayerController.SBRole == 4) {                                         //000C : 07 5B 00 9A 39 3A 19 00 08 3A 1F 11 05 00 01 01 40 B2 6C 0F 39 3A 24 04 16 
      return Game_PlayerController(PlayerController).TextParser.Parse(aActiveText,aSpeaker,aSubject,aTarget,0);//0025 : 04 19 19 2E 90 18 5B 01 00 08 3A 1F 11 05 00 04 01 50 07 1B 11 1B 00 00 1B 2F 0D 00 00 00 D8 38 1F 11 00 80 3A 1F 11 00 F8 3A 1F 11 00 70 3B 1F 11 25 16 
    } else {                                                                    //0058 : 06 61 00 
      return aActiveText;                                                       //005B : 04 00 D8 38 1F 11 
    }
    //0F 00 08 3A 1F 11 1B 03 0E 00 00 16 07 5B 00 9A 39 3A 19 00 08 3A 1F 11 05 00 01 01 40 B2 6C 0F 
    //39 3A 24 04 16 04 19 19 2E 90 18 5B 01 00 08 3A 1F 11 05 00 04 01 50 07 1B 11 1B 00 00 1B 2F 0D 
    //00 00 00 D8 38 1F 11 00 80 3A 1F 11 00 F8 3A 1F 11 00 70 3B 1F 11 25 16 06 61 00 04 00 D8 38 1F 
    //11 04 0B 47 
  }


  native function Game_Controller GetPlayer();


  event string GetActiveText(Game_ActiveTextItem aItem) {
    return "???";                                                               //0000 : 04 1F 3F 3F 3F 00 
    //04 1F 3F 3F 3F 00 04 0B 47 
  }


  final native function string GetCharacterName(Game_Pawn aPawn);


  function ApiTrace(string aText) {
    if (ApiTracing()) {                                                         //0000 : 07 09 00 1B A2 0F 00 00 16 
    }
    //07 09 00 1B A2 0F 00 00 16 04 0B 47 
  }


  function bool ApiTracing() {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }



