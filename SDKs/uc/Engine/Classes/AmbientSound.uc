//==============================================================================
//  AmbientSound
//==============================================================================

class AmbientSound extends Keypoint
    native
    exportstructs
    dependsOn()
    NotPlaceable
    Config(System)
  ;

  struct SoundEmitter {
      var (SoundEmitter) float EmitInterval;
      var (SoundEmitter) float EmitVariance;
      var transient float EmitTime;
      var (SoundEmitter) Sound EmitSound;

  };


  var (Sound) array<SoundEmitter> SoundEmitters;
  var globalconfig float AmbientVolume;



