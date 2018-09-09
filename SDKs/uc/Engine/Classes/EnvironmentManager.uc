//==============================================================================
//  EnvironmentManager
//==============================================================================

class EnvironmentManager extends Actor
    native
    dependsOn()
    Transient
  ;

  var private array<ZoneInfo> mZoneInfos;
  var private array<Light> mLights;
  var private array<ParticleEmitter> mEmitters;
  var private array<EnvironmentEffect> mEffects;
  var private EnvironmentSettings mCurrentSettings;
  var private Color mDefaultColor;


  final native function SetDefaultHUDColor(Color aColor);


  event PostBeginPlay() {
    if (IsServer() || IsEditor()) {                                             //0000 : 07 16 00 84 1B FF 0B 00 00 16 18 07 00 1B 63 0C 00 00 16 16 
      return;                                                                   //0014 : 04 0B 
    }
    SetDrawType(0);                                                             //0016 : 1C 48 93 6B 0F 24 00 16 
    BuildListOfEnvironmentActors();                                             //001E : 1C 80 9D 7C 0F 16 
    //07 16 00 84 1B FF 0B 00 00 16 18 07 00 1B 63 0C 00 00 16 16 04 0B 1C 48 93 6B 0F 24 00 16 1C 80 
    //9D 7C 0F 16 04 0B 47 
  }


  final native function AddEffect(EnvironmentEffect effect);


  final native function BuildListOfEnvironmentActors();



