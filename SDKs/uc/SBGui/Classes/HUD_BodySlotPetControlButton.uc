//==============================================================================
//  HUD_BodySlotPetControlButton
//==============================================================================

class HUD_BodySlotPetControlButton extends GUI_Button
    dependsOn(Game_Pawn,Game_BodySlots,Game_PlayerController,Game_PlayerInput)
    Transient
    Config(User)
  ;

  var private int mBodySlotIndex;


  function ActivateBodySlot() {
    local Game_Pawn Pawn;
    local byte bodyslotMode;
    if (!mDesktop.IsDragging()) {                                               //0000 : 07 B5 00 81 19 01 48 0C 9D 19 06 00 04 1B 67 98 00 00 16 16 
      Pawn = GetPawn();                                                         //0014 : 0F 00 68 4A 08 1B 1B 2B 0C 00 00 16 
      if (Pawn != None && Pawn.BodySlots != None) {                             //0020 : 07 B5 00 82 77 00 68 4A 08 1B 2A 16 18 12 00 77 19 00 68 4A 08 1B 05 00 04 01 90 42 34 0F 2A 16 16 
        bodyslotMode = Pawn.BodySlots.GetMode();                                //0041 : 0F 00 88 2B 08 1B 19 19 00 68 4A 08 1B 05 00 04 01 90 42 34 0F 06 00 01 1C 48 30 34 0F 16 
        if (bodyslotMode == 2) {                                                //005F : 07 B5 00 9A 39 3A 00 88 2B 08 1B 39 3A 24 02 16 
          Pawn.BodySlots.cl2sv_BodySlotActivate_CallStub(mBodySlotIndex,Game_PlayerController(Pawn.Controller).Input.cl_GetTargetPawn());//006F : 19 19 00 68 4A 08 1B 05 00 04 01 90 42 34 0F 31 00 00 1B D9 0F 00 00 01 D8 34 08 1B 19 19 2E 90 18 5B 01 19 00 68 4A 08 1B 05 00 04 01 00 6E 6C 0F 05 00 04 01 B0 14 37 0F 06 00 04 1B 39 05 00 00 16 16 
          goto jl00B5;                                                          //00B2 : 06 B5 00 
        }
      }
    }
    //07 B5 00 81 19 01 48 0C 9D 19 06 00 04 1B 67 98 00 00 16 16 0F 00 68 4A 08 1B 1B 2B 0C 00 00 16 
    //07 B5 00 82 77 00 68 4A 08 1B 2A 16 18 12 00 77 19 00 68 4A 08 1B 05 00 04 01 90 42 34 0F 2A 16 
    //16 0F 00 88 2B 08 1B 19 19 00 68 4A 08 1B 05 00 04 01 90 42 34 0F 06 00 01 1C 48 30 34 0F 16 07 
    //B5 00 9A 39 3A 00 88 2B 08 1B 39 3A 24 02 16 19 19 00 68 4A 08 1B 05 00 04 01 90 42 34 0F 31 00 
    //00 1B D9 0F 00 00 01 D8 34 08 1B 19 19 2E 90 18 5B 01 19 00 68 4A 08 1B 05 00 04 01 00 6E 6C 0F 
    //05 00 04 01 B0 14 37 0F 06 00 04 1B 39 05 00 00 16 16 06 B5 00 04 0B 47 
  }


  function bool OnMouseUpHandler(float MouseX,float MouseY,int buttons) {
    ActivateBodySlot();                                                         //0000 : 1B 75 1A 00 00 16 
    return False;                                                               //0006 : 04 28 
    //1B 75 1A 00 00 16 04 28 04 0B 47 
  }


  function SetBodySlotIndex(int aIndex) {
    if (aIndex >= 0 && aIndex < 5) {                                            //0000 : 07 24 00 82 99 00 20 94 06 1B 25 16 18 0A 00 96 00 20 94 06 1B 2C 05 16 16 
      mBodySlotIndex = aIndex;                                                  //0019 : 0F 01 D8 34 08 1B 00 20 94 06 1B 
    }
    //07 24 00 82 99 00 20 94 06 1B 25 16 18 0A 00 96 00 20 94 06 1B 2C 05 16 16 0F 01 D8 34 08 1B 00 
    //20 94 06 1B 04 0B 47 
  }


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 28 EB A1 19 16 
    __OnMouseUp__Delegate = OnMouseUpHandler;                                   //0006 : 45 01 C8 E8 9D 19 44 45 9A 00 00 
    SetBackground("Dropbox","SBGuiTX.Losse_Gui.SlotsnBoxes","SlotsnBoxes");     //0011 : 1B 1A 98 00 00 1F 44 72 6F 70 62 6F 78 00 1F 53 42 47 75 69 54 58 2E 4C 6F 73 73 65 5F 47 75 69 2E 53 6C 6F 74 73 6E 42 6F 78 65 73 00 1F 53 6C 6F 74 73 6E 42 6F 78 65 73 00 16 
    //1C 28 EB A1 19 16 45 01 C8 E8 9D 19 44 45 9A 00 00 1B 1A 98 00 00 1F 44 72 6F 70 62 6F 78 00 1F 
    //53 42 47 75 69 54 58 2E 4C 6F 73 73 65 5F 47 75 69 2E 53 6C 6F 74 73 6E 42 6F 78 65 73 00 1F 53 
    //6C 6F 74 73 6E 42 6F 78 65 73 00 16 04 0B 47 
  }



