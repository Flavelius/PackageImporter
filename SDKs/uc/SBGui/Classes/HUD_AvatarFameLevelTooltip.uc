//==============================================================================
//  HUD_AvatarFameLevelTooltip
//==============================================================================

class HUD_AvatarFameLevelTooltip extends GUI_ObjectTooltipPage
    dependsOn(Game_Pawn,Game_PlayerStats,Game_CharacterStats,SBGuiStrings,GED_PawnPage,Game_PlayerController,Game_PlayerInput,Object)
    Transient
    Config(User)
  ;

  var GED_PawnPage mPawnPage;
  var Game_Pawn mPawn;


  function BuildTooltip(Game_Pawn aPawn,bool aTarget) {
    local export editinline Game_CharacterStats Stats;
    local int currentFamePoints;
    local string currentFamePointsStr;
    Stats = aPawn.CharacterStats;                                               //0000 : 0F 00 60 8A 2B 26 19 00 B8 9D 33 26 05 00 04 01 08 43 34 0F 
    if (aPawn.IsA('Game_PlayerPawn')) {                                         //0014 : 07 44 00 19 00 B8 9D 33 26 08 00 04 61 2F 21 70 0A 00 00 16 
      currentFamePoints = Game_PlayerStats(Stats).mFamePoints;                  //0028 : 0F 00 18 71 2C 26 19 2E 10 A3 5F 01 00 60 8A 2B 26 05 00 04 01 D8 F2 24 11 
    } else {                                                                    //0041 : 06 6F 00 
      currentFamePoints = Stats.GetNextFameLevelPoints(Stats.mRecord.FameLevel - 1);//0044 : 0F 00 18 71 2C 26 19 00 60 8A 2B 26 1C 00 04 1B 74 05 00 00 93 36 00 2D 34 0F 19 00 60 8A 2B 26 05 00 68 01 78 2D 34 0F 26 16 16 
    }
    if (aTarget) {                                                              //006F : 07 44 01 2D 00 C0 25 33 26 
      AddHeader(Class'SBGuiStrings'.default.Target_fame_level.Text,string(Stats.mRecord.FameLevel),"","");//0078 : 1B 3C 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D0 74 99 19 39 53 36 00 2D 34 0F 19 00 60 8A 2B 26 05 00 68 01 78 2D 34 0F 1F 00 1F 00 16 
      if (Stats.mRecord.FameLevel < 50) {                                       //00AA : 07 28 01 96 36 00 2D 34 0F 19 00 60 8A 2B 26 05 00 68 01 78 2D 34 0F 2C 32 16 
        if (currentFamePoints < 0) {                                            //00C4 : 07 D6 00 96 00 18 71 2C 26 25 16 
          currentFamePoints = 0;                                                //00CF : 0F 00 18 71 2C 26 25 
        }
        currentFamePointsStr = Class'SBGuiStrings'.default.ThisTargetHas_FamePoints.Text;//00D6 : 0F 00 E8 5E 07 1B 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B0 85 99 19 
        static.ReplaceText(currentFamePointsStr,"[CURRENTFAMEPOINTS]","" $ string(currentFamePoints));//00EF : 1C 30 80 69 0F 00 E8 5E 07 1B 1F 5B 43 55 52 52 45 4E 54 46 41 4D 45 50 4F 49 4E 54 53 5D 00 70 1F 00 39 53 00 18 71 2C 26 16 16 
        AddLine(currentFamePointsStr);                                          //011A : 1B AB 96 00 00 00 E8 5E 07 1B 16 
      } else {                                                                  //0125 : 06 41 01 
        AddLine(Class'SBGuiStrings'.default.This_target_has_the_maximum_fame_level_possible.Text);//0128 : 1B AB 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 48 75 99 19 16 
      }
    } else {                                                                    //0141 : 06 36 02 
      AddHeader(Class'SBGuiStrings'.default.Character_fame_level.Text,string(Stats.mRecord.FameLevel),"","");//0144 : 1B 3C 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 75 99 19 39 53 36 00 2D 34 0F 19 00 60 8A 2B 26 05 00 68 01 78 2D 34 0F 1F 00 1F 00 16 
      if (Stats.mRecord.FameLevel < 50) {                                       //0176 : 07 FB 01 96 36 00 2D 34 0F 19 00 60 8A 2B 26 05 00 68 01 78 2D 34 0F 2C 32 16 
        AddLine(Class'SBGuiStrings'.default.Current_Fame_Points_.Text
          @ string(currentFamePoints));//0190 : 1B AB 96 00 00 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 84 99 19 39 53 00 18 71 2C 26 16 16 
        AddLine(Class'SBGuiStrings'.default.Needed_for_next_level_.Text
          @ string(Stats.GetNextFameLevelPoints(Stats.mRecord.FameLevel) - currentFamePoints));//01B2 : 1B AB 96 00 00 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 85 99 19 39 53 93 19 00 60 8A 2B 26 19 00 04 1B 74 05 00 00 36 00 2D 34 0F 19 00 60 8A 2B 26 05 00 68 01 78 2D 34 0F 16 00 18 71 2C 26 16 16 16 
      } else {                                                                  //01F8 : 06 36 02 
        AddLine(Class'SBGuiStrings'.default.Current_Fame_Points_.Text
          @ string(currentFamePoints));//01FB : 1B AB 96 00 00 A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 84 99 19 39 53 00 18 71 2C 26 16 16 
        AddLine(Class'SBGuiStrings'.default.Maximum_fame_level_reached_.Text);  //021D : 1B AB 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 76 99 19 16 
      }
    }
    //0F 00 60 8A 2B 26 19 00 B8 9D 33 26 05 00 04 01 08 43 34 0F 07 44 00 19 00 B8 9D 33 26 08 00 04 
    //61 2F 21 70 0A 00 00 16 0F 00 18 71 2C 26 19 2E 10 A3 5F 01 00 60 8A 2B 26 05 00 04 01 D8 F2 24 
    //11 06 6F 00 0F 00 18 71 2C 26 19 00 60 8A 2B 26 1C 00 04 1B 74 05 00 00 93 36 00 2D 34 0F 19 00 
    //60 8A 2B 26 05 00 68 01 78 2D 34 0F 26 16 16 07 44 01 2D 00 C0 25 33 26 1B 3C 98 00 00 36 58 C6 
    //6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D0 74 99 19 39 53 36 00 2D 34 0F 19 00 60 8A 2B 26 05 00 68 
    //01 78 2D 34 0F 1F 00 1F 00 16 07 28 01 96 36 00 2D 34 0F 19 00 60 8A 2B 26 05 00 68 01 78 2D 34 
    //0F 2C 32 16 07 D6 00 96 00 18 71 2C 26 25 16 0F 00 18 71 2C 26 25 0F 00 E8 5E 07 1B 36 58 C6 6B 
    //0F 12 20 70 4B 32 1D 05 00 0C 02 B0 85 99 19 1C 30 80 69 0F 00 E8 5E 07 1B 1F 5B 43 55 52 52 45 
    //4E 54 46 41 4D 45 50 4F 49 4E 54 53 5D 00 70 1F 00 39 53 00 18 71 2C 26 16 16 1B AB 96 00 00 00 
    //E8 5E 07 1B 16 06 41 01 1B AB 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 48 75 99 19 
    //16 06 36 02 1B 3C 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 75 99 19 39 53 36 00 
    //2D 34 0F 19 00 60 8A 2B 26 05 00 68 01 78 2D 34 0F 1F 00 1F 00 16 07 FB 01 96 36 00 2D 34 0F 19 
    //00 60 8A 2B 26 05 00 68 01 78 2D 34 0F 2C 32 16 1B AB 96 00 00 A8 36 58 C6 6B 0F 12 20 70 4B 32 
    //1D 05 00 0C 02 C0 84 99 19 39 53 00 18 71 2C 26 16 16 1B AB 96 00 00 A8 36 58 C6 6B 0F 12 20 70 
    //4B 32 1D 05 00 0C 02 38 85 99 19 39 53 93 19 00 60 8A 2B 26 19 00 04 1B 74 05 00 00 36 00 2D 34 
    //0F 19 00 60 8A 2B 26 05 00 68 01 78 2D 34 0F 16 00 18 71 2C 26 16 16 16 06 36 02 1B AB 96 00 00 
    //A8 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C0 84 99 19 39 53 00 18 71 2C 26 16 16 1B AB 96 
    //00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 76 99 19 16 04 0B 47 
  }


  function bool UpdateTooltipInfo() {
    local Game_Pawn Pawn;
    if (mPawn != None) {                                                        //0000 : 07 1C 00 77 01 08 5D 07 1B 2A 16 
      BuildTooltip(mPawn,False);                                                //000B : 1B D2 98 00 00 01 08 5D 07 1B 28 16 
      return True;                                                              //0017 : 04 27 
    } else {                                                                    //0019 : 06 79 00 
      if (mPawnPage != None) {                                                  //001C : 07 79 00 77 01 68 57 07 1B 2A 16 
        Pawn = mPawnPage.GetPawnObject();                                       //0027 : 0F 00 58 0C 06 1B 19 01 68 57 07 1B 06 00 04 1B 81 98 00 00 16 
        if (Pawn != None) {                                                     //003C : 07 79 00 77 00 58 0C 06 1B 2A 16 
          BuildTooltip(Pawn,Pawn == Game_PlayerController(GetPlayerController()).Input.cl_GetTargetPawn());//0047 : 1B D2 98 00 00 00 58 0C 06 1B 72 00 58 0C 06 1B 19 19 2E 90 18 5B 01 1B 0E 2F 00 00 16 05 00 04 01 B0 14 37 0F 06 00 04 1B 39 05 00 00 16 16 16 
          return True;                                                          //0077 : 04 27 
        }
      }
    }
    return False;                                                               //0079 : 04 28 
    //07 1C 00 77 01 08 5D 07 1B 2A 16 1B D2 98 00 00 01 08 5D 07 1B 28 16 04 27 06 79 00 07 79 00 77 
    //01 68 57 07 1B 2A 16 0F 00 58 0C 06 1B 19 01 68 57 07 1B 06 00 04 1B 81 98 00 00 16 07 79 00 77 
    //00 58 0C 06 1B 2A 16 1B D2 98 00 00 00 58 0C 06 1B 72 00 58 0C 06 1B 19 19 2E 90 18 5B 01 1B 0E 
    //2F 00 00 16 05 00 04 01 B0 14 37 0F 06 00 04 1B 39 05 00 00 16 16 16 04 27 04 28 04 0B 47 
  }


  function bool UpdateTooltipObject(Object aObject) {
    if (aObject.IsA('GED_PawnPage')) {                                          //0000 : 07 27 00 19 00 30 0B 06 1B 08 00 04 61 2F 21 75 97 00 00 16 
      mPawnPage = GED_PawnPage(aObject);                                        //0014 : 0F 01 68 57 07 1B 2E D0 1A 32 1D 00 30 0B 06 1B 
    } else {                                                                    //0024 : 06 37 00 
      mPawn = Game_Pawn(aObject);                                               //0027 : 0F 01 08 5D 07 1B 2E 18 38 5B 01 00 30 0B 06 1B 
    }
    return Super.UpdateTooltipObject(aObject);                                  //0037 : 04 1C C8 0B A6 19 00 30 0B 06 1B 16 
    //07 27 00 19 00 30 0B 06 1B 08 00 04 61 2F 21 75 97 00 00 16 0F 01 68 57 07 1B 2E D0 1A 32 1D 00 
    //30 0B 06 1B 06 37 00 0F 01 08 5D 07 1B 2E 18 38 5B 01 00 30 0B 06 1B 04 1C C8 0B A6 19 00 30 0B 
    //06 1B 16 04 0B 47 
  }



