//==============================================================================
//  SurfaceSoundGroup
//==============================================================================

class SurfaceSoundGroup extends Sound
    native
    noexport
    dependsOn()
  ;

  struct SurfaceSoundSubGroup {
      var (SurfaceSoundSubGroup) byte MaterialSurfaceType;
      var (SurfaceSoundSubGroup) array<Sound> Sounds;

  };


  var (Sound) array<SurfaceSoundSubGroup> SubGroups;
  var const transient Sound RenderedSound;



