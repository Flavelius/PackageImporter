//==============================================================================
//  NE_SlotsBase
//==============================================================================

class NE_SlotsBase extends NPC_Equipment
    native
    exportstructs
    collapsecategories
    dependsOn()
  ;

  struct NE_ItemColor {
      var (NE_ItemColor) int Color1;
      var (NE_ItemColor) int Color2;

  };


  var (Equipment) export editinline Item_Type W01_MeleeWeapon;
  var (Equipment) export editinline Item_Type W02_RangedWeapon;
  var (Equipment) export editinline Item_WeaponShield W03_Shield;
  var (Equipment) export editinline Item_ClothChest C01_Chest;
  var (Equipment) export editinline Item_ClothLeftGlove C02_LeftGlove;
  var (Equipment) export editinline Item_ClothRightGlove C03_RightGlove;
  var (Equipment) export editinline Item_ClothPants C04_Pants;
  var (Equipment) export editinline Item_ClothShoes C05_Shoes;
  var (Equipment) export editinline Item_ArmorHeadGear A01_Helmet;
  var (Equipment) export editinline Item_ArmorRightShoulder A02_RightShoulder;
  var (Equipment) export editinline Item_ArmorLeftShoulder A03_LeftShoulder;
  var (Equipment) export editinline Item_ArmorRightGauntlet A04_RightGauntlet;
  var (Equipment) export editinline Item_ArmorLeftGauntlet A05_LeftGauntlet;
  var (Equipment) export editinline Item_ArmorChest A06_ChestArmour;
  var (Equipment) export editinline Item_ArmorBelt A07_Belt;
  var (Equipment) export editinline Item_ArmorLeftThigh A08_LeftThigh;
  var (Equipment) export editinline Item_ArmorRightThigh A09_RightThigh;
  var (Equipment) export editinline Item_ArmorLeftShin A10_LeftShin;
  var (Equipment) export editinline Item_ArmorRightShin A11_RightShin;
  var (Equipment) export editinline Item_JewelryRing J01_LeftRing;
  var (Equipment) export editinline Item_JewelryRing J02_RightRing;
  var (Equipment) export editinline Item_JewelryNecklace J03_Necklace;



