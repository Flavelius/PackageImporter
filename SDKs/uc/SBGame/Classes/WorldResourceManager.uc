//==============================================================================
//  WorldResourceManager
//==============================================================================

class WorldResourceManager extends Actor
    native
    exportstructs
    dependsOn(WorldResource)
    Placeable
  ;

  struct RegisteredResource {
      var WorldResource Resource;
      var float Timer;

  };


  var (WorldResourceManager) int MaxActive;
  var (WorldResourceManager) float RespawnTime;
  var transient array<RegisteredResource> ManagedResources;
  var transient float RespawnTimer;


  function DisableResource(WorldResource aResource) {
    local int ri;
    ri = 0;                                                                     //0000 : 0F 00 10 B7 32 13 25 
    while (ri < ManagedResources.Length) {                                      //0007 : 07 8F 00 96 00 10 B7 32 13 37 01 88 B7 32 13 16 
      if (ManagedResources[ri].Resource == aResource) {                         //0017 : 07 85 00 72 36 00 B8 32 13 10 00 10 B7 32 13 01 88 B7 32 13 00 A8 B5 32 13 16 
        ManagedResources[ri].Timer = Level.TimeSeconds;                         //0031 : 0F 36 78 B8 32 13 10 00 10 B7 32 13 01 88 B7 32 13 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
        ManagedResources[ri].Resource.sv_SetEnabled(False);                     //0050 : 19 36 00 B8 32 13 10 00 10 B7 32 13 01 88 B7 32 13 07 00 00 1B 96 0C 00 00 28 16 
        if (RespawnTimer < 0.00000000) {                                        //006B : 07 85 00 B0 01 F0 B8 32 13 1E 00 00 00 00 16 
          RespawnTimer = RespawnTime;                                           //007A : 0F 01 F0 B8 32 13 01 68 B9 32 13 
        }
      }
      ri++;                                                                     //0085 : A5 00 10 B7 32 13 16 
    }
    //0F 00 10 B7 32 13 25 07 8F 00 96 00 10 B7 32 13 37 01 88 B7 32 13 16 07 85 00 72 36 00 B8 32 13 
    //10 00 10 B7 32 13 01 88 B7 32 13 00 A8 B5 32 13 16 0F 36 78 B8 32 13 10 00 10 B7 32 13 01 88 B7 
    //32 13 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 19 36 00 B8 32 13 10 00 10 B7 32 13 01 88 B7 32 
    //13 07 00 00 1B 96 0C 00 00 28 16 07 85 00 B0 01 F0 B8 32 13 1E 00 00 00 00 16 0F 01 F0 B8 32 13 
    //01 68 B9 32 13 A5 00 10 B7 32 13 16 06 07 00 04 0B 47 
  }



