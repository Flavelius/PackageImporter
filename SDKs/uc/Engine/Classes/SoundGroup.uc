//==============================================================================
//  SoundGroup
//==============================================================================

class SoundGroup extends Sound
    native
    noexport
    dependsOn()
  ;

  var deprecated string Package;
  var (Sound) native array<Sound> Sounds;
  var const native transient float TotalLikelihood;
  var const transient Sound RenderedSound;



