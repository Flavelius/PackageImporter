//==============================================================================
//  Deadspell_GameInfo
//==============================================================================

class Deadspell_GameInfo extends Game_GameInfo
    native
    dependsOn(Game_InstanceInfo,Game_PlayerController,Controller,SBRoute,Game_Route,Base_Pawn)
  ;

  var (Deadspell) name DebugDeadspellTag;
  var SBWorld DeathWorld;
  var SBPortal DeathPortal;
  var transient array<Game_InstanceInfo> mInstances;


  event sv_DeadspellFinished(int InstanceID) {
    local int idx;
    idx = 0;                                                                    //0000 : 0F 00 B0 09 35 0F 25 
    while (idx < mInstances.Length) {                                           //0007 : 07 61 00 96 00 B0 09 35 0F 37 01 28 0A 35 0F 16 
      if (mInstances[idx].mInstanceId == InstanceID) {                          //0017 : 07 57 00 9A 19 10 00 B0 09 35 0F 01 28 0A 35 0F 05 00 04 01 A0 0A 35 0F 00 80 08 35 0F 16 
        mInstances[idx].sv_InstanceFinished();                                  //0035 : 19 10 00 B0 09 35 0F 01 28 0A 35 0F 06 00 00 1B 17 0F 00 00 16 
        sv_RemoveInstanceIfEmpty(idx);                                          //004A : 1B DE 0C 00 00 00 B0 09 35 0F 16 
        return;                                                                 //0055 : 04 0B 
      }
      idx++;                                                                    //0057 : A5 00 B0 09 35 0F 16 
    }
    //0F 00 B0 09 35 0F 25 07 61 00 96 00 B0 09 35 0F 37 01 28 0A 35 0F 16 07 57 00 9A 19 10 00 B0 09 
    //35 0F 01 28 0A 35 0F 05 00 04 01 A0 0A 35 0F 00 80 08 35 0F 16 19 10 00 B0 09 35 0F 01 28 0A 35 
    //0F 06 00 00 1B 17 0F 00 00 16 1B DE 0C 00 00 00 B0 09 35 0F 16 04 0B A5 00 B0 09 35 0F 16 06 07 
    //00 04 0B 47 
  }


  function bool PlayerDied(Controller aController) {
    local int idx;
    local bool Result;
    if (IsServer()
      && Game_PlayerController(aController) != None
      && Game_PlayerPawn(Game_PlayerController(aController).Pawn) != None) {//0000 : 07 B6 00 82 82 1B FF 0B 00 00 16 18 0E 00 77 2E 90 18 5B 01 00 C8 0B 35 0F 2A 16 16 18 1C 00 77 2E F0 47 5B 01 19 2E 90 18 5B 01 00 C8 0B 35 0F 05 00 04 01 88 83 6C 0F 2A 16 16 
      idx = 0;                                                                  //003B : 0F 00 70 0D 35 0F 25 
      while (idx < mInstances.Length) {                                         //0042 : 07 B6 00 96 00 70 0D 35 0F 37 01 28 0A 35 0F 16 
        if (mInstances[idx].sv_ContainsController(Game_PlayerController(aController))) {//0052 : 07 AC 00 19 10 00 70 0D 35 0F 01 28 0A 35 0F 10 00 04 1B DB 0C 00 00 2E 90 18 5B 01 00 C8 0B 35 0F 16 
          Result = mInstances[idx].sv_DeathTeleport(Game_PlayerController(aController));//0074 : 14 2D 00 E8 0D 35 0F 19 10 00 70 0D 35 0F 01 28 0A 35 0F 10 00 04 1B 19 0F 00 00 2E 90 18 5B 01 00 C8 0B 35 0F 16 
          sv_RemoveInstanceIfEmpty(idx);                                        //009A : 1B DE 0C 00 00 00 70 0D 35 0F 16 
          return Result;                                                        //00A5 : 04 2D 00 E8 0D 35 0F 
        }
        idx++;                                                                  //00AC : A5 00 70 0D 35 0F 16 
      }
    }
    return False;                                                               //00B6 : 04 28 
    //07 B6 00 82 82 1B FF 0B 00 00 16 18 0E 00 77 2E 90 18 5B 01 00 C8 0B 35 0F 2A 16 16 18 1C 00 77 
    //2E F0 47 5B 01 19 2E 90 18 5B 01 00 C8 0B 35 0F 05 00 04 01 88 83 6C 0F 2A 16 16 0F 00 70 0D 35 
    //0F 25 07 B6 00 96 00 70 0D 35 0F 37 01 28 0A 35 0F 16 07 AC 00 19 10 00 70 0D 35 0F 01 28 0A 35 
    //0F 10 00 04 1B DB 0C 00 00 2E 90 18 5B 01 00 C8 0B 35 0F 16 14 2D 00 E8 0D 35 0F 19 10 00 70 0D 
    //35 0F 01 28 0A 35 0F 10 00 04 1B 19 0F 00 00 2E 90 18 5B 01 00 C8 0B 35 0F 16 1B DE 0C 00 00 00 
    //70 0D 35 0F 16 04 2D 00 E8 0D 35 0F A5 00 70 0D 35 0F 16 06 42 00 04 28 04 0B 47 
  }


  private function sv_RemoveInstanceIfEmpty(int instanceIdx) {
    if (mInstances[instanceIdx].sv_IsEmpty()) {                                 //0000 : 07 35 00 19 10 00 88 0F 35 0F 01 28 0A 35 0F 06 00 04 1B 16 0F 00 00 16 
      DestroyInstanceInfo(mInstances[instanceIdx]);                             //0018 : 1B 20 0F 00 00 10 00 88 0F 35 0F 01 28 0A 35 0F 16 
      mInstances.Remove(instanceIdx,1);                                         //0029 : 41 01 28 0A 35 0F 00 88 0F 35 0F 26 
    }
    //07 35 00 19 10 00 88 0F 35 0F 01 28 0A 35 0F 06 00 04 1B 16 0F 00 00 16 1B 20 0F 00 00 10 00 88 
    //0F 35 0F 01 28 0A 35 0F 16 41 01 28 0A 35 0F 00 88 0F 35 0F 26 04 0B 47 
  }


  private function sv_RemovePlayer(Controller PlayerController) {
    local int idx;
    idx = 0;                                                                    //0000 : 0F 00 98 36 34 19 25 
    while (idx < mInstances.Length) {                                           //0007 : 07 6F 00 96 00 98 36 34 19 37 01 28 0A 35 0F 16 
      if (mInstances[idx].sv_ContainsController(Game_PlayerController(PlayerController))) {//0017 : 07 65 00 19 10 00 98 36 34 19 01 28 0A 35 0F 10 00 04 1B DB 0C 00 00 2E 90 18 5B 01 00 58 35 34 19 16 
        mInstances[idx].sv_RemovePlayer(Game_PlayerController(PlayerController));//0039 : 19 10 00 98 36 34 19 01 28 0A 35 0F 10 00 00 1B DC 0C 00 00 2E 90 18 5B 01 00 58 35 34 19 16 
        sv_RemoveInstanceIfEmpty(idx);                                          //0058 : 1B DE 0C 00 00 00 98 36 34 19 16 
        return;                                                                 //0063 : 04 0B 
      }
      idx++;                                                                    //0065 : A5 00 98 36 34 19 16 
    }
    //0F 00 98 36 34 19 25 07 6F 00 96 00 98 36 34 19 37 01 28 0A 35 0F 16 07 65 00 19 10 00 98 36 34 
    //19 01 28 0A 35 0F 10 00 04 1B DB 0C 00 00 2E 90 18 5B 01 00 58 35 34 19 16 19 10 00 98 36 34 19 
    //01 28 0A 35 0F 10 00 00 1B DC 0C 00 00 2E 90 18 5B 01 00 58 35 34 19 16 1B DE 0C 00 00 00 98 36 
    //34 19 16 04 0B A5 00 98 36 34 19 16 06 07 00 04 0B 47 
  }


  private function sv_AddPlayer(Controller PlayerController,string RouteName) {
    local int idx;
    local Game_InstanceInfo instanceInfo;
    local SBRoute SBRoute;
    SBRoute = FindRoute(RouteName);                                             //0000 : 0F 00 A0 3A 34 19 1B 1E 0F 00 00 00 18 3B 34 19 16 
    idx = 0;                                                                    //0011 : 0F 00 90 3B 34 19 25 
    while (idx < mInstances.Length) {                                           //0018 : 07 80 00 96 00 90 3B 34 19 37 01 28 0A 35 0F 16 
      if (PlayerController.Instance == mInstances[idx].sv_GetInstance()) {      //0028 : 07 76 00 9A 19 00 C0 37 34 19 05 00 04 01 98 88 6E 0F 19 10 00 90 3B 34 19 01 28 0A 35 0F 06 00 04 1B 16 0D 00 00 16 16 
        mInstances[idx].sv_AddPlayer(Game_PlayerController(PlayerController),SBRoute);//0050 : 19 10 00 90 3B 34 19 01 28 0A 35 0F 15 00 00 1B 9E 0C 00 00 2E 90 18 5B 01 00 C0 37 34 19 00 A0 3A 34 19 16 
        return;                                                                 //0074 : 04 0B 
      }
      idx++;                                                                    //0076 : A5 00 90 3B 34 19 16 
    }
    instanceInfo = new Class'Game_InstanceInfo';                                //0080 : 0F 00 08 3C 34 19 11 0B 0B 0B 20 90 EE 5A 01 
    instanceInfo.mInstanceId = PlayerController.Instance;                       //008F : 0F 19 00 08 3C 34 19 05 00 04 01 A0 0A 35 0F 19 00 C0 37 34 19 05 00 04 01 98 88 6E 0F 
    instanceInfo.mFirstLogin = False;                                           //00AC : 14 19 00 08 3C 34 19 06 00 04 2D 01 80 3C 34 19 28 
    instanceInfo.mTime = 0.00000000;                                            //00BD : 0F 19 00 08 3C 34 19 05 00 04 01 F8 3C 34 19 1E 00 00 00 00 
    instanceInfo.mDeathWorld = DeathWorld;                                      //00D1 : 0F 19 00 08 3C 34 19 05 00 04 01 70 3D 34 19 01 E8 3D 34 19 
    instanceInfo.mDeathPortal = DeathPortal;                                    //00E5 : 0F 19 00 08 3C 34 19 05 00 04 01 60 3E 34 19 01 D8 3E 34 19 
    if (SBRoute != None) {                                                      //00F9 : 07 3E 01 77 00 A0 3A 34 19 2A 16 
      instanceInfo.mDestinationWorld = SBRoute.DestinationWorld;                //0104 : 0F 19 00 08 3C 34 19 05 00 04 01 50 3F 34 19 19 00 A0 3A 34 19 05 00 04 01 C8 3F 34 19 
      instanceInfo.mDestinationPortal = SBRoute.DestinationPortal;              //0121 : 0F 19 00 08 3C 34 19 05 00 04 01 40 40 34 19 19 00 A0 3A 34 19 05 00 04 01 B8 40 34 19 
    }
    if (Game_Route(SBRoute) != None) {                                          //013E : 07 70 01 77 2E F0 90 5E 01 00 A0 3A 34 19 2A 16 
      instanceInfo.mEffectsTag = Game_Route(SBRoute).EffectsTag;                //014E : 0F 19 00 08 3C 34 19 05 00 04 01 F0 12 35 0F 19 2E F0 90 5E 01 00 A0 3A 34 19 05 00 04 01 70 42 34 19 
    }
    instanceInfo.sv_AddPlayer(Game_PlayerController(PlayerController),SBRoute); //0170 : 19 00 08 3C 34 19 15 00 00 1B 9E 0C 00 00 2E 90 18 5B 01 00 C0 37 34 19 00 A0 3A 34 19 16 
    mInstances[mInstances.Length] = instanceInfo;                               //018E : 0F 10 37 01 28 0A 35 0F 01 28 0A 35 0F 00 08 3C 34 19 
    //0F 00 A0 3A 34 19 1B 1E 0F 00 00 00 18 3B 34 19 16 0F 00 90 3B 34 19 25 07 80 00 96 00 90 3B 34 
    //19 37 01 28 0A 35 0F 16 07 76 00 9A 19 00 C0 37 34 19 05 00 04 01 98 88 6E 0F 19 10 00 90 3B 34 
    //19 01 28 0A 35 0F 06 00 04 1B 16 0D 00 00 16 16 19 10 00 90 3B 34 19 01 28 0A 35 0F 15 00 00 1B 
    //9E 0C 00 00 2E 90 18 5B 01 00 C0 37 34 19 00 A0 3A 34 19 16 04 0B A5 00 90 3B 34 19 16 06 18 00 
    //0F 00 08 3C 34 19 11 0B 0B 0B 20 90 EE 5A 01 0F 19 00 08 3C 34 19 05 00 04 01 A0 0A 35 0F 19 00 
    //C0 37 34 19 05 00 04 01 98 88 6E 0F 14 19 00 08 3C 34 19 06 00 04 2D 01 80 3C 34 19 28 0F 19 00 
    //08 3C 34 19 05 00 04 01 F8 3C 34 19 1E 00 00 00 00 0F 19 00 08 3C 34 19 05 00 04 01 70 3D 34 19 
    //01 E8 3D 34 19 0F 19 00 08 3C 34 19 05 00 04 01 60 3E 34 19 01 D8 3E 34 19 07 3E 01 77 00 A0 3A 
    //34 19 2A 16 0F 19 00 08 3C 34 19 05 00 04 01 50 3F 34 19 19 00 A0 3A 34 19 05 00 04 01 C8 3F 34 
    //19 0F 19 00 08 3C 34 19 05 00 04 01 40 40 34 19 19 00 A0 3A 34 19 05 00 04 01 B8 40 34 19 07 70 
    //01 77 2E F0 90 5E 01 00 A0 3A 34 19 2A 16 0F 19 00 08 3C 34 19 05 00 04 01 F0 12 35 0F 19 2E F0 
    //90 5E 01 00 A0 3A 34 19 05 00 04 01 70 42 34 19 19 00 08 3C 34 19 15 00 00 1B 9E 0C 00 00 2E 90 
    //18 5B 01 00 C0 37 34 19 00 A0 3A 34 19 16 0F 10 37 01 28 0A 35 0F 01 28 0A 35 0F 00 08 3C 34 19 
    //04 0B 47 
  }


  private event sv_Ready(Game_PlayerController PlayerController) {
    local int idx;
    idx = 0;                                                                    //0000 : 0F 00 D8 44 34 19 25 
    while (idx < mInstances.Length) {                                           //0007 : 07 72 00 96 00 D8 44 34 19 37 01 28 0A 35 0F 16 
      if (mInstances[idx].sv_ContainsController(PlayerController)) {            //0017 : 07 68 00 19 10 00 D8 44 34 19 01 28 0A 35 0F 0B 00 04 1B DB 0C 00 00 00 98 43 34 19 16 
        mInstances[idx].sv_TriggerEffects(self,PlayerController);               //0034 : 19 10 00 D8 44 34 19 01 28 0A 35 0F 0C 00 00 1B 1A 0F 00 00 17 00 98 43 34 19 16 
        mInstances[idx].mFirstLogin = True;                                     //004F : 14 19 10 00 D8 44 34 19 01 28 0A 35 0F 06 00 04 2D 01 80 3C 34 19 27 
        return;                                                                 //0066 : 04 0B 
      }
      idx++;                                                                    //0068 : A5 00 D8 44 34 19 16 
    }
    //0F 00 D8 44 34 19 25 07 72 00 96 00 D8 44 34 19 37 01 28 0A 35 0F 16 07 68 00 19 10 00 D8 44 34 
    //19 01 28 0A 35 0F 0B 00 04 1B DB 0C 00 00 00 98 43 34 19 16 19 10 00 D8 44 34 19 01 28 0A 35 0F 
    //0C 00 00 1B 1A 0F 00 00 17 00 98 43 34 19 16 14 19 10 00 D8 44 34 19 01 28 0A 35 0F 06 00 04 2D 
    //01 80 3C 34 19 27 04 0B A5 00 D8 44 34 19 16 06 07 00 04 0B 47 
  }


  event sv_OnPostLogin(Game_PlayerPawn aPawn) {
    Super.sv_OnPostLogin(aPawn);                                                //0000 : 1C 60 AC 28 11 00 00 46 34 19 16 
    sv_Ready(Game_PlayerController(aPawn.Controller));                          //000B : 1B 2C 07 00 00 2E 90 18 5B 01 19 00 00 46 34 19 05 00 04 01 00 6E 6C 0F 16 
    //1C 60 AC 28 11 00 00 46 34 19 16 1B 2C 07 00 00 2E 90 18 5B 01 19 00 00 46 34 19 05 00 04 01 00 
    //6E 6C 0F 16 04 0B 47 
  }


  event sv_OnLogout(int aAccountID,Base_Pawn aPawn) {
    if (aPawn != None) {                                                        //0000 : 07 1F 00 77 00 A0 47 34 19 2A 16 
      sv_RemovePlayer(aPawn.Controller);                                        //000B : 1B DC 0C 00 00 19 00 A0 47 34 19 05 00 04 01 00 6E 6C 0F 16 
    }
    Super.sv_OnLogout(aAccountID,aPawn);                                        //001F : 1C 48 AA 28 11 00 28 47 34 19 00 A0 47 34 19 16 
    //07 1F 00 77 00 A0 47 34 19 2A 16 1B DC 0C 00 00 19 00 A0 47 34 19 05 00 04 01 00 6E 6C 0F 16 1C 
    //48 AA 28 11 00 28 47 34 19 00 A0 47 34 19 16 04 0B 47 
  }


  event sv_OnLogin(Game_PlayerController aController,string portalName,string RouteName) {
    Super.sv_OnLogin(aController,portalName,RouteName);                         //0000 : 1C 60 B0 28 11 00 C8 48 34 19 00 40 49 34 19 00 B8 49 34 19 16 
    sv_AddPlayer(aController,RouteName);                                        //0015 : 1B 9E 0C 00 00 00 C8 48 34 19 00 B8 49 34 19 16 
    //1C 60 B0 28 11 00 C8 48 34 19 00 40 49 34 19 00 B8 49 34 19 16 1B 9E 0C 00 00 00 C8 48 34 19 00 
    //B8 49 34 19 16 04 0B 47 
  }


  event PostBeginPlay() {
    DeadspellParseInstanceOptions("");                                          //0000 : 1B 1D 0F 00 00 1F 00 16 
    //1B 1D 0F 00 00 1F 00 16 04 0B 47 
  }


  native function DestroyInstanceInfo(Game_InstanceInfo instanceInfo);


  native function SBRoute FindRoute(string RouteName);


  native function DeadspellParseInstanceOptions(string Options);



