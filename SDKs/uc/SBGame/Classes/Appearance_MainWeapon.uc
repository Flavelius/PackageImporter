//==============================================================================
//  Appearance_MainWeapon
//==============================================================================

class Appearance_MainWeapon extends Appearance_Base
    native
    dependsOn()
  ;

  enum EWeaponTracerType {
    EWTT_Custom ,
    EWTT_NoTracer ,
    EWTT_Sword_sh ,
    EWTT_Sword_dh ,
    EWTT_Axe_sh ,
    EWTT_Axe_dh ,
    EWTT_Mace_sh ,
    EWTT_Mace_dh ,
    EWTT_Dag_sh ,
    EWTT_Pole_sh 
  };

  enum EWeaponClassification {
    EWC_Undetermined ,
    EWC_Axe ,
    EWC_DoubleHandedAxe ,
    EWC_Sword ,
    EWC_DoubleHandedSword ,
    EWC_Mace ,
    EWC_DoubleHandedMace ,
    EWC_Hammer ,
    EWC_DoubleHandedHammer ,
    EWC_Dagger ,
    EWC_Bow ,
    EWC_Shields 
  };

  enum EAppMainWeaponType {
    EMW_Undetermined ,
    EMW_SingleHanded ,
    EMW_DoubleHanded ,
    EMW_DualWielding ,
    EMW_Ranged 
  };

  var (MainWeapon) byte WeaponType;
  var (MainWeapon) byte WeaponClassification;
  var (MainWeapon) byte WeaponTracerType;
  var (MainWeapon) Vector WeaponTracerBeginOffset;
  var (MainWeapon) Vector WeaponTracerEndOffset;


  native function GetWeaponTracerBoneOffsets(out Vector StartBoneOffset,out Vector EndBoneOffset);


  static native function string GetWeaponClassName(byte aClassification);



