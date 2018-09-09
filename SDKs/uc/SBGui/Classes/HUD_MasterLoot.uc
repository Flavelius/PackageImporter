//==============================================================================
//  HUD_MasterLoot
//==============================================================================

class HUD_MasterLoot extends HUD_SingleLoot
    dependsOn(Game_PlayerController,Game_PlayerTeams,Game_TeamMember)
    Transient
    Config(User)
  ;

  const IDC_ML_CONFIRM_ASSIGN_ALL =  11;
  const IDC_ML_CONFIRM_ASSIGN =  10;
  const COMBO_BOX_HEIGHT =  24;
  const COMBO_BOX_WIDTH =  130;
  var private HUD_ItemButton mSelectedItem;


  protected final function bool AssignLootButtonItems(array<HUD_ItemButton> aButtons,int aTarget) {
    local array<Game_Item> gameItems;
    local Game_Item tempItem;
    local Game_Pawn gamePawn;
    local int nrButtons;
    local int nrItems;
    local int nrValidItems;
    local int i;
    nrButtons = aButtons.Length;                                                //0000 : 0F 00 88 B3 05 1B 37 00 08 A5 04 1B 
    if (nrButtons > 0) {                                                        //000C : 07 55 01 97 00 88 B3 05 1B 25 16 
      gamePawn = GetPawn();                                                     //0017 : 0F 00 00 B4 05 1B 1B 2B 0C 00 00 16 
      if (gamePawn != None && gamePawn.Looting != None) {                       //0023 : 07 52 01 82 77 00 00 B4 05 1B 2A 16 18 12 00 77 19 00 00 B4 05 1B 05 00 04 01 68 52 18 11 2A 16 16 
        i = 0;                                                                  //0044 : 0F 00 58 CC 2C 26 25 
        while (i < nrButtons) {                                                 //004B : 07 19 01 96 00 58 CC 2C 26 00 88 B3 05 1B 16 
          if (aButtons[i] != None && aButtons[i].mOwnerPage != None) {          //005A : 07 0F 01 82 77 10 00 58 CC 2C 26 00 08 A5 04 1B 2A 16 18 18 00 77 19 10 00 58 CC 2C 26 00 08 A5 04 1B 05 00 04 01 08 B0 9D 19 2A 16 16 
            tempItem = Game_Item(aButtons[i].GetTooltipObject());               //0087 : 0F 00 60 15 07 1B 2E 30 E6 5B 01 19 10 00 58 CC 2C 26 00 08 A5 04 1B 06 00 04 1B 20 99 00 00 16 
            if (tempItem != None) {                                             //00A7 : 07 0C 01 77 00 60 15 07 1B 2A 16 
              nrItems = gameItems.Length;                                       //00B2 : 0F 00 D0 12 07 1B 37 00 78 B4 05 1B 
              gameItems.Length = nrItems + 1;                                   //00BE : 0F 37 00 78 B4 05 1B 92 00 D0 12 07 1B 26 16 
              gameItems[nrItems] = tempItem;                                    //00CD : 0F 10 00 D0 12 07 1B 00 78 B4 05 1B 00 60 15 07 1B 
              ++nrValidItems;                                                   //00DE : A3 00 68 70 06 1B 16 
              EnableItemPage(aButtons[i].mOwnerPage.mIntTag,False);             //00E5 : 1B 3E 99 00 00 19 19 10 00 58 CC 2C 26 00 08 A5 04 1B 05 00 04 01 08 B0 9D 19 05 00 04 01 58 90 31 16 28 16 
              goto jl010C;                                                      //0109 : 06 0C 01 
            }
            goto jl010F;                                                        //010C : 06 0F 01 
          }
          ++i;                                                                  //010F : A3 00 58 CC 2C 26 16 
        }
        gamePawn.Looting.cl_MasterLootChoice(gameItems,aTarget);                //0119 : 19 19 00 00 B4 05 1B 05 00 04 01 68 52 18 11 10 00 00 1C 00 69 2B 11 00 78 B4 05 1B 00 B8 E8 34 26 16 
        mSelectedItem = None;                                                   //013B : 0F 01 F0 10 2B 26 2A 
        return nrButtons == nrValidItems;                                       //0142 : 04 9A 00 88 B3 05 1B 00 68 70 06 1B 16 
        goto jl0152;                                                            //014F : 06 52 01 
      }
    } else {                                                                    //0152 : 06 57 01 
      return True;                                                              //0155 : 04 27 
    }
    return False;                                                               //0157 : 04 28 
    //0F 00 88 B3 05 1B 37 00 08 A5 04 1B 07 55 01 97 00 88 B3 05 1B 25 16 0F 00 00 B4 05 1B 1B 2B 0C 
    //00 00 16 07 52 01 82 77 00 00 B4 05 1B 2A 16 18 12 00 77 19 00 00 B4 05 1B 05 00 04 01 68 52 18 
    //11 2A 16 16 0F 00 58 CC 2C 26 25 07 19 01 96 00 58 CC 2C 26 00 88 B3 05 1B 16 07 0F 01 82 77 10 
    //00 58 CC 2C 26 00 08 A5 04 1B 2A 16 18 18 00 77 19 10 00 58 CC 2C 26 00 08 A5 04 1B 05 00 04 01 
    //08 B0 9D 19 2A 16 16 0F 00 60 15 07 1B 2E 30 E6 5B 01 19 10 00 58 CC 2C 26 00 08 A5 04 1B 06 00 
    //04 1B 20 99 00 00 16 07 0C 01 77 00 60 15 07 1B 2A 16 0F 00 D0 12 07 1B 37 00 78 B4 05 1B 0F 37 
    //00 78 B4 05 1B 92 00 D0 12 07 1B 26 16 0F 10 00 D0 12 07 1B 00 78 B4 05 1B 00 60 15 07 1B A3 00 
    //68 70 06 1B 16 1B 3E 99 00 00 19 19 10 00 58 CC 2C 26 00 08 A5 04 1B 05 00 04 01 08 B0 9D 19 05 
    //00 04 01 58 90 31 16 28 16 06 0C 01 06 0F 01 A3 00 58 CC 2C 26 16 06 4B 00 19 19 00 00 B4 05 1B 
    //05 00 04 01 68 52 18 11 10 00 00 1C 00 69 2B 11 00 78 B4 05 1B 00 B8 E8 34 26 16 0F 01 F0 10 2B 
    //26 2A 04 9A 00 88 B3 05 1B 00 68 70 06 1B 16 06 52 01 06 57 01 04 27 04 28 04 0B 47 
  }


  function AssignAll() {
    local array<HUD_ItemButton> itemButtons;
    local int nrButtons;
    local GUI_ComboBox Box;
    local export editinline Game_PlayerTeams team;
    local int i;
    local int j;
    local int itemCount;
    local int Target;
    nrButtons = mItems.Length;                                                  //0000 : 0F 00 A8 A6 04 1B 37 01 40 58 EC 25 
    if (nrButtons <= 0) {                                                       //000C : 07 19 00 98 00 A8 A6 04 1B 25 16 
      return;                                                                   //0017 : 04 0B 
    }
    team = Game_PlayerController(GetPlayerController()).GroupingTeams;          //0019 : 0F 00 D8 BC 05 1B 19 2E 90 18 5B 01 1B 0E 2F 00 00 16 05 00 04 01 48 C2 18 11 
    if (team != None) {                                                         //0033 : 07 BD 02 77 00 D8 BC 05 1B 2A 16 
      itemCount = 0;                                                            //003E : 0F 00 58 19 07 1B 25 
      itemButtons.Length = 0;                                                   //0045 : 0F 37 00 C0 22 2B 26 25 
      Target = -3;                                                              //004D : 0F 00 A8 D1 2B 26 1D FD FF FF FF 
      i = 0;                                                                    //0058 : 0F 00 C0 28 8A 19 25 
      while (i < nrButtons) {                                                   //005F : 07 E7 00 96 00 C0 28 8A 19 00 A8 A6 04 1B 16 
        if (mItems[i].ItemButton != None) {                                     //006E : 07 DD 00 77 36 78 4D 89 19 10 00 C0 28 8A 19 01 40 58 EC 25 2A 16 
          Box = mItems[i].PlayerCombo;                                          //0084 : 0F 00 B8 D0 2B 26 36 98 76 2B 26 10 00 C0 28 8A 19 01 40 58 EC 25 
          if (Box != None && Box.GetSelection() == Target) {                    //009A : 07 DD 00 82 77 00 B8 D0 2B 26 2A 16 18 17 00 9A 19 00 B8 D0 2B 26 06 00 04 1B 27 98 00 00 16 00 A8 D1 2B 26 16 16 
            itemButtons[itemButtons.Length] = mItems[i].ItemButton;             //00C0 : 0F 10 37 00 C0 22 2B 26 00 C0 22 2B 26 36 78 4D 89 19 10 00 C0 28 8A 19 01 40 58 EC 25 
          }
        }
        ++i;                                                                    //00DD : A3 00 C0 28 8A 19 16 
      }
      if (!AssignLootButtonItems(itemButtons,Target)) {                         //00E7 : 07 FC 00 81 1C A8 CB 2C 26 00 C0 22 2B 26 00 A8 D1 2B 26 16 16 
      }
      i = 0;                                                                    //00FC : 0F 00 C0 28 8A 19 25 
      while (i < team.mTeamMembers.Length) {                                    //0103 : 07 FC 01 96 00 C0 28 8A 19 37 19 00 D8 BC 05 1B 05 00 00 01 18 EA 27 11 16 
        itemCount = 0;                                                          //011C : 0F 00 58 19 07 1B 25 
        itemButtons.Length = 0;                                                 //0123 : 0F 37 00 C0 22 2B 26 25 
        Target = team.mTeamMembers[i].MemberHandle;                             //012B : 0F 00 A8 D1 2B 26 19 10 00 C0 28 8A 19 19 00 D8 BC 05 1B 05 00 00 01 18 EA 27 11 05 00 04 01 20 EB 27 11 
        j = 0;                                                                  //014E : 0F 00 D8 61 04 1B 25 
        while (j < nrButtons) {                                                 //0155 : 07 DD 01 96 00 D8 61 04 1B 00 A8 A6 04 1B 16 
          if (mItems[j].ItemButton != None) {                                   //0164 : 07 D3 01 77 36 78 4D 89 19 10 00 D8 61 04 1B 01 40 58 EC 25 2A 16 
            Box = mItems[j].PlayerCombo;                                        //017A : 0F 00 B8 D0 2B 26 36 98 76 2B 26 10 00 D8 61 04 1B 01 40 58 EC 25 
            if (Box != None && Box.GetSelection() == Target) {                  //0190 : 07 D3 01 82 77 00 B8 D0 2B 26 2A 16 18 17 00 9A 19 00 B8 D0 2B 26 06 00 04 1B 27 98 00 00 16 00 A8 D1 2B 26 16 16 
              itemButtons[itemButtons.Length] = mItems[j].ItemButton;           //01B6 : 0F 10 37 00 C0 22 2B 26 00 C0 22 2B 26 36 78 4D 89 19 10 00 D8 61 04 1B 01 40 58 EC 25 
            }
          }
          ++j;                                                                  //01D3 : A3 00 D8 61 04 1B 16 
        }
        if (!AssignLootButtonItems(itemButtons,Target)) {                       //01DD : 07 F2 01 81 1C A8 CB 2C 26 00 C0 22 2B 26 00 A8 D1 2B 26 16 16 
        }
        ++i;                                                                    //01F2 : A3 00 C0 28 8A 19 16 
      }
      itemCount = 0;                                                            //01FC : 0F 00 58 19 07 1B 25 
      itemButtons.Length = 0;                                                   //0203 : 0F 37 00 C0 22 2B 26 25 
      Target = -2;                                                              //020B : 0F 00 A8 D1 2B 26 1D FE FF FF FF 
      i = 0;                                                                    //0216 : 0F 00 C0 28 8A 19 25 
      while (i < nrButtons) {                                                   //021D : 07 A5 02 96 00 C0 28 8A 19 00 A8 A6 04 1B 16 
        if (mItems[i].ItemButton != None) {                                     //022C : 07 9B 02 77 36 78 4D 89 19 10 00 C0 28 8A 19 01 40 58 EC 25 2A 16 
          Box = mItems[i].PlayerCombo;                                          //0242 : 0F 00 B8 D0 2B 26 36 98 76 2B 26 10 00 C0 28 8A 19 01 40 58 EC 25 
          if (Box != None && Box.GetSelection() == Target) {                    //0258 : 07 9B 02 82 77 00 B8 D0 2B 26 2A 16 18 17 00 9A 19 00 B8 D0 2B 26 06 00 04 1B 27 98 00 00 16 00 A8 D1 2B 26 16 16 
            itemButtons[itemButtons.Length] = mItems[i].ItemButton;             //027E : 0F 10 37 00 C0 22 2B 26 00 C0 22 2B 26 36 78 4D 89 19 10 00 C0 28 8A 19 01 40 58 EC 25 
          }
        }
        ++i;                                                                    //029B : A3 00 C0 28 8A 19 16 
      }
      if (!AssignLootButtonItems(itemButtons,Target)) {                         //02A5 : 07 BA 02 81 1C A8 CB 2C 26 00 C0 22 2B 26 00 A8 D1 2B 26 16 16 
      }
      goto jl02BD;                                                              //02BA : 06 BD 02 
    }
    //0F 00 A8 A6 04 1B 37 01 40 58 EC 25 07 19 00 98 00 A8 A6 04 1B 25 16 04 0B 0F 00 D8 BC 05 1B 19 
    //2E 90 18 5B 01 1B 0E 2F 00 00 16 05 00 04 01 48 C2 18 11 07 BD 02 77 00 D8 BC 05 1B 2A 16 0F 00 
    //58 19 07 1B 25 0F 37 00 C0 22 2B 26 25 0F 00 A8 D1 2B 26 1D FD FF FF FF 0F 00 C0 28 8A 19 25 07 
    //E7 00 96 00 C0 28 8A 19 00 A8 A6 04 1B 16 07 DD 00 77 36 78 4D 89 19 10 00 C0 28 8A 19 01 40 58 
    //EC 25 2A 16 0F 00 B8 D0 2B 26 36 98 76 2B 26 10 00 C0 28 8A 19 01 40 58 EC 25 07 DD 00 82 77 00 
    //B8 D0 2B 26 2A 16 18 17 00 9A 19 00 B8 D0 2B 26 06 00 04 1B 27 98 00 00 16 00 A8 D1 2B 26 16 16 
    //0F 10 37 00 C0 22 2B 26 00 C0 22 2B 26 36 78 4D 89 19 10 00 C0 28 8A 19 01 40 58 EC 25 A3 00 C0 
    //28 8A 19 16 06 5F 00 07 FC 00 81 1C A8 CB 2C 26 00 C0 22 2B 26 00 A8 D1 2B 26 16 16 0F 00 C0 28 
    //8A 19 25 07 FC 01 96 00 C0 28 8A 19 37 19 00 D8 BC 05 1B 05 00 00 01 18 EA 27 11 16 0F 00 58 19 
    //07 1B 25 0F 37 00 C0 22 2B 26 25 0F 00 A8 D1 2B 26 19 10 00 C0 28 8A 19 19 00 D8 BC 05 1B 05 00 
    //00 01 18 EA 27 11 05 00 04 01 20 EB 27 11 0F 00 D8 61 04 1B 25 07 DD 01 96 00 D8 61 04 1B 00 A8 
    //A6 04 1B 16 07 D3 01 77 36 78 4D 89 19 10 00 D8 61 04 1B 01 40 58 EC 25 2A 16 0F 00 B8 D0 2B 26 
    //36 98 76 2B 26 10 00 D8 61 04 1B 01 40 58 EC 25 07 D3 01 82 77 00 B8 D0 2B 26 2A 16 18 17 00 9A 
    //19 00 B8 D0 2B 26 06 00 04 1B 27 98 00 00 16 00 A8 D1 2B 26 16 16 0F 10 37 00 C0 22 2B 26 00 C0 
    //22 2B 26 36 78 4D 89 19 10 00 D8 61 04 1B 01 40 58 EC 25 A3 00 D8 61 04 1B 16 06 55 01 07 F2 01 
    //81 1C A8 CB 2C 26 00 C0 22 2B 26 00 A8 D1 2B 26 16 16 A3 00 C0 28 8A 19 16 06 03 01 0F 00 58 19 
    //07 1B 25 0F 37 00 C0 22 2B 26 25 0F 00 A8 D1 2B 26 1D FE FF FF FF 0F 00 C0 28 8A 19 25 07 A5 02 
    //96 00 C0 28 8A 19 00 A8 A6 04 1B 16 07 9B 02 77 36 78 4D 89 19 10 00 C0 28 8A 19 01 40 58 EC 25 
    //2A 16 0F 00 B8 D0 2B 26 36 98 76 2B 26 10 00 C0 28 8A 19 01 40 58 EC 25 07 9B 02 82 77 00 B8 D0 
    //2B 26 2A 16 18 17 00 9A 19 00 B8 D0 2B 26 06 00 04 1B 27 98 00 00 16 00 A8 D1 2B 26 16 16 0F 10 
    //37 00 C0 22 2B 26 00 C0 22 2B 26 36 78 4D 89 19 10 00 C0 28 8A 19 01 40 58 EC 25 A3 00 C0 28 8A 
    //19 16 06 1D 02 07 BA 02 81 1C A8 CB 2C 26 00 C0 22 2B 26 00 A8 D1 2B 26 16 16 06 BD 02 04 0B 47 
    //
  }


  function AssignSelected() {
    local array<HUD_ItemButton> itemButtons;
    local int itemIndex;
    local GUI_ComboBox Box;
    local int Target;
    if (mSelectedItem == None) {                                                //0000 : 07 0D 00 72 01 F0 10 2B 26 2A 16 
      return;                                                                   //000B : 04 0B 
    }
    if (mSelectedItem != None
      && mSelectedItem.mOwnerPage != None) {      //000D : 07 D6 00 82 77 01 F0 10 2B 26 2A 16 18 12 00 77 19 01 F0 10 2B 26 05 00 04 01 08 B0 9D 19 2A 16 16 
      itemIndex = mSelectedItem.mOwnerPage.mIntTag;                             //002E : 0F 00 08 C4 05 1B 19 19 01 F0 10 2B 26 05 00 04 01 08 B0 9D 19 05 00 04 01 58 90 31 16 
      if (itemIndex > -1 && itemIndex < mItems.Length) {                        //004B : 07 D6 00 82 97 00 08 C4 05 1B 1D FF FF FF FF 16 18 0E 00 96 00 08 C4 05 1B 37 01 40 58 EC 25 16 16 
        Box = mItems[itemIndex].PlayerCombo;                                    //006C : 0F 00 C0 21 07 1B 36 98 76 2B 26 10 00 08 C4 05 1B 01 40 58 EC 25 
        if (Box != None) {                                                      //0082 : 07 D6 00 77 00 C0 21 07 1B 2A 16 
          Target = Box.GetSelection();                                          //008D : 0F 00 48 21 07 1B 19 00 C0 21 07 1B 06 00 04 1B 27 98 00 00 16 
          if (Target != -1) {                                                   //00A2 : 07 D6 00 9B 00 48 21 07 1B 1D FF FF FF FF 16 
            itemButtons.Length = 1;                                             //00B1 : 0F 37 00 40 25 07 1B 26 
            itemButtons[0] = mSelectedItem;                                     //00B9 : 0F 10 25 00 40 25 07 1B 01 F0 10 2B 26 
            AssignLootButtonItems(itemButtons,Target);                          //00C6 : 1C A8 CB 2C 26 00 40 25 07 1B 00 48 21 07 1B 16 
          }
        }
      }
    }
    //07 0D 00 72 01 F0 10 2B 26 2A 16 04 0B 07 D6 00 82 77 01 F0 10 2B 26 2A 16 18 12 00 77 19 01 F0 
    //10 2B 26 05 00 04 01 08 B0 9D 19 2A 16 16 0F 00 08 C4 05 1B 19 19 01 F0 10 2B 26 05 00 04 01 08 
    //B0 9D 19 05 00 04 01 58 90 31 16 07 D6 00 82 97 00 08 C4 05 1B 1D FF FF FF FF 16 18 0E 00 96 00 
    //08 C4 05 1B 37 01 40 58 EC 25 16 16 0F 00 C0 21 07 1B 36 98 76 2B 26 10 00 08 C4 05 1B 01 40 58 
    //EC 25 07 D6 00 77 00 C0 21 07 1B 2A 16 0F 00 48 21 07 1B 19 00 C0 21 07 1B 06 00 04 1B 27 98 00 
    //00 16 07 D6 00 9B 00 48 21 07 1B 1D FF FF FF FF 16 0F 37 00 40 25 07 1B 26 0F 10 25 00 40 25 07 
    //1B 01 F0 10 2B 26 1C A8 CB 2C 26 00 40 25 07 1B 00 48 21 07 1B 16 04 0B 47 
  }


  function bool OnAssignAll(GUI_Component clickedButton) {
    mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.End_Looting.Text,Class'SBGuiStrings'.default.Are_you_sure_you_want_to_assign_all_items.Text,Class'GUI_BaseDesktop'.4 | Class'GUI_BaseDesktop'.8 | Class'GUI_BaseDesktop'.32,11,self);//0000 : 19 01 48 0C 9D 19 64 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 2B 99 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 B5 2F 16 9E 9E 12 20 00 68 D7 00 02 00 04 2C 04 12 20 00 68 D7 00 02 00 04 2C 08 16 12 20 00 68 D7 00 02 00 04 2C 20 16 2C 0B 17 16 
    return True;                                                                //006D : 04 27 
    //19 01 48 0C 9D 19 64 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 
    //C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 2B 99 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 
    //20 B5 2F 16 9E 9E 12 20 00 68 D7 00 02 00 04 2C 04 12 20 00 68 D7 00 02 00 04 2C 08 16 12 20 00 
    //68 D7 00 02 00 04 2C 20 16 2C 0B 17 16 04 27 04 0B 47 
  }


  function bool OnAssign(GUI_Component clickedButton) {
    if (mSelectedItem == None) {                                                //0000 : 07 6B 00 72 01 F0 10 2B 26 2A 16 
      mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.End_Looting.Text,Class'SBGuiStrings'.default.No_Item_Selected.Text,Class'GUI_BaseDesktop'.1 | Class'GUI_BaseDesktop'.32,0,self);//000B : 19 01 48 0C 9D 19 55 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 2B 99 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 23 99 19 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 02 00 04 2C 20 16 25 17 16 
      return True;                                                              //0069 : 04 27 
    }
    mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.End_Looting.Text,Class'SBGuiStrings'.default.Are_you_sure_you_want_to_assign_this_item.Text,Class'GUI_BaseDesktop'.4 | Class'GUI_BaseDesktop'.8 | Class'GUI_BaseDesktop'.32,10,self);//006B : 19 01 48 0C 9D 19 64 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 2B 99 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 B5 2F 16 9E 9E 12 20 00 68 D7 00 02 00 04 2C 04 12 20 00 68 D7 00 02 00 04 2C 08 16 12 20 00 68 D7 00 02 00 04 2C 20 16 2C 0A 17 16 
    return True;                                                                //00D8 : 04 27 
    //07 6B 00 72 01 F0 10 2B 26 2A 16 19 01 48 0C 9D 19 55 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 
    //73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 2B 99 19 36 58 C6 6B 
    //0F 12 20 70 4B 32 1D 05 00 0C 02 98 23 99 19 9E 12 20 00 68 D7 00 01 00 04 26 12 20 00 68 D7 00 
    //02 00 04 2C 20 16 25 17 16 04 27 19 01 48 0C 9D 19 64 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 
    //73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 2B 99 19 36 58 C6 6B 
    //0F 12 20 70 4B 32 1D 05 00 0C 02 98 B5 2F 16 9E 9E 12 20 00 68 D7 00 02 00 04 2C 04 12 20 00 68 
    //D7 00 02 00 04 2C 08 16 12 20 00 68 D7 00 02 00 04 2C 20 16 2C 0A 17 16 04 27 04 0B 47 
  }


  function bool MBClickHandler(GUI_MessageBox aMessageBox,int aBoxTag,int aButtonTag) {
    switch (aBoxTag) {                                                          //0000 : 05 04 00 48 15 08 1B 
      case 10 :                                                                 //0007 : 0A 44 00 2C 0A 
        switch (aButtonTag) {                                                   //000C : 05 04 00 18 27 07 1B 
          case Class'GUI_BaseDesktop'.4 :                                       //0013 : 0A 2A 00 12 20 00 68 D7 00 02 00 04 2C 04 
            AssignSelected();                                                   //0021 : 1B 68 9A 00 00 16 
            break;                                                              //0027 : 06 41 00 
          case Class'GUI_BaseDesktop'.8 :                                       //002A : 0A 3B 00 12 20 00 68 D7 00 02 00 04 2C 08 
            break;                                                              //0038 : 06 41 00 
          default:                                                              //003B : 0A FF FF 
            break;                                                              //003E : 06 41 00 
        }
        break;                                                                  //0041 : 06 84 00 
      case 11 :                                                                 //0044 : 0A 81 00 2C 0B 
        switch (aButtonTag) {                                                   //0049 : 05 04 00 18 27 07 1B 
          case Class'GUI_BaseDesktop'.4 :                                       //0050 : 0A 67 00 12 20 00 68 D7 00 02 00 04 2C 04 
            AssignAll();                                                        //005E : 1B 6A 9A 00 00 16 
            break;                                                              //0064 : 06 7E 00 
          case Class'GUI_BaseDesktop'.8 :                                       //0067 : 0A 78 00 12 20 00 68 D7 00 02 00 04 2C 08 
            break;                                                              //0075 : 06 7E 00 
          default:                                                              //0078 : 0A FF FF 
            break;                                                              //007B : 06 7E 00 
        }
        break;                                                                  //007E : 06 84 00 
      default:                                                                  //0081 : 0A FF FF 
        return Super.MBClickHandler(aMessageBox,aBoxTag,aButtonTag);            //0084 : 04 1C 68 26 07 1B 00 A8 F4 34 26 00 48 15 08 1B 00 18 27 07 1B 16 
      }
    }
    //05 04 00 48 15 08 1B 0A 44 00 2C 0A 05 04 00 18 27 07 1B 0A 2A 00 12 20 00 68 D7 00 02 00 04 2C 
    //04 1B 68 9A 00 00 16 06 41 00 0A 3B 00 12 20 00 68 D7 00 02 00 04 2C 08 06 41 00 0A FF FF 06 41 
    //00 06 84 00 0A 81 00 2C 0B 05 04 00 18 27 07 1B 0A 67 00 12 20 00 68 D7 00 02 00 04 2C 04 1B 6A 
    //9A 00 00 16 06 7E 00 0A 78 00 12 20 00 68 D7 00 02 00 04 2C 08 06 7E 00 0A FF FF 06 7E 00 06 84 
    //00 0A FF FF 04 1C 68 26 07 1B 00 A8 F4 34 26 00 48 15 08 1B 00 18 27 07 1B 16 04 0B 47 
  }


  function ConfirmClose() {
    mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.End_Looting.Text,Class'SBGuiStrings'.default.End_Group_Loot_Confirm_Query.Text,Class'GUI_BaseDesktop'.4 | Class'GUI_BaseDesktop'.8 | Class'GUI_BaseDesktop'.32,1,self);//0000 : 19 01 48 0C 9D 19 63 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 2B 99 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 80 2C 99 19 9E 9E 12 20 00 68 D7 00 02 00 04 2C 04 12 20 00 68 D7 00 02 00 04 2C 08 16 12 20 00 68 D7 00 02 00 04 2C 20 16 26 17 16 
    //19 01 48 0C 9D 19 63 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 
    //C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 2B 99 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 
    //80 2C 99 19 9E 9E 12 20 00 68 D7 00 02 00 04 2C 04 12 20 00 68 D7 00 02 00 04 2C 08 16 12 20 00 
    //68 D7 00 02 00 04 2C 20 16 26 17 16 04 0B 47 
  }


  function bool IsValidLootItem(ClientLootInfo aLootItemInfo) {
    return aLootItemInfo.LootMode == Class'Loot_Transaction'.2;                 //0000 : 04 9A 39 3A 36 38 9A 2B 11 00 48 F6 34 26 12 20 38 0C 5D 01 02 00 04 2C 02 16 
    //04 9A 39 3A 36 38 9A 2B 11 00 48 F6 34 26 12 20 38 0C 5D 01 02 00 04 2C 02 16 04 0B 47 
  }


  function CheckStatus() {
    if (mItems.Length == 0) {                                                   //0000 : 07 12 00 9A 37 01 40 58 EC 25 25 16 
      HideWindow();                                                             //000C : 1B F7 98 00 00 16 
    }
    //07 12 00 9A 37 01 40 58 EC 25 25 16 1B F7 98 00 00 16 04 0B 47 
  }


  function HideWindow() {
    ResetTimer();                                                               //0000 : 1B AD 98 00 00 16 
    mTransactionIDs.Length = 0;                                                 //0006 : 0F 37 01 30 5F 2B 26 25 
    mDesktop.ShowStdWindow(42,2);                                               //000E : 19 01 48 0C 9D 19 0A 00 04 1B DF 0B 00 00 2C 2A 2C 02 16 
    //1B AD 98 00 00 16 0F 37 01 30 5F 2B 26 25 19 01 48 0C 9D 19 0A 00 04 1B DF 0B 00 00 2C 2A 2C 02 
    //16 04 0B 47 
  }


  function ShowWindow() {
    local export editinline Game_PlayerTeams teams;
    InitChoiceItemsOfMasterLoot();                                              //0000 : 1B 5D 9A 00 00 16 
    InitTimer();                                                                //0006 : 1B B4 98 00 00 16 
    if (!IsVisible()) {                                                         //000C : 07 8A 00 81 1C C0 E6 88 19 16 16 
      mDesktop.ShowStdWindow(42,1);                                             //0017 : 19 01 48 0C 9D 19 09 00 04 1B DF 0B 00 00 2C 2A 26 16 
      teams = Game_PlayerController(GetPlayerController()).GroupingTeams;       //0029 : 0F 00 80 C7 05 1B 19 2E 90 18 5B 01 1B 0E 2F 00 00 16 05 00 04 01 48 C2 18 11 
      if (teams != None) {                                                      //0043 : 07 8A 00 77 00 80 C7 05 1B 2A 16 
        mConfirmButton.SetEnabled(teams.IsTeamLeader());                        //004E : 19 01 40 5E 2B 26 15 00 00 1B 5F 32 00 00 19 00 80 C7 05 1B 06 00 04 1B DF 0D 00 00 16 16 
        mCancelButton.SetEnabled(teams.IsTeamLeader());                         //006C : 19 01 60 DC 2C 26 15 00 00 1B 5F 32 00 00 19 00 80 C7 05 1B 06 00 04 1B DF 0D 00 00 16 16 
      }
    }
    //1B 5D 9A 00 00 16 1B B4 98 00 00 16 07 8A 00 81 1C C0 E6 88 19 16 16 19 01 48 0C 9D 19 09 00 04 
    //1B DF 0B 00 00 2C 2A 26 16 0F 00 80 C7 05 1B 19 2E 90 18 5B 01 1B 0E 2F 00 00 16 05 00 04 01 48 
    //C2 18 11 07 8A 00 77 00 80 C7 05 1B 2A 16 19 01 40 5E 2B 26 15 00 00 1B 5F 32 00 00 19 00 80 C7 
    //05 1B 06 00 04 1B DF 0D 00 00 16 16 19 01 60 DC 2C 26 15 00 00 1B 5F 32 00 00 19 00 80 C7 05 1B 
    //06 00 04 1B DF 0D 00 00 16 16 04 0B 47 
  }


  function bool IsEligibleMember(int TransactionID,int memberID) {
    local Game_Pawn gamePawn;
    local export editinline Game_Looting gameLooting;
    local ClientLootInfo lootInfo;
    local int i;
    local int j;
    gamePawn = GetPawn();                                                       //0000 : 0F 00 78 CE 05 1B 1B 2B 0C 00 00 16 
    if (gamePawn != None && gamePawn.Looting != None) {                         //000C : 07 DE 00 82 77 00 78 CE 05 1B 2A 16 18 12 00 77 19 00 78 CE 05 1B 05 00 04 01 68 52 18 11 2A 16 16 
      gameLooting = gamePawn.Looting;                                           //002D : 0F 00 B8 2C 07 1B 19 00 78 CE 05 1B 05 00 04 01 68 52 18 11 
      i = 0;                                                                    //0041 : 0F 00 10 CA 05 1B 25 
      while (i < gameLooting.ClientLoot.Length) {                               //0048 : 07 DE 00 96 00 10 CA 05 1B 37 19 00 B8 2C 07 1B 05 00 00 01 C0 7D 2B 11 16 
        lootInfo = gameLooting.ClientLoot[i];                                   //0061 : 0F 00 D8 CC 05 1B 10 00 10 CA 05 1B 19 00 B8 2C 07 1B 05 00 00 01 C0 7D 2B 11 
        if (lootInfo.TransactionID == TransactionID) {                          //007B : 07 D4 00 9A 36 C0 99 2B 11 00 D8 CC 05 1B 00 00 FA 34 26 16 
          j = 0;                                                                //008F : 0F 00 A8 C8 05 1B 25 
          while (j < lootInfo.EligibleMembers.Length) {                         //0096 : 07 D1 00 96 00 A8 C8 05 1B 37 36 18 9C 2B 11 00 D8 CC 05 1B 16 
            if (lootInfo.EligibleMembers[j] == memberID) {                      //00AB : 07 C7 00 9A 10 00 A8 C8 05 1B 36 18 9C 2B 11 00 D8 CC 05 1B 00 88 F9 34 26 16 
              return True;                                                      //00C5 : 04 27 
            }
            ++j;                                                                //00C7 : A3 00 A8 C8 05 1B 16 
          }
          goto jl00DE;                                                          //00D1 : 06 DE 00 
        }
        ++i;                                                                    //00D4 : A3 00 10 CA 05 1B 16 
      }
    }
    return False;                                                               //00DE : 04 28 
    //0F 00 78 CE 05 1B 1B 2B 0C 00 00 16 07 DE 00 82 77 00 78 CE 05 1B 2A 16 18 12 00 77 19 00 78 CE 
    //05 1B 05 00 04 01 68 52 18 11 2A 16 16 0F 00 B8 2C 07 1B 19 00 78 CE 05 1B 05 00 04 01 68 52 18 
    //11 0F 00 10 CA 05 1B 25 07 DE 00 96 00 10 CA 05 1B 37 19 00 B8 2C 07 1B 05 00 00 01 C0 7D 2B 11 
    //16 0F 00 D8 CC 05 1B 10 00 10 CA 05 1B 19 00 B8 2C 07 1B 05 00 00 01 C0 7D 2B 11 07 D4 00 9A 36 
    //C0 99 2B 11 00 D8 CC 05 1B 00 00 FA 34 26 16 0F 00 A8 C8 05 1B 25 07 D1 00 96 00 A8 C8 05 1B 37 
    //36 18 9C 2B 11 00 D8 CC 05 1B 16 07 C7 00 9A 10 00 A8 C8 05 1B 36 18 9C 2B 11 00 D8 CC 05 1B 00 
    //88 F9 34 26 16 04 27 A3 00 A8 C8 05 1B 16 06 96 00 06 DE 00 A3 00 10 CA 05 1B 16 06 48 00 04 28 
    //04 0B 47 
  }


  function OnPlayerComboChanged(GUI_Component sender,int NewValue) {
    local int iconIndex;
    local GUI_ComboBox Box;
    Box = GUI_ComboBox(sender);                                                 //0000 : 0F 00 70 A9 04 1B 2E B8 F5 2E 1D 00 00 FD 34 26 
    if (Box != None && Box.mOwnerPage != None) {                                //0010 : 07 89 00 82 77 00 70 A9 04 1B 2A 16 18 12 00 77 19 00 70 A9 04 1B 05 00 04 01 08 B0 9D 19 2A 16 16 
      iconIndex = Box.mOwnerPage.mIntTag;                                       //0031 : 0F 00 88 D4 05 1B 19 19 00 70 A9 04 1B 05 00 04 01 08 B0 9D 19 05 00 04 01 58 90 31 16 
      if (iconIndex > -1 && iconIndex < mItems.Length) {                        //004E : 07 89 00 82 97 00 88 D4 05 1B 1D FF FF FF FF 16 18 0E 00 96 00 88 D4 05 1B 37 01 40 58 EC 25 16 16 
        if (mItems[iconIndex].PlayerCombo == Box) {                             //006F : 07 89 00 72 36 98 76 2B 26 10 00 88 D4 05 1B 01 40 58 EC 25 00 70 A9 04 1B 16 
        }
      }
    }
    //0F 00 70 A9 04 1B 2E B8 F5 2E 1D 00 00 FD 34 26 07 89 00 82 77 00 70 A9 04 1B 2A 16 18 12 00 77 
    //19 00 70 A9 04 1B 05 00 04 01 08 B0 9D 19 2A 16 16 0F 00 88 D4 05 1B 19 19 00 70 A9 04 1B 05 00 
    //04 01 08 B0 9D 19 05 00 04 01 58 90 31 16 07 89 00 82 97 00 88 D4 05 1B 1D FF FF FF FF 16 18 0E 
    //00 96 00 88 D4 05 1B 37 01 40 58 EC 25 16 16 07 89 00 72 36 98 76 2B 26 10 00 88 D4 05 1B 01 40 
    //58 EC 25 00 70 A9 04 1B 16 04 0B 47 
  }


  function bool ItemClickHandler(GUI_Component clickedButton) {
    local export editinline Game_PlayerTeams team;
    local int itemIndex;
    local GUI_ComboBox Box;
    team = Game_PlayerController(GetPlayerController()).GroupingTeams;          //0000 : 0F 00 C0 2F 07 1B 19 2E 90 18 5B 01 1B 0E 2F 00 00 16 05 00 04 01 48 C2 18 11 
    if (team != None) {                                                         //001A : 07 F3 00 77 00 C0 2F 07 1B 2A 16 
      if (team.IsTeamLeader()) {                                                //0025 : 07 F3 00 19 00 C0 2F 07 1B 06 00 04 1B DF 0D 00 00 16 
        mSelectedItem = HUD_ItemButton(clickedButton);                          //0037 : 0F 01 F0 10 2B 26 2E 20 6C EB 25 00 80 1A 08 1B 
        if (mSelectedItem != None
          && mSelectedItem.mOwnerPage != None) {//0047 : 07 F3 00 82 77 01 F0 10 2B 26 2A 16 18 12 00 77 19 01 F0 10 2B 26 05 00 04 01 08 B0 9D 19 2A 16 16 
          itemIndex = mSelectedItem.mOwnerPage.mIntTag;                         //0068 : 0F 00 60 D6 05 1B 19 19 01 F0 10 2B 26 05 00 04 01 08 B0 9D 19 05 00 04 01 58 90 31 16 
          if (itemIndex > -1 && itemIndex < mItems.Length) {                    //0085 : 07 F3 00 82 97 00 60 D6 05 1B 1D FF FF FF FF 16 18 0E 00 96 00 60 D6 05 1B 37 01 40 58 EC 25 16 16 
            Box = mItems[itemIndex].PlayerCombo;                                //00A6 : 0F 00 48 2F 07 1B 36 98 76 2B 26 10 00 60 D6 05 1B 01 40 58 EC 25 
            if (Box != None) {                                                  //00BC : 07 F3 00 77 00 48 2F 07 1B 2A 16 
              if (Box.GetSelection() == -3) {                                   //00C7 : 07 F3 00 9A 19 00 48 2F 07 1B 06 00 04 1B 27 98 00 00 16 1D FD FF FF FF 16 
                mSelectedItem = None;                                           //00E0 : 0F 01 F0 10 2B 26 2A 
                return Super.ItemClickHandler(clickedButton);                   //00E7 : 04 1C B0 D5 05 1B 00 80 1A 08 1B 16 
              }
            }
          }
        }
      }
    }
    return True;                                                                //00F3 : 04 27 
    //0F 00 C0 2F 07 1B 19 2E 90 18 5B 01 1B 0E 2F 00 00 16 05 00 04 01 48 C2 18 11 07 F3 00 77 00 C0 
    //2F 07 1B 2A 16 07 F3 00 19 00 C0 2F 07 1B 06 00 04 1B DF 0D 00 00 16 0F 01 F0 10 2B 26 2E 20 6C 
    //EB 25 00 80 1A 08 1B 07 F3 00 82 77 01 F0 10 2B 26 2A 16 18 12 00 77 19 01 F0 10 2B 26 05 00 04 
    //01 08 B0 9D 19 2A 16 16 0F 00 60 D6 05 1B 19 19 01 F0 10 2B 26 05 00 04 01 08 B0 9D 19 05 00 04 
    //01 58 90 31 16 07 F3 00 82 97 00 60 D6 05 1B 1D FF FF FF FF 16 18 0E 00 96 00 60 D6 05 1B 37 01 
    //40 58 EC 25 16 16 0F 00 48 2F 07 1B 36 98 76 2B 26 10 00 60 D6 05 1B 01 40 58 EC 25 07 F3 00 77 
    //00 48 2F 07 1B 2A 16 07 F3 00 9A 19 00 48 2F 07 1B 06 00 04 1B 27 98 00 00 16 1D FD FF FF FF 16 
    //0F 01 F0 10 2B 26 2A 04 1C B0 D5 05 1B 00 80 1A 08 1B 16 04 27 04 0B 47 
  }


  function CreateItemPageOfMasterLoot(int anIndex,Game_Item aGameItem,int aTransactionID) {
    local GUI_Page itemPage;
    local GUI_Button itemIcon;
    local GUI_ComboBox PlayerCombo;
    local GUI_Label Description;
    local int tempX;
    local int tempY;
    local export editinline Game_PlayerTeams team;
    local int i;
    CreateItemPage(anIndex,aGameItem);                                          //0000 : 1C 38 3F 2C 26 00 98 6B 04 1B 00 F0 07 35 26 16 
    if (anIndex > -1 && anIndex < mItems.Length) {                              //0010 : 07 C7 02 82 97 00 98 6B 04 1B 1D FF FF FF FF 16 18 0E 00 96 00 98 6B 04 1B 37 01 40 58 EC 25 16 16 
      itemIcon = mItems[anIndex].ItemButton;                                    //0031 : 0F 00 00 AC 04 1B 36 78 4D 89 19 10 00 98 6B 04 1B 01 40 58 EC 25 
      if (itemIcon != None && itemIcon.mOwnerPage != None) {                    //0047 : 07 C7 02 82 77 00 00 AC 04 1B 2A 16 18 12 00 77 19 00 00 AC 04 1B 05 00 04 01 08 B0 9D 19 2A 16 16 
        itemPage = itemIcon.mOwnerPage;                                         //0068 : 0F 00 78 AC 04 1B 19 00 00 AC 04 1B 05 00 04 01 08 B0 9D 19 
        team = Game_PlayerController(GetPlayerController()).GroupingTeams;      //007C : 0F 00 90 C2 2C 26 19 2E 90 18 5B 01 1B 0E 2F 00 00 16 05 00 04 01 48 C2 18 11 
        if (team != None && team.IsTeamLeader()) {                              //0096 : 07 51 02 82 77 00 90 C2 2C 26 2A 16 18 10 00 19 00 90 C2 2C 26 06 00 04 1B DF 0D 00 00 16 16 
          tempX = itemPage.mWidth - 130 + 2;                                    //00B5 : 0F 00 C8 20 08 1B 39 44 AF 19 00 78 AC 04 1B 05 00 04 01 60 87 31 16 39 3F 92 2C 82 2C 02 16 16 
          tempY = itemPage.mHeight - 24 + 2 + 2;                                //00D5 : 0F 00 D8 1F 08 1B 39 44 AF 19 00 78 AC 04 1B 05 00 04 01 40 88 31 16 39 3F 92 92 2C 18 2C 02 16 2C 02 16 16 
          PlayerCombo = itemPage.CreateComboBox("GUI_ComboBox",0,0,tempX,tempY,130,24);//00F9 : 0F 00 58 C5 2C 26 19 00 78 AC 04 1B 24 00 04 1B 1F 99 00 00 1F 47 55 49 5F 43 6F 6D 62 6F 42 6F 78 00 25 25 00 C8 20 08 1B 00 D8 1F 08 1B 2C 82 2C 18 16 
          PlayerCombo.AddItem(0,"");                                            //012C : 19 00 58 C5 2C 26 09 00 00 1B 52 10 00 00 25 1F 00 16 
          PlayerCombo.AddItem(-2,Class'SBGuiStrings'.default.Random.Text);      //013E : 19 00 58 C5 2C 26 1E 00 00 1B 52 10 00 00 1D FE FF FF FF 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B0 89 98 19 16 
          PlayerCombo.AddItem(-3,GetPawn().GetCharacterName());                 //0165 : 19 00 58 C5 2C 26 1B 00 00 1B 52 10 00 00 1D FD FF FF FF 19 1B 2B 0C 00 00 16 06 00 00 1B 67 05 00 00 16 16 
          i = 0;                                                                //0189 : 0F 00 08 70 04 1B 25 
          while (i < team.mTeamMembers.Length) {                                //0190 : 07 27 02 96 00 08 70 04 1B 37 19 00 90 C2 2C 26 05 00 00 01 18 EA 27 11 16 
            if (IsEligibleMember(aTransactionID,team.mTeamMembers[i].MemberHandle)) {//01A9 : 07 1D 02 1B 63 9A 00 00 00 78 07 35 26 19 10 00 08 70 04 1B 19 00 90 C2 2C 26 05 00 00 01 18 EA 27 11 05 00 04 01 20 EB 27 11 16 
              PlayerCombo.AddItem(team.mTeamMembers[i].MemberHandle,team.mTeamMembers[i].Name);//01D4 : 19 00 58 C5 2C 26 40 00 00 1B 52 10 00 00 19 10 00 08 70 04 1B 19 00 90 C2 2C 26 05 00 00 01 18 EA 27 11 05 00 04 01 20 EB 27 11 19 10 00 08 70 04 1B 19 00 90 C2 2C 26 05 00 00 01 18 EA 27 11 05 00 00 01 B8 27 28 11 16 
            }
            ++i;                                                                //021D : A3 00 08 70 04 1B 16 
          }
          PlayerCombo.__OnItemChange__Delegate = OnPlayerComboChanged;          //0227 : 45 19 00 58 C5 2C 26 05 00 08 01 F0 B6 A5 19 44 62 9A 00 00 
          mItems[anIndex].PlayerCombo = PlayerCombo;                            //023B : 0F 36 98 76 2B 26 10 00 98 6B 04 1B 01 40 58 EC 25 00 58 C5 2C 26 
        }
        Description = mItems[anIndex].ItemDescription;                          //0251 : 0F 00 10 AB 04 1B 36 88 9B 07 1B 10 00 98 6B 04 1B 01 40 58 EC 25 
        if (Description != None) {                                              //0267 : 07 C7 02 77 00 10 AB 04 1B 2A 16 
          Description.SetPosition(Description.mLeft,Description.mTop,itemPage.mWidth - itemIcon.mWidth + 2 - 2);//0272 : 19 00 10 AB 04 1B 4C 00 00 1B 23 98 00 00 19 00 10 AB 04 1B 05 00 04 01 08 86 31 16 19 00 10 AB 04 1B 05 00 04 01 80 86 31 16 AF AF 19 00 78 AC 04 1B 05 00 04 01 60 87 31 16 AE 19 00 00 AC 04 1B 05 00 04 01 60 87 31 16 39 3F 2C 02 16 16 39 3F 2C 02 16 16 
        }
      }
    }
    //1C 38 3F 2C 26 00 98 6B 04 1B 00 F0 07 35 26 16 07 C7 02 82 97 00 98 6B 04 1B 1D FF FF FF FF 16 
    //18 0E 00 96 00 98 6B 04 1B 37 01 40 58 EC 25 16 16 0F 00 00 AC 04 1B 36 78 4D 89 19 10 00 98 6B 
    //04 1B 01 40 58 EC 25 07 C7 02 82 77 00 00 AC 04 1B 2A 16 18 12 00 77 19 00 00 AC 04 1B 05 00 04 
    //01 08 B0 9D 19 2A 16 16 0F 00 78 AC 04 1B 19 00 00 AC 04 1B 05 00 04 01 08 B0 9D 19 0F 00 90 C2 
    //2C 26 19 2E 90 18 5B 01 1B 0E 2F 00 00 16 05 00 04 01 48 C2 18 11 07 51 02 82 77 00 90 C2 2C 26 
    //2A 16 18 10 00 19 00 90 C2 2C 26 06 00 04 1B DF 0D 00 00 16 16 0F 00 C8 20 08 1B 39 44 AF 19 00 
    //78 AC 04 1B 05 00 04 01 60 87 31 16 39 3F 92 2C 82 2C 02 16 16 0F 00 D8 1F 08 1B 39 44 AF 19 00 
    //78 AC 04 1B 05 00 04 01 40 88 31 16 39 3F 92 92 2C 18 2C 02 16 2C 02 16 16 0F 00 58 C5 2C 26 19 
    //00 78 AC 04 1B 24 00 04 1B 1F 99 00 00 1F 47 55 49 5F 43 6F 6D 62 6F 42 6F 78 00 25 25 00 C8 20 
    //08 1B 00 D8 1F 08 1B 2C 82 2C 18 16 19 00 58 C5 2C 26 09 00 00 1B 52 10 00 00 25 1F 00 16 19 00 
    //58 C5 2C 26 1E 00 00 1B 52 10 00 00 1D FE FF FF FF 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 
    //B0 89 98 19 16 19 00 58 C5 2C 26 1B 00 00 1B 52 10 00 00 1D FD FF FF FF 19 1B 2B 0C 00 00 16 06 
    //00 00 1B 67 05 00 00 16 16 0F 00 08 70 04 1B 25 07 27 02 96 00 08 70 04 1B 37 19 00 90 C2 2C 26 
    //05 00 00 01 18 EA 27 11 16 07 1D 02 1B 63 9A 00 00 00 78 07 35 26 19 10 00 08 70 04 1B 19 00 90 
    //C2 2C 26 05 00 00 01 18 EA 27 11 05 00 04 01 20 EB 27 11 16 19 00 58 C5 2C 26 40 00 00 1B 52 10 
    //00 00 19 10 00 08 70 04 1B 19 00 90 C2 2C 26 05 00 00 01 18 EA 27 11 05 00 04 01 20 EB 27 11 19 
    //10 00 08 70 04 1B 19 00 90 C2 2C 26 05 00 00 01 18 EA 27 11 05 00 00 01 B8 27 28 11 16 A3 00 08 
    //70 04 1B 16 06 90 01 45 19 00 58 C5 2C 26 05 00 08 01 F0 B6 A5 19 44 62 9A 00 00 0F 36 98 76 2B 
    //26 10 00 98 6B 04 1B 01 40 58 EC 25 00 58 C5 2C 26 0F 00 10 AB 04 1B 36 88 9B 07 1B 10 00 98 6B 
    //04 1B 01 40 58 EC 25 07 C7 02 77 00 10 AB 04 1B 2A 16 19 00 10 AB 04 1B 4C 00 00 1B 23 98 00 00 
    //19 00 10 AB 04 1B 05 00 04 01 08 86 31 16 19 00 10 AB 04 1B 05 00 04 01 80 86 31 16 AF AF 19 00 
    //78 AC 04 1B 05 00 04 01 60 87 31 16 AE 19 00 00 AC 04 1B 05 00 04 01 60 87 31 16 39 3F 2C 02 16 
    //16 39 3F 2C 02 16 16 04 0B 47 
  }


  function int AddItemPageOfMasterLoot(Game_Item aGameItem,float aTimerValue,int aTransactionID) {
    local int newIndex;
    newIndex = mItems.Length;                                                   //0000 : 0F 00 C8 AE 04 1B 37 01 40 58 EC 25 
    mItems.Length = newIndex + 1;                                               //000C : 0F 37 01 40 58 EC 25 92 00 C8 AE 04 1B 26 16 
    mItems[newIndex].Timer = aTimerValue;                                       //001B : 0F 36 88 6F 04 1B 10 00 C8 AE 04 1B 01 40 58 EC 25 00 C0 5E 35 26 
    CreateItemPageOfMasterLoot(newIndex,aGameItem,aTransactionID);              //0031 : 1B 61 9A 00 00 00 C8 AE 04 1B 00 38 5F 35 26 00 D0 09 35 26 16 
    return newIndex;                                                            //0046 : 04 00 C8 AE 04 1B 
    //0F 00 C8 AE 04 1B 37 01 40 58 EC 25 0F 37 01 40 58 EC 25 92 00 C8 AE 04 1B 26 16 0F 36 88 6F 04 
    //1B 10 00 C8 AE 04 1B 01 40 58 EC 25 00 C0 5E 35 26 1B 61 9A 00 00 00 C8 AE 04 1B 00 38 5F 35 26 
    //00 D0 09 35 26 16 04 00 C8 AE 04 1B 04 0B 47 
  }


  function InitChoiceItemsOfMasterLoot() {
    local int i;
    local int j;
    local int Index;
    local Game_Pawn gamePawn;
    local export editinline Game_Looting gameLooting;
    local ClientLootInfo lootInfo;
    RemoveAllItemPages();                                                       //0000 : 1B 3D 99 00 00 16 
    mTransactionIDs.Length = 0;                                                 //0006 : 0F 37 01 30 5F 2B 26 25 
    gamePawn = GetPawn();                                                       //000E : 0F 00 08 E8 05 1B 1B 2B 0C 00 00 16 
    if (gamePawn != None && gamePawn.Looting != None) {                         //001A : 07 0C 01 82 77 00 08 E8 05 1B 2A 16 18 12 00 77 19 00 08 E8 05 1B 05 00 04 01 68 52 18 11 2A 16 16 
      gameLooting = gamePawn.Looting;                                           //003B : 0F 00 80 33 07 1B 19 00 08 E8 05 1B 05 00 04 01 68 52 18 11 
      i = 0;                                                                    //004F : 0F 00 70 EC 05 1B 25 
      while (i < gameLooting.ClientLoot.Length) {                               //0056 : 07 0C 01 96 00 70 EC 05 1B 37 19 00 80 33 07 1B 05 00 00 01 C0 7D 2B 11 16 
        lootInfo = gameLooting.ClientLoot[i];                                   //006F : 0F 00 58 CF 2C 26 10 00 70 EC 05 1B 19 00 80 33 07 1B 05 00 00 01 C0 7D 2B 11 
        if (IsValidLootItem(lootInfo)) {                                        //0089 : 07 02 01 1B E4 98 00 00 00 58 CF 2C 26 16 
          AddTransactionID(lootInfo.TransactionID);                             //0097 : 1B CE 99 00 00 36 C0 99 2B 11 00 58 CF 2C 26 16 
          j = 0;                                                                //00A7 : 0F 00 A8 E9 05 1B 25 
          while (j < lootInfo.Items.Length) {                                   //00AE : 07 02 01 96 00 A8 E9 05 1B 37 36 28 9B 2B 11 00 58 CF 2C 26 16 
            Index = AddItemPageOfMasterLoot(lootInfo.Items[j].GameItem,lootInfo.Timer,lootInfo.TransactionID);//00C3 : 0F 00 28 60 35 26 1B 5F 9A 00 00 36 08 9D 2B 11 10 00 A8 E9 05 1B 36 28 9B 2B 11 00 58 CF 2C 26 36 48 7D 2B 11 00 58 CF 2C 26 36 C0 99 2B 11 00 58 CF 2C 26 16 
            ++j;                                                                //00F8 : A3 00 A8 E9 05 1B 16 
          }
        }
        ++i;                                                                    //0102 : A3 00 70 EC 05 1B 16 
      }
    }
    //1B 3D 99 00 00 16 0F 37 01 30 5F 2B 26 25 0F 00 08 E8 05 1B 1B 2B 0C 00 00 16 07 0C 01 82 77 00 
    //08 E8 05 1B 2A 16 18 12 00 77 19 00 08 E8 05 1B 05 00 04 01 68 52 18 11 2A 16 16 0F 00 80 33 07 
    //1B 19 00 08 E8 05 1B 05 00 04 01 68 52 18 11 0F 00 70 EC 05 1B 25 07 0C 01 96 00 70 EC 05 1B 37 
    //19 00 80 33 07 1B 05 00 00 01 C0 7D 2B 11 16 0F 00 58 CF 2C 26 10 00 70 EC 05 1B 19 00 80 33 07 
    //1B 05 00 00 01 C0 7D 2B 11 07 02 01 1B E4 98 00 00 00 58 CF 2C 26 16 1B CE 99 00 00 36 C0 99 2B 
    //11 00 58 CF 2C 26 16 0F 00 A8 E9 05 1B 25 07 02 01 96 00 A8 E9 05 1B 37 36 28 9B 2B 11 00 58 CF 
    //2C 26 16 0F 00 28 60 35 26 1B 5F 9A 00 00 36 08 9D 2B 11 10 00 A8 E9 05 1B 36 28 9B 2B 11 00 58 
    //CF 2C 26 36 48 7D 2B 11 00 58 CF 2C 26 36 C0 99 2B 11 00 58 CF 2C 26 16 A3 00 A8 E9 05 1B 16 06 
    //AE 00 A3 00 70 EC 05 1B 16 06 56 00 04 0B 47 
  }


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 50 37 06 1B 16 
    if (mConfirmButton != None) {                                               //0006 : 07 47 00 77 01 40 5E 2B 26 2A 16 
      mConfirmButton.SetText(Class'SBGuiStrings'.default.Assign.Text);          //0011 : 19 01 40 5E 2B 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 2A 99 19 16 
      mConfirmButton.__OnClick__Delegate = OnAssign;                            //0033 : 45 19 01 40 5E 2B 26 05 00 08 01 98 EB 9D 19 44 66 9A 00 00 
    }
    if (mCancelButton != None) {                                                //0047 : 07 88 00 77 01 60 DC 2C 26 2A 16 
      mCancelButton.SetText(Class'SBGuiStrings'.default.Assign_All.Text);       //0052 : 19 01 60 DC 2C 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 18 2B 99 19 16 
      mCancelButton.__OnClick__Delegate = OnAssignAll;                          //0074 : 45 19 01 60 DC 2C 26 05 00 08 01 98 EB 9D 19 44 67 9A 00 00 
    }
    mSelectedItem = None;                                                       //0088 : 0F 01 F0 10 2B 26 2A 
    //1C 50 37 06 1B 16 07 47 00 77 01 40 5E 2B 26 2A 16 19 01 40 5E 2B 26 19 00 00 1B 13 98 00 00 36 
    //58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 2A 99 19 16 45 19 01 40 5E 2B 26 05 00 08 01 98 EB 
    //9D 19 44 66 9A 00 00 07 88 00 77 01 60 DC 2C 26 2A 16 19 01 60 DC 2C 26 19 00 00 1B 13 98 00 00 
    //36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 18 2B 99 19 16 45 19 01 60 DC 2C 26 05 00 08 01 98 
    //EB 9D 19 44 67 9A 00 00 0F 01 F0 10 2B 26 2A 04 0B 47 
  }



