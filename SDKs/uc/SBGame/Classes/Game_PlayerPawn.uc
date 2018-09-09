//==============================================================================
//  Game_PlayerPawn
//==============================================================================

class Game_PlayerPawn extends Game_PersistentPawn
    native
    dependsOn(Class,SBDBSync,Game_PlayerStats,Game_PlayerController,Player,Game_Desktop,Help_Article,Game_PlayerCombatStats,StringReferences,EventNotification,Actor,Base_GameClient,Game_Chat,Game_CharacterStats,MapNote,Game_RadialMenuOptions,Pawn,Game_PlayerInput,Game_Character,Game_PlayerTeams,Game_PlayerGuilds,Game_PlayerFriends,Game_QuestLog,Game_Controller,Game_PlayerConversation,Game_GameInfo)
    Config(User)
  ;

  const PVP_SETTINGS_UPDATE_TIME =  1.0f;
  const LEVEL_AREA_UPDATE_TIME = 		1.00f;
  var const class<Game_QuestLog> QuestLogClass;
  var export editinline Game_QuestLog questLog;
  var DB_Guild mGuild;
  var DB_Team mTeam;
  var Vector mNetVelocity;
  var Vector mNetLocation;
  var byte mNetPhysics;
  var private transient float mLastUpdateTime;
  var private transient byte mCurrentFrameID;
  var private transient Vector mPrevLocation;
  var private transient Rotator mPrevRotation;
  var private transient Vector mPrevVelocity;
  var private transient byte mPrevPhysics;
  var byte mMoveFrameID;
  var private transient byte mLastMoveFrameID;
  var private transient float mWorkSpeed;
  var private transient float mMovementTime;
  var private transient float mCurrentMoveTimer;
  var private transient bool mReached;
  var private transient bool mMayJump;
  var private float mUpdateInterval;
  var LevelAreaVolume mCurrentLevelArea;
  var LevelAreaVolume mCurrentShard;
  var private float mLastLevelAreaUpdate;
  var private int mCurrentShardID;
  var private int mCurrentMapSectionID;
  var private array<MapNote> mMapNotes;
  var private ZoneInfo mPreviousZone;
  var private ZoneInfo mCurrentMusicZone;
  var PvPSettings mPvPSettings;
  var float mPvPTimer;
  var EventNotification PetRelevancyLost;
  var EventNotification PetRelevancyFound;
  var bool LostPet;
  var private transient int mUser;


  protected native function sv2cl_FreeToPlayLevelCapped_CallStub();


  event sv2cl_FreeToPlayLevelCapped() {
    local export editinline Help_Article Article;
    Article = Help_Article(Class'SBDBSync'.GetResourceObject(156527));          //0000 : 0F 00 C0 76 7F 0F 2E 78 26 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 1D 6F 63 02 00 16 
    Game_PlayerStats(CharacterStats).mFreeToPlayLimitReached = True;            //001F : 14 19 2E 10 A3 5F 01 01 08 43 34 0F 06 00 04 2D 01 38 77 7F 0F 27 
    Game_Desktop(Game_PlayerController(Controller).Player.GUIDesktop).UpdateStdWindow(1,0,None,"");//0035 : 19 2E 60 CE 5A 01 19 19 2E 90 18 5B 01 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0B 00 00 1B 02 0C 00 00 26 25 2A 1F 00 16 
    Game_Desktop(Game_PlayerController(Controller).Player.GUIDesktop).ShowMessageBox(Article.Title.Text,Article.Body.Text);//0065 : 19 2E 60 CE 5A 01 19 19 2E 90 18 5B 01 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 2C 00 00 1B 53 0F 00 00 36 58 C6 6B 0F 19 00 C0 76 7F 0F 05 00 0C 01 B0 77 7F 0F 36 58 C6 6B 0F 19 00 C0 76 7F 0F 05 00 0C 01 28 78 7F 0F 16 
    //0F 00 C0 76 7F 0F 2E 78 26 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 1D 6F 63 02 00 16 14 
    //19 2E 10 A3 5F 01 01 08 43 34 0F 06 00 04 2D 01 38 77 7F 0F 27 19 2E 60 CE 5A 01 19 19 2E 90 18 
    //5B 01 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0B 00 00 1B 02 0C 00 00 26 
    //25 2A 1F 00 16 19 2E 60 CE 5A 01 19 19 2E 90 18 5B 01 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 
    //00 04 01 90 C0 79 0F 2C 00 00 1B 53 0F 00 00 36 58 C6 6B 0F 19 00 C0 76 7F 0F 05 00 0C 01 B0 77 
    //7F 0F 36 58 C6 6B 0F 19 00 C0 76 7F 0F 05 00 0C 01 28 78 7F 0F 16 04 0B 47 
  }


  protected native function sv2cl_FreeToPlayPortalForbidden_CallStub();


  event sv2cl_FreeToPlayPortalForbidden() {
    local export editinline Help_Article Article;
    Article = Help_Article(Class'SBDBSync'.GetResourceObject(156527));          //0000 : 0F 00 08 E6 7E 0F 2E 78 26 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 1D 6F 63 02 00 16 
    Game_Desktop(Game_PlayerController(Controller).Player.GUIDesktop).ShowMessageBox(Article.Title.Text,Article.Body.Text);//001F : 19 2E 60 CE 5A 01 19 19 2E 90 18 5B 01 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 2C 00 00 1B 53 0F 00 00 36 58 C6 6B 0F 19 00 08 E6 7E 0F 05 00 0C 01 B0 77 7F 0F 36 58 C6 6B 0F 19 00 08 E6 7E 0F 05 00 0C 01 28 78 7F 0F 16 
    //0F 00 08 E6 7E 0F 2E 78 26 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 1D 6F 63 02 00 16 19 
    //2E 60 CE 5A 01 19 19 2E 90 18 5B 01 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 
    //0F 2C 00 00 1B 53 0F 00 00 36 58 C6 6B 0F 19 00 08 E6 7E 0F 05 00 0C 01 B0 77 7F 0F 36 58 C6 6B 
    //0F 19 00 08 E6 7E 0F 05 00 0C 01 28 78 7F 0F 16 04 0B 47 
  }


  final native function bool sv_IsFreeToPlayCapped();


  final native function bool sv_IsPayingPlayer();


  exec function ShakeCombat() {
    Game_PlayerCombatStats(CombatStats).cl2sv_ShakeCombat_CallStub();           //0000 : 19 2E B0 8D 5F 01 01 30 41 18 11 06 00 00 1B 6E 0F 00 00 16 
    //19 2E B0 8D 5F 01 01 30 41 18 11 06 00 00 1B 6E 0F 00 00 16 04 0B 47 
  }


  exec function SetMovementUpdateFrequency(int aFrequency) {
    if (aFrequency > 0 && aFrequency <= 16) {                                   //0000 : 07 2D 00 82 97 00 D8 EA 7E 0F 25 16 18 0A 00 98 00 D8 EA 7E 0F 2C 10 16 16 
      mUpdateInterval = 1.00000000 / aFrequency;                                //0019 : 0F 01 50 EB 7E 0F AC 1E 00 00 80 3F 39 3F 00 D8 EA 7E 0F 16 
    }
    //07 2D 00 82 97 00 D8 EA 7E 0F 25 16 18 0A 00 98 00 D8 EA 7E 0F 2C 10 16 16 0F 01 50 EB 7E 0F AC 
    //1E 00 00 80 3F 39 3F 00 D8 EA 7E 0F 16 04 0B 47 
  }


  function cl_SetPet(Game_PetPawn aPET) {
    Super.cl_SetPet(aPET);                                                      //0000 : 1C 10 4E 32 0F 00 78 EC 7E 0F 16 
    if (aPET == None) {                                                         //000B : 07 63 00 72 00 78 EC 7E 0F 2A 16 
      Game_Desktop(Game_PlayerController(Controller).Player.GUIDesktop).ShowStdWindow(77,2);//0016 : 19 2E 60 CE 5A 01 19 19 2E 90 18 5B 01 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0A 00 04 1B DF 0B 00 00 2C 4D 2C 02 16 
      cl_AddScrollingCombatMessage(Class'StringReferences'.default.Pet_Lost.Text,17);//0045 : 1B 03 0C 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 D8 00 1C 11 24 11 16 
    } else {                                                                    //0060 : 06 B6 00 
      if (!LostPet) {                                                           //0063 : 07 9F 00 81 2D 01 18 EE 7E 0F 16 
        Game_Desktop(Game_PlayerController(Controller).Player.GUIDesktop).ShowStdWindow(77,1);//006E : 19 2E 60 CE 5A 01 19 19 2E 90 18 5B 01 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 09 00 04 1B DF 0B 00 00 2C 4D 26 16 
      } else {                                                                  //009C : 06 B6 00 
        LostPet = False;                                                        //009F : 14 2D 01 18 EE 7E 0F 28 
        PetRelevancyFound.Trigger();                                            //00A7 : 19 01 90 EE 7E 0F 06 00 00 1C 00 96 84 0F 16 
      }
    }
    //1C 10 4E 32 0F 00 78 EC 7E 0F 16 07 63 00 72 00 78 EC 7E 0F 2A 16 19 2E 60 CE 5A 01 19 19 2E 90 
    //18 5B 01 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0A 00 04 1B DF 0B 00 00 
    //2C 4D 2C 02 16 1B 03 0C 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 D8 00 1C 11 24 11 16 
    //06 B6 00 07 9F 00 81 2D 01 18 EE 7E 0F 16 19 2E 60 CE 5A 01 19 19 2E 90 18 5B 01 01 00 6E 6C 0F 
    //05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 09 00 04 1B DF 0B 00 00 2C 4D 26 16 06 B6 00 14 
    //2D 01 18 EE 7E 0F 28 19 01 90 EE 7E 0F 06 00 00 1C 00 96 84 0F 16 04 0B 47 
  }


  protected native function sv2cl_ClientSideTrigger_CallStub();


  protected event sv2cl_ClientSideTrigger(string EventTrigger,Game_Pawn aInstigator) {
    TriggerEvent(name(EventTrigger),self,aInstigator);                          //0000 : 1C F8 B1 34 0F 39 5A 00 68 F0 7E 0F 17 00 28 F1 7E 0F 16 
    //1C F8 B1 34 0F 39 5A 00 68 F0 7E 0F 17 00 28 F1 7E 0F 16 04 0B 47 
  }


  function sv_ClientSideTrigger(string EventTrigger,Game_Pawn aInstigator) {
    sv2cl_ClientSideTrigger_CallStub(EventTrigger,aInstigator);                 //0000 : 1B B5 0D 00 00 00 50 F2 7E 0F 00 10 F3 7E 0F 16 
    //1B B5 0D 00 00 00 50 F2 7E 0F 00 10 F3 7E 0F 16 04 0B 47 
  }


  protected native function sv2rel_SendMessage_CallStub();


  event sv2rel_SendMessage(string aSender,string aMessage,int aChannel) {
    Game_PlayerController(Base_GameClient(Class'Actor'.static.GetGameEngine()).GPlayerController).Chat.cl_OnMessage(aSender,aMessage,aChannel);//0000 : 19 19 2E 90 18 5B 01 19 2E 58 2D 24 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 05 00 04 01 B8 1A 6C 0F 05 00 04 01 E8 A0 1B 11 15 00 00 1B FA 0C 00 00 00 E8 F4 7E 0F 00 60 F5 7E 0F 00 D8 F5 7E 0F 16 
    //19 19 2E 90 18 5B 01 19 2E 58 2D 24 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 05 00 04 01 
    //B8 1A 6C 0F 05 00 04 01 E8 A0 1B 11 15 00 00 1B FA 0C 00 00 00 E8 F4 7E 0F 00 60 F5 7E 0F 00 D8 
    //F5 7E 0F 16 04 0B 47 
  }


  protected native function cl2sv_UpdateLevelUpAttributes_CallStub();


  event cl2sv_UpdateLevelUpAttributes(int aBody,int aMind,int aFocus) {
    if (aBody + aMind + aFocus <= Game_PlayerStats(CharacterStats).mAvailableAttributePoints) {//0000 : 07 4E 00 98 92 92 00 B0 F7 7E 0F 00 28 F8 7E 0F 16 00 A0 F8 7E 0F 16 39 3A 19 2E 10 A3 5F 01 01 08 43 34 0F 05 00 01 01 18 F9 7E 0F 16 
      CharacterStats.SetAttributes(aBody,aMind,aFocus);                         //002D : 19 01 08 43 34 0F 15 00 00 1B 31 0E 00 00 00 B0 F7 7E 0F 00 28 F8 7E 0F 00 A0 F8 7E 0F 16 
      goto jl004E;                                                              //004B : 06 4E 00 
    }
    //07 4E 00 98 92 92 00 B0 F7 7E 0F 00 28 F8 7E 0F 16 00 A0 F8 7E 0F 16 39 3A 19 2E 10 A3 5F 01 01 
    //08 43 34 0F 05 00 01 01 18 F9 7E 0F 16 19 01 08 43 34 0F 15 00 00 1B 31 0E 00 00 00 B0 F7 7E 0F 
    //00 28 F8 7E 0F 00 A0 F8 7E 0F 16 06 4E 00 04 0B 47 
  }


  native function UpdateTouching();


  protected native function sv2cl_SetPvPTimer_CallStub();


  event sv2cl_SetPvPTimer(int aTimer) {
    mPvPTimer = aTimer;                                                         //0000 : 0F 01 48 FC 7E 0F 39 3F 00 D0 FB 7E 0F 
    if (aTimer <= 0) {                                                          //000D : 07 41 00 98 00 D0 FB 7E 0F 25 16 
      SendDesktopMessage("",Class'StringReferences'.default.PvP_Enabled.Text,Class'Game_Desktop'.7);//0018 : 1B 12 06 00 00 1F 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 08 FE 1B 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 
    } else {                                                                    //003E : 06 85 00 
      SendDesktopMessage("",Class'StringReferences'.default.Enabling_PvP_in_.Text
        @ string(aTimer)
        @ Class'StringReferences'.default._Seconds.Text,Class'Game_Desktop'.7);//0041 : 1B 12 06 00 00 1F 00 A8 A8 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 80 FE 1B 11 39 53 00 D0 FB 7E 0F 16 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F8 FE 1B 11 16 12 20 60 CE 5A 01 02 00 04 2C 07 16 
    }
    //0F 01 48 FC 7E 0F 39 3F 00 D0 FB 7E 0F 07 41 00 98 00 D0 FB 7E 0F 25 16 1B 12 06 00 00 1F 00 36 
    //58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 08 FE 1B 11 12 20 60 CE 5A 01 02 00 04 2C 07 16 06 85 
    //00 1B 12 06 00 00 1F 00 A8 A8 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 80 FE 1B 11 39 53 00 
    //D0 FB 7E 0F 16 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F8 FE 1B 11 16 12 20 60 CE 5A 01 02 
    //00 04 2C 07 16 04 0B 47 
  }


  native function ResetPvPTimer();


  native function UpdateAreaAudio(float aDeltaTime);


  function DB_Guild GetGuild() {
    return mGuild;                                                              //0000 : 04 01 60 00 7F 0F 
    //04 01 60 00 7F 0F 04 0B 47 
  }


  function MapNote GetMapNote(int Id) {
    if (Id < mMapNotes.Length) {                                                //0000 : 07 1C 00 96 00 18 02 7F 0F 37 01 90 02 7F 0F 16 
      return mMapNotes[Id];                                                     //0010 : 04 10 00 18 02 7F 0F 01 90 02 7F 0F 
    }
    return None;                                                                //001C : 04 2A 
    //07 1C 00 96 00 18 02 7F 0F 37 01 90 02 7F 0F 16 04 10 00 18 02 7F 0F 01 90 02 7F 0F 04 2A 04 0B 
    //47 
  }


  function RemoveMapNote(int Id) {
    if (Id < mMapNotes.Length) {                                                //0000 : 07 1C 00 96 00 30 04 7F 0F 37 01 90 02 7F 0F 16 
      mMapNotes.Remove(Id,1);                                                   //0010 : 41 01 90 02 7F 0F 00 30 04 7F 0F 26 
    }
    //07 1C 00 96 00 30 04 7F 0F 37 01 90 02 7F 0F 16 41 01 90 02 7F 0F 00 30 04 7F 0F 26 04 0B 47 
  }


  function UpdateMapNoteLocation(int Id,float X,float Y) {
    if (Id < mMapNotes.Length) {                                                //0000 : 07 44 00 96 00 B0 05 7F 0F 37 01 90 02 7F 0F 16 
      mMapNotes[Id].X = X;                                                      //0010 : 0F 19 10 00 B0 05 7F 0F 01 90 02 7F 0F 05 00 04 01 28 06 7F 0F 00 A0 06 7F 0F 
      mMapNotes[Id].Y = Y;                                                      //002A : 0F 19 10 00 B0 05 7F 0F 01 90 02 7F 0F 05 00 04 01 18 07 7F 0F 00 90 07 7F 0F 
    }
    //07 44 00 96 00 B0 05 7F 0F 37 01 90 02 7F 0F 16 0F 19 10 00 B0 05 7F 0F 01 90 02 7F 0F 05 00 04 
    //01 28 06 7F 0F 00 A0 06 7F 0F 0F 19 10 00 B0 05 7F 0F 01 90 02 7F 0F 05 00 04 01 18 07 7F 0F 00 
    //90 07 7F 0F 04 0B 47 
  }


  function AddMapNote(string aTitle,string aLevel,string anInformation,string aTarget,float X,float Y,int Id) {
    local MapNote aNote;
    if (Id < 0) {                                                               //0000 : 07 CA 00 96 00 F8 0A 7F 0F 25 16 
      aNote = new Class'MapNote';                                               //000B : 0F 00 70 0B 7F 0F 11 0B 0B 0B 20 38 F7 5C 01 
      aNote.Title.Text = aTitle;                                                //001A : 0F 36 58 C6 6B 0F 19 00 70 0B 7F 0F 05 00 0C 01 E8 0B 7F 0F 00 B8 08 7F 0F 
      aNote.Level.Text = aLevel;                                                //0033 : 0F 36 58 C6 6B 0F 19 00 70 0B 7F 0F 05 00 0C 01 60 0C 7F 0F 00 D8 0C 7F 0F 
      aNote.Information.Text = anInformation;                                   //004C : 0F 36 58 C6 6B 0F 19 00 70 0B 7F 0F 05 00 0C 01 50 0D 7F 0F 00 C8 0D 7F 0F 
      aNote.X = X;                                                              //0065 : 0F 19 00 70 0B 7F 0F 05 00 04 01 28 06 7F 0F 00 40 0E 7F 0F 
      aNote.Y = Y;                                                              //0079 : 0F 19 00 70 0B 7F 0F 05 00 04 01 18 07 7F 0F 00 B8 0E 7F 0F 
      aNote.Id = mMapNotes.Length;                                              //008D : 0F 19 00 70 0B 7F 0F 05 00 04 01 30 0F 7F 0F 37 01 90 02 7F 0F 
      mMapNotes.Length = mMapNotes.Length + 1;                                  //00A2 : 0F 37 01 90 02 7F 0F 92 37 01 90 02 7F 0F 26 16 
      mMapNotes[mMapNotes.Length - 1] = aNote;                                  //00B2 : 0F 10 93 37 01 90 02 7F 0F 26 16 01 90 02 7F 0F 00 70 0B 7F 0F 
    } else {                                                                    //00C7 : 06 27 01 
      mMapNotes[Id].Title.Text = aTitle;                                        //00CA : 0F 36 58 C6 6B 0F 19 10 00 F8 0A 7F 0F 01 90 02 7F 0F 05 00 0C 01 E8 0B 7F 0F 00 B8 08 7F 0F 
      mMapNotes[Id].Level.Text = aLevel;                                        //00E9 : 0F 36 58 C6 6B 0F 19 10 00 F8 0A 7F 0F 01 90 02 7F 0F 05 00 0C 01 60 0C 7F 0F 00 D8 0C 7F 0F 
      mMapNotes[Id].Information.Text = anInformation;                           //0108 : 0F 36 58 C6 6B 0F 19 10 00 F8 0A 7F 0F 01 90 02 7F 0F 05 00 0C 01 50 0D 7F 0F 00 C8 0D 7F 0F 
    }
    //07 CA 00 96 00 F8 0A 7F 0F 25 16 0F 00 70 0B 7F 0F 11 0B 0B 0B 20 38 F7 5C 01 0F 36 58 C6 6B 0F 
    //19 00 70 0B 7F 0F 05 00 0C 01 E8 0B 7F 0F 00 B8 08 7F 0F 0F 36 58 C6 6B 0F 19 00 70 0B 7F 0F 05 
    //00 0C 01 60 0C 7F 0F 00 D8 0C 7F 0F 0F 36 58 C6 6B 0F 19 00 70 0B 7F 0F 05 00 0C 01 50 0D 7F 0F 
    //00 C8 0D 7F 0F 0F 19 00 70 0B 7F 0F 05 00 04 01 28 06 7F 0F 00 40 0E 7F 0F 0F 19 00 70 0B 7F 0F 
    //05 00 04 01 18 07 7F 0F 00 B8 0E 7F 0F 0F 19 00 70 0B 7F 0F 05 00 04 01 30 0F 7F 0F 37 01 90 02 
    //7F 0F 0F 37 01 90 02 7F 0F 92 37 01 90 02 7F 0F 26 16 0F 10 93 37 01 90 02 7F 0F 26 16 01 90 02 
    //7F 0F 00 70 0B 7F 0F 06 27 01 0F 36 58 C6 6B 0F 19 10 00 F8 0A 7F 0F 01 90 02 7F 0F 05 00 0C 01 
    //E8 0B 7F 0F 00 B8 08 7F 0F 0F 36 58 C6 6B 0F 19 10 00 F8 0A 7F 0F 01 90 02 7F 0F 05 00 0C 01 60 
    //0C 7F 0F 00 D8 0C 7F 0F 0F 36 58 C6 6B 0F 19 10 00 F8 0A 7F 0F 01 90 02 7F 0F 05 00 0C 01 50 0D 
    //7F 0F 00 C8 0D 7F 0F 04 0B 47 
  }


  final native function UpdateLevelInfo();


  function RadialMenuSelect(Pawn aPlayerPawn,byte aMainOption,byte aSubOption) {
    local Game_PlayerController PlayerController;
    local Game_PlayerPawn targetPawn;
    Super.RadialMenuSelect(aPlayerPawn,aMainOption,aSubOption);                 //0000 : 1C E0 ED 18 11 00 B0 11 7F 0F 00 28 12 7F 0F 00 A0 12 7F 0F 16 
    if (aMainOption == Class'Game_RadialMenuOptions'.0) {                       //0015 : 07 90 01 9A 39 3A 00 28 12 7F 0F 39 3A 12 20 B0 D7 60 01 02 00 01 24 00 16 
      PlayerController = Game_PlayerController(aPlayerPawn.Controller);         //002E : 0F 00 18 13 7F 0F 2E 90 18 5B 01 19 00 B0 11 7F 0F 05 00 04 01 00 6E 6C 0F 
      targetPawn = Game_PlayerPawn(PlayerController.Input.cl_GetTargetPawn());  //0047 : 0F 00 90 13 7F 0F 2E F0 47 5B 01 19 19 00 18 13 7F 0F 05 00 04 01 B0 14 37 0F 06 00 04 1B 39 05 00 00 16 
      switch (aSubOption) {                                                     //006A : 05 01 00 A0 12 7F 0F 
        case Class'Game_RadialMenuOptions'.19 :                                 //0071 : 0A CD 00 12 20 B0 D7 60 01 02 00 01 24 13 
          PlayerController.Chat.EnterChatMessage("/w");                         //007F : 19 19 00 18 13 7F 0F 05 00 04 01 E8 A0 1B 11 0A 00 00 1B 95 0D 00 00 1F 2F 77 00 16 
          PlayerController.Chat.EnterChatMessage(targetPawn.Character.cl_GetBaseName());//009B : 19 19 00 18 13 7F 0F 05 00 04 01 E8 A0 1B 11 1E 00 00 1B 95 0D 00 00 19 19 00 90 13 7F 0F 05 00 04 01 68 2E 34 0F 06 00 00 1B 33 05 00 00 16 16 
          return;                                                               //00CB : 04 0B 
        case Class'Game_RadialMenuOptions'.12 :                                 //00CD : 0A 0D 01 12 20 B0 D7 60 01 02 00 01 24 0C 
          PlayerController.GroupingTeams.TeamInvite(targetPawn.Character.cl_GetBaseName());//00DB : 19 19 00 18 13 7F 0F 05 00 04 01 48 C2 18 11 1E 00 00 1B 91 0E 00 00 19 19 00 90 13 7F 0F 05 00 04 01 68 2E 34 0F 06 00 00 1B 33 05 00 00 16 16 
          return;                                                               //010B : 04 0B 
        case Class'Game_RadialMenuOptions'.14 :                                 //010D : 0A 4D 01 12 20 B0 D7 60 01 02 00 01 24 0E 
          PlayerController.GroupingGuilds.GuildInvite(targetPawn.Character.cl_GetBaseName());//011B : 19 19 00 18 13 7F 0F 05 00 04 01 C8 A2 1B 11 1E 00 00 1B 14 0F 00 00 19 19 00 90 13 7F 0F 05 00 04 01 68 2E 34 0F 06 00 00 1B 33 05 00 00 16 16 
          return;                                                               //014B : 04 0B 
        case Class'Game_RadialMenuOptions'.13 :                                 //014D : 0A 8D 01 12 20 B0 D7 60 01 02 00 01 24 0D 
          PlayerController.GroupingFriends.AddFriendMember(targetPawn.Character.cl_GetBaseName());//015B : 19 19 00 18 13 7F 0F 05 00 04 01 50 A2 1B 11 1E 00 00 1B 7F 0F 00 00 19 19 00 90 13 7F 0F 05 00 04 01 68 2E 34 0F 06 00 00 1B 33 05 00 00 16 16 
          return;                                                               //018B : 04 0B 
        default:                                                                //018D : 0A FF FF 
      }
    }
    //1C E0 ED 18 11 00 B0 11 7F 0F 00 28 12 7F 0F 00 A0 12 7F 0F 16 07 90 01 9A 39 3A 00 28 12 7F 0F 
    //39 3A 12 20 B0 D7 60 01 02 00 01 24 00 16 0F 00 18 13 7F 0F 2E 90 18 5B 01 19 00 B0 11 7F 0F 05 
    //00 04 01 00 6E 6C 0F 0F 00 90 13 7F 0F 2E F0 47 5B 01 19 19 00 18 13 7F 0F 05 00 04 01 B0 14 37 
    //0F 06 00 04 1B 39 05 00 00 16 05 01 00 A0 12 7F 0F 0A CD 00 12 20 B0 D7 60 01 02 00 01 24 13 19 
    //19 00 18 13 7F 0F 05 00 04 01 E8 A0 1B 11 0A 00 00 1B 95 0D 00 00 1F 2F 77 00 16 19 19 00 18 13 
    //7F 0F 05 00 04 01 E8 A0 1B 11 1E 00 00 1B 95 0D 00 00 19 19 00 90 13 7F 0F 05 00 04 01 68 2E 34 
    //0F 06 00 00 1B 33 05 00 00 16 16 04 0B 0A 0D 01 12 20 B0 D7 60 01 02 00 01 24 0C 19 19 00 18 13 
    //7F 0F 05 00 04 01 48 C2 18 11 1E 00 00 1B 91 0E 00 00 19 19 00 90 13 7F 0F 05 00 04 01 68 2E 34 
    //0F 06 00 00 1B 33 05 00 00 16 16 04 0B 0A 4D 01 12 20 B0 D7 60 01 02 00 01 24 0E 19 19 00 18 13 
    //7F 0F 05 00 04 01 C8 A2 1B 11 1E 00 00 1B 14 0F 00 00 19 19 00 90 13 7F 0F 05 00 04 01 68 2E 34 
    //0F 06 00 00 1B 33 05 00 00 16 16 04 0B 0A 8D 01 12 20 B0 D7 60 01 02 00 01 24 0D 19 19 00 18 13 
    //7F 0F 05 00 04 01 50 A2 1B 11 1E 00 00 1B 7F 0F 00 00 19 19 00 90 13 7F 0F 05 00 04 01 68 2E 34 
    //0F 06 00 00 1B 33 05 00 00 16 16 04 0B 0A FF FF 04 0B 47 
  }


  function Material RadialMenuImage(Pawn aPlayerPawn,byte aMainOption,byte aSubOption) {
    return None;                                                                //0000 : 04 2A 
    //04 2A 04 0B 47 
  }


  event RadialMenuCollect(Pawn aPlayerPawn,byte mainOption,out array<byte> subOptions) {
    local Game_PlayerController PlayerController;
    Super.RadialMenuCollect(aPlayerPawn,mainOption,subOptions);                 //0000 : 1C 18 16 37 0F 00 78 17 7F 0F 00 90 19 7F 0F 00 08 1A 7F 0F 16 
    if (mainOption == Class'Game_RadialMenuOptions'.0) {                        //0015 : 07 0B 01 9A 39 3A 00 90 19 7F 0F 39 3A 12 20 B0 D7 60 01 02 00 01 24 00 16 
      subOptions[subOptions.Length] = Class'Game_RadialMenuOptions'.7;          //002E : 0F 10 37 00 08 1A 7F 0F 00 08 1A 7F 0F 12 20 B0 D7 60 01 02 00 01 24 07 
      subOptions[subOptions.Length] = Class'Game_RadialMenuOptions'.19;         //0046 : 0F 10 37 00 08 1A 7F 0F 00 08 1A 7F 0F 12 20 B0 D7 60 01 02 00 01 24 13 
      PlayerController = Game_PlayerController(aPlayerPawn.Controller);         //005E : 0F 00 80 1A 7F 0F 2E 90 18 5B 01 19 00 78 17 7F 0F 05 00 04 01 00 6E 6C 0F 
      if (PlayerController != None) {                                           //0077 : 07 0B 01 77 00 80 1A 7F 0F 2A 16 
        if (PlayerController.GroupingTeams.IsTeamLeader()
          && !PlayerController.GroupingTeams.InTeamWith(self)) {//0082 : 07 D5 00 82 19 19 00 80 1A 7F 0F 05 00 04 01 48 C2 18 11 06 00 04 1B DF 0D 00 00 16 18 1C 00 81 19 19 00 80 1A 7F 0F 05 00 04 01 48 C2 18 11 07 00 04 1B 00 0E 00 00 17 16 16 16 
          subOptions[subOptions.Length] = Class'Game_RadialMenuOptions'.12;     //00BD : 0F 10 37 00 08 1A 7F 0F 00 08 1A 7F 0F 12 20 B0 D7 60 01 02 00 01 24 0C 
        }
        if (!PlayerController.GroupingFriends.IsFriendWith(self)) {             //00D5 : 07 0B 01 81 19 19 00 80 1A 7F 0F 05 00 04 01 50 A2 1B 11 07 00 04 1B 5E 0F 00 00 17 16 16 
          subOptions[subOptions.Length] = Class'Game_RadialMenuOptions'.13;     //00F3 : 0F 10 37 00 08 1A 7F 0F 00 08 1A 7F 0F 12 20 B0 D7 60 01 02 00 01 24 0D 
        }
      }
    }
    //1C 18 16 37 0F 00 78 17 7F 0F 00 90 19 7F 0F 00 08 1A 7F 0F 16 07 0B 01 9A 39 3A 00 90 19 7F 0F 
    //39 3A 12 20 B0 D7 60 01 02 00 01 24 00 16 0F 10 37 00 08 1A 7F 0F 00 08 1A 7F 0F 12 20 B0 D7 60 
    //01 02 00 01 24 07 0F 10 37 00 08 1A 7F 0F 00 08 1A 7F 0F 12 20 B0 D7 60 01 02 00 01 24 13 0F 00 
    //80 1A 7F 0F 2E 90 18 5B 01 19 00 78 17 7F 0F 05 00 04 01 00 6E 6C 0F 07 0B 01 77 00 80 1A 7F 0F 
    //2A 16 07 D5 00 82 19 19 00 80 1A 7F 0F 05 00 04 01 48 C2 18 11 06 00 04 1B DF 0D 00 00 16 18 1C 
    //00 81 19 19 00 80 1A 7F 0F 05 00 04 01 48 C2 18 11 07 00 04 1B 00 0E 00 00 17 16 16 16 0F 10 37 
    //00 08 1A 7F 0F 00 08 1A 7F 0F 12 20 B0 D7 60 01 02 00 01 24 0C 07 0B 01 81 19 19 00 80 1A 7F 0F 
    //05 00 04 01 50 A2 1B 11 07 00 04 1B 5E 0F 00 00 17 16 16 0F 10 37 00 08 1A 7F 0F 00 08 1A 7F 0F 
    //12 20 B0 D7 60 01 02 00 01 24 0D 04 0B 47 
  }


  event string cl_GetSecondaryDisplayName() {
    local string guildName;
    if (Character != None) {                                                    //0000 : 07 3D 00 77 01 68 2E 34 0F 2A 16 
      guildName = Character.GetGuildName();                                     //000B : 0F 00 98 1C 7F 0F 19 01 68 2E 34 0F 06 00 00 1B 60 0D 00 00 16 
      if (Len(guildName) > 0) {                                                 //0020 : 07 3D 00 97 7D 00 98 1C 7F 0F 16 25 16 
        return "<" $ guildName $ ">";                                           //002D : 04 70 70 1F 3C 00 00 98 1C 7F 0F 16 1F 3E 00 16 
      }
    }
    return "";                                                                  //003D : 04 1F 00 
    //07 3D 00 77 01 68 2E 34 0F 2A 16 0F 00 98 1C 7F 0F 19 01 68 2E 34 0F 06 00 00 1B 60 0D 00 00 16 
    //07 3D 00 97 7D 00 98 1C 7F 0F 16 25 16 04 70 70 1F 3C 00 00 98 1C 7F 0F 16 1F 3E 00 16 04 1F 00 
    //04 0B 47 
  }


  event string cl_GetPrimaryDisplayName() {
    if (Character != None) {                                                    //0000 : 07 28 00 77 01 68 2E 34 0F 2A 16 
      return "-" $ Character.cl_GetFullName()
        $ "-";                    //000B : 04 70 70 1F 2D 00 19 01 68 2E 34 0F 06 00 00 1C 40 22 18 11 16 16 1F 2D 00 16 
    } else {                                                                    //0025 : 06 2B 00 
      return "";                                                                //0028 : 04 1F 00 
    }
    //07 28 00 77 01 68 2E 34 0F 2A 16 04 70 70 1F 2D 00 19 01 68 2E 34 0F 06 00 00 1C 40 22 18 11 16 
    //16 1F 2D 00 16 06 2B 00 04 1F 00 04 0B 47 
  }


  protected native function sv2cl_SitDown_CallStub();


  event sv2cl_SitDown(bool aOnChairFlag) {
    if (aOnChairFlag) {                                                         //0000 : 07 14 00 2D 00 98 1F 7F 0F 
      mNetPhysics = 20;                                                         //0009 : 0F 01 28 56 1B 11 24 14 
    } else {                                                                    //0011 : 06 1C 00 
      mNetPhysics = 19;                                                         //0014 : 0F 01 28 56 1B 11 24 13 
    }
    //07 14 00 2D 00 98 1F 7F 0F 0F 01 28 56 1B 11 24 14 06 1C 00 0F 01 28 56 1B 11 24 13 04 0B 47 
  }


  event bool SitDown(optional bool aOnChairFlag) {
    if (Super.SitDown(aOnChairFlag)) {                                          //0000 : 07 1D 00 1C F0 45 84 0F 2D 00 18 21 7F 0F 16 
      sv2cl_SitDown_CallStub(aOnChairFlag);                                     //000F : 1B BB 0D 00 00 2D 00 18 21 7F 0F 16 
      return True;                                                              //001B : 04 27 
    }
    return False;                                                               //001D : 04 28 
    //07 1D 00 1C F0 45 84 0F 2D 00 18 21 7F 0F 16 1B BB 0D 00 00 2D 00 18 21 7F 0F 16 04 27 04 28 04 
    //0B 47 
  }


  protected native function sv2cl_ForceMovement_CallStub();


  private final native event sv2cl_ForceMovement(Vector aLocation,Vector aVelocity,byte aPhysics);


  protected native function cl2sv_UpdateMovement_CallStub();


  private final native event cl2sv_UpdateMovement(Vector aLocation,Vector aVelocity,byte aFrameID);


  protected native function cl2sv_UpdateMovementWithPhysics_CallStub();


  private final native event cl2sv_UpdateMovementWithPhysics(Vector aLocation,Vector aVelocity,byte aPhysics,byte aFrameID);


  protected native function cl2sv_UpdateRotation_CallStub();


  private final native event cl2sv_UpdateRotation(int aYaw);


  private final native function cl_UpdateToServer();


  event cl_OnShutdown() {
    if (questLog != None) {                                                     //0000 : 07 1A 00 77 01 F0 2F 7F 0F 2A 16 
      questLog.cl_OnShutdown();                                                 //000B : 19 01 F0 2F 7F 0F 06 00 00 1B 66 07 00 00 16 
    }
    Super.cl_OnShutdown();                                                      //001A : 1C D8 DD 7E 0F 16 
    //07 1A 00 77 01 F0 2F 7F 0F 2A 16 19 01 F0 2F 7F 0F 06 00 00 1B 66 07 00 00 16 1C D8 DD 7E 0F 16 
    //04 0B 47 
  }


  event cl_OnUpdate() {
    if (mNetPhysics != Physics) {                                               //0000 : 07 73 00 9B 39 3A 01 28 56 1B 11 39 3A 01 C0 93 6C 0F 16 
      if (!IsLocalPlayer()) {                                                   //0013 : 07 73 00 81 1C 18 1A 76 0F 16 16 
        if (mNetPhysics == 18) {                                                //001E : 07 49 00 9A 39 3A 01 28 56 1B 11 39 3A 24 12 16 
          if (mMayJump) {                                                       //002E : 07 46 00 2D 01 18 31 7F 0F 
            mMayJump = !DoJump();                                               //0037 : 14 2D 01 18 31 7F 0F 81 1B 44 0F 00 00 16 16 
          }
        } else {                                                                //0046 : 06 73 00 
          if (Physics != 18 && Physics != 2) {                                  //0049 : 07 73 00 82 9B 39 3A 01 C0 93 6C 0F 39 3A 24 12 16 18 0E 00 9B 39 3A 01 C0 93 6C 0F 39 3A 24 02 16 16 
            SetPhysics(mNetPhysics);                                            //006B : 6F 82 01 28 56 1B 11 16 
          }
        }
      }
    }
    Super.cl_OnUpdate();                                                        //0073 : 1C 70 23 19 11 16 
    //07 73 00 9B 39 3A 01 28 56 1B 11 39 3A 01 C0 93 6C 0F 16 07 73 00 81 1C 18 1A 76 0F 16 16 07 49 
    //00 9A 39 3A 01 28 56 1B 11 39 3A 24 12 16 07 46 00 2D 01 18 31 7F 0F 14 2D 01 18 31 7F 0F 81 1B 
    //44 0F 00 00 16 16 06 73 00 07 73 00 82 9B 39 3A 01 C0 93 6C 0F 39 3A 24 12 16 18 0E 00 9B 39 3A 
    //01 C0 93 6C 0F 39 3A 24 02 16 16 6F 82 01 28 56 1B 11 16 1C 70 23 19 11 16 04 0B 47 
  }


  event cl_OnTick(float DeltaTime) {
    if (!IsLocalPlayer()) {                                                     //0000 : 07 19 00 81 1C 18 1A 76 0F 16 16 
      PredictMovement(DeltaTime);                                               //000B : 1B 6E 0E 00 00 00 40 32 7F 0F 16 
    } else {                                                                    //0016 : 06 1F 00 
      cl_UpdateToServer();                                                      //0019 : 1C A8 2C 7F 0F 16 
    }
    Super.cl_OnTick(DeltaTime);                                                 //001F : 1C E8 3A 32 0F 00 40 32 7F 0F 16 
    //07 19 00 81 1C 18 1A 76 0F 16 16 1B 6E 0E 00 00 00 40 32 7F 0F 16 06 1F 00 1C A8 2C 7F 0F 16 1C 
    //E8 3A 32 0F 00 40 32 7F 0F 16 04 0B 47 
  }


  event cl_OnFrame(float aDeltaTime) {
    Super.cl_OnFrame(aDeltaTime);                                               //0000 : 1C 98 21 19 11 00 D0 33 7F 0F 16 
    UpdateLevelInfo();                                                          //000B : 1C 08 08 7F 0F 16 
    if (IsLocalPlayer()) {                                                      //0011 : 07 5F 00 1C 18 1A 76 0F 16 
      UpdateAreaAudio(aDeltaTime);                                              //001A : 1B B9 0D 00 00 00 D0 33 7F 0F 16 
      if (HasPet && Pet == None && !LostPet) {                                  //0025 : 07 5F 00 82 82 2D 01 68 41 34 0F 18 09 00 72 01 D8 3E 34 0F 2A 16 16 18 09 00 81 2D 01 18 EE 7E 0F 16 16 
        LostPet = True;                                                         //0048 : 14 2D 01 18 EE 7E 0F 27 
        PetRelevancyLost.Trigger();                                             //0050 : 19 01 F8 34 7F 0F 06 00 00 1C 00 96 84 0F 16 
      }
    }
    //1C 98 21 19 11 00 D0 33 7F 0F 16 1C 08 08 7F 0F 16 07 5F 00 1C 18 1A 76 0F 16 1B B9 0D 00 00 00 
    //D0 33 7F 0F 16 07 5F 00 82 82 2D 01 68 41 34 0F 18 09 00 72 01 D8 3E 34 0F 2A 16 16 18 09 00 81 
    //2D 01 18 EE 7E 0F 16 16 14 2D 01 18 EE 7E 0F 27 19 01 F8 34 7F 0F 06 00 00 1C 00 96 84 0F 16 04 
    //0B 47 
  }


  private final native function UpdateTouchList();


  event cl_OnBaseline() {
    SetPhysics(mNetPhysics);                                                    //0000 : 6F 82 01 28 56 1B 11 16 
    Velocity = mNetVelocity;                                                    //0008 : 0F 01 A0 95 6C 0F 01 A0 37 7F 0F 
    Super.cl_OnBaseline();                                                      //0013 : 1C 38 3A 19 11 16 
    if (IsLocalPlayer()) {                                                      //0019 : 07 44 00 1C 18 1A 76 0F 16 
      Game_PlayerConversation(Game_Controller(Controller).ConversationControl).cl_RefreshTopics();//0022 : 19 2E 20 80 60 01 19 2E 10 0E 5B 01 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 06 00 00 1C 18 38 7F 0F 16 
    }
    UpdateTouchList();                                                          //0044 : 1C 20 33 7F 0F 16 
    UpdateLevelInfo();                                                          //004A : 1C 08 08 7F 0F 16 
    //6F 82 01 28 56 1B 11 16 0F 01 A0 95 6C 0F 01 A0 37 7F 0F 1C 38 3A 19 11 16 07 44 00 1C 18 1A 76 
    //0F 16 19 2E 20 80 60 01 19 2E 10 0E 5B 01 01 00 6E 6C 0F 05 00 04 01 C8 07 1B 11 06 00 00 1C 18 
    //38 7F 0F 16 1C 20 33 7F 0F 16 1C 08 08 7F 0F 16 04 0B 47 
  }


  event cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C 88 DE 7E 0F 16 
    if (IsLocalPlayer()) {                                                      //0006 : 07 29 00 1C 18 1A 76 0F 16 
      if (questLog != None) {                                                   //000F : 07 29 00 77 01 F0 2F 7F 0F 2A 16 
        questLog.cl_OnInit();                                                   //001A : 19 01 F0 2F 7F 0F 06 00 00 1B 3F 05 00 00 16 
      }
    }
    //1C 88 DE 7E 0F 16 07 29 00 1C 18 1A 76 0F 16 07 29 00 77 01 F0 2F 7F 0F 2A 16 19 01 F0 2F 7F 0F 
    //06 00 00 1B 3F 05 00 00 16 04 0B 47 
  }


  event OnCreateComponents() {
    local Game_GameInfo GameInfo;
    local class<Game_MiniGameProxy> miniGameProxyClass;
    GameInfo = Game_GameInfo(GetGameInfo());                                    //0000 : 0F 00 90 3A 7F 0F 2E 10 F9 5A 01 1C 38 E1 6C 0F 16 
    Super.OnCreateComponents();                                                 //0011 : 1C 08 70 7F 0F 16 
    if (QuestLogClass != None) {                                                //0017 : 07 31 00 77 01 08 3C 7F 0F 2A 16 
      questLog = new (self) QuestLogClass;                                      //0022 : 0F 01 F0 2F 7F 0F 11 17 0B 0B 01 08 3C 7F 0F 
    }
    if (GameInfo != None && GameInfo.HaveMiniGameProxy) {                       //0031 : 07 97 00 82 77 00 90 3A 7F 0F 2A 16 18 10 00 19 00 90 3A 7F 0F 06 00 04 2D 01 88 3C 7F 0F 16 
      miniGameProxyClass = Class<Game_MiniGameProxy>(static.DynamicLoadObject("SBMiniGames.MGame_MiniGameProxy",Class'Class',True));//0050 : 0F 00 00 3D 7F 0F 13 98 62 5F 01 1C 60 E7 69 0F 1F 53 42 4D 69 6E 69 47 61 6D 65 73 2E 4D 47 61 6D 65 5F 4D 69 6E 69 47 61 6D 65 50 72 6F 78 79 00 20 D8 DE 1F 10 27 16 
      MiniGameProxy = new (self) miniGameProxyClass;                            //0088 : 0F 01 30 5D 83 0F 11 17 0B 0B 00 00 3D 7F 0F 
    }
    //0F 00 90 3A 7F 0F 2E 10 F9 5A 01 1C 38 E1 6C 0F 16 1C 08 70 7F 0F 16 07 31 00 77 01 08 3C 7F 0F 
    //2A 16 0F 01 F0 2F 7F 0F 11 17 0B 0B 01 08 3C 7F 0F 07 97 00 82 77 00 90 3A 7F 0F 2A 16 18 10 00 
    //19 00 90 3A 7F 0F 06 00 04 2D 01 88 3C 7F 0F 16 0F 00 00 3D 7F 0F 13 98 62 5F 01 1C 60 E7 69 0F 
    //1F 53 42 4D 69 6E 69 47 61 6D 65 73 2E 4D 47 61 6D 65 5F 4D 69 6E 69 47 61 6D 65 50 72 6F 78 79 
    //00 20 D8 DE 1F 10 27 16 0F 01 30 5D 83 0F 11 17 0B 0B 00 00 3D 7F 0F 04 0B 47 
  }


  event bool ShouldTickPhysics() {
    return IsLocalPlayer() || IsRemotePlayer();                                 //0000 : 04 84 1C 18 1A 76 0F 16 18 07 00 1C C0 18 76 0F 16 16 
    //04 84 1C 18 1A 76 0F 16 18 07 00 1C C0 18 76 0F 16 16 04 0B 47 
  }


  auto state Alive {

      function BeginState() {
        Super.BeginState();                                                     //0000 : 1C 88 53 34 0F 16 
        ResetPvPTimer();                                                        //0006 : 1B B8 0D 00 00 16 
        //1C 88 53 34 0F 16 1B B8 0D 00 00 16 04 0B 47 
      }


    //08 47 

  }



