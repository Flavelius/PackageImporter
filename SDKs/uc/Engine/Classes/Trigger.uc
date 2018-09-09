//==============================================================================
//  Trigger
//==============================================================================

class Trigger extends Triggers
    native
    dependsOn(LevelInfo,Pawn,Controller)
  ;

  enum ETriggerType {
    TT_PlayerProximity ,
    TT_PawnProximity ,
    TT_ClassProximity ,
    TT_AnyProximity ,
    TT_Shoot ,
    TT_HumanPlayerProximity ,
    TT_LivePlayerProximity 
  };

  var (Trigger) byte TriggerType;
  var (Trigger) localized string Message;
  var (Trigger) bool bTriggerOnceOnly;
  var (Trigger) bool bInitiallyActive;
  var (Trigger) class<Actor> ClassProximityType;
  var (Trigger) float RepeatTriggerTime;
  var (Trigger) float ReTriggerDelay;
  var float TriggerTime;
  var (Trigger) float DamageThreshold;
  var Actor TriggerActor;
  var Actor TriggerActor2;
  var bool bSavedInitialCollision;
  var bool bSavedInitialActive;


  function UnTouch(Actor Other) {
    if (IsRelevant(Other)) {                                                    //0000 : 07 28 00 1B B1 2A 00 00 00 F8 1E 7E 0F 16 
      UntriggerEvent(Event,self,Other.Instigator);                              //000E : 1C 80 AF 34 0F 01 38 9F 6C 0F 17 19 00 F8 1E 7E 0F 05 00 04 01 B8 80 6C 0F 16 
    }
    //07 28 00 1B B1 2A 00 00 00 F8 1E 7E 0F 16 1C 80 AF 34 0F 01 38 9F 6C 0F 17 19 00 F8 1E 7E 0F 05 
    //00 04 01 B8 80 6C 0F 16 04 0B 47 
  }


  function TakeDamage(int Damage,Pawn instigatedBy,Vector HitLocation,Vector Momentum,class<DamageType> DamageType) {
    if (bInitiallyActive && TriggerType == 4
      && Damage >= DamageThreshold
      && instigatedBy != None) {//0000 : 07 9B 00 82 82 82 2D 01 08 22 7E 0F 18 0E 00 9A 39 3A 01 80 22 7E 0F 39 3A 24 04 16 16 18 0F 00 B3 39 3F 00 88 20 7E 0F 01 F8 22 7E 0F 16 16 18 09 00 77 00 70 23 7E 0F 2A 16 16 
      if (ReTriggerDelay > 0) {                                                 //003B : 07 7D 00 B1 01 E8 23 7E 0F 39 3F 25 16 
        if (Level.TimeSeconds - TriggerTime < ReTriggerDelay) {                 //0048 : 07 69 00 B0 AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 60 24 7E 0F 16 01 E8 23 7E 0F 16 
          return;                                                               //0067 : 04 0B 
        }
        TriggerTime = Level.TimeSeconds;                                        //0069 : 0F 01 60 24 7E 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
      }
      TriggerEvent(Event,self,instigatedBy);                                    //007D : 1C F8 B1 34 0F 01 38 9F 6C 0F 17 00 70 23 7E 0F 16 
      if (bTriggerOnceOnly) {                                                   //008E : 07 9B 00 2D 01 D8 24 7E 0F 
        SetCollision(False);                                                    //0097 : 61 06 28 16 
      }
    }
    //07 9B 00 82 82 82 2D 01 08 22 7E 0F 18 0E 00 9A 39 3A 01 80 22 7E 0F 39 3A 24 04 16 16 18 0F 00 
    //B3 39 3F 00 88 20 7E 0F 01 F8 22 7E 0F 16 16 18 09 00 77 00 70 23 7E 0F 2A 16 16 07 7D 00 B1 01 
    //E8 23 7E 0F 39 3F 25 16 07 69 00 B0 AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 60 24 7E 0F 
    //16 01 E8 23 7E 0F 16 04 0B 0F 01 60 24 7E 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 1C F8 B1 
    //34 0F 01 38 9F 6C 0F 17 00 70 23 7E 0F 16 07 9B 00 2D 01 D8 24 7E 0F 61 06 28 16 04 0B 47 
  }


  function Timer() {
    local bool bKeepTiming;
    local Actor A;
    bKeepTiming = False;                                                        //0000 : 14 2D 00 70 27 7E 0F 28 
    foreach TouchingActors(Class'Actor',A) {                                    //0008 : 2F 61 33 20 F8 8B C1 00 00 E8 27 7E 0F 16 3A 00 
      if (IsRelevant(A)) {                                                      //0018 : 07 39 00 1B B1 2A 00 00 00 E8 27 7E 0F 16 
        bKeepTiming = True;                                                     //0026 : 14 2D 00 70 27 7E 0F 27 
        Touch(A);                                                               //002E : 1B 39 01 00 00 00 E8 27 7E 0F 16 
      }
    }
    if (bKeepTiming) {                                                          //003B : 07 4D 00 2D 00 70 27 7E 0F 
      SetTimer(RepeatTriggerTime,False);                                        //0044 : 61 18 01 60 28 7E 0F 28 16 
    }
    //14 2D 00 70 27 7E 0F 28 2F 61 33 20 F8 8B C1 00 00 E8 27 7E 0F 16 3A 00 07 39 00 1B B1 2A 00 00 
    //00 E8 27 7E 0F 16 14 2D 00 70 27 7E 0F 27 1B 39 01 00 00 00 E8 27 7E 0F 16 31 30 07 4D 00 2D 00 
    //70 27 7E 0F 61 18 01 60 28 7E 0F 28 16 04 0B 47 
  }


  function Touch(Actor Other) {
    local int i;
    if (IsRelevant(Other)) {                                                    //0000 : 07 38 01 1B B1 2A 00 00 00 88 29 7E 0F 16 
      Other = FindInstigator(Other);                                            //000E : 0F 00 88 29 7E 0F 1B 56 2B 00 00 00 88 29 7E 0F 16 
      if (ReTriggerDelay > 0) {                                                 //001F : 07 61 00 B1 01 E8 23 7E 0F 39 3F 25 16 
        if (Level.TimeSeconds - TriggerTime < ReTriggerDelay) {                 //002C : 07 4D 00 B0 AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 60 24 7E 0F 16 01 E8 23 7E 0F 16 
          return;                                                               //004B : 04 0B 
        }
        TriggerTime = Level.TimeSeconds;                                        //004D : 0F 01 60 24 7E 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
      }
      TriggerEvent(Event,self,Other.Instigator);                                //0061 : 1C F8 B1 34 0F 01 38 9F 6C 0F 17 19 00 88 29 7E 0F 05 00 04 01 B8 80 6C 0F 16 
      if (Pawn(Other) != None && Pawn(Other).Controller != None) {              //007B : 07 12 01 82 77 2E 50 31 D4 00 00 88 29 7E 0F 2A 16 18 17 00 77 19 2E 50 31 D4 00 00 88 29 7E 0F 05 00 04 01 00 6E 6C 0F 2A 16 16 
        i = 0;                                                                  //00A6 : 0F 00 E0 2B 7E 0F 25 
        while (i < 4) {                                                         //00AD : 07 12 01 96 00 E0 2B 7E 0F 2C 04 16 
          if (Pawn(Other).Controller.GoalList[i] == self) {                     //00B9 : 07 08 01 72 1A 00 E0 2B 7E 0F 19 19 2E 50 31 D4 00 00 88 29 7E 0F 05 00 04 01 00 6E 6C 0F 05 00 10 01 58 FA 70 0F 17 16 
            Pawn(Other).Controller.GoalList[i] = None;                          //00E1 : 0F 1A 00 E0 2B 7E 0F 19 19 2E 50 31 D4 00 00 88 29 7E 0F 05 00 04 01 00 6E 6C 0F 05 00 10 01 58 FA 70 0F 2A 
            goto jl0112;                                                        //0105 : 06 12 01 
          }
          i++;                                                                  //0108 : A5 00 E0 2B 7E 0F 16 
        }
      }
      if (bTriggerOnceOnly) {                                                   //0112 : 07 22 01 2D 01 D8 24 7E 0F 
        SetCollision(False);                                                    //011B : 61 06 28 16 
      } else {                                                                  //011F : 06 38 01 
        if (RepeatTriggerTime > 0) {                                            //0122 : 07 38 01 B1 01 60 28 7E 0F 39 3F 25 16 
          SetTimer(RepeatTriggerTime,False);                                    //012F : 61 18 01 60 28 7E 0F 28 16 
        }
      }
    }
    //07 38 01 1B B1 2A 00 00 00 88 29 7E 0F 16 0F 00 88 29 7E 0F 1B 56 2B 00 00 00 88 29 7E 0F 16 07 
    //61 00 B1 01 E8 23 7E 0F 39 3F 25 16 07 4D 00 B0 AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 
    //60 24 7E 0F 16 01 E8 23 7E 0F 16 04 0B 0F 01 60 24 7E 0F 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 
    //0F 1C F8 B1 34 0F 01 38 9F 6C 0F 17 19 00 88 29 7E 0F 05 00 04 01 B8 80 6C 0F 16 07 12 01 82 77 
    //2E 50 31 D4 00 00 88 29 7E 0F 2A 16 18 17 00 77 19 2E 50 31 D4 00 00 88 29 7E 0F 05 00 04 01 00 
    //6E 6C 0F 2A 16 16 0F 00 E0 2B 7E 0F 25 07 12 01 96 00 E0 2B 7E 0F 2C 04 16 07 08 01 72 1A 00 E0 
    //2B 7E 0F 19 19 2E 50 31 D4 00 00 88 29 7E 0F 05 00 04 01 00 6E 6C 0F 05 00 10 01 58 FA 70 0F 17 
    //16 0F 1A 00 E0 2B 7E 0F 19 19 2E 50 31 D4 00 00 88 29 7E 0F 05 00 04 01 00 6E 6C 0F 05 00 10 01 
    //58 FA 70 0F 2A 06 12 01 A5 00 E0 2B 7E 0F 16 06 AD 00 07 22 01 2D 01 D8 24 7E 0F 61 06 28 16 06 
    //38 01 07 38 01 B1 01 60 28 7E 0F 39 3F 25 16 61 18 01 60 28 7E 0F 28 16 04 0B 47 
  }


  function Actor FindInstigator(Actor Other) {
    return Other;                                                               //0000 : 04 00 08 2D 7E 0F 
    //04 00 08 2D 7E 0F 04 0B 47 
  }


  function bool IsRelevant(Actor Other) {
    local Actor Inst;
    Inst = FindInstigator(Other);                                               //0000 : 0F 00 18 35 7E 0F 1B 56 2B 00 00 00 D0 32 7E 0F 16 
    if (!bInitiallyActive) {                                                    //0011 : 07 1E 00 81 2D 01 08 22 7E 0F 16 
      return False;                                                             //001C : 04 28 
    }
    switch (TriggerType) {                                                      //001E : 05 01 01 80 22 7E 0F 
      case 5 :                                                                  //0025 : 0A 51 00 24 05 
        return Pawn(Other) != None
          && Pawn(Other).IsHumanControlled();//002A : 04 82 77 2E 50 31 D4 00 00 D0 32 7E 0F 2A 16 18 15 00 19 2E 50 31 D4 00 00 D0 32 7E 0F 06 00 04 1B A7 2A 00 00 16 16 
      case 0 :                                                                  //0051 : 0A 96 00 24 00 
        return Pawn(Other) != None
          && (Pawn(Other).IsPlayerPawn() || Pawn(Other).WasPlayerPawn());//0056 : 04 82 77 2E 50 31 D4 00 00 D0 32 7E 0F 2A 16 18 2E 00 84 19 2E 50 31 D4 00 00 D0 32 7E 0F 06 00 04 1B B9 0C 00 00 16 18 15 00 19 2E 50 31 D4 00 00 D0 32 7E 0F 06 00 04 1B 70 2B 00 00 16 16 16 
      case 6 :                                                                  //0096 : 0A C2 00 24 06 
        return Pawn(Other) != None && Pawn(Other).IsPlayerPawn();               //009B : 04 82 77 2E 50 31 D4 00 00 D0 32 7E 0F 2A 16 18 15 00 19 2E 50 31 D4 00 00 D0 32 7E 0F 06 00 04 1B B9 0C 00 00 16 16 
      case 1 :                                                                  //00C2 : 0A EF 00 24 01 
        return Pawn(Other) != None && Pawn(Other).CanTrigger(self);             //00C7 : 04 82 77 2E 50 31 D4 00 00 D0 32 7E 0F 2A 16 18 16 00 19 2E 50 31 D4 00 00 D0 32 7E 0F 07 00 04 1B E2 2A 00 00 17 16 16 
      case 2 :                                                                  //00EF : 0A 24 01 24 02 
        return ClassIsChildOf(Other.Class,ClassProximityType)
          && Pawn(Inst).IsPlayerPawn();//00F4 : 04 82 61 02 19 00 D0 32 7E 0F 05 00 04 01 68 E5 6B 0F 01 90 35 7E 0F 16 18 15 00 19 2E 50 31 D4 00 00 18 35 7E 0F 06 00 04 1B B9 0C 00 00 16 16 
      case 3 :                                                                  //0124 : 0A 2B 01 24 03 
        return True;                                                            //0129 : 04 27 
      default:                                                                  //012B : 0A FF FF 
      }
    }
    //0F 00 18 35 7E 0F 1B 56 2B 00 00 00 D0 32 7E 0F 16 07 1E 00 81 2D 01 08 22 7E 0F 16 04 28 05 01 
    //01 80 22 7E 0F 0A 51 00 24 05 04 82 77 2E 50 31 D4 00 00 D0 32 7E 0F 2A 16 18 15 00 19 2E 50 31 
    //D4 00 00 D0 32 7E 0F 06 00 04 1B A7 2A 00 00 16 16 0A 96 00 24 00 04 82 77 2E 50 31 D4 00 00 D0 
    //32 7E 0F 2A 16 18 2E 00 84 19 2E 50 31 D4 00 00 D0 32 7E 0F 06 00 04 1B B9 0C 00 00 16 18 15 00 
    //19 2E 50 31 D4 00 00 D0 32 7E 0F 06 00 04 1B 70 2B 00 00 16 16 16 0A C2 00 24 06 04 82 77 2E 50 
    //31 D4 00 00 D0 32 7E 0F 2A 16 18 15 00 19 2E 50 31 D4 00 00 D0 32 7E 0F 06 00 04 1B B9 0C 00 00 
    //16 16 0A EF 00 24 01 04 82 77 2E 50 31 D4 00 00 D0 32 7E 0F 2A 16 18 16 00 19 2E 50 31 D4 00 00 
    //D0 32 7E 0F 07 00 04 1B E2 2A 00 00 17 16 16 0A 24 01 24 02 04 82 61 02 19 00 D0 32 7E 0F 05 00 
    //04 01 68 E5 6B 0F 01 90 35 7E 0F 16 18 15 00 19 2E 50 31 D4 00 00 18 35 7E 0F 06 00 04 1B B9 0C 
    //00 00 16 16 0A 2B 01 24 03 04 27 0A FF FF 04 0B 47 
  }


  event UnTrigger(Actor Other,Pawn EventInstigator) {
    if (Event == Tag) {                                                         //0000 : 07 11 00 FE 01 38 9F 6C 0F 01 C0 9E 6C 0F 16 
      return;                                                                   //000F : 04 0B 
    }
    bInitiallyActive = False;                                                   //0011 : 14 2D 01 08 22 7E 0F 28 
    //07 11 00 FE 01 38 9F 6C 0F 01 C0 9E 6C 0F 16 04 0B 14 2D 01 08 22 7E 0F 28 04 0B 47 
  }


  event Trigger(Actor Other,Pawn EventInstigator) {
    local bool bWasActive;
    if (Event == Tag) {                                                         //0000 : 07 11 00 FE 01 38 9F 6C 0F 01 C0 9E 6C 0F 16 
      return;                                                                   //000F : 04 0B 
    }
    bWasActive = bInitiallyActive;                                              //0011 : 14 2D 00 48 42 7E 0F 2D 01 08 22 7E 0F 
    bInitiallyActive = True;                                                    //001E : 14 2D 01 08 22 7E 0F 27 
    if (!bWasActive) {                                                          //0026 : 07 37 00 81 2D 00 48 42 7E 0F 16 
      CheckTouchList();                                                         //0031 : 1B F2 2A 00 00 16 
    }
    //07 11 00 FE 01 38 9F 6C 0F 01 C0 9E 6C 0F 16 04 0B 14 2D 00 48 42 7E 0F 2D 01 08 22 7E 0F 14 2D 
    //01 08 22 7E 0F 27 07 37 00 81 2D 00 48 42 7E 0F 16 1B F2 2A 00 00 16 04 0B 47 
  }


  function CheckTouchList() {
    local Actor A;
    foreach TouchingActors(Class'Actor',A) {                                    //0000 : 2F 61 33 20 F8 8B C1 00 00 50 51 7E 0F 16 1C 00 
      Touch(A);                                                                 //0010 : 1B 39 01 00 00 00 50 51 7E 0F 16 
    }
    //2F 61 33 20 F8 8B C1 00 00 50 51 7E 0F 16 1C 00 1B 39 01 00 00 00 50 51 7E 0F 16 31 30 04 0B 47 
    //
  }


  function Actor SpecialHandling(Pawn Other) {
    local Actor A;
    if (bTriggerOnceOnly && !bCollideActors) {                                  //0000 : 07 18 00 82 2D 01 D8 24 7E 0F 18 09 00 81 2D 01 08 97 6C 0F 16 16 
      return None;                                                              //0016 : 04 2A 
    }
    if (TriggerType == 5 && !Other.IsHumanControlled()) {                       //0018 : 07 40 00 82 9A 39 3A 01 80 22 7E 0F 39 3A 24 05 16 18 12 00 81 19 00 D0 52 7E 0F 06 00 04 1B A7 2A 00 00 16 16 16 
      return None;                                                              //003E : 04 2A 
    }
    if (TriggerType == 0 && !Other.IsPlayerPawn()) {                            //0040 : 07 68 00 82 9A 39 3A 01 80 22 7E 0F 39 3A 24 00 16 18 12 00 81 19 00 D0 52 7E 0F 06 00 04 1B B9 0C 00 00 16 16 16 
      return None;                                                              //0066 : 04 2A 
    }
    if (!bInitiallyActive) {                                                    //0068 : 07 F2 00 81 2D 01 08 22 7E 0F 16 
      if (TriggerActor == None) {                                               //0073 : 07 84 00 72 01 30 55 7E 0F 2A 16 
        FindTriggerActor();                                                     //007E : 1B 9E 2A 00 00 16 
      }
      if (TriggerActor == None) {                                               //0084 : 07 91 00 72 01 30 55 7E 0F 2A 16 
        return None;                                                            //008F : 04 2A 
      }
      if (TriggerActor2 != None
        && VSize(TriggerActor2.Location - Other.Location) < VSize(TriggerActor.Location - Other.Location)) {//0091 : 07 EC 00 82 77 01 A8 55 7E 0F 2A 16 18 43 00 B0 E1 D8 19 01 A8 55 7E 0F 05 00 0C 01 30 81 6C 0F 19 00 D0 52 7E 0F 05 00 0C 01 30 81 6C 0F 16 16 E1 D8 19 01 30 55 7E 0F 05 00 0C 01 30 81 6C 0F 19 00 D0 52 7E 0F 05 00 0C 01 30 81 6C 0F 16 16 16 16 
        return TriggerActor2;                                                   //00E3 : 04 01 A8 55 7E 0F 
      } else {                                                                  //00E9 : 06 F2 00 
        return TriggerActor;                                                    //00EC : 04 01 30 55 7E 0F 
      }
    }
    if (TriggerType == 4) {                                                     //00F2 : 07 04 01 9A 39 3A 01 80 22 7E 0F 39 3A 24 04 16 
      return self;                                                              //0102 : 04 17 
    }
    if (IsRelevant(Other)) {                                                    //0104 : 07 40 01 1B B1 2A 00 00 00 D0 52 7E 0F 16 
      foreach TouchingActors(Class'Actor',A) {                                  //0112 : 2F 61 33 20 F8 8B C1 00 00 20 56 7E 0F 16 3D 01 
        if (A == Other) {                                                       //0122 : 07 3C 01 72 00 20 56 7E 0F 00 D0 52 7E 0F 16 
          Touch(Other);                                                         //0131 : 1B 39 01 00 00 00 D0 52 7E 0F 16 
        }
      }
      return self;                                                              //013E : 04 17 
    }
    return self;                                                                //0140 : 04 17 
    //07 18 00 82 2D 01 D8 24 7E 0F 18 09 00 81 2D 01 08 97 6C 0F 16 16 04 2A 07 40 00 82 9A 39 3A 01 
    //80 22 7E 0F 39 3A 24 05 16 18 12 00 81 19 00 D0 52 7E 0F 06 00 04 1B A7 2A 00 00 16 16 16 04 2A 
    //07 68 00 82 9A 39 3A 01 80 22 7E 0F 39 3A 24 00 16 18 12 00 81 19 00 D0 52 7E 0F 06 00 04 1B B9 
    //0C 00 00 16 16 16 04 2A 07 F2 00 81 2D 01 08 22 7E 0F 16 07 84 00 72 01 30 55 7E 0F 2A 16 1B 9E 
    //2A 00 00 16 07 91 00 72 01 30 55 7E 0F 2A 16 04 2A 07 EC 00 82 77 01 A8 55 7E 0F 2A 16 18 43 00 
    //B0 E1 D8 19 01 A8 55 7E 0F 05 00 0C 01 30 81 6C 0F 19 00 D0 52 7E 0F 05 00 0C 01 30 81 6C 0F 16 
    //16 E1 D8 19 01 30 55 7E 0F 05 00 0C 01 30 81 6C 0F 19 00 D0 52 7E 0F 05 00 0C 01 30 81 6C 0F 16 
    //16 16 16 04 01 A8 55 7E 0F 06 F2 00 04 01 30 55 7E 0F 07 04 01 9A 39 3A 01 80 22 7E 0F 39 3A 24 
    //04 16 04 17 07 40 01 1B B1 2A 00 00 00 D0 52 7E 0F 16 2F 61 33 20 F8 8B C1 00 00 20 56 7E 0F 16 
    //3D 01 07 3C 01 72 00 20 56 7E 0F 00 D0 52 7E 0F 16 1B 39 01 00 00 00 D0 52 7E 0F 16 31 30 04 17 
    //04 17 04 0B 47 
  }


  function FindTriggerActor() {
    local Actor A;
    TriggerActor = None;                                                        //0000 : 0F 01 30 55 7E 0F 2A 
    TriggerActor2 = None;                                                       //0007 : 0F 01 A8 55 7E 0F 2A 
    foreach AllActors(Class'Actor',A) {                                         //000E : 2F 61 30 20 F8 8B C1 00 00 C0 57 7E 0F 16 5E 00 
      if (A.Event == Tag) {                                                     //001E : 07 5D 00 FE 19 00 C0 57 7E 0F 05 00 04 01 38 9F 6C 0F 01 C0 9E 6C 0F 16 
        if (TriggerActor == None) {                                             //0036 : 07 4F 00 72 01 30 55 7E 0F 2A 16 
          TriggerActor = A;                                                     //0041 : 0F 01 30 55 7E 0F 00 C0 57 7E 0F 
        } else {                                                                //004C : 06 5D 00 
          TriggerActor2 = A;                                                    //004F : 0F 01 A8 55 7E 0F 00 C0 57 7E 0F 
          return;                                                               //005B : 04 0B 
        }
      }
    }
    //0F 01 30 55 7E 0F 2A 0F 01 A8 55 7E 0F 2A 2F 61 30 20 F8 8B C1 00 00 C0 57 7E 0F 16 5E 00 07 5D 
    //00 FE 19 00 C0 57 7E 0F 05 00 04 01 38 9F 6C 0F 01 C0 9E 6C 0F 16 07 4F 00 72 01 30 55 7E 0F 2A 
    //16 0F 01 30 55 7E 0F 00 C0 57 7E 0F 06 5D 00 0F 01 A8 55 7E 0F 00 C0 57 7E 0F 30 04 0B 31 30 04 
    //0B 47 
  }


  function Reset() {
    Super.Reset();                                                              //0000 : 1C A8 B4 34 0F 16 
    bInitiallyActive = bSavedInitialActive;                                     //0006 : 14 2D 01 08 22 7E 0F 2D 01 F8 59 7E 0F 
    SetCollision(bSavedInitialCollision,bBlockActors);                          //0013 : 61 06 2D 01 70 5A 7E 0F 2D 01 F8 97 6C 0F 16 
    //1C A8 B4 34 0F 16 14 2D 01 08 22 7E 0F 2D 01 F8 59 7E 0F 61 06 2D 01 70 5A 7E 0F 2D 01 F8 97 6C 
    //0F 16 04 0B 47 
  }


  function PostBeginPlay() {
    if (!bInitiallyActive) {                                                    //0000 : 07 11 00 81 2D 01 08 22 7E 0F 16 
      FindTriggerActor();                                                       //000B : 1B 9E 2A 00 00 16 
    }
    if (TriggerType == 4) {                                                     //0011 : 07 39 00 9A 39 3A 01 80 22 7E 0F 39 3A 24 04 16 
      bHidden = False;                                                          //0021 : 14 2D 01 48 5E 6E 0F 28 
      bProjTarget = True;                                                       //0029 : 14 2D 01 80 97 6C 0F 27 
      SetDrawType(0);                                                           //0031 : 1C 48 93 6B 0F 24 00 16 
    }
    bSavedInitialActive = bInitiallyActive;                                     //0039 : 14 2D 01 F8 59 7E 0F 2D 01 08 22 7E 0F 
    bSavedInitialCollision = bCollideActors;                                    //0046 : 14 2D 01 70 5A 7E 0F 2D 01 08 97 6C 0F 
    Super.PostBeginPlay();                                                      //0053 : 1C D0 02 38 0F 16 
    //07 11 00 81 2D 01 08 22 7E 0F 16 1B 9E 2A 00 00 16 07 39 00 9A 39 3A 01 80 22 7E 0F 39 3A 24 04 
    //16 14 2D 01 48 5E 6E 0F 28 14 2D 01 80 97 6C 0F 27 1C 48 93 6B 0F 24 00 16 14 2D 01 F8 59 7E 0F 
    //2D 01 08 22 7E 0F 14 2D 01 70 5A 7E 0F 2D 01 08 97 6C 0F 1C D0 02 38 0F 16 04 0B 47 
  }


  function PreBeginPlay() {
    Super.PreBeginPlay();                                                       //0000 : 1C 18 B5 6C 0F 16 
    if (TriggerType == 0 || TriggerType == 1
      || TriggerType == 5
      || TriggerType == 6
      || TriggerType == 2
      && ClassIsChildOf(ClassProximityType,Class'Pawn')) {//0006 : 07 77 00 84 84 84 84 9A 39 3A 01 80 22 7E 0F 39 3A 24 00 16 18 0E 00 9A 39 3A 01 80 22 7E 0F 39 3A 24 01 16 16 18 0E 00 9A 39 3A 01 80 22 7E 0F 39 3A 24 05 16 16 18 0E 00 9A 39 3A 01 80 22 7E 0F 39 3A 24 06 16 16 18 20 00 82 9A 39 3A 01 80 22 7E 0F 39 3A 24 02 16 18 0E 00 61 02 01 90 35 7E 0F 20 50 31 D4 00 16 16 16 
      OnlyAffectPawns(True);                                                    //0070 : 1C 70 8B 6B 0F 27 16 
    }
    //1C 18 B5 6C 0F 16 07 77 00 84 84 84 84 9A 39 3A 01 80 22 7E 0F 39 3A 24 00 16 18 0E 00 9A 39 3A 
    //01 80 22 7E 0F 39 3A 24 01 16 16 18 0E 00 9A 39 3A 01 80 22 7E 0F 39 3A 24 05 16 16 18 0E 00 9A 
    //39 3A 01 80 22 7E 0F 39 3A 24 06 16 16 18 20 00 82 9A 39 3A 01 80 22 7E 0F 39 3A 24 02 16 18 0E 
    //00 61 02 01 90 35 7E 0F 20 50 31 D4 00 16 16 16 1C 70 8B 6B 0F 27 16 04 0B 47 
  }


  function bool SelfTriggered() {
    return bInitiallyActive;                                                    //0000 : 04 2D 01 08 22 7E 0F 
    //04 2D 01 08 22 7E 0F 04 0B 47 
  }


  function PlayerToucherDied(Pawn P) {
    if (bInitiallyActive && TriggerType == 6) {                                 //0000 : 07 2C 00 82 2D 01 08 22 7E 0F 18 0E 00 9A 39 3A 01 80 22 7E 0F 39 3A 24 06 16 16 
      UntriggerEvent(Event,self,P);                                             //001B : 1C 80 AF 34 0F 01 38 9F 6C 0F 17 00 20 5F 7E 0F 16 
    }
    //07 2C 00 82 2D 01 08 22 7E 0F 18 0E 00 9A 39 3A 01 80 22 7E 0F 39 3A 24 06 16 16 1C 80 AF 34 0F 
    //01 38 9F 6C 0F 17 00 20 5F 7E 0F 16 04 0B 47 
  }


  state() OtherTriggerTurnsOff {

      function Trigger(Actor Other,Pawn EventInstigator) {
        bInitiallyActive = False;                                               //0000 : 14 2D 01 08 22 7E 0F 28 
        //14 2D 01 08 22 7E 0F 28 04 0B 47 
      }


    //08 47 

  }


  state() OtherTriggerTurnsOn {

      function Trigger(Actor Other,Pawn EventInstigator) {
        local bool bWasActive;
        bWasActive = bInitiallyActive;                                          //0000 : 14 2D 00 B8 4A 7E 0F 2D 01 08 22 7E 0F 
        bInitiallyActive = True;                                                //000D : 14 2D 01 08 22 7E 0F 27 
        if (!bWasActive) {                                                      //0015 : 07 26 00 81 2D 00 B8 4A 7E 0F 16 
          CheckTouchList();                                                     //0020 : 1B F2 2A 00 00 16 
        }
        //14 2D 00 B8 4A 7E 0F 2D 01 08 22 7E 0F 14 2D 01 08 22 7E 0F 27 07 26 00 81 2D 00 B8 4A 7E 0F 16 
        //1B F2 2A 00 00 16 04 0B 47 
      }


    //08 47 

  }


  state() OtherTriggerToggles {

      function Trigger(Actor Other,Pawn EventInstigator) {
        bInitiallyActive = !bInitiallyActive;                                   //0000 : 14 2D 01 08 22 7E 0F 81 2D 01 08 22 7E 0F 16 
        if (bInitiallyActive) {                                                 //000F : 07 1E 00 2D 01 08 22 7E 0F 
          CheckTouchList();                                                     //0018 : 1B F2 2A 00 00 16 
        }
        //14 2D 01 08 22 7E 0F 81 2D 01 08 22 7E 0F 16 07 1E 00 2D 01 08 22 7E 0F 1B F2 2A 00 00 16 04 0B 
        //47 
      }


    //08 47 

  }


  state() NormalTrigger {

    //08 47 

  }



