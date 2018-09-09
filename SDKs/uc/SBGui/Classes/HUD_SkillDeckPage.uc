//==============================================================================
//  HUD_SkillDeckPage
//==============================================================================

class HUD_SkillDeckPage extends GUI_Page
    dependsOn(Game_Pawn,EventNotification,GUI_DnDInfo,GUI_Button,FSkill_Type,GUI_Desktop,Class,SBGuiStrings,GUI_Label,Game_CombatStats,Game_CombatState,GUI_BaseDesktop,Game_Skills)
    Transient
    Config(User)
  ;

  var GUI_Label mTierName;
  var GUI_Page mSkillPage;
  var array<GUI_Button> mSkillSlots;
  var array<FSkill_Type> mSkills;
  var private GUI_Image mBackgroundImage;
  var (null);
  var (null);
  var (null);


  function SetDelegates() {
    local Game_Pawn Pawn;
    Pawn = GetPawn();                                                           //0000 : 0F 00 C8 18 A6 19 1B 2B 0C 00 00 16 
    if (Pawn != None
      && Pawn.CombatStateChanged != None) {                //000C : 07 5A 00 82 77 00 C8 18 A6 19 2A 16 18 12 00 77 19 00 C8 18 A6 19 05 00 04 01 E0 52 18 11 2A 16 16 
      Pawn.CombatStateChanged.AddListener(self,name("UpdateSlotColors"));       //002D : 19 19 00 C8 18 A6 19 05 00 04 01 E0 52 18 11 1B 00 00 1C 48 A5 25 11 17 39 5A 1F 55 70 64 61 74 65 53 6C 6F 74 43 6F 6C 6F 72 73 00 16 
    }
    __OnHilite__Delegate = HiliteHandler;                                       //005A : 45 01 E8 E6 9D 19 44 CC 96 00 00 
    __OnDeHilite__Delegate = DeHiliteHandler;                                   //0065 : 45 01 60 E7 9D 19 44 45 99 00 00 
    __OnDrag__Delegate = DragHandler;                                           //0070 : 45 01 F0 ED 9D 19 44 B1 98 00 00 
    __OnDrop__Delegate = DropHandler;                                           //007B : 45 01 68 EE 9D 19 44 69 98 00 00 
    //0F 00 C8 18 A6 19 1B 2B 0C 00 00 16 07 5A 00 82 77 00 C8 18 A6 19 2A 16 18 12 00 77 19 00 C8 18 
    //A6 19 05 00 04 01 E0 52 18 11 2A 16 16 19 19 00 C8 18 A6 19 05 00 04 01 E0 52 18 11 1B 00 00 1C 
    //48 A5 25 11 17 39 5A 1F 55 70 64 61 74 65 53 6C 6F 74 43 6F 6C 6F 72 73 00 16 45 01 E8 E6 9D 19 
    //44 CC 96 00 00 45 01 60 E7 9D 19 44 45 99 00 00 45 01 F0 ED 9D 19 44 B1 98 00 00 45 01 68 EE 9D 
    //19 44 69 98 00 00 04 0B 47 
  }


  event OnComponentDestroyed() {
    local Game_Pawn Pawn;
    Pawn = GetPawn();                                                           //0000 : 0F 00 C0 1A A7 19 1B 2B 0C 00 00 16 
    if (Pawn != None
      && Pawn.CombatStateChanged != None) {                //000C : 07 46 00 82 77 00 C0 1A A7 19 2A 16 18 12 00 77 19 00 C0 1A A7 19 05 00 04 01 E0 52 18 11 2A 16 16 
      Pawn.CombatStateChanged.RemoveListener(self);                             //002D : 19 19 00 C0 1A A7 19 05 00 04 01 E0 52 18 11 07 00 00 1C 98 A4 25 11 17 16 
    }
    Super.OnComponentDestroyed();                                               //0046 : 1C E0 DA 9D 19 16 
    //0F 00 C0 1A A7 19 1B 2B 0C 00 00 16 07 46 00 82 77 00 C0 1A A7 19 2A 16 18 12 00 77 19 00 C0 1A 
    //A7 19 05 00 04 01 E0 52 18 11 2A 16 16 19 19 00 C0 1A A7 19 05 00 04 01 E0 52 18 11 07 00 00 1C 
    //98 A4 25 11 17 16 1C E0 DA 9D 19 16 04 0B 47 
  }


  event bool DeHiliteHandler(GUI_Component fromChild) {
    if (fromChild != self) {                                                    //0000 : 07 29 00 77 00 E8 1B A7 19 17 16 
      OnHiliteSlot(mIntTag,fromChild.mIntTag,False);                            //000B : 43 48 1F A3 19 F7 99 00 00 01 58 90 31 16 19 00 E8 1B A7 19 05 00 04 01 58 90 31 16 28 16 
    }
    return True;                                                                //0029 : 04 27 
    //07 29 00 77 00 E8 1B A7 19 17 16 43 48 1F A3 19 F7 99 00 00 01 58 90 31 16 19 00 E8 1B A7 19 05 
    //00 04 01 58 90 31 16 28 16 04 27 04 0B 47 
  }


  event bool HiliteHandler(GUI_Component fromChild) {
    if (fromChild != self) {                                                    //0000 : 07 29 00 77 00 88 1D A7 19 17 16 
      OnHiliteSlot(mIntTag,fromChild.mIntTag,True);                             //000B : 43 48 1F A3 19 F7 99 00 00 01 58 90 31 16 19 00 88 1D A7 19 05 00 04 01 58 90 31 16 27 16 
    }
    return True;                                                                //0029 : 04 27 
    //07 29 00 77 00 88 1D A7 19 17 16 43 48 1F A3 19 F7 99 00 00 01 58 90 31 16 19 00 88 1D A7 19 05 
    //00 04 01 58 90 31 16 27 16 04 27 04 0B 47 
  }


  event bool DropHandler(GUI_DnDInfo aDndInfo,float aRelMouseX,float aRelMouseY,GUI_Component aFromChild) {
    local int targetSlot;
    local int sourceSlot;
    local export editinline FSkill_Type draggedSkill;
    local export editinline FSkill_Type oldSkill;
    local HUD_SkillDeckPage originPage;
    if (aDndInfo.IsDragging() && aFromChild != self) {                          //0000 : 07 50 01 82 19 00 90 1F A7 19 06 00 04 1B 67 98 00 00 16 18 09 00 77 00 08 22 A7 19 17 16 16 
      targetSlot = GUI_Button(aFromChild).mIntTag;                              //001F : 0F 00 80 22 A7 19 19 2E 78 F0 2E 1D 00 08 22 A7 19 05 00 04 01 58 90 31 16 
      draggedSkill = FSkill_Type(aDndInfo.mParam);                              //0038 : 0F 00 F8 22 A7 19 2E 40 36 5D 01 19 00 90 1F A7 19 05 00 04 01 90 9F A1 19 
      sourceSlot = GUI_Button(aDndInfo.mSource).mIntTag;                        //0051 : 0F 00 70 23 A7 19 19 2E 78 F0 2E 1D 19 00 90 1F A7 19 05 00 04 01 D0 9B A1 19 05 00 04 01 58 90 31 16 
      originPage = HUD_SkillDeckPage(aDndInfo.mSource.mOwnerPage.mOwnerPage);   //0073 : 0F 00 E8 23 A7 19 2E D8 D2 8A 19 19 19 19 00 90 1F A7 19 05 00 04 01 D0 9B A1 19 05 00 04 01 08 B0 9D 19 05 00 04 01 08 B0 9D 19 
      oldSkill = mSkills[targetSlot];                                           //009E : 0F 00 60 24 A7 19 10 00 80 22 A7 19 01 18 D8 8A 19 
      SetSkill(targetSlot,draggedSkill);                                        //00AF : 1B 74 98 00 00 00 80 22 A7 19 00 F8 22 A7 19 16 
      if (originPage != None
        && originPage.mOwnerPage == mOwnerPage
        && oldSkill != None
        && originPage.GetSkill(sourceSlot) == None) {//00BF : 07 26 01 82 82 82 77 00 E8 23 A7 19 2A 16 18 16 00 72 19 00 E8 23 A7 19 05 00 04 01 08 B0 9D 19 01 08 B0 9D 19 16 16 18 09 00 77 00 60 24 A7 19 2A 16 16 18 18 00 72 19 00 E8 23 A7 19 0B 00 04 1B 90 98 00 00 00 70 23 A7 19 16 2A 16 16 
        originPage.SetSkill(sourceSlot,oldSkill);                               //010D : 19 00 E8 23 A7 19 10 00 00 1B 74 98 00 00 00 70 23 A7 19 00 60 24 A7 19 16 
      }
      aDndInfo.EndDrag();                                                       //0126 : 19 00 90 1F A7 19 06 00 00 1B 0C 9A 00 00 16 
      OnSetSlot(mIntTag,targetSlot,draggedSkill);                               //0135 : 43 58 1E A3 19 4D 9B 00 00 01 58 90 31 16 00 80 22 A7 19 00 F8 22 A7 19 16 
      return True;                                                              //014E : 04 27 
    }
    return False;                                                               //0150 : 04 28 
    //07 50 01 82 19 00 90 1F A7 19 06 00 04 1B 67 98 00 00 16 18 09 00 77 00 08 22 A7 19 17 16 16 0F 
    //00 80 22 A7 19 19 2E 78 F0 2E 1D 00 08 22 A7 19 05 00 04 01 58 90 31 16 0F 00 F8 22 A7 19 2E 40 
    //36 5D 01 19 00 90 1F A7 19 05 00 04 01 90 9F A1 19 0F 00 70 23 A7 19 19 2E 78 F0 2E 1D 19 00 90 
    //1F A7 19 05 00 04 01 D0 9B A1 19 05 00 04 01 58 90 31 16 0F 00 E8 23 A7 19 2E D8 D2 8A 19 19 19 
    //19 00 90 1F A7 19 05 00 04 01 D0 9B A1 19 05 00 04 01 08 B0 9D 19 05 00 04 01 08 B0 9D 19 0F 00 
    //60 24 A7 19 10 00 80 22 A7 19 01 18 D8 8A 19 1B 74 98 00 00 00 80 22 A7 19 00 F8 22 A7 19 16 07 
    //26 01 82 82 82 77 00 E8 23 A7 19 2A 16 18 16 00 72 19 00 E8 23 A7 19 05 00 04 01 08 B0 9D 19 01 
    //08 B0 9D 19 16 16 18 09 00 77 00 60 24 A7 19 2A 16 16 18 18 00 72 19 00 E8 23 A7 19 0B 00 04 1B 
    //90 98 00 00 00 70 23 A7 19 16 2A 16 16 19 00 E8 23 A7 19 10 00 00 1B 74 98 00 00 00 70 23 A7 19 
    //00 60 24 A7 19 16 19 00 90 1F A7 19 06 00 00 1B 0C 9A 00 00 16 43 58 1E A3 19 4D 9B 00 00 01 58 
    //90 31 16 00 80 22 A7 19 00 F8 22 A7 19 16 04 27 04 28 04 0B 47 
  }


  event bool DragHandler(GUI_DnDInfo aDndInfo,float aRelMouseX,float aRelMouseY,GUI_Component aFromChild) {
    local int Slot;
    if (!aDndInfo.IsDragging() && aFromChild != self) {                         //0000 : 07 0D 01 82 81 19 00 F0 26 A7 19 06 00 04 1B 67 98 00 00 16 16 18 09 00 77 00 68 27 A7 19 17 16 16 
      Slot = GUI_Button(aFromChild).mIntTag;                                    //0021 : 0F 00 E0 27 A7 19 19 2E 78 F0 2E 1D 00 68 27 A7 19 05 00 04 01 58 90 31 16 
      if (mSkills[Slot] != None) {                                              //003A : 07 0B 01 77 10 00 E0 27 A7 19 01 18 D8 8A 19 2A 16 
        aDndInfo.BeginDrag(aFromChild,mSkills[Slot]);                           //004B : 19 00 F0 26 A7 19 16 00 00 1B 71 99 00 00 00 68 27 A7 19 10 00 E0 27 A7 19 01 18 D8 8A 19 16 
        aDndInfo.SetImage(mBackgroundImage);                                    //006A : 19 00 F0 26 A7 19 0B 00 00 1B 64 98 00 00 01 58 28 A7 19 16 
        aDndInfo.SetMaterial(mSkills[Slot].Logo,32.00000000,32.00000000,aFromChild.mLeft + 3,aFromChild.mTop + 3);//007E : 19 00 F0 26 A7 19 4C 00 00 1B FE 98 00 00 19 10 00 E0 27 A7 19 01 18 D8 8A 19 05 00 04 01 68 B3 20 11 1E 00 00 00 42 1E 00 00 00 42 AE 19 00 68 27 A7 19 05 00 04 01 08 86 31 16 39 3F 2C 03 16 AE 19 00 68 27 A7 19 05 00 04 01 80 86 31 16 39 3F 2C 03 16 16 
        if (!mDesktop.IsKeyDown(16)) {                                          //00D3 : 07 09 01 81 19 01 48 0C 9D 19 08 00 04 1C 48 12 89 19 24 10 16 16 
          SetSkill(Slot,None);                                                  //00E9 : 1B 74 98 00 00 00 E0 27 A7 19 2A 16 
          OnClearSlot(mIntTag,Slot);                                            //00F5 : 43 D0 1E A3 19 4F 9B 00 00 01 58 90 31 16 00 E0 27 A7 19 16 
        }
        return True;                                                            //0109 : 04 27 
      }
      return False;                                                             //010B : 04 28 
    }
    return False;                                                               //010D : 04 28 
    //07 0D 01 82 81 19 00 F0 26 A7 19 06 00 04 1B 67 98 00 00 16 16 18 09 00 77 00 68 27 A7 19 17 16 
    //16 0F 00 E0 27 A7 19 19 2E 78 F0 2E 1D 00 68 27 A7 19 05 00 04 01 58 90 31 16 07 0B 01 77 10 00 
    //E0 27 A7 19 01 18 D8 8A 19 2A 16 19 00 F0 26 A7 19 16 00 00 1B 71 99 00 00 00 68 27 A7 19 10 00 
    //E0 27 A7 19 01 18 D8 8A 19 16 19 00 F0 26 A7 19 0B 00 00 1B 64 98 00 00 01 58 28 A7 19 16 19 00 
    //F0 26 A7 19 4C 00 00 1B FE 98 00 00 19 10 00 E0 27 A7 19 01 18 D8 8A 19 05 00 04 01 68 B3 20 11 
    //1E 00 00 00 42 1E 00 00 00 42 AE 19 00 68 27 A7 19 05 00 04 01 08 86 31 16 39 3F 2C 03 16 AE 19 
    //00 68 27 A7 19 05 00 04 01 80 86 31 16 39 3F 2C 03 16 16 07 09 01 81 19 01 48 0C 9D 19 08 00 04 
    //1C 48 12 89 19 24 10 16 16 1B 74 98 00 00 00 E0 27 A7 19 2A 16 43 D0 1E A3 19 4F 9B 00 00 01 58 
    //90 31 16 00 E0 27 A7 19 16 04 27 04 28 04 28 04 0B 47 
  }


  function FSkill_Type GetSkill(int aSlot) {
    return mSkills[aSlot];                                                      //0000 : 04 10 00 E8 2A A7 19 01 18 D8 8A 19 
    //04 10 00 E8 2A A7 19 01 18 D8 8A 19 04 0B 47 
  }


  function SetSkill(int aSlot,export editinline FSkill_Type aSkillType) {
    local bool assigned;
    if (aSkillType != None && mSkillSlots[aSlot].IsVisible()) {                 //0000 : 07 BD 00 82 77 00 48 2F A7 19 2A 16 18 16 00 19 10 00 C8 2C A7 19 01 C0 2F A7 19 06 00 04 1C C0 E6 88 19 16 16 
      mSkillSlots[aSlot].mMouseOverCursor = 8;                                  //0025 : 0F 19 10 00 C8 2C A7 19 01 C0 2F A7 19 05 00 04 01 20 7D 9D 19 2C 08 
      mSkillSlots[aSlot].mMouseDownCursor = 9;                                  //003C : 0F 19 10 00 C8 2C A7 19 01 C0 2F A7 19 05 00 04 01 A0 E3 9D 19 2C 09 
      mSkillSlots[aSlot].SetIconMaterial(aSkillType.Logo,5.00000000,5.00000000);//0053 : 19 10 00 C8 2C A7 19 01 C0 2F A7 19 1E 00 00 1B 34 98 00 00 19 00 48 2F A7 19 05 00 04 01 68 B3 20 11 1E 00 00 A0 40 1E 00 00 A0 40 16 
      mSkillSlots[aSlot].SetTooltipObject(aSkillType,"HUD_SimpleSkillTooltip"); //0080 : 19 10 00 C8 2C A7 19 01 C0 2F A7 19 23 00 00 1B 52 97 00 00 00 48 2F A7 19 1F 48 55 44 5F 53 69 6D 70 6C 65 53 6B 69 6C 6C 54 6F 6F 6C 74 69 70 00 16 
      assigned = True;                                                          //00B2 : 14 2D 00 38 30 A7 19 27 
    } else {                                                                    //00BA : 06 31 01 
      mSkillSlots[aSlot].mMouseOverCursor = 0;                                  //00BD : 0F 19 10 00 C8 2C A7 19 01 C0 2F A7 19 05 00 04 01 20 7D 9D 19 25 
      mSkillSlots[aSlot].mMouseDownCursor = 0;                                  //00D3 : 0F 19 10 00 C8 2C A7 19 01 C0 2F A7 19 05 00 04 01 A0 E3 9D 19 25 
      mSkillSlots[aSlot].SetIconMaterial(None,0.00000000,0.00000000);           //00E9 : 19 10 00 C8 2C A7 19 01 C0 2F A7 19 11 00 00 1B 34 98 00 00 2A 1E 00 00 00 00 1E 00 00 00 00 16 
      mSkillSlots[aSlot].ResetToolTipObject(Class'SBGuiStrings'.default.Empty_Skill_Slot.Text);//0109 : 19 10 00 C8 2C A7 19 01 C0 2F A7 19 19 00 00 1B 35 97 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 68 73 99 19 16 
    }
    if (assigned || aSkillType == None) {                                       //0131 : 07 58 01 84 2D 00 38 30 A7 19 18 09 00 72 00 48 2F A7 19 2A 16 16 
      mSkills[aSlot] = aSkillType;                                              //0147 : 0F 10 00 C8 2C A7 19 01 18 D8 8A 19 00 48 2F A7 19 
    }
    //07 BD 00 82 77 00 48 2F A7 19 2A 16 18 16 00 19 10 00 C8 2C A7 19 01 C0 2F A7 19 06 00 04 1C C0 
    //E6 88 19 16 16 0F 19 10 00 C8 2C A7 19 01 C0 2F A7 19 05 00 04 01 20 7D 9D 19 2C 08 0F 19 10 00 
    //C8 2C A7 19 01 C0 2F A7 19 05 00 04 01 A0 E3 9D 19 2C 09 19 10 00 C8 2C A7 19 01 C0 2F A7 19 1E 
    //00 00 1B 34 98 00 00 19 00 48 2F A7 19 05 00 04 01 68 B3 20 11 1E 00 00 A0 40 1E 00 00 A0 40 16 
    //19 10 00 C8 2C A7 19 01 C0 2F A7 19 23 00 00 1B 52 97 00 00 00 48 2F A7 19 1F 48 55 44 5F 53 69 
    //6D 70 6C 65 53 6B 69 6C 6C 54 6F 6F 6C 74 69 70 00 16 14 2D 00 38 30 A7 19 27 06 31 01 0F 19 10 
    //00 C8 2C A7 19 01 C0 2F A7 19 05 00 04 01 20 7D 9D 19 25 0F 19 10 00 C8 2C A7 19 01 C0 2F A7 19 
    //05 00 04 01 A0 E3 9D 19 25 19 10 00 C8 2C A7 19 01 C0 2F A7 19 11 00 00 1B 34 98 00 00 2A 1E 00 
    //00 00 00 1E 00 00 00 00 16 19 10 00 C8 2C A7 19 01 C0 2F A7 19 19 00 00 1B 35 97 00 00 36 58 C6 
    //6B 0F 12 20 70 4B 32 1D 05 00 0C 02 68 73 99 19 16 07 58 01 84 2D 00 38 30 A7 19 18 09 00 72 00 
    //48 2F A7 19 2A 16 16 0F 10 00 C8 2C A7 19 01 18 D8 8A 19 00 48 2F A7 19 04 0B 47 
  }


  function SetTier(int aTierID) {
    mIntTag = aTierID;                                                          //0000 : 0F 01 58 90 31 16 00 60 31 A7 19 
    mTierName.SetText(Class'SBGuiStrings'.default.tier.Text
      @ string(aTierID + 1));//000B : 19 01 58 32 A7 19 25 00 00 1B 13 98 00 00 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 A4 98 19 39 53 92 00 60 31 A7 19 26 16 16 16 
    //0F 01 58 90 31 16 00 60 31 A7 19 19 01 58 32 A7 19 25 00 00 1B 13 98 00 00 A8 36 58 C6 6B 0F 12 
    //20 70 4B 32 1D 05 00 0C 02 E0 A4 98 19 39 53 92 00 60 31 A7 19 26 16 16 16 04 0B 47 
  }


  function bool KeyEventHandler(GUI_Component component,out byte aKey,out byte aState,float aDelta) {
    if (aKey == 16) {                                                           //0000 : 07 10 00 9A 39 3A 00 40 34 A7 19 2C 10 16 
      return True;                                                              //000E : 04 27 
    }
    return False;                                                               //0010 : 04 28 
    //07 10 00 9A 39 3A 00 40 34 A7 19 2C 10 16 04 27 04 28 04 0B 47 
  }


  function UpdateSlotColors() {
    local int s;
    local int MaxRows;
    local int MaxCols;
    local bool inCombatOrReady;
    local Game_Pawn Pawn;
    Pawn = GetPawn();                                                           //0000 : 0F 00 C0 39 A7 19 1B 2B 0C 00 00 16 
    if (Pawn != None) {                                                         //000C : 07 56 00 77 00 C0 39 A7 19 2A 16 
      inCombatOrReady = Pawn.CombatStats.InCombat() || Pawn.combatState.CombatReady();//0017 : 14 2D 00 38 3A A7 19 84 19 19 00 C0 39 A7 19 05 00 04 01 30 41 18 11 06 00 04 1B 93 05 00 00 16 18 19 00 19 19 00 C0 39 A7 19 05 00 04 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 16 
    } else {                                                                    //0053 : 06 5E 00 
      inCombatOrReady = False;                                                  //0056 : 14 2D 00 38 3A A7 19 28 
    }
    GetMaxRowsAndCols(MaxRows,MaxCols);                                         //005E : 1B 50 9B 00 00 00 B0 3A A7 19 00 28 3B A7 19 16 
    if (mIntTag < MaxRows) {                                                    //006E : 07 78 01 96 01 58 90 31 16 00 B0 3A A7 19 16 
      s = 0;                                                                    //007D : 0F 00 D0 36 A7 19 25 
      while (s < 5) {                                                           //0084 : 07 75 01 96 00 D0 36 A7 19 2C 05 16 
        if (s < MaxCols) {                                                      //0090 : 07 55 01 96 00 D0 36 A7 19 00 28 3B A7 19 16 
          if (inCombatOrReady) {                                                //009F : 07 EA 00 2D 00 38 3A A7 19 
            mSkillSlots[s].SetEnabled(False);                                   //00A8 : 19 10 00 D0 36 A7 19 01 C0 2F A7 19 07 00 00 1B 5F 32 00 00 28 16 
            mSkillSlots[s].SetIconColors(0.50000000,0.50000000,0.50000000,1.00000000);//00BE : 19 10 00 D0 36 A7 19 01 C0 2F A7 19 1A 00 00 1B 92 98 00 00 1E 00 00 00 3F 1E 00 00 00 3F 1E 00 00 00 3F 1E 00 00 80 3F 16 
          } else {                                                              //00E7 : 06 52 01 
            mSkillSlots[s].SetEnabled(True);                                    //00EA : 19 10 00 D0 36 A7 19 01 C0 2F A7 19 07 00 00 1B 5F 32 00 00 27 16 
            mSkillSlots[s].SetBackgroundColors(1.00000000,1.00000000,1.00000000,1.00000000);//0100 : 19 10 00 D0 36 A7 19 01 C0 2F A7 19 1A 00 00 1B 8F 98 00 00 1E 00 00 80 3F 1E 00 00 80 3F 1E 00 00 80 3F 1E 00 00 80 3F 16 
            mSkillSlots[s].SetIconColors(1.00000000,1.00000000,1.00000000,1.00000000);//0129 : 19 10 00 D0 36 A7 19 01 C0 2F A7 19 1A 00 00 1B 92 98 00 00 1E 00 00 80 3F 1E 00 00 80 3F 1E 00 00 80 3F 1E 00 00 80 3F 16 
          }
        } else {                                                                //0152 : 06 6B 01 
          mSkillSlots[s].SetEnabled(False);                                     //0155 : 19 10 00 D0 36 A7 19 01 C0 2F A7 19 07 00 00 1B 5F 32 00 00 28 16 
        }
        ++s;                                                                    //016B : A3 00 D0 36 A7 19 16 
      }
    } else {                                                                    //0175 : 06 AB 01 
      s = 0;                                                                    //0178 : 0F 00 D0 36 A7 19 25 
      while (s < 5) {                                                           //017F : 07 AB 01 96 00 D0 36 A7 19 2C 05 16 
        mSkillSlots[s].SetEnabled(False);                                       //018B : 19 10 00 D0 36 A7 19 01 C0 2F A7 19 07 00 00 1B 5F 32 00 00 28 16 
        ++s;                                                                    //01A1 : A3 00 D0 36 A7 19 16 
      }
    }
    //0F 00 C0 39 A7 19 1B 2B 0C 00 00 16 07 56 00 77 00 C0 39 A7 19 2A 16 14 2D 00 38 3A A7 19 84 19 
    //19 00 C0 39 A7 19 05 00 04 01 30 41 18 11 06 00 04 1B 93 05 00 00 16 18 19 00 19 19 00 C0 39 A7 
    //19 05 00 04 01 B8 40 18 11 06 00 04 1B 19 0C 00 00 16 16 06 5E 00 14 2D 00 38 3A A7 19 28 1B 50 
    //9B 00 00 00 B0 3A A7 19 00 28 3B A7 19 16 07 78 01 96 01 58 90 31 16 00 B0 3A A7 19 16 0F 00 D0 
    //36 A7 19 25 07 75 01 96 00 D0 36 A7 19 2C 05 16 07 55 01 96 00 D0 36 A7 19 00 28 3B A7 19 16 07 
    //EA 00 2D 00 38 3A A7 19 19 10 00 D0 36 A7 19 01 C0 2F A7 19 07 00 00 1B 5F 32 00 00 28 16 19 10 
    //00 D0 36 A7 19 01 C0 2F A7 19 1A 00 00 1B 92 98 00 00 1E 00 00 00 3F 1E 00 00 00 3F 1E 00 00 00 
    //3F 1E 00 00 80 3F 16 06 52 01 19 10 00 D0 36 A7 19 01 C0 2F A7 19 07 00 00 1B 5F 32 00 00 27 16 
    //19 10 00 D0 36 A7 19 01 C0 2F A7 19 1A 00 00 1B 8F 98 00 00 1E 00 00 80 3F 1E 00 00 80 3F 1E 00 
    //00 80 3F 1E 00 00 80 3F 16 19 10 00 D0 36 A7 19 01 C0 2F A7 19 1A 00 00 1B 92 98 00 00 1E 00 00 
    //80 3F 1E 00 00 80 3F 1E 00 00 80 3F 1E 00 00 80 3F 16 06 6B 01 19 10 00 D0 36 A7 19 01 C0 2F A7 
    //19 07 00 00 1B 5F 32 00 00 28 16 A3 00 D0 36 A7 19 16 06 84 00 06 AB 01 0F 00 D0 36 A7 19 25 07 
    //AB 01 96 00 D0 36 A7 19 2C 05 16 19 10 00 D0 36 A7 19 01 C0 2F A7 19 07 00 00 1B 5F 32 00 00 28 
    //16 A3 00 D0 36 A7 19 16 06 7F 01 04 0B 47 
  }


  event Initialize() {
    local int s;
    mWidth = 386.00000000;                                                      //0000 : 0F 01 60 87 31 16 1E 00 00 C1 43 
    mHeight = 54.00000000;                                                      //000B : 0F 01 40 88 31 16 1E 00 00 58 42 
    Super.Initialize();                                                         //0016 : 1C 40 5B 9E 19 16 
    mTierName = CreateLabel("GUI_Label",0,4096,2,22,100,30);                    //001C : 0F 01 58 32 A7 19 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 1D 00 10 00 00 2C 02 2C 16 2C 64 2C 1E 16 
    mTierName.SetFont("SBFontsTX.Satanick16");                                  //0041 : 19 01 58 32 A7 19 1C 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 53 61 74 61 6E 69 63 6B 31 36 00 16 
    mTierName.SetColor(255,255,255);                                            //0066 : 19 01 58 32 A7 19 0C 00 00 1B 19 98 00 00 2C FF 2C FF 2C FF 16 
    mSkillPage = CreatePage("GUI_Page",768 | 524288,0,49,0,282,65);             //007B : 0F 01 90 40 A7 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 9E 1D 00 03 00 00 1D 00 00 08 00 16 25 2C 31 25 1D 1A 01 00 00 2C 41 16 
    mSkillPage.SetBackground("skillbook_skilltape","SBGuiTX.GUI_Styles","GUI_Styles");//00A8 : 19 01 90 40 A7 19 3B 00 00 1B 1A 98 00 00 1F 73 6B 69 6C 6C 62 6F 6F 6B 5F 73 6B 69 6C 6C 74 61 70 65 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    s = 0;                                                                      //00EC : 0F 00 50 3C A7 19 25 
    while (s < 5) {                                                             //00F3 : 07 57 02 96 00 50 3C A7 19 2C 05 16 
      mSkillSlots[s] = mSkillPage.CreateButton("GUI_Button",Class'GUI_BaseDesktop'.2097152 | Class'GUI_BaseDesktop'.768,0,0,0);//00FF : 0F 10 00 50 3C A7 19 01 C0 2F A7 19 19 01 90 40 A7 19 33 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 9E 12 20 00 68 D7 00 05 00 04 1D 00 00 20 00 12 20 00 68 D7 00 05 00 04 1D 00 03 00 00 16 25 25 25 16 
      mSkillSlots[s].SetBackground("skill_dropbox","SBGuiTX.Losse_Gui.SlotsnBoxes","SlotsnBoxes");//0147 : 19 10 00 50 3C A7 19 01 C0 2F A7 19 41 00 00 1B 1A 98 00 00 1F 73 6B 69 6C 6C 5F 64 72 6F 70 62 6F 78 00 1F 53 42 47 75 69 54 58 2E 4C 6F 73 73 65 5F 47 75 69 2E 53 6C 6F 74 73 6E 42 6F 78 65 73 00 1F 53 6C 6F 74 73 6E 42 6F 78 65 73 00 16 
      mSkillSlots[s].mTop = 11.00000000;                                        //0197 : 0F 19 10 00 50 3C A7 19 01 C0 2F A7 19 05 00 04 01 80 86 31 16 1E 00 00 30 41 
      mSkillSlots[s].mLeft = 10.00000000 + s * (mSkillSlots[s].mTexWidth + 15); //01B1 : 0F 19 10 00 50 3C A7 19 01 C0 2F A7 19 05 00 04 01 08 86 31 16 AE 1E 00 00 20 41 AB 39 3F 00 50 3C A7 19 AE 19 10 00 50 3C A7 19 01 C0 2F A7 19 05 00 04 01 F0 8A 31 16 39 3F 2C 0F 16 16 16 
      mSkillSlots[s].mIntTag = s;                                               //01F0 : 0F 19 10 00 50 3C A7 19 01 C0 2F A7 19 05 00 04 01 58 90 31 16 00 50 3C A7 19 
      mSkillSlots[s].__OnKeyEvent__Delegate = KeyEventHandler;                  //020A : 45 19 10 00 50 3C A7 19 01 C0 2F A7 19 05 00 08 01 30 EA 9D 19 44 D9 98 00 00 
      mSkillSlots[s].SetDisabledColors(0.69999999,0.69999999,0.69999999,1.00000000);//0224 : 19 10 00 50 3C A7 19 01 C0 2F A7 19 1A 00 00 1B 74 9A 00 00 1E 33 33 33 3F 1E 33 33 33 3F 1E 33 33 33 3F 1E 00 00 80 3F 16 
      ++s;                                                                      //024D : A3 00 50 3C A7 19 16 
    }
    mBackgroundImage = CreateImage("skill_dropbox_b","SBGuiTX.Losse_Gui.SlotsnBoxes","SlotsnBoxes");//0257 : 0F 01 58 28 A7 19 1B 26 98 00 00 1F 73 6B 69 6C 6C 5F 64 72 6F 70 62 6F 78 5F 62 00 1F 53 42 47 75 69 54 58 2E 4C 6F 73 73 65 5F 47 75 69 2E 53 6C 6F 74 73 6E 42 6F 78 65 73 00 1F 53 6C 6F 74 73 6E 42 6F 78 65 73 00 16 
    //0F 01 60 87 31 16 1E 00 00 C1 43 0F 01 40 88 31 16 1E 00 00 58 42 1C 40 5B 9E 19 16 0F 01 58 32 
    //A7 19 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 1D 00 10 00 00 2C 02 2C 16 2C 64 2C 1E 
    //16 19 01 58 32 A7 19 1C 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 53 61 74 61 6E 69 
    //63 6B 31 36 00 16 19 01 58 32 A7 19 0C 00 00 1B 19 98 00 00 2C FF 2C FF 2C FF 16 0F 01 90 40 A7 
    //19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 9E 1D 00 03 00 00 1D 00 00 08 00 16 25 2C 31 25 
    //1D 1A 01 00 00 2C 41 16 19 01 90 40 A7 19 3B 00 00 1B 1A 98 00 00 1F 73 6B 69 6C 6C 62 6F 6F 6B 
    //5F 73 6B 69 6C 6C 74 61 70 65 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 
    //47 55 49 5F 53 74 79 6C 65 73 00 16 0F 00 50 3C A7 19 25 07 57 02 96 00 50 3C A7 19 2C 05 16 0F 
    //10 00 50 3C A7 19 01 C0 2F A7 19 19 01 90 40 A7 19 33 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 
    //74 74 6F 6E 00 9E 12 20 00 68 D7 00 05 00 04 1D 00 00 20 00 12 20 00 68 D7 00 05 00 04 1D 00 03 
    //00 00 16 25 25 25 16 19 10 00 50 3C A7 19 01 C0 2F A7 19 41 00 00 1B 1A 98 00 00 1F 73 6B 69 6C 
    //6C 5F 64 72 6F 70 62 6F 78 00 1F 53 42 47 75 69 54 58 2E 4C 6F 73 73 65 5F 47 75 69 2E 53 6C 6F 
    //74 73 6E 42 6F 78 65 73 00 1F 53 6C 6F 74 73 6E 42 6F 78 65 73 00 16 0F 19 10 00 50 3C A7 19 01 
    //C0 2F A7 19 05 00 04 01 80 86 31 16 1E 00 00 30 41 0F 19 10 00 50 3C A7 19 01 C0 2F A7 19 05 00 
    //04 01 08 86 31 16 AE 1E 00 00 20 41 AB 39 3F 00 50 3C A7 19 AE 19 10 00 50 3C A7 19 01 C0 2F A7 
    //19 05 00 04 01 F0 8A 31 16 39 3F 2C 0F 16 16 16 0F 19 10 00 50 3C A7 19 01 C0 2F A7 19 05 00 04 
    //01 58 90 31 16 00 50 3C A7 19 45 19 10 00 50 3C A7 19 01 C0 2F A7 19 05 00 08 01 30 EA 9D 19 44 
    //D9 98 00 00 19 10 00 50 3C A7 19 01 C0 2F A7 19 1A 00 00 1B 74 9A 00 00 1E 33 33 33 3F 1E 33 33 
    //33 3F 1E 33 33 33 3F 1E 00 00 80 3F 16 A3 00 50 3C A7 19 16 06 F3 00 0F 01 58 28 A7 19 1B 26 98 
    //00 00 1F 73 6B 69 6C 6C 5F 64 72 6F 70 62 6F 78 5F 62 00 1F 53 42 47 75 69 54 58 2E 4C 6F 73 73 
    //65 5F 47 75 69 2E 53 6C 6F 74 73 6E 42 6F 78 65 73 00 1F 53 6C 6F 74 73 6E 42 6F 78 65 73 00 16 
    //04 0B 47 
  }


  function GetMaxRowsAndCols(out int MaxRows,out int MaxCols) {
    local Game_Pawn Pawn;
    Pawn = GetPawn();                                                           //0000 : 0F 00 30 42 A7 19 1B 2B 0C 00 00 16 
    if (Pawn != None && Pawn.Skills != None) {                                  //000C : 07 6B 00 82 77 00 30 42 A7 19 2A 16 18 12 00 77 19 00 30 42 A7 19 05 00 04 01 08 28 18 11 2A 16 16 
      MaxRows = Pawn.Skills.GetSkilldeckRowCount();                             //002D : 0F 00 B8 41 A7 19 19 19 00 30 42 A7 19 05 00 04 01 08 28 18 11 06 00 04 1B 00 0F 00 00 16 
      MaxCols = Pawn.Skills.GetSkilldeckColumnCount();                          //004B : 0F 00 A8 42 A7 19 19 19 00 30 42 A7 19 05 00 04 01 08 28 18 11 06 00 04 1B 87 0C 00 00 16 
      return;                                                                   //0069 : 04 0B 
    }
    MaxRows = 0;                                                                //006B : 0F 00 B8 41 A7 19 25 
    MaxCols = 0;                                                                //0072 : 0F 00 A8 42 A7 19 25 
    //0F 00 30 42 A7 19 1B 2B 0C 00 00 16 07 6B 00 82 77 00 30 42 A7 19 2A 16 18 12 00 77 19 00 30 42 
    //A7 19 05 00 04 01 08 28 18 11 2A 16 16 0F 00 B8 41 A7 19 19 19 00 30 42 A7 19 05 00 04 01 08 28 
    //18 11 06 00 04 1B 00 0F 00 00 16 0F 00 A8 42 A7 19 19 19 00 30 42 A7 19 05 00 04 01 08 28 18 11 
    //06 00 04 1B 87 0C 00 00 16 04 0B 0F 00 B8 41 A7 19 25 0F 00 A8 42 A7 19 25 04 0B 47 
  }


  delegate OnHiliteSlot(int row,int Slot,bool State);


  delegate OnClearSlot(int row,int Slot);


  delegate OnSetSlot(int row,int Slot,export editinline FSkill_Type skillType);



