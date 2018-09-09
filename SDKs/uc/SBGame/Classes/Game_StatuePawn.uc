//==============================================================================
//  Game_StatuePawn
//==============================================================================

class Game_StatuePawn extends Game_Pawn
    native
    dependsOn(SBClock,SBDBAsync,Actor,StatueLocation,Game_StatueAppearance,SBAnimatedPawn)
    Config(User)
  ;

  const POLL_INTERVAL =  3600;
  const POSE_COUNT =  3;
  var private transient int mhastransactionmanager_data;
  var StatueLocation Statue;
  var float LastUpdate;
  var int Revision;
  var int Pose;
  var string StatueTag;
  var string PlayerName;
  var string StatueTitle;
  var string StatueDescription;


  event string cl_GetSecondaryDisplayName() {
    return StatueDescription;                                                   //0000 : 04 01 D8 8F 31 11 
    //04 01 D8 8F 31 11 04 0B 47 
  }


  event string cl_GetPrimaryDisplayName() {
    return PlayerName @ "-" @ StatueTitle;                                      //0000 : 04 A8 A8 01 C0 91 31 11 1F 2D 00 16 01 38 92 31 11 16 
    //04 A8 A8 01 C0 91 31 11 1F 2D 00 16 01 38 92 31 11 16 04 0B 47 
  }


  static function TempShowArray(array<byte> A) {
    local string s;
    local int i;
    s = "[" $ string(A.Length) $ "]:";                                          //0000 : 0F 00 78 94 31 11 70 70 1F 5B 00 39 53 37 00 60 93 31 11 16 1F 5D 3A 00 16 
    i = 0;                                                                      //0019 : 0F 00 F0 94 31 11 25 
    while (i < A.Length) {                                                      //0020 : 07 54 00 96 00 F0 94 31 11 37 00 60 93 31 11 16 
      s = s @ string(A[i]);                                                     //0030 : 0F 00 78 94 31 11 A8 00 78 94 31 11 39 52 10 00 F0 94 31 11 00 60 93 31 11 16 
      ++i;                                                                      //004A : A3 00 F0 94 31 11 16 
    }
    //0F 00 78 94 31 11 70 70 1F 5B 00 39 53 37 00 60 93 31 11 16 1F 5D 3A 00 16 0F 00 F0 94 31 11 25 
    //07 54 00 96 00 F0 94 31 11 37 00 60 93 31 11 16 0F 00 78 94 31 11 A8 00 78 94 31 11 39 52 10 00 
    //F0 94 31 11 00 60 93 31 11 16 A3 00 F0 94 31 11 16 06 20 00 04 0B 47 
  }


  static function bool StaticUpdateStatue(name Tag,Game_Pawn aPlayer,string aStatueTitle,string aStatueDescription,int aPose) {
    local export editinline Game_PlayerAppearance gpa;
    local int CharacterID;
    local string PlayerName;
    local int awardedTimestamp;
    if (aPlayer == None || Len(aStatueTitle) == 0
      || Len(aStatueDescription) == 0
      || aPose < 0
      || aPose >= 3) {//0000 : 07 46 00 84 84 84 84 72 00 78 99 31 11 2A 16 18 0B 00 9A 7D 00 F0 99 31 11 16 25 16 16 18 0B 00 9A 7D 00 68 9A 31 11 16 25 16 16 18 09 00 96 00 E0 9A 31 11 25 16 16 18 0A 00 99 00 E0 9A 31 11 2C 03 16 16 
      return False;                                                             //0044 : 04 28 
    }
    gpa = Game_PlayerAppearance(aPlayer.Appearance.GetBase());                  //0046 : 0F 00 58 9B 31 11 2E B0 BD 5F 01 19 19 00 78 99 31 11 05 00 04 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 
    if (aPlayer.GetCharacterID() == 0 || gpa == None) {                         //0069 : 07 8D 00 84 9A 19 00 78 99 31 11 06 00 04 1C 38 DD 18 11 16 25 16 18 09 00 72 00 58 9B 31 11 2A 16 16 
      return False;                                                             //008B : 04 28 
    }
    CharacterID = aPlayer.GetCharacterID();                                     //008D : 0F 00 D0 9B 31 11 19 00 78 99 31 11 06 00 04 1C 38 DD 18 11 16 
    PlayerName = aPlayer.GetCharacterName();                                    //00A2 : 0F 00 48 9C 31 11 19 00 78 99 31 11 06 00 00 1B 67 05 00 00 16 
    gpa.RepackLodDataAll();                                                     //00B7 : 19 00 58 9B 31 11 06 00 00 1C 20 30 19 11 16 
    TempShowArray(gpa.mLODData0);                                               //00C6 : 1B B1 0C 00 00 19 00 58 9B 31 11 05 00 00 01 B8 63 26 11 16 
    TempShowArray(gpa.mLODData1);                                               //00DA : 1B B1 0C 00 00 19 00 58 9B 31 11 05 00 00 01 30 64 26 11 16 
    TempShowArray(gpa.mLODData2);                                               //00EE : 1B B1 0C 00 00 19 00 58 9B 31 11 05 00 00 01 A8 64 26 11 16 
    TempShowArray(gpa.mLODData3);                                               //0102 : 1B B1 0C 00 00 19 00 58 9B 31 11 05 00 00 01 20 65 26 11 16 
    awardedTimestamp = aPlayer.GetClock().GetCurrentTime();                     //0116 : 0F 00 C0 9C 31 11 19 19 00 78 99 31 11 06 00 04 1B 7F 0D 00 00 16 06 00 04 1B 41 13 00 00 16 
    Class'SBDBAsync'.UpdateStatueNewPlayerByTag(aPlayer,string(Tag),CharacterID,PlayerName,aStatueTitle,aStatueDescription,gpa.mLODData0,gpa.mLODData1,gpa.mLODData2,gpa.mLODData3,awardedTimestamp,aPose);//0135 : 12 20 70 87 24 01 68 00 00 1B 5E 13 00 00 00 78 99 31 11 39 57 00 90 96 31 11 00 D0 9B 31 11 00 48 9C 31 11 00 F0 99 31 11 00 68 9A 31 11 19 00 58 9B 31 11 05 00 00 01 B8 63 26 11 19 00 58 9B 31 11 05 00 00 01 30 64 26 11 19 00 58 9B 31 11 05 00 00 01 A8 64 26 11 19 00 58 9B 31 11 05 00 00 01 20 65 26 11 00 C0 9C 31 11 00 E0 9A 31 11 16 
    //07 46 00 84 84 84 84 72 00 78 99 31 11 2A 16 18 0B 00 9A 7D 00 F0 99 31 11 16 25 16 16 18 0B 00 
    //9A 7D 00 68 9A 31 11 16 25 16 16 18 09 00 96 00 E0 9A 31 11 25 16 16 18 0A 00 99 00 E0 9A 31 11 
    //2C 03 16 16 04 28 0F 00 58 9B 31 11 2E B0 BD 5F 01 19 19 00 78 99 31 11 05 00 04 01 A8 83 18 11 
    //06 00 04 1B 63 05 00 00 16 07 8D 00 84 9A 19 00 78 99 31 11 06 00 04 1C 38 DD 18 11 16 25 16 18 
    //09 00 72 00 58 9B 31 11 2A 16 16 04 28 0F 00 D0 9B 31 11 19 00 78 99 31 11 06 00 04 1C 38 DD 18 
    //11 16 0F 00 48 9C 31 11 19 00 78 99 31 11 06 00 00 1B 67 05 00 00 16 19 00 58 9B 31 11 06 00 00 
    //1C 20 30 19 11 16 1B B1 0C 00 00 19 00 58 9B 31 11 05 00 00 01 B8 63 26 11 16 1B B1 0C 00 00 19 
    //00 58 9B 31 11 05 00 00 01 30 64 26 11 16 1B B1 0C 00 00 19 00 58 9B 31 11 05 00 00 01 A8 64 26 
    //11 16 1B B1 0C 00 00 19 00 58 9B 31 11 05 00 00 01 20 65 26 11 16 0F 00 C0 9C 31 11 19 19 00 78 
    //99 31 11 06 00 04 1B 7F 0D 00 00 16 06 00 04 1B 41 13 00 00 16 12 20 70 87 24 01 68 00 00 1B 5E 
    //13 00 00 00 78 99 31 11 39 57 00 90 96 31 11 00 D0 9B 31 11 00 48 9C 31 11 00 F0 99 31 11 00 68 
    //9A 31 11 19 00 58 9B 31 11 05 00 00 01 B8 63 26 11 19 00 58 9B 31 11 05 00 00 01 30 64 26 11 19 
    //00 58 9B 31 11 05 00 00 01 A8 64 26 11 19 00 58 9B 31 11 05 00 00 01 20 65 26 11 00 C0 9C 31 11 
    //00 E0 9A 31 11 16 04 0B 47 
  }


  static event StaticCreateStatuePawns(Actor aActor) {
    local StatueLocation sl;
    local Game_StatuePawn SP;
    foreach aActor.AllActors(Class'StatueLocation',sl) {                        //0000 : 2F 19 00 60 9E 31 11 0D 00 00 61 30 20 C0 9F 31 11 00 00 A5 31 11 16 84 00 
      SP = aActor.Spawn(Class'Game_StatuePawn',aActor,,sl.Location,sl.Rotation);//0019 : 0F 00 78 A5 31 11 19 00 60 9E 31 11 2A 00 04 61 16 20 98 E3 60 01 00 60 9E 31 11 0B 19 00 00 A5 31 11 05 00 0C 01 30 81 6C 0F 19 00 00 A5 31 11 05 00 0C 01 00 84 6C 0F 16 
      if (SP != None) {                                                         //0052 : 07 83 00 77 00 78 A5 31 11 2A 16 
        SP.sv_OnInit();                                                         //005D : 19 00 78 A5 31 11 06 00 00 1C 60 3F 32 0F 16 
        SP.sv_SetStatue(sl);                                                    //006C : 19 00 78 A5 31 11 0B 00 00 1B 3A 07 00 00 00 00 A5 31 11 16 
        goto jl0083;                                                            //0080 : 06 83 00 
      }
    }
    //2F 19 00 60 9E 31 11 0D 00 00 61 30 20 C0 9F 31 11 00 00 A5 31 11 16 84 00 0F 00 78 A5 31 11 19 
    //00 60 9E 31 11 2A 00 04 61 16 20 98 E3 60 01 00 60 9E 31 11 0B 19 00 00 A5 31 11 05 00 0C 01 30 
    //81 6C 0F 19 00 00 A5 31 11 05 00 0C 01 00 84 6C 0F 16 07 83 00 77 00 78 A5 31 11 2A 16 19 00 78 
    //A5 31 11 06 00 00 1C 60 3F 32 0F 16 19 00 78 A5 31 11 0B 00 00 1B 3A 07 00 00 00 00 A5 31 11 16 
    //06 83 00 31 30 04 0B 47 
  }


  protected native function sv2rel_ReplicateState_CallStub();


  private event sv2rel_ReplicateState(int aPose,string aPlayerName,string aStatueTitle,string aStatueDescription) {
    Pose = aPose;                                                               //0000 : 0F 01 48 A8 31 11 00 50 A7 31 11 
    PlayerName = aPlayerName;                                                   //000B : 0F 01 C0 91 31 11 00 C0 A8 31 11 
    StatueTitle = aStatueTitle;                                                 //0016 : 0F 01 38 92 31 11 00 38 A9 31 11 
    StatueDescription = aStatueDescription;                                     //0021 : 0F 01 D8 8F 31 11 00 B0 A9 31 11 
    cl_UpdateStatue();                                                          //002C : 1B C5 0C 00 00 16 
    cl_SetStatueAnimation();                                                    //0032 : 1B C6 0C 00 00 16 
    //0F 01 48 A8 31 11 00 50 A7 31 11 0F 01 C0 91 31 11 00 C0 A8 31 11 0F 01 38 92 31 11 00 38 A9 31 
    //11 0F 01 D8 8F 31 11 00 B0 A9 31 11 1B C5 0C 00 00 16 1B C6 0C 00 00 16 04 0B 47 
  }


  private event sv_OnStatueDataReceived(int aCharacterId,string aPlayerName,string aTitle,string aDescription,array<byte> aLoddata0,array<byte> aLoddata1,array<byte> aLoddata2,array<byte> aLoddata3,byte aInformedPlayer,int aAwardedTimestamp,int aLastUpdatedTimestamp,int aPose) {
    local export editinline Game_StatueAppearance statueAppearance;
    PlayerName = aPlayerName;                                                   //0000 : 0F 01 C0 91 31 11 00 98 AC 31 11 
    StatueTitle = aTitle;                                                       //000B : 0F 01 38 92 31 11 00 10 AD 31 11 
    StatueDescription = aDescription;                                           //0016 : 0F 01 D8 8F 31 11 00 88 AD 31 11 
    Pose = aPose;                                                               //0021 : 0F 01 48 A8 31 11 00 00 AE 31 11 
    statueAppearance = Game_StatueAppearance(Appearance.GetBase());             //002C : 0F 00 78 AE 31 11 2E E0 50 60 01 19 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 
    statueAppearance.mLODData0 = aLoddata0;                                     //0046 : 0F 19 00 78 AE 31 11 05 00 00 01 B8 63 26 11 00 F0 AE 31 11 
    statueAppearance.mLODData1 = aLoddata1;                                     //005A : 0F 19 00 78 AE 31 11 05 00 00 01 30 64 26 11 00 68 AF 31 11 
    statueAppearance.mLODData2 = aLoddata2;                                     //006E : 0F 19 00 78 AE 31 11 05 00 00 01 A8 64 26 11 00 E0 AF 31 11 
    statueAppearance.mLODData3 = aLoddata3;                                     //0082 : 0F 19 00 78 AE 31 11 05 00 00 01 20 65 26 11 00 58 B0 31 11 
    statueAppearance.ConditionalUnpackLODData();                                //0096 : 19 00 78 AE 31 11 06 00 00 1B 89 0C 00 00 16 
    statueAppearance.RepackLodDataAll();                                        //00A5 : 19 00 78 AE 31 11 06 00 00 1C 20 30 19 11 16 
    sv2rel_ReplicateState_CallStub(Pose,PlayerName,StatueTitle,StatueDescription);//00B4 : 1B BF 0D 00 00 01 48 A8 31 11 01 C0 91 31 11 01 38 92 31 11 01 D8 8F 31 11 16 
    //0F 01 C0 91 31 11 00 98 AC 31 11 0F 01 38 92 31 11 00 10 AD 31 11 0F 01 D8 8F 31 11 00 88 AD 31 
    //11 0F 01 48 A8 31 11 00 00 AE 31 11 0F 00 78 AE 31 11 2E E0 50 60 01 19 01 A8 83 18 11 06 00 04 
    //1B 63 05 00 00 16 0F 19 00 78 AE 31 11 05 00 00 01 B8 63 26 11 00 F0 AE 31 11 0F 19 00 78 AE 31 
    //11 05 00 00 01 30 64 26 11 00 68 AF 31 11 0F 19 00 78 AE 31 11 05 00 00 01 A8 64 26 11 00 E0 AF 
    //31 11 0F 19 00 78 AE 31 11 05 00 00 01 20 65 26 11 00 58 B0 31 11 19 00 78 AE 31 11 06 00 00 1B 
    //89 0C 00 00 16 19 00 78 AE 31 11 06 00 00 1C 20 30 19 11 16 1B BF 0D 00 00 01 48 A8 31 11 01 C0 
    //91 31 11 01 38 92 31 11 01 D8 8F 31 11 16 04 0B 47 
  }


  private native function sv_UpdateStatue();


  protected function sv_OnConditionalUpdateDataReceived(bool success,array<DatabaseRow> rows,int auto_increment_id,int affected_rows,int TransactionUserData) {
    local byte curEnabled;
    local int curRevision;
    curEnabled = int(rows[0].Fields[0]);                                        //0000 : 0F 00 E0 B6 31 11 39 3D 39 4A 10 25 36 C8 BF 6B 0F 10 25 00 58 B7 31 11 
    curRevision = int(rows[0].Fields[1]);                                       //0018 : 0F 00 D0 B7 31 11 39 4A 10 26 36 C8 BF 6B 0F 10 25 00 58 B7 31 11 
    if (curRevision != Revision) {                                              //002E : 07 69 00 9B 00 D0 B7 31 11 01 48 B8 31 11 16 
      if (curEnabled != 0) {                                                    //003D : 07 5E 00 9B 39 3A 00 E0 B6 31 11 25 16 
        Revision = curRevision;                                                 //004A : 0F 01 48 B8 31 11 00 D0 B7 31 11 
        sv_UpdateStatue();                                                      //0055 : 1B C0 0D 00 00 16 
      } else {                                                                  //005B : 06 69 00 
        Pose = -1;                                                              //005E : 0F 01 48 A8 31 11 1D FF FF FF FF 
      }
    }
    //0F 00 E0 B6 31 11 39 3D 39 4A 10 25 36 C8 BF 6B 0F 10 25 00 58 B7 31 11 0F 00 D0 B7 31 11 39 4A 
    //10 26 36 C8 BF 6B 0F 10 25 00 58 B7 31 11 07 69 00 9B 00 D0 B7 31 11 01 48 B8 31 11 16 07 5E 00 
    //9B 39 3A 00 E0 B6 31 11 25 16 0F 01 48 B8 31 11 00 D0 B7 31 11 1B C0 0D 00 00 16 06 69 00 0F 01 
    //48 A8 31 11 1D FF FF FF FF 04 0B 47 
  }


  protected event sv_ConditionalUpdateStatue() {
    local SBDBAsyncCallback callback;
    LastUpdate = Level.TimeSeconds;                                             //0000 : 0F 01 A8 BC 31 11 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 
    if (Statue != None) {                                                       //0014 : 07 7E 00 77 01 20 BD 31 11 2A 16 
      callback.ObjectName = static.GetFName();                                  //001F : 0F 36 D0 01 20 11 00 50 BB 31 11 1C F0 06 6A 0F 16 
      callback.funcName = name("sv_OnConditionalUpdateDataReceived");           //0030 : 0F 36 48 02 20 11 00 50 BB 31 11 39 5A 1F 73 76 5F 4F 6E 43 6F 6E 64 69 74 69 6F 6E 61 6C 55 70 64 61 74 65 44 61 74 61 52 65 63 65 69 76 65 64 00 
      Class'SBDBAsync'.GetStatueEnabledByTag(self,StatueTag,callback);          //0061 : 12 20 70 87 24 01 11 00 00 1B 5D 13 00 00 17 01 98 BD 31 11 00 50 BB 31 11 16 
      goto jl007E;                                                              //007B : 06 7E 00 
    }
    //0F 01 A8 BC 31 11 19 01 D8 7E 6C 0F 05 00 04 01 A8 81 6C 0F 07 7E 00 77 01 20 BD 31 11 2A 16 0F 
    //36 D0 01 20 11 00 50 BB 31 11 1C F0 06 6A 0F 16 0F 36 48 02 20 11 00 50 BB 31 11 39 5A 1F 73 76 
    //5F 4F 6E 43 6F 6E 64 69 74 69 6F 6E 61 6C 55 70 64 61 74 65 44 61 74 61 52 65 63 65 69 76 65 64 
    //00 12 20 70 87 24 01 11 00 00 1B 5D 13 00 00 17 01 98 BD 31 11 00 50 BB 31 11 16 06 7E 00 04 0B 
    //47 
  }


  protected function cl_UpdateStatue() {
    local StatueLocation sl;
    local export editinline Game_PlayerAppearance baseApp;
    if (Statue == None
      || string(Statue.LocationTag) != StatueTag) {      //0000 : 07 D7 00 84 72 01 20 BD 31 11 2A 16 18 18 00 7B 39 57 19 01 20 BD 31 11 05 00 04 01 C8 C0 31 11 01 98 BD 31 11 16 16 
      Statue = None;                                                            //0027 : 0F 01 20 BD 31 11 2A 
      foreach AllActors(Class'StatueLocation',sl) {                             //002E : 2F 61 30 20 C0 9F 31 11 00 C0 BE 31 11 16 67 00 
        if (string(sl.LocationTag) == StatueTag) {                              //003E : 07 66 00 7A 39 57 19 00 C0 BE 31 11 05 00 04 01 C8 C0 31 11 01 98 BD 31 11 16 
          Statue = sl;                                                          //0058 : 0F 01 20 BD 31 11 00 C0 BE 31 11 
        } else {                                                                //0063 : 06 67 00 
        }
      }
      if (Statue != None) {                                                     //0068 : 07 D7 00 77 01 20 BD 31 11 2A 16 
        baseApp = Game_PlayerAppearance(Appearance.GetBase());                  //0073 : 0F 00 40 C1 31 11 2E B0 BD 5F 01 19 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 
        baseApp.SetScale(Statue.DrawScale);                                     //008D : 19 00 40 C1 31 11 14 00 00 1B 9D 0F 00 00 19 01 20 BD 31 11 05 00 04 01 F0 B3 6E 0F 16 
        SetCollisionSize(CollisionRadius * Statue.DrawScale,CollisionHeight * Statue.DrawScale);//00AA : 61 1B AB 01 C8 89 6C 0F 19 01 20 BD 31 11 05 00 04 01 F0 B3 6E 0F 16 AB 01 40 8A 6C 0F 19 01 20 BD 31 11 05 00 04 01 F0 B3 6E 0F 16 16 
      }
    }
    if (Pose != -1) {                                                           //00D7 : 07 FF 00 9B 01 48 A8 31 11 1D FF FF FF FF 16 
      Pose = Clamp(Pose,0,3 - 1);                                               //00E6 : 0F 01 48 A8 31 11 FB 01 48 A8 31 11 25 93 2C 03 26 16 16 
      cl_SetStatueAnimation();                                                  //00F9 : 1B C6 0C 00 00 16 
    }
    //07 D7 00 84 72 01 20 BD 31 11 2A 16 18 18 00 7B 39 57 19 01 20 BD 31 11 05 00 04 01 C8 C0 31 11 
    //01 98 BD 31 11 16 16 0F 01 20 BD 31 11 2A 2F 61 30 20 C0 9F 31 11 00 C0 BE 31 11 16 67 00 07 66 
    //00 7A 39 57 19 00 C0 BE 31 11 05 00 04 01 C8 C0 31 11 01 98 BD 31 11 16 0F 01 20 BD 31 11 00 C0 
    //BE 31 11 06 67 00 31 30 07 D7 00 77 01 20 BD 31 11 2A 16 0F 00 40 C1 31 11 2E B0 BD 5F 01 19 01 
    //A8 83 18 11 06 00 04 1B 63 05 00 00 16 19 00 40 C1 31 11 14 00 00 1B 9D 0F 00 00 19 01 20 BD 31 
    //11 05 00 04 01 F0 B3 6E 0F 16 61 1B AB 01 C8 89 6C 0F 19 01 20 BD 31 11 05 00 04 01 F0 B3 6E 0F 
    //16 AB 01 40 8A 6C 0F 19 01 20 BD 31 11 05 00 04 01 F0 B3 6E 0F 16 16 07 FF 00 9B 01 48 A8 31 11 
    //1D FF FF FF FF 16 0F 01 48 A8 31 11 FB 01 48 A8 31 11 25 93 2C 03 26 16 16 1B C6 0C 00 00 16 04 
    //0B 47 
  }


  protected native function AdjustPosition();


  function cl_SetStatueAnimation() {
    local array<int> ActionFlags;
    ClearAnims();                                                               //0000 : 1B 94 12 00 00 16 
    ActionFlags[0] = Class'SBAnimationFlags'.75;                                //0006 : 0F 10 25 00 48 C3 31 11 39 3A 12 20 10 BA D6 00 02 00 01 24 4B 
    QueueAnimation(ActionFlags,Pose + 1,1.00000000,0.00000000,0.00000000,False,Class'SBAnimatedPawn'.9);//001B : 1B 0A 0F 00 00 00 48 C3 31 11 92 01 48 A8 31 11 26 16 1E 00 00 80 3F 1E 00 00 00 00 1E 00 00 00 00 28 39 3A 12 20 D0 B4 D6 00 02 00 01 24 09 16 
    PlayQueuedAnimations(True,True);                                            //004B : 1B 09 0F 00 00 27 27 16 
    //1B 94 12 00 00 16 0F 10 25 00 48 C3 31 11 39 3A 12 20 10 BA D6 00 02 00 01 24 4B 1B 0A 0F 00 00 
    //00 48 C3 31 11 92 01 48 A8 31 11 26 16 1E 00 00 80 3F 1E 00 00 00 00 1E 00 00 00 00 28 39 3A 12 
    //20 D0 B4 D6 00 02 00 01 24 09 16 1B 09 0F 00 00 27 27 16 04 0B 47 
  }


  event sv_SetStatue(StatueLocation aStatue) {
    if (Statue == None && aStatue != None) {                                    //0000 : 07 42 00 82 72 01 20 BD 31 11 2A 16 18 09 00 77 00 88 C5 31 11 2A 16 16 
      Statue = aStatue;                                                         //0018 : 0F 01 20 BD 31 11 00 88 C5 31 11 
      StatueTag = string(Statue.LocationTag);                                   //0023 : 0F 01 98 BD 31 11 39 57 19 01 20 BD 31 11 05 00 04 01 C8 C0 31 11 
      sv_ConditionalUpdateStatue();                                             //0039 : 1B 03 07 00 00 16 
      goto jl0042;                                                              //003F : 06 42 00 
    }
    //07 42 00 82 72 01 20 BD 31 11 2A 16 18 09 00 77 00 88 C5 31 11 2A 16 16 0F 01 20 BD 31 11 00 88 
    //C5 31 11 0F 01 98 BD 31 11 39 57 19 01 20 BD 31 11 05 00 04 01 C8 C0 31 11 1B 03 07 00 00 16 06 
    //42 00 04 0B 47 
  }


  event cl_OnUpdate() {
    Super.cl_OnUpdate();                                                        //0000 : 1C 70 23 19 11 16 
    //1C 70 23 19 11 16 04 0B 47 
  }


  event cl_OnBaseline() {
    Super.cl_OnBaseline();                                                      //0000 : 1C 38 3A 19 11 16 
    cl_UpdateStatue();                                                          //0006 : 1B C5 0C 00 00 16 
    //1C 38 3A 19 11 16 1B C5 0C 00 00 16 04 0B 47 
  }


  event cl_OnFrame(float delta) {
    local bool newHidden;
    newHidden = Game_PlayerAppearance(Appearance.GetBase()).GetLowestReceivedLOD() == 255
      || Pose == -1
      || Statue == None;//0000 : 14 2D 00 68 CA 31 11 84 84 9A 39 3A 19 2E B0 BD 5F 01 19 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 06 00 01 1B 42 0F 00 00 16 2C FF 16 18 0D 00 9A 01 48 A8 31 11 1D FF FF FF FF 16 16 18 09 00 72 01 20 BD 31 11 2A 16 16 
    if (newHidden != bHidden) {                                                 //0049 : 07 60 00 F3 2D 00 68 CA 31 11 2D 01 48 5E 6E 0F 16 
      cl_SetStatueAnimation();                                                  //005A : 1B C6 0C 00 00 16 
    }
    bHidden = newHidden;                                                        //0060 : 14 2D 01 48 5E 6E 0F 2D 00 68 CA 31 11 
    Appearance.cl_OnFrame(delta);                                               //006D : 19 01 A8 83 18 11 0B 00 00 1B 3E 05 00 00 00 10 C9 31 11 16 
    //14 2D 00 68 CA 31 11 84 84 9A 39 3A 19 2E B0 BD 5F 01 19 01 A8 83 18 11 06 00 04 1B 63 05 00 00 
    //16 06 00 01 1B 42 0F 00 00 16 2C FF 16 18 0D 00 9A 01 48 A8 31 11 1D FF FF FF FF 16 16 18 09 00 
    //72 01 20 BD 31 11 2A 16 16 07 60 00 F3 2D 00 68 CA 31 11 2D 01 48 5E 6E 0F 16 1B C6 0C 00 00 16 
    //14 2D 01 48 5E 6E 0F 2D 00 68 CA 31 11 19 01 A8 83 18 11 0B 00 00 1B 3E 05 00 00 00 10 C9 31 11 
    //16 04 0B 47 
  }


  event cl_OnInit() {
    Appearance.cl_OnInit();                                                     //0000 : 19 01 A8 83 18 11 06 00 00 1B 3F 05 00 00 16 
    Appearance.GetBase().SetStatue(True);                                       //000F : 19 19 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 07 00 00 1B A5 0F 00 00 27 16 
    Appearance.DressUp();                                                       //0029 : 19 01 A8 83 18 11 06 00 00 1C D0 30 19 11 16 
    CreateShadow();                                                             //0038 : 1B EE 0C 00 00 16 
    cl_UpdateStatue();                                                          //003E : 1B C5 0C 00 00 16 
    //19 01 A8 83 18 11 06 00 00 1B 3F 05 00 00 16 19 19 01 A8 83 18 11 06 00 04 1B 63 05 00 00 16 07 
    //00 00 1B A5 0F 00 00 27 16 19 01 A8 83 18 11 06 00 00 1C D0 30 19 11 16 1B EE 0C 00 00 16 1B C5 
    //0C 00 00 16 04 0B 47 
  }



