//==============================================================================
//  HUD_ItemSigilTooltip
//==============================================================================

class HUD_ItemSigilTooltip extends HUD_ItemAttunedTooltip
    dependsOn(Class,SBGuiStrings,IC_TokenItem,Canvas)
    Transient
    Config(User)
  ;


  function bool UpdateTooltipInfo() {
    local export editinline IC_TokenItem tokenComponent;
    if (Super.UpdateTooltipInfo()) {                                            //0000 : 07 89 00 1C B0 7D 07 1B 16 
      tokenComponent = mItem.Type.GetItemTokenComponent();                      //0009 : 0F 00 60 7E 07 1B 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 04 1C D8 79 23 11 16 
      if (tokenComponent != None) {                                             //0027 : 07 87 00 77 00 60 7E 07 1B 2A 16 
        AddLine(Class'SBGuiStrings'.default.Sigil_rank_.Text
          @ string(tokenComponent.TokenRank),Class'Canvas'.static.MakeColor(163,159,186),Class'Canvas'.static.MakeColor(72,64,87));//0032 : 1B AB 96 00 00 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 40 8C 99 19 39 53 19 00 60 7E 07 1B 05 00 04 01 48 5B 34 11 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 A3 24 9F 24 BA 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 48 24 40 24 57 16 16 
      }
      return True;                                                              //0087 : 04 27 
    }
    return False;                                                               //0089 : 04 28 
    //07 89 00 1C B0 7D 07 1B 16 0F 00 60 7E 07 1B 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 
    //04 1C D8 79 23 11 16 07 87 00 77 00 60 7E 07 1B 2A 16 1B AB 96 00 00 A8 36 58 C6 6B 0F 12 20 70 
    //4B 32 1D 05 00 0C 02 40 8C 99 19 39 53 19 00 60 7E 07 1B 05 00 04 01 48 5B 34 11 16 12 20 88 EE 
    //C2 00 0C 00 04 1C 88 EB 76 0F 24 A3 24 9F 24 BA 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 
    //48 24 40 24 57 16 16 04 27 04 28 04 0B 47 
  }



