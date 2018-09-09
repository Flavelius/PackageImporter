//==============================================================================
//  xWeatherEffect
//==============================================================================

class xWeatherEffect extends Actor
    native
    exportstructs
    dependsOn()
    Placeable
  ;

  enum EWeatherType {
    WT_Rain ,
    WT_Snow ,
    WT_Dust 
  };

  struct WeatherPcl {
      var Vector pos;
      var Vector Vel;
      var float Life;
      var float Size;
      var float HitTime;
      var float InvLifeSpan;
      var float DistAtten;
      var byte frame;
      var byte Dummy1;
      var byte Visible;
      var byte Dummy2;

  };


  var (xWeatherEffect) byte WeatherType;
  var (xWeatherEffect) int numParticles;
  var transient int numActive;
  var transient Box Box;
  var transient Vector eyePos;
  var transient Vector eyeDir;
  var transient Vector spawnOrigin;
  var transient Vector eyeMoveVec;
  var transient float eyeVel;
  var (xWeatherEffect) float deviation;
  var (xWeatherEffect) float maxPclEyeDist;
  var (xWeatherEffect) float numCols;
  var (xWeatherEffect) float numRows;
  var transient float numFrames;
  var transient float texU;
  var transient float texV;
  var transient bool noReference;
  var Vector spawnVecU;
  var Vector spawnVecV;
  var (xWeatherEffect) Vector spawnVel;
  var (xWeatherEffect) RangeVector Position;
  var (xWeatherEffect) Range speed;
  var (xWeatherEffect) Range Life;
  var (xWeatherEffect) Range Size;
  var (xWeatherEffect) Range EyeSizeClamp;
  var (Force) bool bForceAffected;
  var transient array<WeatherPcl> pcl;
  var transient array<Volume> pclBlockers;



