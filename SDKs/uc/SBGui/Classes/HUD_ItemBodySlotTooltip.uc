//==============================================================================
//  HUD_ItemBodySlotTooltip
//==============================================================================

class HUD_ItemBodySlotTooltip extends HUD_ItemTooltip
    dependsOn(GUI_TextCtrl,IC_BodySlot,Content_API,Game_PlayerStats,StringReferences)
    Transient
    Config(User)
  ;

  var GUI_TextCtrl mUserStartableText;


  function AddUserStartableText() {
    mUserStartableText = GUI_TextCtrl(CreatePage("GUI_TextCtrl",0,256,0,mHeight,GetClientWidth(),0));//0000 : 0F 01 80 A2 2B 26 2E 20 79 2F 1D 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 1D 00 01 00 00 25 39 44 01 40 88 31 16 39 44 1B 17 98 00 00 16 25 16 
    mUserStartableText.SetBorder(4,0,4,0);                                      //0036 : 19 01 80 A2 2B 26 0C 00 00 1B 2B 98 00 00 2C 04 25 2C 04 25 16 
    mUserStartableText.SetColor(183,183,183);                                   //004B : 19 01 80 A2 2B 26 0C 00 00 1B 19 98 00 00 2C B7 2C B7 2C B7 16 
    mUserStartableText.SetFont("SBFontsTX.Verdana10");                          //0060 : 19 01 80 A2 2B 26 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 
    if (IC_BodySlot(mItem.Type.GetComponentByClass(Class'IC_BodySlot')).UserStartable) {//0084 : 07 D8 00 19 2E 38 10 5C 01 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 0B 00 04 1C 00 31 22 11 20 38 10 5C 01 16 06 00 04 2D 01 10 4B 38 11 
      mUserStartableText.SetText(Class'SBGuiStrings'.default.User_startable.Text);//00B3 : 19 01 80 A2 2B 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E8 89 99 19 16 
    } else {                                                                    //00D5 : 06 FA 00 
      mUserStartableText.SetText(Class'SBGuiStrings'.default.Skill_startable.Text);//00D8 : 19 01 80 A2 2B 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 60 8A 99 19 16 
    }
    UpdateHeight(self,mUserStartableText);                                      //00FA : 1B 45 98 00 00 17 01 80 A2 2B 26 16 
    //0F 01 80 A2 2B 26 2E 20 79 2F 1D 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 1D 
    //00 01 00 00 25 39 44 01 40 88 31 16 39 44 1B 17 98 00 00 16 25 16 19 01 80 A2 2B 26 0C 00 00 1B 
    //2B 98 00 00 2C 04 25 2C 04 25 16 19 01 80 A2 2B 26 0C 00 00 1B 19 98 00 00 2C B7 2C B7 2C B7 16 
    //19 01 80 A2 2B 26 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 
    //31 30 00 16 07 D8 00 19 2E 38 10 5C 01 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 0B 00 04 1C 
    //00 31 22 11 20 38 10 5C 01 16 06 00 04 2D 01 10 4B 38 11 19 01 80 A2 2B 26 19 00 00 1B 13 98 00 
    //00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E8 89 99 19 16 06 FA 00 19 01 80 A2 2B 26 19 00 
    //00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 60 8A 99 19 16 1B 45 98 00 00 17 
    //01 80 A2 2B 26 16 04 0B 47 
  }


  function Color GetClassColor() {
    local export editinline IC_BodySlot lBodySlot;
    lBodySlot = IC_BodySlot(mItem.Type.GetComponentByClass(Class'IC_BodySlot'));//0000 : 0F 00 B8 80 07 1B 2E 38 10 5C 01 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 0B 00 04 1C 00 31 22 11 20 38 10 5C 01 16 
    if (lBodySlot.ForClass == Class'Content_API'.0
      || Game_PlayerStats(GetPawn().CharacterStats).GetCharacterClass() == lBodySlot.ForClass) {//0028 : 07 9A 00 84 9A 39 3A 19 00 B8 80 07 1B 05 00 01 01 00 4E 38 11 39 3A 12 20 40 5D 5B 01 02 00 01 24 00 16 18 33 00 9A 39 3A 19 2E 10 A3 5F 01 19 1B 2B 0C 00 00 16 05 00 04 01 08 43 34 0F 06 00 01 1B 59 0C 00 00 16 39 3A 19 00 B8 80 07 1B 05 00 01 01 00 4E 38 11 16 16 
      return Class'Canvas'.static.MakeColor(183,183,183);                       //0081 : 04 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 B7 24 B7 24 B7 16 
    } else {                                                                    //0097 : 06 B2 00 
      return Class'Canvas'.static.MakeColor(255,63,57);                         //009A : 04 12 20 88 EE C2 00 0E 00 04 1C 88 EB 76 0F 39 3D 2C FF 24 3F 24 39 16 
    }
    //0F 00 B8 80 07 1B 2E 38 10 5C 01 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 0B 00 04 1C 00 31 
    //22 11 20 38 10 5C 01 16 07 9A 00 84 9A 39 3A 19 00 B8 80 07 1B 05 00 01 01 00 4E 38 11 39 3A 12 
    //20 40 5D 5B 01 02 00 01 24 00 16 18 33 00 9A 39 3A 19 2E 10 A3 5F 01 19 1B 2B 0C 00 00 16 05 00 
    //04 01 08 43 34 0F 06 00 01 1B 59 0C 00 00 16 39 3A 19 00 B8 80 07 1B 05 00 01 01 00 4E 38 11 16 
    //16 04 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 B7 24 B7 24 B7 16 06 B2 00 04 12 20 88 EE C2 
    //00 0E 00 04 1C 88 EB 76 0F 39 3D 2C FF 24 3F 24 39 16 04 0B 47 
  }


  function string GetRequiredClass() {
    local export editinline IC_BodySlot lBodySlot;
    lBodySlot = IC_BodySlot(mItem.Type.GetComponentByClass(Class'IC_BodySlot'));//0000 : 0F 00 88 7F 07 1B 2E 38 10 5C 01 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 0B 00 04 1C 00 31 22 11 20 38 10 5C 01 16 
    if (lBodySlot.ForClass != Class'Content_API'.0) {                           //0028 : 07 6C 00 9B 39 3A 19 00 88 7F 07 1B 05 00 01 01 00 4E 38 11 39 3A 12 20 40 5D 5B 01 02 00 01 24 00 16 
      return Class'StringReferences'.GetClassName(lBodySlot.ForClass,False);    //004A : 04 12 20 20 F7 60 01 15 00 00 1B 54 0D 00 00 19 00 88 7F 07 1B 05 00 01 01 00 4E 38 11 28 16 
    } else {                                                                    //0069 : 06 7D 00 
      return "No class limit";                                                  //006C : 04 1F 4E 6F 20 63 6C 61 73 73 20 6C 69 6D 69 74 00 
    }
    //0F 00 88 7F 07 1B 2E 38 10 5C 01 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 0B 00 04 1C 00 31 
    //22 11 20 38 10 5C 01 16 07 6C 00 9B 39 3A 19 00 88 7F 07 1B 05 00 01 01 00 4E 38 11 39 3A 12 20 
    //40 5D 5B 01 02 00 01 24 00 16 04 12 20 20 F7 60 01 15 00 00 1B 54 0D 00 00 19 00 88 7F 07 1B 05 
    //00 01 01 00 4E 38 11 28 16 06 7D 00 04 1F 4E 6F 20 63 6C 61 73 73 20 6C 69 6D 69 74 00 04 0B 47 
    //
  }


  function bool UpdateTooltipInfo() {
    if (mItem != None) {                                                        //0000 : 07 A9 00 77 01 F8 22 EC 25 2A 16 
      if (ContextMenuOpen()) {                                                  //000B : 07 16 00 1B 96 98 00 00 16 
        return False;                                                           //0014 : 04 28 
      }
      AddHeader(mItem.Type.GetName(),GetLevelString(),GetRequiredClass(),mItem.Type.GetTypeName(),mItem.Type.GetRarityColor(),GetLevelColor(),GetClassColor());//0016 : 1B 3C 98 00 00 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 00 1B F9 03 00 00 16 1B D1 98 00 00 16 1B 4F 9A 00 00 16 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 00 1B 0D 1A 00 00 16 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 04 1B 7B 05 00 00 16 1B D0 98 00 00 16 1B 35 9A 00 00 16 16 
      AddDescription(mItem.Type.Description.Text);                              //007C : 1B 48 98 00 00 36 58 C6 6B 0F 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 05 00 0C 01 B0 F2 2B 11 16 
      AddUserStartableText();                                                   //009E : 1B 34 9A 00 00 16 
      return True;                                                              //00A4 : 04 27 
    } else {                                                                    //00A6 : 06 AB 00 
      return False;                                                             //00A9 : 04 28 
    }
    //07 A9 00 77 01 F8 22 EC 25 2A 16 07 16 00 1B 96 98 00 00 16 04 28 1B 3C 98 00 00 19 19 01 F8 22 
    //EC 25 05 00 04 01 98 2F 22 11 06 00 00 1B F9 03 00 00 16 1B D1 98 00 00 16 1B 4F 9A 00 00 16 19 
    //19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 00 1B 0D 1A 00 00 16 19 19 01 F8 22 EC 25 05 00 
    //04 01 98 2F 22 11 06 00 04 1B 7B 05 00 00 16 1B D0 98 00 00 16 1B 35 9A 00 00 16 16 1B 48 98 00 
    //00 36 58 C6 6B 0F 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 05 00 0C 01 B0 F2 2B 11 16 1B 34 
    //9A 00 00 16 04 27 06 AB 00 04 28 04 0B 47 
  }


  function ResetObjectTooltip() {
    if (mUserStartableText != None) {                                           //0000 : 07 1D 00 77 01 80 A2 2B 26 2A 16 
      DestroyComponent(mUserStartableText);                                     //000B : 1B 4D 98 00 00 01 80 A2 2B 26 16 
      mUserStartableText = None;                                                //0016 : 0F 01 80 A2 2B 26 2A 
    }
    Super.ResetObjectTooltip();                                                 //001D : 1C 20 0D A6 19 16 
    //07 1D 00 77 01 80 A2 2B 26 2A 16 1B 4D 98 00 00 01 80 A2 2B 26 16 0F 01 80 A2 2B 26 2A 1C 20 0D 
    //A6 19 16 04 0B 47 
  }



