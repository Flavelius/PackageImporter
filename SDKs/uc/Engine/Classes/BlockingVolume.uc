//==============================================================================
//  BlockingVolume
//==============================================================================

class BlockingVolume extends Volume
    native
    dependsOn()
  ;

  var (BlockingVolume) bool bClampFluid;
  var (BlockingVolume) bool bClassBlocker;
  var (BlockingVolume) array<class<Actor>> BlockedClasses;



