//==============================================================================
//  SBAccessMap
//==============================================================================

class SBAccessMap extends Object
    native
    dependsOn()
  ;

  enum EAnnotationType {
    EAnnotation_None ,
    EAnnotation_Walk ,
    EAnnotation_Fly ,
    EAnnotation_Narrow ,
    EAnnotation_Wide ,
    EAnnotation_Fall ,
    EAnnotation_Jump ,
    EAnnotation_ResDef0 ,
    EAnnotation_ResDef1 ,
    EAnnotation_Script ,
    EAnnotation_Patrol ,
    EAnnotation_Road ,
    EAnnotation_Closed 
  };

  var AccessmapExplorer mScout;
  var float mPathCellSize;
  var float mMarginCellSize;
  var float mWidePathSize;
  var float mSlopeSize;
  var float mVerticalExpansion;
  var int mErrorMargin;
  var bool mEnable2DAccessmap;
  var int mSearchCount;
  var transient Object mLevel;
  var transient int mCurrentContainer;



