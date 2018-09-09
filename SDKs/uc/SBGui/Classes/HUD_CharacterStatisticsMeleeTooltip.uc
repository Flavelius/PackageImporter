//==============================================================================
//  HUD_CharacterStatisticsMeleeTooltip
//==============================================================================

class HUD_CharacterStatisticsMeleeTooltip extends GUI_ObjectTooltipPage
    dependsOn(SBGuiStrings)
    Transient
    Config(User)
  ;


  function bool UpdateTooltipInfo() {
    AddHeader(Class'SBGuiStrings'.default.Melee_Resistance.Text,"","",Class'SBGuiStrings'.default.Resistance.Text);//0000 : 1B 3C 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E8 4D 99 19 1F 00 1F 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 60 4E 99 19 16 
    AddDescription(Class'SBGuiStrings'.default.Melee_resistance_description.Text);//0030 : 1B 48 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D8 4E 99 19 16 
    return True;                                                                //0049 : 04 27 
    //1B 3C 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E8 4D 99 19 1F 00 1F 00 36 58 C6 6B 
    //0F 12 20 70 4B 32 1D 05 00 0C 02 60 4E 99 19 16 1B 48 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 
    //05 00 0C 02 D8 4E 99 19 16 04 27 04 0B 47 
  }


