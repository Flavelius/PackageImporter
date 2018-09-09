//==============================================================================
//  FSkill_EffectClass_AudioVisual_Emitter
//==============================================================================

class FSkill_EffectClass_AudioVisual_Emitter extends FSkill_EffectClass_AudioVisual
    native
    dependsOn(Game_Pawn,Game_ShiftableAppearance,Game_EquippedAppearance,Appearance_MainWeapon,Actor,Emitter)
  ;

  var (Emitter) const string EmitterName;
  var (Emitter) const float Duration;
  var (Binding) const string BoundToBone;
  var (Binding) const bool ScaleWithBase;
  var (Binding) const float ExtraScale;
  var (Location) const Vector Location;
  var (Location) const float speed;
  var (Location) const Rotator Rotation;
  var (Emitter) const bool SpawnerSetsDuration;
  var transient class<Emitter> EmitterClass;
  var transient bool ReportedMissingEmitter;


  function GetWeaponTracerBoneOffsets(Game_Pawn aPawn,out name OutBoneName,out Vector outStartBoneOffset,out Vector outEndBoneOffset) {
    local Appearance_MainWeapon weaponAppearance;
    local export editinline Game_EquippedAppearance equippedAppearance;
    local int mainWeaponIndex;
    weaponAppearance = None;                                                    //0000 : 0F 00 70 45 1E 11 2A 
    equippedAppearance = Game_EquippedAppearance(aPawn.Appearance.GetCurrent());//0007 : 0F 00 E8 45 1E 11 2E 70 B8 5F 01 19 19 00 D0 43 1E 11 05 00 04 01 A8 83 18 11 06 00 04 1B 6A 05 00 00 16 
    if (equippedAppearance != None) {                                           //002A : 07 78 00 77 00 E8 45 1E 11 2A 16 
      mainWeaponIndex = equippedAppearance.GetValue(16);                        //0035 : 0F 00 60 46 1E 11 19 00 E8 45 1E 11 08 00 04 1B 7D 0C 00 00 24 10 16 
      if (mainWeaponIndex >= 0) {                                               //004C : 07 78 00 99 00 60 46 1E 11 25 16 
        weaponAppearance = Appearance_MainWeapon(equippedAppearance.GetAppearanceResource(16,mainWeaponIndex));//0057 : 0F 00 70 45 1E 11 2E 20 56 60 01 19 00 E8 45 1E 11 0D 00 04 1B 08 0D 00 00 24 10 00 60 46 1E 11 16 
      }
    }
    if (weaponAppearance != None) {                                             //0078 : 07 AA 00 77 00 70 45 1E 11 2A 16 
      OutBoneName = 'Weapon1';                                                  //0083 : 0F 00 D8 46 1E 11 21 20 13 00 00 
      weaponAppearance.GetWeaponTracerBoneOffsets(outStartBoneOffset,outEndBoneOffset);//008E : 19 00 70 45 1E 11 10 00 00 1B 90 0C 00 00 00 50 47 1E 11 00 C8 47 1E 11 16 
    } else {                                                                    //00A7 : 06 B5 00 
      OutBoneName = 'None';                                                     //00AA : 0F 00 D8 46 1E 11 21 00 00 00 00 
    }
    //0F 00 70 45 1E 11 2A 0F 00 E8 45 1E 11 2E 70 B8 5F 01 19 19 00 D0 43 1E 11 05 00 04 01 A8 83 18 
    //11 06 00 04 1B 6A 05 00 00 16 07 78 00 77 00 E8 45 1E 11 2A 16 0F 00 60 46 1E 11 19 00 E8 45 1E 
    //11 08 00 04 1B 7D 0C 00 00 24 10 16 07 78 00 99 00 60 46 1E 11 25 16 0F 00 70 45 1E 11 2E 20 56 
    //60 01 19 00 E8 45 1E 11 0D 00 04 1B 08 0D 00 00 24 10 00 60 46 1E 11 16 07 AA 00 77 00 70 45 1E 
    //11 2A 16 0F 00 D8 46 1E 11 21 20 13 00 00 19 00 70 45 1E 11 10 00 00 1B 90 0C 00 00 00 50 47 1E 
    //11 00 C8 47 1E 11 16 06 B5 00 0F 00 D8 46 1E 11 21 00 00 00 00 04 0B 47 
  }


  protected final event LoadEmitter() {
    if (EmitterClass == None || IsEditor()) {                                   //0000 : 07 A8 00 84 72 01 08 4A 1E 11 2A 16 18 07 00 1B 63 0C 00 00 16 16 
      if (ReportedMissingEmitter && !IsEditor()) {                              //0016 : 07 2E 00 82 2D 01 88 4A 1E 11 18 09 00 81 1B 63 0C 00 00 16 16 16 
        return;                                                                 //002C : 04 0B 
      }
      if (InStr(EmitterName,".") != -1) {                                       //002E : 07 5D 00 9B 7E 01 00 4B 1E 11 1F 2E 00 16 1D FF FF FF FF 16 
        EmitterClass = Class<Emitter>(static.DynamicLoadObject(EmitterName,Class'Class'));//0042 : 0F 01 08 4A 1E 11 13 D0 26 D4 00 1C 60 E7 69 0F 01 00 4B 1E 11 20 D8 DE 1F 10 16 
      }
      if (EmitterClass == None) {                                               //005D : 07 A8 00 72 01 08 4A 1E 11 2A 16 
        EmitterClass = Class<Emitter>(static.DynamicLoadObject("SBParticles." $ EmitterName,Class'Class'));//0068 : 0F 01 08 4A 1E 11 13 D0 26 D4 00 1C 60 E7 69 0F 70 1F 53 42 50 61 72 74 69 63 6C 65 73 2E 00 01 00 4B 1E 11 16 20 D8 DE 1F 10 16 
        if (EmitterClass == None) {                                             //0093 : 07 A8 00 72 01 08 4A 1E 11 2A 16 
          ReportedMissingEmitter = True;                                        //009E : 14 2D 01 88 4A 1E 11 27 
          return;                                                               //00A6 : 04 0B 
        }
      }
    }
    //07 A8 00 84 72 01 08 4A 1E 11 2A 16 18 07 00 1B 63 0C 00 00 16 16 07 2E 00 82 2D 01 88 4A 1E 11 
    //18 09 00 81 1B 63 0C 00 00 16 16 16 04 0B 07 5D 00 9B 7E 01 00 4B 1E 11 1F 2E 00 16 1D FF FF FF 
    //FF 16 0F 01 08 4A 1E 11 13 D0 26 D4 00 1C 60 E7 69 0F 01 00 4B 1E 11 20 D8 DE 1F 10 16 07 A8 00 
    //72 01 08 4A 1E 11 2A 16 0F 01 08 4A 1E 11 13 D0 26 D4 00 1C 60 E7 69 0F 70 1F 53 42 50 61 72 74 
    //69 63 6C 65 73 2E 00 01 00 4B 1E 11 16 20 D8 DE 1F 10 16 07 A8 00 72 01 08 4A 1E 11 2A 16 14 2D 
    //01 88 4A 1E 11 27 04 0B 04 0B 47 
  }


  protected final event Actor StartEmitterOnBone(Game_Pawn aPawn,float aRunningDuration,name aBone,optional Vector aOffset) {
    local Actor Emitter;
    Emitter = StartEmitterOnLocation(aPawn,aPawn.Location,aRunningDuration,False);//0000 : 0F 00 80 4D 1E 11 1B 26 06 00 00 00 28 4C 1E 11 19 00 28 4C 1E 11 05 00 0C 01 30 81 6C 0F 00 F8 4D 1E 11 28 16 
    if (Emitter != None) {                                                      //0025 : 07 78 00 77 00 80 4D 1E 11 2A 16 
      aPawn.AttachToBone(Emitter,aBone);                                        //0030 : 19 00 28 4C 1E 11 10 00 04 1C 10 B3 6D 0F 00 80 4D 1E 11 00 70 4E 1E 11 16 
      Emitter.SetRelativeRotation(Rotation);                                    //0049 : 19 00 80 4D 1E 11 0B 00 04 1C 98 FF 6D 0F 01 E8 4E 1E 11 16 
      Emitter.SetRelativeLocation(Location + aOffset);                          //005D : 19 00 80 4D 1E 11 12 00 04 1C C0 FD 6D 0F D7 01 60 4F 1E 11 00 D8 4F 1E 11 16 16 
    }
    return Emitter;                                                             //0078 : 04 00 80 4D 1E 11 
    //0F 00 80 4D 1E 11 1B 26 06 00 00 00 28 4C 1E 11 19 00 28 4C 1E 11 05 00 0C 01 30 81 6C 0F 00 F8 
    //4D 1E 11 28 16 07 78 00 77 00 80 4D 1E 11 2A 16 19 00 28 4C 1E 11 10 00 04 1C 10 B3 6D 0F 00 80 
    //4D 1E 11 00 70 4E 1E 11 16 19 00 80 4D 1E 11 0B 00 04 1C 98 FF 6D 0F 01 E8 4E 1E 11 16 19 00 80 
    //4D 1E 11 12 00 04 1C C0 FD 6D 0F D7 01 60 4F 1E 11 00 D8 4F 1E 11 16 16 04 00 80 4D 1E 11 04 0B 
    //47 
  }


  protected final event Actor StartEmitterOnWeaponTip(Game_Pawn aPawn,float aRunningDuration) {
    local name BoneName;
    local Vector StartBoneOffset;
    local Vector EndBoneOffset;
    GetWeaponTracerBoneOffsets(aPawn,BoneName,StartBoneOffset,EndBoneOffset);   //0000 : 1B 90 0C 00 00 00 78 51 1E 11 00 F0 51 1E 11 00 68 52 1E 11 00 E0 52 1E 11 16 
    if (BoneName != 'None') {                                                   //001A : 07 47 00 FF 00 F0 51 1E 11 21 00 00 00 00 16 
      return StartEmitterOnBone(aPawn,aRunningDuration,BoneName,EndBoneOffset); //0029 : 04 1C 40 48 1E 11 00 78 51 1E 11 00 58 53 1E 11 00 F0 51 1E 11 00 E0 52 1E 11 16 
    } else {                                                                    //0044 : 06 49 00 
      return None;                                                              //0047 : 04 2A 
    }
    //1B 90 0C 00 00 00 78 51 1E 11 00 F0 51 1E 11 00 68 52 1E 11 00 E0 52 1E 11 16 07 47 00 FF 00 F0 
    //51 1E 11 21 00 00 00 00 16 04 1C 40 48 1E 11 00 78 51 1E 11 00 58 53 1E 11 00 F0 51 1E 11 00 E0 
    //52 1E 11 16 06 49 00 04 2A 04 0B 47 
  }


  protected final event Actor StartEmitterOnCharacterTop(Game_Pawn aPawn,float aRunningDuration,bool aAttachToActor) {
    local Vector EmitterLocation;
    EmitterLocation = aPawn.Location;                                           //0000 : 0F 00 08 56 1E 11 19 00 F8 54 1E 11 05 00 0C 01 30 81 6C 0F 
    EmitterLocation.Z += aPawn.CollisionHeight;                                 //0014 : B8 36 38 C5 69 0F 00 08 56 1E 11 19 00 F8 54 1E 11 05 00 04 01 40 8A 6C 0F 16 
    return StartEmitterOnLocation(aPawn,EmitterLocation,aRunningDuration,aAttachToActor);//002E : 04 1B 26 06 00 00 00 F8 54 1E 11 00 08 56 1E 11 00 80 56 1E 11 2D 00 F8 56 1E 11 16 
    //0F 00 08 56 1E 11 19 00 F8 54 1E 11 05 00 0C 01 30 81 6C 0F B8 36 38 C5 69 0F 00 08 56 1E 11 19 
    //00 F8 54 1E 11 05 00 04 01 40 8A 6C 0F 16 04 1B 26 06 00 00 00 F8 54 1E 11 00 08 56 1E 11 00 80 
    //56 1E 11 2D 00 F8 56 1E 11 16 04 0B 47 
  }


  protected final event Actor StartEmitterOnCharacterBase(Game_Pawn aPawn,float aRunningDuration,bool aAttachToActor) {
    local Vector EmitterLocation;
    EmitterLocation = aPawn.Location;                                           //0000 : 0F 00 A8 59 1E 11 19 00 98 58 1E 11 05 00 0C 01 30 81 6C 0F 
    EmitterLocation.Z -= aPawn.CollisionHeight;                                 //0014 : B9 36 38 C5 69 0F 00 A8 59 1E 11 19 00 98 58 1E 11 05 00 04 01 40 8A 6C 0F 16 
    return StartEmitterOnLocation(aPawn,EmitterLocation,aRunningDuration,aAttachToActor);//002E : 04 1B 26 06 00 00 00 98 58 1E 11 00 A8 59 1E 11 00 20 5A 1E 11 2D 00 98 5A 1E 11 16 
    //0F 00 A8 59 1E 11 19 00 98 58 1E 11 05 00 0C 01 30 81 6C 0F B9 36 38 C5 69 0F 00 A8 59 1E 11 19 
    //00 98 58 1E 11 05 00 04 01 40 8A 6C 0F 16 04 1B 26 06 00 00 00 98 58 1E 11 00 A8 59 1E 11 00 20 
    //5A 1E 11 2D 00 98 5A 1E 11 16 04 0B 47 
  }


  protected final event Actor StartEmitterOnHitLocation(Game_Pawn aPawn,float aRunningDuration,Vector aHitVector) {
    local float hitDistance;
    local Vector EmitterLocation;
    hitDistance = FMax(0.00000000,FMin(VSize(aHitVector),aPawn.SkillRadius));   //0000 : 0F 00 60 5D 1E 11 F5 1E 00 00 00 00 F4 E1 00 D8 5D 1E 11 16 19 00 38 5C 1E 11 05 00 04 01 C0 57 19 11 16 16 
    EmitterLocation = aPawn.Location - Normal(aHitVector) * hitDistance;        //0024 : 0F 00 50 5E 1E 11 D8 19 00 38 5C 1E 11 05 00 0C 01 30 81 6C 0F D4 E2 00 D8 5D 1E 11 16 00 60 5D 1E 11 16 16 
    return StartEmitterOnLocation(aPawn,EmitterLocation,aRunningDuration,True); //0048 : 04 1B 26 06 00 00 00 38 5C 1E 11 00 50 5E 1E 11 00 C8 5E 1E 11 27 16 
    //0F 00 60 5D 1E 11 F5 1E 00 00 00 00 F4 E1 00 D8 5D 1E 11 16 19 00 38 5C 1E 11 05 00 04 01 C0 57 
    //19 11 16 16 0F 00 50 5E 1E 11 D8 19 00 38 5C 1E 11 05 00 0C 01 30 81 6C 0F D4 E2 00 D8 5D 1E 11 
    //16 00 60 5D 1E 11 16 16 04 1B 26 06 00 00 00 38 5C 1E 11 00 50 5E 1E 11 00 C8 5E 1E 11 27 16 04 
    //0B 47 
  }


  event Actor StartEmitterOnLocation(Actor aActor,Vector aLocation,float aRunningDuration,bool aAttachToActor) {
    local Emitter Emitter;
    LoadEmitter();                                                              //0000 : 1C 20 43 1E 11 16 
    Emitter = aActor.Spawn(EmitterClass,aActor,,aLocation + VSize(Location) * Normal(static.QuatRotateVector(static.QuatInvert(static.QuatFromRotator(aActor.Rotation)),Normal(Location))),aActor.Rotation + Rotation);//0006 : 0F 00 F8 62 1E 11 19 00 68 60 1E 11 5D 00 04 61 16 01 08 4A 1E 11 00 68 60 1E 11 0B D7 00 70 63 1E 11 D5 E1 01 60 4F 1E 11 16 E2 1C E0 D7 37 0F 1C 30 DA 37 0F 1C 80 3C 6A 0F 19 00 68 60 1E 11 05 00 0C 01 00 84 6C 0F 16 16 E2 01 60 4F 1E 11 16 16 16 16 16 61 3C 19 00 68 60 1E 11 05 00 0C 01 00 84 6C 0F 01 E8 4E 1E 11 16 16 
    if (Emitter == None) {                                                      //0072 : 07 7F 00 72 00 F8 62 1E 11 2A 16 
      return None;                                                              //007D : 04 2A 
    }
    Emitter.AddEffectScaleFromBase = ScaleWithBase;                             //007F : 14 19 00 F8 62 1E 11 06 00 04 2D 01 D8 05 7E 0F 2D 01 E8 63 1E 11 
    Emitter.LocalDrawScale *= ExtraScale;                                       //0095 : B6 19 00 F8 62 1E 11 05 00 04 01 60 05 7E 0F 01 60 64 1E 11 16 
    Emitter.SetPhysics(6);                                                      //00AA : 19 00 F8 62 1E 11 05 00 00 6F 82 24 06 16 
    Emitter.Acceleration = speed * vector(aActor.Rotation);                     //00B8 : 0F 19 00 F8 62 1E 11 05 00 0C 01 18 96 6C 0F D5 01 D8 64 1E 11 39 39 19 00 68 60 1E 11 05 00 0C 01 00 84 6C 0F 16 
    if (SpawnerSetsDuration) {                                                  //00DE : 07 FE 00 2D 01 50 65 1E 11 
      Emitter.LifeSpan = aRunningDuration;                                      //00E7 : 0F 19 00 F8 62 1E 11 05 00 04 01 A0 A0 6C 0F 00 C8 65 1E 11 
    } else {                                                                    //00FB : 06 38 01 
      if (Duration <= 0.00000000) {                                             //00FE : 07 24 01 B2 01 40 66 1E 11 1E 00 00 00 00 16 
        Emitter.LifeSpan = 0.00000000;                                          //010D : 0F 19 00 F8 62 1E 11 05 00 04 01 A0 A0 6C 0F 1E 00 00 00 00 
      } else {                                                                  //0121 : 06 38 01 
        Emitter.LifeSpan = Duration;                                            //0124 : 0F 19 00 F8 62 1E 11 05 00 04 01 A0 A0 6C 0F 01 40 66 1E 11 
      }
    }
    if (aAttachToActor && Emitter != None) {                                    //0138 : 07 5F 01 82 2D 00 B8 66 1E 11 18 09 00 77 00 F8 62 1E 11 2A 16 16 
      Emitter.SetBase(aActor);                                                  //014E : 19 00 F8 62 1E 11 08 00 00 61 2A 00 68 60 1E 11 16 
    }
    return Emitter;                                                             //015F : 04 00 F8 62 1E 11 
    //1C 20 43 1E 11 16 0F 00 F8 62 1E 11 19 00 68 60 1E 11 5D 00 04 61 16 01 08 4A 1E 11 00 68 60 1E 
    //11 0B D7 00 70 63 1E 11 D5 E1 01 60 4F 1E 11 16 E2 1C E0 D7 37 0F 1C 30 DA 37 0F 1C 80 3C 6A 0F 
    //19 00 68 60 1E 11 05 00 0C 01 00 84 6C 0F 16 16 E2 01 60 4F 1E 11 16 16 16 16 16 61 3C 19 00 68 
    //60 1E 11 05 00 0C 01 00 84 6C 0F 01 E8 4E 1E 11 16 16 07 7F 00 72 00 F8 62 1E 11 2A 16 04 2A 14 
    //19 00 F8 62 1E 11 06 00 04 2D 01 D8 05 7E 0F 2D 01 E8 63 1E 11 B6 19 00 F8 62 1E 11 05 00 04 01 
    //60 05 7E 0F 01 60 64 1E 11 16 19 00 F8 62 1E 11 05 00 00 6F 82 24 06 16 0F 19 00 F8 62 1E 11 05 
    //00 0C 01 18 96 6C 0F D5 01 D8 64 1E 11 39 39 19 00 68 60 1E 11 05 00 0C 01 00 84 6C 0F 16 07 FE 
    //00 2D 01 50 65 1E 11 0F 19 00 F8 62 1E 11 05 00 04 01 A0 A0 6C 0F 00 C8 65 1E 11 06 38 01 07 24 
    //01 B2 01 40 66 1E 11 1E 00 00 00 00 16 0F 19 00 F8 62 1E 11 05 00 04 01 A0 A0 6C 0F 1E 00 00 00 
    //00 06 38 01 0F 19 00 F8 62 1E 11 05 00 04 01 A0 A0 6C 0F 01 40 66 1E 11 07 5F 01 82 2D 00 B8 66 
    //1E 11 18 09 00 77 00 F8 62 1E 11 2A 16 16 19 00 F8 62 1E 11 08 00 00 61 2A 00 68 60 1E 11 16 04 
    //00 F8 62 1E 11 04 0B 47 
  }


  final event StopEmitter(Actor aActor,Actor aEmitter) {
    local Game_Pawn aPawn;
    aPawn = Game_Pawn(aActor);                                                  //0000 : 0F 00 70 69 1E 11 2E 18 38 5B 01 00 58 68 1E 11 
    if (aPawn != None) {                                                        //0010 : 07 47 00 77 00 70 69 1E 11 2A 16 
      if (Len(BoundToBone) > 0) {                                               //001B : 07 47 00 97 7D 01 E8 69 1E 11 16 25 16 
        if (aPawn != None) {                                                    //0028 : 07 47 00 77 00 70 69 1E 11 2A 16 
          aPawn.DetachFromBone(aEmitter);                                       //0033 : 19 00 70 69 1E 11 0B 00 04 1C C0 B0 6D 0F 00 60 6A 1E 11 16 
        }
      }
    }
    aEmitter.Destroy();                                                         //0047 : 19 00 60 6A 1E 11 03 00 04 61 17 16 
    //0F 00 70 69 1E 11 2E 18 38 5B 01 00 58 68 1E 11 07 47 00 77 00 70 69 1E 11 2A 16 07 47 00 97 7D 
    //01 E8 69 1E 11 16 25 16 07 47 00 77 00 70 69 1E 11 2A 16 19 00 70 69 1E 11 0B 00 04 1C C0 B0 6D 
    //0F 00 60 6A 1E 11 16 19 00 60 6A 1E 11 03 00 04 61 17 16 04 0B 47 
  }


  final event Actor StartEmitter(Actor aActor,optional float aRunningDuration,optional Vector aHitVector) {
    local Game_Pawn aPawn;
    aPawn = Game_Pawn(aActor);                                                  //0000 : 0F 00 28 6D 1E 11 2E 18 38 5B 01 00 D8 6A 1E 11 
    if (aPawn != None) {                                                        //0010 : 07 04 01 77 00 28 6D 1E 11 2A 16 
      if (Len(BoundToBone) == 0) {                                              //001B : 07 3D 00 9A 7D 01 E8 69 1E 11 16 25 16 
        return StartEmitterOnCharacterBase(aPawn,aRunningDuration,False);       //0028 : 04 1C 48 54 1E 11 00 28 6D 1E 11 00 A0 6D 1E 11 28 16 
      } else {                                                                  //003A : 06 01 01 
        if (BoundToBone == "CharacterBase") {                                   //003D : 07 6B 00 7A 01 E8 69 1E 11 1F 43 68 61 72 61 63 74 65 72 42 61 73 65 00 16 
          return StartEmitterOnCharacterBase(aPawn,aRunningDuration,True);      //0056 : 04 1C 48 54 1E 11 00 28 6D 1E 11 00 A0 6D 1E 11 27 16 
        } else {                                                                //0068 : 06 01 01 
          if (BoundToBone == "CharacterTop") {                                  //006B : 07 98 00 7A 01 E8 69 1E 11 1F 43 68 61 72 61 63 74 65 72 54 6F 70 00 16 
            return StartEmitterOnCharacterTop(aPawn,aRunningDuration,True);     //0083 : 04 1C C8 50 1E 11 00 28 6D 1E 11 00 A0 6D 1E 11 27 16 
          } else {                                                              //0095 : 06 01 01 
            if (BoundToBone == "Hit") {                                         //0098 : 07 C0 00 7A 01 E8 69 1E 11 1F 48 69 74 00 16 
              return StartEmitterOnHitLocation(aPawn,aRunningDuration,aHitVector);//00A7 : 04 1C E8 57 1E 11 00 28 6D 1E 11 00 A0 6D 1E 11 00 18 6E 1E 11 16 
            } else {                                                            //00BD : 06 01 01 
              if (BoundToBone == "WeaponTip") {                                 //00C0 : 07 E9 00 7A 01 E8 69 1E 11 1F 57 65 61 70 6F 6E 54 69 70 00 16 
                return StartEmitterOnWeaponTip(aPawn,aRunningDuration);         //00D5 : 04 1C 78 4B 1E 11 00 28 6D 1E 11 00 A0 6D 1E 11 16 
              } else {                                                          //00E6 : 06 01 01 
                return StartEmitterOnBone(aPawn,aRunningDuration,name(BoundToBone));//00E9 : 04 1C 40 48 1E 11 00 28 6D 1E 11 00 A0 6D 1E 11 39 5A 01 E8 69 1E 11 16 
              }
            }
          }
        }
      }
    } else {                                                                    //0101 : 06 34 01 
      if (aActor != None) {                                                     //0104 : 07 32 01 77 00 D8 6A 1E 11 2A 16 
        return StartEmitterOnLocation(aActor,aActor.Location,aRunningDuration,True);//010F : 04 1B 26 06 00 00 00 D8 6A 1E 11 19 00 D8 6A 1E 11 05 00 0C 01 30 81 6C 0F 00 A0 6D 1E 11 27 16 
      } else {                                                                  //012F : 06 34 01 
        return None;                                                            //0132 : 04 2A 
      }
    }
    //0F 00 28 6D 1E 11 2E 18 38 5B 01 00 D8 6A 1E 11 07 04 01 77 00 28 6D 1E 11 2A 16 07 3D 00 9A 7D 
    //01 E8 69 1E 11 16 25 16 04 1C 48 54 1E 11 00 28 6D 1E 11 00 A0 6D 1E 11 28 16 06 01 01 07 6B 00 
    //7A 01 E8 69 1E 11 1F 43 68 61 72 61 63 74 65 72 42 61 73 65 00 16 04 1C 48 54 1E 11 00 28 6D 1E 
    //11 00 A0 6D 1E 11 27 16 06 01 01 07 98 00 7A 01 E8 69 1E 11 1F 43 68 61 72 61 63 74 65 72 54 6F 
    //70 00 16 04 1C C8 50 1E 11 00 28 6D 1E 11 00 A0 6D 1E 11 27 16 06 01 01 07 C0 00 7A 01 E8 69 1E 
    //11 1F 48 69 74 00 16 04 1C E8 57 1E 11 00 28 6D 1E 11 00 A0 6D 1E 11 00 18 6E 1E 11 16 06 01 01 
    //07 E9 00 7A 01 E8 69 1E 11 1F 57 65 61 70 6F 6E 54 69 70 00 16 04 1C 78 4B 1E 11 00 28 6D 1E 11 
    //00 A0 6D 1E 11 16 06 01 01 04 1C 40 48 1E 11 00 28 6D 1E 11 00 A0 6D 1E 11 39 5A 01 E8 69 1E 11 
    //16 06 34 01 07 32 01 77 00 D8 6A 1E 11 2A 16 04 1B 26 06 00 00 00 D8 6A 1E 11 19 00 D8 6A 1E 11 
    //05 00 0C 01 30 81 6C 0F 00 A0 6D 1E 11 27 16 06 34 01 04 2A 04 0B 47 
  }



