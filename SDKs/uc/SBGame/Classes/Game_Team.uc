//==============================================================================
//  Game_Team
//==============================================================================

class Game_Team extends Object
    native
    dependsOn(Game_Pawn,Game_PlayerController,Game_PlayerTeams)
  ;

  var array<Game_Pawn> mMembers;
  var transient int ExCleanIndex;


  function int Members() {
    return mMembers.Length;                                                     //0000 : 04 37 01 10 C1 27 11 
    //04 37 01 10 C1 27 11 04 0B 47 
  }


  event RemoveMember(Game_Pawn aMember) {
    local int i;
    if (aMember != None) {                                                      //0000 : 07 A5 00 77 00 58 A4 2A 11 2A 16 
      i = 0;                                                                    //000B : 0F 00 E0 A5 2A 11 25 
      while (i < mMembers.Length) {                                             //0012 : 07 A5 00 96 00 E0 A5 2A 11 37 01 10 C1 27 11 16 
        if (mMembers[i] == aMember) {                                           //0022 : 07 9B 00 72 10 00 E0 A5 2A 11 01 10 C1 27 11 00 58 A4 2A 11 16 
          mMembers.Remove(i,1);                                                 //0037 : 41 01 10 C1 27 11 00 E0 A5 2A 11 26 
          if (aMember.Controller != None
            && Game_PlayerController(aMember.Controller) != None) {//0043 : 07 99 00 82 77 19 00 58 A4 2A 11 05 00 04 01 00 6E 6C 0F 2A 16 18 17 00 77 2E 90 18 5B 01 19 00 58 A4 2A 11 05 00 04 01 00 6E 6C 0F 2A 16 16 
            Game_PlayerController(aMember.Controller).GroupingTeams.mTeam = None;//0072 : 0F 19 19 2E 90 18 5B 01 19 00 58 A4 2A 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 48 C2 18 11 05 00 04 01 20 C0 27 11 2A 
          }
          return;                                                               //0099 : 04 0B 
        }
        i++;                                                                    //009B : A5 00 E0 A5 2A 11 16 
      }
    }
    //07 A5 00 77 00 58 A4 2A 11 2A 16 0F 00 E0 A5 2A 11 25 07 A5 00 96 00 E0 A5 2A 11 37 01 10 C1 27 
    //11 16 07 9B 00 72 10 00 E0 A5 2A 11 01 10 C1 27 11 00 58 A4 2A 11 16 41 01 10 C1 27 11 00 E0 A5 
    //2A 11 26 07 99 00 82 77 19 00 58 A4 2A 11 05 00 04 01 00 6E 6C 0F 2A 16 18 17 00 77 2E 90 18 5B 
    //01 19 00 58 A4 2A 11 05 00 04 01 00 6E 6C 0F 2A 16 16 0F 19 19 2E 90 18 5B 01 19 00 58 A4 2A 11 
    //05 00 04 01 00 6E 6C 0F 05 00 04 01 48 C2 18 11 05 00 04 01 20 C0 27 11 2A 04 0B A5 00 E0 A5 2A 
    //11 16 06 12 00 04 0B 47 
  }


  function AddMember(Game_Pawn aMember) {
    local int i;
    if (aMember != None) {                                                      //0000 : 07 AB 00 77 00 08 A7 2A 11 2A 16 
      i = 0;                                                                    //000B : 0F 00 98 A8 2A 11 25 
      while (i < mMembers.Length) {                                             //0012 : 07 43 00 96 00 98 A8 2A 11 37 01 10 C1 27 11 16 
        if (mMembers[i] == aMember) {                                           //0022 : 07 39 00 72 10 00 98 A8 2A 11 01 10 C1 27 11 00 08 A7 2A 11 16 
          return;                                                               //0037 : 04 0B 
        }
        i++;                                                                    //0039 : A5 00 98 A8 2A 11 16 
      }
      if (aMember.Controller != None
        && Game_PlayerController(aMember.Controller) != None) {//0043 : 07 99 00 82 77 19 00 08 A7 2A 11 05 00 04 01 00 6E 6C 0F 2A 16 18 17 00 77 2E 90 18 5B 01 19 00 08 A7 2A 11 05 00 04 01 00 6E 6C 0F 2A 16 16 
        Game_PlayerController(aMember.Controller).GroupingTeams.mTeam = self;   //0072 : 0F 19 19 2E 90 18 5B 01 19 00 08 A7 2A 11 05 00 04 01 00 6E 6C 0F 05 00 04 01 48 C2 18 11 05 00 04 01 20 C0 27 11 17 
      }
      mMembers[mMembers.Length] = aMember;                                      //0099 : 0F 10 37 01 10 C1 27 11 01 10 C1 27 11 00 08 A7 2A 11 
    }
    //07 AB 00 77 00 08 A7 2A 11 2A 16 0F 00 98 A8 2A 11 25 07 43 00 96 00 98 A8 2A 11 37 01 10 C1 27 
    //11 16 07 39 00 72 10 00 98 A8 2A 11 01 10 C1 27 11 00 08 A7 2A 11 16 04 0B A5 00 98 A8 2A 11 16 
    //06 12 00 07 99 00 82 77 19 00 08 A7 2A 11 05 00 04 01 00 6E 6C 0F 2A 16 18 17 00 77 2E 90 18 5B 
    //01 19 00 08 A7 2A 11 05 00 04 01 00 6E 6C 0F 2A 16 16 0F 19 19 2E 90 18 5B 01 19 00 08 A7 2A 11 
    //05 00 04 01 00 6E 6C 0F 05 00 04 01 48 C2 18 11 05 00 04 01 20 C0 27 11 17 0F 10 37 01 10 C1 27 
    //11 01 10 C1 27 11 00 08 A7 2A 11 04 0B 47 
  }


  native function bool IsMember(Game_Pawn aMember);



