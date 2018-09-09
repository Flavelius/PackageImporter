//==============================================================================
//  SpriteEmitter
//==============================================================================

class SpriteEmitter extends ParticleEmitter
    native
    editinlinenew
    dependsOn()
  ;

  enum EParticleDirectionUsage {
    PTDU_None ,
    PTDU_Up ,
    PTDU_Right ,
    PTDU_Forward ,
    PTDU_Normal ,
    PTDU_UpAndNormal ,
    PTDU_RightAndNormal ,
    PTDU_Scale 
  };

  var (Sprite) byte UseDirectionAs;
  var (Sprite) Vector ProjectionNormal;
  var transient Vector RealProjectionNormal;



