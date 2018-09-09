//==============================================================================
//  DecorationList
//==============================================================================

class DecorationList extends Keypoint
    native
    dependsOn()
  ;

  struct DecorationType {
      var (DecorationType) StaticMesh StaticMesh;
      var (DecorationType) Range Count;
      var (DecorationType) Range DrawScale;
      var (DecorationType) int bAlign;
      var (DecorationType) int bRandomPitch;
      var (DecorationType) int bRandomYaw;
      var (DecorationType) int bRandomRoll;

  };


  var (List) array<DecorationType> Decorations;



