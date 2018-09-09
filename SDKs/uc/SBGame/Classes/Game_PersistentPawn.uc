//==============================================================================
//  Game_PersistentPawn
//==============================================================================

class Game_PersistentPawn extends Game_Pawn
    native
    dependsOn(Game_PersistentData)
    Config(User)
  ;

  var float NextPositionStoreTime;
  var export editinline Game_PersistentData mPersistentData;


  event cl_OnShutdown() {
    if (mPersistentData != None && IsLocalPlayer()) {                           //0000 : 07 25 00 82 77 01 38 DF 7E 0F 2A 16 18 07 00 1C 18 1A 76 0F 16 16 
      mPersistentData.Write();                                                  //0016 : 19 01 38 DF 7E 0F 06 00 00 1B 36 03 00 00 16 
    }
    Super.cl_OnShutdown();                                                      //0025 : 1C 18 4E 18 11 16 
    //07 25 00 82 77 01 38 DF 7E 0F 2A 16 18 07 00 1C 18 1A 76 0F 16 16 19 01 38 DF 7E 0F 06 00 00 1B 
    //36 03 00 00 16 1C 18 4E 18 11 16 04 0B 47 
  }


  event cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C 08 28 19 11 16 
    mPersistentData.Read();                                                     //0006 : 19 01 38 DF 7E 0F 06 00 00 1B 94 0D 00 00 16 
    //1C 08 28 19 11 16 19 01 38 DF 7E 0F 06 00 00 1B 94 0D 00 00 16 04 0B 47 
  }


  event OnCreateComponents() {
    Super.OnCreateComponents();                                                 //0000 : 1C E0 3B 19 11 16 
    if (IsClient()) {                                                           //0006 : 07 1E 00 1B 1C 0C 00 00 16 
      mPersistentData = new (self) Class'Game_PersistentData';                  //000F : 0F 01 38 DF 7E 0F 11 17 0B 0B 20 50 A8 5F 01 
    }
    //1C E0 3B 19 11 16 07 1E 00 1B 1C 0C 00 00 16 0F 01 38 DF 7E 0F 11 17 0B 0B 20 50 A8 5F 01 04 0B 
    //47 
  }



