//==============================================================================
//  Base_GameInfo
//==============================================================================

class Base_GameInfo extends GameInfo
    native
    abstract
    exportstructs
    dependsOn(Base_Controller,Base_Pawn)
  ;

  var private transient int d_relevance_object_vtbl;
  var private transient int d_relevance_object_mRelevanceObjectID;
  var private transient int d_relevance_object_mpRelevance;
  var private transient int d_relevance_object_mBlockIndexX;
  var private transient int d_relevance_object_mBlockIndexY;
  var private transient int d_relevance_object_mVisibilityLevel;
  var private transient int d_relevance_object_mbVisible;
  var private transient int d_relevance_object_mbGM;
  var int HackFlags;
  var float mFixedRelativeTimeOfDay;
  var (Base_GameInfo) class<Base_Controller> mPlayerControllerClass;
  var (Base_GameInfo) class<Base_Controller> mTestBotControllerClass;
  var (Base_GameInfo) class<Base_Controller> mGameMasterControllerClass;


  event cl_OnUpdate();


  event cl_OnFrame(float delta);


  event cl_OnLogout(Actor controllerActor) {
    local Base_Controller Controller;
    local Base_Pawn Pawn;
    if (controllerActor != None) {                                              //0000 : 07 9C 00 77 00 18 81 28 11 2A 16 
      Controller = Base_Controller(controllerActor);                            //000B : 0F 00 98 82 28 11 2E 78 3D 24 01 00 18 81 28 11 
      if (Controller.Pawn != None) {                                            //001B : 07 81 00 77 19 00 98 82 28 11 05 00 04 01 88 83 6C 0F 2A 16 
        Pawn = Base_Pawn(Controller.Pawn);                                      //002F : 0F 00 10 83 28 11 2E B8 42 24 01 19 00 98 82 28 11 05 00 04 01 88 83 6C 0F 
        Pawn.cl_OnShutdown();                                                   //0048 : 19 00 10 83 28 11 06 00 00 1B 66 07 00 00 16 
        Controller.cl_OnShutdown();                                             //0057 : 19 00 98 82 28 11 06 00 00 1B 66 07 00 00 16 
        Pawn.Destroy();                                                         //0066 : 19 00 10 83 28 11 03 00 04 61 17 16 
        Controller.Destroy();                                                   //0072 : 19 00 98 82 28 11 03 00 04 61 17 16 
      } else {                                                                  //007E : 06 9C 00 
        Controller.cl_OnShutdown();                                             //0081 : 19 00 98 82 28 11 06 00 00 1B 66 07 00 00 16 
        Controller.Destroy();                                                   //0090 : 19 00 98 82 28 11 03 00 04 61 17 16 
      }
    }
    //07 9C 00 77 00 18 81 28 11 2A 16 0F 00 98 82 28 11 2E 78 3D 24 01 00 18 81 28 11 07 81 00 77 19 
    //00 98 82 28 11 05 00 04 01 88 83 6C 0F 2A 16 0F 00 10 83 28 11 2E B8 42 24 01 19 00 98 82 28 11 
    //05 00 04 01 88 83 6C 0F 19 00 10 83 28 11 06 00 00 1B 66 07 00 00 16 19 00 98 82 28 11 06 00 00 
    //1B 66 07 00 00 16 19 00 10 83 28 11 03 00 04 61 17 16 19 00 98 82 28 11 03 00 04 61 17 16 06 9C 
    //00 19 00 98 82 28 11 06 00 00 1B 66 07 00 00 16 19 00 98 82 28 11 03 00 04 61 17 16 04 0B 47 
  }


  event cl_OnBaseline();


  event sv_OnLogout(int aAccountID,Base_Pawn aPawn) {
    local Base_Controller Controller;
    if (aPawn != None) {                                                        //0000 : 07 5A 00 77 00 00 86 28 11 2A 16 
      Controller = Base_Controller(aPawn.Controller);                           //000B : 0F 00 78 86 28 11 2E 78 3D 24 01 19 00 00 86 28 11 05 00 04 01 00 6E 6C 0F 
      aPawn.sv_OnShutdown();                                                    //0024 : 19 00 00 86 28 11 06 00 00 1C 80 3E 32 0F 16 
      Controller.sv_OnShutdown();                                               //0033 : 19 00 78 86 28 11 06 00 00 1B 74 07 00 00 16 
      aPawn.Destroy();                                                          //0042 : 19 00 00 86 28 11 03 00 04 61 17 16 
      Controller.Destroy();                                                     //004E : 19 00 78 86 28 11 03 00 04 61 17 16 
    }
    //07 5A 00 77 00 00 86 28 11 2A 16 0F 00 78 86 28 11 2E 78 3D 24 01 19 00 00 86 28 11 05 00 04 01 
    //00 6E 6C 0F 19 00 00 86 28 11 06 00 00 1C 80 3E 32 0F 16 19 00 78 86 28 11 06 00 00 1B 74 07 00 
    //00 16 19 00 00 86 28 11 03 00 04 61 17 16 19 00 78 86 28 11 03 00 04 61 17 16 04 0B 47 
  }



