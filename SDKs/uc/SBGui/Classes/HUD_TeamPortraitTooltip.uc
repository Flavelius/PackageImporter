//==============================================================================
//  HUD_TeamPortraitTooltip
//==============================================================================

class HUD_TeamPortraitTooltip extends GUI_ObjectTooltipPage
    dependsOn(Game_TeamMember,SBGuiStrings,StringReferences)
    Transient
    Config(User)
  ;

  var int mCurrentArchetype;
  var int mCurrentDiscipline;
  var int mCurrentLocation;


  event bool ShouldUpdate() {
    local int lArchetype;
    local int lDiscipline;
    local int lLocation;
    local Game_TeamMember lTeamMember;
    if (Super.ShouldUpdate()) {                                                 //0000 : 07 0B 00 1C B8 F4 A6 19 16 
      return True;                                                              //0009 : 04 27 
    }
    lTeamMember = Game_TeamMember(mObject);                                     //000B : 0F 00 58 E9 04 1B 2E F0 C4 60 01 01 20 EE A6 19 
    if (lTeamMember != None) {                                                  //001B : 07 83 00 77 00 58 E9 04 1B 2A 16 
      lArchetype = mCurrentArchetype;                                           //0026 : 0F 00 F0 D8 33 26 01 E0 7A 04 1B 
      lDiscipline = mCurrentDiscipline;                                         //0031 : 0F 00 78 D8 33 26 01 68 7A 04 1B 
      lLocation = mCurrentLocation;                                             //003C : 0F 00 00 D8 33 26 01 20 E2 04 1B 
      mCurrentArchetype = lTeamMember.Archetype;                                //0047 : 0F 01 E0 7A 04 1B 19 00 58 E9 04 1B 05 00 04 01 E8 01 28 11 
      mCurrentDiscipline = lTeamMember.Discipline;                              //005B : 0F 01 68 7A 04 1B 19 00 58 E9 04 1B 05 00 04 01 D8 02 28 11 
      mCurrentLocation = lTeamMember.worldID;                                   //006F : 0F 01 20 E2 04 1B 19 00 58 E9 04 1B 05 00 04 01 20 FE 27 11 
    }
    return lArchetype != mCurrentArchetype
      || lDiscipline != mCurrentDiscipline
      || lLocation != mCurrentLocation;//0083 : 04 84 84 9B 00 F0 D8 33 26 01 E0 7A 04 1B 16 18 0D 00 9B 00 78 D8 33 26 01 68 7A 04 1B 16 16 18 0D 00 9B 00 00 D8 33 26 01 20 E2 04 1B 16 16 
    //07 0B 00 1C B8 F4 A6 19 16 04 27 0F 00 58 E9 04 1B 2E F0 C4 60 01 01 20 EE A6 19 07 83 00 77 00 
    //58 E9 04 1B 2A 16 0F 00 F0 D8 33 26 01 E0 7A 04 1B 0F 00 78 D8 33 26 01 68 7A 04 1B 0F 00 00 D8 
    //33 26 01 20 E2 04 1B 0F 01 E0 7A 04 1B 19 00 58 E9 04 1B 05 00 04 01 E8 01 28 11 0F 01 68 7A 04 
    //1B 19 00 58 E9 04 1B 05 00 04 01 D8 02 28 11 0F 01 20 E2 04 1B 19 00 58 E9 04 1B 05 00 04 01 20 
    //FE 27 11 04 84 84 9B 00 F0 D8 33 26 01 E0 7A 04 1B 16 18 0D 00 9B 00 78 D8 33 26 01 68 7A 04 1B 
    //16 16 18 0D 00 9B 00 00 D8 33 26 01 20 E2 04 1B 16 16 04 0B 47 
  }


  function bool UpdateTooltipInfo() {
    local string lArchetype;
    local string lDiscipline;
    local string lLocation;
    local Game_TeamMember lTeamMember;
    lTeamMember = Game_TeamMember(mObject);                                     //0000 : 0F 00 38 32 8A 19 2E F0 C4 60 01 01 20 EE A6 19 
    if (lTeamMember != None) {                                                  //0010 : 07 CC 01 77 00 38 32 8A 19 2A 16 
      AddHeader(lTeamMember.Name,"","","");                                     //001B : 1B 3C 98 00 00 19 00 38 32 8A 19 05 00 00 01 B8 27 28 11 1F 00 1F 00 1F 00 16 
      if (mCurrentArchetype > 0) {                                              //0035 : 07 BB 00 97 01 E0 7A 04 1B 25 16 
        lArchetype = Class'SBGuiStrings'.default.Archetype.Text
          $ ": "
          $ Class'StringReferences'.GetClassName(mCurrentArchetype,lTeamMember.IsFeminine);//0040 : 0F 00 58 DA 33 26 70 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B8 7D 99 19 1F 3A 20 00 16 12 20 20 F7 60 01 1C 00 00 1B 54 0D 00 00 39 3D 01 E0 7A 04 1B 19 00 38 32 8A 19 06 00 04 2D 01 F8 00 28 11 16 16 
        AddLine(lArchetype,Class'Canvas'.static.MakeColor(163,159,186),Class'Canvas'.static.MakeColor(72,64,87));//0086 : 1B AB 96 00 00 00 58 DA 33 26 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 A3 24 9F 24 BA 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 48 24 40 24 57 16 16 
      }
      if (mCurrentDiscipline > 0
        && mCurrentArchetype != mCurrentDiscipline) {//00BB : 07 52 01 82 97 01 68 7A 04 1B 25 16 18 0D 00 9B 01 E0 7A 04 1B 01 68 7A 04 1B 16 16 
        lDiscipline = Class'SBGuiStrings'.default.Discipline.Text
          $ ": "
          $ Class'StringReferences'.GetClassName(mCurrentDiscipline,lTeamMember.IsFeminine);//00D7 : 0F 00 E0 D9 33 26 70 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 40 7D 99 19 1F 3A 20 00 16 12 20 20 F7 60 01 1C 00 00 1B 54 0D 00 00 39 3D 01 68 7A 04 1B 19 00 38 32 8A 19 06 00 04 2D 01 F8 00 28 11 16 16 
        AddLine(lDiscipline,Class'Canvas'.static.MakeColor(163,159,186),Class'Canvas'.static.MakeColor(72,64,87));//011D : 1B AB 96 00 00 00 E0 D9 33 26 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 A3 24 9F 24 BA 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 48 24 40 24 57 16 16 
      }
      if (mCurrentLocation > 0) {                                               //0152 : 07 C7 01 97 01 20 E2 04 1B 25 16 
        lLocation = Class'SBGuiStrings'.default.Location.Text
          $ ": "
          $ mDesktop.GetWorldName(mCurrentLocation);//015D : 0F 00 68 D9 33 26 70 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 48 FB 98 19 1F 3A 20 00 16 19 01 48 0C 9D 19 0B 00 00 1B 22 99 00 00 01 20 E2 04 1B 16 16 
        AddLine(lLocation,Class'Canvas'.static.MakeColor(163,159,186),Class'Canvas'.static.MakeColor(72,64,87));//0192 : 1B AB 96 00 00 00 68 D9 33 26 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 A3 24 9F 24 BA 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 48 24 40 24 57 16 16 
      }
      return True;                                                              //01C7 : 04 27 
    } else {                                                                    //01C9 : 06 CE 01 
      return False;                                                             //01CC : 04 28 
    }
    //0F 00 38 32 8A 19 2E F0 C4 60 01 01 20 EE A6 19 07 CC 01 77 00 38 32 8A 19 2A 16 1B 3C 98 00 00 
    //19 00 38 32 8A 19 05 00 00 01 B8 27 28 11 1F 00 1F 00 1F 00 16 07 BB 00 97 01 E0 7A 04 1B 25 16 
    //0F 00 58 DA 33 26 70 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B8 7D 99 19 1F 3A 20 00 16 
    //12 20 20 F7 60 01 1C 00 00 1B 54 0D 00 00 39 3D 01 E0 7A 04 1B 19 00 38 32 8A 19 06 00 04 2D 01 
    //F8 00 28 11 16 16 1B AB 96 00 00 00 58 DA 33 26 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 A3 
    //24 9F 24 BA 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 48 24 40 24 57 16 16 07 52 01 82 97 
    //01 68 7A 04 1B 25 16 18 0D 00 9B 01 E0 7A 04 1B 01 68 7A 04 1B 16 16 0F 00 E0 D9 33 26 70 70 36 
    //58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 40 7D 99 19 1F 3A 20 00 16 12 20 20 F7 60 01 1C 00 00 
    //1B 54 0D 00 00 39 3D 01 68 7A 04 1B 19 00 38 32 8A 19 06 00 04 2D 01 F8 00 28 11 16 16 1B AB 96 
    //00 00 00 E0 D9 33 26 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 A3 24 9F 24 BA 16 12 20 88 EE 
    //C2 00 0C 00 04 1C 88 EB 76 0F 24 48 24 40 24 57 16 16 07 C7 01 97 01 20 E2 04 1B 25 16 0F 00 68 
    //D9 33 26 70 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 48 FB 98 19 1F 3A 20 00 16 19 01 48 
    //0C 9D 19 0B 00 00 1B 22 99 00 00 01 20 E2 04 1B 16 16 1B AB 96 00 00 00 68 D9 33 26 12 20 88 EE 
    //C2 00 0C 00 04 1C 88 EB 76 0F 24 A3 24 9F 24 BA 16 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 
    //48 24 40 24 57 16 16 04 27 06 CE 01 04 28 04 0B 47 
  }



