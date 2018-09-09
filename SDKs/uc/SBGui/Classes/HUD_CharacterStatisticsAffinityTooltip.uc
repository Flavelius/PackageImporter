//==============================================================================
//  HUD_CharacterStatisticsAffinityTooltip
//==============================================================================

class HUD_CharacterStatisticsAffinityTooltip extends GUI_ObjectTooltipPage
    dependsOn(SBGuiStrings)
    Transient
    Config(User)
  ;


  function bool UpdateTooltipInfo() {
    AddHeader(Class'SBGuiStrings'.default.Magic_Affinity.Text,"","","");        //0000 : 1B 3C 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D0 DD 98 19 1F 00 1F 00 1F 00 16 
    AddDescription(Class'SBGuiStrings'.default.Magic_Affinity_description1.Text);//001F : 1B 48 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 68 55 99 19 16 
    AddLine(Class'SBGuiStrings'.default.Magic_Affinity_description2.Text);      //0038 : 1B AB 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 55 99 19 16 
    AddLine(Class'SBGuiStrings'.default.Magic_Affinity_description3.Text);      //0051 : 1B AB 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 58 56 99 19 16 
    return True;                                                                //006A : 04 27 
    //1B 3C 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D0 DD 98 19 1F 00 1F 00 1F 00 16 1B 
    //48 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 68 55 99 19 16 1B AB 96 00 00 36 58 C6 
    //6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E0 55 99 19 16 1B AB 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 
    //1D 05 00 0C 02 58 56 99 19 16 04 27 04 0B 47 
  }



