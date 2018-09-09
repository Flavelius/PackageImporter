//==============================================================================
//  HUD_TeamStatusBarTooltip
//==============================================================================

class HUD_TeamStatusBarTooltip extends GUI_ObjectTooltipPage
    dependsOn(Game_TeamMember,SBGuiStrings)
    Transient
    Config(User)
  ;

  var int mCurrentPhysique;
  var int mCurrentMorale;
  var int mCurrentConcentration;


  event bool ShouldUpdate() {
    local int lCurrentPhysique;
    local int lCurrentMorale;
    local int lCurrentConcentration;
    local Game_TeamMember lTeamMember;
    if (Super.ShouldUpdate()) {                                                 //0000 : 07 0B 00 1C B8 F4 A6 19 16 
      return True;                                                              //0009 : 04 27 
    }
    lTeamMember = Game_TeamMember(mObject);                                     //000B : 0F 00 88 F0 04 1B 2E F0 C4 60 01 01 20 EE A6 19 
    if (lTeamMember != None) {                                                  //001B : 07 89 00 77 00 88 F0 04 1B 2A 16 
      lCurrentPhysique = mCurrentPhysique;                                      //0026 : 0F 00 58 D3 33 26 01 D8 47 08 1B 
      lCurrentMorale = mCurrentMorale;                                          //0031 : 0F 00 E0 D2 33 26 01 10 73 04 1B 
      lCurrentConcentration = mCurrentConcentration;                            //003C : 0F 00 68 D2 33 26 01 C0 52 04 1B 
      mCurrentPhysique = lTeamMember.Physique;                                  //0047 : 0F 01 D8 47 08 1B 39 44 19 00 88 F0 04 1B 05 00 04 01 88 EC 27 11 
      mCurrentMorale = lTeamMember.Morale;                                      //005D : 0F 01 10 73 04 1B 39 44 19 00 88 F0 04 1B 05 00 04 01 78 ED 27 11 
      mCurrentConcentration = lTeamMember.Concentration;                        //0073 : 0F 01 C0 52 04 1B 39 44 19 00 88 F0 04 1B 05 00 04 01 68 EE 27 11 
    }
    return lCurrentPhysique != mCurrentPhysique
      || lCurrentMorale != mCurrentMorale
      || lCurrentConcentration != mCurrentConcentration;//0089 : 04 84 84 9B 00 58 D3 33 26 01 D8 47 08 1B 16 18 0D 00 9B 00 E0 D2 33 26 01 10 73 04 1B 16 16 18 0D 00 9B 00 68 D2 33 26 01 C0 52 04 1B 16 16 
    //07 0B 00 1C B8 F4 A6 19 16 04 27 0F 00 88 F0 04 1B 2E F0 C4 60 01 01 20 EE A6 19 07 89 00 77 00 
    //88 F0 04 1B 2A 16 0F 00 58 D3 33 26 01 D8 47 08 1B 0F 00 E0 D2 33 26 01 10 73 04 1B 0F 00 68 D2 
    //33 26 01 C0 52 04 1B 0F 01 D8 47 08 1B 39 44 19 00 88 F0 04 1B 05 00 04 01 88 EC 27 11 0F 01 10 
    //73 04 1B 39 44 19 00 88 F0 04 1B 05 00 04 01 78 ED 27 11 0F 01 C0 52 04 1B 39 44 19 00 88 F0 04 
    //1B 05 00 04 01 68 EE 27 11 04 84 84 9B 00 58 D3 33 26 01 D8 47 08 1B 16 18 0D 00 9B 00 E0 D2 33 
    //26 01 10 73 04 1B 16 16 18 0D 00 9B 00 68 D2 33 26 01 C0 52 04 1B 16 16 04 0B 47 
  }


  function bool UpdateTooltipInfo() {
    local string lPhysiqueLevel;
    local string lConcentrationLevel;
    local string lMoraleLevel;
    local Game_TeamMember lTeamMember;
    lTeamMember = Game_TeamMember(mObject);                                     //0000 : 0F 00 F8 D4 33 26 2E F0 C4 60 01 01 20 EE A6 19 
    if (lTeamMember != None) {                                                  //0010 : 07 14 02 77 00 F8 D4 33 26 2A 16 
      if (mCurrentPhysique > 0) {                                               //001B : 07 52 00 97 01 D8 47 08 1B 25 16 
        lPhysiqueLevel = Class'SBGuiStrings'.default.Physique.Text
          $ ": +"
          $ string(mCurrentPhysique);//0026 : 0F 00 20 B2 07 1B 70 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 30 7E 99 19 1F 3A 20 2B 00 16 39 53 01 D8 47 08 1B 16 
      } else {                                                                  //004F : 06 7A 00 
        lPhysiqueLevel = Class'SBGuiStrings'.default.Physique.Text
          $ ": "
          $ string(mCurrentPhysique);//0052 : 0F 00 20 B2 07 1B 70 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 30 7E 99 19 1F 3A 20 00 16 39 53 01 D8 47 08 1B 16 
      }
      if (mCurrentMorale > 0) {                                                 //007A : 07 B1 00 97 01 10 73 04 1B 25 16 
        lMoraleLevel = Class'SBGuiStrings'.default.Morale.Text
          $ ": +"
          $ string(mCurrentMorale);//0085 : 0F 00 10 B3 07 1B 70 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 7E 99 19 1F 3A 20 2B 00 16 39 53 01 10 73 04 1B 16 
      } else {                                                                  //00AE : 06 D9 00 
        lMoraleLevel = Class'SBGuiStrings'.default.Morale.Text
          $ ": "
          $ string(mCurrentMorale);//00B1 : 0F 00 10 B3 07 1B 70 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 7E 99 19 1F 3A 20 00 16 39 53 01 10 73 04 1B 16 
      }
      if (mCurrentConcentration > 0) {                                          //00D9 : 07 10 01 97 01 C0 52 04 1B 25 16 
        lConcentrationLevel = Class'SBGuiStrings'.default.Concentration.Text
          $ ": +"
          $ string(mCurrentConcentration);//00E4 : 0F 00 98 B2 07 1B 70 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 7F 99 19 1F 3A 20 2B 00 16 39 53 01 C0 52 04 1B 16 
      } else {                                                                  //010D : 06 38 01 
        lConcentrationLevel = Class'SBGuiStrings'.default.Concentration.Text
          $ ": "
          $ string(mCurrentConcentration);//0110 : 0F 00 98 B2 07 1B 70 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 7F 99 19 1F 3A 20 00 16 39 53 01 C0 52 04 1B 16 
      }
      AddHeader(Class'SBGuiStrings'.default.Party_member_status.Text,"","",""); //0138 : 1B 3C 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 7F 99 19 1F 00 1F 00 1F 00 16 
      AddLine(lPhysiqueLevel,Class'Canvas'.static.MakeColor(163,159,186),Class'Canvas'.static.MakeColor(72,64,87));//0157 : 1B AB 96 00 00 00 20 B2 07 1B 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 A3 24 9F 24 BA 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 48 24 40 24 57 16 16 
      AddLine(lMoraleLevel,Class'Canvas'.static.MakeColor(163,159,186),Class'Canvas'.static.MakeColor(72,64,87));//018C : 1B AB 96 00 00 00 10 B3 07 1B 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 A3 24 9F 24 BA 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 48 24 40 24 57 16 16 
      AddLine(lConcentrationLevel,Class'Canvas'.static.MakeColor(163,159,186),Class'Canvas'.static.MakeColor(72,64,87));//01C1 : 1B AB 96 00 00 00 98 B2 07 1B 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 A3 24 9F 24 BA 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 48 24 40 24 57 16 16 
      AddDescription(Class'SBGuiStrings'.default.CharacterStatusBarDescription.Text);//01F6 : 1B 48 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 80 99 19 16 
      return True;                                                              //020F : 04 27 
    } else {                                                                    //0211 : 06 16 02 
      return False;                                                             //0214 : 04 28 
    }
    //0F 00 F8 D4 33 26 2E F0 C4 60 01 01 20 EE A6 19 07 14 02 77 00 F8 D4 33 26 2A 16 07 52 00 97 01 
    //D8 47 08 1B 25 16 0F 00 20 B2 07 1B 70 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 30 7E 99 
    //19 1F 3A 20 2B 00 16 39 53 01 D8 47 08 1B 16 06 7A 00 0F 00 20 B2 07 1B 70 70 36 58 C6 6B 0F 12 
    //20 70 4B 32 1D 05 00 0C 02 30 7E 99 19 1F 3A 20 00 16 39 53 01 D8 47 08 1B 16 07 B1 00 97 01 10 
    //73 04 1B 25 16 0F 00 10 B3 07 1B 70 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A8 7E 99 19 
    //1F 3A 20 2B 00 16 39 53 01 10 73 04 1B 16 06 D9 00 0F 00 10 B3 07 1B 70 70 36 58 C6 6B 0F 12 20 
    //70 4B 32 1D 05 00 0C 02 A8 7E 99 19 1F 3A 20 00 16 39 53 01 10 73 04 1B 16 07 10 01 97 01 C0 52 
    //04 1B 25 16 0F 00 98 B2 07 1B 70 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 20 7F 99 19 1F 
    //3A 20 2B 00 16 39 53 01 C0 52 04 1B 16 06 38 01 0F 00 98 B2 07 1B 70 70 36 58 C6 6B 0F 12 20 70 
    //4B 32 1D 05 00 0C 02 20 7F 99 19 1F 3A 20 00 16 39 53 01 C0 52 04 1B 16 1B 3C 98 00 00 36 58 C6 
    //6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 7F 99 19 1F 00 1F 00 1F 00 16 1B AB 96 00 00 00 20 B2 07 
    //1B 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 A3 24 9F 24 BA 16 12 20 88 EE C2 00 0C 00 04 1C 
    //88 EB 76 0F 24 48 24 40 24 57 16 16 1B AB 96 00 00 00 10 B3 07 1B 12 20 88 EE C2 00 0C 00 04 1C 
    //88 EB 76 0F 24 A3 24 9F 24 BA 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 48 24 40 24 57 16 
    //16 1B AB 96 00 00 00 98 B2 07 1B 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 A3 24 9F 24 BA 16 
    //12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 48 24 40 24 57 16 16 1B 48 98 00 00 36 58 C6 6B 0F 
    //12 20 70 4B 32 1D 05 00 0C 02 10 80 99 19 16 04 27 06 16 02 04 28 04 0B 47 
  }



