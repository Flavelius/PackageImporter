//==============================================================================
//  GUI_Sounds
//==============================================================================

class GUI_Sounds extends Object
    dependsOn(Game_Item,Item_Type)
  ;

  var Sound CombatStart;
  var Sound RollToNextTier;
  var Sound ResetCombatbar;
  var Sound CannotActivateSkill;
  var Sound RotateSkillSelection;
  var Sound ChangeCombatSet;
  var Sound CombatbarAppears;
  var Sound CombatbarChange;
  var Sound ComboStart;
  var Sound ComboFollowUp;
  var Sound ComboFinish;
  var Sound ComboFinishKill;
  var Sound WindowFoldOut;
  var Sound WindowFoldIn;
  var Sound WindowOpen;
  var Sound WindowClose;
  var Sound ButtonPress;
  var Sound BoxCheck;
  var Sound WorldmapSwitch;
  var Sound LearnSkill;
  var Sound UpgradeSkill;
  var Sound MenuItemPickupDefault;
  var Sound MenuItemPickupFlask;
  var Sound MenuItemPickupMetalWeapon;
  var Sound MenuItemPickupWoodWeapon;
  var Sound MenuItemPickupClothing;
  var Sound MenuItemPickupArmor;
  var Sound MenuItemPickupSpell;
  var Sound MenuItemPickupMoney;
  var Sound MenuItemDrop;
  var Sound MenuItemDropMissed;
  var Sound Buy;
  var Sound Sell;
  var Sound Breakdown;
  var Sound CreateRecipe;
  var Sound CraftRecipe;
  var Sound ForgeButton;
  var Sound CraftSigil;
  var Sound RemoveSigil;
  var Sound DyeItem;
  var Sound SystemMessage;
  var Sound LevelIncrease;
  var Sound PepIncrease;
  var Sound FinishQuest;
  var Sound AcceptQuest;
  var Sound AbandonQuest;
  var Sound PrivateMessage;
  var Sound MailMessage;
  var Sound FriendOnline;
  var Sound GuildOnline;


  static function Sound GetDragSound(Game_Item Item) {
    if (Item == None) {                                                         //0000 : 07 11 00 72 00 50 79 A5 19 2A 16 
      return default.MenuItemPickupDefault;                                     //000B : 04 02 C8 1B A6 19 
    }
    switch (Item.Type.ItemType) {                                               //0011 : 05 01 19 19 00 50 79 A5 19 05 00 04 01 98 2F 22 11 05 00 01 01 10 30 22 11 
      case 14 :                                                                 //002A : 0A 38 00 24 0E 
        return default.MenuItemPickupWoodWeapon;                                //002F : 04 02 40 1C A6 19 
        break;                                                                  //0035 : 06 17 01 
      case 11 :                                                                 //0038 : 0A 3D 00 24 0B 
      case 12 :                                                                 //003D : 0A 42 00 24 0C 
      case 13 :                                                                 //0042 : 0A 47 00 24 0D 
      case 15 :                                                                 //0047 : 0A 55 00 24 0F 
        return default.MenuItemPickupMetalWeapon;                               //004C : 04 02 B8 1C A6 19 
        break;                                                                  //0052 : 06 17 01 
      case 16 :                                                                 //0055 : 0A 5A 00 24 10 
      case 17 :                                                                 //005A : 0A 5F 00 24 11 
      case 18 :                                                                 //005F : 0A 64 00 24 12 
      case 19 :                                                                 //0064 : 0A 69 00 24 13 
      case 20 :                                                                 //0069 : 0A 6E 00 24 14 
      case 21 :                                                                 //006E : 0A 73 00 24 15 
      case 22 :                                                                 //0073 : 0A 78 00 24 16 
      case 23 :                                                                 //0078 : 0A 7D 00 24 17 
      case 24 :                                                                 //007D : 0A 82 00 24 18 
      case 34 :                                                                 //0082 : 0A 87 00 24 22 
      case 35 :                                                                 //0087 : 0A 95 00 24 23 
        return default.MenuItemPickupArmor;                                     //008C : 04 02 30 1D A6 19 
        break;                                                                  //0092 : 06 17 01 
      case 25 :                                                                 //0095 : 0A 9A 00 24 19 
      case 26 :                                                                 //009A : 0A 9F 00 24 1A 
      case 27 :                                                                 //009F : 0A A4 00 24 1B 
      case 28 :                                                                 //00A4 : 0A A9 00 24 1C 
      case 29 :                                                                 //00A9 : 0A AE 00 24 1D 
      case 8 :                                                                  //00AE : 0A B3 00 24 08 
      case 9 :                                                                  //00B3 : 0A C1 00 24 09 
        return default.MenuItemPickupClothing;                                  //00B8 : 04 02 A8 1D A6 19 
        break;                                                                  //00BE : 06 17 01 
      case 3 :                                                                  //00C1 : 0A C6 00 24 03 
      case 4 :                                                                  //00C6 : 0A CB 00 24 04 
      case 33 :                                                                 //00CB : 0A D0 00 24 21 
      case 5 :                                                                  //00D0 : 0A D5 00 24 05 
      case 36 :                                                                 //00D5 : 0A E3 00 24 24 
        return default.MenuItemPickupSpell;                                     //00DA : 04 02 20 1E A6 19 
        break;                                                                  //00E0 : 06 17 01 
      case 30 :                                                                 //00E3 : 0A E8 00 24 1E 
      case 31 :                                                                 //00E8 : 0A ED 00 24 1F 
      case 32 :                                                                 //00ED : 0A F2 00 24 20 
      case 10 :                                                                 //00F2 : 0A F7 00 24 0A 
      case 1 :                                                                  //00F7 : 0A FC 00 24 01 
      case 2 :                                                                  //00FC : 0A 01 01 24 02 
      case 6 :                                                                  //0101 : 0A 06 01 24 06 
      case 7 :                                                                  //0106 : 0A 0B 01 24 07 
      default:                                                                  //010B : 0A FF FF 
        return default.MenuItemPickupDefault;                                   //010E : 04 02 C8 1B A6 19 
        break;                                                                  //0114 : 06 17 01 
    }
    //07 11 00 72 00 50 79 A5 19 2A 16 04 02 C8 1B A6 19 05 01 19 19 00 50 79 A5 19 05 00 04 01 98 2F 
    //22 11 05 00 01 01 10 30 22 11 0A 38 00 24 0E 04 02 40 1C A6 19 06 17 01 0A 3D 00 24 0B 0A 42 00 
    //24 0C 0A 47 00 24 0D 0A 55 00 24 0F 04 02 B8 1C A6 19 06 17 01 0A 5A 00 24 10 0A 5F 00 24 11 0A 
    //64 00 24 12 0A 69 00 24 13 0A 6E 00 24 14 0A 73 00 24 15 0A 78 00 24 16 0A 7D 00 24 17 0A 82 00 
    //24 18 0A 87 00 24 22 0A 95 00 24 23 04 02 30 1D A6 19 06 17 01 0A 9A 00 24 19 0A 9F 00 24 1A 0A 
    //A4 00 24 1B 0A A9 00 24 1C 0A AE 00 24 1D 0A B3 00 24 08 0A C1 00 24 09 04 02 A8 1D A6 19 06 17 
    //01 0A C6 00 24 03 0A CB 00 24 04 0A D0 00 24 21 0A D5 00 24 05 0A E3 00 24 24 04 02 20 1E A6 19 
    //06 17 01 0A E8 00 24 1E 0A ED 00 24 1F 0A F2 00 24 20 0A F7 00 24 0A 0A FC 00 24 01 0A 01 01 24 
    //02 0A 06 01 24 06 0A 0B 01 24 07 0A FF FF 04 02 C8 1B A6 19 06 17 01 04 0B 47 
  }



