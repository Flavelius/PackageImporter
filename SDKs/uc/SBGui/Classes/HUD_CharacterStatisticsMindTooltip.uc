//==============================================================================
//  HUD_CharacterStatisticsMindTooltip
//==============================================================================

class HUD_CharacterStatisticsMindTooltip extends GUI_ObjectTooltipPage
    dependsOn(SBGuiStrings)
    Transient
    Config(User)
  ;


  function bool UpdateTooltipInfo() {
    AddHeader(Class'SBGuiStrings'.default.Mind.Text,"","",Class'SBGuiStrings'.default.Attribute.Text);//0000 : 1B 3C 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 60 8E 98 19 1F 00 1F 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D0 56 99 19 16 
    AddLine(Class'SBGuiStrings'.default.Mind_description1.Text);                //0030 : 1B AB 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 5B 99 19 16 
    AddLine("- "
      $ Class'SBGuiStrings'.default.Mind_line1.Text,Class'Canvas'.static.MakeColor(222,216,254),Class'Canvas'.static.MakeColor(72,64,87));//0049 : 1B AB 96 00 00 70 1F 2D 20 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 80 5B 99 19 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 DE 24 D8 24 FE 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 48 24 40 24 57 16 16 
    AddLine("- "
      $ Class'SBGuiStrings'.default.Mind_line2.Text,Class'Canvas'.static.MakeColor(222,216,254),Class'Canvas'.static.MakeColor(72,64,87));//0092 : 1B AB 96 00 00 70 1F 2D 20 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F8 5B 99 19 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 DE 24 D8 24 FE 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 48 24 40 24 57 16 16 
    AddLine("- "
      $ Class'SBGuiStrings'.default.Mind_line3.Text,Class'Canvas'.static.MakeColor(222,216,254),Class'Canvas'.static.MakeColor(72,64,87));//00DB : 1B AB 96 00 00 70 1F 2D 20 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 70 5C 99 19 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 DE 24 D8 24 FE 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 48 24 40 24 57 16 16 
    return True;                                                                //0124 : 04 27 
    //1B 3C 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 60 8E 98 19 1F 00 1F 00 36 58 C6 6B 
    //0F 12 20 70 4B 32 1D 05 00 0C 02 D0 56 99 19 16 1B AB 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 
    //05 00 0C 02 08 5B 99 19 16 1B AB 96 00 00 70 1F 2D 20 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 
    //0C 02 80 5B 99 19 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 DE 24 D8 24 FE 16 12 20 88 EE 
    //C2 00 0C 00 04 1C 88 EB 76 0F 24 48 24 40 24 57 16 16 1B AB 96 00 00 70 1F 2D 20 00 36 58 C6 6B 
    //0F 12 20 70 4B 32 1D 05 00 0C 02 F8 5B 99 19 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 DE 
    //24 D8 24 FE 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 48 24 40 24 57 16 16 1B AB 96 00 00 
    //70 1F 2D 20 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 70 5C 99 19 16 12 20 88 EE C2 00 0C 
    //00 04 1C 88 EB 76 0F 24 DE 24 D8 24 FE 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 48 24 40 
    //24 57 16 16 04 27 04 0B 47 
  }



