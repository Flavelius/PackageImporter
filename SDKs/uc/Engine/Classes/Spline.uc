//==============================================================================
//  Spline
//==============================================================================

class Spline extends Object
    native
    dependsOn()
  ;

  const mMaxTimes = 5;
  var Vector SplineA;
  var Vector SplineB;
  var Vector SplineC;
  var Vector SplineD;
  var Rotator SplineE;
  var Rotator SplineF;
  var Rotator SplineG;
  var Rotator SplineH;
  var float mStartT;
  var float mEndT;
  var bool mbInit;
  var float mTime;
  var float maDeltaTimes[5];
  var int mIndex;
  var float mTotalTime;
  var bool mbRotatorSpline;
  var int mCnt;


  final native function bool NextSplineRot(float dt,out Rotator D,out Rotator V,out Rotator A,out float outdt,optional bool bSmoothDt,optional bool bAccumDeltas);


  final native function bool NextSplinePos(float dt,out Vector D,out Vector V,out Vector A,out float outdt,optional bool bSmoothDt,optional bool bAccumDeltas);


  final native function bool InitSplineRot(float t0,Rotator d0,Rotator v0,float t1,Rotator d1,Rotator v1);


  final native function bool InitSplinePath(float t0,Vector d0,Vector v0,float t1,Vector d1,Vector v1);



