//==============================================================================
//  ScenarioManager
//==============================================================================

class ScenarioManager extends Actor
    native
    exportstructs
    dependsOn(Scenario)
    Placeable
  ;

  struct EditorVisibilityInfoStruct {
      var Actor anActor;
      var bool IsVisible;

  };


  var private transient array<EditorVisibilityInfoStruct> mVisibilityInfo;
  var private export transient editinline Scenario mScenarioInUse;
  var private bool mHasTriggered;
  var (ScenarioManager) export editinline Scenario CurrentScenario;
  var (ScenarioManager) bool TriggerOnLevelStart;


  function bool StartScenario(string aScenarioName,Game_Pawn aPawn) {
    local export editinline Scenario aScenario;
    aScenario = Scenario(static.DynamicLoadObject(aScenarioName,Class'Scenario'));//0000 : 0F 00 78 1B 30 0F 2E 68 75 92 01 1C 60 E7 69 0F 00 58 1A 30 0F 20 68 75 92 01 16 
    if (aScenario != None
      && aScenario.VerifyRequirements(aPawn)) {       //001B : 07 55 00 82 77 00 78 1B 30 0F 2A 16 18 15 00 19 00 78 1B 30 0F 0B 00 04 1B DB 6F 00 00 00 F0 1B 30 0F 16 16 
      aScenario.ForwardEvents(aPawn);                                           //003F : 19 00 78 1B 30 0F 0B 00 00 1B 7A 07 00 00 00 F0 1B 30 0F 16 
      return True;                                                              //0053 : 04 27 
    }
    return False;                                                               //0055 : 04 28 
    //0F 00 78 1B 30 0F 2E 68 75 92 01 1C 60 E7 69 0F 00 58 1A 30 0F 20 68 75 92 01 16 07 55 00 82 77 
    //00 78 1B 30 0F 2A 16 18 15 00 19 00 78 1B 30 0F 0B 00 04 1B DB 6F 00 00 00 F0 1B 30 0F 16 16 19 
    //00 78 1B 30 0F 0B 00 00 1B 7A 07 00 00 00 F0 1B 30 0F 16 04 27 04 28 04 0B 47 
  }



