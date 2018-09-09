//==============================================================================
//  NE_SlotsFullColor
//==============================================================================

class NE_SlotsFullColor extends NE_SlotsBase
    native
    exportstructs
    collapsecategories
    dependsOn(Game_Pawn,Game_NPCItemManager)
  ;

  var (Equipment) NE_ItemColor W01_MeleeWeaponColor;
  var (Equipment) NE_ItemColor W02_RangedWeaponColor;
  var (Equipment) NE_ItemColor W03_ShieldColor;
  var (Equipment) NE_ItemColor C01_ChestColor;
  var (Equipment) NE_ItemColor C02_LeftGloveColor;
  var (Equipment) NE_ItemColor C03_RightGloveColor;
  var (Equipment) NE_ItemColor C04_PantsColor;
  var (Equipment) NE_ItemColor C05_ShoesColor;
  var (Equipment) transient NE_ItemColor C_AllClothing;
  var (Equipment) NE_ItemColor A01_HelmetColor;
  var (Equipment) NE_ItemColor A02_RightShoulderColor;
  var (Equipment) NE_ItemColor A03_LeftShoulderColor;
  var (Equipment) NE_ItemColor A04_RightGauntletColor;
  var (Equipment) NE_ItemColor A05_LeftGauntletColor;
  var (Equipment) NE_ItemColor A06_ChestArmourColor;
  var (Equipment) NE_ItemColor A07_BeltColor;
  var (Equipment) NE_ItemColor A08_LeftThighColor;
  var (Equipment) NE_ItemColor A09_RightThighColor;
  var (Equipment) NE_ItemColor A10_LeftShinColor;
  var (Equipment) NE_ItemColor A11_RightShinColor;
  var (Equipment) transient NE_ItemColor A_AllArmour;


  function Apply(Game_Pawn aPawn) {
    local export editinline Game_NPCItemManager itemManager;
    itemManager = Game_NPCItemManager(aPawn.itemManager);                       //0000 : 0F 00 40 46 E9 14 2E A0 60 60 01 19 00 88 40 E9 14 05 00 04 01 B0 2D 19 11 
    if (itemManager != None) {                                                  //0019 : 07 B0 03 77 00 40 46 E9 14 2A 16 
      itemManager.InitializeSingleItem(W01_MeleeWeapon,W01_MeleeWeaponColor.Color1,W01_MeleeWeaponColor.Color2);//0024 : 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 00 F3 E8 14 39 3D 36 30 FE E8 14 01 10 40 E9 14 39 3D 36 A8 FE E8 14 01 10 40 E9 14 16 
      itemManager.InitializeSingleItem(W02_RangedWeapon,W02_RangedWeaponColor.Color1,W02_RangedWeaponColor.Color2);//0050 : 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 78 F3 E8 14 39 3D 36 30 FE E8 14 01 B8 46 E9 14 39 3D 36 A8 FE E8 14 01 B8 46 E9 14 16 
      itemManager.InitializeSingleItem(W03_Shield,W03_ShieldColor.Color1,W03_ShieldColor.Color2);//007C : 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 58 F4 E8 14 39 3D 36 30 FE E8 14 01 30 47 E9 14 39 3D 36 A8 FE E8 14 01 30 47 E9 14 16 
      itemManager.InitializeSingleItem(C01_Chest,C01_ChestColor.Color1,C01_ChestColor.Color2);//00A8 : 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 D0 F4 E8 14 39 3D 36 30 FE E8 14 01 A8 47 E9 14 39 3D 36 A8 FE E8 14 01 A8 47 E9 14 16 
      itemManager.InitializeSingleItem(C02_LeftGlove,C02_LeftGloveColor.Color1,C02_LeftGloveColor.Color2);//00D4 : 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 C0 F5 E8 14 39 3D 36 30 FE E8 14 01 20 48 E9 14 39 3D 36 A8 FE E8 14 01 20 48 E9 14 16 
      itemManager.InitializeSingleItem(C03_RightGlove,C03_RightGloveColor.Color1,C03_RightGloveColor.Color2);//0100 : 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 38 F6 E8 14 39 3D 36 30 FE E8 14 01 98 48 E9 14 39 3D 36 A8 FE E8 14 01 98 48 E9 14 16 
      itemManager.InitializeSingleItem(C04_Pants,C04_PantsColor.Color1,C04_PantsColor.Color2);//012C : 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 B0 F6 E8 14 39 3D 36 30 FE E8 14 01 10 49 E9 14 39 3D 36 A8 FE E8 14 01 10 49 E9 14 16 
      itemManager.InitializeSingleItem(C05_Shoes,C05_ShoesColor.Color1,C05_ShoesColor.Color2);//0158 : 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 28 F7 E8 14 39 3D 36 30 FE E8 14 01 88 49 E9 14 39 3D 36 A8 FE E8 14 01 88 49 E9 14 16 
      itemManager.InitializeSingleItem(A01_Helmet,A01_HelmetColor.Color1,A01_HelmetColor.Color2);//0184 : 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 A0 F7 E8 14 39 3D 36 30 FE E8 14 01 00 4A E9 14 39 3D 36 A8 FE E8 14 01 00 4A E9 14 16 
      itemManager.InitializeSingleItem(A02_RightShoulder,A02_RightShoulderColor.Color1,A02_RightShoulderColor.Color2);//01B0 : 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 18 F8 E8 14 39 3D 36 30 FE E8 14 01 78 4A E9 14 39 3D 36 A8 FE E8 14 01 78 4A E9 14 16 
      itemManager.InitializeSingleItem(A03_LeftShoulder,A03_LeftShoulderColor.Color1,A03_LeftShoulderColor.Color2);//01DC : 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 90 F8 E8 14 39 3D 36 30 FE E8 14 01 F0 4A E9 14 39 3D 36 A8 FE E8 14 01 F0 4A E9 14 16 
      itemManager.InitializeSingleItem(A04_RightGauntlet,A04_RightGauntletColor.Color1,A04_RightGauntletColor.Color2);//0208 : 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 08 F9 E8 14 39 3D 36 30 FE E8 14 01 68 4B E9 14 39 3D 36 A8 FE E8 14 01 68 4B E9 14 16 
      itemManager.InitializeSingleItem(A05_LeftGauntlet,A05_LeftGauntletColor.Color1,A05_LeftGauntletColor.Color2);//0234 : 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 80 F9 E8 14 39 3D 36 30 FE E8 14 01 E0 4B E9 14 39 3D 36 A8 FE E8 14 01 E0 4B E9 14 16 
      itemManager.InitializeSingleItem(A06_ChestArmour,A06_ChestArmourColor.Color1,A06_ChestArmourColor.Color2);//0260 : 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 F8 F9 E8 14 39 3D 36 30 FE E8 14 01 58 4C E9 14 39 3D 36 A8 FE E8 14 01 58 4C E9 14 16 
      itemManager.InitializeSingleItem(A07_Belt,A07_BeltColor.Color1,A07_BeltColor.Color2);//028C : 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 70 FA E8 14 39 3D 36 30 FE E8 14 01 D0 4C E9 14 39 3D 36 A8 FE E8 14 01 D0 4C E9 14 16 
      itemManager.InitializeSingleItem(A08_LeftThigh,A08_LeftThighColor.Color1,A08_LeftThighColor.Color2);//02B8 : 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 E8 FA E8 14 39 3D 36 30 FE E8 14 01 48 4D E9 14 39 3D 36 A8 FE E8 14 01 48 4D E9 14 16 
      itemManager.InitializeSingleItem(A09_RightThigh,A09_RightThighColor.Color1,A09_RightThighColor.Color2);//02E4 : 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 60 FB E8 14 39 3D 36 30 FE E8 14 01 C0 4D E9 14 39 3D 36 A8 FE E8 14 01 C0 4D E9 14 16 
      itemManager.InitializeSingleItem(A10_LeftShin,A10_LeftShinColor.Color1,A10_LeftShinColor.Color2);//0310 : 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 D8 FB E8 14 39 3D 36 30 FE E8 14 01 38 4E E9 14 39 3D 36 A8 FE E8 14 01 38 4E E9 14 16 
      itemManager.InitializeSingleItem(A11_RightShin,A11_RightShinColor.Color1,A11_RightShinColor.Color2);//033C : 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 50 FC E8 14 39 3D 36 30 FE E8 14 01 B0 4E E9 14 39 3D 36 A8 FE E8 14 01 B0 4E E9 14 16 
      itemManager.InitializeSingleItem(J01_LeftRing,0,0);                       //0368 : 19 00 40 46 E9 14 0F 00 00 1C D8 CE 35 11 01 C8 FC E8 14 24 00 24 00 16 
      itemManager.InitializeSingleItem(J02_RightRing,0,0);                      //0380 : 19 00 40 46 E9 14 0F 00 00 1C D8 CE 35 11 01 40 FD E8 14 24 00 24 00 16 
      itemManager.InitializeSingleItem(J03_Necklace,0,0);                       //0398 : 19 00 40 46 E9 14 0F 00 00 1C D8 CE 35 11 01 B8 FD E8 14 24 00 24 00 16 
    }
    //0F 00 40 46 E9 14 2E A0 60 60 01 19 00 88 40 E9 14 05 00 04 01 B0 2D 19 11 07 B0 03 77 00 40 46 
    //E9 14 2A 16 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 00 F3 E8 14 39 3D 36 30 FE E8 14 01 10 
    //40 E9 14 39 3D 36 A8 FE E8 14 01 10 40 E9 14 16 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 78 
    //F3 E8 14 39 3D 36 30 FE E8 14 01 B8 46 E9 14 39 3D 36 A8 FE E8 14 01 B8 46 E9 14 16 19 00 40 46 
    //E9 14 23 00 00 1C D8 CE 35 11 01 58 F4 E8 14 39 3D 36 30 FE E8 14 01 30 47 E9 14 39 3D 36 A8 FE 
    //E8 14 01 30 47 E9 14 16 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 D0 F4 E8 14 39 3D 36 30 FE 
    //E8 14 01 A8 47 E9 14 39 3D 36 A8 FE E8 14 01 A8 47 E9 14 16 19 00 40 46 E9 14 23 00 00 1C D8 CE 
    //35 11 01 C0 F5 E8 14 39 3D 36 30 FE E8 14 01 20 48 E9 14 39 3D 36 A8 FE E8 14 01 20 48 E9 14 16 
    //19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 38 F6 E8 14 39 3D 36 30 FE E8 14 01 98 48 E9 14 39 
    //3D 36 A8 FE E8 14 01 98 48 E9 14 16 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 B0 F6 E8 14 39 
    //3D 36 30 FE E8 14 01 10 49 E9 14 39 3D 36 A8 FE E8 14 01 10 49 E9 14 16 19 00 40 46 E9 14 23 00 
    //00 1C D8 CE 35 11 01 28 F7 E8 14 39 3D 36 30 FE E8 14 01 88 49 E9 14 39 3D 36 A8 FE E8 14 01 88 
    //49 E9 14 16 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 A0 F7 E8 14 39 3D 36 30 FE E8 14 01 00 
    //4A E9 14 39 3D 36 A8 FE E8 14 01 00 4A E9 14 16 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 18 
    //F8 E8 14 39 3D 36 30 FE E8 14 01 78 4A E9 14 39 3D 36 A8 FE E8 14 01 78 4A E9 14 16 19 00 40 46 
    //E9 14 23 00 00 1C D8 CE 35 11 01 90 F8 E8 14 39 3D 36 30 FE E8 14 01 F0 4A E9 14 39 3D 36 A8 FE 
    //E8 14 01 F0 4A E9 14 16 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 08 F9 E8 14 39 3D 36 30 FE 
    //E8 14 01 68 4B E9 14 39 3D 36 A8 FE E8 14 01 68 4B E9 14 16 19 00 40 46 E9 14 23 00 00 1C D8 CE 
    //35 11 01 80 F9 E8 14 39 3D 36 30 FE E8 14 01 E0 4B E9 14 39 3D 36 A8 FE E8 14 01 E0 4B E9 14 16 
    //19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 F8 F9 E8 14 39 3D 36 30 FE E8 14 01 58 4C E9 14 39 
    //3D 36 A8 FE E8 14 01 58 4C E9 14 16 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 70 FA E8 14 39 
    //3D 36 30 FE E8 14 01 D0 4C E9 14 39 3D 36 A8 FE E8 14 01 D0 4C E9 14 16 19 00 40 46 E9 14 23 00 
    //00 1C D8 CE 35 11 01 E8 FA E8 14 39 3D 36 30 FE E8 14 01 48 4D E9 14 39 3D 36 A8 FE E8 14 01 48 
    //4D E9 14 16 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 60 FB E8 14 39 3D 36 30 FE E8 14 01 C0 
    //4D E9 14 39 3D 36 A8 FE E8 14 01 C0 4D E9 14 16 19 00 40 46 E9 14 23 00 00 1C D8 CE 35 11 01 D8 
    //FB E8 14 39 3D 36 30 FE E8 14 01 38 4E E9 14 39 3D 36 A8 FE E8 14 01 38 4E E9 14 16 19 00 40 46 
    //E9 14 23 00 00 1C D8 CE 35 11 01 50 FC E8 14 39 3D 36 30 FE E8 14 01 B0 4E E9 14 39 3D 36 A8 FE 
    //E8 14 01 B0 4E E9 14 16 19 00 40 46 E9 14 0F 00 00 1C D8 CE 35 11 01 C8 FC E8 14 24 00 24 00 16 
    //19 00 40 46 E9 14 0F 00 00 1C D8 CE 35 11 01 40 FD E8 14 24 00 24 00 16 19 00 40 46 E9 14 0F 00 
    //00 1C D8 CE 35 11 01 B8 FD E8 14 24 00 24 00 16 04 0B 47 
  }



