//==============================================================================
//  PathConfigurationActor
//==============================================================================

class PathConfigurationActor extends Actor
    native
    dependsOn()
    Placeable
  ;

  var (PathConfigurationActor) bool mUseAccessmap;
  var (PathConfigurationActor) float mNoiseRatio;
  var (PathConfigurationActor) float mNoiseFactor;
  var (PathConfigurationActor) float mTrackerSpeed;
  var (PathConfigurationActor) int mLookAheadCount;
  var (PathConfigurationActor) int mMaxDepth;
  var (PathConfigurationActor) float mMinMoveDistance;
  var (PathConfigurationActor) float mReplanThreshold;
  var (PathConfigurationActor) float mMaxFailureDistance;
  var (PathConfigurationActor) float mRandomizationFactor;
  var (PathConfigurationActor) float mRandomDistance;
  var (PathConfigurationActor) float mFacingDistance;



