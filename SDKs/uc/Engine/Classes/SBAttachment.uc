//==============================================================================
//  SBAttachment
//==============================================================================

class SBAttachment extends Actor
    native
    dependsOn()
  ;

  enum SBAttachment_AnimType {
    SBAttachAnim_None ,
    SBAttachAnim_UseOwnerBones ,
    SBAttachAnim_HasOwnAnim ,
    SBAttachAnim_ClothSim 
  };

  struct SBGameInfoPtr {
      var transient int Ptr;

  };


  struct SBSoftBodyPtr {
      var transient int Ptr;

  };


  var byte AnimationType;
  var name AttachmentTag;
  var Vector PositionOffset;
  var Rotator OrientationOffset;
  var float LocalDrawScale;
  var Vector LocalDrawScale3D;
  var const native SBSoftBodyPtr softBody;
  var const native SBGameInfoPtr localGameInfo;
  var bool Initialized;
  var bool bIgnoreTagRotation;
  var bool bIsBaked;
  var int RealBoneIndex;
  var bool AddScaleFromBase;


  function PostBeginPlay() {
    Super.PostBeginPlay();                                                      //0000 : 1C D0 02 38 0F 16 
    SetupParameters();                                                          //0006 : 1B 6F 2C 00 00 16 
    //1C D0 02 38 0F 16 1B 6F 2C 00 00 16 04 0B 47 
  }


  function SetupParameters() {
    UpdateOffsetTransform();                                                    //0000 : 1B 72 2C 00 00 16 
    //1B 72 2C 00 00 16 04 0B 47 
  }


  function SetAnimType(byte newType) {
    AnimationType = newType;                                                    //0000 : 0F 01 30 B8 F8 13 00 78 B7 F8 13 
    //0F 01 30 B8 F8 13 00 78 B7 F8 13 04 0B 47 
  }


  native function SetSkin(string skinName);


  native function SetMesh(string meshName);


  native function Initialize();


  native function UpdateOffsetTransform();


  native function AttachTo(Actor Actor);



