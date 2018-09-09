//==============================================================================
//  Game_NPCCharacter
//==============================================================================

class Game_NPCCharacter extends Game_Character within Game_NPCPawn
    native
    dependsOn(Game_NPCPawn)
  ;


  function string cl_GetBaseFullName() {
    if (Outer.NPCType != None) {                                                //0000 : 07 30 00 77 19 01 00 E4 6B 0F 05 00 04 01 00 47 1B 11 2A 16 
      return Outer.NPCType.GetLongName();                                       //0014 : 04 19 19 01 00 E4 6B 0F 05 00 04 01 00 47 1B 11 06 00 00 1B 98 0C 00 00 16 
    } else {                                                                    //002D : 06 48 00 
      return "<Unqualified Unnamed>";                                           //0030 : 04 1F 3C 55 6E 71 75 61 6C 69 66 69 65 64 20 55 6E 6E 61 6D 65 64 3E 00 
    }
    //07 30 00 77 19 01 00 E4 6B 0F 05 00 04 01 00 47 1B 11 2A 16 04 19 19 01 00 E4 6B 0F 05 00 04 01 
    //00 47 1B 11 06 00 00 1B 98 0C 00 00 16 06 48 00 04 1F 3C 55 6E 71 75 61 6C 69 66 69 65 64 20 55 
    //6E 6E 61 6D 65 64 3E 00 04 0B 47 
  }


  function string cl_GetBaseName() {
    if (Outer.NPCType != None) {                                                //0000 : 07 30 00 77 19 01 00 E4 6B 0F 05 00 04 01 00 47 1B 11 2A 16 
      return Outer.NPCType.GetShortName();                                      //0014 : 04 19 19 01 00 E4 6B 0F 05 00 04 01 00 47 1B 11 06 00 00 1B 9C 0C 00 00 16 
    } else {                                                                    //002D : 06 3C 00 
      return "<unnamed>";                                                       //0030 : 04 1F 3C 75 6E 6E 61 6D 65 64 3E 00 
    }
    //07 30 00 77 19 01 00 E4 6B 0F 05 00 04 01 00 47 1B 11 2A 16 04 19 19 01 00 E4 6B 0F 05 00 04 01 
    //00 47 1B 11 06 00 00 1B 9C 0C 00 00 16 06 3C 00 04 1F 3C 75 6E 6E 61 6D 65 64 3E 00 04 0B 47 
  }



