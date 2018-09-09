//==============================================================================
//  HUD_ItemTooltip
//==============================================================================

class HUD_ItemTooltip extends GUI_ObjectTooltipPage
    dependsOn(HUD_ItemContainer,Game_Item,Item_Type,SBGuiStrings,Game_Pawn,Game_CharacterStats)
    Transient
    Config(User)
  ;

  var Game_Item mItem;


  event bool ContextMenuOpen() {
    local HUD_ItemContainer container;
    if (mItem != None) {                                                        //0000 : 07 44 00 77 01 F8 22 EC 25 2A 16 
      container = HUD_ItemContainer(mDesktop.GetHiliteComponent());             //000B : 0F 00 90 71 07 1B 2E B0 8A 30 1D 19 01 48 0C 9D 19 06 00 04 1C B0 0D 89 19 16 
      if (container != None) {                                                  //0025 : 07 44 00 77 00 90 71 07 1B 2A 16 
        if (container.HasContextMenuOpen()) {                                   //0030 : 07 44 00 19 00 90 71 07 1B 06 00 04 1B DF 99 00 00 16 
          return True;                                                          //0042 : 04 27 
        }
      }
    }
    return False;                                                               //0044 : 04 28 
    //07 44 00 77 01 F8 22 EC 25 2A 16 0F 00 90 71 07 1B 2E B0 8A 30 1D 19 01 48 0C 9D 19 06 00 04 1C 
    //B0 0D 89 19 16 07 44 00 77 00 90 71 07 1B 2A 16 07 44 00 19 00 90 71 07 1B 06 00 04 1B DF 99 00 
    //00 16 04 27 04 28 04 0B 47 
  }


  event bool ShouldUpdate() {
    return ContextMenuOpen();                                                   //0000 : 04 1B 96 98 00 00 16 
    //04 1B 96 98 00 00 16 04 0B 47 
  }


  function string GetAttuned() {
    if (mItem != None) {                                                        //0000 : 07 6C 00 77 01 F8 22 EC 25 2A 16 
      if (mItem.Type.Tradable && mItem.Attuned == 0) {                          //000B : 07 55 00 82 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 04 2D 01 18 EF 2B 11 18 14 00 9A 39 3A 19 01 F8 22 EC 25 05 00 01 01 28 3F 2E 11 25 16 16 
        return Class'SBGuiStrings'.default.Not_Attuned.Text;                    //003E : 04 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 8E 99 19 
      } else {                                                                  //0052 : 06 69 00 
        return Class'SBGuiStrings'.default.Attuned.Text;                        //0055 : 04 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 8E 99 19 
      }
    } else {                                                                    //0069 : 06 6F 00 
      return "";                                                                //006C : 04 1F 00 
    }
    //07 6C 00 77 01 F8 22 EC 25 2A 16 07 55 00 82 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 
    //04 2D 01 18 EF 2B 11 18 14 00 9A 39 3A 19 01 F8 22 EC 25 05 00 01 01 28 3F 2E 11 25 16 16 04 36 
    //58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 8E 99 19 06 69 00 04 36 58 C6 6B 0F 12 20 70 4B 32 
    //1D 05 00 0C 02 20 8E 99 19 06 6F 00 04 1F 00 04 0B 47 
  }


  function Color GetLevelColor() {
    if (GetPawn().CharacterStats.mRecord.FameLevel >= mItem.Type.GetItemLevel()) {//0000 : 07 55 00 99 36 00 2D 34 0F 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 39 3A 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 01 1C 00 E4 2B 11 16 16 
      return Class'Canvas'.static.MakeColor(32,108,38);                         //003C : 04 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 20 24 6C 24 26 16 
    } else {                                                                    //0052 : 06 6B 00 
      return Class'Canvas'.static.MakeColor(171,1,0);                           //0055 : 04 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 AB 24 01 24 00 16 
    }
    //07 55 00 99 36 00 2D 34 0F 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 43 34 0F 05 00 68 01 78 2D 34 
    //0F 39 3A 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 01 1C 00 E4 2B 11 16 16 04 12 20 88 
    //EE C2 00 0C 00 04 1C 88 EB 76 0F 24 20 24 6C 24 26 16 06 6B 00 04 12 20 88 EE C2 00 0C 00 04 1C 
    //88 EB 76 0F 24 AB 24 01 24 00 16 04 0B 47 
  }


  function string GetLevelString() {
    local byte MinLevel;
    MinLevel = mItem.Type.GetItemLevel();                                       //0000 : 0F 00 88 6E 07 1B 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 01 1C 00 E4 2B 11 16 
    if (MinLevel > 0) {                                                         //001E : 07 4B 00 97 39 3A 00 88 6E 07 1B 25 16 
      return Class'SBGuiStrings'.default.Level_Header.Text
        @ string(MinLevel);//002B : 04 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 92 98 19 39 52 00 88 6E 07 1B 16 
    } else {                                                                    //0048 : 06 4E 00 
      return "";                                                                //004B : 04 1F 00 
    }
    //0F 00 88 6E 07 1B 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 01 1C 00 E4 2B 11 16 07 4B 
    //00 97 39 3A 00 88 6E 07 1B 25 16 04 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 92 98 19 
    //39 52 00 88 6E 07 1B 16 06 4E 00 04 1F 00 04 0B 47 
  }


  function bool UpdateTooltipInfo() {
    if (mItem != None) {                                                        //0000 : 07 99 00 77 01 F8 22 EC 25 2A 16 
      if (ContextMenuOpen()) {                                                  //000B : 07 16 00 1B 96 98 00 00 16 
        return False;                                                           //0014 : 04 28 
      }
      AddHeader(mItem.Type.GetName(),GetLevelString(),"",mItem.Type.GetTypeName(),mItem.Type.GetRarityColor(),GetLevelColor());//0016 : 1B 3C 98 00 00 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 00 1B F9 03 00 00 16 1B D1 98 00 00 16 1F 00 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 00 1B 0D 1A 00 00 16 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 04 1B 7B 05 00 00 16 1B D0 98 00 00 16 16 
      AddDescription(mItem.Type.Description.Text);                              //0072 : 1B 48 98 00 00 36 58 C6 6B 0F 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 05 00 0C 01 B0 F2 2B 11 16 
      return True;                                                              //0094 : 04 27 
    } else {                                                                    //0096 : 06 9B 00 
      return False;                                                             //0099 : 04 28 
    }
    //07 99 00 77 01 F8 22 EC 25 2A 16 07 16 00 1B 96 98 00 00 16 04 28 1B 3C 98 00 00 19 19 01 F8 22 
    //EC 25 05 00 04 01 98 2F 22 11 06 00 00 1B F9 03 00 00 16 1B D1 98 00 00 16 1F 00 19 19 01 F8 22 
    //EC 25 05 00 04 01 98 2F 22 11 06 00 00 1B 0D 1A 00 00 16 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 
    //22 11 06 00 04 1B 7B 05 00 00 16 1B D0 98 00 00 16 16 1B 48 98 00 00 36 58 C6 6B 0F 19 19 01 F8 
    //22 EC 25 05 00 04 01 98 2F 22 11 05 00 0C 01 B0 F2 2B 11 16 04 27 06 9B 00 04 28 04 0B 47 
  }


  function bool UpdateTooltipObject(Object aObject) {
    mItem = Game_Item(aObject);                                                 //0000 : 0F 01 F8 22 EC 25 2E 30 E6 5B 01 00 48 E5 33 26 
    return Super.UpdateTooltipObject(aObject);                                  //0010 : 04 1C C8 0B A6 19 00 48 E5 33 26 16 
    //0F 01 F8 22 EC 25 2E 30 E6 5B 01 00 48 E5 33 26 04 1C C8 0B A6 19 00 48 E5 33 26 16 04 0B 47 
  }



