//==============================================================================
//  Decoration
//==============================================================================

class Decoration extends Actor
    native
    abstract
    dependsOn(Fragment)
    Placeable
  ;

  var (Decoration) class<Actor> EffectWhenDestroyed;
  var (Decoration) bool bPushable;
  var (Decoration) bool bDamageable;
  var bool bPushSoundPlaying;
  var bool bSplash;
  var (Decoration) Sound PushSound;
  var (Decoration) Sound EndPushSound;
  var const int numLandings;
  var (Decoration) int NumFrags;
  var (Decoration) Texture FragSkin;
  var (Decoration) class<Fragment> FragType;
  var Vector FragMomentum;
  var (Decoration) int Health;
  var (Decoration) float SplashTime;
  var const NavigationPoint LastAnchor;
  var float LastValidAnchorTime;


  function Bump(Actor Other) {
    local float speed;
    local float OldZ;
    if (bPushable && Pawn(Other) != None
      && Other.Mass > 40) {            //0000 : 07 F8 00 82 82 2D 01 C8 32 38 0F 18 0E 00 77 2E 50 31 D4 00 00 C8 30 38 0F 2A 16 16 18 15 00 B1 19 00 C8 30 38 0F 05 00 04 01 A0 E6 6E 0F 39 3F 2C 28 16 16 
      OldZ = Velocity.Z;                                                        //0034 : 0F 00 40 33 38 0F 36 38 C5 69 0F 01 A0 95 6C 0F 
      speed = VSize(Other.Velocity);                                            //0044 : 0F 00 58 CA 3B 19 E1 19 00 C8 30 38 0F 05 00 0C 01 A0 95 6C 0F 16 
      Velocity = Other.Velocity * FMin(120.00000000,20.00000000 + speed) / speed;//005A : 0F 01 A0 95 6C 0F D6 D4 19 00 C8 30 38 0F 05 00 0C 01 A0 95 6C 0F F4 1E 00 00 F0 42 AE 1E 00 00 A0 41 00 58 CA 3B 19 16 16 16 00 58 CA 3B 19 16 
      if (Physics == 0) {                                                       //008A : 07 CA 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 00 16 
        Velocity.Z = 25.00000000;                                               //009A : 0F 36 38 C5 69 0F 01 A0 95 6C 0F 1E 00 00 C8 41 
        if (!bPushSoundPlaying) {                                               //00AA : 07 C7 00 81 2D 01 D0 CA 3B 19 16 
          PlaySound(PushSound,1);                                               //00B5 : 61 08 01 48 CB 3B 19 24 01 16 
          bPushSoundPlaying = True;                                             //00BF : 14 2D 01 D0 CA 3B 19 27 
        }
      } else {                                                                  //00C7 : 06 DA 00 
        Velocity.Z = OldZ;                                                      //00CA : 0F 36 38 C5 69 0F 01 A0 95 6C 0F 00 40 33 38 0F 
      }
      SetPhysics(2);                                                            //00DA : 6F 82 24 02 16 
      SetTimer(0.30000001,False);                                               //00DF : 61 18 1E 9A 99 99 3E 28 16 
      Instigator = Pawn(Other);                                                 //00E8 : 0F 01 B8 80 6C 0F 2E 50 31 D4 00 00 C8 30 38 0F 
    }
    //07 F8 00 82 82 2D 01 C8 32 38 0F 18 0E 00 77 2E 50 31 D4 00 00 C8 30 38 0F 2A 16 16 18 15 00 B1 
    //19 00 C8 30 38 0F 05 00 04 01 A0 E6 6E 0F 39 3F 2C 28 16 16 0F 00 40 33 38 0F 36 38 C5 69 0F 01 
    //A0 95 6C 0F 0F 00 58 CA 3B 19 E1 19 00 C8 30 38 0F 05 00 0C 01 A0 95 6C 0F 16 0F 01 A0 95 6C 0F 
    //D6 D4 19 00 C8 30 38 0F 05 00 0C 01 A0 95 6C 0F F4 1E 00 00 F0 42 AE 1E 00 00 A0 41 00 58 CA 3B 
    //19 16 16 16 00 58 CA 3B 19 16 07 CA 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 00 16 0F 36 38 C5 69 0F 
    //01 A0 95 6C 0F 1E 00 00 C8 41 07 C7 00 81 2D 01 D0 CA 3B 19 16 61 08 01 48 CB 3B 19 24 01 16 14 
    //2D 01 D0 CA 3B 19 27 06 DA 00 0F 36 38 C5 69 0F 01 A0 95 6C 0F 00 40 33 38 0F 6F 82 24 02 16 61 
    //18 1E 9A 99 99 3E 28 16 0F 01 B8 80 6C 0F 2E 50 31 D4 00 00 C8 30 38 0F 04 0B 47 
  }


  function Timer() {
    PlaySound(EndPushSound,1);                                                  //0000 : 61 08 01 B8 CC 3B 19 24 01 16 
    bPushSoundPlaying = False;                                                  //000A : 14 2D 01 D0 CA 3B 19 28 
    //61 08 01 B8 CC 3B 19 24 01 16 14 2D 01 D0 CA 3B 19 28 04 0B 47 
  }


  simulated function Destroyed() {
    local int i;
    local Fragment s;
    local float BaseSize;
    if (SBRole == 1) {                                                          //0000 : 07 30 00 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 
      TriggerEvent(Event,self,None);                                            //0010 : 1C F8 B1 34 0F 01 38 9F 6C 0F 17 2A 16 
      if (bPushSoundPlaying) {                                                  //001D : 07 30 00 2D 01 D0 CA 3B 19 
        PlaySound(EndPushSound,1);                                              //0026 : 61 08 01 B8 CC 3B 19 24 01 16 
      }
    }
    if (Level.NetMode != 1 && !PhysicsVolume.bDestructive
      && NumFrags > 0
      && FragType != None) {//0030 : 07 3C 01 82 82 82 9B 39 3A 19 01 D8 7E 6C 0F 05 00 01 01 50 7F 6C 0F 39 3A 24 01 16 18 12 00 81 19 01 38 94 6C 0F 06 00 04 2D 01 98 AE 74 0F 16 16 18 09 00 97 01 40 D0 3B 19 25 16 16 18 09 00 77 01 B8 D0 3B 19 2A 16 16 
      BaseSize = 0.80000001 * Sqrt(CollisionRadius * CollisionHeight) / NumFrags;//0079 : 0F 00 38 D1 3B 19 AC AB 1E CD CC 4C 3F C1 AB 01 C8 89 6C 0F 01 40 8A 6C 0F 16 16 16 39 3F 01 40 D0 3B 19 16 
      i = 0;                                                                    //009D : 0F 00 E0 CD 3B 19 25 
      while (i < NumFrags) {                                                    //00A4 : 07 3C 01 96 00 E0 CD 3B 19 01 40 D0 3B 19 16 
        s = Spawn(FragType,Owner,,Location + CollisionRadius * VRand());        //00B3 : 0F 00 B0 D1 3B 19 61 16 01 B8 D0 3B 19 01 B0 9F 6C 0F 0B D7 01 30 81 6C 0F D5 01 C8 89 6C 0F FC 16 16 16 16 
        s.CalcVelocity(FragMomentum);                                           //00D7 : 19 00 B0 D1 3B 19 0B 00 00 1B CB 2B 00 00 01 28 D2 3B 19 16 
        if (FragSkin != None) {                                                 //00EB : 07 0C 01 77 01 A0 D2 3B 19 2A 16 
          s.Skins[0] = FragSkin;                                                //00F6 : 0F 10 25 19 00 B0 D1 3B 19 05 00 00 01 50 9A 6C 0F 01 A0 D2 3B 19 
        }
        s.SetDrawScale(BaseSize * (0.50000000 + 0.69999999 * FRand()));         //010C : 19 00 B0 D1 3B 19 1D 00 00 1C B8 97 6B 0F AB 00 38 D1 3B 19 AE 1E 00 00 00 3F AB 1E 33 33 33 3F C3 16 16 16 16 16 
        i++;                                                                    //0132 : A5 00 E0 CD 3B 19 16 
      }
    }
    Super.Destroyed();                                                          //013C : 1C 30 8A 6D 0F 16 
    //07 30 00 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 1C F8 B1 34 0F 01 38 9F 6C 0F 17 2A 16 07 30 00 
    //2D 01 D0 CA 3B 19 61 08 01 B8 CC 3B 19 24 01 16 07 3C 01 82 82 82 9B 39 3A 19 01 D8 7E 6C 0F 05 
    //00 01 01 50 7F 6C 0F 39 3A 24 01 16 18 12 00 81 19 01 38 94 6C 0F 06 00 04 2D 01 98 AE 74 0F 16 
    //16 18 09 00 97 01 40 D0 3B 19 25 16 16 18 09 00 77 01 B8 D0 3B 19 2A 16 16 0F 00 38 D1 3B 19 AC 
    //AB 1E CD CC 4C 3F C1 AB 01 C8 89 6C 0F 01 40 8A 6C 0F 16 16 16 39 3F 01 40 D0 3B 19 16 0F 00 E0 
    //CD 3B 19 25 07 3C 01 96 00 E0 CD 3B 19 01 40 D0 3B 19 16 0F 00 B0 D1 3B 19 61 16 01 B8 D0 3B 19 
    //01 B0 9F 6C 0F 0B D7 01 30 81 6C 0F D5 01 C8 89 6C 0F FC 16 16 16 16 19 00 B0 D1 3B 19 0B 00 00 
    //1B CB 2B 00 00 01 28 D2 3B 19 16 07 0C 01 77 01 A0 D2 3B 19 2A 16 0F 10 25 19 00 B0 D1 3B 19 05 
    //00 00 01 50 9A 6C 0F 01 A0 D2 3B 19 19 00 B0 D1 3B 19 1D 00 00 1C B8 97 6B 0F AB 00 38 D1 3B 19 
    //AE 1E 00 00 00 3F AB 1E 33 33 33 3F C3 16 16 16 16 16 A5 00 E0 CD 3B 19 16 06 A4 00 1C 30 8A 6D 
    //0F 16 04 0B 47 
  }


  singular function BaseChange() {
    if (Velocity.Z < -500) {                                                    //0000 : 07 4F 00 B0 36 38 C5 69 0F 01 A0 95 6C 0F 39 3F 1D 0C FE FF FF 16 
      TakeDamage(1 - Velocity.Z / 30,Instigator,Location,vect(0.000000, 0.000000, 0.000000),Class'Crushed');//0016 : 1B 5C 0C 00 00 39 44 AF 39 3F 26 AC 36 38 C5 69 0F 01 A0 95 6C 0F 39 3F 2C 1E 16 16 01 B8 80 6C 0F 01 30 81 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 20 18 FD 78 0F 16 
    }
    if (Base == None) {                                                         //004F : 07 8A 00 72 01 B0 94 6C 0F 2A 16 
      if (!bInterpolating && bPushable && Physics == 0) {                       //005A : 07 87 00 82 82 81 2D 01 D8 E8 35 0F 16 18 07 00 2D 01 C8 32 38 0F 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 00 16 16 
        SetPhysics(2);                                                          //0082 : 6F 82 24 02 16 
      }
    } else {                                                                    //0087 : 06 0E 02 
      if (Pawn(Base) != None) {                                                 //008A : 07 40 01 77 2E 50 31 D4 00 01 B0 94 6C 0F 2A 16 
        Base.TakeDamage((1 - Velocity.Z / 400) * Mass / Base.Mass,Instigator,Location,0.50000000 * Velocity,Class'Crushed');//009A : 19 01 B0 94 6C 0F 56 00 00 1B 5C 0C 00 00 39 44 AC AB 39 3F 39 44 AF 39 3F 26 AC 36 38 C5 69 0F 01 A0 95 6C 0F 39 3F 1D 90 01 00 00 16 16 01 A0 E6 6E 0F 16 19 01 B0 94 6C 0F 05 00 04 01 A0 E6 6E 0F 16 01 B8 80 6C 0F 01 30 81 6C 0F D5 1E 00 00 00 3F 01 A0 95 6C 0F 16 20 18 FD 78 0F 16 
        Velocity.Z = 100.00000000;                                              //00F9 : 0F 36 38 C5 69 0F 01 A0 95 6C 0F 1E 00 00 C8 42 
        if (FRand() < 0.50000000) {                                             //0109 : 07 28 01 B0 C3 16 1E 00 00 00 3F 16 
          Velocity.X += 70;                                                     //0115 : B8 36 48 C4 69 0F 01 A0 95 6C 0F 39 3F 2C 46 16 
        } else {                                                                //0125 : 06 38 01 
          Velocity.Y += 70;                                                     //0128 : B8 36 C0 C4 69 0F 01 A0 95 6C 0F 39 3F 2C 46 16 
        }
        SetPhysics(2);                                                          //0138 : 6F 82 24 02 16 
      } else {                                                                  //013D : 06 0E 02 
        if (Decoration(Base) != None && Velocity.Z < -500) {                    //0140 : 07 07 02 82 77 2E D8 EA C1 00 01 B0 94 6C 0F 2A 16 18 14 00 B0 36 38 C5 69 0F 01 A0 95 6C 0F 39 3F 1D 0C FE FF FF 16 16 
          Base.TakeDamage(1 - Mass / Base.Mass * Velocity.Z / 30,Instigator,Location,0.20000000 * Velocity,Class'Crushed');//0168 : 19 01 B0 94 6C 0F 4F 00 00 1B 5C 0C 00 00 39 44 AF 39 3F 26 AC AB AC 01 A0 E6 6E 0F 19 01 B0 94 6C 0F 05 00 04 01 A0 E6 6E 0F 16 36 38 C5 69 0F 01 A0 95 6C 0F 16 39 3F 2C 1E 16 16 01 B8 80 6C 0F 01 30 81 6C 0F D5 1E CD CC 4C 3E 01 A0 95 6C 0F 16 20 18 FD 78 0F 16 
          Velocity.Z = 100.00000000;                                            //01C0 : 0F 36 38 C5 69 0F 01 A0 95 6C 0F 1E 00 00 C8 42 
          if (FRand() < 0.50000000) {                                           //01D0 : 07 EF 01 B0 C3 16 1E 00 00 00 3F 16 
            Velocity.X += 70;                                                   //01DC : B8 36 48 C4 69 0F 01 A0 95 6C 0F 39 3F 2C 46 16 
          } else {                                                              //01EC : 06 FF 01 
            Velocity.Y += 70;                                                   //01EF : B8 36 C0 C4 69 0F 01 A0 95 6C 0F 39 3F 2C 46 16 
          }
          SetPhysics(2);                                                        //01FF : 6F 82 24 02 16 
        } else {                                                                //0204 : 06 0E 02 
          Instigator = None;                                                    //0207 : 0F 01 B8 80 6C 0F 2A 
        }
      }
    }
    //07 4F 00 B0 36 38 C5 69 0F 01 A0 95 6C 0F 39 3F 1D 0C FE FF FF 16 1B 5C 0C 00 00 39 44 AF 39 3F 
    //26 AC 36 38 C5 69 0F 01 A0 95 6C 0F 39 3F 2C 1E 16 16 01 B8 80 6C 0F 01 30 81 6C 0F 23 00 00 00 
    //00 00 00 00 00 00 00 00 00 20 18 FD 78 0F 16 07 8A 00 72 01 B0 94 6C 0F 2A 16 07 87 00 82 82 81 
    //2D 01 D8 E8 35 0F 16 18 07 00 2D 01 C8 32 38 0F 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 00 
    //16 16 6F 82 24 02 16 06 0E 02 07 40 01 77 2E 50 31 D4 00 01 B0 94 6C 0F 2A 16 19 01 B0 94 6C 0F 
    //56 00 00 1B 5C 0C 00 00 39 44 AC AB 39 3F 39 44 AF 39 3F 26 AC 36 38 C5 69 0F 01 A0 95 6C 0F 39 
    //3F 1D 90 01 00 00 16 16 01 A0 E6 6E 0F 16 19 01 B0 94 6C 0F 05 00 04 01 A0 E6 6E 0F 16 01 B8 80 
    //6C 0F 01 30 81 6C 0F D5 1E 00 00 00 3F 01 A0 95 6C 0F 16 20 18 FD 78 0F 16 0F 36 38 C5 69 0F 01 
    //A0 95 6C 0F 1E 00 00 C8 42 07 28 01 B0 C3 16 1E 00 00 00 3F 16 B8 36 48 C4 69 0F 01 A0 95 6C 0F 
    //39 3F 2C 46 16 06 38 01 B8 36 C0 C4 69 0F 01 A0 95 6C 0F 39 3F 2C 46 16 6F 82 24 02 16 06 0E 02 
    //07 07 02 82 77 2E D8 EA C1 00 01 B0 94 6C 0F 2A 16 18 14 00 B0 36 38 C5 69 0F 01 A0 95 6C 0F 39 
    //3F 1D 0C FE FF FF 16 16 19 01 B0 94 6C 0F 4F 00 00 1B 5C 0C 00 00 39 44 AF 39 3F 26 AC AB AC 01 
    //A0 E6 6E 0F 19 01 B0 94 6C 0F 05 00 04 01 A0 E6 6E 0F 16 36 38 C5 69 0F 01 A0 95 6C 0F 16 39 3F 
    //2C 1E 16 16 01 B8 80 6C 0F 01 30 81 6C 0F D5 1E CD CC 4C 3E 01 A0 95 6C 0F 16 20 18 FD 78 0F 16 
    //0F 36 38 C5 69 0F 01 A0 95 6C 0F 1E 00 00 C8 42 07 EF 01 B0 C3 16 1E 00 00 00 3F 16 B8 36 48 C4 
    //69 0F 01 A0 95 6C 0F 39 3F 2C 46 16 06 FF 01 B8 36 C0 C4 69 0F 01 A0 95 6C 0F 39 3F 2C 46 16 6F 
    //82 24 02 16 06 0E 02 0F 01 B8 80 6C 0F 2A 04 0B 47 
  }


  function Trigger(Actor Other,Pawn EventInstigator) {
    Instigator = EventInstigator;                                               //0000 : 0F 01 B8 80 6C 0F 00 B0 DD 3B 19 
    TakeDamage(1000,Instigator,Location,vect(0.000000, 0.000000, 1.000000) * 900,Class'Crushed');//000B : 1B 5C 0C 00 00 1D E8 03 00 00 01 B8 80 6C 0F 01 30 81 6C 0F D4 23 00 00 00 00 00 00 00 00 00 00 80 3F 39 3F 1D 84 03 00 00 16 20 18 FD 78 0F 16 
    //0F 01 B8 80 6C 0F 00 B0 DD 3B 19 1B 5C 0C 00 00 1D E8 03 00 00 01 B8 80 6C 0F 01 30 81 6C 0F D4 
    //23 00 00 00 00 00 00 00 00 00 00 80 3F 39 3F 1D 84 03 00 00 16 20 18 FD 78 0F 16 04 0B 47 
  }


  singular function PhysicsVolumeChange(PhysicsVolume NewVolume) {
    if (NewVolume.bWaterVolume) {                                               //0000 : 07 8D 00 19 00 D8 DE 3B 19 06 00 04 2D 01 70 04 6F 0F 
      if (bSplash && !PhysicsVolume.bWaterVolume
        && Mass <= Buoyancy
        && (Abs(Velocity.Z) < 100 || Mass == 0)
        && FRand() < 0.05000000
        && !PlayerCanSeeMe()) {//0012 : 07 8D 00 82 82 82 82 82 2D 01 50 DF 3B 19 18 12 00 81 19 01 38 94 6C 0F 06 00 04 2D 01 70 04 6F 0F 16 16 18 0D 00 B2 01 A0 E6 6E 0F 01 80 E7 6E 0F 16 16 18 22 00 84 B0 BA 36 38 C5 69 0F 01 A0 95 6C 0F 16 39 3F 2C 64 16 18 0B 00 B4 01 A0 E6 6E 0F 39 3F 25 16 16 16 18 0A 00 B0 C3 16 1E CD CC 4C 3D 16 16 18 06 00 81 62 14 16 16 16 
        bSplash = False;                                                        //0080 : 14 2D 01 50 DF 3B 19 28 
        SetPhysics(0);                                                          //0088 : 6F 82 24 00 16 
      }
    }
    if (PhysicsVolume.bWaterVolume && Buoyancy > Mass) {                        //008D : 07 03 01 82 19 01 38 94 6C 0F 06 00 04 2D 01 70 04 6F 0F 18 0D 00 B1 01 80 E7 6E 0F 01 A0 E6 6E 0F 16 16 
      if (Buoyancy > 1.10000002 * Mass) {                                       //00B0 : 07 DB 00 B1 01 80 E7 6E 0F AB 1E CD CC 8C 3F 01 A0 E6 6E 0F 16 16 
        Buoyancy = 0.94999999 * Buoyancy;                                       //00C6 : 0F 01 80 E7 6E 0F AB 1E 33 33 73 3F 01 80 E7 6E 0F 16 
      } else {                                                                  //00D8 : 06 03 01 
        if (Buoyancy > 1.02999997 * Mass) {                                     //00DB : 07 03 01 B1 01 80 E7 6E 0F AB 1E 0A D7 83 3F 01 A0 E6 6E 0F 16 16 
          Buoyancy = 0.99000001 * Buoyancy;                                     //00F1 : 0F 01 80 E7 6E 0F AB 1E A4 70 7D 3F 01 80 E7 6E 0F 16 
        }
      }
    }
    //07 8D 00 19 00 D8 DE 3B 19 06 00 04 2D 01 70 04 6F 0F 07 8D 00 82 82 82 82 82 2D 01 50 DF 3B 19 
    //18 12 00 81 19 01 38 94 6C 0F 06 00 04 2D 01 70 04 6F 0F 16 16 18 0D 00 B2 01 A0 E6 6E 0F 01 80 
    //E7 6E 0F 16 16 18 22 00 84 B0 BA 36 38 C5 69 0F 01 A0 95 6C 0F 16 39 3F 2C 64 16 18 0B 00 B4 01 
    //A0 E6 6E 0F 39 3F 25 16 16 16 18 0A 00 B0 C3 16 1E CD CC 4C 3D 16 16 18 06 00 81 62 14 16 16 16 
    //14 2D 01 50 DF 3B 19 28 6F 82 24 00 16 07 03 01 82 19 01 38 94 6C 0F 06 00 04 2D 01 70 04 6F 0F 
    //18 0D 00 B1 01 80 E7 6E 0F 01 A0 E6 6E 0F 16 16 07 DB 00 B1 01 80 E7 6E 0F AB 1E CD CC 8C 3F 01 
    //A0 E6 6E 0F 16 16 0F 01 80 E7 6E 0F AB 1E 33 33 73 3F 01 80 E7 6E 0F 16 06 03 01 07 03 01 B1 01 
    //80 E7 6E 0F AB 1E 0A D7 83 3F 01 A0 E6 6E 0F 16 16 0F 01 80 E7 6E 0F AB 1E A4 70 7D 3F 01 80 E7 
    //6E 0F 16 04 0B 47 
  }


  function TakeDamage(int NDamage,Pawn instigatedBy,Vector HitLocation,Vector Momentum,class<DamageType> DamageType) {
    Instigator = instigatedBy;                                                  //0000 : 0F 01 B8 80 6C 0F 00 D8 E1 3B 19 
    if (!bDamageable || Health < 0) {                                           //000B : 07 25 00 84 81 2D 01 50 E2 3B 19 16 18 09 00 96 01 C8 E2 3B 19 25 16 16 
      return;                                                                   //0023 : 04 0B 
    }
    if (Instigator != None) {                                                   //0025 : 07 38 00 77 01 B8 80 6C 0F 2A 16 
      MakeNoise(1.00000000);                                                    //0030 : 62 00 1E 00 00 80 3F 16 
    }
    Health -= NDamage;                                                          //0038 : A2 01 C8 E2 3B 19 00 78 E0 3B 19 16 
    FragMomentum = Momentum;                                                    //0044 : 0F 01 28 D2 3B 19 00 40 E3 3B 19 
    if (Health < 0) {                                                           //004F : 07 60 00 96 01 C8 E2 3B 19 25 16 
      Destroy();                                                                //005A : 61 17 16 
    } else {                                                                    //005D : 06 87 00 
      SetPhysics(2);                                                            //0060 : 6F 82 24 02 16 
      Momentum.Z = 1000.00000000;                                               //0065 : 0F 36 38 C5 69 0F 00 40 E3 3B 19 1E 00 00 7A 44 
      Velocity = Momentum / Mass;                                               //0075 : 0F 01 A0 95 6C 0F D6 00 40 E3 3B 19 01 A0 E6 6E 0F 16 
    }
    //0F 01 B8 80 6C 0F 00 D8 E1 3B 19 07 25 00 84 81 2D 01 50 E2 3B 19 16 18 09 00 96 01 C8 E2 3B 19 
    //25 16 16 04 0B 07 38 00 77 01 B8 80 6C 0F 2A 16 62 00 1E 00 00 80 3F 16 A2 01 C8 E2 3B 19 00 78 
    //E0 3B 19 16 0F 01 28 D2 3B 19 00 40 E3 3B 19 07 60 00 96 01 C8 E2 3B 19 25 16 61 17 16 06 87 00 
    //6F 82 24 02 16 0F 36 38 C5 69 0F 00 40 E3 3B 19 1E 00 00 7A 44 0F 01 A0 95 6C 0F D6 00 40 E3 3B 
    //19 01 A0 E6 6E 0F 16 04 0B 47 
  }


  function HitWall(Vector HitNormal,Actor Wall) {
    Landed(HitNormal);                                                          //0000 : 1B 37 01 00 00 00 60 E5 3B 19 16 
    //1B 37 01 00 00 00 60 E5 3B 19 16 04 0B 47 
  }


  function Landed(Vector HitNormal) {
    local Rotator newRot;
    if (Velocity.Z < -500) {                                                    //0000 : 07 40 00 B0 36 38 C5 69 0F 01 A0 95 6C 0F 39 3F 1D 0C FE FF FF 16 
      TakeDamage(100,Pawn(Owner),HitNormal,HitNormal * 10000,Class'Crushed');   //0016 : 1B 5C 0C 00 00 2C 64 2E 50 31 D4 00 01 B0 9F 6C 0F 00 40 E7 3B 19 D4 00 40 E7 3B 19 39 3F 1D 10 27 00 00 16 20 18 FD 78 0F 16 
    }
    Velocity = vect(0.000000, 0.000000, 0.000000);                              //0040 : 0F 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 
    newRot = Rotation;                                                          //0053 : 0F 00 98 E8 3B 19 01 00 84 6C 0F 
    newRot.Pitch = 0;                                                           //005E : 0F 36 A8 BE 69 0F 00 98 E8 3B 19 25 
    newRot.Roll = 0;                                                            //006A : 0F 36 98 BF 69 0F 00 98 E8 3B 19 25 
    SetRotation(newRot);                                                        //0076 : 1C 70 01 6E 0F 00 98 E8 3B 19 16 
    //07 40 00 B0 36 38 C5 69 0F 01 A0 95 6C 0F 39 3F 1D 0C FE FF FF 16 1B 5C 0C 00 00 2C 64 2E 50 31 
    //D4 00 01 B0 9F 6C 0F 00 40 E7 3B 19 D4 00 40 E7 3B 19 39 3F 1D 10 27 00 00 16 20 18 FD 78 0F 16 
    //0F 01 A0 95 6C 0F 23 00 00 00 00 00 00 00 00 00 00 00 00 0F 00 98 E8 3B 19 01 00 84 6C 0F 0F 36 
    //A8 BE 69 0F 00 98 E8 3B 19 25 0F 36 98 BF 69 0F 00 98 E8 3B 19 25 1C 70 01 6E 0F 00 98 E8 3B 19 
    //16 04 0B 47 
  }


  function Drop(Vector newVel);


  function bool CanSplash() {
    if (Level.TimeSeconds - SplashTime > 0.25000000
      && Physics == 2
      && Abs(Velocity.Z) > 100) {//0000 : 07 5E 00 82 82 B1 AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 40 EC 3B 19 16 1E 00 00 80 3E 16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 02 16 16 18 13 00 B1 BA 36 38 C5 69 0F 01 A0 95 6C 0F 16 39 3F 2C 64 16 16 
      SplashTime = Level.TimeSeconds;                                           //0048 : 0F 01 40 EC 3B 19 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
      return True;                                                              //005C : 04 27 
    }
    return False;                                                               //005E : 04 28 
    //07 5E 00 82 82 B1 AF 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 01 40 EC 3B 19 16 1E 00 00 80 3E 
    //16 18 0E 00 9A 39 3A 01 C0 93 6C 0F 39 3A 24 02 16 16 18 13 00 B1 BA 36 38 C5 69 0F 01 A0 95 6C 
    //0F 16 39 3F 2C 64 16 16 0F 01 40 EC 3B 19 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 04 27 04 28 
    //04 0B 47 
  }


  event NotReachableBy(Pawn P);



