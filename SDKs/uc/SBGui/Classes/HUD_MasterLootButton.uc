//==============================================================================
//  HUD_MasterLootButton
//==============================================================================

class HUD_MasterLootButton extends HUD_ItemButton
    dependsOn(Item_Type)
    Transient
    Config(User)
  ;

  var transient int mMemberIndex;
  var transient Game_Pawn mSelectedMember;
  var (null);
  var (null);


  function UpdateDisplay() {
    if (mItem != None) {                                                        //0000 : 07 3F 00 77 01 F8 92 06 1B 2A 16 
      SetIconMaterial(mItem.GetLogo(GetPawn()),4.00000000,4.00000000);          //000B : 1B 34 98 00 00 19 01 F8 92 06 1B 0C 00 04 1B 71 0C 00 00 1B 2B 0C 00 00 16 16 1E 00 00 80 40 1E 00 00 80 40 16 
      SetText(GetMemberName());                                                 //0030 : 1B 13 98 00 00 1B 42 9A 00 00 16 16 
    } else {                                                                    //003C : 06 59 00 
      SetIconMaterial(None,0.00000000,0.00000000);                              //003F : 1B 34 98 00 00 2A 1E 00 00 00 00 1E 00 00 00 00 16 
      SetText(" ");                                                             //0050 : 1B 13 98 00 00 1F 20 00 16 
    }
    //07 3F 00 77 01 F8 92 06 1B 2A 16 1B 34 98 00 00 19 01 F8 92 06 1B 0C 00 04 1B 71 0C 00 00 1B 2B 
    //0C 00 00 16 16 1E 00 00 80 40 1E 00 00 80 40 16 1B 13 98 00 00 1B 42 9A 00 00 16 16 06 59 00 1B 
    //34 98 00 00 2A 1E 00 00 00 00 1E 00 00 00 00 16 1B 13 98 00 00 1F 20 00 16 04 0B 47 
  }


  function Reset() {
    Super.Reset();                                                              //0000 : 1C C0 5A 06 1B 16 
    mMemberIndex = -1;                                                          //0006 : 0F 01 80 57 06 1B 1D FF FF FF FF 
    mSelectedMember = None;                                                     //0011 : 0F 01 40 A6 35 26 2A 
    //1C C0 5A 06 1B 16 0F 01 80 57 06 1B 1D FF FF FF FF 0F 01 40 A6 35 26 2A 04 0B 47 
  }


  function string GetMemberName() {
    return "" $ string(mMemberIndex);                                           //0000 : 04 70 1F 00 39 53 01 80 57 06 1B 16 
    //04 70 1F 00 39 53 01 80 57 06 1B 16 04 0B 47 
  }


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 28 EB A1 19 16 
    Reset();                                                                    //0006 : 1B 53 12 00 00 16 
    //1C 28 EB A1 19 16 1B 53 12 00 00 16 04 0B 47 
  }


  delegate OnAssignLoot(HUD_MasterLootButton aButton);


  delegate OnGetGroupMemberInfo(HUD_MasterLootButton aButton,out array<Game_Pawn> aMembers);



