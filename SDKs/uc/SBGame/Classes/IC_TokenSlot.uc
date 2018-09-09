//==============================================================================
//  IC_TokenSlot
//==============================================================================

class IC_TokenSlot extends Item_Component
    native
    exportstructs
    editinlinenew
    dependsOn(Game_Item)
  ;

  enum ESigilSlotType {
    SST_None ,
    SST_Weapon_1 ,
    SST_Weapon_2 ,
    SST_Weapon_3 ,
    SST_Weapon_PVP ,
    SST_Weapon_Ranged ,
    SST_Armor_1 ,
    SST_Armor_2 ,
    SST_Armor_3 ,
    SST_Jewelry_Exclusive 
  };

  struct TokenSlot {
      var (TokenSlot) int rank;
      var (TokenSlot) byte SlotType;

  };


  var (TokenSlot) const array<TokenSlot> slots;


  static event string GetSlotTypeBackground(byte aSlotType) {
    switch (aSlotType) {                                                        //0000 : 05 01 00 A8 FB 39 11 
      case 1 :                                                                  //0007 : 0A 1C 00 24 01 
        return "Weapon_1_Slot";                                                 //000C : 04 1F 57 65 61 70 6F 6E 5F 31 5F 53 6C 6F 74 00 
      case 2 :                                                                  //001C : 0A 31 00 24 02 
        return "Weapon_2_Slot";                                                 //0021 : 04 1F 57 65 61 70 6F 6E 5F 32 5F 53 6C 6F 74 00 
      case 3 :                                                                  //0031 : 0A 46 00 24 03 
        return "Weapon_3_Slot";                                                 //0036 : 04 1F 57 65 61 70 6F 6E 5F 33 5F 53 6C 6F 74 00 
      case 4 :                                                                  //0046 : 0A 5B 00 24 04 
        return "Weapon_3_Slot";                                                 //004B : 04 1F 57 65 61 70 6F 6E 5F 33 5F 53 6C 6F 74 00 
      case 5 :                                                                  //005B : 0A 75 00 24 05 
        return "Weapon_Ranged_Slot";                                            //0060 : 04 1F 57 65 61 70 6F 6E 5F 52 61 6E 67 65 64 5F 53 6C 6F 74 00 
      case 6 :                                                                  //0075 : 0A 89 00 24 06 
        return "Armor_1_Slot";                                                  //007A : 04 1F 41 72 6D 6F 72 5F 31 5F 53 6C 6F 74 00 
      case 7 :                                                                  //0089 : 0A 9D 00 24 07 
        return "Armor_2_Slot";                                                  //008E : 04 1F 41 72 6D 6F 72 5F 32 5F 53 6C 6F 74 00 
      case 8 :                                                                  //009D : 0A B1 00 24 08 
        return "Armor_3_Slot";                                                  //00A2 : 04 1F 41 72 6D 6F 72 5F 33 5F 53 6C 6F 74 00 
      case 9 :                                                                  //00B1 : 0A CE 00 24 09 
        return "Jewelry_Exlusive_Slot";                                         //00B6 : 04 1F 4A 65 77 65 6C 72 79 5F 45 78 6C 75 73 69 76 65 5F 53 6C 6F 74 00 
      default:                                                                  //00CE : 0A FF FF 
        return "";                                                              //00D1 : 04 1F 00 
      }
    }
    //05 01 00 A8 FB 39 11 0A 1C 00 24 01 04 1F 57 65 61 70 6F 6E 5F 31 5F 53 6C 6F 74 00 0A 31 00 24 
    //02 04 1F 57 65 61 70 6F 6E 5F 32 5F 53 6C 6F 74 00 0A 46 00 24 03 04 1F 57 65 61 70 6F 6E 5F 33 
    //5F 53 6C 6F 74 00 0A 5B 00 24 04 04 1F 57 65 61 70 6F 6E 5F 33 5F 53 6C 6F 74 00 0A 75 00 24 05 
    //04 1F 57 65 61 70 6F 6E 5F 52 61 6E 67 65 64 5F 53 6C 6F 74 00 0A 89 00 24 06 04 1F 41 72 6D 6F 
    //72 5F 31 5F 53 6C 6F 74 00 0A 9D 00 24 07 04 1F 41 72 6D 6F 72 5F 32 5F 53 6C 6F 74 00 0A B1 00 
    //24 08 04 1F 41 72 6D 6F 72 5F 33 5F 53 6C 6F 74 00 0A CE 00 24 09 04 1F 4A 65 77 65 6C 72 79 5F 
    //45 78 6C 75 73 69 76 65 5F 53 6C 6F 74 00 0A FF FF 04 1F 00 04 0B 47 
  }


  event OnUnequip(Game_Pawn aPawn,Game_Item aItem) {
    if (aItem != None && IsServer()) {                                          //0000 : 07 25 00 82 77 00 70 FF 39 11 2A 16 18 07 00 1B FF 0B 00 00 16 16 
      aItem.sv_StopTokens();                                                    //0016 : 19 00 70 FF 39 11 06 00 00 1C 50 32 2C 11 16 
    }
    //07 25 00 82 77 00 70 FF 39 11 2A 16 18 07 00 1B FF 0B 00 00 16 16 19 00 70 FF 39 11 06 00 00 1C 
    //50 32 2C 11 16 04 0B 47 
  }


  event OnEquip(Game_Pawn aPawn,Game_Item aItem) {
    if (aItem != None && IsServer()) {                                          //0000 : 07 25 00 82 77 00 38 01 3A 11 2A 16 18 07 00 1B FF 0B 00 00 16 16 
      aItem.sv_StartTokens();                                                   //0016 : 19 00 38 01 3A 11 06 00 00 1C 28 34 2C 11 16 
    }
    //07 25 00 82 77 00 38 01 3A 11 2A 16 18 07 00 1B FF 0B 00 00 16 16 19 00 38 01 3A 11 06 00 00 1C 
    //28 34 2C 11 16 04 0B 47 
  }



