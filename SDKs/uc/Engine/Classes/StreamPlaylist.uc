//==============================================================================
//  StreamPlaylist
//==============================================================================

class StreamPlaylist extends StreamBase
    PerObjectConfig
    dependsOn(Stream,StreamInterface)
    Config(UPlaylists)
  ;

  var (StreamPlaylist) config int current;
  var (StreamPlaylist) config array<string> Playlist;
  var (StreamPlaylist) string Title;
  var (StreamPlaylist) config bool bNeedSave;
  var (StreamPlaylist) private editconstarray transient editconst editinline array<int> RandomPool;
  var (StreamPlaylist) editconst editinline StreamInterface FileManager;
  var (StreamPlaylist) editconstarray editconst editinline array<Stream> Songs;
  var (null);


  function Save() {
    local int i;
    if (!bNeedSave) {                                                           //0000 : 07 0D 00 81 2D 01 80 CD 39 19 16 
      return;                                                                   //000B : 04 0B 
    }
    Playlist.Remove(0,Playlist.Length);                                         //000D : 41 01 F8 CD 39 19 25 37 01 F8 CD 39 19 
    i = 0;                                                                      //001A : 0F 00 30 CC 39 19 25 
    while (i < Songs.Length) {                                                  //0021 : 07 6D 00 96 00 30 CC 39 19 37 01 70 CE 39 19 16 
      if (Songs[i] != None) {                                                   //0031 : 07 63 00 77 10 00 30 CC 39 19 01 70 CE 39 19 2A 16 
        Playlist[i] = Songs[i].GetPath();                                       //0042 : 0F 10 00 30 CC 39 19 01 F8 CD 39 19 19 10 00 30 CC 39 19 01 70 CE 39 19 06 00 00 1B 92 2A 00 00 16 
      }
      i++;                                                                      //0063 : A5 00 30 CC 39 19 16 
    }
    bNeedSave = False;                                                          //006D : 14 2D 01 80 CD 39 19 28 
    SaveConfig();                                                               //0075 : 62 18 16 
    //07 0D 00 81 2D 01 80 CD 39 19 16 04 0B 41 01 F8 CD 39 19 25 37 01 F8 CD 39 19 0F 00 30 CC 39 19 
    //25 07 6D 00 96 00 30 CC 39 19 37 01 70 CE 39 19 16 07 63 00 77 10 00 30 CC 39 19 01 70 CE 39 19 
    //2A 16 0F 10 00 30 CC 39 19 01 F8 CD 39 19 19 10 00 30 CC 39 19 01 70 CE 39 19 06 00 00 1B 92 2A 
    //00 00 16 A5 00 30 CC 39 19 16 06 21 00 14 2D 01 80 CD 39 19 28 62 18 16 04 0B 47 
  }


  function bool HandleDebugExec(string Command,string Param) {
    local int i;
    if (Super.HandleDebugExec(Command,Param)) {                                 //0000 : 07 15 00 1C A8 81 38 19 00 98 CF 39 19 00 18 D2 39 19 16 
      return True;                                                              //0013 : 04 27 
    }
    switch (Locs(Command)) {                                                    //0015 : 05 00 EE 00 98 CF 39 19 16 
      case "Addsong" :                                                          //001E : 0A 37 00 1F 41 64 64 73 6F 6E 67 00 
        AddSong(Param);                                                         //002A : 1B 05 2B 00 00 00 18 D2 39 19 16 
        return True;                                                            //0035 : 04 27 
      case "dumptags" :                                                         //0037 : 0A 7C 00 1F 64 75 6D 70 74 61 67 73 00 
        i = 0;                                                                  //0044 : 0F 00 90 D2 39 19 25 
        while (i < Songs.Length) {                                              //004B : 07 7A 00 96 00 90 D2 39 19 37 01 70 CE 39 19 16 
          Songs[i].DumpTags();                                                  //005B : 19 10 00 90 D2 39 19 01 70 CE 39 19 06 00 00 1B F3 2B 00 00 16 
          i++;                                                                  //0070 : A5 00 90 D2 39 19 16 
        }
        return True;                                                            //007A : 04 27 
      case "scripttags" :                                                       //007C : 0A C1 00 1F 73 63 72 69 70 74 74 61 67 73 00 
        i = 0;                                                                  //008B : 0F 00 90 D2 39 19 25 
        while (i < Songs.Length) {                                              //0092 : 07 C1 00 96 00 90 D2 39 19 37 01 70 CE 39 19 16 
          Songs[i].DumpScriptTag();                                             //00A2 : 19 10 00 90 D2 39 19 01 70 CE 39 19 06 00 00 1B FF 2A 00 00 16 
          i++;                                                                  //00B7 : A5 00 90 D2 39 19 16 
        }
      case "showsongs" :                                                        //00C1 : 0A 55 01 1F 73 68 6F 77 73 6F 6E 67 73 00 
        Log("Playlist" @ GetTitle() @ "has"
          @ string(Songs.Length)
          @ "songs",'MusicPlayer');//00CF : E7 A8 A8 A8 A8 1F 50 6C 61 79 6C 69 73 74 00 1B 05 13 00 00 16 16 1F 68 61 73 00 16 39 53 37 01 70 CE 39 19 16 1F 73 6F 6E 67 73 00 16 21 4E 03 00 00 16 
        i = 0;                                                                  //0102 : 0F 00 90 D2 39 19 25 
        while (i < Songs.Length) {                                              //0109 : 07 53 01 96 00 90 D2 39 19 37 01 70 CE 39 19 16 
          Log("  " $ string(i) $ ")" @ Songs[i].GetPath(),'MusicPlayer');       //0119 : E7 A8 70 70 1F 20 20 00 39 53 00 90 D2 39 19 16 1F 29 00 16 19 10 00 90 D2 39 19 01 70 CE 39 19 06 00 00 1B 92 2A 00 00 16 16 21 4E 03 00 00 16 
          i++;                                                                  //0149 : A5 00 90 D2 39 19 16 
        }
        return True;                                                            //0153 : 04 27 
      default:                                                                  //0155 : 0A FF FF 
        return False;                                                           //0158 : 04 28 
      }
    }
    //07 15 00 1C A8 81 38 19 00 98 CF 39 19 00 18 D2 39 19 16 04 27 05 00 EE 00 98 CF 39 19 16 0A 37 
    //00 1F 41 64 64 73 6F 6E 67 00 1B 05 2B 00 00 00 18 D2 39 19 16 04 27 0A 7C 00 1F 64 75 6D 70 74 
    //61 67 73 00 0F 00 90 D2 39 19 25 07 7A 00 96 00 90 D2 39 19 37 01 70 CE 39 19 16 19 10 00 90 D2 
    //39 19 01 70 CE 39 19 06 00 00 1B F3 2B 00 00 16 A5 00 90 D2 39 19 16 06 4B 00 04 27 0A C1 00 1F 
    //73 63 72 69 70 74 74 61 67 73 00 0F 00 90 D2 39 19 25 07 C1 00 96 00 90 D2 39 19 37 01 70 CE 39 
    //19 16 19 10 00 90 D2 39 19 01 70 CE 39 19 06 00 00 1B FF 2A 00 00 16 A5 00 90 D2 39 19 16 06 92 
    //00 0A 55 01 1F 73 68 6F 77 73 6F 6E 67 73 00 E7 A8 A8 A8 A8 1F 50 6C 61 79 6C 69 73 74 00 1B 05 
    //13 00 00 16 16 1F 68 61 73 00 16 39 53 37 01 70 CE 39 19 16 1F 73 6F 6E 67 73 00 16 21 4E 03 00 
    //00 16 0F 00 90 D2 39 19 25 07 53 01 96 00 90 D2 39 19 37 01 70 CE 39 19 16 E7 A8 70 70 1F 20 20 
    //00 39 53 00 90 D2 39 19 16 1F 29 00 16 19 10 00 90 D2 39 19 01 70 CE 39 19 06 00 00 1B 92 2A 00 
    //00 16 16 21 4E 03 00 00 16 A5 00 90 D2 39 19 16 06 09 01 04 27 0A FF FF 04 28 04 0B 47 
  }


  function DebugInfo() {
    local int i;
    Log("   Playlist '" $ GetTitle() $ "', Length:"
      $ string(GetPlaylistLength()),'MusicPlayer');//0000 : E7 70 70 70 1F 20 20 20 50 6C 61 79 6C 69 73 74 20 27 00 1B 05 13 00 00 16 16 1F 27 2C 20 4C 65 6E 67 74 68 3A 00 16 39 53 1B 83 2A 00 00 16 16 21 4E 03 00 00 16 
    i = 0;                                                                      //0036 : 0F 00 30 D4 39 19 25 
    while (i < GetPlaylistLength()) {                                           //003D : 07 89 00 96 00 30 D4 39 19 1B 83 2A 00 00 16 16 
      Log("    " $ string(i) $ ")" @ Songs[i].GetSongTitle(),'MusicPlayer');    //004D : E7 A8 70 70 1F 20 20 20 20 00 39 53 00 30 D4 39 19 16 1F 29 00 16 19 10 00 30 D4 39 19 01 70 CE 39 19 06 00 00 1B F2 2B 00 00 16 16 21 4E 03 00 00 16 
      i++;                                                                      //007F : A5 00 30 D4 39 19 16 
    }
    //E7 70 70 70 1F 20 20 20 50 6C 61 79 6C 69 73 74 20 27 00 1B 05 13 00 00 16 16 1F 27 2C 20 4C 65 
    //6E 67 74 68 3A 00 16 39 53 1B 83 2A 00 00 16 16 21 4E 03 00 00 16 0F 00 30 D4 39 19 25 07 89 00 
    //96 00 30 D4 39 19 1B 83 2A 00 00 16 16 E7 A8 70 70 1F 20 20 20 20 00 39 53 00 30 D4 39 19 16 1F 
    //29 00 16 19 10 00 30 D4 39 19 01 70 CE 39 19 06 00 00 1B F2 2B 00 00 16 16 21 4E 03 00 00 16 A5 
    //00 30 D4 39 19 16 06 3D 00 04 0B 47 
  }


  function bool ValidStreamIndex(int Index) {
    return Index >= 0 && Index < Songs.Length;                                  //0000 : 04 82 99 00 40 D6 39 19 25 16 18 0E 00 96 00 40 D6 39 19 37 01 70 CE 39 19 16 16 
    //04 82 99 00 40 D6 39 19 25 16 18 0E 00 96 00 40 D6 39 19 37 01 70 CE 39 19 16 16 04 0B 47 
  }


  function bool ValidStreamName(string fileName) {
    if (fileName == "") {                                                       //0000 : 07 0E 00 7A 00 E0 D7 39 19 1F 00 16 
      return False;                                                             //000C : 04 28 
    }
    return ValidStreamIndex(FindIndexByName(fileName));                         //000E : 04 1B 76 2A 00 00 1B D0 2A 00 00 00 E0 D7 39 19 16 16 
    //07 0E 00 7A 00 E0 D7 39 19 1F 00 16 04 28 04 1B 76 2A 00 00 1B D0 2A 00 00 00 E0 D7 39 19 16 16 
    //04 0B 47 
  }


  function int FindIndexByFileName(string Test) {
    local int i;
    local int num;
    if (Test == "") {                                                           //0000 : 07 12 00 7A 00 80 D9 39 19 1F 00 16 
      return -1;                                                                //000C : 04 1D FF FF FF FF 
    }
    num = GetPlaylistLength();                                                  //0012 : 0F 00 F8 D9 39 19 1B 83 2A 00 00 16 
    i = 0;                                                                      //001E : 0F 00 70 DA 39 19 25 
    while (i < num) {                                                           //0025 : 07 63 00 96 00 70 DA 39 19 00 F8 D9 39 19 16 
      if (Songs[i].GetFileName() ~= Test) {                                     //0034 : 07 59 00 7C 19 10 00 70 DA 39 19 01 70 CE 39 19 06 00 00 1B D2 2A 00 00 16 00 80 D9 39 19 16 
        return i;                                                               //0053 : 04 00 70 DA 39 19 
      }
      i++;                                                                      //0059 : A5 00 70 DA 39 19 16 
    }
    return -1;                                                                  //0063 : 04 1D FF FF FF FF 
    //07 12 00 7A 00 80 D9 39 19 1F 00 16 04 1D FF FF FF FF 0F 00 F8 D9 39 19 1B 83 2A 00 00 16 0F 00 
    //70 DA 39 19 25 07 63 00 96 00 70 DA 39 19 00 F8 D9 39 19 16 07 59 00 7C 19 10 00 70 DA 39 19 01 
    //70 CE 39 19 06 00 00 1B D2 2A 00 00 16 00 80 D9 39 19 16 04 00 70 DA 39 19 A5 00 70 DA 39 19 16 
    //06 25 00 04 1D FF FF FF FF 04 0B 47 
  }


  function int FindIndexByFullName(string Test) {
    local int i;
    local int num;
    if (Test == "") {                                                           //0000 : 07 12 00 7A 00 10 DC 39 19 1F 00 16 
      return -1;                                                                //000C : 04 1D FF FF FF FF 
    }
    num = GetPlaylistLength();                                                  //0012 : 0F 00 48 DD 39 19 1B 83 2A 00 00 16 
    i = 0;                                                                      //001E : 0F 00 C0 DD 39 19 25 
    while (i < num) {                                                           //0025 : 07 63 00 96 00 C0 DD 39 19 00 48 DD 39 19 16 
      if (Songs[i].GetFullName() ~= Test) {                                     //0034 : 07 59 00 7C 19 10 00 C0 DD 39 19 01 70 CE 39 19 06 00 00 1B F1 2B 00 00 16 00 10 DC 39 19 16 
        return i;                                                               //0053 : 04 00 C0 DD 39 19 
      }
      i++;                                                                      //0059 : A5 00 C0 DD 39 19 16 
    }
    return -1;                                                                  //0063 : 04 1D FF FF FF FF 
    //07 12 00 7A 00 10 DC 39 19 1F 00 16 04 1D FF FF FF FF 0F 00 48 DD 39 19 1B 83 2A 00 00 16 0F 00 
    //C0 DD 39 19 25 07 63 00 96 00 C0 DD 39 19 00 48 DD 39 19 16 07 59 00 7C 19 10 00 C0 DD 39 19 01 
    //70 CE 39 19 06 00 00 1B F1 2B 00 00 16 00 10 DC 39 19 16 04 00 C0 DD 39 19 A5 00 C0 DD 39 19 16 
    //06 25 00 04 1D FF FF FF FF 04 0B 47 
  }


  function int FindIndexByPath(string Test) {
    local int i;
    if (Test == "") {                                                           //0000 : 07 12 00 7A 00 60 DF 39 19 1F 00 16 
      return -1;                                                                //000C : 04 1D FF FF FF FF 
    }
    i = 0;                                                                      //0012 : 0F 00 88 E0 39 19 25 
    while (i < Songs.Length) {                                                  //0019 : 07 58 00 96 00 88 E0 39 19 37 01 70 CE 39 19 16 
      if (Songs[i].GetPath() ~= Test) {                                         //0029 : 07 4E 00 7C 19 10 00 88 E0 39 19 01 70 CE 39 19 06 00 00 1B 92 2A 00 00 16 00 60 DF 39 19 16 
        return i;                                                               //0048 : 04 00 88 E0 39 19 
      }
      i++;                                                                      //004E : A5 00 88 E0 39 19 16 
    }
    return -1;                                                                  //0058 : 04 1D FF FF FF FF 
    //07 12 00 7A 00 60 DF 39 19 1F 00 16 04 1D FF FF FF FF 0F 00 88 E0 39 19 25 07 58 00 96 00 88 E0 
    //39 19 37 01 70 CE 39 19 16 07 4E 00 7C 19 10 00 88 E0 39 19 01 70 CE 39 19 06 00 00 1B 92 2A 00 
    //00 16 00 60 DF 39 19 16 04 00 88 E0 39 19 A5 00 88 E0 39 19 16 06 19 00 04 1D FF FF FF FF 04 0B 
    //47 
  }


  function int FindIndexByName(string Test) {
    local FilePath APath;
    if (static.ParsePath(Test,APath)) {                                         //0000 : 07 90 00 1C B8 98 38 19 00 28 E2 39 19 00 A0 E2 39 19 16 
      if (APath.Extension != "") {                                              //0013 : 07 7F 00 7B 36 A0 9E 38 19 00 A0 E2 39 19 1F 00 16 
        if (APath.Directory != "") {                                            //0024 : 07 49 00 7B 36 B0 9D 38 19 00 A0 E2 39 19 1F 00 16 
          return FindIndexByPath(APath.FullPath);                               //0035 : 04 1B 0E 2C 00 00 36 48 9C 38 19 00 A0 E2 39 19 16 
        } else {                                                                //0046 : 06 7C 00 
          if (APath.fileName != "") {                                           //0049 : 07 7C 00 7B 36 18 9F 38 19 00 A0 E2 39 19 1F 00 16 
            return FindIndexByFullName(APath.fileName $ "." $ APath.Extension); //005A : 04 1B 0F 2C 00 00 70 70 36 18 9F 38 19 00 A0 E2 39 19 1F 2E 00 16 36 A0 9E 38 19 00 A0 E2 39 19 16 16 
          }
        }
      } else {                                                                  //007C : 06 90 00 
        return FindIndexByFileName(APath.fileName);                             //007F : 04 1B 10 2C 00 00 36 18 9F 38 19 00 A0 E2 39 19 16 
      }
    }
    return -1;                                                                  //0090 : 04 1D FF FF FF FF 
    //07 90 00 1C B8 98 38 19 00 28 E2 39 19 00 A0 E2 39 19 16 07 7F 00 7B 36 A0 9E 38 19 00 A0 E2 39 
    //19 1F 00 16 07 49 00 7B 36 B0 9D 38 19 00 A0 E2 39 19 1F 00 16 04 1B 0E 2C 00 00 36 48 9C 38 19 
    //00 A0 E2 39 19 16 06 7C 00 07 7C 00 7B 36 18 9F 38 19 00 A0 E2 39 19 1F 00 16 04 1B 0F 2C 00 00 
    //70 70 36 18 9F 38 19 00 A0 E2 39 19 1F 2E 00 16 36 A0 9E 38 19 00 A0 E2 39 19 16 16 06 90 00 04 
    //1B 10 2C 00 00 36 18 9F 38 19 00 A0 E2 39 19 16 04 1D FF FF FF FF 04 0B 47 
  }


  function int GetPlaylistLength() {
    return Songs.Length;                                                        //0000 : 04 37 01 70 CE 39 19 
    //04 37 01 70 CE 39 19 04 0B 47 
  }


  function Stream GetStreamAt(int Index) {
    if (ValidStreamIndex(Index)) {                                              //0000 : 07 1A 00 1B 76 2A 00 00 00 68 E5 39 19 16 
      return Songs[Index];                                                      //000E : 04 10 00 68 E5 39 19 01 70 CE 39 19 
    }
    return None;                                                                //001A : 04 2A 
    //07 1A 00 1B 76 2A 00 00 00 68 E5 39 19 16 04 10 00 68 E5 39 19 01 70 CE 39 19 04 2A 04 0B 47 
  }


  function Stream GetStream(string StreamName) {
    local int i;
    i = FindIndexByName(StreamName);                                            //0000 : 0F 00 30 E8 39 19 1B D0 2A 00 00 00 60 E7 39 19 16 
    return GetStreamAt(i);                                                      //0011 : 04 1B 19 2B 00 00 00 30 E8 39 19 16 
    //0F 00 30 E8 39 19 1B D0 2A 00 00 00 60 E7 39 19 16 04 1B 19 2B 00 00 00 30 E8 39 19 16 04 0B 47 
    //
  }


  function Stream GetCurrentStream() {
    return GetStreamAt(GetCurrent());                                           //0000 : 04 1B 19 2B 00 00 1B 6A 05 00 00 16 16 
    //04 1B 19 2B 00 00 1B 6A 05 00 00 16 16 04 0B 47 
  }


  function GetSongs(out array<Stream> SongArray) {
    SongArray = Songs;                                                          //0000 : 0F 00 38 EB 39 19 01 70 CE 39 19 
    //0F 00 38 EB 39 19 01 70 CE 39 19 04 0B 47 
  }


  function int GetCurrent() {
    return current;                                                             //0000 : 04 01 90 ED 39 19 
    //04 01 90 ED 39 19 04 0B 47 
  }


  function string GetTitle() {
    return Title;                                                               //0000 : 04 01 30 EF 39 19 
    //04 01 30 EF 39 19 04 0B 47 
  }


  function bool IsInitialized() {
    return FileManager != None;                                                 //0000 : 04 77 01 D0 F0 39 19 2A 16 
    //04 77 01 D0 F0 39 19 2A 16 04 0B 47 
  }


  function bool SetSongs(array<Stream> NewSongs) {
    Songs = NewSongs;                                                           //0000 : 0F 01 70 CE 39 19 00 F8 F1 39 19 
    ResetRandomPool();                                                          //000B : 1B E6 2A 00 00 16 
    bNeedSave = True;                                                           //0011 : 14 2D 01 80 CD 39 19 27 
    return True;                                                                //0019 : 04 27 
    //0F 01 70 CE 39 19 00 F8 F1 39 19 1B E6 2A 00 00 16 14 2D 01 80 CD 39 19 27 04 27 04 0B 47 
  }


  function bool SetCurrent(int Index) {
    if (!ValidStreamIndex(Index)) {                                             //0000 : 07 12 00 81 1B 76 2A 00 00 00 68 F4 39 19 16 16 
      return False;                                                             //0010 : 04 28 
    }
    current = Index;                                                            //0012 : 0F 01 90 ED 39 19 00 68 F4 39 19 
    bNeedSave = True;                                                           //001D : 14 2D 01 80 CD 39 19 27 
    return True;                                                                //0025 : 04 27 
    //07 12 00 81 1B 76 2A 00 00 00 68 F4 39 19 16 16 04 28 0F 01 90 ED 39 19 00 68 F4 39 19 14 2D 01 
    //80 CD 39 19 27 04 27 04 0B 47 
  }


  function bool SetTitle(string NewTitle) {
    if (NewTitle == "") {                                                       //0000 : 07 0E 00 7A 00 70 F6 39 19 1F 00 16 
      return False;                                                             //000C : 04 28 
    }
    Title = NewTitle;                                                           //000E : 0F 01 30 EF 39 19 00 70 F6 39 19 
    OnPlaylistChanged();                                                        //0019 : 43 B0 81 39 19 B8 2A 00 00 16 
    Save();                                                                     //0023 : 1B A0 2A 00 00 16 
    return True;                                                                //0029 : 04 27 
    //07 0E 00 7A 00 70 F6 39 19 1F 00 16 04 28 0F 01 30 EF 39 19 00 70 F6 39 19 43 B0 81 39 19 B8 2A 
    //00 00 16 1B A0 2A 00 00 16 04 27 04 0B 47 
  }


  function ResetRandomPool() {
    local int i;
    RandomPool.Length = Songs.Length;                                           //0000 : 0F 37 01 78 F9 39 19 37 01 70 CE 39 19 
    i = 0;                                                                      //000D : 0F 00 78 F8 39 19 25 
    while (i < Songs.Length) {                                                  //0014 : 07 3F 00 96 00 78 F8 39 19 37 01 70 CE 39 19 16 
      RandomPool[i] = i;                                                        //0024 : 0F 10 00 78 F8 39 19 01 78 F9 39 19 00 78 F8 39 19 
      i++;                                                                      //0035 : A5 00 78 F8 39 19 16 
    }
    //0F 37 01 78 F9 39 19 37 01 70 CE 39 19 0F 00 78 F8 39 19 25 07 3F 00 96 00 78 F8 39 19 37 01 70 
    //CE 39 19 16 0F 10 00 78 F8 39 19 01 78 F9 39 19 00 78 F8 39 19 A5 00 78 F8 39 19 16 06 14 00 04 
    //0B 47 
  }


  function string GetRandomSong() {
    local int idx;
    local Stream RandomStream;
    if (RandomPool.Length == 0) {                                               //0000 : 07 12 00 9A 37 01 78 F9 39 19 25 16 
      ResetRandomPool();                                                        //000C : 1B E6 2A 00 00 16 
    }
    if (RandomPool.Length > 0) {                                                //0012 : 07 76 00 97 37 01 78 F9 39 19 25 16 
      idx = Rand(RandomPool.Length - 1);                                        //001E : 0F 00 F0 FB 39 19 A7 93 37 01 78 F9 39 19 26 16 16 
      if (ValidStreamIndex(RandomPool[idx])) {                                  //002F : 07 76 00 1B 76 2A 00 00 10 00 F0 FB 39 19 01 78 F9 39 19 16 
        RandomStream = Songs[RandomPool[idx]];                                  //0043 : 0F 00 68 FC 39 19 10 10 00 F0 FB 39 19 01 78 F9 39 19 01 70 CE 39 19 
        RandomPool.Remove(idx,1);                                               //005A : 41 01 78 F9 39 19 00 F0 FB 39 19 26 
        return RandomStream.GetPath();                                          //0066 : 04 19 00 68 FC 39 19 06 00 00 1B 92 2A 00 00 16 
      }
    }
    return "";                                                                  //0076 : 04 1F 00 
    //07 12 00 9A 37 01 78 F9 39 19 25 16 1B E6 2A 00 00 16 07 76 00 97 37 01 78 F9 39 19 25 16 0F 00 
    //F0 FB 39 19 A7 93 37 01 78 F9 39 19 26 16 16 07 76 00 1B 76 2A 00 00 10 00 F0 FB 39 19 01 78 F9 
    //39 19 16 0F 00 68 FC 39 19 10 10 00 F0 FB 39 19 01 78 F9 39 19 01 70 CE 39 19 41 01 78 F9 39 19 
    //00 F0 FB 39 19 26 04 19 00 68 FC 39 19 06 00 00 1B 92 2A 00 00 16 04 1F 00 04 0B 47 
  }


  function bool ClearPlaylist() {
    bNeedSave = bNeedSave || Songs.Length > 0;                                  //0000 : 14 2D 01 80 CD 39 19 84 2D 01 80 CD 39 19 18 0A 00 97 37 01 70 CE 39 19 25 16 16 
    Songs.Remove(0,Songs.Length);                                               //001B : 41 01 70 CE 39 19 25 37 01 70 CE 39 19 
    RandomPool.Remove(0,RandomPool.Length);                                     //0028 : 41 01 78 F9 39 19 25 37 01 78 F9 39 19 
    return True;                                                                //0035 : 04 27 
    //14 2D 01 80 CD 39 19 84 2D 01 80 CD 39 19 18 0A 00 97 37 01 70 CE 39 19 25 16 16 41 01 70 CE 39 
    //19 25 37 01 70 CE 39 19 41 01 78 F9 39 19 25 37 01 78 F9 39 19 04 27 04 0B 47 
  }


  function ReplaceWith(StreamPlaylist Other) {
    if (Other == None) {                                                        //0000 : 07 0D 00 72 00 30 FF 39 19 2A 16 
      return;                                                                   //000B : 04 0B 
    }
    FileManager = Other.FileManager;                                            //000D : 0F 01 D0 F0 39 19 19 00 30 FF 39 19 05 00 04 01 D0 F0 39 19 
    Other.GetSongs(Songs);                                                      //0021 : 19 00 30 FF 39 19 0B 00 00 1B 0C 2C 00 00 01 70 CE 39 19 16 
    ResetRandomPool();                                                          //0035 : 1B E6 2A 00 00 16 
    SetCurrent(Other.GetCurrent());                                             //003B : 1B C0 2A 00 00 19 00 30 FF 39 19 06 00 04 1B 6A 05 00 00 16 16 
    bNeedSave = True;                                                           //0050 : 14 2D 01 80 CD 39 19 27 
    //07 0D 00 72 00 30 FF 39 19 2A 16 04 0B 0F 01 D0 F0 39 19 19 00 30 FF 39 19 05 00 04 01 D0 F0 39 
    //19 19 00 30 FF 39 19 0B 00 00 1B 0C 2C 00 00 01 70 CE 39 19 16 1B E6 2A 00 00 16 1B C0 2A 00 00 
    //19 00 30 FF 39 19 06 00 04 1B 6A 05 00 00 16 16 14 2D 01 80 CD 39 19 27 04 0B 47 
  }


  function string PrevSong(bool bMayRepeat) {
    local int i;
    i = GetCurrent() - 1;                                                       //0000 : 0F 00 80 01 3A 19 93 1B 6A 05 00 00 16 26 16 
    if (!ValidStreamIndex(i) && bMayRepeat) {                                   //000F : 07 39 00 82 81 1B 76 2A 00 00 00 80 01 3A 19 16 16 18 07 00 2D 00 58 00 3A 19 16 
      i = GetPlaylistLength() - 1;                                              //002A : 0F 00 80 01 3A 19 93 1B 83 2A 00 00 16 26 16 
    }
    if (SetCurrent(i)) {                                                        //0039 : 07 5D 00 1B C0 2A 00 00 00 80 01 3A 19 16 
      return Songs[current].GetPath();                                          //0047 : 04 19 10 01 90 ED 39 19 01 70 CE 39 19 06 00 00 1B 92 2A 00 00 16 
    }
    return "";                                                                  //005D : 04 1F 00 
    //0F 00 80 01 3A 19 93 1B 6A 05 00 00 16 26 16 07 39 00 82 81 1B 76 2A 00 00 00 80 01 3A 19 16 16 
    //18 07 00 2D 00 58 00 3A 19 16 0F 00 80 01 3A 19 93 1B 83 2A 00 00 16 26 16 07 5D 00 1B C0 2A 00 
    //00 00 80 01 3A 19 16 04 19 10 01 90 ED 39 19 01 70 CE 39 19 06 00 00 1B 92 2A 00 00 16 04 1F 00 
    //04 0B 47 
  }


  function string NextSong(bool bMayRepeat) {
    local int i;
    i = GetCurrent() + 1;                                                       //0000 : 0F 00 40 04 3A 19 92 1B 6A 05 00 00 16 26 16 
    if (!ValidStreamIndex(i) && bMayRepeat) {                                   //000F : 07 31 00 82 81 1B 76 2A 00 00 00 40 04 3A 19 16 16 18 07 00 2D 00 20 03 3A 19 16 
      i = 0;                                                                    //002A : 0F 00 40 04 3A 19 25 
    }
    if (SetCurrent(i)) {                                                        //0031 : 07 55 00 1B C0 2A 00 00 00 40 04 3A 19 16 
      return Songs[current].GetPath();                                          //003F : 04 19 10 01 90 ED 39 19 01 70 CE 39 19 06 00 00 1B 92 2A 00 00 16 
    }
    return "";                                                                  //0055 : 04 1F 00 
    //0F 00 40 04 3A 19 92 1B 6A 05 00 00 16 26 16 07 31 00 82 81 1B 76 2A 00 00 00 40 04 3A 19 16 16 
    //18 07 00 2D 00 20 03 3A 19 16 0F 00 40 04 3A 19 25 07 55 00 1B C0 2A 00 00 00 40 04 3A 19 16 04 
    //19 10 01 90 ED 39 19 01 70 CE 39 19 06 00 00 1B 92 2A 00 00 16 04 1F 00 04 0B 47 
  }


  function bool RemoveSongAt(int idx,optional bool bSkipNotification) {
    local int i;
    if (!ValidStreamIndex(idx)) {                                               //0000 : 07 12 00 81 1B 76 2A 00 00 00 E0 05 3A 19 16 16 
      return False;                                                             //0010 : 04 28 
    }
    Songs.Remove(idx,1);                                                        //0012 : 41 01 70 CE 39 19 00 E0 05 3A 19 26 
    i = 0;                                                                      //001E : 0F 00 78 07 3A 19 25 
    while (i < RandomPool.Length) {                                             //0025 : 07 64 00 96 00 78 07 3A 19 37 01 78 F9 39 19 16 
      if (RandomPool[i] == Songs.Length) {                                      //0035 : 07 5A 00 9A 10 00 78 07 3A 19 01 78 F9 39 19 37 01 70 CE 39 19 16 
        RandomPool.Remove(i,1);                                                 //004B : 41 01 78 F9 39 19 00 78 07 3A 19 26 
        goto jl0064;                                                            //0057 : 06 64 00 
      }
      i++;                                                                      //005A : A5 00 78 07 3A 19 16 
    }
    if (idx == current && !SetCurrent(idx - 1)) {                               //0064 : 07 8F 00 82 9A 00 E0 05 3A 19 01 90 ED 39 19 16 18 11 00 81 1B C0 2A 00 00 93 00 E0 05 3A 19 26 16 16 16 16 
      SetCurrent(0);                                                            //0088 : 1B C0 2A 00 00 25 16 
    }
    bNeedSave = True;                                                           //008F : 14 2D 01 80 CD 39 19 27 
    if (!bSkipNotification) {                                                   //0097 : 07 AC 00 81 2D 00 F0 07 3A 19 16 
      OnPlaylistChanged();                                                      //00A2 : 43 B0 81 39 19 B8 2A 00 00 16 
    }
    return True;                                                                //00AC : 04 27 
    //07 12 00 81 1B 76 2A 00 00 00 E0 05 3A 19 16 16 04 28 41 01 70 CE 39 19 00 E0 05 3A 19 26 0F 00 
    //78 07 3A 19 25 07 64 00 96 00 78 07 3A 19 37 01 78 F9 39 19 16 07 5A 00 9A 10 00 78 07 3A 19 01 
    //78 F9 39 19 37 01 70 CE 39 19 16 41 01 78 F9 39 19 00 78 07 3A 19 26 06 64 00 A5 00 78 07 3A 19 
    //16 06 25 00 07 8F 00 82 9A 00 E0 05 3A 19 01 90 ED 39 19 16 18 11 00 81 1B C0 2A 00 00 93 00 E0 
    //05 3A 19 26 16 16 16 16 1B C0 2A 00 00 25 16 14 2D 01 80 CD 39 19 27 07 AC 00 81 2D 00 F0 07 3A 
    //19 16 43 B0 81 39 19 B8 2A 00 00 16 04 27 04 0B 47 
  }


  function bool RemoveSong(string SongFileName,optional bool bSkipNotification) {
    return RemoveSongAt(FindIndexByName(SongFileName),bSkipNotification);       //0000 : 04 1B 05 2C 00 00 1B D0 2A 00 00 00 90 09 3A 19 16 2D 00 08 0A 3A 19 16 
    //04 1B 05 2C 00 00 1B D0 2A 00 00 00 90 09 3A 19 16 2D 00 08 0A 3A 19 16 04 0B 47 
  }


  function int InsertSong(int idx,string Path,optional bool bSkipNotification) {
    local Stream NewStream;
    local byte Type;
    local int i;
    if (!ValidStreamIndex(idx)) {                                               //0000 : 07 22 00 81 1B 76 2A 00 00 00 A8 0B 3A 19 16 16 
      return AddSong(Path,bSkipNotification);                                   //0010 : 04 1B 05 2B 00 00 00 50 0D 3A 19 2D 00 C8 0D 3A 19 16 
    }
    if (Path == "") {                                                           //0022 : 07 34 00 7A 00 50 0D 3A 19 1F 00 16 
      return -1;                                                                //002E : 04 1D FF FF FF FF 
    }
    Type = static.ConvertToFileType(Path);                                      //0034 : 0F 00 40 0E 3A 19 1C 70 84 38 19 00 50 0D 3A 19 16 
    if (Type == 4) {                                                            //0045 : 07 B6 00 9A 39 3A 00 40 0E 3A 19 39 3A 24 04 16 
      NewStream = CreateStream(Path);                                           //0055 : 0F 00 B8 0E 3A 19 1B 03 2B 00 00 00 50 0D 3A 19 16 
      if (NewStream == None) {                                                  //0066 : 07 77 00 72 00 B8 0E 3A 19 2A 16 
        return -1;                                                              //0071 : 04 1D FF FF FF FF 
      }
      i = AddStream(idx,NewStream,bSkipNotification);                           //0077 : 0F 00 30 0F 3A 19 1B 1C 2B 00 00 00 A8 0B 3A 19 00 B8 0E 3A 19 2D 00 C8 0D 3A 19 16 
      bNeedSave = bNeedSave || ValidStreamIndex(i);                             //0093 : 14 2D 01 80 CD 39 19 84 2D 01 80 CD 39 19 18 0C 00 1B 76 2A 00 00 00 30 0F 3A 19 16 16 
      return i;                                                                 //00B0 : 04 00 30 0F 3A 19 
    }
    return -1;                                                                  //00B6 : 04 1D FF FF FF FF 
    //07 22 00 81 1B 76 2A 00 00 00 A8 0B 3A 19 16 16 04 1B 05 2B 00 00 00 50 0D 3A 19 2D 00 C8 0D 3A 
    //19 16 07 34 00 7A 00 50 0D 3A 19 1F 00 16 04 1D FF FF FF FF 0F 00 40 0E 3A 19 1C 70 84 38 19 00 
    //50 0D 3A 19 16 07 B6 00 9A 39 3A 00 40 0E 3A 19 39 3A 24 04 16 0F 00 B8 0E 3A 19 1B 03 2B 00 00 
    //00 50 0D 3A 19 16 07 77 00 72 00 B8 0E 3A 19 2A 16 04 1D FF FF FF FF 0F 00 30 0F 3A 19 1B 1C 2B 
    //00 00 00 A8 0B 3A 19 00 B8 0E 3A 19 2D 00 C8 0D 3A 19 16 14 2D 01 80 CD 39 19 84 2D 01 80 CD 39 
    //19 18 0C 00 1B 76 2A 00 00 00 30 0F 3A 19 16 16 04 00 30 0F 3A 19 04 1D FF FF FF FF 04 0B 47 
  }


  function int AddStream(int Index,Stream NewStream,optional bool bSkipNotification) {
    local int i;
    local string str;
    if (NewStream == None) {                                                    //0000 : 07 11 00 72 00 48 11 3A 19 2A 16 
      return -1;                                                                //000B : 04 1D FF FF FF FF 
    }
    str = NewStream.GetFileName();                                              //0011 : 0F 00 C0 11 3A 19 19 00 48 11 3A 19 06 00 00 1B D2 2A 00 00 16 
    if (str == "") {                                                            //0026 : 07 38 00 7A 00 C0 11 3A 19 1F 00 16 
      return -1;                                                                //0032 : 04 1D FF FF FF FF 
    }
    i = FindIndexByName(str);                                                   //0038 : 0F 00 38 12 3A 19 1B D0 2A 00 00 00 C0 11 3A 19 16 
    if (!ValidStreamIndex(i)) {                                                 //0049 : 07 BF 00 81 1B 76 2A 00 00 00 38 12 3A 19 16 16 
      if (!ValidStreamIndex(Index)) {                                           //0059 : 07 75 00 81 1B 76 2A 00 00 00 D0 10 3A 19 16 16 
        Index = GetPlaylistLength();                                            //0069 : 0F 00 D0 10 3A 19 1B 83 2A 00 00 16 
      }
      Songs.Insert(Index,1);                                                    //0075 : 40 01 70 CE 39 19 00 D0 10 3A 19 26 
      Songs[Index] = NewStream;                                                 //0081 : 0F 10 00 D0 10 3A 19 01 70 CE 39 19 00 48 11 3A 19 
      RandomPool[RandomPool.Length] = Index;                                    //0092 : 0F 10 37 01 78 F9 39 19 01 78 F9 39 19 00 D0 10 3A 19 
      if (!bSkipNotification) {                                                 //00A4 : 07 B9 00 81 2D 00 B0 12 3A 19 16 
        OnPlaylistChanged();                                                    //00AF : 43 B0 81 39 19 B8 2A 00 00 16 
      }
      return Index;                                                             //00B9 : 04 00 D0 10 3A 19 
    }
    return i;                                                                   //00BF : 04 00 38 12 3A 19 
    //07 11 00 72 00 48 11 3A 19 2A 16 04 1D FF FF FF FF 0F 00 C0 11 3A 19 19 00 48 11 3A 19 06 00 00 
    //1B D2 2A 00 00 16 07 38 00 7A 00 C0 11 3A 19 1F 00 16 04 1D FF FF FF FF 0F 00 38 12 3A 19 1B D0 
    //2A 00 00 00 C0 11 3A 19 16 07 BF 00 81 1B 76 2A 00 00 00 38 12 3A 19 16 16 07 75 00 81 1B 76 2A 
    //00 00 00 D0 10 3A 19 16 16 0F 00 D0 10 3A 19 1B 83 2A 00 00 16 40 01 70 CE 39 19 00 D0 10 3A 19 
    //26 0F 10 00 D0 10 3A 19 01 70 CE 39 19 00 48 11 3A 19 0F 10 37 01 78 F9 39 19 01 78 F9 39 19 00 
    //D0 10 3A 19 07 B9 00 81 2D 00 B0 12 3A 19 16 43 B0 81 39 19 B8 2A 00 00 16 04 00 D0 10 3A 19 04 
    //00 38 12 3A 19 04 0B 47 
  }


  function int AddSong(string SongFileName,optional bool bSkipNotification) {
    local Stream NewStream;
    local byte Type;
    local int i;
    if (SongFileName == "") {                                                   //0000 : 07 12 00 7A 00 50 14 3A 19 1F 00 16 
      return -1;                                                                //000C : 04 1D FF FF FF FF 
    }
    Type = static.ConvertToFileType(SongFileName);                              //0012 : 0F 00 D0 15 3A 19 1C 70 84 38 19 00 50 14 3A 19 16 
    if (Type == 4) {                                                            //0023 : 07 95 00 9A 39 3A 00 D0 15 3A 19 39 3A 24 04 16 
      NewStream = CreateStream(SongFileName);                                   //0033 : 0F 00 48 16 3A 19 1B 03 2B 00 00 00 50 14 3A 19 16 
      if (NewStream == None) {                                                  //0044 : 07 55 00 72 00 48 16 3A 19 2A 16 
        return -1;                                                              //004F : 04 1D FF FF FF FF 
      }
      i = AddStream(GetPlaylistLength(),NewStream,bSkipNotification);           //0055 : 0F 00 C0 16 3A 19 1B 1C 2B 00 00 1B 83 2A 00 00 16 00 48 16 3A 19 2D 00 38 17 3A 19 16 
      bNeedSave = bNeedSave || ValidStreamIndex(i);                             //0072 : 14 2D 01 80 CD 39 19 84 2D 01 80 CD 39 19 18 0C 00 1B 76 2A 00 00 00 C0 16 3A 19 16 16 
      return i;                                                                 //008F : 04 00 C0 16 3A 19 
    }
    return -1;                                                                  //0095 : 04 1D FF FF FF FF 
    //07 12 00 7A 00 50 14 3A 19 1F 00 16 04 1D FF FF FF FF 0F 00 D0 15 3A 19 1C 70 84 38 19 00 50 14 
    //3A 19 16 07 95 00 9A 39 3A 00 D0 15 3A 19 39 3A 24 04 16 0F 00 48 16 3A 19 1B 03 2B 00 00 00 50 
    //14 3A 19 16 07 55 00 72 00 48 16 3A 19 2A 16 04 1D FF FF FF FF 0F 00 C0 16 3A 19 1B 1C 2B 00 00 
    //1B 83 2A 00 00 16 00 48 16 3A 19 2D 00 38 17 3A 19 16 14 2D 01 80 CD 39 19 84 2D 01 80 CD 39 19 
    //18 0C 00 1B 76 2A 00 00 00 C0 16 3A 19 16 16 04 00 C0 16 3A 19 04 1D FF FF FF FF 04 0B 47 
  }


  function Stream CreateStream(string fileName) {
    if (fileName == "") {                                                       //0000 : 07 0E 00 7A 00 D8 18 3A 19 1F 00 16 
      return None;                                                              //000C : 04 2A 
    }
    return FileManager.CreateStream(fileName);                                  //000E : 04 19 01 D0 F0 39 19 0B 00 04 1C A8 E1 38 19 00 D8 18 3A 19 16 
    //07 0E 00 7A 00 D8 18 3A 19 1F 00 16 04 2A 04 19 01 D0 F0 39 19 0B 00 04 1C A8 E1 38 19 00 D8 18 
    //3A 19 16 04 0B 47 
  }


  function bool LoadPlaylist() {
    local int i;
    ClearPlaylist();                                                            //0000 : 1B 1A 2B 00 00 16 
    i = 0;                                                                      //0006 : 0F 00 80 1C 3A 19 25 
    while (i < Playlist.Length) {                                               //000D : 07 AC 00 96 00 80 1C 3A 19 37 01 F8 CD 39 19 16 
      if (!FileManager.ValidFile(Playlist[i])) {                                //001D : 07 91 00 81 19 01 D0 F0 39 19 11 00 04 1C 00 D7 38 19 10 00 80 1C 3A 19 01 F8 CD 39 19 16 16 
        Log("Removing file from playlist '"
          $ GetTitle()
          $ "' - file not found",'MusicPlayer');//003C : E7 70 70 1F 52 65 6D 6F 76 69 6E 67 20 66 69 6C 65 20 66 72 6F 6D 20 70 6C 61 79 6C 69 73 74 20 27 00 1B 05 13 00 00 16 16 1F 27 20 2D 20 66 69 6C 65 20 6E 6F 74 20 66 6F 75 6E 64 00 16 21 4E 03 00 00 16 
        Playlist.Remove(i--,1);                                                 //0080 : 41 01 F8 CD 39 19 A6 00 80 1C 3A 19 16 26 
      } else {                                                                  //008E : 06 A2 00 
        AddSong(Playlist[i]);                                                   //0091 : 1B 05 2B 00 00 10 00 80 1C 3A 19 01 F8 CD 39 19 16 
      }
      i++;                                                                      //00A2 : A5 00 80 1C 3A 19 16 
    }
    ResetRandomPool();                                                          //00AC : 1B E6 2A 00 00 16 
    bNeedSave = False;                                                          //00B2 : 14 2D 01 80 CD 39 19 28 
    return True;                                                                //00BA : 04 27 
    //1B 1A 2B 00 00 16 0F 00 80 1C 3A 19 25 07 AC 00 96 00 80 1C 3A 19 37 01 F8 CD 39 19 16 07 91 00 
    //81 19 01 D0 F0 39 19 11 00 04 1C 00 D7 38 19 10 00 80 1C 3A 19 01 F8 CD 39 19 16 16 E7 70 70 1F 
    //52 65 6D 6F 76 69 6E 67 20 66 69 6C 65 20 66 72 6F 6D 20 70 6C 61 79 6C 69 73 74 20 27 00 1B 05 
    //13 00 00 16 16 1F 27 20 2D 20 66 69 6C 65 20 6E 6F 74 20 66 6F 75 6E 64 00 16 21 4E 03 00 00 16 
    //41 01 F8 CD 39 19 A6 00 80 1C 3A 19 16 26 06 A2 00 1B 05 2B 00 00 10 00 80 1C 3A 19 01 F8 CD 39 
    //19 16 A5 00 80 1C 3A 19 16 06 0D 00 1B E6 2A 00 00 16 14 2D 01 80 CD 39 19 28 04 27 04 0B 47 
  }


  function bool InitializePlaylist(StreamInterface InManager) {
    if (InManager == None || IsInitialized()) {                                 //0000 : 07 18 00 84 72 00 A8 1D 3A 19 2A 16 18 07 00 1B 0B 2C 00 00 16 16 
      return False;                                                             //0016 : 04 28 
    }
    FileManager = InManager;                                                    //0018 : 0F 01 D0 F0 39 19 00 A8 1D 3A 19 
    LoadPlaylist();                                                             //0023 : 1B 21 2B 00 00 16 
    return True;                                                                //0029 : 04 27 
    //07 18 00 84 72 00 A8 1D 3A 19 2A 16 18 07 00 1B 0B 2C 00 00 16 16 04 28 0F 01 D0 F0 39 19 00 A8 
    //1D 3A 19 1B 21 2B 00 00 16 04 27 04 0B 47 
  }


  delegate OnPlaylistChanged();



