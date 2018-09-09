//==============================================================================
//  NE_SlotsUniform
//==============================================================================

class NE_SlotsUniform extends NE_SlotsBase
    native
    collapsecategories
    dependsOn(Game_Pawn,Game_Character,NPC_Taxonomy,Game_NPCItemManager)
  ;


  function Apply(Game_Pawn aPawn) {
    local export editinline Game_NPCItemManager itemManager;
    local export editinline NPC_Taxonomy Faction;
    local int ClothColor1;
    local int ClothColor2;
    local int ArmorColor1;
    local int ArmorColor2;
    ClothColor1 = 0;                                                            //0000 : 0F 00 40 05 E9 14 25 
    ClothColor2 = 0;                                                            //0007 : 0F 00 B8 05 E9 14 25 
    ArmorColor1 = 0;                                                            //000E : 0F 00 30 06 E9 14 25 
    ArmorColor2 = 0;                                                            //0015 : 0F 00 A8 06 E9 14 25 
    Faction = aPawn.Character.GetFaction();                                     //001C : 0F 00 20 07 E9 14 19 19 00 90 FF E8 14 05 00 04 01 68 2E 34 0F 06 00 04 1B 6D 05 00 00 16 
    if (Faction != None) {                                                      //003A : 07 99 00 77 00 20 07 E9 14 2A 16 
      ClothColor1 = Faction.GetClothColor1();                                   //0045 : 0F 00 40 05 E9 14 19 00 20 07 E9 14 06 00 04 1B 58 10 00 00 16 
      ClothColor2 = Faction.GetClothColor2();                                   //005A : 0F 00 B8 05 E9 14 19 00 20 07 E9 14 06 00 04 1B 57 10 00 00 16 
      ArmorColor1 = Faction.GetArmorColor1();                                   //006F : 0F 00 30 06 E9 14 19 00 20 07 E9 14 06 00 04 1B 56 10 00 00 16 
      ArmorColor2 = Faction.GetArmorColor2();                                   //0084 : 0F 00 A8 06 E9 14 19 00 20 07 E9 14 06 00 04 1B 55 10 00 00 16 
    }
    itemManager = Game_NPCItemManager(aPawn.itemManager);                       //0099 : 0F 00 98 07 E9 14 2E A0 60 60 01 19 00 90 FF E8 14 05 00 04 01 B0 2D 19 11 
    if (itemManager != None) {                                                  //00B2 : 07 A9 03 77 00 98 07 E9 14 2A 16 
      itemManager.InitializeSingleItem(W01_MeleeWeapon,-1,-1);                  //00BD : 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 00 F3 E8 14 39 3D 1D FF FF FF FF 39 3D 1D FF FF FF FF 16 
      itemManager.InitializeSingleItem(W02_RangedWeapon,-1,-1);                 //00DF : 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 78 F3 E8 14 39 3D 1D FF FF FF FF 39 3D 1D FF FF FF FF 16 
      itemManager.InitializeSingleItem(W03_Shield,-1,-1);                       //0101 : 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 58 F4 E8 14 39 3D 1D FF FF FF FF 39 3D 1D FF FF FF FF 16 
      itemManager.InitializeSingleItem(C01_Chest,ClothColor1,ClothColor2);      //0123 : 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 D0 F4 E8 14 39 3D 00 40 05 E9 14 39 3D 00 B8 05 E9 14 16 
      itemManager.InitializeSingleItem(C02_LeftGlove,ClothColor1,ClothColor2);  //0145 : 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 C0 F5 E8 14 39 3D 00 40 05 E9 14 39 3D 00 B8 05 E9 14 16 
      itemManager.InitializeSingleItem(C03_RightGlove,ClothColor1,ClothColor2); //0167 : 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 38 F6 E8 14 39 3D 00 40 05 E9 14 39 3D 00 B8 05 E9 14 16 
      itemManager.InitializeSingleItem(C04_Pants,ClothColor1,ClothColor2);      //0189 : 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 B0 F6 E8 14 39 3D 00 40 05 E9 14 39 3D 00 B8 05 E9 14 16 
      itemManager.InitializeSingleItem(C05_Shoes,ClothColor1,ClothColor2);      //01AB : 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 28 F7 E8 14 39 3D 00 40 05 E9 14 39 3D 00 B8 05 E9 14 16 
      itemManager.InitializeSingleItem(A01_Helmet,ArmorColor1,ArmorColor2);     //01CD : 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 A0 F7 E8 14 39 3D 00 30 06 E9 14 39 3D 00 A8 06 E9 14 16 
      itemManager.InitializeSingleItem(A02_RightShoulder,ArmorColor1,ArmorColor2);//01EF : 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 18 F8 E8 14 39 3D 00 30 06 E9 14 39 3D 00 A8 06 E9 14 16 
      itemManager.InitializeSingleItem(A03_LeftShoulder,ArmorColor1,ArmorColor2);//0211 : 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 90 F8 E8 14 39 3D 00 30 06 E9 14 39 3D 00 A8 06 E9 14 16 
      itemManager.InitializeSingleItem(A04_RightGauntlet,ArmorColor1,ArmorColor2);//0233 : 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 08 F9 E8 14 39 3D 00 30 06 E9 14 39 3D 00 A8 06 E9 14 16 
      itemManager.InitializeSingleItem(A05_LeftGauntlet,ArmorColor1,ArmorColor2);//0255 : 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 80 F9 E8 14 39 3D 00 30 06 E9 14 39 3D 00 A8 06 E9 14 16 
      itemManager.InitializeSingleItem(A06_ChestArmour,ArmorColor1,ArmorColor2);//0277 : 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 F8 F9 E8 14 39 3D 00 30 06 E9 14 39 3D 00 A8 06 E9 14 16 
      itemManager.InitializeSingleItem(A07_Belt,ArmorColor1,ArmorColor2);       //0299 : 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 70 FA E8 14 39 3D 00 30 06 E9 14 39 3D 00 A8 06 E9 14 16 
      itemManager.InitializeSingleItem(A08_LeftThigh,ArmorColor1,ArmorColor2);  //02BB : 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 E8 FA E8 14 39 3D 00 30 06 E9 14 39 3D 00 A8 06 E9 14 16 
      itemManager.InitializeSingleItem(A09_RightThigh,ArmorColor1,ArmorColor2); //02DD : 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 60 FB E8 14 39 3D 00 30 06 E9 14 39 3D 00 A8 06 E9 14 16 
      itemManager.InitializeSingleItem(A10_LeftShin,ArmorColor1,ArmorColor2);   //02FF : 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 D8 FB E8 14 39 3D 00 30 06 E9 14 39 3D 00 A8 06 E9 14 16 
      itemManager.InitializeSingleItem(A11_RightShin,ArmorColor1,ArmorColor2);  //0321 : 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 50 FC E8 14 39 3D 00 30 06 E9 14 39 3D 00 A8 06 E9 14 16 
      itemManager.InitializeSingleItem(J01_LeftRing,-1,-1);                     //0343 : 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 C8 FC E8 14 39 3D 1D FF FF FF FF 39 3D 1D FF FF FF FF 16 
      itemManager.InitializeSingleItem(J02_RightRing,-1,-1);                    //0365 : 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 40 FD E8 14 39 3D 1D FF FF FF FF 39 3D 1D FF FF FF FF 16 
      itemManager.InitializeSingleItem(J03_Necklace,-1,-1);                     //0387 : 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 B8 FD E8 14 39 3D 1D FF FF FF FF 39 3D 1D FF FF FF FF 16 
    }
    //0F 00 40 05 E9 14 25 0F 00 B8 05 E9 14 25 0F 00 30 06 E9 14 25 0F 00 A8 06 E9 14 25 0F 00 20 07 
    //E9 14 19 19 00 90 FF E8 14 05 00 04 01 68 2E 34 0F 06 00 04 1B 6D 05 00 00 16 07 99 00 77 00 20 
    //07 E9 14 2A 16 0F 00 40 05 E9 14 19 00 20 07 E9 14 06 00 04 1B 58 10 00 00 16 0F 00 B8 05 E9 14 
    //19 00 20 07 E9 14 06 00 04 1B 57 10 00 00 16 0F 00 30 06 E9 14 19 00 20 07 E9 14 06 00 04 1B 56 
    //10 00 00 16 0F 00 A8 06 E9 14 19 00 20 07 E9 14 06 00 04 1B 55 10 00 00 16 0F 00 98 07 E9 14 2E 
    //A0 60 60 01 19 00 90 FF E8 14 05 00 04 01 B0 2D 19 11 07 A9 03 77 00 98 07 E9 14 2A 16 19 00 98 
    //07 E9 14 19 00 00 1C D8 CE 35 11 01 00 F3 E8 14 39 3D 1D FF FF FF FF 39 3D 1D FF FF FF FF 16 19 
    //00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 78 F3 E8 14 39 3D 1D FF FF FF FF 39 3D 1D FF FF FF FF 
    //16 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 58 F4 E8 14 39 3D 1D FF FF FF FF 39 3D 1D FF FF 
    //FF FF 16 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 D0 F4 E8 14 39 3D 00 40 05 E9 14 39 3D 00 
    //B8 05 E9 14 16 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 C0 F5 E8 14 39 3D 00 40 05 E9 14 39 
    //3D 00 B8 05 E9 14 16 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 38 F6 E8 14 39 3D 00 40 05 E9 
    //14 39 3D 00 B8 05 E9 14 16 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 B0 F6 E8 14 39 3D 00 40 
    //05 E9 14 39 3D 00 B8 05 E9 14 16 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 28 F7 E8 14 39 3D 
    //00 40 05 E9 14 39 3D 00 B8 05 E9 14 16 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 A0 F7 E8 14 
    //39 3D 00 30 06 E9 14 39 3D 00 A8 06 E9 14 16 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 18 F8 
    //E8 14 39 3D 00 30 06 E9 14 39 3D 00 A8 06 E9 14 16 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 
    //90 F8 E8 14 39 3D 00 30 06 E9 14 39 3D 00 A8 06 E9 14 16 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 
    //11 01 08 F9 E8 14 39 3D 00 30 06 E9 14 39 3D 00 A8 06 E9 14 16 19 00 98 07 E9 14 19 00 00 1C D8 
    //CE 35 11 01 80 F9 E8 14 39 3D 00 30 06 E9 14 39 3D 00 A8 06 E9 14 16 19 00 98 07 E9 14 19 00 00 
    //1C D8 CE 35 11 01 F8 F9 E8 14 39 3D 00 30 06 E9 14 39 3D 00 A8 06 E9 14 16 19 00 98 07 E9 14 19 
    //00 00 1C D8 CE 35 11 01 70 FA E8 14 39 3D 00 30 06 E9 14 39 3D 00 A8 06 E9 14 16 19 00 98 07 E9 
    //14 19 00 00 1C D8 CE 35 11 01 E8 FA E8 14 39 3D 00 30 06 E9 14 39 3D 00 A8 06 E9 14 16 19 00 98 
    //07 E9 14 19 00 00 1C D8 CE 35 11 01 60 FB E8 14 39 3D 00 30 06 E9 14 39 3D 00 A8 06 E9 14 16 19 
    //00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 D8 FB E8 14 39 3D 00 30 06 E9 14 39 3D 00 A8 06 E9 14 
    //16 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 50 FC E8 14 39 3D 00 30 06 E9 14 39 3D 00 A8 06 
    //E9 14 16 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 C8 FC E8 14 39 3D 1D FF FF FF FF 39 3D 1D 
    //FF FF FF FF 16 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 40 FD E8 14 39 3D 1D FF FF FF FF 39 
    //3D 1D FF FF FF FF 16 19 00 98 07 E9 14 19 00 00 1C D8 CE 35 11 01 B8 FD E8 14 39 3D 1D FF FF FF 
    //FF 39 3D 1D FF FF FF FF 16 04 0B 47 
  }



