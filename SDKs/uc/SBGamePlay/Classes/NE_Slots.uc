//==============================================================================
//  NE_Slots
//==============================================================================

class NE_Slots extends NE_SlotsBase
    native
    collapsecategories
    dependsOn(Game_Pawn,Game_NPCItemManager)
  ;

  var (Equipment) byte ClothColor1;
  var (Equipment) byte ClothColor2;
  var (Equipment) byte ArmorColor1;
  var (Equipment) byte ArmorColor2;


  function Apply(Game_Pawn aPawn) {
    local export editinline Game_NPCItemManager itemManager;
    local array<Item_Type> Items;
    itemManager = Game_NPCItemManager(aPawn.itemManager);                       //0000 : 0F 00 F0 55 E9 14 2E A0 60 60 01 19 00 00 53 E9 14 05 00 04 01 B0 2D 19 11 
    if (itemManager != None) {                                                  //0019 : 07 AC 01 77 00 F0 55 E9 14 2A 16 
      PutItem(W01_MeleeWeapon,Items);                                           //0024 : 1B C1 6F 00 00 01 00 F3 E8 14 00 68 56 E9 14 16 
      PutItem(W02_RangedWeapon,Items);                                          //0034 : 1B C1 6F 00 00 01 78 F3 E8 14 00 68 56 E9 14 16 
      PutItem(W03_Shield,Items);                                                //0044 : 1B C1 6F 00 00 01 58 F4 E8 14 00 68 56 E9 14 16 
      PutItem(C01_Chest,Items);                                                 //0054 : 1B C1 6F 00 00 01 D0 F4 E8 14 00 68 56 E9 14 16 
      PutItem(C02_LeftGlove,Items);                                             //0064 : 1B C1 6F 00 00 01 C0 F5 E8 14 00 68 56 E9 14 16 
      PutItem(C03_RightGlove,Items);                                            //0074 : 1B C1 6F 00 00 01 38 F6 E8 14 00 68 56 E9 14 16 
      PutItem(C04_Pants,Items);                                                 //0084 : 1B C1 6F 00 00 01 B0 F6 E8 14 00 68 56 E9 14 16 
      PutItem(C05_Shoes,Items);                                                 //0094 : 1B C1 6F 00 00 01 28 F7 E8 14 00 68 56 E9 14 16 
      PutItem(A01_Helmet,Items);                                                //00A4 : 1B C1 6F 00 00 01 A0 F7 E8 14 00 68 56 E9 14 16 
      PutItem(A02_RightShoulder,Items);                                         //00B4 : 1B C1 6F 00 00 01 18 F8 E8 14 00 68 56 E9 14 16 
      PutItem(A03_LeftShoulder,Items);                                          //00C4 : 1B C1 6F 00 00 01 90 F8 E8 14 00 68 56 E9 14 16 
      PutItem(A04_RightGauntlet,Items);                                         //00D4 : 1B C1 6F 00 00 01 08 F9 E8 14 00 68 56 E9 14 16 
      PutItem(A05_LeftGauntlet,Items);                                          //00E4 : 1B C1 6F 00 00 01 80 F9 E8 14 00 68 56 E9 14 16 
      PutItem(A06_ChestArmour,Items);                                           //00F4 : 1B C1 6F 00 00 01 F8 F9 E8 14 00 68 56 E9 14 16 
      PutItem(A07_Belt,Items);                                                  //0104 : 1B C1 6F 00 00 01 70 FA E8 14 00 68 56 E9 14 16 
      PutItem(A08_LeftThigh,Items);                                             //0114 : 1B C1 6F 00 00 01 E8 FA E8 14 00 68 56 E9 14 16 
      PutItem(A09_RightThigh,Items);                                            //0124 : 1B C1 6F 00 00 01 60 FB E8 14 00 68 56 E9 14 16 
      PutItem(A10_LeftShin,Items);                                              //0134 : 1B C1 6F 00 00 01 D8 FB E8 14 00 68 56 E9 14 16 
      PutItem(A11_RightShin,Items);                                             //0144 : 1B C1 6F 00 00 01 50 FC E8 14 00 68 56 E9 14 16 
      PutItem(J01_LeftRing,Items);                                              //0154 : 1B C1 6F 00 00 01 C8 FC E8 14 00 68 56 E9 14 16 
      PutItem(J02_RightRing,Items);                                             //0164 : 1B C1 6F 00 00 01 40 FD E8 14 00 68 56 E9 14 16 
      PutItem(J03_Necklace,Items);                                              //0174 : 1B C1 6F 00 00 01 B8 FD E8 14 00 68 56 E9 14 16 
      itemManager.InitializeArray(Items,ClothColor1,ClothColor2,ArmorColor1,ArmorColor2);//0184 : 19 00 F0 55 E9 14 1F 00 00 1C 88 CF 35 11 00 68 56 E9 14 01 E0 56 E9 14 01 58 57 E9 14 01 D0 57 E9 14 01 48 58 E9 14 16 
    }
    //0F 00 F0 55 E9 14 2E A0 60 60 01 19 00 00 53 E9 14 05 00 04 01 B0 2D 19 11 07 AC 01 77 00 F0 55 
    //E9 14 2A 16 1B C1 6F 00 00 01 00 F3 E8 14 00 68 56 E9 14 16 1B C1 6F 00 00 01 78 F3 E8 14 00 68 
    //56 E9 14 16 1B C1 6F 00 00 01 58 F4 E8 14 00 68 56 E9 14 16 1B C1 6F 00 00 01 D0 F4 E8 14 00 68 
    //56 E9 14 16 1B C1 6F 00 00 01 C0 F5 E8 14 00 68 56 E9 14 16 1B C1 6F 00 00 01 38 F6 E8 14 00 68 
    //56 E9 14 16 1B C1 6F 00 00 01 B0 F6 E8 14 00 68 56 E9 14 16 1B C1 6F 00 00 01 28 F7 E8 14 00 68 
    //56 E9 14 16 1B C1 6F 00 00 01 A0 F7 E8 14 00 68 56 E9 14 16 1B C1 6F 00 00 01 18 F8 E8 14 00 68 
    //56 E9 14 16 1B C1 6F 00 00 01 90 F8 E8 14 00 68 56 E9 14 16 1B C1 6F 00 00 01 08 F9 E8 14 00 68 
    //56 E9 14 16 1B C1 6F 00 00 01 80 F9 E8 14 00 68 56 E9 14 16 1B C1 6F 00 00 01 F8 F9 E8 14 00 68 
    //56 E9 14 16 1B C1 6F 00 00 01 70 FA E8 14 00 68 56 E9 14 16 1B C1 6F 00 00 01 E8 FA E8 14 00 68 
    //56 E9 14 16 1B C1 6F 00 00 01 60 FB E8 14 00 68 56 E9 14 16 1B C1 6F 00 00 01 D8 FB E8 14 00 68 
    //56 E9 14 16 1B C1 6F 00 00 01 50 FC E8 14 00 68 56 E9 14 16 1B C1 6F 00 00 01 C8 FC E8 14 00 68 
    //56 E9 14 16 1B C1 6F 00 00 01 40 FD E8 14 00 68 56 E9 14 16 1B C1 6F 00 00 01 B8 FD E8 14 00 68 
    //56 E9 14 16 19 00 F0 55 E9 14 1F 00 00 1C 88 CF 35 11 00 68 56 E9 14 01 E0 56 E9 14 01 58 57 E9 
    //14 01 D0 57 E9 14 01 48 58 E9 14 16 04 0B 47 
  }


  protected function PutItem(export editinline Item_Type aItem,out array<Item_Type> oItems) {
    if (aItem != None) {                                                        //0000 : 07 1D 00 77 00 38 59 E9 14 2A 16 
      oItems[oItems.Length] = aItem;                                            //000B : 0F 10 37 00 B0 59 E9 14 00 B0 59 E9 14 00 38 59 E9 14 
    }
    //07 1D 00 77 00 38 59 E9 14 2A 16 0F 10 37 00 B0 59 E9 14 00 B0 59 E9 14 00 38 59 E9 14 04 0B 47 
    //
  }



