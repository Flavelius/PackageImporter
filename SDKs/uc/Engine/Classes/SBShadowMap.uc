//==============================================================================
//  SBShadowMap
//==============================================================================

class SBShadowMap extends Object
    native
    dependsOn()
  ;

  var private const transient float mMaxTraceDistance;
  var private const transient float mProjWidth;
  var private const transient float mProjHeight;
  var private const transient Vector mFrustumOrigin;
  var private const transient Vector mLocation;
  var private const transient Rotator mRotation;
  var private const Light mLight;
  var private const transient Matrix mWorldToCamera;
  var private const transient Matrix mCameraToScreen;
  var private const transient float mViewportScale;
  var private const transient float mNearClippingPlane;
  var private const transient float mFarClippingPlane;
  var private const transient float mPCFRadiusInTexels;
  var private const transient float mProjectorScale;
  var private const transient int mTextureInterface;
  var private const transient int mCubemapFaces[6];



