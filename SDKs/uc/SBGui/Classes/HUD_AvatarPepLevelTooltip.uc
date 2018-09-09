//==============================================================================
//  HUD_AvatarPepLevelTooltip
//==============================================================================

class HUD_AvatarPepLevelTooltip extends GUI_ObjectTooltipPage
    dependsOn(Game_Pawn,Game_PlayerStats,SBGuiStrings,Game_CharacterStats,GED_PawnPage,Game_PlayerController,Game_PlayerInput,Object)
    Transient
    Config(User)
  ;

  var GED_PawnPage mPawnPage;
  var Game_Pawn mPawn;


  function BuildTooltip(Game_Pawn aPawn,bool aTarget) {
    local export editinline Game_CharacterStats Stats;
    local int currentPepPoints;
    Stats = aPawn.CharacterStats;                                               //0000 : 0F 00 10 7C 2C 26 19 00 00 DF 33 26 05 00 04 01 08 43 34 0F 
    if (aPawn.IsA('Game_PlayerPawn')) {                                         //0014 : 07 44 00 19 00 00 DF 33 26 08 00 04 61 2F 21 70 0A 00 00 16 
      currentPepPoints = Game_PlayerStats(Stats).mPePPoints;                    //0028 : 0F 00 F8 17 06 1B 19 2E 10 A3 5F 01 00 10 7C 2C 26 05 00 04 01 50 F3 24 11 
      goto jl0044;                                                              //0041 : 06 44 00 
    }
    if (aTarget) {                                                              //0044 : 07 B5 00 2D 00 28 31 33 26 
      AddHeader(Class'SBGuiStrings'.default.Target_pep_rank.Text,string(Stats.mRecord.PePRank),"","");//004D : 1B 3C 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 80 79 99 19 39 53 36 78 96 1F 11 19 00 10 7C 2C 26 05 00 68 01 78 2D 34 0F 1F 00 1F 00 16 
      if (Stats.mRecord.PePRank >= 5) {                                         //007F : 07 B2 00 99 36 78 96 1F 11 19 00 10 7C 2C 26 05 00 68 01 78 2D 34 0F 2C 05 16 
        AddLine(Class'SBGuiStrings'.default.This_target_has_the_maximum_pep_rank_possible.Text);//0099 : 1B AB 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 78 99 19 16 
      }
    } else {                                                                    //00B2 : 06 AC 01 
      AddHeader(Class'SBGuiStrings'.default.Character_pep_rank.Text,string(Stats.mRecord.PePRank),"","");//00B5 : 1B 3C 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F8 79 99 19 39 53 36 78 96 1F 11 19 00 10 7C 2C 26 05 00 68 01 78 2D 34 0F 1F 00 1F 00 16 
      if (Stats.mRecord.PePRank < 5) {                                          //00E7 : 07 71 01 96 36 78 96 1F 11 19 00 10 7C 2C 26 05 00 68 01 78 2D 34 0F 2C 05 16 
        AddLine(Class'SBGuiStrings'.default.Current_pep_points_.Text
          @ string(currentPepPoints));//0101 : 1B AB 96 00 00 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 28 86 99 19 39 53 00 F8 17 06 1B 16 16 
        AddLine(Class'SBGuiStrings'.default.Needed_for_next_rank_.Text
          @ string(Game_PlayerStats(Stats).GetNextPePRankPoints(Stats.mRecord.PePRank) - currentPepPoints));//0123 : 1B AB 96 00 00 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 86 99 19 39 53 93 19 2E 10 A3 5F 01 00 10 7C 2C 26 19 00 04 1B 75 05 00 00 36 78 96 1F 11 19 00 10 7C 2C 26 05 00 68 01 78 2D 34 0F 16 00 F8 17 06 1B 16 16 16 
      } else {                                                                  //016E : 06 AC 01 
        AddLine(Class'SBGuiStrings'.default.Current_pep_points_.Text
          @ string(currentPepPoints));//0171 : 1B AB 96 00 00 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 28 86 99 19 39 53 00 F8 17 06 1B 16 16 
        AddLine(Class'SBGuiStrings'.default.Maximum_pep_rank_reached.Text);     //0193 : 1B AB 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 08 79 99 19 16 
      }
    }
    //0F 00 10 7C 2C 26 19 00 00 DF 33 26 05 00 04 01 08 43 34 0F 07 44 00 19 00 00 DF 33 26 08 00 04 
    //61 2F 21 70 0A 00 00 16 0F 00 F8 17 06 1B 19 2E 10 A3 5F 01 00 10 7C 2C 26 05 00 04 01 50 F3 24 
    //11 06 44 00 07 B5 00 2D 00 28 31 33 26 1B 3C 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 
    //02 80 79 99 19 39 53 36 78 96 1F 11 19 00 10 7C 2C 26 05 00 68 01 78 2D 34 0F 1F 00 1F 00 16 07 
    //B2 00 99 36 78 96 1F 11 19 00 10 7C 2C 26 05 00 68 01 78 2D 34 0F 2C 05 16 1B AB 96 00 00 36 58 
    //C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 90 78 99 19 16 06 AC 01 1B 3C 98 00 00 36 58 C6 6B 0F 12 
    //20 70 4B 32 1D 05 00 0C 02 F8 79 99 19 39 53 36 78 96 1F 11 19 00 10 7C 2C 26 05 00 68 01 78 2D 
    //34 0F 1F 00 1F 00 16 07 71 01 96 36 78 96 1F 11 19 00 10 7C 2C 26 05 00 68 01 78 2D 34 0F 2C 05 
    //16 1B AB 96 00 00 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 28 86 99 19 39 53 00 F8 17 06 
    //1B 16 16 1B AB 96 00 00 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 86 99 19 39 53 93 19 
    //2E 10 A3 5F 01 00 10 7C 2C 26 19 00 04 1B 75 05 00 00 36 78 96 1F 11 19 00 10 7C 2C 26 05 00 68 
    //01 78 2D 34 0F 16 00 F8 17 06 1B 16 16 16 06 AC 01 1B AB 96 00 00 A8 36 58 C6 6B 0F 12 20 70 4B 
    //32 1D 05 00 0C 02 28 86 99 19 39 53 00 F8 17 06 1B 16 16 1B AB 96 00 00 36 58 C6 6B 0F 12 20 70 
    //4B 32 1D 05 00 0C 02 08 79 99 19 16 04 0B 47 
  }


  function bool UpdateTooltipInfo() {
    local Game_Pawn Pawn;
    if (mPawn != None) {                                                        //0000 : 07 1C 00 77 01 50 67 07 1B 2A 16 
      BuildTooltip(mPawn,False);                                                //000B : 1B D2 98 00 00 01 50 67 07 1B 28 16 
      return True;                                                              //0017 : 04 27 
    } else {                                                                    //0019 : 06 79 00 
      if (mPawnPage != None) {                                                  //001C : 07 79 00 77 01 D8 66 07 1B 2A 16 
        Pawn = mPawnPage.GetPawnObject();                                       //0027 : 0F 00 F0 14 06 1B 19 01 D8 66 07 1B 06 00 04 1B 81 98 00 00 16 
        if (Pawn != None) {                                                     //003C : 07 79 00 77 00 F0 14 06 1B 2A 16 
          BuildTooltip(Pawn,Pawn == Game_PlayerController(GetPlayerController()).Input.cl_GetTargetPawn());//0047 : 1B D2 98 00 00 00 F0 14 06 1B 72 00 F0 14 06 1B 19 19 2E 90 18 5B 01 1B 0E 2F 00 00 16 05 00 04 01 B0 14 37 0F 06 00 04 1B 39 05 00 00 16 16 16 
          return True;                                                          //0077 : 04 27 
        }
      }
    }
    return False;                                                               //0079 : 04 28 
    //07 1C 00 77 01 50 67 07 1B 2A 16 1B D2 98 00 00 01 50 67 07 1B 28 16 04 27 06 79 00 07 79 00 77 
    //01 D8 66 07 1B 2A 16 0F 00 F0 14 06 1B 19 01 D8 66 07 1B 06 00 04 1B 81 98 00 00 16 07 79 00 77 
    //00 F0 14 06 1B 2A 16 1B D2 98 00 00 00 F0 14 06 1B 72 00 F0 14 06 1B 19 19 2E 90 18 5B 01 1B 0E 
    //2F 00 00 16 05 00 04 01 B0 14 37 0F 06 00 04 1B 39 05 00 00 16 16 16 04 27 04 28 04 0B 47 
  }


  function bool UpdateTooltipObject(Object aObject) {
    if (aObject.IsA('GED_PawnPage')) {                                          //0000 : 07 27 00 19 00 A0 12 06 1B 08 00 04 61 2F 21 75 97 00 00 16 
      mPawnPage = GED_PawnPage(aObject);                                        //0014 : 0F 01 D8 66 07 1B 2E D0 1A 32 1D 00 A0 12 06 1B 
    } else {                                                                    //0024 : 06 37 00 
      mPawn = Game_Pawn(aObject);                                               //0027 : 0F 01 50 67 07 1B 2E 18 38 5B 01 00 A0 12 06 1B 
    }
    return Super.UpdateTooltipObject(aObject);                                  //0037 : 04 1C C8 0B A6 19 00 A0 12 06 1B 16 
    //07 27 00 19 00 A0 12 06 1B 08 00 04 61 2F 21 75 97 00 00 16 0F 01 D8 66 07 1B 2E D0 1A 32 1D 00 
    //A0 12 06 1B 06 37 00 0F 01 50 67 07 1B 2E 18 38 5B 01 00 A0 12 06 1B 04 1C C8 0B A6 19 00 A0 12 
    //06 1B 16 04 0B 47 
  }



