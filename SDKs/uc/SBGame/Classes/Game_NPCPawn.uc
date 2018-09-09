//==============================================================================
//  Game_NPCPawn
//==============================================================================

class Game_NPCPawn extends Game_TransientPawn
    native
    exportstructs
    dependsOn(NPC_Type,Game_PlayerController,Class,Content_Type,Game_Controller,Game_Conversation,Actor,Game_CombatStats,Game_PlayerTeams,Game_CharacterStats,Game_Character,NPC_Taxonomy,Loot_Manager,SBDBSync,Base_GameClient,PlayerController,Game_PlayerPawn,Player,Game_Desktop,Conversation_Topic,Game_Emotes,Shop_Base,Game_RadialMenuOptions,Pawn,Game_PlayerConversation,Game_GUI,Object,Game_Trading,Game_PlayerQuestLog,Game_QuestLog)
    Config(User)
  ;

  enum ENPCMovementFlags {
    ENMF_Normal ,
    ENMF_Walking ,
    ENMF_Backwards ,
    ENPCMovementFlags_RESERVED_3 ,
    ENMF_Strafing ,
    ENPCMovementFlags_RESERVED_5 ,
    ENPCMovementFlags_RESERVED_6 ,
    ENPCMovementFlags_RESERVED_7 ,
    ENMF_Jumping ,
    ENPCMovementFlags_RESERVED_9 ,
    ENPCMovementFlags_RESERVED_10 ,
    ENPCMovementFlags_RESERVED_11 ,
    ENPCMovementFlags_RESERVED_12 ,
    ENPCMovementFlags_RESERVED_13 ,
    ENPCMovementFlags_RESERVED_14 ,
    ENPCMovementFlags_RESERVED_15 ,
    ENMF_Crouching ,
    ENPCMovementFlags_RESERVED_17 ,
    ENPCMovementFlags_RESERVED_18 ,
    ENPCMovementFlags_RESERVED_19 ,
    ENPCMovementFlags_RESERVED_20 ,
    ENPCMovementFlags_RESERVED_21 ,
    ENPCMovementFlags_RESERVED_22 ,
    ENPCMovementFlags_RESERVED_23 ,
    ENPCMovementFlags_RESERVED_24 ,
    ENPCMovementFlags_RESERVED_25 ,
    ENPCMovementFlags_RESERVED_26 ,
    ENPCMovementFlags_RESERVED_27 ,
    ENPCMovementFlags_RESERVED_28 ,
    ENPCMovementFlags_RESERVED_29 ,
    ENPCMovementFlags_RESERVED_30 ,
    ENPCMovementFlags_RESERVED_31 ,
    ENMF_Sitting ,
    ENPCMovementFlags_RESERVED_33 ,
    ENPCMovementFlags_RESERVED_34 ,
    ENPCMovementFlags_RESERVED_35 ,
    ENPCMovementFlags_RESERVED_36 ,
    ENPCMovementFlags_RESERVED_37 ,
    ENPCMovementFlags_RESERVED_38 ,
    ENPCMovementFlags_RESERVED_39 ,
    ENPCMovementFlags_RESERVED_40 ,
    ENPCMovementFlags_RESERVED_41 ,
    ENPCMovementFlags_RESERVED_42 ,
    ENPCMovementFlags_RESERVED_43 ,
    ENPCMovementFlags_RESERVED_44 ,
    ENPCMovementFlags_RESERVED_45 ,
    ENPCMovementFlags_RESERVED_46 ,
    ENPCMovementFlags_RESERVED_47 ,
    ENPCMovementFlags_RESERVED_48 ,
    ENPCMovementFlags_RESERVED_49 ,
    ENPCMovementFlags_RESERVED_50 ,
    ENPCMovementFlags_RESERVED_51 ,
    ENPCMovementFlags_RESERVED_52 ,
    ENPCMovementFlags_RESERVED_53 ,
    ENPCMovementFlags_RESERVED_54 ,
    ENPCMovementFlags_RESERVED_55 ,
    ENPCMovementFlags_RESERVED_56 ,
    ENPCMovementFlags_RESERVED_57 ,
    ENPCMovementFlags_RESERVED_58 ,
    ENPCMovementFlags_RESERVED_59 ,
    ENPCMovementFlags_RESERVED_60 ,
    ENPCMovementFlags_RESERVED_61 ,
    ENPCMovementFlags_RESERVED_62 ,
    ENPCMovementFlags_RESERVED_63 ,
    ENMF_MovingTurn ,
    ENPCMovementFlags_RESERVED_65 ,
    ENPCMovementFlags_RESERVED_66 ,
    ENPCMovementFlags_RESERVED_67 ,
    ENPCMovementFlags_RESERVED_68 ,
    ENPCMovementFlags_RESERVED_69 ,
    ENPCMovementFlags_RESERVED_70 ,
    ENPCMovementFlags_RESERVED_71 ,
    ENPCMovementFlags_RESERVED_72 ,
    ENPCMovementFlags_RESERVED_73 ,
    ENPCMovementFlags_RESERVED_74 ,
    ENPCMovementFlags_RESERVED_75 ,
    ENPCMovementFlags_RESERVED_76 ,
    ENPCMovementFlags_RESERVED_77 ,
    ENPCMovementFlags_RESERVED_78 ,
    ENPCMovementFlags_RESERVED_79 ,
    ENPCMovementFlags_RESERVED_80 ,
    ENPCMovementFlags_RESERVED_81 ,
    ENPCMovementFlags_RESERVED_82 ,
    ENPCMovementFlags_RESERVED_83 ,
    ENPCMovementFlags_RESERVED_84 ,
    ENPCMovementFlags_RESERVED_85 ,
    ENPCMovementFlags_RESERVED_86 ,
    ENPCMovementFlags_RESERVED_87 ,
    ENPCMovementFlags_RESERVED_88 ,
    ENPCMovementFlags_RESERVED_89 ,
    ENPCMovementFlags_RESERVED_90 ,
    ENPCMovementFlags_RESERVED_91 ,
    ENPCMovementFlags_RESERVED_92 ,
    ENPCMovementFlags_RESERVED_93 ,
    ENPCMovementFlags_RESERVED_94 ,
    ENPCMovementFlags_RESERVED_95 ,
    ENPCMovementFlags_RESERVED_96 ,
    ENPCMovementFlags_RESERVED_97 ,
    ENPCMovementFlags_RESERVED_98 ,
    ENPCMovementFlags_RESERVED_99 ,
    ENPCMovementFlags_RESERVED_100 ,
    ENPCMovementFlags_RESERVED_101 ,
    ENPCMovementFlags_RESERVED_102 ,
    ENPCMovementFlags_RESERVED_103 ,
    ENPCMovementFlags_RESERVED_104 ,
    ENPCMovementFlags_RESERVED_105 ,
    ENPCMovementFlags_RESERVED_106 ,
    ENPCMovementFlags_RESERVED_107 ,
    ENPCMovementFlags_RESERVED_108 ,
    ENPCMovementFlags_RESERVED_109 ,
    ENPCMovementFlags_RESERVED_110 ,
    ENPCMovementFlags_RESERVED_111 ,
    ENPCMovementFlags_RESERVED_112 ,
    ENPCMovementFlags_RESERVED_113 ,
    ENPCMovementFlags_RESERVED_114 ,
    ENPCMovementFlags_RESERVED_115 ,
    ENPCMovementFlags_RESERVED_116 ,
    ENPCMovementFlags_RESERVED_117 ,
    ENPCMovementFlags_RESERVED_118 ,
    ENPCMovementFlags_RESERVED_119 ,
    ENPCMovementFlags_RESERVED_120 ,
    ENPCMovementFlags_RESERVED_121 ,
    ENPCMovementFlags_RESERVED_122 ,
    ENPCMovementFlags_RESERVED_123 ,
    ENPCMovementFlags_RESERVED_124 ,
    ENPCMovementFlags_RESERVED_125 ,
    ENPCMovementFlags_RESERVED_126 ,
    ENPCMovementFlags_RESERVED_127 ,
    ENMF_Submerged 
  };

  struct NetMovement {
      var Vector Destination;
      var byte flags;

  };


  var export editinline NPC_Type NPCType;
  var int NPCFameLevel;
  var int NPCPePRank;
  var int NPCTypeId;
  var array<int> RelatedQuestsIds;
  var globalconfig bool mDebugInfo;
  var Vector mDebugNetLocation;
  var Vector mNetDestination;
  var byte mMovementFlags;
  var Game_Pawn mNetFocus;
  var Vector mNetFocusLocation;
  var Rotator mDefaultRotation;
  var array<NetMovement> mNetPath;
  var Game_Pawn ClientFocus;
  var bool Moving;
  var private float mNoPathTime;
  var private float mLastKnownSpeed;
  var int MovingTurnLimit;
  var bool bTouching;
  var float timerMain;
  var float bannerTimer;
  var bool playerInRange;
  var export editinline Conversation_Topic Topic;
  var Actor TopicEmitter;
  var string mDebugStateStr;
  var string mDebugInfoStr;
  var string mDebugPathStr;
  var float LootTimeout;
  var float RotTimer;
  var transient Game_Pawn mScavenger;
  var int mDebugging;
  var bool BreakMovement;


  function Died(Controller Killer,class<DamageType> DamageType,Vector HitLocation) {
    Super.Died(Killer,DamageType,HitLocation);                                  //0000 : 1C 98 0A 84 0F 00 48 0B 25 11 00 C0 0B 25 11 00 40 0C 25 11 16 
    //1C 98 0A 84 0F 00 48 0B 25 11 00 C0 0B 25 11 00 40 0C 25 11 16 04 0B 47 
  }


  function sv_StartLoot(array<Game_Pawn> aKillers,byte LootMode) {
    local Loot_Manager lootManager;
    local array<LootTable> Loot;
    local export editinline NPC_Taxonomy Faction;
    if (aKillers.Length < 1) {                                                  //0000 : 07 0E 00 96 37 00 D8 1E 25 11 26 16 
      return;                                                                   //000C : 04 0B 
    }
    if (NPCType != None) {                                                      //000E : 07 2D 00 77 01 00 47 1B 11 2A 16 
      Loot = NPCType.Loot;                                                      //0019 : 0F 00 80 20 25 11 19 01 00 47 1B 11 05 00 00 01 48 98 34 0F 
    }
    Faction = Character.GetFaction();                                           //002D : 0F 00 F8 20 25 11 19 01 68 2E 34 0F 06 00 04 1B 6D 05 00 00 16 
    if (Faction != None) {                                                      //0042 : 07 61 00 77 00 F8 20 25 11 2A 16 
      Faction.AppendLoot(Loot);                                                 //004D : 19 00 F8 20 25 11 0B 00 00 1C 70 21 25 11 00 80 20 25 11 16 
    }
    if (Loot.Length == 0) {                                                     //0061 : 07 6F 00 9A 37 00 80 20 25 11 25 16 
      return;                                                                   //006D : 04 0B 
    }
    RotTimer = LootTimeout;                                                     //006F : 0F 01 58 1B 25 11 01 20 22 25 11 
    lootManager = Class'Loot_Manager'.static.sv_GetInstance();                  //007A : 0F 00 98 22 25 11 12 20 B8 01 5D 01 06 00 04 1C 48 58 35 0F 16 
    if (lootManager != None) {                                                  //008F : 07 BD 00 77 00 98 22 25 11 2A 16 
      lootManager.sv_CreateTransaction(Loot,aKillers,LootTimeout,LootMode);     //009A : 19 00 98 22 25 11 1A 00 00 1C F8 58 35 0F 00 80 20 25 11 00 D8 1E 25 11 01 20 22 25 11 00 A8 59 35 0F 16 
    }
    //07 0E 00 96 37 00 D8 1E 25 11 26 16 04 0B 07 2D 00 77 01 00 47 1B 11 2A 16 0F 00 80 20 25 11 19 
    //01 00 47 1B 11 05 00 00 01 48 98 34 0F 0F 00 F8 20 25 11 19 01 68 2E 34 0F 06 00 04 1B 6D 05 00 
    //00 16 07 61 00 77 00 F8 20 25 11 2A 16 19 00 F8 20 25 11 0B 00 00 1C 70 21 25 11 00 80 20 25 11 
    //16 07 6F 00 9A 37 00 80 20 25 11 25 16 04 0B 0F 01 58 1B 25 11 01 20 22 25 11 0F 00 98 22 25 11 
    //12 20 B8 01 5D 01 06 00 04 1C 48 58 35 0F 16 07 BD 00 77 00 98 22 25 11 2A 16 19 00 98 22 25 11 
    //1A 00 00 1C F8 58 35 0F 00 80 20 25 11 00 D8 1E 25 11 01 20 22 25 11 00 A8 59 35 0F 16 04 0B 47 
    //
  }


  protected native function sv2rel_Chat_CallStub();


  event sv2rel_Chat(int aLocalizedStringID,int aSubjectId,int aTargetId,Game_Pawn aTarget) {
    local string Text;
    local export editinline Content_Type Subject;
    local Object Target;
    local string Chat;
    local Game_PlayerPawn Player;
    if (aLocalizedStringID != 0) {                                              //0000 : 07 25 00 9B 00 C0 23 25 11 25 16 
      Text = Class'SBDBSync'.GetDescription(aLocalizedStringID);                //000B : 0F 00 08 26 25 11 12 20 30 82 24 01 0B 00 00 1B 6B 05 00 00 00 C0 23 25 11 16 
    }
    if (aSubjectId != 0) {                                                      //0025 : 07 4F 00 9B 00 80 26 25 11 25 16 
      Subject = Content_Type(Class'SBDBSync'.GetResourceObject(aSubjectId));    //0030 : 0F 00 F8 26 25 11 2E 80 62 5B 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 80 26 25 11 16 
    }
    if (aTargetId != 0) {                                                       //004F : 07 7C 00 9B 00 70 27 25 11 25 16 
      Target = Content_Type(Class'SBDBSync'.GetResourceObject(aTargetId));      //005A : 0F 00 E8 27 25 11 2E 80 62 5B 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 70 27 25 11 16 
    } else {                                                                    //0079 : 06 87 00 
      Target = aTarget;                                                         //007C : 0F 00 E8 27 25 11 00 60 28 25 11 
    }
    Chat = NPCType.ParseText(Text,self,Subject,Target);                         //0087 : 0F 00 D8 28 25 11 19 01 00 47 1B 11 16 00 00 1B D8 0C 00 00 00 08 26 25 11 17 00 F8 26 25 11 00 E8 27 25 11 16 
    Player = Game_PlayerPawn(Base_GameClient(Class'Actor'.static.GetGameEngine()).GPlayerController.Pawn);//00AC : 0F 00 50 29 25 11 2E F0 47 5B 01 19 19 2E 58 2D 24 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 05 00 04 01 B8 1A 6C 0F 05 00 04 01 88 83 6C 0F 
    Game_Desktop(Game_PlayerController(Player.Controller).Player.GUIDesktop).AddMessage(Character.cl_GetName(),Chat,Class'Game_Desktop'.0);//00DD : 19 2E 60 CE 5A 01 19 19 2E 90 18 5B 01 19 00 50 29 25 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 24 00 00 1B 7E 04 00 00 19 01 68 2E 34 0F 06 00 00 1C C8 12 18 11 16 00 D8 28 25 11 12 20 60 CE 5A 01 01 00 04 25 16 
    //07 25 00 9B 00 C0 23 25 11 25 16 0F 00 08 26 25 11 12 20 30 82 24 01 0B 00 00 1B 6B 05 00 00 00 
    //C0 23 25 11 16 07 4F 00 9B 00 80 26 25 11 25 16 0F 00 F8 26 25 11 2E 80 62 5B 01 12 20 30 82 24 
    //01 0B 00 04 1B E5 0B 00 00 00 80 26 25 11 16 07 7C 00 9B 00 70 27 25 11 25 16 0F 00 E8 27 25 11 
    //2E 80 62 5B 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 70 27 25 11 16 06 87 00 0F 00 E8 27 
    //25 11 00 60 28 25 11 0F 00 D8 28 25 11 19 01 00 47 1B 11 16 00 00 1B D8 0C 00 00 00 08 26 25 11 
    //17 00 F8 26 25 11 00 E8 27 25 11 16 0F 00 50 29 25 11 2E F0 47 5B 01 19 19 2E 58 2D 24 01 12 20 
    //F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 05 00 04 01 B8 1A 6C 0F 05 00 04 01 88 83 6C 0F 19 2E 60 
    //CE 5A 01 19 19 2E 90 18 5B 01 19 00 50 29 25 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 
    //05 00 04 01 90 C0 79 0F 24 00 00 1B 7E 04 00 00 19 01 68 2E 34 0F 06 00 00 1C C8 12 18 11 16 00 
    //D8 28 25 11 12 20 60 CE 5A 01 01 00 04 25 16 04 0B 47 
  }


  event cl_SetTopic(export editinline Conversation_Topic aTopic) {
    local Vector EmitterLocation;
    if (TopicEmitter != None) {                                                 //0000 : 07 29 00 77 01 68 1A 25 11 2A 16 
      DetachFromBone(TopicEmitter);                                             //000B : 1C C0 B0 6D 0F 01 68 1A 25 11 16 
      TopicEmitter.Destroy();                                                   //0016 : 19 01 68 1A 25 11 03 00 04 61 17 16 
      TopicEmitter = None;                                                      //0022 : 0F 01 68 1A 25 11 2A 
    }
    if (aTopic != None && aTopic.EmitterClass != None) {                        //0029 : 07 85 00 82 77 00 C8 29 25 11 2A 16 18 12 00 77 19 00 C8 29 25 11 05 00 04 01 A8 BE 24 11 2A 16 16 
      EmitterLocation = Location;                                               //004A : 0F 00 38 2B 25 11 01 30 81 6C 0F 
      TopicEmitter = Spawn(aTopic.EmitterClass,self,,EmitterLocation,Rotation); //0055 : 0F 01 68 1A 25 11 61 16 19 00 C8 29 25 11 05 00 04 01 A8 BE 24 11 17 0B 00 38 2B 25 11 01 00 84 6C 0F 16 
      TopicEmitter.SetBase(self);                                               //0078 : 19 01 68 1A 25 11 04 00 00 61 2A 17 16 
    }
    Topic = aTopic;                                                             //0085 : 0F 01 B0 2B 25 11 00 C8 29 25 11 
    //07 29 00 77 01 68 1A 25 11 2A 16 1C C0 B0 6D 0F 01 68 1A 25 11 16 19 01 68 1A 25 11 03 00 04 61 
    //17 16 0F 01 68 1A 25 11 2A 07 85 00 82 77 00 C8 29 25 11 2A 16 18 12 00 77 19 00 C8 29 25 11 05 
    //00 04 01 A8 BE 24 11 2A 16 16 0F 00 38 2B 25 11 01 30 81 6C 0F 0F 01 68 1A 25 11 61 16 19 00 C8 
    //29 25 11 05 00 04 01 A8 BE 24 11 17 0B 00 38 2B 25 11 01 00 84 6C 0F 16 19 01 68 1A 25 11 04 00 
    //00 61 2A 17 16 0F 01 B0 2B 25 11 00 C8 29 25 11 04 0B 47 
  }


  function cl_Banner(Game_Pawn aPartner,export editinline Conversation_Topic aTopic) {
    local bool timerMet;
    timerMet = False;                                                           //0000 : 14 2D 00 38 12 25 11 28 
    if (timerMain > bannerTimer || bannerTimer == 0.00000000) {                 //0008 : 07 4B 00 84 B1 01 B0 12 25 11 01 28 13 25 11 16 18 0D 00 B4 01 28 13 25 11 1E 00 00 00 00 16 16 
      timerMet = True;                                                          //0028 : 14 2D 00 38 12 25 11 27 
      bannerTimer = timerMain + aTopic.BannerTime;                              //0030 : 0F 01 28 13 25 11 AE 01 B0 12 25 11 19 00 A0 13 25 11 05 00 04 01 28 BF 24 11 16 
    }
    if (aTopic.Emote != 0) {                                                    //004B : 07 93 00 9B 39 3A 19 00 A0 13 25 11 05 00 01 01 50 BC 24 11 39 3A 24 00 16 
      Emotes.PlayLocalEmote(aTopic.Emote - 1);                                  //0064 : 19 01 F0 51 18 11 1B 00 00 1C 18 14 25 11 39 3D 93 39 3A 19 00 A0 13 25 11 05 00 01 01 50 BC 24 11 26 16 16 
      ClientFocus = aPartner;                                                   //0088 : 0F 01 C8 14 25 11 00 A8 0F 25 11 
    }
    if (timerMet && Len(aTopic.Chat.Text) != 0) {                               //0093 : 07 33 01 82 2D 00 38 12 25 11 18 19 00 9B 7D 36 58 C6 6B 0F 19 00 A0 13 25 11 05 00 0C 01 40 BD 24 11 16 25 16 16 
      Game_Desktop(Game_PlayerController(aPartner.Controller).Player.GUIDesktop).AddMessage(Character.cl_GetName(),aTopic.ParseText(aTopic.Chat.Text,self,aTopic,aPartner),Class'Game_Desktop'.0);//00B9 : 19 2E 60 CE 5A 01 19 19 2E 90 18 5B 01 19 00 A8 0F 25 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 4C 00 00 1B 7E 04 00 00 19 01 68 2E 34 0F 06 00 00 1C C8 12 18 11 16 19 00 A0 13 25 11 24 00 00 1B D8 0C 00 00 36 58 C6 6B 0F 19 00 A0 13 25 11 05 00 0C 01 40 BD 24 11 17 00 A0 13 25 11 00 A8 0F 25 11 16 12 20 60 CE 5A 01 01 00 04 25 16 
    }
    if (timerMet && aTopic.Speech != None) {                                    //0133 : 07 63 01 82 2D 00 38 12 25 11 18 12 00 77 19 00 A0 13 25 11 05 00 04 01 30 BE 24 11 2A 16 16 
      PlaySound(aTopic.Speech);                                                 //0152 : 61 08 19 00 A0 13 25 11 05 00 04 01 30 BE 24 11 16 
    }
    //14 2D 00 38 12 25 11 28 07 4B 00 84 B1 01 B0 12 25 11 01 28 13 25 11 16 18 0D 00 B4 01 28 13 25 
    //11 1E 00 00 00 00 16 16 14 2D 00 38 12 25 11 27 0F 01 28 13 25 11 AE 01 B0 12 25 11 19 00 A0 13 
    //25 11 05 00 04 01 28 BF 24 11 16 07 93 00 9B 39 3A 19 00 A0 13 25 11 05 00 01 01 50 BC 24 11 39 
    //3A 24 00 16 19 01 F0 51 18 11 1B 00 00 1C 18 14 25 11 39 3D 93 39 3A 19 00 A0 13 25 11 05 00 01 
    //01 50 BC 24 11 26 16 16 0F 01 C8 14 25 11 00 A8 0F 25 11 07 33 01 82 2D 00 38 12 25 11 18 19 00 
    //9B 7D 36 58 C6 6B 0F 19 00 A0 13 25 11 05 00 0C 01 40 BD 24 11 16 25 16 16 19 2E 60 CE 5A 01 19 
    //19 2E 90 18 5B 01 19 00 A8 0F 25 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 
    //90 C0 79 0F 4C 00 00 1B 7E 04 00 00 19 01 68 2E 34 0F 06 00 00 1C C8 12 18 11 16 19 00 A0 13 25 
    //11 24 00 00 1B D8 0C 00 00 36 58 C6 6B 0F 19 00 A0 13 25 11 05 00 0C 01 40 BD 24 11 17 00 A0 13 
    //25 11 00 A8 0F 25 11 16 12 20 60 CE 5A 01 01 00 04 25 16 07 63 01 82 2D 00 38 12 25 11 18 12 00 
    //77 19 00 A0 13 25 11 05 00 04 01 30 BE 24 11 2A 16 16 61 08 19 00 A0 13 25 11 05 00 04 01 30 BE 
    //24 11 16 04 0B 47 
  }


  function TakeDamage(int Damage,Pawn instigatedBy,Vector HitLocation,Vector Momentum,class<DamageType> DamageType) {
    if (SBRole == 1) {                                                          //0000 : 07 5A 00 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 
      if (!Game_Controller(Controller).sv_OnDamage(Game_Pawn(instigatedBy),Damage)) {//0010 : 07 57 00 81 19 2E 10 0E 5B 01 01 00 6E 6C 0F 15 00 04 1B 1A 07 00 00 2E 18 38 5B 01 00 28 2E 25 11 00 D8 2C 25 11 16 16 
        Super.TakeDamage(Damage,instigatedBy,HitLocation,Momentum,DamageType);  //0038 : 1C F0 C6 18 11 00 D8 2C 25 11 00 28 2E 25 11 00 A0 2E 25 11 00 18 2F 25 11 00 90 2F 25 11 16 
      }
    } else {                                                                    //0057 : 06 79 00 
      Super.TakeDamage(Damage,instigatedBy,HitLocation,Momentum,DamageType);    //005A : 1C F0 C6 18 11 00 D8 2C 25 11 00 28 2E 25 11 00 A0 2E 25 11 00 18 2F 25 11 00 90 2F 25 11 16 
    }
    //07 5A 00 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 07 57 00 81 19 2E 10 0E 5B 01 01 00 6E 6C 0F 15 
    //00 04 1B 1A 07 00 00 2E 18 38 5B 01 00 28 2E 25 11 00 D8 2C 25 11 16 16 1C F0 C6 18 11 00 D8 2C 
    //25 11 00 28 2E 25 11 00 A0 2E 25 11 00 18 2F 25 11 00 90 2F 25 11 16 06 79 00 1C F0 C6 18 11 00 
    //D8 2C 25 11 00 28 2E 25 11 00 A0 2E 25 11 00 18 2F 25 11 00 90 2F 25 11 16 04 0B 47 
  }


  protected native function sv2clrel_Submerge_CallStub();


  protected event sv2clrel_Submerge() {
    local NetMovement submergeMove;
    if (NetPathDone()) {                                                        //0000 : 07 12 00 1C E8 31 25 11 16 
      Submerge();                                                               //0009 : 1C A0 F8 18 11 16 
    } else {                                                                    //000F : 06 41 00 
      submergeMove.Destination = mNetDestination;                               //0012 : 0F 36 20 33 25 11 00 70 31 25 11 01 F0 19 25 11 
      submergeMove.flags = 128;                                                 //0022 : 0F 36 98 33 25 11 00 70 31 25 11 24 80 
      mNetPath[mNetPath.Length] = submergeMove;                                 //002F : 0F 10 37 01 10 34 25 11 01 10 34 25 11 00 70 31 25 11 
    }
    //07 12 00 1C E8 31 25 11 16 1C A0 F8 18 11 16 06 41 00 0F 36 20 33 25 11 00 70 31 25 11 01 F0 19 
    //25 11 0F 36 98 33 25 11 00 70 31 25 11 24 80 0F 10 37 01 10 34 25 11 01 10 34 25 11 00 70 31 25 
    //11 04 0B 47 
  }


  protected native function sv2clrel_Emerge_CallStub();


  protected event sv2clrel_Emerge() {
    local NetMovement submergeMove;
    if (NetPathDone()) {                                                        //0000 : 07 12 00 1C E8 31 25 11 16 
      Emerge();                                                                 //0009 : 1C F8 12 19 11 16 
    } else {                                                                    //000F : 06 41 00 
      submergeMove.Destination = mNetDestination;                               //0012 : 0F 36 20 33 25 11 00 E8 35 25 11 01 F0 19 25 11 
      submergeMove.flags = 128;                                                 //0022 : 0F 36 98 33 25 11 00 E8 35 25 11 24 80 
      mNetPath[mNetPath.Length] = submergeMove;                                 //002F : 0F 10 37 01 10 34 25 11 01 10 34 25 11 00 E8 35 25 11 
    }
    //07 12 00 1C E8 31 25 11 16 1C F8 12 19 11 16 06 41 00 0F 36 20 33 25 11 00 E8 35 25 11 01 F0 19 
    //25 11 0F 36 98 33 25 11 00 E8 35 25 11 24 80 0F 10 37 01 10 34 25 11 01 10 34 25 11 00 E8 35 25 
    //11 04 0B 47 
  }


  protected native function sv2rel_SetFocus_CallStub();


  event sv2rel_SetFocus(Game_Pawn aFocus) {
    mNetFocus = aFocus;                                                         //0000 : 0F 01 78 19 25 11 00 48 38 25 11 
    //0F 01 78 19 25 11 00 48 38 25 11 04 0B 47 
  }


  protected native function sv2rel_SetClientFocus_CallStub();


  event sv2rel_SetClientFocus(Game_Pawn aFocus) {
    ClientFocus = aFocus;                                                       //0000 : 0F 01 C8 14 25 11 00 60 3A 25 11 
    //0F 01 C8 14 25 11 00 60 3A 25 11 04 0B 47 
  }


  protected final native event cl_ApplyMovementOptions(byte aFlags);


  protected native function sv2rel_StopMovement_CallStub();


  protected final native event sv2rel_StopMovement(Vector aLocation);


  protected native function sv2rel_FocusLocation_CallStub();


  protected final native event sv2rel_FocusLocation(Vector aLocation);


  protected native function sv2rel_Focus_CallStub();


  protected final native event sv2rel_Focus(Game_Pawn aFocus);


  protected native function sv2rel_Move_CallStub();


  protected final native event sv2rel_Move(byte aFlags,Vector aDestination);


  protected final native function bool NetPathDone();


  protected native function cl2sv_EnterShop_CallStub();


  event cl2sv_EnterShop(Game_PlayerPawn aPlayerPawn,byte aOption) {
    if (NPCType.Shop != None) {                                                 //0000 : 07 36 00 77 19 01 00 47 1B 11 05 00 04 01 78 65 20 11 2A 16 
      NPCType.Shop.sv_EnterShop(aPlayerPawn,aOption);                           //0014 : 19 19 01 00 47 1B 11 05 00 04 01 78 65 20 11 10 00 00 1B BC 0C 00 00 00 D0 46 25 11 00 C0 47 25 11 16 
    }
    //07 36 00 77 19 01 00 47 1B 11 05 00 04 01 78 65 20 11 2A 16 19 19 01 00 47 1B 11 05 00 04 01 78 
    //65 20 11 10 00 00 1B BC 0C 00 00 00 D0 46 25 11 00 C0 47 25 11 16 04 0B 47 
  }


  function RadialMenuSelect(Pawn aPlayerPawn,byte aMainOption,byte aSubOption) {
    local Object castFFS;
    Super.RadialMenuSelect(aPlayerPawn,aMainOption,aSubOption);                 //0000 : 1C E0 ED 18 11 00 E8 48 25 11 00 78 4C 25 11 00 F0 4C 25 11 16 
    if (aMainOption == Class'Game_RadialMenuOptions'.0) {                       //0015 : 07 EE 01 9A 39 3A 00 78 4C 25 11 39 3A 12 20 B0 D7 60 01 02 00 01 24 00 16 
      if (aSubOption == Class'Game_RadialMenuOptions'.10
        && Game_PlayerController(aPlayerPawn.Controller).ConversationControl.CanConverse(self)) {//002E : 07 A2 00 82 9A 39 3A 00 F0 4C 25 11 39 3A 12 20 B0 D7 60 01 02 00 01 24 0A 16 18 28 00 19 19 2E 90 18 5B 01 19 00 E8 48 25 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 07 00 04 1C 68 4D 25 11 17 16 16 
        Game_PlayerConversation(Game_Controller(aPlayerPawn.Controller).ConversationControl).cl2sv_Interact_CallStub(self);//0073 : 19 2E 20 80 60 01 19 2E 10 0E 5B 01 19 00 E8 48 25 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 07 00 00 1B 3F 0D 00 00 17 16 
      } else {                                                                  //009F : 06 EE 01 
        if (aSubOption == Class'Game_RadialMenuOptions'.15
          && NPCType.Travel) {//00A2 : 07 13 01 82 9A 39 3A 00 F0 4C 25 11 39 3A 12 20 B0 D7 60 01 02 00 01 24 0F 16 18 10 00 19 01 00 47 1B 11 06 00 04 2D 01 88 64 20 11 16 
          castFFS = NPCType;                                                    //00CF : 0F 00 18 4E 25 11 01 00 47 1B 11 
          Game_PlayerController(aPlayerPawn.Controller).GUI.ShowTravel(string(castFFS.Name));//00DA : 19 19 2E 90 18 5B 01 19 00 E8 48 25 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 40 8A 1B 11 16 00 00 1B CC 0E 00 00 39 57 19 00 18 4E 25 11 05 00 04 01 F0 E4 6B 0F 16 
        } else {                                                                //0110 : 06 EE 01 
          if (aSubOption == Class'Game_RadialMenuOptions'.17
            && NPCType.Arena) {//0113 : 07 69 01 82 9A 39 3A 00 F0 4C 25 11 39 3A 12 20 B0 D7 60 01 02 00 01 24 11 16 18 10 00 19 01 00 47 1B 11 06 00 04 2D 01 00 65 20 11 16 
            Game_PlayerController(aPlayerPawn.Controller).GUI.ShowArenaWindow();//0140 : 19 19 2E 90 18 5B 01 19 00 E8 48 25 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 40 8A 1B 11 06 00 00 1B C6 0E 00 00 16 
          } else {                                                              //0166 : 06 EE 01 
            if (NPCType.Shop != None
              && NPCType.Shop.CanEnterShop(Game_PlayerPawn(aPlayerPawn),aSubOption)) {//0169 : 07 EE 01 82 77 19 01 00 47 1B 11 05 00 04 01 78 65 20 11 2A 16 18 28 00 19 19 01 00 47 1B 11 05 00 04 01 78 65 20 11 15 00 04 1B 13 0D 00 00 2E F0 47 5B 01 00 E8 48 25 11 00 F0 4C 25 11 16 16 
              Game_PlayerPawn(aPlayerPawn).Trading.cl_SetShop(NPCType.Shop,aSubOption);//01A9 : 19 19 2E F0 47 5B 01 00 E8 48 25 11 05 00 04 01 C0 43 32 0F 19 00 00 1B 80 0F 00 00 19 01 00 47 1B 11 05 00 04 01 78 65 20 11 00 F0 4C 25 11 16 
              cl2sv_EnterShop_CallStub(Game_PlayerPawn(aPlayerPawn),aSubOption);//01D9 : 1B 29 0E 00 00 2E F0 47 5B 01 00 E8 48 25 11 00 F0 4C 25 11 16 
            }
          }
        }
      }
    }
    Game_PlayerQuestLog(Game_PlayerPawn(aPlayerPawn).questLog).cl2sv_SwirlyOptionPawn_CallStub(self,aMainOption,aSubOption);//01EE : 19 2E 30 98 5F 01 19 2E F0 47 5B 01 00 E8 48 25 11 05 00 04 01 F0 2F 7F 0F 11 00 00 1B B8 0E 00 00 17 00 78 4C 25 11 00 F0 4C 25 11 16 
    //1C E0 ED 18 11 00 E8 48 25 11 00 78 4C 25 11 00 F0 4C 25 11 16 07 EE 01 9A 39 3A 00 78 4C 25 11 
    //39 3A 12 20 B0 D7 60 01 02 00 01 24 00 16 07 A2 00 82 9A 39 3A 00 F0 4C 25 11 39 3A 12 20 B0 D7 
    //60 01 02 00 01 24 0A 16 18 28 00 19 19 2E 90 18 5B 01 19 00 E8 48 25 11 05 00 04 01 00 6E 6C 0F 
    //05 00 04 01 C8 07 1B 11 07 00 04 1C 68 4D 25 11 17 16 16 19 2E 20 80 60 01 19 2E 10 0E 5B 01 19 
    //00 E8 48 25 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 07 00 00 1B 3F 0D 00 00 17 16 06 
    //EE 01 07 13 01 82 9A 39 3A 00 F0 4C 25 11 39 3A 12 20 B0 D7 60 01 02 00 01 24 0F 16 18 10 00 19 
    //01 00 47 1B 11 06 00 04 2D 01 88 64 20 11 16 0F 00 18 4E 25 11 01 00 47 1B 11 19 19 2E 90 18 5B 
    //01 19 00 E8 48 25 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 40 8A 1B 11 16 00 00 1B CC 0E 00 00 39 
    //57 19 00 18 4E 25 11 05 00 04 01 F0 E4 6B 0F 16 06 EE 01 07 69 01 82 9A 39 3A 00 F0 4C 25 11 39 
    //3A 12 20 B0 D7 60 01 02 00 01 24 11 16 18 10 00 19 01 00 47 1B 11 06 00 04 2D 01 00 65 20 11 16 
    //19 19 2E 90 18 5B 01 19 00 E8 48 25 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 40 8A 1B 11 06 00 00 
    //1B C6 0E 00 00 16 06 EE 01 07 EE 01 82 77 19 01 00 47 1B 11 05 00 04 01 78 65 20 11 2A 16 18 28 
    //00 19 19 01 00 47 1B 11 05 00 04 01 78 65 20 11 15 00 04 1B 13 0D 00 00 2E F0 47 5B 01 00 E8 48 
    //25 11 00 F0 4C 25 11 16 16 19 19 2E F0 47 5B 01 00 E8 48 25 11 05 00 04 01 C0 43 32 0F 19 00 00 
    //1B 80 0F 00 00 19 01 00 47 1B 11 05 00 04 01 78 65 20 11 00 F0 4C 25 11 16 1B 29 0E 00 00 2E F0 
    //47 5B 01 00 E8 48 25 11 00 F0 4C 25 11 16 19 2E 30 98 5F 01 19 2E F0 47 5B 01 00 E8 48 25 11 05 
    //00 04 01 F0 2F 7F 0F 11 00 00 1B B8 0E 00 00 17 00 78 4C 25 11 00 F0 4C 25 11 16 04 0B 47 
  }


  function Material RadialMenuImage(Pawn aPlayerPawn,byte aMainOption,byte aSubOption) {
    return None;                                                                //0000 : 04 2A 
    //04 2A 04 0B 47 
  }


  event RadialMenuCollect(Pawn aPlayerPawn,byte aMainOption,out array<byte> aSubOptions) {
    Super.RadialMenuCollect(aPlayerPawn,aMainOption,aSubOptions);               //0000 : 1C 18 16 37 0F 00 00 52 25 11 00 28 54 25 11 00 A0 54 25 11 16 
    if (aMainOption == Class'Game_RadialMenuOptions'.0) {                       //0015 : 07 EB 00 9A 39 3A 00 28 54 25 11 39 3A 12 20 B0 D7 60 01 02 00 01 24 00 16 
      if (!IsDead()) {                                                          //002E : 07 EB 00 81 1C D8 52 34 0F 16 16 
        if (Topic != None) {                                                    //0039 : 07 5C 00 77 01 B0 2B 25 11 2A 16 
          aSubOptions[aSubOptions.Length] = Class'Game_RadialMenuOptions'.10;   //0044 : 0F 10 37 00 A0 54 25 11 00 A0 54 25 11 12 20 B0 D7 60 01 02 00 01 24 0A 
        }
        if (NPCType.Travel) {                                                   //005C : 07 86 00 19 01 00 47 1B 11 06 00 04 2D 01 88 64 20 11 
          aSubOptions[aSubOptions.Length] = Class'Game_RadialMenuOptions'.15;   //006E : 0F 10 37 00 A0 54 25 11 00 A0 54 25 11 12 20 B0 D7 60 01 02 00 01 24 0F 
        }
        if (NPCType.Arena) {                                                    //0086 : 07 B0 00 19 01 00 47 1B 11 06 00 04 2D 01 00 65 20 11 
          aSubOptions[aSubOptions.Length] = Class'Game_RadialMenuOptions'.17;   //0098 : 0F 10 37 00 A0 54 25 11 00 A0 54 25 11 12 20 B0 D7 60 01 02 00 01 24 11 
        }
        if (NPCType.Shop != None) {                                             //00B0 : 07 EB 00 77 19 01 00 47 1B 11 05 00 04 01 78 65 20 11 2A 16 
          NPCType.Shop.RadialMenuCollect(aPlayerPawn,aMainOption,aSubOptions);  //00C4 : 19 19 01 00 47 1B 11 05 00 04 01 78 65 20 11 15 00 00 1B 05 06 00 00 00 00 52 25 11 00 28 54 25 11 00 A0 54 25 11 16 
        }
      }
    }
    Game_PlayerPawn(aPlayerPawn).questLog.RadialMenuCollect(NPCType,aMainOption,aSubOptions);//00EB : 19 19 2E F0 47 5B 01 00 00 52 25 11 05 00 04 01 F0 2F 7F 0F 15 00 00 1B 05 06 00 00 01 00 47 1B 11 00 28 54 25 11 00 A0 54 25 11 16 
    //1C 18 16 37 0F 00 00 52 25 11 00 28 54 25 11 00 A0 54 25 11 16 07 EB 00 9A 39 3A 00 28 54 25 11 
    //39 3A 12 20 B0 D7 60 01 02 00 01 24 00 16 07 EB 00 81 1C D8 52 34 0F 16 16 07 5C 00 77 01 B0 2B 
    //25 11 2A 16 0F 10 37 00 A0 54 25 11 00 A0 54 25 11 12 20 B0 D7 60 01 02 00 01 24 0A 07 86 00 19 
    //01 00 47 1B 11 06 00 04 2D 01 88 64 20 11 0F 10 37 00 A0 54 25 11 00 A0 54 25 11 12 20 B0 D7 60 
    //01 02 00 01 24 0F 07 B0 00 19 01 00 47 1B 11 06 00 04 2D 01 00 65 20 11 0F 10 37 00 A0 54 25 11 
    //00 A0 54 25 11 12 20 B0 D7 60 01 02 00 01 24 11 07 EB 00 77 19 01 00 47 1B 11 05 00 04 01 78 65 
    //20 11 2A 16 19 19 01 00 47 1B 11 05 00 04 01 78 65 20 11 15 00 00 1B 05 06 00 00 00 00 52 25 11 
    //00 28 54 25 11 00 A0 54 25 11 16 19 19 2E F0 47 5B 01 00 00 52 25 11 05 00 04 01 F0 2F 7F 0F 15 
    //00 00 1B 05 06 00 00 01 00 47 1B 11 00 28 54 25 11 00 A0 54 25 11 16 04 0B 47 
  }


  event string cl_GetSecondaryDisplayName() {
    local export editinline NPC_Taxonomy tax;
    local string Description;
    if (Character != None && NPCType.ShowNameAboveHeads) {                      //0000 : 07 71 00 82 77 01 68 2E 34 0F 2A 16 18 10 00 19 01 00 47 1B 11 06 00 04 2D 01 18 90 34 0F 16 
      tax = Character.GetFaction();                                             //001F : 0F 00 B8 56 25 11 19 01 68 2E 34 0F 06 00 04 1B 6D 05 00 00 16 
      if (tax != None) {                                                        //0034 : 07 71 00 77 00 B8 56 25 11 2A 16 
        Description = tax.GetDescription();                                     //003F : 0F 00 30 57 25 11 19 00 B8 56 25 11 06 00 00 1B 6B 05 00 00 16 
        if (Len(Description) > 0) {                                             //0054 : 07 71 00 97 7D 00 30 57 25 11 16 25 16 
          return "[" $ Description $ "]";                                       //0061 : 04 70 70 1F 5B 00 00 30 57 25 11 16 1F 5D 00 16 
        }
      }
    }
    return "";                                                                  //0071 : 04 1F 00 
    //07 71 00 82 77 01 68 2E 34 0F 2A 16 18 10 00 19 01 00 47 1B 11 06 00 04 2D 01 18 90 34 0F 16 0F 
    //00 B8 56 25 11 19 01 68 2E 34 0F 06 00 04 1B 6D 05 00 00 16 07 71 00 77 00 B8 56 25 11 2A 16 0F 
    //00 30 57 25 11 19 00 B8 56 25 11 06 00 00 1B 6B 05 00 00 16 07 71 00 97 7D 00 30 57 25 11 16 25 
    //16 04 70 70 1F 5B 00 00 30 57 25 11 16 1F 5D 00 16 04 1F 00 04 0B 47 
  }


  event string cl_GetPrimaryDisplayName() {
    if (Character != None && NPCType.ShowNameAboveHeads) {                      //0000 : 07 32 00 82 77 01 68 2E 34 0F 2A 16 18 10 00 19 01 00 47 1B 11 06 00 04 2D 01 18 90 34 0F 16 
      return Character.cl_GetFullName();                                        //001F : 04 19 01 68 2E 34 0F 06 00 00 1C 40 22 18 11 16 
    } else {                                                                    //002F : 06 35 00 
      return "";                                                                //0032 : 04 1F 00 
    }
    //07 32 00 82 77 01 68 2E 34 0F 2A 16 18 10 00 19 01 00 47 1B 11 06 00 04 2D 01 18 90 34 0F 16 04 
    //19 01 68 2E 34 0F 06 00 00 1C 40 22 18 11 16 06 35 00 04 1F 00 04 0B 47 
  }


  event Destroyed() {
    if (TopicEmitter != None) {                                                 //0000 : 07 29 00 77 01 68 1A 25 11 2A 16 
      DetachFromBone(TopicEmitter);                                             //000B : 1C C0 B0 6D 0F 01 68 1A 25 11 16 
      TopicEmitter.Destroy();                                                   //0016 : 19 01 68 1A 25 11 03 00 04 61 17 16 
      TopicEmitter = None;                                                      //0022 : 0F 01 68 1A 25 11 2A 
    }
    Super.Destroyed();                                                          //0029 : 1C 10 4A 18 11 16 
    //07 29 00 77 01 68 1A 25 11 2A 16 1C C0 B0 6D 0F 01 68 1A 25 11 16 19 01 68 1A 25 11 03 00 04 61 
    //17 16 0F 01 68 1A 25 11 2A 1C 10 4A 18 11 16 04 0B 47 
  }


  event cl_OnTick(float DeltaTime) {
    timerMain += DeltaTime;                                                     //0000 : B8 01 B0 12 25 11 00 A8 5A 25 11 16 
    Super.cl_OnTick(DeltaTime);                                                 //000C : 1C E8 3A 32 0F 00 A8 5A 25 11 16 
    //B8 01 B0 12 25 11 00 A8 5A 25 11 16 1C E8 3A 32 0F 00 A8 5A 25 11 16 04 0B 47 
  }


  event cl_OnFrame(float DeltaTime) {
    local Game_PlayerPawn playerPawn;
    if (Class'Actor'.static.GetGameEngine() != None) {                          //0000 : 07 E6 00 77 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 2A 16 
      playerPawn = Game_PlayerPawn(Base_GameClient(Class'Actor'.static.GetGameEngine()).GPlayerController.Pawn);//0015 : 0F 00 10 5E 25 11 2E F0 47 5B 01 19 19 2E 58 2D 24 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 05 00 04 01 B8 1A 6C 0F 05 00 04 01 88 83 6C 0F 
      if (playerPawn != None
        && Game_PlayerController(playerPawn.Controller).ConversationControl.CanConverse(self)) {//0046 : 07 CE 00 82 77 00 10 5E 25 11 2A 16 18 28 00 19 19 2E 90 18 5B 01 19 00 10 5E 25 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 07 00 04 1C 68 4D 25 11 17 16 16 
        if (!playerInRange) {                                                   //007D : 07 CB 00 81 2D 01 88 5E 25 11 16 
          playerInRange = True;                                                 //0088 : 14 2D 01 88 5E 25 11 27 
          Game_PlayerConversation(Game_PlayerController(Base_GameClient(Class'Actor'.static.GetGameEngine()).GPlayerController).ConversationControl).cl2sv_React_CallStub(self);//0090 : 19 2E 20 80 60 01 19 2E 90 18 5B 01 19 2E 58 2D 24 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 05 00 04 01 B8 1A 6C 0F 05 00 04 01 C8 07 1B 11 07 00 00 1B 01 0F 00 00 17 16 
        }
      } else {                                                                  //00CB : 06 E6 00 
        if (playerInRange) {                                                    //00CE : 07 E6 00 2D 01 88 5E 25 11 
          playerInRange = False;                                                //00D7 : 14 2D 01 88 5E 25 11 28 
          ClientFocus = None;                                                   //00DF : 0F 01 C8 14 25 11 2A 
        }
      }
    }
    Super.cl_OnFrame(DeltaTime);                                                //00E6 : 1C 98 21 19 11 00 20 5C 25 11 16 
    //07 E6 00 77 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 2A 16 0F 00 10 5E 25 11 2E F0 47 5B 01 
    //19 19 2E 58 2D 24 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 05 00 04 01 B8 1A 6C 0F 05 00 
    //04 01 88 83 6C 0F 07 CE 00 82 77 00 10 5E 25 11 2A 16 18 28 00 19 19 2E 90 18 5B 01 19 00 10 5E 
    //25 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 07 00 04 1C 68 4D 25 11 17 16 16 07 CB 00 
    //81 2D 01 88 5E 25 11 16 14 2D 01 88 5E 25 11 27 19 2E 20 80 60 01 19 2E 90 18 5B 01 19 2E 58 2D 
    //24 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 05 00 04 01 B8 1A 6C 0F 05 00 04 01 C8 07 1B 
    //11 07 00 00 1B 01 0F 00 00 17 16 06 E6 00 07 E6 00 2D 01 88 5E 25 11 14 2D 01 88 5E 25 11 28 0F 
    //01 C8 14 25 11 2A 1C 98 21 19 11 00 20 5C 25 11 16 04 0B 47 
  }


  event cl_OnInit() {
    NPCType.cl_OnInit(self);                                                    //0000 : 19 01 00 47 1B 11 07 00 00 1B 3F 05 00 00 17 16 
    Super.cl_OnInit();                                                          //0010 : 1C 08 28 19 11 16 
    //19 01 00 47 1B 11 07 00 00 1B 3F 05 00 00 17 16 1C 08 28 19 11 16 04 0B 47 
  }


  event cl_OnBaseline() {
    NPCType = NPC_Type(Class'SBDBSync'.GetResourceObject(NPCTypeId));           //0000 : 0F 01 00 47 1B 11 2E 78 9C 5B 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 01 50 61 25 11 16 
    if (NPCType == None) {                                                      //001F : 07 2A 00 72 01 00 47 1B 11 2A 16 
    }
    cl_ApplyMovementOptions(mMovementFlags);                                    //002A : 1C B0 39 25 11 01 C8 61 25 11 16 
    Super.cl_OnBaseline();                                                      //0035 : 1C 38 3A 19 11 16 
    NPCType.cl_CreateQuestsTopics(self);                                        //003B : 19 01 00 47 1B 11 07 00 00 1C A0 9B 21 11 17 16 
    //0F 01 00 47 1B 11 2E 78 9C 5B 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 01 50 61 25 11 16 07 
    //2A 00 72 01 00 47 1B 11 2A 16 1C B0 39 25 11 01 C8 61 25 11 16 1C 38 3A 19 11 16 19 01 00 47 1B 
    //11 07 00 00 1C A0 9B 21 11 17 16 04 0B 47 
  }


  protected native function sv2rel_SetDebugNetLocation_CallStub();


  event sv2rel_SetDebugNetLocation(Vector aLocation) {
    mDebugNetLocation = aLocation;                                              //0000 : 0F 01 58 64 25 11 00 A0 63 25 11 
    //0F 01 58 64 25 11 00 A0 63 25 11 04 0B 47 
  }


  protected native function sv2rel_UpdateDebugPathStr_CallStub();


  event sv2rel_UpdateDebugPathStr(string aDebugInfoStr) {
    mDebugPathStr = aDebugInfoStr;                                              //0000 : 0F 01 E8 66 25 11 00 30 66 25 11 
    //0F 01 E8 66 25 11 00 30 66 25 11 04 0B 47 
  }


  event EnableDebugging(bool Enable) {
    if (Enable) {                                                               //0000 : 07 13 00 2D 00 60 67 25 11 
      mDebugging++;                                                             //0009 : A5 01 40 68 25 11 16 
    } else {                                                                    //0010 : 06 2C 00 
      --mDebugging;                                                             //0013 : A4 01 40 68 25 11 16 
      if (mDebugging < 0) {                                                     //001A : 07 2C 00 96 01 40 68 25 11 25 16 
        mDebugging = 0;                                                         //0025 : 0F 01 40 68 25 11 25 
      }
    }
    //07 13 00 2D 00 60 67 25 11 A5 01 40 68 25 11 16 06 2C 00 A4 01 40 68 25 11 16 07 2C 00 96 01 40 
    //68 25 11 25 16 0F 01 40 68 25 11 25 04 0B 47 
  }


  state Dead {

      event cl_Banner(Game_Pawn aPartner,export editinline Conversation_Topic aTopic) {
        //04 0B 47 
      }


      function BeginState() {
        local Game_PlayerController lai;
        Super.BeginState();                                                     //0000 : 1C C0 88 18 11 16 
        if (SBRole == 1) {                                                      //0006 : 07 91 00 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 
          sv_KillCredit();                                                      //0016 : 1B 27 0E 00 00 16 
          mNetFocus = None;                                                     //001C : 0F 01 78 19 25 11 2A 
          mNetDestination = Location;                                           //0023 : 0F 01 F0 19 25 11 01 30 81 6C 0F 
          if (NPCType.TriggersKilledHook == True) {                             //002E : 07 71 00 F2 19 01 00 47 1B 11 06 00 04 2D 01 98 63 20 11 27 16 
            foreach DynamicActors(Class'Game_PlayerController',lai) {           //0043 : 2F 61 39 20 90 18 5B 01 00 C0 17 25 11 16 70 00 
              lai.sv_FireHook(Class'Content_Type'.11,self,0);                   //0053 : 19 00 C0 17 25 11 13 00 00 1B 0D 07 00 00 12 20 80 62 5B 01 02 00 01 24 0B 17 25 16 
            }
          }
          Game_Controller(Controller).ConversationControl.EndAllConversations();//0071 : 19 19 2E 10 0E 5B 01 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 06 00 00 1B 5D 05 00 00 16 
          goto jl00C8;                                                          //008E : 06 C8 00 
        }
        mNetDestination = Location;                                             //0091 : 0F 01 F0 19 25 11 01 30 81 6C 0F 
        mNetFocus = None;                                                       //009C : 0F 01 78 19 25 11 2A 
        ClientFocus = None;                                                     //00A3 : 0F 01 C8 14 25 11 2A 
        if (TopicEmitter != None) {                                             //00AA : 07 C8 00 77 01 68 1A 25 11 2A 16 
          TopicEmitter.Destroy();                                               //00B5 : 19 01 68 1A 25 11 03 00 04 61 17 16 
          TopicEmitter = None;                                                  //00C1 : 0F 01 68 1A 25 11 2A 
        }
        //1C C0 88 18 11 16 07 91 00 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 1B 27 0E 00 00 16 0F 01 78 19 
        //25 11 2A 0F 01 F0 19 25 11 01 30 81 6C 0F 07 71 00 F2 19 01 00 47 1B 11 06 00 04 2D 01 98 63 20 
        //11 27 16 2F 61 39 20 90 18 5B 01 00 C0 17 25 11 16 70 00 19 00 C0 17 25 11 13 00 00 1B 0D 07 00 
        //00 12 20 80 62 5B 01 02 00 01 24 0B 17 25 16 31 30 19 19 2E 10 0E 5B 01 01 00 6E 6C 0F 05 00 04 
        //01 C8 07 1B 11 06 00 00 1B 5D 05 00 00 16 06 C8 00 0F 01 F0 19 25 11 01 30 81 6C 0F 0F 01 78 19 
        //25 11 2A 0F 01 C8 14 25 11 2A 07 C8 00 77 01 68 1A 25 11 2A 16 19 01 68 1A 25 11 03 00 04 61 17 
        //16 0F 01 68 1A 25 11 2A 04 0B 47 
      }


      function sv_KillCredit() {
        local Game_Pawn bestEnemy;
        local Game_PlayerController PlayerController;
        local array<Game_Pawn> Enemies;
        local float fameValue;
        local float pepValue;
        RotTimer = NPCType.CorpseTimeout;                                       //0000 : 0F 01 58 1B 25 11 19 01 00 47 1B 11 05 00 04 01 30 ED 21 11 
        bestEnemy = CombatStats.sv_GetKiller();                                 //0014 : 0F 00 E0 1A 25 11 19 01 30 41 18 11 06 00 04 1C 98 8A 18 11 16 
        if (bestEnemy != None) {                                                //0029 : 07 40 01 77 00 E0 1A 25 11 2A 16 
          PlayerController = Game_PlayerController(bestEnemy.Controller);       //0034 : 0F 00 D0 1B 25 11 2E 90 18 5B 01 19 00 E0 1A 25 11 05 00 04 01 00 6E 6C 0F 
          if (PlayerController != None) {                                       //004D : 07 3D 01 77 00 D0 1B 25 11 2A 16 
            if (NPCType.IndividualKillCredit) {                                 //0058 : 07 3D 01 19 01 00 47 1B 11 06 00 04 2D 01 C0 98 34 0F 
              PlayerController.GroupingTeams.sv_GetCreditTeam(Enemies,Location);//006A : 19 19 00 D0 1B 25 11 05 00 04 01 48 C2 18 11 10 00 00 1B 02 0E 00 00 00 48 1C 25 11 01 30 81 6C 0F 16 
              if (Enemies.Length > 0) {                                         //008C : 07 3A 01 97 37 00 48 1C 25 11 25 16 
                CombatStats.sv_QuestCredit(Enemies);                            //0098 : 19 01 30 41 18 11 0B 00 00 1B EB 0C 00 00 00 48 1C 25 11 16 
                CombatStats.sv_FamePepCredit(Enemies,NPCType.CreditMultiplier,CharacterStats.GetFameLevel(),CharacterStats.GetPePRank(),fameValue,pepValue);//00AC : 19 01 30 41 18 11 41 00 00 1B 23 0F 00 00 00 48 1C 25 11 19 01 00 47 1B 11 05 00 04 01 B8 EE 21 11 19 01 08 43 34 0F 06 00 04 1C F8 1E 1F 11 16 19 01 08 43 34 0F 06 00 04 1C A0 1D 1F 11 16 00 C0 1C 25 11 00 38 1D 25 11 16 
                CombatStats.sv_FamePepDistribution(Enemies,fameValue,pepValue); //00F6 : 19 01 30 41 18 11 15 00 00 1B 7D 0F 00 00 00 48 1C 25 11 00 C0 1C 25 11 00 38 1D 25 11 16 
                sv_StartLoot(Enemies,PlayerController.GroupingTeams.GetTeamLootMode());//0114 : 1B 28 0E 00 00 00 48 1C 25 11 19 19 00 D0 1B 25 11 05 00 04 01 48 C2 18 11 06 00 01 1B 97 0E 00 00 16 16 
                goto jl013A;                                                    //0137 : 06 3A 01 
              }
              goto jl013D;                                                      //013A : 06 3D 01 
            }
          }
          goto jl0140;                                                          //013D : 06 40 01 
        }
        //0F 01 58 1B 25 11 19 01 00 47 1B 11 05 00 04 01 30 ED 21 11 0F 00 E0 1A 25 11 19 01 30 41 18 11 
        //06 00 04 1C 98 8A 18 11 16 07 40 01 77 00 E0 1A 25 11 2A 16 0F 00 D0 1B 25 11 2E 90 18 5B 01 19 
        //00 E0 1A 25 11 05 00 04 01 00 6E 6C 0F 07 3D 01 77 00 D0 1B 25 11 2A 16 07 3D 01 19 01 00 47 1B 
        //11 06 00 04 2D 01 C0 98 34 0F 19 19 00 D0 1B 25 11 05 00 04 01 48 C2 18 11 10 00 00 1B 02 0E 00 
        //00 00 48 1C 25 11 01 30 81 6C 0F 16 07 3A 01 97 37 00 48 1C 25 11 25 16 19 01 30 41 18 11 0B 00 
        //00 1B EB 0C 00 00 00 48 1C 25 11 16 19 01 30 41 18 11 41 00 00 1B 23 0F 00 00 00 48 1C 25 11 19 
        //01 00 47 1B 11 05 00 04 01 B8 EE 21 11 19 01 08 43 34 0F 06 00 04 1C F8 1E 1F 11 16 19 01 08 43 
        //34 0F 06 00 04 1C A0 1D 1F 11 16 00 C0 1C 25 11 00 38 1D 25 11 16 19 01 30 41 18 11 15 00 00 1B 
        //7D 0F 00 00 00 48 1C 25 11 00 C0 1C 25 11 00 38 1D 25 11 16 1B 28 0E 00 00 00 48 1C 25 11 19 19 
        //00 D0 1B 25 11 05 00 04 01 48 C2 18 11 06 00 01 1B 97 0E 00 00 16 16 06 3A 01 06 3D 01 06 40 01 
        //04 0B 47 
      }


    //08 47 

  }



