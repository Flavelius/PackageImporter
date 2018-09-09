//==============================================================================
//  HUD_AvatarLifeBarTooltip
//==============================================================================

class HUD_AvatarLifeBarTooltip extends GUI_ObjectTooltipPage
    dependsOn(GED_PawnPage,Game_PlayerController,Game_PlayerInput,Game_Pawn,Game_CharacterStats,Game_PlayerStats,SBGuiStrings)
    Transient
    Config(User)
  ;

  var GED_PawnPage mPawnPage;
  var int mCurrentHealth;
  var int mMaximumHealth;
  var bool mTarget;


  event bool ShouldUpdate() {
    local int lCurrentHealth;
    local int lMaximumHealth;
    local export editinline Game_CharacterStats charstats;
    local export editinline Game_PlayerStats playerStats;
    local Game_Pawn aPawn;
    if (mPawnPage != None) {                                                    //0000 : 07 09 01 77 01 80 BB 04 1B 2A 16 
      aPawn = mPawnPage.GetPawnObject();                                        //000B : 0F 00 78 BF 04 1B 19 01 80 BB 04 1B 06 00 04 1B 81 98 00 00 16 
      if (aPawn == None) {                                                      //0020 : 07 2D 00 72 00 78 BF 04 1B 2A 16 
        return True;                                                            //002B : 04 27 
      }
      lCurrentHealth = mCurrentHealth;                                          //002D : 0F 00 E0 B6 33 26 01 F8 BB 04 1B 
      lMaximumHealth = mMaximumHealth;                                          //0038 : 0F 00 B8 BC 33 26 01 70 BC 04 1B 
      if (aPawn == Game_PlayerController(GetPlayerController()).Input.cl_GetTargetPawn()) {//0043 : 07 B9 00 72 00 78 BF 04 1B 19 19 2E 90 18 5B 01 1B 0E 2F 00 00 16 05 00 04 01 B0 14 37 0F 06 00 04 1B 39 05 00 00 16 16 
        mTarget = True;                                                         //006B : 14 2D 01 48 0D 06 1B 27 
        charstats = aPawn.CharacterStats;                                       //0073 : 0F 00 F8 64 07 1B 19 00 78 BF 04 1B 05 00 04 01 08 43 34 0F 
        mCurrentHealth = charstats.mHealth;                                     //0087 : 0F 01 F8 BB 04 1B 39 44 19 00 F8 64 07 1B 05 00 04 01 30 8E 1F 11 
        mMaximumHealth = charstats.mRecord.MaxHealth;                           //009D : 0F 01 70 BC 04 1B 36 D8 91 18 11 19 00 F8 64 07 1B 05 00 68 01 78 2D 34 0F 
      } else {                                                                  //00B6 : 06 09 01 
        mTarget = False;                                                        //00B9 : 14 2D 01 48 0D 06 1B 28 
        playerStats = Game_PlayerStats(aPawn.CharacterStats);                   //00C1 : 0F 00 60 66 07 1B 2E 10 A3 5F 01 19 00 78 BF 04 1B 05 00 04 01 08 43 34 0F 
        mCurrentHealth = playerStats.mHealth;                                   //00DA : 0F 01 F8 BB 04 1B 39 44 19 00 60 66 07 1B 05 00 04 01 30 8E 1F 11 
        mMaximumHealth = playerStats.mRecord.MaxHealth;                         //00F0 : 0F 01 70 BC 04 1B 36 D8 91 18 11 19 00 60 66 07 1B 05 00 68 01 78 2D 34 0F 
      }
    }
    if (Super.ShouldUpdate()) {                                                 //0109 : 07 14 01 1C B8 F4 A6 19 16 
      return True;                                                              //0112 : 04 27 
    }
    return mCurrentHealth != lCurrentHealth
      || mMaximumHealth != lMaximumHealth;//0114 : 04 84 9B 01 F8 BB 04 1B 00 E0 B6 33 26 16 18 0D 00 9B 01 70 BC 04 1B 00 B8 BC 33 26 16 16 
    //07 09 01 77 01 80 BB 04 1B 2A 16 0F 00 78 BF 04 1B 19 01 80 BB 04 1B 06 00 04 1B 81 98 00 00 16 
    //07 2D 00 72 00 78 BF 04 1B 2A 16 04 27 0F 00 E0 B6 33 26 01 F8 BB 04 1B 0F 00 B8 BC 33 26 01 70 
    //BC 04 1B 07 B9 00 72 00 78 BF 04 1B 19 19 2E 90 18 5B 01 1B 0E 2F 00 00 16 05 00 04 01 B0 14 37 
    //0F 06 00 04 1B 39 05 00 00 16 16 14 2D 01 48 0D 06 1B 27 0F 00 F8 64 07 1B 19 00 78 BF 04 1B 05 
    //00 04 01 08 43 34 0F 0F 01 F8 BB 04 1B 39 44 19 00 F8 64 07 1B 05 00 04 01 30 8E 1F 11 0F 01 70 
    //BC 04 1B 36 D8 91 18 11 19 00 F8 64 07 1B 05 00 68 01 78 2D 34 0F 06 09 01 14 2D 01 48 0D 06 1B 
    //28 0F 00 60 66 07 1B 2E 10 A3 5F 01 19 00 78 BF 04 1B 05 00 04 01 08 43 34 0F 0F 01 F8 BB 04 1B 
    //39 44 19 00 60 66 07 1B 05 00 04 01 30 8E 1F 11 0F 01 70 BC 04 1B 36 D8 91 18 11 19 00 60 66 07 
    //1B 05 00 68 01 78 2D 34 0F 07 14 01 1C B8 F4 A6 19 16 04 27 04 84 9B 01 F8 BB 04 1B 00 E0 B6 33 
    //26 16 18 0D 00 9B 01 70 BC 04 1B 00 B8 BC 33 26 16 16 04 0B 47 
  }


  function bool UpdateTooltipInfo() {
    if (mPawnPage != None) {                                                    //0000 : 07 F1 00 77 01 80 BB 04 1B 2A 16 
      if (mPawnPage.GetPawnObject() == None) {                                  //000B : 07 22 00 72 19 01 80 BB 04 1B 06 00 04 1B 81 98 00 00 16 2A 16 
        return False;                                                           //0020 : 04 28 
      }
      if (mTarget) {                                                            //0022 : 07 4D 00 2D 01 48 0D 06 1B 
        AddHeader(Class'SBGuiStrings'.default.Target_health.Text,"","","");     //002B : 1B 3C 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B0 76 99 19 1F 00 1F 00 1F 00 16 
      } else {                                                                  //004A : 06 6C 00 
        AddHeader(Class'SBGuiStrings'.default.Character_health.Text,"","","");  //004D : 1B 3C 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 28 77 99 19 1F 00 1F 00 1F 00 16 
      }
      AddLine(string(mCurrentHealth) @ "/" @ string(mMaximumHealth),Class'Canvas'.static.MakeColor(163,159,186),Class'Canvas'.static.MakeColor(72,64,87));//006C : 1B AB 96 00 00 A8 A8 39 53 01 F8 BB 04 1B 1F 2F 00 16 39 53 01 70 BC 04 1B 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 A3 24 9F 24 BA 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 48 24 40 24 57 16 16 
      if (mTarget) {                                                            //00B1 : 07 D6 00 2D 01 48 0D 06 1B 
        AddDescription(Class'SBGuiStrings'.default.Current_and_maximum_health_selected_target.Text);//00BA : 1B 48 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 77 99 19 16 
      } else {                                                                  //00D3 : 06 EF 00 
        AddDescription(Class'SBGuiStrings'.default.Current_and_maximum_health_your_character.Text);//00D6 : 1B 48 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 18 78 99 19 16 
      }
      return True;                                                              //00EF : 04 27 
    }
    return False;                                                               //00F1 : 04 28 
    //07 F1 00 77 01 80 BB 04 1B 2A 16 07 22 00 72 19 01 80 BB 04 1B 06 00 04 1B 81 98 00 00 16 2A 16 
    //04 28 07 4D 00 2D 01 48 0D 06 1B 1B 3C 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B0 
    //76 99 19 1F 00 1F 00 1F 00 16 06 6C 00 1B 3C 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 
    //02 28 77 99 19 1F 00 1F 00 1F 00 16 1B AB 96 00 00 A8 A8 39 53 01 F8 BB 04 1B 1F 2F 00 16 39 53 
    //01 70 BC 04 1B 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 A3 24 9F 24 BA 16 12 20 88 EE C2 
    //00 0C 00 04 1C 88 EB 76 0F 24 48 24 40 24 57 16 16 07 D6 00 2D 01 48 0D 06 1B 1B 48 98 00 00 36 
    //58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 77 99 19 16 06 EF 00 1B 48 98 00 00 36 58 C6 6B 0F 
    //12 20 70 4B 32 1D 05 00 0C 02 18 78 99 19 16 04 27 04 28 04 0B 47 
  }


  function bool UpdateTooltipObject(Object aObject) {
    mPawnPage = GED_PawnPage(aObject);                                          //0000 : 0F 01 80 BB 04 1B 2E D0 1A 32 1D 00 B8 A7 33 26 
    return Super.UpdateTooltipObject(aObject);                                  //0010 : 04 1C C8 0B A6 19 00 B8 A7 33 26 16 
    //0F 01 80 BB 04 1B 2E D0 1A 32 1D 00 B8 A7 33 26 04 1C C8 0B A6 19 00 B8 A7 33 26 16 04 0B 47 
  }



