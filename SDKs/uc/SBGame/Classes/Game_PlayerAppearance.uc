//==============================================================================
//  Game_PlayerAppearance
//==============================================================================

class Game_PlayerAppearance extends Game_EquippedAppearance within Game_Pawn
    native
    dependsOn()
  ;

  var private byte mLowestReceivedLOD;
  var array<byte> mLODData0;
  var array<byte> mLODData1;
  var array<byte> mLODData2;
  var array<byte> mLODData3;


  protected native function UnpackBaseData(int aAppearancePart1,int aAppearancePart2);


  protected native function UnpackLodData(int aLevel);


  protected function UnpackLodDataAll() {
    UnpackLodData(0);                                                           //0000 : 1B 33 0C 00 00 25 16 
    UnpackLodData(1);                                                           //0007 : 1B 33 0C 00 00 26 16 
    UnpackLodData(2);                                                           //000E : 1B 33 0C 00 00 2C 02 16 
    UnpackLodData(3);                                                           //0016 : 1B 33 0C 00 00 2C 03 16 
    //1B 33 0C 00 00 25 16 1B 33 0C 00 00 26 16 1B 33 0C 00 00 2C 02 16 1B 33 0C 00 00 2C 03 16 04 0B 
    //47 
  }


  protected native function RepackLodData(int aLevel);


  native function PackBaseData(out int outMSB,out int outLSB);


  function byte GetLowestReceivedLOD() {
    return mLowestReceivedLOD;                                                  //0000 : 04 01 18 61 26 11 
    //04 01 18 61 26 11 04 0B 47 
  }


  final native event RepackLodDataAll();


  function ConditionalUnpackLODData() {
    if (mLODData0.Length > 0) {                                                 //0000 : 07 13 00 97 37 01 B8 63 26 11 25 16 
      UnpackLodData(0);                                                         //000C : 1B 33 0C 00 00 25 16 
    }
    if (mLODData1.Length > 0) {                                                 //0013 : 07 26 00 97 37 01 30 64 26 11 25 16 
      UnpackLodData(1);                                                         //001F : 1B 33 0C 00 00 26 16 
    }
    if (mLODData2.Length > 0) {                                                 //0026 : 07 3A 00 97 37 01 A8 64 26 11 25 16 
      UnpackLodData(2);                                                         //0032 : 1B 33 0C 00 00 2C 02 16 
    }
    if (mLODData3.Length > 0) {                                                 //003A : 07 4E 00 97 37 01 20 65 26 11 25 16 
      UnpackLodData(3);                                                         //0046 : 1B 33 0C 00 00 2C 03 16 
    }
    //07 13 00 97 37 01 B8 63 26 11 25 16 1B 33 0C 00 00 25 16 07 26 00 97 37 01 30 64 26 11 25 16 1B 
    //33 0C 00 00 26 16 07 3A 00 97 37 01 A8 64 26 11 25 16 1B 33 0C 00 00 2C 02 16 07 4E 00 97 37 01 
    //20 65 26 11 25 16 1B 33 0C 00 00 2C 03 16 04 0B 47 
  }


  function GetLODData(out array<byte> oLOD0,out array<byte> oLOD1,out array<byte> oLOD2,out array<byte> oLOD3) {
    RepackLodDataAll();                                                         //0000 : 1C 20 30 19 11 16 
    oLOD0 = mLODData0;                                                          //0006 : 0F 00 48 66 26 11 01 B8 63 26 11 
    oLOD1 = mLODData1;                                                          //0011 : 0F 00 30 67 26 11 01 30 64 26 11 
    oLOD2 = mLODData2;                                                          //001C : 0F 00 A8 67 26 11 01 A8 64 26 11 
    oLOD3 = mLODData3;                                                          //0027 : 0F 00 20 68 26 11 01 20 65 26 11 
    //1C 20 30 19 11 16 0F 00 48 66 26 11 01 B8 63 26 11 0F 00 30 67 26 11 01 30 64 26 11 0F 00 A8 67 
    //26 11 01 A8 64 26 11 0F 00 20 68 26 11 01 20 65 26 11 04 0B 47 
  }


  event SetLODData(array<byte> aLOD0,array<byte> aLOD1,array<byte> aLOD2,array<byte> aLOD3) {
    mLODData0 = aLOD0;                                                          //0000 : 0F 01 B8 63 26 11 00 28 6B 26 11 
    mLODData1 = aLOD1;                                                          //000B : 0F 01 30 64 26 11 00 20 6C 26 11 
    mLODData2 = aLOD2;                                                          //0016 : 0F 01 A8 64 26 11 00 98 6C 26 11 
    mLODData3 = aLOD3;                                                          //0021 : 0F 01 20 65 26 11 00 10 6D 26 11 
    ConditionalUnpackLODData();                                                 //002C : 1B 89 0C 00 00 16 
    Apply();                                                                    //0032 : 1C A0 3B 21 11 16 
    //0F 01 B8 63 26 11 00 28 6B 26 11 0F 01 30 64 26 11 00 20 6C 26 11 0F 01 A8 64 26 11 00 98 6C 26 
    //11 0F 01 20 65 26 11 00 10 6D 26 11 1B 89 0C 00 00 16 1C A0 3B 21 11 16 04 0B 47 
  }


  event SetBaseAppearance(int aAppearancePart1,int aAppearancePart2) {
    UnpackBaseData(aAppearancePart1,aAppearancePart2);                          //0000 : 1B 6D 0F 00 00 00 18 70 26 11 00 E0 70 26 11 16 
    Apply();                                                                    //0010 : 1C A0 3B 21 11 16 
    //1B 6D 0F 00 00 00 18 70 26 11 00 E0 70 26 11 16 1C A0 3B 21 11 16 04 0B 47 
  }


  function app(int A) {
    Super.app(A);                                                               //0000 : 1C 60 62 21 11 00 08 72 26 11 16 
    cl_ConsoleMessage("----------------------------");                          //000B : 1B F1 0B 00 00 1F 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 00 16 
    if (A == 0) {                                                               //002F : 07 F6 00 9A 00 08 72 26 11 25 16 
      cl_ConsoleMessage("mLODData0.length == " $ string(mLODData0.Length));     //003A : 1B F1 0B 00 00 70 1F 6D 4C 4F 44 44 61 74 61 30 2E 6C 65 6E 67 74 68 20 3D 3D 20 00 39 53 37 01 B8 63 26 11 16 16 
      cl_ConsoleMessage("mLODData1.length == " $ string(mLODData1.Length));     //0060 : 1B F1 0B 00 00 70 1F 6D 4C 4F 44 44 61 74 61 31 2E 6C 65 6E 67 74 68 20 3D 3D 20 00 39 53 37 01 30 64 26 11 16 16 
      cl_ConsoleMessage("mLODData2.length == " $ string(mLODData2.Length));     //0086 : 1B F1 0B 00 00 70 1F 6D 4C 4F 44 44 61 74 61 32 2E 6C 65 6E 67 74 68 20 3D 3D 20 00 39 53 37 01 A8 64 26 11 16 16 
      cl_ConsoleMessage("mLODData3.length == " $ string(mLODData3.Length));     //00AC : 1B F1 0B 00 00 70 1F 6D 4C 4F 44 44 61 74 61 33 2E 6C 65 6E 67 74 68 20 3D 3D 20 00 39 53 37 01 20 65 26 11 16 16 
      cl_ConsoleMessage("----------------------------");                        //00D2 : 1B F1 0B 00 00 1F 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 00 16 
    }
    //1C 60 62 21 11 00 08 72 26 11 16 1B F1 0B 00 00 1F 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 
    //2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 00 16 07 F6 00 9A 00 08 72 26 11 25 16 1B F1 0B 00 00 70 
    //1F 6D 4C 4F 44 44 61 74 61 30 2E 6C 65 6E 67 74 68 20 3D 3D 20 00 39 53 37 01 B8 63 26 11 16 16 
    //1B F1 0B 00 00 70 1F 6D 4C 4F 44 44 61 74 61 31 2E 6C 65 6E 67 74 68 20 3D 3D 20 00 39 53 37 01 
    //30 64 26 11 16 16 1B F1 0B 00 00 70 1F 6D 4C 4F 44 44 61 74 61 32 2E 6C 65 6E 67 74 68 20 3D 3D 
    //20 00 39 53 37 01 A8 64 26 11 16 16 1B F1 0B 00 00 70 1F 6D 4C 4F 44 44 61 74 61 33 2E 6C 65 6E 
    //67 74 68 20 3D 3D 20 00 39 53 37 01 20 65 26 11 16 16 1B F1 0B 00 00 1F 2D 2D 2D 2D 2D 2D 2D 2D 
    //2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 00 16 04 0B 47 
  }


  function bool IsFullDetail() {
    return mLowestReceivedLOD == 0;                                             //0000 : 04 9A 39 3A 01 18 61 26 11 25 16 
    //04 9A 39 3A 01 18 61 26 11 25 16 04 0B 47 
  }


  event cl_OnFrame(float DeltaTime) {
    Super.cl_OnFrame(DeltaTime);                                                //0000 : 1C 20 77 21 11 00 18 76 26 11 16 
    ConditionalUnpackLODData();                                                 //000B : 1B 89 0C 00 00 16 
    //1C 20 77 21 11 00 18 76 26 11 16 1B 89 0C 00 00 16 04 0B 47 
  }


  event cl_OnInit() {
    Super.cl_OnInit();                                                          //0000 : 1C D8 3D 21 11 16 
    Apply();                                                                    //0006 : 1C A0 3B 21 11 16 
    //1C D8 3D 21 11 16 1C A0 3B 21 11 16 04 0B 47 
  }



