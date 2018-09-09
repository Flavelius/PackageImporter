//==============================================================================
//  WorldResource
//==============================================================================

class WorldResource extends InteractiveLevelElement
    native
    abstract
    dependsOn(WorldResourceManager)
  ;

  var (WorldResource) editconst WorldResourceManager Manager;
  var (WorldResource) editinline StaticMesh Tool;
  var (WorldResource) string Animation;
  var (WorldResource) float InteractionTime;
  var (WorldResource) export editinline LootTable Loot;


  event sv_StopOptionActions() {
    Super.sv_StopOptionActions();                                               //0000 : 1C E0 4A 32 13 16 
    Manager.DisableResource(self);                                              //0006 : 19 01 60 8F 32 13 07 00 00 1B 33 0F 00 00 17 16 
    //1C E0 4A 32 13 16 19 01 60 8F 32 13 07 00 00 1B 33 0F 00 00 17 16 04 0B 47 
  }



