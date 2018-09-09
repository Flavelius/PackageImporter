//==============================================================================
//  Character_Pawn
//==============================================================================

class Character_Pawn extends Game_Pawn
    native
    dependsOn(Game_PersistentData)
    Config(User)
  ;

  var private int mCharacterID;
  var private int mLastUsedTimestamp;
  var private array<int> mSelectEmoteIndices;
  var private array<int> mDeleteEmoteIndices;
  var export editinline Game_PersistentData mPersistentData;


  event cl_PlayDeleteEmote() {
    if (FRand() > 0.30000001) {                                                 //0000 : 07 2B 00 B1 C3 16 1E 9A 99 99 3E 16 
      Emotes.PlayLocalEmote(mDeleteEmoteIndices[Rand(mDeleteEmoteIndices.Length)]);//000C : 19 01 F0 51 18 11 16 00 00 1C 18 14 25 11 39 3D 10 A7 37 01 38 8F 35 11 16 01 38 8F 35 11 16 
    }
    //07 2B 00 B1 C3 16 1E 9A 99 99 3E 16 19 01 F0 51 18 11 16 00 00 1C 18 14 25 11 39 3D 10 A7 37 01 
    //38 8F 35 11 16 01 38 8F 35 11 16 04 0B 47 
  }


  event cl_PlaySelectEmote() {
    if (FRand() > 0.30000001) {                                                 //0000 : 07 2B 00 B1 C3 16 1E 9A 99 99 3E 16 
      Emotes.PlayLocalEmote(mSelectEmoteIndices[Rand(mSelectEmoteIndices.Length)]);//000C : 19 01 F0 51 18 11 16 00 00 1C 18 14 25 11 39 3D 10 A7 37 01 C8 90 35 11 16 01 C8 90 35 11 16 
    }
    //07 2B 00 B1 C3 16 1E 9A 99 99 3E 16 19 01 F0 51 18 11 16 00 00 1C 18 14 25 11 39 3D 10 A7 37 01 
    //C8 90 35 11 16 01 C8 90 35 11 16 04 0B 47 
  }


  protected function class<Game_HUD> GetGameHUDClass() {
    return None;                                                                //0000 : 04 2A 
    //04 2A 04 0B 47 
  }


  event cl_OnInit() {
    local Game_Controller gc;
    Super.cl_OnInit();                                                          //0000 : 1C 08 28 19 11 16 
    gc = Game_Controller(Controller);                                           //0006 : 0F 00 50 93 35 11 2E 10 0E 5B 01 01 00 6E 6C 0F 
    mCharacterID = gc.CharacterID;                                              //0016 : 0F 01 C8 93 35 11 19 00 50 93 35 11 05 00 04 01 68 3B 19 11 
    mLastUsedTimestamp = gc.DBCharacter.LastUsedTimestamp;                      //002A : 0F 01 40 94 35 11 19 19 00 50 93 35 11 05 00 04 01 30 2F 19 11 05 00 04 01 B8 CB 26 11 
    mPersistentData.Read();                                                     //0047 : 19 01 B8 94 35 11 06 00 00 1B 94 0D 00 00 16 
    //1C 08 28 19 11 16 0F 00 50 93 35 11 2E 10 0E 5B 01 01 00 6E 6C 0F 0F 01 C8 93 35 11 19 00 50 93 
    //35 11 05 00 04 01 68 3B 19 11 0F 01 40 94 35 11 19 19 00 50 93 35 11 05 00 04 01 30 2F 19 11 05 
    //00 04 01 B8 CB 26 11 19 01 B8 94 35 11 06 00 00 1B 94 0D 00 00 16 04 0B 47 
  }


  event OnCreateComponents() {
    Super.OnCreateComponents();                                                 //0000 : 1C E0 3B 19 11 16 
    mPersistentData = new (self) Class'Game_PersistentData';                    //0006 : 0F 01 B8 94 35 11 11 17 0B 0B 20 50 A8 5F 01 
    CharacterStats.mHealth = 100.00000000;                                      //0015 : 0F 19 01 08 43 34 0F 05 00 04 01 30 8E 1F 11 1E 00 00 C8 42 
    //1C E0 3B 19 11 16 0F 01 B8 94 35 11 11 17 0B 0B 20 50 A8 5F 01 0F 19 01 08 43 34 0F 05 00 04 01 
    //30 8E 1F 11 1E 00 00 C8 42 04 0B 47 
  }



