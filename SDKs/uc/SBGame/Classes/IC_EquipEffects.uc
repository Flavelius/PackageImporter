//==============================================================================
//  IC_EquipEffects
//==============================================================================

class IC_EquipEffects extends Item_Component
    native
    editinlinenew
    dependsOn(Game_Pawn,Game_ShiftableAppearance,Game_ItemManager,Game_Item,Item_Type,Game_EquippedAppearance,Game_Skills,FSkill_Event_Duff)
  ;

  enum EEquipTattooBodyPart {
    ETBP_Torso ,
    ETBP_LeftArm ,
    ETBP_RightArm ,
    ETBP_Head 
  };

  enum EEquipTattooSet {
    ETS_None ,
    ETS_BloodWarrior1 ,
    ETS_BloodWarrior2 ,
    ETS_BloodWarrior3 ,
    ETS_BloodWarrior4 ,
    ETS_RuneMage1 ,
    ETS_RuneMage2 ,
    ETS_RuneMage3 ,
    ETS_RuneMage4 
  };

  var (OnEquip) const export editinline FSkill_Event_Duff EquipDuffEvent;
  var (OnEquip) byte EquipTattooSet;
  var (OnEquip) byte EquipTattooBodyPart;


  private function UpdateClassTattoo(Game_Pawn aPawn,optional Game_Item aIgnoreItem) {
    local int i;
    local int newTattooSet;
    local export editinline IC_EquipEffects otherEquipEffects;
    local export editinline Game_EquippedAppearance Appearance;
    local Game_Item Item;
    local export editinline Game_ItemManager itemManager;
    local array<Game_Item> tattooItems;
    if (aPawn.Appearance != None) {                                             //0000 : 07 70 01 77 19 00 58 51 38 11 05 00 04 01 A8 83 18 11 2A 16 
      Appearance = Game_EquippedAppearance(aPawn.Appearance.GetBase());         //0014 : 0F 00 F8 53 38 11 2E 70 B8 5F 01 19 19 00 58 51 38 11 05 00 04 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 
      if (Appearance != None) {                                                 //0037 : 07 70 01 77 00 F8 53 38 11 2A 16 
        newTattooSet = 0;                                                       //0042 : 0F 00 70 54 38 11 25 
        itemManager = aPawn.itemManager;                                        //0049 : 0F 00 E8 54 38 11 19 00 58 51 38 11 05 00 04 01 B0 2D 19 11 
        if (itemManager != None) {                                              //005D : 07 46 01 77 00 E8 54 38 11 2A 16 
          tattooItems = itemManager.GetItems(3);                                //0068 : 0F 00 60 55 38 11 19 00 E8 54 38 11 08 00 00 1B 02 0D 00 00 24 03 16 
          i = 0;                                                                //007F : 0F 00 D8 55 38 11 25 
          while (i < tattooItems.Length) {                                      //0086 : 07 46 01 96 00 D8 55 38 11 37 00 60 55 38 11 16 
            Item = tattooItems[i];                                              //0096 : 0F 00 50 56 38 11 10 00 D8 55 38 11 00 60 55 38 11 
            if (Item != None && Item != aIgnoreItem) {                          //00A7 : 07 3C 01 82 77 00 50 56 38 11 2A 16 18 0D 00 77 00 50 56 38 11 00 C8 56 38 11 16 16 
              otherEquipEffects = Item.Type.GetEquipEffectsTokenComponent();    //00C3 : 0F 00 40 57 38 11 19 19 00 50 56 38 11 05 00 04 01 98 2F 22 11 06 00 04 1C E8 9C 1A 11 16 
              if (otherEquipEffects != None) {                                  //00E1 : 07 3C 01 77 00 40 57 38 11 2A 16 
                if (otherEquipEffects.EquipTattooSet != 0
                  && otherEquipEffects.EquipTattooBodyPart == EquipTattooBodyPart) {//00EC : 07 3C 01 82 9B 39 3A 19 00 40 57 38 11 05 00 01 01 B8 57 38 11 39 3A 24 00 16 18 1A 00 9A 39 3A 19 00 40 57 38 11 05 00 01 01 30 58 38 11 39 3A 01 30 58 38 11 16 16 
                  newTattooSet = otherEquipEffects.EquipTattooSet;              //0123 : 0F 00 70 54 38 11 39 3A 19 00 40 57 38 11 05 00 01 01 B8 57 38 11 
                  goto jl0146;                                                  //0139 : 06 46 01 
                }
              }
            }
            ++i;                                                                //013C : A3 00 D8 55 38 11 16 
          }
        }
        Appearance.SetValue(24,newTattooSet,EquipTattooBodyPart);               //0146 : 19 00 F8 53 38 11 12 00 00 1B 37 0C 00 00 24 18 00 70 54 38 11 01 30 58 38 11 16 
        Appearance.Apply();                                                     //0161 : 19 00 F8 53 38 11 06 00 00 1C A0 3B 21 11 16 
      }
    }
    //07 70 01 77 19 00 58 51 38 11 05 00 04 01 A8 83 18 11 2A 16 0F 00 F8 53 38 11 2E 70 B8 5F 01 19 
    //19 00 58 51 38 11 05 00 04 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 07 70 01 77 00 F8 53 38 11 
    //2A 16 0F 00 70 54 38 11 25 0F 00 E8 54 38 11 19 00 58 51 38 11 05 00 04 01 B0 2D 19 11 07 46 01 
    //77 00 E8 54 38 11 2A 16 0F 00 60 55 38 11 19 00 E8 54 38 11 08 00 00 1B 02 0D 00 00 24 03 16 0F 
    //00 D8 55 38 11 25 07 46 01 96 00 D8 55 38 11 37 00 60 55 38 11 16 0F 00 50 56 38 11 10 00 D8 55 
    //38 11 00 60 55 38 11 07 3C 01 82 77 00 50 56 38 11 2A 16 18 0D 00 77 00 50 56 38 11 00 C8 56 38 
    //11 16 16 0F 00 40 57 38 11 19 19 00 50 56 38 11 05 00 04 01 98 2F 22 11 06 00 04 1C E8 9C 1A 11 
    //16 07 3C 01 77 00 40 57 38 11 2A 16 07 3C 01 82 9B 39 3A 19 00 40 57 38 11 05 00 01 01 B8 57 38 
    //11 39 3A 24 00 16 18 1A 00 9A 39 3A 19 00 40 57 38 11 05 00 01 01 30 58 38 11 39 3A 01 30 58 38 
    //11 16 16 0F 00 70 54 38 11 39 3A 19 00 40 57 38 11 05 00 01 01 B8 57 38 11 06 46 01 A3 00 D8 55 
    //38 11 16 06 86 00 19 00 F8 53 38 11 12 00 00 1B 37 0C 00 00 24 18 00 70 54 38 11 01 30 58 38 11 
    //16 19 00 F8 53 38 11 06 00 00 1C A0 3B 21 11 16 04 0B 47 
  }


  event OnUnequip(Game_Pawn aPawn,Game_Item aItem) {
    if (IsServer() && EquipDuffEvent != None) {                                 //0000 : 07 47 00 82 1B FF 0B 00 00 16 18 09 00 77 01 08 5B 38 11 2A 16 16 
      if (aPawn.Skills != None) {                                               //0016 : 07 47 00 77 19 00 D0 59 38 11 05 00 04 01 08 28 18 11 2A 16 
        aPawn.Skills.sv_RemoveSpecialDuffEvent(EquipDuffEvent);                 //002A : 19 19 00 D0 59 38 11 05 00 04 01 08 28 18 11 0B 00 00 1C C8 34 23 11 01 08 5B 38 11 16 
      }
    }
    if (EquipTattooSet != 0) {                                                  //0047 : 07 67 00 9B 39 3A 01 B8 57 38 11 39 3A 24 00 16 
      UpdateClassTattoo(aPawn,aItem);                                           //0057 : 1B 9D 0D 00 00 00 D0 59 38 11 00 80 5B 38 11 16 
    }
    //07 47 00 82 1B FF 0B 00 00 16 18 09 00 77 01 08 5B 38 11 2A 16 16 07 47 00 77 19 00 D0 59 38 11 
    //05 00 04 01 08 28 18 11 2A 16 19 19 00 D0 59 38 11 05 00 04 01 08 28 18 11 0B 00 00 1C C8 34 23 
    //11 01 08 5B 38 11 16 07 67 00 9B 39 3A 01 B8 57 38 11 39 3A 24 00 16 1B 9D 0D 00 00 00 D0 59 38 
    //11 00 80 5B 38 11 16 04 0B 47 
  }


  event OnEquip(Game_Pawn aPawn,Game_Item aItem) {
    if (IsServer() && EquipDuffEvent != None) {                                 //0000 : 07 58 00 82 1B FF 0B 00 00 16 18 09 00 77 01 08 5B 38 11 2A 16 16 
      EquipDuffEvent.RunUntilAbort = True;                                      //0016 : 14 19 01 08 5B 38 11 06 00 04 2D 01 18 EF 25 11 27 
      if (aPawn.Skills != None) {                                               //0027 : 07 58 00 77 19 00 F8 5B 38 11 05 00 04 01 08 28 18 11 2A 16 
        aPawn.Skills.sv_AddSpecialDuffEvent(EquipDuffEvent);                    //003B : 19 19 00 F8 5B 38 11 05 00 04 01 08 28 18 11 0B 00 00 1C F0 37 23 11 01 08 5B 38 11 16 
      }
    }
    if (EquipTattooSet != 0) {                                                  //0058 : 07 73 00 9B 39 3A 01 B8 57 38 11 39 3A 24 00 16 
      UpdateClassTattoo(aPawn);                                                 //0068 : 1B 9D 0D 00 00 00 F8 5B 38 11 16 
    }
    //07 58 00 82 1B FF 0B 00 00 16 18 09 00 77 01 08 5B 38 11 2A 16 16 14 19 01 08 5B 38 11 06 00 04 
    //2D 01 18 EF 25 11 27 07 58 00 77 19 00 F8 5B 38 11 05 00 04 01 08 28 18 11 2A 16 19 19 00 F8 5B 
    //38 11 05 00 04 01 08 28 18 11 0B 00 00 1C F0 37 23 11 01 08 5B 38 11 16 07 73 00 9B 39 3A 01 B8 
    //57 38 11 39 3A 24 00 16 1B 9D 0D 00 00 00 F8 5B 38 11 16 04 0B 47 
  }



