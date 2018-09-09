//==============================================================================
//  FSkill_EffectClass_AudioVisual_WeaponTracer
//==============================================================================

class FSkill_EffectClass_AudioVisual_WeaponTracer extends FSkill_EffectClass_AudioVisual_Emitter
    native
    dependsOn(ParticleEmitter,RibbonEmitter)
  ;

  var (Color) Color ColorMultiplier;


  function Actor StartEmitterOnLocation(Actor aActor,Vector aLocation,float aRunningDuration,bool aAttachToActor) {
    local Emitter Emitter;
    local ParticleEmitter ParticleEmitter;
    local RibbonEmitter RibbonEmitter;
    local int i;
    local Game_Pawn aPawn;
    local name BoneName;
    aPawn = Game_Pawn(aActor);                                                  //0000 : 0F 00 E0 4C 35 19 2E 18 38 5B 01 00 58 48 35 19 
    if (aPawn != None) {                                                        //0010 : 07 CE 02 77 00 E0 4C 35 19 2A 16 
      Emitter = Emitter(Super.StartEmitterOnLocation(aPawn,aLocation,aRunningDuration,aAttachToActor));//001B : 0F 00 58 4D 35 19 2E D0 26 D4 00 1C 88 5B 1E 11 00 E0 4C 35 19 00 D0 4D 35 19 00 48 4E 35 19 2D 00 C0 4E 35 19 16 
      if (Emitter != None) {                                                    //0041 : 07 C5 02 77 00 58 4D 35 19 2A 16 
        i = 0;                                                                  //004C : 0F 00 38 4F 35 19 25 
        while (i < Emitter.Emitters.Length) {                                   //0053 : 07 C5 02 96 00 38 4F 35 19 37 19 00 58 4D 35 19 05 00 00 01 38 F2 7D 0F 16 
          ParticleEmitter = Emitter.Emitters[i];                                //006C : 0F 00 B0 4F 35 19 10 00 38 4F 35 19 19 00 58 4D 35 19 05 00 00 01 38 F2 7D 0F 
          if (SpawnerSetsDuration) {                                            //0086 : 07 C1 00 2D 01 50 65 1E 11 
            ParticleEmitter.LifetimeRange.Min = aRunningDuration;               //008F : 0F 36 38 D6 6B 0F 19 00 B0 4F 35 19 05 00 08 01 88 68 75 0F 00 48 4E 35 19 
            ParticleEmitter.LifetimeRange.Max = aRunningDuration;               //00A8 : 0F 36 B0 D6 6B 0F 19 00 B0 4F 35 19 05 00 08 01 88 68 75 0F 00 48 4E 35 19 
          }
          RibbonEmitter = RibbonEmitter(ParticleEmitter);                       //00C1 : 0F 00 28 50 35 19 2E 30 48 D5 00 00 B0 4F 35 19 
          if (RibbonEmitter != None) {                                          //00D1 : 07 BB 02 77 00 28 50 35 19 2A 16 
            GetWeaponTracerBoneOffsets(aPawn,BoneName,RibbonEmitter.StartBoneOffset,RibbonEmitter.EndBoneOffset);//00DC : 1B 90 0C 00 00 00 E0 4C 35 19 00 98 2F 37 0F 19 00 28 50 35 19 05 00 0C 01 10 30 37 0F 19 00 28 50 35 19 05 00 0C 01 88 30 37 0F 16 
            if (BoneName != 'None') {                                           //0108 : 07 BB 02 FF 00 98 2F 37 0F 21 00 00 00 00 16 
              RibbonEmitter.ColorMultiplierRange.X.Min = RibbonEmitter.ColorMultiplierRange.X.Min * ColorMultiplier.R / 255.00000000;//0117 : 0F 36 38 D6 6B 0F 36 48 D5 6B 0F 19 00 28 50 35 19 05 00 18 01 40 3F 7C 0F AC AB 36 38 D6 6B 0F 36 48 D5 6B 0F 19 00 28 50 35 19 05 00 18 01 40 3F 7C 0F 39 3C 36 D0 90 6A 0F 01 E0 47 35 19 16 1E 00 00 7F 43 16 
              RibbonEmitter.ColorMultiplierRange.X.Max = RibbonEmitter.ColorMultiplierRange.X.Max * ColorMultiplier.R / 255.00000000;//015D : 0F 36 B0 D6 6B 0F 36 48 D5 6B 0F 19 00 28 50 35 19 05 00 18 01 40 3F 7C 0F AC AB 36 B0 D6 6B 0F 36 48 D5 6B 0F 19 00 28 50 35 19 05 00 18 01 40 3F 7C 0F 39 3C 36 D0 90 6A 0F 01 E0 47 35 19 16 1E 00 00 7F 43 16 
              RibbonEmitter.ColorMultiplierRange.Y.Min = RibbonEmitter.ColorMultiplierRange.Y.Min * ColorMultiplier.G / 255.00000000;//01A3 : 0F 36 38 D6 6B 0F 36 C0 D5 6B 0F 19 00 28 50 35 19 05 00 18 01 40 3F 7C 0F AC AB 36 38 D6 6B 0F 36 C0 D5 6B 0F 19 00 28 50 35 19 05 00 18 01 40 3F 7C 0F 39 3C 36 58 90 6A 0F 01 E0 47 35 19 16 1E 00 00 7F 43 16 
              RibbonEmitter.ColorMultiplierRange.Y.Max = RibbonEmitter.ColorMultiplierRange.Y.Max * ColorMultiplier.G / 255.00000000;//01E9 : 0F 36 B0 D6 6B 0F 36 C0 D5 6B 0F 19 00 28 50 35 19 05 00 18 01 40 3F 7C 0F AC AB 36 B0 D6 6B 0F 36 C0 D5 6B 0F 19 00 28 50 35 19 05 00 18 01 40 3F 7C 0F 39 3C 36 58 90 6A 0F 01 E0 47 35 19 16 1E 00 00 7F 43 16 
              RibbonEmitter.ColorMultiplierRange.Z.Min = RibbonEmitter.ColorMultiplierRange.Z.Min * ColorMultiplier.B / 255.00000000;//022F : 0F 36 38 D6 6B 0F 36 28 D7 6B 0F 19 00 28 50 35 19 05 00 18 01 40 3F 7C 0F AC AB 36 38 D6 6B 0F 36 28 D7 6B 0F 19 00 28 50 35 19 05 00 18 01 40 3F 7C 0F 39 3C 36 E0 8F 6A 0F 01 E0 47 35 19 16 1E 00 00 7F 43 16 
              RibbonEmitter.ColorMultiplierRange.Z.Max = RibbonEmitter.ColorMultiplierRange.Z.Max * ColorMultiplier.B / 255.00000000;//0275 : 0F 36 B0 D6 6B 0F 36 28 D7 6B 0F 19 00 28 50 35 19 05 00 18 01 40 3F 7C 0F AC AB 36 B0 D6 6B 0F 36 28 D7 6B 0F 19 00 28 50 35 19 05 00 18 01 40 3F 7C 0F 39 3C 36 E0 8F 6A 0F 01 E0 47 35 19 16 1E 00 00 7F 43 16 
            }
          }
          i++;                                                                  //02BB : A5 00 38 4F 35 19 16 
        }
      }
      return Emitter;                                                           //02C5 : 04 00 58 4D 35 19 
    } else {                                                                    //02CB : 06 D0 02 
      return None;                                                              //02CE : 04 2A 
    }
    //0F 00 E0 4C 35 19 2E 18 38 5B 01 00 58 48 35 19 07 CE 02 77 00 E0 4C 35 19 2A 16 0F 00 58 4D 35 
    //19 2E D0 26 D4 00 1C 88 5B 1E 11 00 E0 4C 35 19 00 D0 4D 35 19 00 48 4E 35 19 2D 00 C0 4E 35 19 
    //16 07 C5 02 77 00 58 4D 35 19 2A 16 0F 00 38 4F 35 19 25 07 C5 02 96 00 38 4F 35 19 37 19 00 58 
    //4D 35 19 05 00 00 01 38 F2 7D 0F 16 0F 00 B0 4F 35 19 10 00 38 4F 35 19 19 00 58 4D 35 19 05 00 
    //00 01 38 F2 7D 0F 07 C1 00 2D 01 50 65 1E 11 0F 36 38 D6 6B 0F 19 00 B0 4F 35 19 05 00 08 01 88 
    //68 75 0F 00 48 4E 35 19 0F 36 B0 D6 6B 0F 19 00 B0 4F 35 19 05 00 08 01 88 68 75 0F 00 48 4E 35 
    //19 0F 00 28 50 35 19 2E 30 48 D5 00 00 B0 4F 35 19 07 BB 02 77 00 28 50 35 19 2A 16 1B 90 0C 00 
    //00 00 E0 4C 35 19 00 98 2F 37 0F 19 00 28 50 35 19 05 00 0C 01 10 30 37 0F 19 00 28 50 35 19 05 
    //00 0C 01 88 30 37 0F 16 07 BB 02 FF 00 98 2F 37 0F 21 00 00 00 00 16 0F 36 38 D6 6B 0F 36 48 D5 
    //6B 0F 19 00 28 50 35 19 05 00 18 01 40 3F 7C 0F AC AB 36 38 D6 6B 0F 36 48 D5 6B 0F 19 00 28 50 
    //35 19 05 00 18 01 40 3F 7C 0F 39 3C 36 D0 90 6A 0F 01 E0 47 35 19 16 1E 00 00 7F 43 16 0F 36 B0 
    //D6 6B 0F 36 48 D5 6B 0F 19 00 28 50 35 19 05 00 18 01 40 3F 7C 0F AC AB 36 B0 D6 6B 0F 36 48 D5 
    //6B 0F 19 00 28 50 35 19 05 00 18 01 40 3F 7C 0F 39 3C 36 D0 90 6A 0F 01 E0 47 35 19 16 1E 00 00 
    //7F 43 16 0F 36 38 D6 6B 0F 36 C0 D5 6B 0F 19 00 28 50 35 19 05 00 18 01 40 3F 7C 0F AC AB 36 38 
    //D6 6B 0F 36 C0 D5 6B 0F 19 00 28 50 35 19 05 00 18 01 40 3F 7C 0F 39 3C 36 58 90 6A 0F 01 E0 47 
    //35 19 16 1E 00 00 7F 43 16 0F 36 B0 D6 6B 0F 36 C0 D5 6B 0F 19 00 28 50 35 19 05 00 18 01 40 3F 
    //7C 0F AC AB 36 B0 D6 6B 0F 36 C0 D5 6B 0F 19 00 28 50 35 19 05 00 18 01 40 3F 7C 0F 39 3C 36 58 
    //90 6A 0F 01 E0 47 35 19 16 1E 00 00 7F 43 16 0F 36 38 D6 6B 0F 36 28 D7 6B 0F 19 00 28 50 35 19 
    //05 00 18 01 40 3F 7C 0F AC AB 36 38 D6 6B 0F 36 28 D7 6B 0F 19 00 28 50 35 19 05 00 18 01 40 3F 
    //7C 0F 39 3C 36 E0 8F 6A 0F 01 E0 47 35 19 16 1E 00 00 7F 43 16 0F 36 B0 D6 6B 0F 36 28 D7 6B 0F 
    //19 00 28 50 35 19 05 00 18 01 40 3F 7C 0F AC AB 36 B0 D6 6B 0F 36 28 D7 6B 0F 19 00 28 50 35 19 
    //05 00 18 01 40 3F 7C 0F 39 3C 36 E0 8F 6A 0F 01 E0 47 35 19 16 1E 00 00 7F 43 16 A5 00 38 4F 35 
    //19 16 06 53 00 04 00 58 4D 35 19 06 D0 02 04 2A 04 0B 47 
  }



