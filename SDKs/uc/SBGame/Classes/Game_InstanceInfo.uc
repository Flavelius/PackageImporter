//==============================================================================
//  Game_InstanceInfo
//==============================================================================

class Game_InstanceInfo extends Object
    native
    dependsOn(Game_PlayerInfo,Game_Route,Game_PlayerController,Game_GameInfo)
  ;

  var transient int mInstanceId;
  var transient bool mFirstLogin;
  var transient float mTime;
  var transient SBWorld mDeathWorld;
  var transient SBPortal mDeathPortal;
  var transient SBWorld mDestinationWorld;
  var transient SBPortal mDestinationPortal;
  var transient name mEffectsTag;
  var transient array<Game_PlayerInfo> mPlayers;


  function sv_RemovePlayer(Game_PlayerController PlayerController) {
    local int idx;
    idx = 0;                                                                    //0000 : 0F 00 B0 67 34 19 25 
    while (idx < mPlayers.Length) {                                             //0007 : 07 5E 00 96 00 B0 67 34 19 37 01 28 68 34 19 16 
      if (mPlayers[idx].mController == PlayerController) {                      //0017 : 07 54 00 72 19 10 00 B0 67 34 19 01 28 68 34 19 05 00 04 01 A0 68 34 19 00 88 66 34 19 16 
        DestroyPlayerInfo(mPlayers[idx]);                                       //0035 : 1B 31 0D 00 00 10 00 B0 67 34 19 01 28 68 34 19 16 
        mPlayers.Remove(idx,1);                                                 //0046 : 41 01 28 68 34 19 00 B0 67 34 19 26 
        return;                                                                 //0052 : 04 0B 
      }
      idx++;                                                                    //0054 : A5 00 B0 67 34 19 16 
    }
    //0F 00 B0 67 34 19 25 07 5E 00 96 00 B0 67 34 19 37 01 28 68 34 19 16 07 54 00 72 19 10 00 B0 67 
    //34 19 01 28 68 34 19 05 00 04 01 A0 68 34 19 00 88 66 34 19 16 1B 31 0D 00 00 10 00 B0 67 34 19 
    //01 28 68 34 19 16 41 01 28 68 34 19 00 B0 67 34 19 26 04 0B A5 00 B0 67 34 19 16 06 07 00 04 0B 
    //47 
  }


  function sv_AddPlayer(Game_PlayerController PlayerController,SBRoute SBRoute) {
    local Game_PlayerInfo playerInfo;
    playerInfo = new Class'Game_PlayerInfo';                                    //0000 : 0F 00 40 6A 34 19 11 0B 0B 0B 20 D0 F3 5A 01 
    playerInfo.mController = PlayerController;                                  //000F : 0F 19 00 40 6A 34 19 05 00 04 01 A0 68 34 19 00 C8 69 34 19 
    if (Game_Route(SBRoute) != None) {                                          //0023 : 07 77 00 77 2E F0 90 5E 01 00 B8 6A 34 19 2A 16 
      playerInfo.mDeathWorld = Game_Route(SBRoute).DeathWorld;                  //0033 : 0F 19 00 40 6A 34 19 05 00 04 01 30 6B 34 19 19 2E F0 90 5E 01 00 B8 6A 34 19 05 00 04 01 A8 6B 34 19 
      playerInfo.mDeathPortal = Game_Route(SBRoute).DeathPortal;                //0055 : 0F 19 00 40 6A 34 19 05 00 04 01 20 6C 34 19 19 2E F0 90 5E 01 00 B8 6A 34 19 05 00 04 01 98 6C 34 19 
    }
    mPlayers[mPlayers.Length] = playerInfo;                                     //0077 : 0F 10 37 01 28 68 34 19 01 28 68 34 19 00 40 6A 34 19 
    //0F 00 40 6A 34 19 11 0B 0B 0B 20 D0 F3 5A 01 0F 19 00 40 6A 34 19 05 00 04 01 A0 68 34 19 00 C8 
    //69 34 19 07 77 00 77 2E F0 90 5E 01 00 B8 6A 34 19 2A 16 0F 19 00 40 6A 34 19 05 00 04 01 30 6B 
    //34 19 19 2E F0 90 5E 01 00 B8 6A 34 19 05 00 04 01 A8 6B 34 19 0F 19 00 40 6A 34 19 05 00 04 01 
    //20 6C 34 19 19 2E F0 90 5E 01 00 B8 6A 34 19 05 00 04 01 98 6C 34 19 0F 10 37 01 28 68 34 19 01 
    //28 68 34 19 00 40 6A 34 19 04 0B 47 
  }


  function bool sv_ContainsName(string PlayerName) {
    local int idx;
    idx = 0;                                                                    //0000 : 0F 00 38 6E 34 19 25 
    while (idx < mPlayers.Length) {                                             //0007 : 07 42 00 96 00 38 6E 34 19 37 01 28 68 34 19 16 
      if (mPlayers[idx].sv_GetName() == PlayerName) {                           //0017 : 07 38 00 7A 19 10 00 38 6E 34 19 01 28 68 34 19 06 00 00 1B 61 0D 00 00 16 00 C0 6D 34 19 16 
        return True;                                                            //0036 : 04 27 
      }
      idx++;                                                                    //0038 : A5 00 38 6E 34 19 16 
    }
    return False;                                                               //0042 : 04 28 
    //0F 00 38 6E 34 19 25 07 42 00 96 00 38 6E 34 19 37 01 28 68 34 19 16 07 38 00 7A 19 10 00 38 6E 
    //34 19 01 28 68 34 19 06 00 00 1B 61 0D 00 00 16 00 C0 6D 34 19 16 04 27 A5 00 38 6E 34 19 16 06 
    //07 00 04 28 04 0B 47 
  }


  function bool sv_ContainsController(Game_PlayerController PlayerController) {
    local int idx;
    idx = 0;                                                                    //0000 : 0F 00 F8 70 34 19 25 
    while (idx < mPlayers.Length) {                                             //0007 : 07 54 00 96 00 F8 70 34 19 37 01 28 68 34 19 16 
      if (mPlayers[idx].sv_GetController().CharacterID == PlayerController.CharacterID) {//0017 : 07 4A 00 9A 19 19 10 00 F8 70 34 19 01 28 68 34 19 06 00 04 1B D6 0C 00 00 16 05 00 04 01 68 3B 19 11 19 00 D8 6F 34 19 05 00 04 01 68 3B 19 11 16 
        return True;                                                            //0048 : 04 27 
      }
      idx++;                                                                    //004A : A5 00 F8 70 34 19 16 
    }
    return False;                                                               //0054 : 04 28 
    //0F 00 F8 70 34 19 25 07 54 00 96 00 F8 70 34 19 37 01 28 68 34 19 16 07 4A 00 9A 19 19 10 00 F8 
    //70 34 19 01 28 68 34 19 06 00 04 1B D6 0C 00 00 16 05 00 04 01 68 3B 19 11 19 00 D8 6F 34 19 05 
    //00 04 01 68 3B 19 11 16 04 27 A5 00 F8 70 34 19 16 06 07 00 04 28 04 0B 47 
  }


  function sv_TriggerEffects(Game_GameInfo GameInfo,Game_PlayerController PlayerController) {
    local int idx;
    if (mEffectsTag == 'None') {                                                //0000 : 07 11 00 FE 01 F0 12 35 0F 21 00 00 00 00 16 
      return;                                                                   //000F : 04 0B 
    }
    idx = 0;                                                                    //0011 : 0F 00 08 74 34 19 25 
    while (idx < mPlayers.Length) {                                             //0018 : 07 93 00 96 00 08 74 34 19 37 01 28 68 34 19 16 
      if (mPlayers[idx].sv_GetController().CharacterID == PlayerController.CharacterID) {//0028 : 07 89 00 9A 19 19 10 00 08 74 34 19 01 28 68 34 19 06 00 04 1B D6 0C 00 00 16 05 00 04 01 68 3B 19 11 19 00 80 74 34 19 05 00 04 01 68 3B 19 11 16 
        GameInfo.TriggerEvent(mEffectsTag,GameInfo,mPlayers[idx].sv_GetPawn()); //0059 : 19 00 98 72 34 19 25 00 00 1C F8 B1 34 0F 01 F0 12 35 0F 00 98 72 34 19 19 10 00 08 74 34 19 01 28 68 34 19 06 00 04 1B 83 0C 00 00 16 16 
        return;                                                                 //0087 : 04 0B 
      }
      idx++;                                                                    //0089 : A5 00 08 74 34 19 16 
    }
    //07 11 00 FE 01 F0 12 35 0F 21 00 00 00 00 16 04 0B 0F 00 08 74 34 19 25 07 93 00 96 00 08 74 34 
    //19 37 01 28 68 34 19 16 07 89 00 9A 19 19 10 00 08 74 34 19 01 28 68 34 19 06 00 04 1B D6 0C 00 
    //00 16 05 00 04 01 68 3B 19 11 19 00 80 74 34 19 05 00 04 01 68 3B 19 11 16 19 00 98 72 34 19 25 
    //00 00 1C F8 B1 34 0F 01 F0 12 35 0F 00 98 72 34 19 19 10 00 08 74 34 19 01 28 68 34 19 06 00 04 
    //1B 83 0C 00 00 16 16 04 0B A5 00 08 74 34 19 16 06 18 00 04 0B 47 
  }


  function bool sv_DeathTeleport(Game_PlayerController PlayerController) {
    local int idx;
    idx = 0;                                                                    //0000 : 0F 00 20 76 34 19 25 
    while (idx < mPlayers.Length) {                                             //0007 : 07 F1 00 96 00 20 76 34 19 37 01 28 68 34 19 16 
      if (mPlayers[idx].sv_GetController().CharacterID == PlayerController.CharacterID) {//0017 : 07 E7 00 9A 19 19 10 00 20 76 34 19 01 28 68 34 19 06 00 04 1B D6 0C 00 00 16 05 00 04 01 68 3B 19 11 19 00 A8 75 34 19 05 00 04 01 68 3B 19 11 16 
        if (mPlayers[idx].mDeathWorld != None) {                                //0048 : 07 AD 00 77 19 10 00 20 76 34 19 01 28 68 34 19 05 00 04 01 30 6B 34 19 2A 16 
          mPlayers[idx].sv_Teleport(mPlayers[idx].mDeathWorld,mPlayers[idx].mDeathPortal);//0062 : 19 10 00 20 76 34 19 01 28 68 34 19 2E 00 00 1B D9 0C 00 00 19 10 00 20 76 34 19 01 28 68 34 19 05 00 04 01 30 6B 34 19 19 10 00 20 76 34 19 01 28 68 34 19 05 00 04 01 20 6C 34 19 16 
          mPlayers.Remove(idx,1);                                               //009F : 41 01 28 68 34 19 00 20 76 34 19 26 
          return True;                                                          //00AB : 04 27 
        }
        if (mDeathWorld != None) {                                              //00AD : 07 E5 00 77 01 70 3D 34 19 2A 16 
          mPlayers[idx].sv_Teleport(mDeathWorld,mDeathPortal);                  //00B8 : 19 10 00 20 76 34 19 01 28 68 34 19 10 00 00 1B D9 0C 00 00 01 70 3D 34 19 01 60 3E 34 19 16 
          mPlayers.Remove(idx,1);                                               //00D7 : 41 01 28 68 34 19 00 20 76 34 19 26 
          return True;                                                          //00E3 : 04 27 
        }
        return False;                                                           //00E5 : 04 28 
      }
      idx++;                                                                    //00E7 : A5 00 20 76 34 19 16 
    }
    return False;                                                               //00F1 : 04 28 
    //0F 00 20 76 34 19 25 07 F1 00 96 00 20 76 34 19 37 01 28 68 34 19 16 07 E7 00 9A 19 19 10 00 20 
    //76 34 19 01 28 68 34 19 06 00 04 1B D6 0C 00 00 16 05 00 04 01 68 3B 19 11 19 00 A8 75 34 19 05 
    //00 04 01 68 3B 19 11 16 07 AD 00 77 19 10 00 20 76 34 19 01 28 68 34 19 05 00 04 01 30 6B 34 19 
    //2A 16 19 10 00 20 76 34 19 01 28 68 34 19 2E 00 00 1B D9 0C 00 00 19 10 00 20 76 34 19 01 28 68 
    //34 19 05 00 04 01 30 6B 34 19 19 10 00 20 76 34 19 01 28 68 34 19 05 00 04 01 20 6C 34 19 16 41 
    //01 28 68 34 19 00 20 76 34 19 26 04 27 07 E5 00 77 01 70 3D 34 19 2A 16 19 10 00 20 76 34 19 01 
    //28 68 34 19 10 00 00 1B D9 0C 00 00 01 70 3D 34 19 01 60 3E 34 19 16 41 01 28 68 34 19 00 20 76 
    //34 19 26 04 27 04 28 A5 00 20 76 34 19 16 06 07 00 04 28 04 0B 47 
  }


  function sv_InstanceFinished() {
    local int idx;
    idx = 0;                                                                    //0000 : 0F 00 C0 77 34 19 25 
    while (idx < mPlayers.Length) {                                             //0007 : 07 40 00 96 00 C0 77 34 19 37 01 28 68 34 19 16 
      mPlayers[idx].sv_Teleport(mDestinationWorld,mDestinationPortal);          //0017 : 19 10 00 C0 77 34 19 01 28 68 34 19 10 00 00 1B D9 0C 00 00 01 50 3F 34 19 01 40 40 34 19 16 
      idx++;                                                                    //0036 : A5 00 C0 77 34 19 16 
    }
    idx = 0;                                                                    //0040 : 0F 00 C0 77 34 19 25 
    while (idx < mPlayers.Length) {                                             //0047 : 07 72 00 96 00 C0 77 34 19 37 01 28 68 34 19 16 
      DestroyPlayerInfo(mPlayers[idx]);                                         //0057 : 1B 31 0D 00 00 10 00 C0 77 34 19 01 28 68 34 19 16 
      idx++;                                                                    //0068 : A5 00 C0 77 34 19 16 
    }
    mPlayers.Length = 0;                                                        //0072 : 0F 37 01 28 68 34 19 25 
    //0F 00 C0 77 34 19 25 07 40 00 96 00 C0 77 34 19 37 01 28 68 34 19 16 19 10 00 C0 77 34 19 01 28 
    //68 34 19 10 00 00 1B D9 0C 00 00 01 50 3F 34 19 01 40 40 34 19 16 A5 00 C0 77 34 19 16 06 07 00 
    //0F 00 C0 77 34 19 25 07 72 00 96 00 C0 77 34 19 37 01 28 68 34 19 16 1B 31 0D 00 00 10 00 C0 77 
    //34 19 01 28 68 34 19 16 A5 00 C0 77 34 19 16 06 47 00 0F 37 01 28 68 34 19 25 04 0B 47 
  }


  function bool sv_IsEmpty() {
    return mPlayers.Length == 0;                                                //0000 : 04 9A 37 01 28 68 34 19 25 16 
    //04 9A 37 01 28 68 34 19 25 16 04 0B 47 
  }


  function int sv_GetInstance() {
    return mInstanceId;                                                         //0000 : 04 01 A0 0A 35 0F 
    //04 01 A0 0A 35 0F 04 0B 47 
  }


  native function DestroyPlayerInfo(Game_PlayerInfo playerInfo);



