//==============================================================================
//  Appearance_Base
//==============================================================================

class Appearance_Base extends Object
    native
    abstract
    exportstructs
    dependsOn()
  ;

  enum ESpecularMode {
    Specular_None ,
    Specular_Metal ,
    Specular_Hair 
  };

  enum EColorizeMode {
    Colorize_None ,
    Colorize_OneColor ,
    Colorize_TwoColor ,
    Colorize_Unreal ,
    Colorize_Skin 
  };

  enum CoverageFlag {
    Covers_LeftAnkle ,
    Covers_Belt ,
    Covers_Chest ,
    Covers_Head ,
    Covers_HipLeft ,
    Covers_HipRight ,
    Covers_LeftLowerArm ,
    Covers_LeftShoulder ,
    Covers_LeftUpperArm ,
    Covers_LeftLowerLeg ,
    Covers_LeftUpperLeg ,
    Covers_RightLowerArm ,
    Covers_RightShoulder ,
    Covers_RightUpperArm ,
    Covers_RightLowerLeg ,
    Covers_RightUpperLeg ,
    Covers_Nothing ,
    Covers_RightAnkle 
  };

  enum AppearanceSocket {
    AS_Head ,
    AS_RightPauldron ,
    AS_LeftPauldron ,
    AS_Chest ,
    AS_BackMain ,
    AS_LeftHandHolster ,
    AS_RightHandHolster ,
    AS_LeftBracer ,
    AS_RightBracer ,
    AS_LeftCalf ,
    AS_RightCalf ,
    AS_LeftThigh ,
    AS_RightThigh ,
    AS_Base ,
    AS_Belt ,
    AS_MainShoulderSheath ,
    AS_OffhandShoulderSheath ,
    AS_Shield ,
    AS_ShieldSheath 
  };

  enum AppearancePart {
    AP_ChestClothes ,
    AP_LeftGlove ,
    AP_RightGlove ,
    AP_Pants ,
    AP_Shoes ,
    AP_HeadGearArmour ,
    AP_LeftShoulderArmour ,
    AP_RightShoulderArmour ,
    AP_LeftGauntlet ,
    AP_RightGauntlet ,
    AP_ChestArmour ,
    AP_Belt ,
    AP_LeftThigh ,
    AP_RightThigh ,
    AP_LeftShin ,
    AP_RightShin ,
    AP_MainWeapon ,
    AP_OffhandWeapon ,
    AP_Hair ,
    AP_MainSheath ,
    AP_OffhandSheath ,
    AP_Body ,
    AP_Head ,
    AP_Tattoo ,
    AP_ClassTattoo 
  };

  struct Attachment {
      var (Attachment) string MeshGroup;
      var (Attachment) byte SocketId;
      var (Attachment) byte Covers;
      var (Attachment) Texture AlternativeTexture;

  };


  struct SubTextureLocation {
      var (SubTextureLocation) int Angle;
      var (SubTextureLocation) float Scale;
      var (SubTextureLocation) float CenterU;
      var (SubTextureLocation) float CenterV;

  };


  var (Base) LocalizedString Name;
  var (Base) LocalizedString Description;
  var (Base) Texture Palette1;
  var (Base) Texture Palette2;
  var (Base) byte PaletteDefaultColor1;
  var (Base) byte PaletteDefaultColor2;
  var transient byte SortHelp;
  var (_LowLevel) byte Part;
  var (Base) bool SelectableInCharacterCreation;
  var (Base) byte ColorMode;
  var (Base) bool ShowGuildLogo;
  var byte Specular;
  var (Attachments) array<Attachment> Attachments;
  var (Constraints) bool ExcludeHumans;
  var (Constraints) bool ExcludeDaevi;
  var (Constraints) bool ExcludeMale;
  var (Constraints) bool ExcludeFemale;
  var (Constraints) bool ExcludeFat;
  var (Constraints) bool ExcludeSkinny;
  var (Constraints) bool ExcludeHulk;
  var (Constraints) bool ExcludeAthletic;
  var (Constraints) bool ExcludeHumansInCharacterCreation;
  var (Constraints) bool ExcludeDaeviInCharacterCreation;
  var bool ApplyToTorso;
  var bool ApplyToRightArmUpper;
  var bool ApplyToLeftArmUpper;
  var bool ApplyToRightArmLower;
  var bool ApplyToLeftArmLower;
  var bool ApplyToRightHand;
  var bool ApplyToLeftHand;
  var bool ApplyToPelvis;
  var bool ApplyToThighs;
  var bool ApplyToCalves;
  var bool ApplyToFeet;
  var (Sections) Material MaterialFemale;
  var (Sections) Material MaterialMale;
  var export transient editinline Item_Type _IT;
  var transient int _AS_Index;
  var transient bool _AS_Set;


  final native event string GetStaticAttachmentStr(Game_Pawn aPawn,int aIndex);


  final native event StaticMesh GetStaticAttachment(Game_Pawn aPawn,int aIndex);



