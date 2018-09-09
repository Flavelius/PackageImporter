//==============================================================================
//  xEmitter
//==============================================================================

class xEmitter extends Actor
    native
    dependsOn()
    Placeable
  ;

  enum EAttenFunc {
    ATF_LerpInOut ,
    ATF_ExpInOut ,
    ATF_SmoothStep ,
    ATF_Pulse ,
    ATF_Random ,
    ATF_None 
  };

  enum ExSpawningTypes {
    ST_Sphere ,
    ST_Line ,
    ST_Disc ,
    ST_Cylinder ,
    ST_AimedSphere ,
    ST_StaticMesh ,
    ST_Explode ,
    ST_ExplodeRing ,
    ST_OwnerSkeleton ,
    ST_Test 
  };

  enum ExParticleTypes {
    PT_Sprite ,
    PT_Stream ,
    PT_Line ,
    PT_Disc ,
    PT_Mesh ,
    PT_Branch ,
    PT_Beam 
  };

  var (PclEmitter) byte mParticleType;
  var (PclEmitter) byte mSpawningType;
  var (PclEmitter) bool mRegen;
  var (PclEmitter) bool mRegenPause;
  var (PclEmitter) float mRegenOnTime[2];
  var (PclEmitter) float mRegenOffTime[2];
  var (PclEmitter) int mStartParticles;
  var (PclEmitter) private int mMaxParticles;
  var (PclEmitter) float mDelayRange[2];
  var (PclEmitter) float mLifeRange[2];
  var (PclEmitter) float mRegenRange[2];
  var (PclEmitter) float mRegenDist;
  var (PclEmitter) name mSourceActor;
  var (PclEmitter) name mChildName;
  var xEmitter mChildEmitter;
  var (PclEmitter) StaticMeshActor SourceStaticMesh;
  var (PclEmitter) bool bSuspendWhenNotVisible;
  var (PclVisuals) bool mDistanceAtten;
  var (PclMovement) Vector mDirDev;
  var (PclMovement) Vector mPosDev;
  var (PclMovement) Vector mSpawnVecA;
  var (PclMovement) Vector mSpawnVecB;
  var (PclMovement) float mSpeedRange[2];
  var (PclMovement) bool mPosRelative;
  var (PclMovement) float mMassRange[2];
  var (PclMovement) float mAirResistance;
  var (PclMovement) bool mCollision;
  var (PclMovement) float mOwnerVelocityFactor;
  var (PclVisuals) bool mRandOrient;
  var (PclMovement) float mSpinRange[2];
  var (PclVisuals) float mSizeRange[2];
  var (PclVisuals) float mGrowthRate;
  var (PclVisuals) Color mColorRange[2];
  var (PclVisuals) bool mAttenuate;
  var (PclVisuals) float mAttenKa;
  var (PclVisuals) float mAttenKb;
  var (PclVisuals) byte mAttenFunc;
  var int mpAttenFunc;
  var (PclVisuals) bool mRandTextures;
  var (PclVisuals) bool mTileAnimation;
  var (PclVisuals) int mNumTileColumns;
  var (PclVisuals) int mNumTileRows;
  var (PclVisuals) bool mUseMeshNodes;
  var (PclVisuals) bool mRandMeshes;
  var (PclVisuals) StaticMesh mMeshNodes[8];
  var (PclVisuals) Texture mPosColorMapXY;
  var (PclVisuals) Texture mPosColorMapXZ;
  var (PclVisuals) Texture mLifeColorMap;
  var (PclSoftBody) float springK;
  var (PclSoftBody) float springD;
  var (PclSoftBody) float springMaxStretch;
  var (PclSoftBody) float springMaxCompress;
  var (PclMovement) float mColElasticity;
  var (PclMovement) float mAttraction;
  var (PclMovement) bool mColMakeSound;
  var (pclBeam) float mWaveFrequency;
  var (pclBeam) float mWaveAmplitude;
  var (pclBeam) float mWaveShift;
  var (pclBeam) float mBendStrength;
  var (pclBeam) bool mWaveLockEnd;
  var (Force) bool bForceAffected;
  var transient int SystemHandle;
  var transient int Expire;
  var transient int mpParticles;
  var transient int mNumActivePcl;
  var transient int mpIterator;
  var transient int mbSpinningNodes;
  var transient Vector mLastPos;
  var transient Vector mLastVector;
  var transient float mTime;
  var transient float mT;
  var transient float mRegenBias;
  var transient float mRegenTimer;
  var transient float mPauseTimer;
  var transient Box mBounds;
  var transient Plane mSphere;
  var transient Vector mDir;
  var transient int mNumUpdates;
  var transient int mAtLeastOneFrame;
  var transient int mRenderableVerts;
  var transient float mTexU;
  var transient float mTexV;
  var transient float mTotalTiles;
  var transient float mInvTileCols;
  var transient int mpSprings;
  var transient int mNumSprings;
  var transient float mWavePhaseA;
  var transient float mWavePhaseB;
  var bool blockOnNet;
  var bool bCallPreSpawn;
  var transient int mHeadIndex;


  static function PrecacheContent(LevelInfo Level) {
    if (default.mPosColorMapXY != None) {                                       //0000 : 07 1F 00 77 02 88 09 78 0F 2A 16 
      Level.AddPrecacheMaterial(default.mPosColorMapXY);                        //000B : 19 00 30 08 78 0F 0B 00 00 1B 88 2A 00 00 02 88 09 78 0F 16 
    }
    if (default.mPosColorMapXZ != None) {                                       //001F : 07 3E 00 77 02 00 0A 78 0F 2A 16 
      Level.AddPrecacheMaterial(default.mPosColorMapXZ);                        //002A : 19 00 30 08 78 0F 0B 00 00 1B 88 2A 00 00 02 00 0A 78 0F 16 
    }
    if (default.mLifeColorMap != None) {                                        //003E : 07 5D 00 77 02 78 0A 78 0F 2A 16 
      Level.AddPrecacheMaterial(default.mLifeColorMap);                         //0049 : 19 00 30 08 78 0F 0B 00 00 1B 88 2A 00 00 02 78 0A 78 0F 16 
    }
    if (default.Skins.Length > 0) {                                             //005D : 07 7F 00 97 37 02 50 9A 6C 0F 25 16 
      Level.AddPrecacheMaterial(default.Skins[0]);                              //0069 : 19 00 30 08 78 0F 0D 00 00 1B 88 2A 00 00 10 25 02 50 9A 6C 0F 16 
    }
    //07 1F 00 77 02 88 09 78 0F 2A 16 19 00 30 08 78 0F 0B 00 00 1B 88 2A 00 00 02 88 09 78 0F 16 07 
    //3E 00 77 02 00 0A 78 0F 2A 16 19 00 30 08 78 0F 0B 00 00 1B 88 2A 00 00 02 00 0A 78 0F 16 07 5D 
    //00 77 02 78 0A 78 0F 2A 16 19 00 30 08 78 0F 0B 00 00 1B 88 2A 00 00 02 78 0A 78 0F 16 07 7F 00 
    //97 37 02 50 9A 6C 0F 25 16 19 00 30 08 78 0F 0D 00 00 1B 88 2A 00 00 10 25 02 50 9A 6C 0F 16 04 
    //0B 47 
  }


  simulated function UpdatePrecacheMaterials() {
    if (mPosColorMapXY != None) {                                               //0000 : 07 1F 00 77 01 88 09 78 0F 2A 16 
      Level.AddPrecacheMaterial(mPosColorMapXY);                                //000B : 19 01 D8 7E 6C 0F 0B 00 00 1B 88 2A 00 00 01 88 09 78 0F 16 
    }
    if (mPosColorMapXZ != None) {                                               //001F : 07 3E 00 77 01 00 0A 78 0F 2A 16 
      Level.AddPrecacheMaterial(mPosColorMapXZ);                                //002A : 19 01 D8 7E 6C 0F 0B 00 00 1B 88 2A 00 00 01 00 0A 78 0F 16 
    }
    if (mLifeColorMap != None) {                                                //003E : 07 5D 00 77 01 78 0A 78 0F 2A 16 
      Level.AddPrecacheMaterial(mLifeColorMap);                                 //0049 : 19 01 D8 7E 6C 0F 0B 00 00 1B 88 2A 00 00 01 78 0A 78 0F 16 
    }
    Super.UpdatePrecacheMaterials();                                            //005D : 1C 90 FF 37 0F 16 
    //07 1F 00 77 01 88 09 78 0F 2A 16 19 01 D8 7E 6C 0F 0B 00 00 1B 88 2A 00 00 01 88 09 78 0F 16 07 
    //3E 00 77 01 00 0A 78 0F 2A 16 19 01 D8 7E 6C 0F 0B 00 00 1B 88 2A 00 00 01 00 0A 78 0F 16 07 5D 
    //00 77 01 78 0A 78 0F 2A 16 19 01 D8 7E 6C 0F 0B 00 00 1B 88 2A 00 00 01 78 0A 78 0F 16 1C 90 FF 
    //37 0F 16 04 0B 47 
  }


  event Trigger(Actor Other,Pawn EventInstigator) {
    mRegenPause = !mRegenPause;                                                 //0000 : 14 2D 01 08 0D 78 0F 81 2D 01 08 0D 78 0F 16 
    //14 2D 01 08 0D 78 0F 81 2D 01 08 0D 78 0F 16 04 0B 47 
  }


  final simulated function float ClampToMaxParticles(float InPart) {
    return FMin(InPart,mStartParticles);                                        //0000 : 04 F4 00 A8 0E 78 0F 39 3F 01 60 0F 78 0F 16 
    //04 F4 00 A8 0E 78 0F 39 3F 01 60 0F 78 0F 16 04 0B 47 
  }


  event PreSpawned() {
    if (!Level.bStartup) {                                                      //0000 : 07 BA 00 81 19 01 D8 7E 6C 0F 06 00 04 2D 01 B8 33 71 0F 16 
      bSuspendWhenNotVisible = False;                                           //0014 : 14 2D 01 30 12 78 0F 28 
      if (Level.bDropDetail && mMaxParticles > 5
        && (mParticleType == 0 || mParticleType == 4
        || mParticleType == 2)) {//001C : 07 BA 00 82 82 19 01 D8 7E 6C 0F 06 00 04 2D 01 F8 31 71 0F 18 0A 00 97 01 A8 12 78 0F 2C 05 16 16 18 32 00 84 84 9A 39 3A 01 20 13 78 0F 39 3A 24 00 16 18 0E 00 9A 39 3A 01 20 13 78 0F 39 3A 24 04 16 16 18 0E 00 9A 39 3A 01 20 13 78 0F 39 3A 24 02 16 16 16 
        mMaxParticles = mMaxParticles * 0.64999998;                             //0072 : 0F 01 A8 12 78 0F 39 44 AB 39 3F 01 A8 12 78 0F 1E 66 66 26 3F 16 
        mRegenRange[0] *= 0.80000001;                                           //0088 : B6 1A 25 01 98 13 78 0F 1E CD CC 4C 3F 16 
        mRegenRange[1] *= 0.80000001;                                           //0096 : B6 1A 26 01 98 13 78 0F 1E CD CC 4C 3F 16 
        mStartParticles = 0.64999998 * mStartParticles;                         //00A4 : 0F 01 60 0F 78 0F 39 44 AB 1E 66 66 26 3F 39 3F 01 60 0F 78 0F 16 
      }
    }
    //07 BA 00 81 19 01 D8 7E 6C 0F 06 00 04 2D 01 B8 33 71 0F 16 14 2D 01 30 12 78 0F 28 07 BA 00 82 
    //82 19 01 D8 7E 6C 0F 06 00 04 2D 01 F8 31 71 0F 18 0A 00 97 01 A8 12 78 0F 2C 05 16 16 18 32 00 
    //84 84 9A 39 3A 01 20 13 78 0F 39 3A 24 00 16 18 0E 00 9A 39 3A 01 20 13 78 0F 39 3A 24 04 16 16 
    //18 0E 00 9A 39 3A 01 20 13 78 0F 39 3A 24 02 16 16 16 0F 01 A8 12 78 0F 39 44 AB 39 3F 01 A8 12 
    //78 0F 1E 66 66 26 3F 16 B6 1A 25 01 98 13 78 0F 1E CD CC 4C 3F 16 B6 1A 26 01 98 13 78 0F 1E CD 
    //CC 4C 3F 16 0F 01 60 0F 78 0F 39 44 AB 1E 66 66 26 3F 39 3F 01 60 0F 78 0F 16 04 0B 47 
  }


  event CollisionSound();



