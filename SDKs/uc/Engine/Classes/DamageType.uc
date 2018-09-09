//==============================================================================
//  DamageType
//==============================================================================

class DamageType extends Actor
    native
    abstract
    dependsOn()
  ;

  var (DamageType) localized string DeathString;
  var (DamageType) localized string FemaleSuicide;
  var (DamageType) localized string MaleSuicide;
  var (DamageType) float ViewFlash;
  var (DamageType) Vector ViewFog;
  var (DamageType) class<Effects> DamageEffect;
  var (DamageType) string DamageWeaponName;
  var (DamageType) bool bArmorStops;
  var (DamageType) bool bInstantHit;
  var (DamageType) bool bFastInstantHit;
  var (DamageType) bool bAlwaysGibs;
  var (DamageType) bool bLocationalHit;
  var (DamageType) bool bAlwaysSevers;
  var (DamageType) bool bSpecial;
  var (DamageType) bool bDetonatesGoop;
  var (DamageType) bool bSkeletize;
  var (DamageType) bool bCauseConvulsions;
  var (DamageType) bool bSuperWeapon;
  var (DamageType) bool bCausesBlood;
  var (DamageType) bool bKUseOwnDeathVel;
  var (DamageType) bool bKUseTearOffMomentum;
  var bool bDelayedDamage;
  var bool bNeverSevers;
  var bool bThrowRagdoll;
  var bool bRagdollBullet;
  var bool bLeaveBodyEffect;
  var bool bExtraMomentumZ;
  var bool bFlaming;
  var bool bRubbery;
  var bool bCausedByWorld;
  var bool bDirectDamage;
  var bool bBulletHit;
  var bool bVehicleHit;
  var (DamageType) float GibModifier;
  var (DamageType) class<Effects> PawnDamageEffect;
  var (DamageType) class<Emitter> PawnDamageEmitter;
  var (DamageType) array<Sound> PawnDamageSounds;
  var (DamageType) class<Effects> LowGoreDamageEffect;
  var (DamageType) class<Emitter> LowGoreDamageEmitter;
  var (DamageType) array<Sound> LowGoreDamageSounds;
  var (DamageType) class<Effects> LowDetailEffect;
  var (DamageType) class<Emitter> LowDetailEmitter;
  var (DamageType) float FlashScale;
  var (DamageType) Vector FlashFog;
  var (DamageType) int DamageDesc;
  var (DamageType) int DamageThreshold;
  var (DamageType) Vector DamageKick;
  var (DamageType) Material DamageOverlayMaterial;
  var (DamageType) Material DeathOverlayMaterial;
  var (DamageType) float DamageOverlayTime;
  var (DamageType) float DeathOverlayTime;
  var (DamageType) float GibPerterbation;
  var (Karma) float KDamageImpulse;
  var (Karma) float KDeathVel;
  var (Karma) float KDeathUpKick;
  var float VehicleDamageScaling;
  var float VehicleMomentumScaling;


  static function string GetWeaponClass() {
    return "";                                                                  //0000 : 04 1F 00 
    //04 1F 00 04 0B 47 
  }


  static function GetHitEffects(out class<xEmitter> HitEffects[4],int VictemHealth);


  static function bool IsOfType(int Description) {
    local int Result;
    Result = Description & default.DamageDesc;                                  //0000 : 0F 00 08 9D 77 0F 9C 00 38 9C 77 0F 02 80 9D 77 0F 16 
    return Result == Description;                                               //0012 : 04 9A 00 08 9D 77 0F 00 38 9C 77 0F 16 
    //0F 00 08 9D 77 0F 9C 00 38 9C 77 0F 02 80 9D 77 0F 16 04 9A 00 08 9D 77 0F 00 38 9C 77 0F 16 04 
    //0B 47 
  }


  static function Sound GetPawnDamageSound() {
    if (default.PawnDamageSounds.Length > 0) {                                  //0000 : 07 1E 00 97 37 02 A8 70 38 0F 25 16 
      return default.PawnDamageSounds[Rand(default.PawnDamageSounds.Length)];   //000C : 04 10 A7 37 02 A8 70 38 0F 16 02 A8 70 38 0F 
    } else {                                                                    //001B : 06 20 00 
      return None;                                                              //001E : 04 2A 
    }
    //07 1E 00 97 37 02 A8 70 38 0F 25 16 04 10 A7 37 02 A8 70 38 0F 16 02 A8 70 38 0F 06 20 00 04 2A 
    //04 0B 47 
  }


  static function class<Emitter> GetPawnDamageEmitter(Vector HitLocation,float Damage,Vector Momentum,Pawn Victim,bool bLowDetail) {
    if (bLowDetail) {                                                           //0000 : 07 22 00 2D 00 C8 72 38 0F 
      if (default.LowDetailEmitter != None) {                                   //0009 : 07 1D 00 77 02 40 73 38 0F 2A 16 
        return default.LowDetailEmitter;                                        //0014 : 04 02 40 73 38 0F 
      } else {                                                                  //001A : 06 1F 00 
        return None;                                                            //001D : 04 2A 
      }
    } else {                                                                    //001F : 06 38 00 
      if (default.PawnDamageEmitter != None) {                                  //0022 : 07 36 00 77 02 C0 73 38 0F 2A 16 
        return default.PawnDamageEmitter;                                       //002D : 04 02 C0 73 38 0F 
      } else {                                                                  //0033 : 06 38 00 
        return None;                                                            //0036 : 04 2A 
      }
    }
    //07 22 00 2D 00 C8 72 38 0F 07 1D 00 77 02 40 73 38 0F 2A 16 04 02 40 73 38 0F 06 1F 00 04 2A 06 
    //38 00 07 36 00 77 02 C0 73 38 0F 2A 16 04 02 C0 73 38 0F 06 38 00 04 2A 04 0B 47 
  }


  static function class<Effects> GetPawnDamageEffect(Vector HitLocation,float Damage,Vector Momentum,Pawn Victim,bool bLowDetail) {
    if (bLowDetail) {                                                           //0000 : 07 2F 00 2D 00 E8 15 78 0F 
      if (default.LowDetailEffect != None) {                                    //0009 : 07 1D 00 77 02 60 16 78 0F 2A 16 
        return default.LowDetailEffect;                                         //0014 : 04 02 60 16 78 0F 
      } else {                                                                  //001A : 06 2C 00 
        return Victim.BloodEffect;                                              //001D : 04 19 00 E0 16 78 0F 05 00 04 01 C8 C1 76 0F 
      }
    } else {                                                                    //002C : 06 52 00 
      if (default.PawnDamageEffect != None) {                                   //002F : 07 43 00 77 02 58 17 78 0F 2A 16 
        return default.PawnDamageEffect;                                        //003A : 04 02 58 17 78 0F 
      } else {                                                                  //0040 : 06 52 00 
        return Victim.BloodEffect;                                              //0043 : 04 19 00 E0 16 78 0F 05 00 04 01 C8 C1 76 0F 
      }
    }
    //07 2F 00 2D 00 E8 15 78 0F 07 1D 00 77 02 60 16 78 0F 2A 16 04 02 60 16 78 0F 06 2C 00 04 19 00 
    //E0 16 78 0F 05 00 04 01 C8 C1 76 0F 06 52 00 07 43 00 77 02 58 17 78 0F 2A 16 04 02 58 17 78 0F 
    //06 52 00 04 19 00 E0 16 78 0F 05 00 04 01 C8 C1 76 0F 04 0B 47 
  }


  static function ScoreKill(Controller Killer,Controller Killed) {
    IncrementKills(Killer);                                                     //0000 : 1B 8A 2B 00 00 00 F8 19 78 0F 16 
    //1B 8A 2B 00 00 00 F8 19 78 0F 16 04 0B 47 
  }


  static function IncrementKills(Controller Killer);



