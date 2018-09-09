//==============================================================================
//  Game_NPCSkills
//==============================================================================

class Game_NPCSkills extends Game_Skills within Game_Pawn
    native
    dependsOn(NPC_SkillDeck,NPC_SkillDeckTier)
  ;

  var export editinline NPC_SkillDeck CurrentNPCSkillDeck;
  var float LongestAttack;
  var float LongestDebuff;
  var float LongestBuff;
  var bool CanHeal;
  var bool mQueueSkillAnimation;
  var private Vector mSkillLocation;
  var private Rotator mSkillRotation;
  var int mQueueAnimVariation;
  var export editinline Item_Type mQueueTracerItem;
  var float mQueueTime;


  protected function cl_AddActiveSkill(int aSkillID,float aStartTime,float aDuration,float aSkillSpeed,bool aFreezeMovement,bool aFreezeRotation,int aTokenItemID,int AnimVarNr,Vector aLocation,Rotator aRotation) {
    if (mQueueSkillAnimation) {                                                 //0000 : 07 09 00 2D 01 B0 F4 34 11 
    }
    Super.cl_AddActiveSkill(aSkillID,aStartTime,aDuration,aSkillSpeed,aFreezeMovement,aFreezeRotation,aTokenItemID,AnimVarNr,aLocation,aRotation);//0009 : 1C 60 7F 23 11 00 38 F4 34 11 00 28 F5 34 11 00 A0 F5 34 11 00 18 F6 34 11 2D 00 90 F6 34 11 2D 00 08 F7 34 11 00 80 F7 34 11 00 F8 F7 34 11 00 70 F8 34 11 00 E8 F8 34 11 16 
    mQueueSkillAnimation = True;                                                //0043 : 14 2D 01 B0 F4 34 11 27 
    mSkillLocation = aLocation;                                                 //004B : 0F 01 60 F9 34 11 00 70 F8 34 11 
    mSkillRotation = aRotation;                                                 //0056 : 0F 01 D8 F9 34 11 00 E8 F8 34 11 
    mQueueAnimVariation = AnimVarNr;                                            //0061 : 0F 01 50 FA 34 11 00 F8 F7 34 11 
    mQueueTracerItem = Item_Type(Class'SBDBSync'.GetResourceObject(aTokenItemID));//006C : 0F 01 C8 FA 34 11 2E 70 EB 5B 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 80 F7 34 11 16 
    mQueueTime = Outer.Level.TimeSeconds;                                       //008B : 0F 01 40 FB 34 11 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
    //07 09 00 2D 01 B0 F4 34 11 1C 60 7F 23 11 00 38 F4 34 11 00 28 F5 34 11 00 A0 F5 34 11 00 18 F6 
    //34 11 2D 00 90 F6 34 11 2D 00 08 F7 34 11 00 80 F7 34 11 00 F8 F7 34 11 00 70 F8 34 11 00 E8 F8 
    //34 11 16 14 2D 01 B0 F4 34 11 27 0F 01 60 F9 34 11 00 70 F8 34 11 0F 01 D8 F9 34 11 00 E8 F8 34 
    //11 0F 01 50 FA 34 11 00 F8 F7 34 11 0F 01 C8 FA 34 11 2E 70 EB 5B 01 12 20 30 82 24 01 0B 00 04 
    //1B E5 0B 00 00 00 80 F7 34 11 16 0F 01 40 FB 34 11 19 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 
    //05 00 04 01 A8 81 6C 0F 04 0B 47 
  }


  function int GetSkilldeckColumnCount() {
    if (CurrentNPCSkillDeck != None) {                                          //0000 : 07 29 00 77 01 48 FD 34 11 2A 16 
      return CurrentNPCSkillDeck.Tiers[0].Skills.Length;                        //000B : 04 37 19 10 25 19 01 48 FD 34 11 05 00 00 01 D0 D0 30 0F 05 00 00 01 C0 FD 34 11 
    } else {                                                                    //0026 : 06 2B 00 
      return 0;                                                                 //0029 : 04 25 
    }
    //07 29 00 77 01 48 FD 34 11 2A 16 04 37 19 10 25 19 01 48 FD 34 11 05 00 00 01 D0 D0 30 0F 05 00 
    //00 01 C0 FD 34 11 06 2B 00 04 25 04 0B 47 
  }


  function int GetSkilldeckRowCount() {
    if (CurrentNPCSkillDeck != None) {                                          //0000 : 07 1E 00 77 01 48 FD 34 11 2A 16 
      return CurrentNPCSkillDeck.Tiers.Length;                                  //000B : 04 37 19 01 48 FD 34 11 05 00 00 01 D0 D0 30 0F 
    } else {                                                                    //001B : 06 20 00 
      return 0;                                                                 //001E : 04 25 
    }
    //07 1E 00 77 01 48 FD 34 11 2A 16 04 37 19 01 48 FD 34 11 05 00 00 01 D0 D0 30 0F 06 20 00 04 25 
    //04 0B 47 
  }


  final native function sv_SetSkilldeck(export editinline NPC_SkillDeck aSkilldeck,NPC_Equipment aEquipment);



