//==============================================================================
//  SBCharacterMaterial
//==============================================================================

class SBCharacterMaterial extends SBMaterial
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  enum ECharacterPostProcess {
    CPP_None ,
    CPP_Statue ,
    CPP_Ghost 
  };

  var (SBCharacterMaterial) float SunlightsContrastAdjust;
  var (SBCharacterMaterial) float SunlightsBrightness;
  var (SBCharacterMaterial) Color SkinColor;
  var (SBCharacterMaterial) editinline Texture SkinTexture;
  var (SBCharacterMaterial) editinline Texture TattooTexture;
  var (SBCharacterMaterial) editinline Texture MainTexture[2];
  var (SBCharacterMaterial) Color MainColor1[2];
  var (SBCharacterMaterial) Color MainColor2[2];
  var (SBCharacterMaterial) editinline Texture GuildLogoTexture;
  var (SBCharacterMaterial) Color GuildLogoColor;
  var (SBCharacterMaterial) bool GuildLogoUsesCylindricalMapping;
  var (SBCharacterMaterial) int GuildLogoAngle;
  var (SBCharacterMaterial) float GuildLogoScale;
  var (SBCharacterMaterial) float GuildLogoCenterU;
  var (SBCharacterMaterial) float GuildLogoCenterV;
  var (SBCharacterMaterial) Color ColorModifier;
  var (SBCharacterMaterial) byte PostProcess;
  var (SBCharacterMaterial) Texture StatueTexture;
  var (SBCharacterMaterial) Texture EnvMapTexture;
  var (SBCharacterMaterial) Texture OverlayTexture;
  var (SBCharacterMaterial) bool UseSkinTextureColoring;
  var (SBCharacterMaterial) bool UseMainTextureColoring;
  var (SBCharacterMaterial) float SpecularLevel;
  var (SBCharacterMaterial) Color SpecularColor;
  var private const transient bool mIsBaked;



