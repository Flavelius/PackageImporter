//==============================================================================
//  HUD_TeamLifeBarTooltip
//==============================================================================

class HUD_TeamLifeBarTooltip extends GUI_ObjectTooltipPage
    dependsOn(Game_TeamMember,SBGuiStrings)
    Transient
    Config(User)
  ;

  var int mCurrentHealth;
  var int mMaximumHealth;


  event bool ShouldUpdate() {
    local int lCurrentHealth;
    local int lMaximumHealth;
    local Game_TeamMember lTeamMember;
    if (Super.ShouldUpdate()) {                                                 //0000 : 07 0B 00 1C B8 F4 A6 19 16 
      return True;                                                              //0009 : 04 27 
    }
    lTeamMember = Game_TeamMember(mObject);                                     //000B : 0F 00 18 17 05 1B 2E F0 C4 60 01 01 20 EE A6 19 
    if (lTeamMember != None) {                                                  //001B : 07 68 00 77 00 18 17 05 1B 2A 16 
      lCurrentHealth = mCurrentHealth;                                          //0026 : 0F 00 20 E4 33 26 01 D8 76 06 1B 
      lMaximumHealth = mMaximumHealth;                                          //0031 : 0F 00 D0 DA 33 26 01 50 77 06 1B 
      mCurrentHealth = lTeamMember.Health;                                      //003C : 0F 01 D8 76 06 1B 39 44 19 00 18 17 05 1B 05 00 04 01 98 EB 27 11 
      mMaximumHealth = lTeamMember.MaxHealth;                                   //0052 : 0F 01 50 77 06 1B 39 44 19 00 18 17 05 1B 05 00 04 01 C8 03 28 11 
    }
    return mCurrentHealth != lCurrentHealth
      || mMaximumHealth != lMaximumHealth;//0068 : 04 84 9B 01 D8 76 06 1B 00 20 E4 33 26 16 18 0D 00 9B 01 50 77 06 1B 00 D0 DA 33 26 16 16 
    //07 0B 00 1C B8 F4 A6 19 16 04 27 0F 00 18 17 05 1B 2E F0 C4 60 01 01 20 EE A6 19 07 68 00 77 00 
    //18 17 05 1B 2A 16 0F 00 20 E4 33 26 01 D8 76 06 1B 0F 00 D0 DA 33 26 01 50 77 06 1B 0F 01 D8 76 
    //06 1B 39 44 19 00 18 17 05 1B 05 00 04 01 98 EB 27 11 0F 01 50 77 06 1B 39 44 19 00 18 17 05 1B 
    //05 00 04 01 C8 03 28 11 04 84 9B 01 D8 76 06 1B 00 20 E4 33 26 16 18 0D 00 9B 01 50 77 06 1B 00 
    //D0 DA 33 26 16 16 04 0B 47 
  }


  function bool UpdateTooltipInfo() {
    local Game_TeamMember lTeamMember;
    lTeamMember = Game_TeamMember(mObject);                                     //0000 : 0F 00 70 E6 33 26 2E F0 C4 60 01 01 20 EE A6 19 
    if (lTeamMember != None) {                                                  //0010 : 07 9A 00 77 00 70 E6 33 26 2A 16 
      AddHeader(Class'SBGuiStrings'.default.Party_member_health.Text,"","",""); //001B : 1B 3C 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 50 7C 99 19 1F 00 1F 00 1F 00 16 
      AddLine(string(mCurrentHealth) @ "/" @ string(mMaximumHealth),Class'Canvas'.static.MakeColor(163,159,186),Class'Canvas'.static.MakeColor(72,64,87));//003A : 1B AB 96 00 00 A8 A8 39 53 01 D8 76 06 1B 1F 2F 00 16 39 53 01 50 77 06 1B 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 A3 24 9F 24 BA 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 48 24 40 24 57 16 16 
      AddDescription(Class'SBGuiStrings'.default.TeamInformationscreenDescription.Text);//007F : 1B 48 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C8 7C 99 19 16 
      return True;                                                              //0098 : 04 27 
    }
    return False;                                                               //009A : 04 28 
    //0F 00 70 E6 33 26 2E F0 C4 60 01 01 20 EE A6 19 07 9A 00 77 00 70 E6 33 26 2A 16 1B 3C 98 00 00 
    //36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 50 7C 99 19 1F 00 1F 00 1F 00 16 1B AB 96 00 00 A8 
    //A8 39 53 01 D8 76 06 1B 1F 2F 00 16 39 53 01 50 77 06 1B 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 
    //76 0F 24 A3 24 9F 24 BA 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 48 24 40 24 57 16 16 1B 
    //48 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C8 7C 99 19 16 04 27 04 28 04 0B 47 
  }



