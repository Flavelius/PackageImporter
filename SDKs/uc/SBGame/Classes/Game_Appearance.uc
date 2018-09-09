//==============================================================================
//  Game_Appearance
//==============================================================================

class Game_Appearance extends Base_Component within Game_Pawn
    native
    dependsOn(Game_Pawn,PlayerController,Player,Console,NPC_Appearance)
  ;

  const RACE_DAEVIE =  1;
  const RACE_HUMAN =  0;
  enum EPreviewCamera {
    PC_COMPLETE_FRONT ,
    PC_COMPLETE_FRONT_2 ,
    PC_HEAD ,
    PC_HEAD_CLOSEUP ,
    PC_TATTOOS 
  };

  var byte mRace;
  var byte mGender;
  var byte mBody;
  var byte mVoice;
  var float mScale;
  var int mStatue;
  var int mGhost;
  var private int mErrors;
  var private Game_Pawn mWorkPawn;
  var bool mClientInitialized;
  var private string mVoicePackage;
  var Material mAvatarTexture;


  protected native function string cl_GetHexAddress(Object aObject);


  protected function cl_ConsoleMessage(string aString) {
    PlayerController(Outer.Controller).Player.Console.Message(aString,0.00000000);//0000 : 19 19 19 2E 58 34 C2 00 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 10 76 6D 0F 10 00 00 1B 37 03 00 00 00 E0 11 21 11 1E 00 00 00 00 16 
    //19 19 19 2E 58 34 C2 00 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 
    //04 01 10 76 6D 0F 10 00 00 1B 37 03 00 00 00 E0 11 21 11 1E 00 00 00 00 16 04 0B 47 
  }


  protected final native function bool ApplyToPawn(Game_Pawn aPawn);


  native function GetPreviewCamera(byte aPreviewCamera,out Vector Translation,out Rotator Rotation);


  function app(int A) {
    if (A == 0) {                                                               //0000 : 07 9A 00 9A 00 08 18 21 11 25 16 
      cl_ConsoleMessage("Current appearance overview:");                        //000B : 1B F1 0B 00 00 1F 43 75 72 72 65 6E 74 20 61 70 70 65 61 72 61 6E 63 65 20 6F 76 65 72 76 69 65 77 3A 00 16 
      cl_ConsoleMessage("----------------------------");                        //002F : 1B F1 0B 00 00 1F 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 00 16 
      cl_ConsoleMessage("Appearance == " $ cl_GetHexAddress(self));             //0053 : 1B F1 0B 00 00 70 1F 41 70 70 65 61 72 61 6E 63 65 20 3D 3D 20 00 1B 59 0F 00 00 17 16 16 16 
      cl_ConsoleMessage("mClientInitialized == " $ string(mClientInitialized)); //0072 : 1B F1 0B 00 00 70 1F 6D 43 6C 69 65 6E 74 49 6E 69 74 69 61 6C 69 7A 65 64 20 3D 3D 20 00 39 54 2D 01 80 19 21 11 16 16 
    }
    //07 9A 00 9A 00 08 18 21 11 25 16 1B F1 0B 00 00 1F 43 75 72 72 65 6E 74 20 61 70 70 65 61 72 61 
    //6E 63 65 20 6F 76 65 72 76 69 65 77 3A 00 16 1B F1 0B 00 00 1F 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 
    //2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 00 16 1B F1 0B 00 00 70 1F 41 70 70 65 61 72 
    //61 6E 63 65 20 3D 3D 20 00 1B 59 0F 00 00 17 16 16 16 1B F1 0B 00 00 70 1F 6D 43 6C 69 65 6E 74 
    //49 6E 69 74 69 61 6C 69 7A 65 64 20 3D 3D 20 00 39 54 2D 01 80 19 21 11 16 16 04 0B 47 
  }


  function Material GetAvatarTexture() {
    return mAvatarTexture;                                                      //0000 : 04 01 58 1B 21 11 
    //04 01 58 1B 21 11 04 0B 47 
  }


  function SetAvatarTexture(Material aNewVal) {
    mAvatarTexture = aNewVal;                                                   //0000 : 0F 01 58 1B 21 11 00 80 1C 21 11 
    //0F 01 58 1B 21 11 00 80 1C 21 11 04 0B 47 
  }


  function bool GetStatue() {
    return mStatue > 0;                                                         //0000 : 04 97 01 98 1E 21 11 25 16 
    //04 97 01 98 1E 21 11 25 16 04 0B 47 
  }


  function SetStatue(bool aOn) {
    if (aOn) {                                                                  //0000 : 07 13 00 2D 00 C0 1F 21 11 
      mStatue++;                                                                //0009 : A5 01 98 1E 21 11 16 
    } else {                                                                    //0010 : 06 1A 00 
      mStatue--;                                                                //0013 : A6 01 98 1E 21 11 16 
    }
    //07 13 00 2D 00 C0 1F 21 11 A5 01 98 1E 21 11 16 06 1A 00 A6 01 98 1E 21 11 16 04 0B 47 
  }


  function bool GetGhost() {
    return mGhost > 0;                                                          //0000 : 04 97 01 E8 21 21 11 25 16 
    //04 97 01 E8 21 21 11 25 16 04 0B 47 
  }


  function SetGhost(bool aOn) {
    if (aOn) {                                                                  //0000 : 07 13 00 2D 00 10 23 21 11 
      mGhost++;                                                                 //0009 : A5 01 E8 21 21 11 16 
    } else {                                                                    //0010 : 06 25 00 
      if (mGhost <= 0) {                                                        //0013 : 07 1E 00 98 01 E8 21 21 11 25 16 
      }
      mGhost--;                                                                 //001E : A6 01 E8 21 21 11 16 
    }
    //07 13 00 2D 00 10 23 21 11 A5 01 E8 21 21 11 16 06 25 00 07 1E 00 98 01 E8 21 21 11 25 16 A6 01 
    //E8 21 21 11 16 04 0B 47 
  }


  function float GetScale() {
    return mScale;                                                              //0000 : 04 01 E8 24 21 11 
    //04 01 E8 24 21 11 04 0B 47 
  }


  function byte GetBody() {
    return mBody;                                                               //0000 : 04 01 C0 26 21 11 
    //04 01 C0 26 21 11 04 0B 47 
  }


  function byte GetGender() {
    return mGender;                                                             //0000 : 04 01 98 28 21 11 
    //04 01 98 28 21 11 04 0B 47 
  }


  function byte GetRace() {
    return mRace;                                                               //0000 : 04 01 70 2A 21 11 
    //04 01 70 2A 21 11 04 0B 47 
  }


  function SetScale(float aNewVal) {
    mScale = aNewVal;                                                           //0000 : 0F 01 E8 24 21 11 00 98 2B 21 11 
    //0F 01 E8 24 21 11 00 98 2B 21 11 04 0B 47 
  }


  function SetBody(byte aNewVal) {
    mBody = aNewVal;                                                            //0000 : 0F 01 C0 26 21 11 00 00 2D 21 11 
    //0F 01 C0 26 21 11 00 00 2D 21 11 04 0B 47 
  }


  function SetGender(byte aNewVal) {
    mGender = aNewVal;                                                          //0000 : 0F 01 98 28 21 11 00 68 2E 21 11 
    mVoicePackage = "";                                                         //000B : 0F 01 28 2F 21 11 1F 00 
    //0F 01 98 28 21 11 00 68 2E 21 11 0F 01 28 2F 21 11 1F 00 04 0B 47 
  }


  function SetRace(byte aNewVal) {
    mRace = aNewVal;                                                            //0000 : 0F 01 70 2A 21 11 00 50 30 21 11 
    //0F 01 70 2A 21 11 00 50 30 21 11 04 0B 47 
  }


  event bool Check() {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }


  event string GetVoicePackage() {
    if (mVoice < 255) {                                                         //0000 : 07 07 01 96 39 3A 01 88 33 21 11 2C FF 16 
      if (Len(mVoicePackage) == 0 && mGender <= 1) {                            //000E : 07 04 01 82 9A 7D 01 28 2F 21 11 16 25 16 18 0B 00 98 39 3A 01 98 28 21 11 26 16 16 
        mVoicePackage = "voice_";                                               //002A : 0F 01 28 2F 21 11 1F 76 6F 69 63 65 5F 00 
        if (mGender == 0) {                                                     //0038 : 07 55 00 9A 39 3A 01 98 28 21 11 25 16 
        } else {                                                                //0052 : 06 62 00 
        }
        if (IsPlayer()) {                                                       //0062 : 07 83 00 1B 4A 0D 00 00 16 
        } else {                                                                //0080 : 06 04 01 
          if (IsKid()) {                                                        //0083 : 07 AB 00 1B C3 0C 00 00 16 
          } else {                                                              //00A8 : 06 04 01 
            if (mVoice >= Class'NPC_Appearance'.9) {                            //00AB : 07 EF 00 99 39 3A 01 88 33 21 11 39 3A 12 20 B8 A1 5B 01 02 00 01 24 09 16 
            } else {                                                            //00EC : 06 04 01 
            }
          }
        }
      }
    } else {                                                                    //0104 : 06 0F 01 
      mVoicePackage = "";                                                       //0107 : 0F 01 28 2F 21 11 1F 00 
    }
    return mVoicePackage;                                                       //010F : 04 01 28 2F 21 11 
    //07 07 01 96 39 3A 01 88 33 21 11 2C FF 16 07 04 01 82 9A 7D 01 28 2F 21 11 16 25 16 18 0B 00 98 
    //39 3A 01 98 28 21 11 26 16 16 0F 01 28 2F 21 11 1F 76 6F 69 63 65 5F 00 07 55 00 9A 39 3A 01 98 
    //28 21 11 25 16 0E 61 42 01 28 2F 21 11 1F 6D 5F 00 16 06 62 00 0E 61 42 01 28 2F 21 11 1F 66 5F 
    //00 16 07 83 00 1B 4A 0D 00 00 16 0E 61 42 01 28 2F 21 11 39 53 92 26 39 3A 01 88 33 21 11 16 16 
    //06 04 01 07 AB 00 1B C3 0C 00 00 16 0E 61 42 01 28 2F 21 11 70 1F 6B 69 64 00 39 53 92 26 39 3A 
    //01 88 33 21 11 16 16 16 06 04 01 07 EF 00 99 39 3A 01 88 33 21 11 39 3A 12 20 B8 A1 5B 01 02 00 
    //01 24 09 16 0E 61 42 01 28 2F 21 11 70 1F 6E 70 63 00 39 53 92 26 A7 93 39 3A 12 20 B8 A1 5B 01 
    //02 00 01 24 09 2C 02 16 16 16 16 16 06 04 01 0E 61 42 01 28 2F 21 11 39 53 92 26 39 3A 01 88 33 
    //21 11 16 16 06 0F 01 0F 01 28 2F 21 11 1F 00 04 01 28 2F 21 11 04 0B 47 
  }


  function bool IsNPC() {
    return !IsKid() && !IsPlayer();                                             //0000 : 04 82 81 1B C3 0C 00 00 16 16 18 09 00 81 1B 4A 0D 00 00 16 16 16 
    //04 82 81 1B C3 0C 00 00 16 16 18 09 00 81 1B 4A 0D 00 00 16 16 16 04 0B 47 
  }


  function bool IsPlayer() {
    return Game_PlayerPawn(Outer) != None || Game_EditorPawn(Outer) != None
      || Character_Pawn(Outer) != None;//0000 : 04 84 84 77 2E F0 47 5B 01 01 00 E4 6B 0F 2A 16 18 0E 00 77 2E B8 B5 5E 01 01 00 E4 6B 0F 2A 16 16 18 0E 00 77 2E 90 2D 5B 01 01 00 E4 6B 0F 2A 16 16 
    //04 84 84 77 2E F0 47 5B 01 01 00 E4 6B 0F 2A 16 18 0E 00 77 2E B8 B5 5E 01 01 00 E4 6B 0F 2A 16 
    //16 18 0E 00 77 2E 90 2D 5B 01 01 00 E4 6B 0F 2A 16 16 04 0B 47 
  }


  function bool IsKid() {
    return mBody == 4;                                                          //0000 : 04 9A 39 3A 01 C0 26 21 11 2C 04 16 
    //04 9A 39 3A 01 C0 26 21 11 2C 04 16 04 0B 47 
  }


  function byte GetVoice() {
    return mVoice;                                                              //0000 : 04 01 88 33 21 11 
    //04 01 88 33 21 11 04 0B 47 
  }


  function SetVoice(byte aNewVal) {
    mVoice = aNewVal;                                                           //0000 : 0F 01 88 33 21 11 00 E0 3A 21 11 
    mVoicePackage = "";                                                         //000B : 0F 01 28 2F 21 11 1F 00 
    //0F 01 88 33 21 11 00 E0 3A 21 11 0F 01 28 2F 21 11 1F 00 04 0B 47 
  }


  function bool IsFullDetail() {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }


  final native function Apply();


  event cl_OnFrame(float DeltaTime) {
    //04 0B 47 
  }


  event cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C E0 C4 19 11 16 
    mClientInitialized = True;                                                  //0006 : 14 2D 01 80 19 21 11 27 
    //1C E0 C4 19 11 16 14 2D 01 80 19 21 11 27 04 0B 47 
  }


  event OnConstruct() {
    //04 0B 47 
  }



