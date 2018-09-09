//==============================================================================
//  Interaction_Loot
//==============================================================================

class Interaction_Loot extends Interaction_Component
    native
    editinlinenew
    dependsOn(Class,Loot_Manager)
  ;

  var (Interaction_Loot) export editinline LootTable AcquireItem;
  var (Interaction_Loot) float LootTimerLimit;


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local array<LootTable> lootTableList;
    local array<Game_Pawn> receivers;
    local Loot_Manager lootManager;
    Super.SvOnStart(aOwner,aInstigator);                                        //0000 : 1C 60 AF 32 13 00 C8 3E F9 13 00 48 40 F9 13 16 
    if (aOwner != None && AcquireItem != None) {                                //0010 : 07 9B 00 82 77 00 C8 3E F9 13 2A 16 18 09 00 77 01 50 3E F9 13 2A 16 16 
      if (!aReverse) {                                                          //0028 : 07 9B 00 81 2D 00 C0 40 F9 13 16 
        lootManager = Class'Loot_Manager'.static.sv_GetInstance();              //0033 : 0F 00 38 41 F9 13 12 20 B8 01 5D 01 06 00 04 1C 48 58 35 0F 16 
        if (lootManager != None) {                                              //0048 : 07 9B 00 77 00 38 41 F9 13 2A 16 
          lootTableList.Length = 1;                                             //0053 : 0F 37 00 B0 41 F9 13 26 
          lootTableList[0] = AcquireItem;                                       //005B : 0F 10 25 00 B0 41 F9 13 01 50 3E F9 13 
          receivers.Length = 1;                                                 //0068 : 0F 37 00 28 42 F9 13 26 
          receivers[0] = aInstigator;                                           //0070 : 0F 10 25 00 28 42 F9 13 00 48 40 F9 13 
          lootManager.sv_CreateTransaction(lootTableList,receivers,LootTimerLimit);//007D : 19 00 38 41 F9 13 15 00 00 1C F8 58 35 0F 00 B0 41 F9 13 00 28 42 F9 13 01 A0 42 F9 13 16 
        }
      }
    }
    //1C 60 AF 32 13 00 C8 3E F9 13 00 48 40 F9 13 16 07 9B 00 82 77 00 C8 3E F9 13 2A 16 18 09 00 77 
    //01 50 3E F9 13 2A 16 16 07 9B 00 81 2D 00 C0 40 F9 13 16 0F 00 38 41 F9 13 12 20 B8 01 5D 01 06 
    //00 04 1C 48 58 35 0F 16 07 9B 00 77 00 38 41 F9 13 2A 16 0F 37 00 B0 41 F9 13 26 0F 10 25 00 B0 
    //41 F9 13 01 50 3E F9 13 0F 37 00 28 42 F9 13 26 0F 10 25 00 28 42 F9 13 00 48 40 F9 13 19 00 38 
    //41 F9 13 15 00 00 1C F8 58 35 0F 00 B0 41 F9 13 00 28 42 F9 13 01 A0 42 F9 13 16 04 0B 47 
  }



