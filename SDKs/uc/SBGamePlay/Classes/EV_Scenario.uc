//==============================================================================
//  EV_Scenario
//==============================================================================

class EV_Scenario extends Content_Event
    collapsecategories
    editinlinenew
    dependsOn(Scenario)
  ;

  var (Action) string ScenarioTag;


  function sv_Execute(Game_Pawn anObject,Game_Pawn aSubject) {
    local export editinline Scenario aScenario;
    aScenario = Scenario(static.DynamicLoadObject(ScenarioTag,Class'Scenario'));//0000 : 0F 00 20 B7 6A 22 2E 68 75 92 01 1C 60 E7 69 0F 01 30 52 4C 23 20 68 75 92 01 16 
    aScenario.ForwardEvents(anObject);                                          //001B : 19 00 20 B7 6A 22 0B 00 00 1B 7A 07 00 00 00 98 B7 6A 22 16 
    //0F 00 20 B7 6A 22 2E 68 75 92 01 1C 60 E7 69 0F 01 30 52 4C 23 20 68 75 92 01 16 19 00 20 B7 6A 
    //22 0B 00 00 1B 7A 07 00 00 00 98 B7 6A 22 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    local export editinline Scenario aScenario;
    aScenario = Scenario(static.DynamicLoadObject(ScenarioTag,Class'Scenario'));//0000 : 0F 00 70 86 A8 22 2E 68 75 92 01 1C 60 E7 69 0F 01 30 52 4C 23 20 68 75 92 01 16 
    if (aScenario != None
      && aScenario.VerifyRequirements(aObject)) {     //001B : 07 41 00 82 77 00 70 86 A8 22 2A 16 18 15 00 19 00 70 86 A8 22 0B 00 04 1B DB 6F 00 00 00 10 B8 6A 22 16 16 
      return True;                                                              //003F : 04 27 
    }
    return False;                                                               //0041 : 04 28 
    //0F 00 70 86 A8 22 2E 68 75 92 01 1C 60 E7 69 0F 01 30 52 4C 23 20 68 75 92 01 16 07 41 00 82 77 
    //00 70 86 A8 22 2A 16 18 15 00 19 00 70 86 A8 22 0B 00 04 1B DB 6F 00 00 00 10 B8 6A 22 16 16 04 
    //27 04 28 04 0B 47 
  }



