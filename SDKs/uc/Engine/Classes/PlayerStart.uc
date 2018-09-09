//==============================================================================
//  PlayerStart
//==============================================================================

class PlayerStart extends SmallNavigationPoint
    native
    dependsOn()
    Placeable
  ;

  var (PlayerStart) byte TeamNumber;
  var (PlayerStart) bool bSinglePlayerStart;
  var (PlayerStart) bool bCoopStart;
  var (PlayerStart) bool bEnabled;
  var (PlayerStart) bool bPrimaryStart;
  var (PlayerStart) string NavigationTag;



