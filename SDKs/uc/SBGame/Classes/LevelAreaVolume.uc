//==============================================================================
//  LevelAreaVolume
//==============================================================================

class LevelAreaVolume extends Volume
    native
    exportstructs
    dependsOn()
  ;

  var (LevelAreaVolume) Actor TriggeredActor;
  var (LevelAreaVolume) string RespawnPoint;
  var (LevelAreaVolume) LocalizedString LevelAreaName;
  var (ShardMap) Material CurrentShardMap;
  var (ShardMap) bool IsShardMap;
  var (ShardMap) int MapSectionID;
  var (ShardMap) bool IsDiscovered;
  var (ShardMap) string mGEDFile;
  var (PvP) editinline PvPSettings PvPSettings;


  event Touch(Actor anActor) {
    if (SBRole == 9 || SBRole == 1) {                                           //0000 : 07 5D 00 84 9A 39 3A 01 40 B2 6C 0F 39 3A 24 09 16 18 0E 00 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 16 16 
      if (TriggeredActor != None && anActor.IsA('Game_PlayerPawn')) {           //0022 : 07 5D 00 82 77 01 68 9E 34 11 2A 16 18 12 00 19 00 E0 9E 34 11 08 00 04 61 2F 21 70 0A 00 00 16 16 
        TriggeredActor.Trigger(self,Game_PlayerPawn(anActor));                  //0043 : 19 01 68 9E 34 11 11 00 00 1B 32 01 00 00 17 2E F0 47 5B 01 00 E0 9E 34 11 16 
      }
    }
    //07 5D 00 84 9A 39 3A 01 40 B2 6C 0F 39 3A 24 09 16 18 0E 00 9A 39 3A 01 40 B2 6C 0F 39 3A 24 01 
    //16 16 07 5D 00 82 77 01 68 9E 34 11 2A 16 18 12 00 19 00 E0 9E 34 11 08 00 04 61 2F 21 70 0A 00 
    //00 16 16 19 01 68 9E 34 11 11 00 00 1B 32 01 00 00 17 2E F0 47 5B 01 00 E0 9E 34 11 16 04 0B 47 
    //
  }



