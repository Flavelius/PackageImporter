//==============================================================================
//  Game_BodySlots
//==============================================================================

class Game_BodySlots extends Base_Component within Game_Pawn
    native
    exportstructs
    dependsOn(Game_Pawn,Game_PetPawn,Game_Controller,Game_ItemManager,Game_Item,Game_CharacterStats,Game_PlayerController,Player,GUI_BaseDesktop)
  ;

  const MAX_BODYSLOT_ITEMS =  5;
  enum EBodySlotMode {
    BSM_None ,
    BSM_PetSelectSystem ,
    BSM_PetControlSystem ,
    BSM_SkillUseItems ,
    BSM_PlayerUseItems 
  };

  var byte Mode;
  var int SelectedBodySlot;
  var (null);
  var (null);


  protected native function sv2cl_FailedActivation_CallStub();


  event sv2cl_FailedActivation(int aIndex) {
    OnFailedActivation(aIndex);                                                 //0000 : 43 58 D5 1E 11 C5 05 00 00 00 50 D1 1E 11 16 
    //43 58 D5 1E 11 C5 05 00 00 00 50 D1 1E 11 16 04 0B 47 
  }


  final function BodySlotActivate(int aIndex,Game_Pawn aTarget) {
    local Game_PetPawn petPawn;
    local Game_Controller petController;
    local Game_Item bodySlotItem;
    if (Outer.sv_IsResting()) {                                                 //0000 : 07 14 00 19 01 00 E4 6B 0F 06 00 04 1B E7 0C 00 00 16 
      return;                                                                   //0012 : 04 0B 
    }
    switch (Mode) {                                                             //0014 : 05 01 01 30 DA 1E 11 
      case 2 :                                                                  //001B : 0A 8B 01 24 02 
        petPawn = Outer.GetPet();                                               //0020 : 0F 00 A8 DA 1E 11 19 01 00 E4 6B 0F 06 00 04 1C E8 3B 34 0F 16 
        if (petPawn != None) {                                                  //0035 : 07 88 01 77 00 A8 DA 1E 11 2A 16 
          petController = Game_Controller(petPawn.Controller);                  //0040 : 0F 00 20 DB 1E 11 2E 10 0E 5B 01 19 00 A8 DA 1E 11 05 00 04 01 00 6E 6C 0F 
          switch (aIndex) {                                                     //0059 : 05 04 00 80 D6 1E 11 
            case 0 :                                                            //0060 : 0A 86 00 25 
              if (aTarget != None) {                                            //0064 : 07 83 00 77 00 98 DB 1E 11 2A 16 
                petController.sv_PetAttack(aTarget);                            //006F : 19 00 20 DB 1E 11 0B 00 00 1B 9F 0D 00 00 00 98 DB 1E 11 16 
              }
              break;                                                            //0083 : 06 88 01 
            case 1 :                                                            //0086 : 0A 9C 00 26 
              petController.sv_PetCallBack();                                   //008A : 19 00 20 DB 1E 11 06 00 00 1B 46 0E 00 00 16 
              break;                                                            //0099 : 06 88 01 
            case 2 :                                                            //009C : 0A EA 00 2C 02 
              switch (petController.sv_GetPetMoveState()) {                     //00A1 : 05 01 19 00 20 DB 1E 11 06 00 01 1B A1 0D 00 00 16 
                case 0 :                                                        //00B2 : 0A CB 00 24 00 
                  petController.sv_SetPetMoveState(1);                          //00B7 : 19 00 20 DB 1E 11 08 00 00 1B 39 07 00 00 24 01 16 
                  break;                                                        //00C8 : 06 E7 00 
                case 1 :                                                        //00CB : 0A E4 00 24 01 
                  petController.sv_SetPetMoveState(0);                          //00D0 : 19 00 20 DB 1E 11 08 00 00 1B 39 07 00 00 24 00 16 
                  break;                                                        //00E1 : 06 E7 00 
                default:                                                        //00E4 : 0A FF FF 
              }
              break;                                                            //00E7 : 06 88 01 
            case 3 :                                                            //00EA : 0A 6A 01 2C 03 
              switch (petController.sv_GetPetAttackState()) {                   //00EF : 05 01 19 00 20 DB 1E 11 06 00 01 1B A0 0D 00 00 16 
                case 0 :                                                        //0100 : 0A 19 01 24 00 
                  petController.sv_SetPetAttackState(1);                        //0105 : 19 00 20 DB 1E 11 08 00 00 1B 38 07 00 00 24 01 16 
                  break;                                                        //0116 : 06 67 01 
                case 1 :                                                        //0119 : 0A 32 01 24 01 
                  petController.sv_SetPetAttackState(2);                        //011E : 19 00 20 DB 1E 11 08 00 00 1B 38 07 00 00 24 02 16 
                  break;                                                        //012F : 06 67 01 
                case 2 :                                                        //0132 : 0A 4B 01 24 02 
                  petController.sv_SetPetAttackState(3);                        //0137 : 19 00 20 DB 1E 11 08 00 00 1B 38 07 00 00 24 03 16 
                  break;                                                        //0148 : 06 67 01 
                case 3 :                                                        //014B : 0A 64 01 24 03 
                  petController.sv_SetPetAttackState(0);                        //0150 : 19 00 20 DB 1E 11 08 00 00 1B 38 07 00 00 24 00 16 
                  break;                                                        //0161 : 06 67 01 
                default:                                                        //0164 : 0A FF FF 
              }
              break;                                                            //0167 : 06 88 01 
            case 4 :                                                            //016A : 0A 82 01 2C 04 
              Outer.sv_DestroyPet(True);                                        //016F : 19 01 00 E4 6B 0F 07 00 00 1C 78 3D 34 0F 27 16 
              break;                                                            //017F : 06 88 01 
            default:                                                            //0182 : 0A FF FF 
              break;                                                            //0185 : 06 88 01 
          }
        }
        break;                                                                  //0188 : 06 33 02 
      case 3 :                                                                  //018B : 0A 9E 01 24 03 
        SelectedBodySlot = aIndex;                                              //0190 : 0F 01 10 DC 1E 11 00 80 D6 1E 11 
        break;                                                                  //019B : 06 33 02 
      case 1 :                                                                  //019E : 0A A3 01 24 01 
      case 4 :                                                                  //01A3 : 0A 2D 02 24 04 
        bodySlotItem = Outer.itemManager.GetItem(3,aIndex);                     //01A8 : 0F 00 88 DC 1E 11 19 19 01 00 E4 6B 0F 05 00 04 01 B0 2D 19 11 0D 00 04 1B C1 0C 00 00 24 03 00 80 D6 1E 11 16 
        if (bodySlotItem != None) {                                             //01CD : 07 2A 02 77 00 88 DC 1E 11 2A 16 
          if (bodySlotItem.CanUse()) {                                          //01D8 : 07 FC 01 19 00 88 DC 1E 11 06 00 04 1B 8B 04 00 00 16 
            bodySlotItem.OnUse();                                               //01EA : 19 00 88 DC 1E 11 06 00 00 1B FF 05 00 00 16 
          } else {                                                              //01F9 : 06 2A 02 
            if (Outer.CharacterStats.GetCharacterClass() == 5) {                //01FC : 07 2A 02 9A 39 3A 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 06 00 01 1B 59 0C 00 00 16 39 3A 24 05 16 
              sv2cl_FailedActivation_CallStub(aIndex);                          //021F : 1B 43 0F 00 00 00 80 D6 1E 11 16 
            }
          }
        }
        break;                                                                  //022A : 06 33 02 
      default:                                                                  //022D : 0A FF FF 
        break;                                                                  //0230 : 06 33 02 
      }
    }
    //07 14 00 19 01 00 E4 6B 0F 06 00 04 1B E7 0C 00 00 16 04 0B 05 01 01 30 DA 1E 11 0A 8B 01 24 02 
    //0F 00 A8 DA 1E 11 19 01 00 E4 6B 0F 06 00 04 1C E8 3B 34 0F 16 07 88 01 77 00 A8 DA 1E 11 2A 16 
    //0F 00 20 DB 1E 11 2E 10 0E 5B 01 19 00 A8 DA 1E 11 05 00 04 01 00 6E 6C 0F 05 04 00 80 D6 1E 11 
    //0A 86 00 25 07 83 00 77 00 98 DB 1E 11 2A 16 19 00 20 DB 1E 11 0B 00 00 1B 9F 0D 00 00 00 98 DB 
    //1E 11 16 06 88 01 0A 9C 00 26 19 00 20 DB 1E 11 06 00 00 1B 46 0E 00 00 16 06 88 01 0A EA 00 2C 
    //02 05 01 19 00 20 DB 1E 11 06 00 01 1B A1 0D 00 00 16 0A CB 00 24 00 19 00 20 DB 1E 11 08 00 00 
    //1B 39 07 00 00 24 01 16 06 E7 00 0A E4 00 24 01 19 00 20 DB 1E 11 08 00 00 1B 39 07 00 00 24 00 
    //16 06 E7 00 0A FF FF 06 88 01 0A 6A 01 2C 03 05 01 19 00 20 DB 1E 11 06 00 01 1B A0 0D 00 00 16 
    //0A 19 01 24 00 19 00 20 DB 1E 11 08 00 00 1B 38 07 00 00 24 01 16 06 67 01 0A 32 01 24 01 19 00 
    //20 DB 1E 11 08 00 00 1B 38 07 00 00 24 02 16 06 67 01 0A 4B 01 24 02 19 00 20 DB 1E 11 08 00 00 
    //1B 38 07 00 00 24 03 16 06 67 01 0A 64 01 24 03 19 00 20 DB 1E 11 08 00 00 1B 38 07 00 00 24 00 
    //16 06 67 01 0A FF FF 06 88 01 0A 82 01 2C 04 19 01 00 E4 6B 0F 07 00 00 1C 78 3D 34 0F 27 16 06 
    //88 01 0A FF FF 06 88 01 06 33 02 0A 9E 01 24 03 0F 01 10 DC 1E 11 00 80 D6 1E 11 06 33 02 0A A3 
    //01 24 01 0A 2D 02 24 04 0F 00 88 DC 1E 11 19 19 01 00 E4 6B 0F 05 00 04 01 B0 2D 19 11 0D 00 04 
    //1B C1 0C 00 00 24 03 00 80 D6 1E 11 16 07 2A 02 77 00 88 DC 1E 11 2A 16 07 FC 01 19 00 88 DC 1E 
    //11 06 00 04 1B 8B 04 00 00 16 19 00 88 DC 1E 11 06 00 00 1B FF 05 00 00 16 06 2A 02 07 2A 02 9A 
    //39 3A 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 06 00 01 1B 59 0C 00 00 16 39 3A 24 05 16 1B 
    //43 0F 00 00 00 80 D6 1E 11 16 06 33 02 0A FF FF 06 33 02 04 0B 47 
  }


  protected native function cl2sv_BodySlotActivate_CallStub();


  event cl2sv_BodySlotActivate(int anIndex,Game_Pawn aTarget) {
    BodySlotActivate(anIndex,aTarget);                                          //0000 : 1C 68 D4 1E 11 00 60 DE 1E 11 00 20 DF 1E 11 16 
    //1C 68 D4 1E 11 00 60 DE 1E 11 00 20 DF 1E 11 16 04 0B 47 
  }


  final event Game_Item GetSelectedBodySlotItem() {
    switch (Mode) {                                                             //0000 : 05 01 01 30 DA 1E 11 
      case 3 :                                                                  //0007 : 0A 43 00 24 03 
        if (Outer.itemManager != None) {                                        //000C : 07 41 00 77 19 01 00 E4 6B 0F 05 00 04 01 B0 2D 19 11 2A 16 
          return Outer.itemManager.GetItem(3,SelectedBodySlot,0);               //0020 : 04 19 19 01 00 E4 6B 0F 05 00 04 01 B0 2D 19 11 0E 00 04 1B C1 0C 00 00 24 03 01 10 DC 1E 11 25 16 
        }
        return None;                                                            //0041 : 04 2A 
      default:                                                                  //0043 : 0A FF FF 
        return None;                                                            //0046 : 04 2A 
      }
    }
    //05 01 01 30 DA 1E 11 0A 43 00 24 03 07 41 00 77 19 01 00 E4 6B 0F 05 00 04 01 B0 2D 19 11 2A 16 
    //04 19 19 01 00 E4 6B 0F 05 00 04 01 B0 2D 19 11 0E 00 04 1B C1 0C 00 00 24 03 01 10 DC 1E 11 25 
    //16 04 2A 0A FF FF 04 2A 04 0B 47 
  }


  final function byte GetMode() {
    return Mode;                                                                //0000 : 04 01 30 DA 1E 11 
    //04 01 30 DA 1E 11 04 0B 47 
  }


  private final function cl_SetMode(byte aNewMode) {
    local Game_PlayerController PlayerController;
    if (Mode != aNewMode) {                                                     //0000 : 07 A9 00 9B 39 3A 01 30 DA 1E 11 39 3A 00 00 E3 1E 11 16 
      PlayerController = Game_PlayerController(Outer.Controller);               //0013 : 0F 00 90 E4 1E 11 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 
      Mode = aNewMode;                                                          //002C : 0F 01 30 DA 1E 11 00 00 E3 1E 11 
      if (PlayerController != None) {                                           //0037 : 07 9E 00 77 00 90 E4 1E 11 2A 16 
        if (aNewMode == 0) {                                                    //0042 : 07 7A 00 9A 39 3A 00 00 E3 1E 11 39 3A 24 00 16 
          PlayerController.Player.GUIDesktop.ShowStdWindow(57,2);               //0052 : 19 19 19 00 90 E4 1E 11 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0A 00 04 1B DF 0B 00 00 2C 39 2C 02 16 
        } else {                                                                //0077 : 06 9E 00 
          PlayerController.Player.GUIDesktop.ShowStdWindow(57,1);               //007A : 19 19 19 00 90 E4 1E 11 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 09 00 04 1B DF 0B 00 00 2C 39 26 16 
        }
      }
      OnModeChange(self);                                                       //009E : 43 08 E5 1E 11 D7 05 00 00 17 16 
    }
    //07 A9 00 9B 39 3A 01 30 DA 1E 11 39 3A 00 00 E3 1E 11 16 0F 00 90 E4 1E 11 2E 90 18 5B 01 19 01 
    //00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 0F 01 30 DA 1E 11 00 00 E3 1E 11 07 9E 00 77 00 90 E4 1E 11 
    //2A 16 07 7A 00 9A 39 3A 00 00 E3 1E 11 39 3A 24 00 16 19 19 19 00 90 E4 1E 11 05 00 04 01 28 25 
    //71 0F 05 00 04 01 90 C0 79 0F 0A 00 04 1B DF 0B 00 00 2C 39 2C 02 16 06 9E 00 19 19 19 00 90 E4 
    //1E 11 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 09 00 04 1B DF 0B 00 00 2C 39 26 16 43 08 
    //E5 1E 11 D7 05 00 00 17 16 04 0B 47 
  }


  protected native function sv2cl_SetMode_CallStub();


  final event sv2cl_SetMode(byte aNewMode) {
    cl_SetMode(aNewMode);                                                       //0000 : 1C A0 E0 1E 11 00 30 E6 1E 11 16 
    //1C A0 E0 1E 11 00 30 E6 1E 11 16 04 0B 47 
  }


  final function sv_SetMode(byte aNewMode) {
    if (Mode != aNewMode) {                                                     //0000 : 07 29 00 9B 39 3A 01 30 DA 1E 11 39 3A 00 E8 E6 1E 11 16 
      Mode = aNewMode;                                                          //0013 : 0F 01 30 DA 1E 11 00 E8 E6 1E 11 
      sv2cl_SetMode_CallStub(aNewMode);                                         //001E : 1B 4C 0F 00 00 00 E8 E6 1E 11 16 
    }
    //07 29 00 9B 39 3A 01 30 DA 1E 11 39 3A 00 E8 E6 1E 11 16 0F 01 30 DA 1E 11 00 E8 E6 1E 11 1B 4C 
    //0F 00 00 00 E8 E6 1E 11 16 04 0B 47 
  }


  final event byte GetBodySlotModeByClass() {
    switch (Outer.CharacterStats.GetCharacterClass()) {                         //0000 : 05 01 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 06 00 01 1B 59 0C 00 00 16 
      case 0 :                                                                  //001A : 0A 1F 00 24 00 
      case 2 :                                                                  //001F : 0A 24 00 24 02 
      case 1 :                                                                  //0024 : 0A 29 00 24 01 
      case 3 :                                                                  //0029 : 0A 34 00 24 03 
        return 0;                                                               //002E : 04 24 00 
        break;                                                                  //0031 : 06 7C 00 
      case 4 :                                                                  //0034 : 0A 39 00 24 04 
      case 6 :                                                                  //0039 : 0A 44 00 24 06 
        return 3;                                                               //003E : 04 24 03 
        break;                                                                  //0041 : 06 7C 00 
      case 5 :                                                                  //0044 : 0A 49 00 24 05 
      case 7 :                                                                  //0049 : 0A 4E 00 24 07 
      case 8 :                                                                  //004E : 0A 53 00 24 08 
      case 9 :                                                                  //0053 : 0A 58 00 24 09 
      case 10 :                                                                 //0058 : 0A 5D 00 24 0A 
      case 11 :                                                                 //005D : 0A 68 00 24 0B 
        return 4;                                                               //0062 : 04 24 04 
        break;                                                                  //0065 : 06 7C 00 
      case 12 :                                                                 //0068 : 0A 73 00 24 0C 
        return 1;                                                               //006D : 04 24 01 
        break;                                                                  //0070 : 06 7C 00 
      default:                                                                  //0073 : 0A FF FF 
        return 0;                                                               //0076 : 04 24 00 
        break;                                                                  //0079 : 06 7C 00 
    }
    //05 01 19 19 01 00 E4 6B 0F 05 00 04 01 08 43 34 0F 06 00 01 1B 59 0C 00 00 16 0A 1F 00 24 00 0A 
    //24 00 24 02 0A 29 00 24 01 0A 34 00 24 03 04 24 00 06 7C 00 0A 39 00 24 04 0A 44 00 24 06 04 24 
    //03 06 7C 00 0A 49 00 24 05 0A 4E 00 24 07 0A 53 00 24 08 0A 58 00 24 09 0A 5D 00 24 0A 0A 68 00 
    //24 0B 04 24 04 06 7C 00 0A 73 00 24 0C 04 24 01 06 7C 00 0A FF FF 04 24 00 06 7C 00 04 0B 47 
  }


  function cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C E0 C4 19 11 16 
    if (Outer.IsLocalPlayer()) {                                                //0006 : 07 24 00 19 01 00 E4 6B 0F 06 00 04 1C 18 1A 76 0F 16 
      cl_SetMode(GetBodySlotModeByClass());                                     //0018 : 1C A0 E0 1E 11 1C A0 D9 24 11 16 16 
    }
    //1C E0 C4 19 11 16 07 24 00 19 01 00 E4 6B 0F 06 00 04 1C 18 1A 76 0F 16 1C A0 E0 1E 11 1C A0 D9 
    //24 11 16 16 04 0B 47 
  }


  delegate OnFailedActivation(int aIndex);


  delegate OnModeChange(export editinline Game_BodySlots aBodySlots);



