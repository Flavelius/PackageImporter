//==============================================================================
//  GUI_Mesh
//==============================================================================

class GUI_Mesh extends GUI_Component
    native
    dependsOn(Actor,LevelInfo,Player)
    Transient
    Config(User)
  ;

  var StaticMesh mStaticMesh;
  var Vector mPawnTranslation;
  var bool mAutoCenter;
  var float mYaw;
  var float mPitch;
  var float mRoll;
  var float mDistance;
  var float mFOV;
  var bool mClearZ;
  var Rotator mMeshRotation;
  var Rotator mAppliedRotation;
  var Rotator mUserRotation;
  var float mLastTick;
  var float mMeshWidth;
  var float mMeshHeight;
  var bool mIsTranslating;
  var Vector mStartTranslation;
  var float mStartTranslationTime;
  var Vector mEndTranslation;
  var float mEndTranslationTime;
  var bool mIsRotating;
  var bool mJustFinishedRotating;
  var int mRollDirection;
  var float mStartYaw;
  var float mStartPitch;
  var float mStartRoll;
  var float mStartRotationTime;
  var float mEndYaw;
  var float mEndPitch;
  var float mEndRoll;
  var float mEndRotationTime;
  var Actor mMeshActor;
  var int TopDownRotation;
  var bool UseCameraLookAtLocation;
  var bool UsePawnLocationAsLookAtLocation;
  var Vector CameraLookAtLocation;
  var float CameraDistance;
  var bool mShowMesh;
  var bool mUseLevelLighting;
  var private Vector mTranslation;


  event SetActorTranslation(Vector aTranslation) {
    mPawnTranslation = aTranslation;                                            //0000 : 0F 01 F8 78 A6 19 00 40 78 A6 19 
    //0F 01 F8 78 A6 19 00 40 78 A6 19 04 0B 47 
  }


  event SetActorRotation(Rotator aRotator) {
    mAppliedRotation = rot(0, 0, 0);                                            //0000 : 0F 01 F0 7A A6 19 22 00 00 00 00 00 00 00 00 00 00 00 00 
    mUserRotation = aRotator;                                                   //0013 : 0F 01 68 7B A6 19 00 20 7A A6 19 
    //0F 01 F0 7A A6 19 22 00 00 00 00 00 00 00 00 00 00 00 00 0F 01 68 7B A6 19 00 20 7A A6 19 04 0B 
    //47 
  }


  function ResetLookAtPosition() {
    CameraLookAtLocation.X = 0.00000000;                                        //0000 : 0F 36 48 C4 69 0F 01 18 7D A6 19 1E 00 00 00 00 
    CameraLookAtLocation.Y = 0.00000000;                                        //0010 : 0F 36 C0 C4 69 0F 01 18 7D A6 19 1E 00 00 00 00 
    CameraLookAtLocation.Z = 0.00000000;                                        //0020 : 0F 36 38 C5 69 0F 01 18 7D A6 19 1E 00 00 00 00 
    CameraDistance = 0.00000000;                                                //0030 : 0F 01 90 7D A6 19 1E 00 00 00 00 
    UseCameraLookAtLocation = False;                                            //003B : 14 2D 01 08 7E A6 19 28 
    //0F 36 48 C4 69 0F 01 18 7D A6 19 1E 00 00 00 00 0F 36 C0 C4 69 0F 01 18 7D A6 19 1E 00 00 00 00 
    //0F 36 38 C5 69 0F 01 18 7D A6 19 1E 00 00 00 00 0F 01 90 7D A6 19 1E 00 00 00 00 14 2D 01 08 7E 
    //A6 19 28 04 0B 47 
  }


  function SetCameraLookAtDistance(float Distance) {
    CameraDistance = Distance;                                                  //0000 : 0F 01 90 7D A6 19 00 30 7F A6 19 
    UseCameraLookAtLocation = True;                                             //000B : 14 2D 01 08 7E A6 19 27 
    //0F 01 90 7D A6 19 00 30 7F A6 19 14 2D 01 08 7E A6 19 27 04 0B 47 
  }


  function SetCameraLookAtPosition(Vector lookAtPosition) {
    CameraLookAtLocation = lookAtPosition;                                      //0000 : 0F 01 18 7D A6 19 00 A0 80 A6 19 
    UseCameraLookAtLocation = True;                                             //000B : 14 2D 01 08 7E A6 19 27 
    //0F 01 18 7D A6 19 00 A0 80 A6 19 14 2D 01 08 7E A6 19 27 04 0B 47 
  }


  function SetCameraLookAtParams(Vector lookAtPosition,float Distance) {
    CameraLookAtLocation = lookAtPosition;                                      //0000 : 0F 01 18 7D A6 19 00 10 82 A6 19 
    CameraDistance = Distance;                                                  //000B : 0F 01 90 7D A6 19 00 E0 82 A6 19 
    UseCameraLookAtLocation = True;                                             //0016 : 14 2D 01 08 7E A6 19 27 
    //0F 01 18 7D A6 19 00 10 82 A6 19 0F 01 90 7D A6 19 00 E0 82 A6 19 14 2D 01 08 7E A6 19 27 04 0B 
    //47 
  }


  function SetRoll(float targetRoll,float targetTime,int direction) {
    if (targetTime <= 0.00000000) {                                             //0000 : 07 24 00 B2 00 90 85 A6 19 1E 00 00 00 00 16 
      mUserRotation.Roll = targetRoll;                                          //000F : 0F 36 98 BF 69 0F 01 68 7B A6 19 39 44 00 08 84 A6 19 
    } else {                                                                    //0021 : 06 9E 00 
      mIsRotating = True;                                                       //0024 : 14 2D 01 08 86 A6 19 27 
      mRollDirection = direction;                                               //002C : 0F 01 80 86 A6 19 00 F8 86 A6 19 
      mStartRoll = mMeshActor.Rotation.Roll;                                    //0037 : 0F 01 70 87 A6 19 39 3F 36 98 BF 69 0F 19 01 08 0C A3 19 05 00 0C 01 00 84 6C 0F 
      mStartRotationTime = mMeshActor.Level.TimeSeconds;                        //0052 : 0F 01 E8 87 A6 19 19 19 01 08 0C A3 19 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
      mEndRoll = targetRoll;                                                    //006F : 0F 01 60 88 A6 19 00 08 84 A6 19 
      mEndRotationTime = mMeshActor.Level.TimeSeconds + targetTime;             //007A : 0F 01 D8 88 A6 19 AE 19 19 01 08 0C A3 19 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 00 90 85 A6 19 16 
    }
    mJustFinishedRotating = False;                                              //009E : 14 2D 01 50 89 A6 19 28 
    //07 24 00 B2 00 90 85 A6 19 1E 00 00 00 00 16 0F 36 98 BF 69 0F 01 68 7B A6 19 39 44 00 08 84 A6 
    //19 06 9E 00 14 2D 01 08 86 A6 19 27 0F 01 80 86 A6 19 00 F8 86 A6 19 0F 01 70 87 A6 19 39 3F 36 
    //98 BF 69 0F 19 01 08 0C A3 19 05 00 0C 01 00 84 6C 0F 0F 01 E8 87 A6 19 19 19 01 08 0C A3 19 05 
    //00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 0F 01 60 88 A6 19 00 08 84 A6 19 0F 01 D8 88 A6 19 
    //AE 19 19 01 08 0C A3 19 05 00 04 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 00 90 85 A6 19 16 14 2D 
    //01 50 89 A6 19 28 04 0B 47 
  }


  native function SetMeshMaterial(int materialID,Material newMaterial);


  function Actor GetMeshActor() {
    return mMeshActor;                                                          //0000 : 04 01 08 0C A3 19 
    //04 01 08 0C A3 19 04 0B 47 
  }


  function UseLevelLighting(bool aUseLevelLighting) {
    mUseLevelLighting = aUseLevelLighting;                                      //0000 : 14 2D 01 38 C4 A6 19 2D 00 80 C3 A6 19 
    //14 2D 01 38 C4 A6 19 2D 00 80 C3 A6 19 04 0B 47 
  }


  event ShowMesh(bool aShowFlag) {
    mShowMesh = aShowFlag;                                                      //0000 : 14 2D 01 18 C6 A6 19 2D 00 60 C5 A6 19 
    //14 2D 01 18 C6 A6 19 2D 00 60 C5 A6 19 04 0B 47 
  }


  function ShowMeshActor(bool aShowFlag) {
    if (mMeshActor != None) {                                                   //0000 : 07 23 00 77 01 08 0C A3 19 2A 16 
      mMeshActor.bHidden = !aShowFlag;                                          //000B : 14 19 01 08 0C A3 19 06 00 04 2D 01 48 5E 6E 0F 81 2D 00 40 C7 A6 19 16 
    }
    //07 23 00 77 01 08 0C A3 19 2A 16 14 19 01 08 0C A3 19 06 00 04 2D 01 48 5E 6E 0F 81 2D 00 40 C7 
    //A6 19 16 04 0B 47 
  }


  function SetMeshActor(Actor aPawn) {
    local Rotator Rotation;
    if (aPawn != None && mMeshActor != None) {                                  //0000 : 07 2B 00 82 77 00 C8 C8 A6 19 2A 16 18 09 00 77 01 08 0C A3 19 2A 16 16 
      mMeshActor.Destroy();                                                     //0018 : 19 01 08 0C A3 19 03 00 04 61 17 16 
      mMeshActor = None;                                                        //0024 : 0F 01 08 0C A3 19 2A 
    }
    mMeshActor = aPawn;                                                         //002B : 0F 01 08 0C A3 19 00 C8 C8 A6 19 
    if (mMeshActor != None) {                                                   //0036 : 07 8B 00 77 01 08 0C A3 19 2A 16 
      Rotation.Yaw = mYaw;                                                      //0041 : 0F 36 20 BF 69 0F 00 30 CA A6 19 39 44 01 A8 CA A6 19 
      Rotation.Pitch = mPitch;                                                  //0053 : 0F 36 A8 BE 69 0F 00 30 CA A6 19 39 44 01 20 CB A6 19 
      Rotation.Roll = mRoll;                                                    //0065 : 0F 36 98 BF 69 0F 00 30 CA A6 19 39 44 01 98 CB A6 19 
      mMeshActor.SetRotation(Rotation);                                         //0077 : 19 01 08 0C A3 19 0B 00 04 1C 70 01 6E 0F 00 30 CA A6 19 16 
    }
    //07 2B 00 82 77 00 C8 C8 A6 19 2A 16 18 09 00 77 01 08 0C A3 19 2A 16 16 19 01 08 0C A3 19 03 00 
    //04 61 17 16 0F 01 08 0C A3 19 2A 0F 01 08 0C A3 19 00 C8 C8 A6 19 07 8B 00 77 01 08 0C A3 19 2A 
    //16 0F 36 20 BF 69 0F 00 30 CA A6 19 39 44 01 A8 CA A6 19 0F 36 A8 BE 69 0F 00 30 CA A6 19 39 44 
    //01 20 CB A6 19 0F 36 98 BF 69 0F 00 30 CA A6 19 39 44 01 98 CB A6 19 19 01 08 0C A3 19 0B 00 04 
    //1C 70 01 6E 0F 00 30 CA A6 19 16 04 0B 47 
  }


  event SetStaticMesh(StaticMesh aNewMesh) {
    if (mMeshActor == None) {                                                   //0000 : 07 34 00 72 01 08 0C A3 19 2A 16 
      mMeshActor = mDesktop.ViewportOwner.Actor.Spawn(Class'GUI_MeshActor');    //000B : 0F 01 08 0C A3 19 19 19 19 01 48 0C 9D 19 05 00 04 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 08 00 04 61 16 20 F8 24 2F 1D 16 
    }
    if (mMeshActor != None) {                                                   //0034 : 07 53 00 77 01 08 0C A3 19 2A 16 
      mMeshActor.SetStaticMesh(aNewMesh);                                       //003F : 19 01 08 0C A3 19 0B 00 00 1C A8 94 6B 0F 00 C0 CC A6 19 16 
    }
    //07 34 00 72 01 08 0C A3 19 2A 16 0F 01 08 0C A3 19 19 19 19 01 48 0C 9D 19 05 00 04 01 70 B7 71 
    //0F 05 00 04 01 50 BA 79 0F 08 00 04 61 16 20 F8 24 2F 1D 16 07 53 00 77 01 08 0C A3 19 2A 16 19 
    //01 08 0C A3 19 0B 00 00 1C A8 94 6B 0F 00 C0 CC A6 19 16 04 0B 47 
  }


  event LoadStaticMesh(string aName) {
    local StaticMesh NewMesh;
    if (Len(aName) != 0) {                                                      //0000 : 07 7E 00 9B 7D 00 18 CF A6 19 16 25 16 
      if (mMeshActor == None) {                                                 //000D : 07 41 00 72 01 08 0C A3 19 2A 16 
        mMeshActor = mDesktop.ViewportOwner.Actor.Spawn(Class'GUI_MeshActor');  //0018 : 0F 01 08 0C A3 19 19 19 19 01 48 0C 9D 19 05 00 04 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 08 00 04 61 16 20 F8 24 2F 1D 16 
      }
      if (mMeshActor != None) {                                                 //0041 : 07 7B 00 77 01 08 0C A3 19 2A 16 
        NewMesh = StaticMesh(static.DynamicLoadObject(aName,Class'StaticMesh'));//004C : 0F 00 90 CF A6 19 2E 80 10 D6 00 1C 60 E7 69 0F 00 18 CF A6 19 20 80 10 D6 00 16 
        mMeshActor.SetStaticMesh(NewMesh);                                      //0067 : 19 01 08 0C A3 19 0B 00 00 1C A8 94 6B 0F 00 90 CF A6 19 16 
      }
    } else {                                                                    //007B : 06 8E 00 
      mMeshActor.SetStaticMesh(None);                                           //007E : 19 01 08 0C A3 19 07 00 00 1C A8 94 6B 0F 2A 16 
    }
    //07 7E 00 9B 7D 00 18 CF A6 19 16 25 16 07 41 00 72 01 08 0C A3 19 2A 16 0F 01 08 0C A3 19 19 19 
    //19 01 48 0C 9D 19 05 00 04 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 08 00 04 61 16 20 F8 24 2F 1D 
    //16 07 7B 00 77 01 08 0C A3 19 2A 16 0F 00 90 CF A6 19 2E 80 10 D6 00 1C 60 E7 69 0F 00 18 CF A6 
    //19 20 80 10 D6 00 16 19 01 08 0C A3 19 0B 00 00 1C A8 94 6B 0F 00 90 CF A6 19 16 06 8E 00 19 01 
    //08 0C A3 19 07 00 00 1C A8 94 6B 0F 2A 16 04 0B 47 
  }


  event MakeMeshActorWhenNeeded() {
    local Rotator Rotation;
    if (mMeshActor == None && mStaticMesh != None) {                            //0000 : 07 9F 00 82 72 01 08 0C A3 19 2A 16 18 09 00 77 01 30 45 8B 19 2A 16 16 
      mMeshActor = mDesktop.ViewportOwner.Actor.Spawn(Class'GUI_MeshActor');    //0018 : 0F 01 08 0C A3 19 19 19 19 01 48 0C 9D 19 05 00 04 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 08 00 04 61 16 20 F8 24 2F 1D 16 
      Rotation.Yaw = mYaw;                                                      //0041 : 0F 36 20 BF 69 0F 00 B0 43 8B 19 39 44 01 A8 CA A6 19 
      Rotation.Pitch = mPitch;                                                  //0053 : 0F 36 A8 BE 69 0F 00 B0 43 8B 19 39 44 01 20 CB A6 19 
      Rotation.Roll = mRoll;                                                    //0065 : 0F 36 98 BF 69 0F 00 B0 43 8B 19 39 44 01 98 CB A6 19 
      mMeshActor.SetRotation(Rotation);                                         //0077 : 19 01 08 0C A3 19 0B 00 04 1C 70 01 6E 0F 00 B0 43 8B 19 16 
      mMeshActor.SetStaticMesh(mStaticMesh);                                    //008B : 19 01 08 0C A3 19 0B 00 00 1C A8 94 6B 0F 01 30 45 8B 19 16 
    }
    //07 9F 00 82 72 01 08 0C A3 19 2A 16 18 09 00 77 01 30 45 8B 19 2A 16 16 0F 01 08 0C A3 19 19 19 
    //19 01 48 0C 9D 19 05 00 04 01 70 B7 71 0F 05 00 04 01 50 BA 79 0F 08 00 04 61 16 20 F8 24 2F 1D 
    //16 0F 36 20 BF 69 0F 00 B0 43 8B 19 39 44 01 A8 CA A6 19 0F 36 A8 BE 69 0F 00 B0 43 8B 19 39 44 
    //01 20 CB A6 19 0F 36 98 BF 69 0F 00 B0 43 8B 19 39 44 01 98 CB A6 19 19 01 08 0C A3 19 0B 00 04 
    //1C 70 01 6E 0F 00 B0 43 8B 19 16 19 01 08 0C A3 19 0B 00 00 1C A8 94 6B 0F 01 30 45 8B 19 16 04 
    //0B 47 
  }


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 70 DD 9D 19 16 
    MakeMeshActorWhenNeeded();                                                  //0006 : 1B D4 96 00 00 16 
    //1C 70 DD 9D 19 16 1B D4 96 00 00 16 04 0B 47 
  }



