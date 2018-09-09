//==============================================================================
//  SBAudioDamper
//==============================================================================

class SBAudioDamper extends SBAudio_Base
    native
    dependsOn()
    Placeable
  ;

  struct ExemptActors {
      var (ExemptActors) name ActorTagName;

  };


  struct DamperInfo {
      var bool Initialized;
      var int FaderID;

  };


  struct AudioTypeDamper {
      var (AudioTypeDamper) byte AudioType;
      var DamperInfo Info;

  };


  struct AudioNameDamper {
      var (AudioNameDamper) name ActorTagName;
      var DamperInfo Info;

  };


  var (Damping) float DampFactor;
  var (Damping) float TimeToDamp;
  var (Damping) array<AudioTypeDamper> AudioTypes;
  var (Damping) array<AudioNameDamper> ActorName;
  var (Damping) array<ExemptActors> Exemptions;
  var transient bool bIsDamping;



