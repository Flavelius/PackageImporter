//==============================================================================
//  PvPSettings
//==============================================================================

class PvPSettings extends Object
    native
    editinlinenew
    dependsOn()
  ;

  enum EPvPTypes {
    PVP_None ,
    PVP_Off ,
    PVP_Guildwars ,
    PVP_HouseVSHouse ,
    PVP_GuildVSGuild ,
    PVP_Deprecated_DO_NOT_USE ,
    PVP_FFA 
  };

  var (PvPSettings) bool AllowDrawWeapon;
  var (PvPSettings) byte Type;
  var (PvPSettings) bool FriendlyFire;
  var (PvPSettings) int EnableTimeOut;
  var (PvPSettings) bool PvPServerOnly;



