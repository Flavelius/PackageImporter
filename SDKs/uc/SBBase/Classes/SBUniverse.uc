//==============================================================================
//  SBUniverse
//==============================================================================

class SBUniverse extends Object
    native
    dependsOn()
  ;

  var (Universe) editinline SBUniverseRules GameRules;
  var (Universe) editinline SBWorld EntryWorld;
  var (Universe) editinline SBPortal EntryPortal;
  var (Universe) editinline SBWorld LobbyWorld;
  var (Universe) int MaxPlayers;
  var (Universe) array<LocalizedString> LocalizedInstanceNames;
  var array<SBWorld> Worlds;



