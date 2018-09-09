//==============================================================================
//  ViewMap_Controller
//==============================================================================

class ViewMap_Controller extends Game_PlayerController
    dependsOn(Game_GameClient,SceneManager,Player,Console)
    Config(User)
  ;

  var bool SceneManagerActive;


  exec function StopScene() {
    local SceneManager SM;
    local Game_GameClient Engine;
    Engine = Game_GameClient(Class'Actor'.static.GetGameEngine());              //0000 : 0F 00 00 04 36 0F 2E D8 D3 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 
    foreach AllActors(Class'SceneManager',SM) {                                 //001A : 2F 61 30 20 70 4D D5 00 00 88 03 36 0F 16 62 00 
      Engine.StopSceneDump();                                                   //002A : 19 00 00 04 36 0F 06 00 00 1B 2D 13 00 00 16 
      SM.CurrentTime = SM.TotalSceneTime;                                       //0039 : 0F 19 00 88 03 36 0F 05 00 04 01 78 04 36 0F 19 00 88 03 36 0F 05 00 04 01 F0 04 36 0F 
      SceneManagerActive = False;                                               //0056 : 14 2D 01 68 05 36 0F 28 
      goto jl0062;                                                              //005E : 06 62 00 
    }
    //0F 00 00 04 36 0F 2E D8 D3 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 2F 61 30 20 70 4D 
    //D5 00 00 88 03 36 0F 16 62 00 19 00 00 04 36 0F 06 00 00 1B 2D 13 00 00 16 0F 19 00 88 03 36 0F 
    //05 00 04 01 78 04 36 0F 19 00 88 03 36 0F 05 00 04 01 F0 04 36 0F 14 2D 01 68 05 36 0F 28 06 62 
    //00 31 30 04 0B 47 
  }


  exec function DumpScene(optional float StartTime) {
    local SceneManager SM;
    local Game_GameClient Engine;
    Engine = Game_GameClient(Class'Actor'.static.GetGameEngine());              //0000 : 0F 00 D8 2B 37 0F 2E D8 D3 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 
    foreach AllActors(Class'SceneManager',SM) {                                 //001A : 2F 61 30 20 70 4D D5 00 00 50 2C 37 0F 16 93 00 
      SM.bIsRunning = True;                                                     //002A : 14 19 00 50 2C 37 0F 06 00 04 2D 01 C8 2C 37 0F 27 
      SM.bIsSceneStarted = False;                                               //003B : 14 19 00 50 2C 37 0F 06 00 04 2D 01 40 2D 37 0F 28 
      SM.OffsetStartFactor = StartTime;                                         //004C : 0F 19 00 50 2C 37 0F 05 00 04 01 B8 2D 37 0F 00 E0 05 36 0F 
      Player.Console.ConsoleClose();                                            //0060 : 19 19 01 28 25 71 0F 05 00 04 01 10 76 6D 0F 06 00 00 1B F5 0E 00 00 16 
      Engine.StartSceneDump();                                                  //0078 : 19 00 D8 2B 37 0F 06 00 00 1B 2C 13 00 00 16 
      SceneManagerActive = True;                                                //0087 : 14 2D 01 68 05 36 0F 27 
      goto jl0093;                                                              //008F : 06 93 00 
    }
    //0F 00 D8 2B 37 0F 2E D8 D3 5A 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 2F 61 30 20 70 4D 
    //D5 00 00 50 2C 37 0F 16 93 00 14 19 00 50 2C 37 0F 06 00 04 2D 01 C8 2C 37 0F 27 14 19 00 50 2C 
    //37 0F 06 00 04 2D 01 40 2D 37 0F 28 0F 19 00 50 2C 37 0F 05 00 04 01 B8 2D 37 0F 00 E0 05 36 0F 
    //19 19 01 28 25 71 0F 05 00 04 01 10 76 6D 0F 06 00 00 1B F5 0E 00 00 16 19 00 D8 2B 37 0F 06 00 
    //00 1B 2C 13 00 00 16 14 2D 01 68 05 36 0F 27 06 93 00 31 30 04 0B 47 
  }


  exec function StartScene(optional float StartTime) {
    local SceneManager SM;
    foreach AllActors(Class'SceneManager',SM) {                                 //0000 : 2F 61 30 20 70 4D D5 00 00 E0 B5 36 19 16 6A 00 
      SM.bIsRunning = True;                                                     //0010 : 14 19 00 E0 B5 36 19 06 00 04 2D 01 C8 2C 37 0F 27 
      SM.bIsSceneStarted = False;                                               //0021 : 14 19 00 E0 B5 36 19 06 00 04 2D 01 40 2D 37 0F 28 
      SM.OffsetStartFactor = StartTime;                                         //0032 : 0F 19 00 E0 B5 36 19 05 00 04 01 B8 2D 37 0F 00 E0 2E 37 0F 
      SceneManagerActive = True;                                                //0046 : 14 2D 01 68 05 36 0F 27 
      Player.Console.ConsoleClose();                                            //004E : 19 19 01 28 25 71 0F 05 00 04 01 10 76 6D 0F 06 00 00 1B F5 0E 00 00 16 
      goto jl006A;                                                              //0066 : 06 6A 00 
    }
    //2F 61 30 20 70 4D D5 00 00 E0 B5 36 19 16 6A 00 14 19 00 E0 B5 36 19 06 00 04 2D 01 C8 2C 37 0F 
    //27 14 19 00 E0 B5 36 19 06 00 04 2D 01 40 2D 37 0F 28 0F 19 00 E0 B5 36 19 05 00 04 01 B8 2D 37 
    //0F 00 E0 2E 37 0F 14 2D 01 68 05 36 0F 27 19 19 01 28 25 71 0F 05 00 04 01 10 76 6D 0F 06 00 00 
    //1B F5 0E 00 00 16 06 6A 00 31 30 04 0B 47 
  }


  event cl_OnPlayerTick(float DeltaTime) {
    if (!SceneManagerActive) {                                                  //0000 : 07 4E 00 81 2D 01 68 05 36 0F 16 
      Super.cl_OnPlayerTick(DeltaTime);                                         //000B : 1C 30 4A 1B 11 00 08 B7 36 19 16 
      if (Game_Pawn(Pawn).Physics == 4) {                                       //0016 : 07 4E 00 9A 39 3A 19 2E 18 38 5B 01 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 04 16 
        Game_Pawn(Pawn).Acceleration *= 0.69999999;                             //0034 : DD 19 2E 18 38 5B 01 01 88 83 6C 0F 05 00 0C 01 18 96 6C 0F 1E 33 33 33 3F 16 
      }
    }
    //07 4E 00 81 2D 01 68 05 36 0F 16 1C 30 4A 1B 11 00 08 B7 36 19 16 07 4E 00 9A 39 3A 19 2E 18 38 
    //5B 01 01 88 83 6C 0F 05 00 01 01 C0 93 6C 0F 39 3A 24 04 16 DD 19 2E 18 38 5B 01 01 88 83 6C 0F 
    //05 00 0C 01 18 96 6C 0F 1E 33 33 33 3F 16 04 0B 47 
  }


  event cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C C0 9E 1B 11 16 
    if (GUI != None) {                                                          //0006 : 07 6B 00 77 01 40 8A 1B 11 2A 16 
      GUI.HideMinimap();                                                        //0011 : 19 01 40 8A 1B 11 06 00 00 1B 73 0E 00 00 16 
      GUI.HideChat();                                                           //0020 : 19 01 40 8A 1B 11 06 00 00 1B 82 0E 00 00 16 
      GUI.HideCombatBar();                                                      //002F : 19 01 40 8A 1B 11 06 00 00 1B FF 0C 00 00 16 
      GUI.HidePlayerAvatar();                                                   //003E : 19 01 40 8A 1B 11 06 00 00 1B 65 0E 00 00 16 
      GUI.HideTeam();                                                           //004D : 19 01 40 8A 1B 11 06 00 00 1B 93 0E 00 00 16 
      GUI.HideFriends();                                                        //005C : 19 01 40 8A 1B 11 06 00 00 1B 94 0E 00 00 16 
    }
    //1C C0 9E 1B 11 16 07 6B 00 77 01 40 8A 1B 11 2A 16 19 01 40 8A 1B 11 06 00 00 1B 73 0E 00 00 16 
    //19 01 40 8A 1B 11 06 00 00 1B 82 0E 00 00 16 19 01 40 8A 1B 11 06 00 00 1B FF 0C 00 00 16 19 01 
    //40 8A 1B 11 06 00 00 1B 65 0E 00 00 16 19 01 40 8A 1B 11 06 00 00 1B 93 0E 00 00 16 19 01 40 8A 
    //1B 11 06 00 00 1B 94 0E 00 00 16 04 0B 47 
  }



