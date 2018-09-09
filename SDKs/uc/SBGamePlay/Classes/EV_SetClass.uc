//==============================================================================
//  EV_SetClass
//==============================================================================

class EV_SetClass extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Game_PlayerStats)
  ;

  var (Action) const byte DesiredClass;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    local export editinline Game_PlayerStats playerStats;
    playerStats = Game_PlayerStats(aSubject.CharacterStats);                    //0000 : 0F 00 D8 86 FF 13 2E 10 A3 5F 01 19 00 50 87 FF 13 05 00 04 01 08 43 34 0F 
    playerStats.sv_SetClass(DesiredClass);                                      //0019 : 19 00 D8 86 FF 13 0B 00 00 1B BD 0C 00 00 01 C8 87 FF 13 16 
    //0F 00 D8 86 FF 13 2E 10 A3 5F 01 19 00 50 87 FF 13 05 00 04 01 08 43 34 0F 19 00 D8 86 FF 13 0B 
    //00 00 1B BD 0C 00 00 01 C8 87 FF 13 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    local export editinline Game_PlayerStats playerStats;
    playerStats = Game_PlayerStats(aSubject.CharacterStats);                    //0000 : 0F 00 20 89 FF 13 2E 10 A3 5F 01 19 00 98 89 FF 13 05 00 04 01 08 43 34 0F 
    if (playerStats == None) {                                                  //0019 : 07 26 00 72 00 20 89 FF 13 2A 16 
      return False;                                                             //0024 : 04 28 
    }
    return True;                                                                //0026 : 04 27 
    //0F 00 20 89 FF 13 2E 10 A3 5F 01 19 00 98 89 FF 13 05 00 04 01 08 43 34 0F 07 26 00 72 00 20 89 
    //FF 13 2A 16 04 28 04 27 04 0B 47 
  }



