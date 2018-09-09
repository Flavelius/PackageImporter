//==============================================================================
//  NPC_Spawner
//==============================================================================

class NPC_Spawner extends NPC_Habitat
    native
    abstract
    dependsOn()
    Placeable
    Config(charstats)
  ;

  var (Type) const class<Game_NPCController> controllerType;
  var (Policy) const bool TriggeredSpawn;
  var (Policy) const bool TriggeredRespawn;
  var (Policy) const bool TriggeredDespawn;
  var (Policy) const name EventOnWiped;
  var (Policy) const name EventOnSpawn;
  var (aI) array<NPC_AI> Scripts;
  var (aI) float ChaseRange;
  var (aI) float VisualRange;
  var (aI) float LineOfSightRange;
  var (aI) float ThreatRange;
  var (aI) transient bool ShowAIRanges;
  var (Hormones) float AggressionFactor;
  var (Hormones) float FearFactor;
  var (Hormones) float SocialFactor;
  var (Hormones) float BoredomFactor;
  var array<Game_NPCController> Spawns;
  var transient int Triggerers;
  var Game_NPCController FakePlayer;
  var config bool SpawnFakePlayer;


  final native function int GetSpawnsLeft();


  event UnTrigger(Actor Other,Pawn EventInstigator) {
    local Actor triggerer;
    if (EventInstigator != None) {                                              //0000 : 07 19 00 77 00 08 8B 38 11 2A 16 
      triggerer = EventInstigator;                                              //000B : 0F 00 80 8B 38 11 00 08 8B 38 11 
    } else {                                                                    //0016 : 06 24 00 
      triggerer = Other;                                                        //0019 : 0F 00 80 8B 38 11 00 B8 89 38 11 
    }
    if (TriggeredRespawn) {                                                     //0024 : 07 54 00 2D 01 F8 8B 38 11 
      Triggerers--;                                                             //002D : A6 01 70 8C 38 11 16 
      if (Triggerers == 0) {                                                    //0034 : 07 42 00 9A 01 70 8C 38 11 25 16 
      } else {                                                                  //003F : 06 54 00 
        if (Triggerers < 0) {                                                   //0042 : 07 54 00 96 01 70 8C 38 11 25 16 
          Triggerers = 0;                                                       //004D : 0F 01 70 8C 38 11 25 
        }
      }
    }
    if (TriggeredDespawn) {                                                     //0054 : 07 7B 00 2D 01 E8 8C 38 11 
      if (!TriggeredRespawn || Triggerers == 0) {                               //005D : 07 7B 00 84 81 2D 01 F8 8B 38 11 16 18 09 00 9A 01 70 8C 38 11 25 16 16 
        sv_Despawn();                                                           //0075 : 1B 07 07 00 00 16 
      }
    }
    //07 19 00 77 00 08 8B 38 11 2A 16 0F 00 80 8B 38 11 00 08 8B 38 11 06 24 00 0F 00 80 8B 38 11 00 
    //B8 89 38 11 07 54 00 2D 01 F8 8B 38 11 A6 01 70 8C 38 11 16 07 42 00 9A 01 70 8C 38 11 25 16 06 
    //54 00 07 54 00 96 01 70 8C 38 11 25 16 0F 01 70 8C 38 11 25 07 7B 00 2D 01 E8 8C 38 11 07 7B 00 
    //84 81 2D 01 F8 8B 38 11 16 18 09 00 9A 01 70 8C 38 11 25 16 16 1B 07 07 00 00 16 04 0B 47 
  }


  event Trigger(Actor Other,Pawn EventInstigator) {
    local Actor triggerer;
    if (EventInstigator != None) {                                              //0000 : 07 19 00 77 00 48 8F 38 11 2A 16 
      triggerer = EventInstigator;                                              //000B : 0F 00 C0 8F 38 11 00 48 8F 38 11 
    } else {                                                                    //0016 : 06 24 00 
      triggerer = Other;                                                        //0019 : 0F 00 C0 8F 38 11 00 10 8E 38 11 
    }
    if (TriggeredSpawn) {                                                       //0024 : 07 50 00 2D 01 38 90 38 11 
      if (!TriggeredRespawn || Triggerers == 0) {                               //002D : 07 50 00 84 81 2D 01 F8 8B 38 11 16 18 09 00 9A 01 70 8C 38 11 25 16 16 
        sv_TriggeredSpawn(triggerer);                                           //0045 : 1B FD 0D 00 00 00 C0 8F 38 11 16 
      }
    }
    if (TriggeredRespawn) {                                                     //0050 : 07 6B 00 2D 01 F8 8B 38 11 
      if (Triggerers == 0) {                                                    //0059 : 07 64 00 9A 01 70 8C 38 11 25 16 
      }
      Triggerers++;                                                             //0064 : A5 01 70 8C 38 11 16 
    }
    //07 19 00 77 00 48 8F 38 11 2A 16 0F 00 C0 8F 38 11 00 48 8F 38 11 06 24 00 0F 00 C0 8F 38 11 00 
    //10 8E 38 11 07 50 00 2D 01 38 90 38 11 07 50 00 84 81 2D 01 F8 8B 38 11 16 18 09 00 9A 01 70 8C 
    //38 11 25 16 16 1B FD 0D 00 00 00 C0 8F 38 11 16 07 6B 00 2D 01 F8 8B 38 11 07 64 00 9A 01 70 8C 
    //38 11 25 16 A5 01 70 8C 38 11 16 04 0B 47 
  }


  event sv_Despawn() {
    //04 0B 47 
  }


  native function sv_TriggeredSpawn(Actor aTriggerer);



