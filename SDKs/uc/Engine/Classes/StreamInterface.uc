//==============================================================================
//  StreamInterface
//==============================================================================

class StreamInterface extends StreamBase
    native
    dependsOn()
    Config(System)
  ;

  var private globalconfig string CurrentDirectory;


  function bool HandleDebugExec(string Command,string Param) {
    local string str;
    local array<string> Test;
    local int i;
    if (Super.HandleDebugExec(Command,Param)) {                                 //0000 : 07 15 00 1C A8 81 38 19 00 A0 D3 38 19 00 D8 D5 38 19 16 
      return True;                                                              //0013 : 04 27 
    }
    switch (Locs(Command)) {                                                    //0015 : 05 00 EE 00 A0 D3 38 19 16 
      case "getbase" :                                                          //001E : 0A 34 00 1F 67 65 74 62 61 73 65 00 
        Log(GetBaseDirectory());                                                //002A : E7 1C 50 D6 38 19 16 16 
        return True;                                                            //0032 : 04 27 
      case "getcurrent" :                                                       //0034 : 0A 4D 00 1F 67 65 74 63 75 72 72 65 6E 74 00 
        Log(GetCurrentDirectory());                                             //0043 : E7 1B 04 2B 00 00 16 16 
        return True;                                                            //004B : 04 27 
      case "validfilename" :                                                    //004D : 0A 70 00 1F 76 61 6C 69 64 66 69 6C 65 6E 61 6D 65 00 
        Log(string(ValidFile(Param)));                                          //005F : E7 39 54 1C 00 D7 38 19 00 D8 D5 38 19 16 16 
        return True;                                                            //006E : 04 27 
      case "dir" :                                                              //0070 : 0A DD 00 1F 64 69 72 00 
        GetDirectoryContents(Test,Param);                                       //0078 : 1C B0 D7 38 19 00 60 D8 38 19 00 D8 D5 38 19 16 
        Log("directory list for" @ Param);                                      //0088 : E7 A8 1F 64 69 72 65 63 74 6F 72 79 20 6C 69 73 74 20 66 6F 72 00 00 D8 D5 38 19 16 16 
        i = 0;                                                                  //00A5 : 0F 00 D8 D8 38 19 25 
        while (i < Test.Length) {                                               //00AC : 07 DB 00 96 00 D8 D8 38 19 37 00 60 D8 38 19 16 
          Log("   >" @ Test[i]);                                                //00BC : E7 A8 1F 20 20 20 3E 00 10 00 D8 D8 38 19 00 60 D8 38 19 16 16 
          i++;                                                                  //00D1 : A5 00 D8 D8 38 19 16 
        }
        return True;                                                            //00DB : 04 27 
      case "chdir" :                                                            //00DD : 0A 1F 01 1F 63 68 64 69 72 00 
        str = GetCurrentDirectory();                                            //00E7 : 0F 00 50 D9 38 19 1B 04 2B 00 00 16 
        ChangeDirectory(Param);                                                 //00F3 : 1B 20 2B 00 00 00 D8 D5 38 19 16 
        Log("old:" $ str @ "new:" $ GetCurrentDirectory());                     //00FE : E7 70 A8 70 1F 6F 6C 64 3A 00 00 50 D9 38 19 16 1F 6E 65 77 3A 00 16 1B 04 2B 00 00 16 16 16 
        return True;                                                            //011D : 04 27 
      default:                                                                  //011F : 0A FF FF 
        return False;                                                           //0122 : 04 28 
      }
    }
    //07 15 00 1C A8 81 38 19 00 A0 D3 38 19 00 D8 D5 38 19 16 04 27 05 00 EE 00 A0 D3 38 19 16 0A 34 
    //00 1F 67 65 74 62 61 73 65 00 E7 1C 50 D6 38 19 16 16 04 27 0A 4D 00 1F 67 65 74 63 75 72 72 65 
    //6E 74 00 E7 1B 04 2B 00 00 16 16 04 27 0A 70 00 1F 76 61 6C 69 64 66 69 6C 65 6E 61 6D 65 00 E7 
    //39 54 1C 00 D7 38 19 00 D8 D5 38 19 16 16 04 27 0A DD 00 1F 64 69 72 00 1C B0 D7 38 19 00 60 D8 
    //38 19 00 D8 D5 38 19 16 E7 A8 1F 64 69 72 65 63 74 6F 72 79 20 6C 69 73 74 20 66 6F 72 00 00 D8 
    //D5 38 19 16 16 0F 00 D8 D8 38 19 25 07 DB 00 96 00 D8 D8 38 19 37 00 60 D8 38 19 16 E7 A8 1F 20 
    //20 20 3E 00 10 00 D8 D8 38 19 00 60 D8 38 19 16 16 A5 00 D8 D8 38 19 16 06 AC 00 04 27 0A 1F 01 
    //1F 63 68 64 69 72 00 0F 00 50 D9 38 19 1B 04 2B 00 00 16 1B 20 2B 00 00 00 D8 D5 38 19 16 E7 70 
    //A8 70 1F 6F 6C 64 3A 00 00 50 D9 38 19 16 1F 6E 65 77 3A 00 16 1B 04 2B 00 00 16 16 16 04 27 0A 
    //FF FF 04 28 04 0B 47 
  }


  function ChangeDirectory(string DirectoryName) {
    local bool bSave;
    bSave = DirectoryName != CurrentDirectory;                                  //0000 : 14 2D 00 48 DC 38 19 7B 00 68 DB 38 19 01 C0 DC 38 19 16 
    CurrentDirectory = DirectoryName;                                           //0013 : 0F 01 C0 DC 38 19 00 68 DB 38 19 
    if (bSave) {                                                                //001E : 07 2A 00 2D 00 48 DC 38 19 
      SaveConfig();                                                             //0027 : 62 18 16 
    }
    //14 2D 00 48 DC 38 19 7B 00 68 DB 38 19 01 C0 DC 38 19 16 0F 01 C0 DC 38 19 00 68 DB 38 19 07 2A 
    //00 2D 00 48 DC 38 19 62 18 16 04 0B 47 
  }


  function string GetCurrentDirectory() {
    if (CurrentDirectory == ""
      || !ValidDirectory(CurrentDirectory)) {    //0000 : 07 2A 00 84 7A 01 C0 DC 38 19 1F 00 16 18 0E 00 81 1C 60 DE 38 19 01 C0 DC 38 19 16 16 16 
      ChangeDirectory(GetBaseDirectory());                                      //001E : 1B 20 2B 00 00 1C 50 D6 38 19 16 16 
    }
    return CurrentDirectory;                                                    //002A : 04 01 C0 DC 38 19 
    //07 2A 00 84 7A 01 C0 DC 38 19 1F 00 16 18 0E 00 81 1C 60 DE 38 19 01 C0 DC 38 19 16 16 16 1B 20 
    //2B 00 00 1C 50 D6 38 19 16 16 04 01 C0 DC 38 19 04 0B 47 
  }


  final native function bool LoadPlaylist(string fileName,out array<string> Lines,optional bool bStrict);


  final native function bool ValidFile(string fileName);


  final native function Stream CreateStream(string fileName,optional bool bStrict);


  final native function bool ValidDirectory(optional string DirectoryPath);


  final native function bool RemoveDirectory(string DirectoryName);


  final native function string CreateDirectory(string DirectoryName);


  final native function bool GetDirectoryContents(out array<string> Contents,optional string DirectoryName,optional byte FileType);


  final native function bool GetDriveLetters(out array<string> Letters);


  private final native function string GetBaseDirectory();



