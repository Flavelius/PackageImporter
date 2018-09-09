//==============================================================================
//  StreamPlaylistManager
//==============================================================================

class StreamPlaylistManager extends StreamBase
    dependsOn(StreamPlaylist,Stream,PlaylistParserBase,StreamInterface)
    Config(UPlaylists)
  ;

  struct PlaylistParser {
      var (PlaylistParser) byte Type;
      var (PlaylistParser) string ParserClass;

  };


  var (StreamPlaylistManager) config editconst int CurrentPlaylist;
  var (StreamPlaylistManager) editconst editinline StreamInterface FileManager;
  var (StreamPlaylistManager) editconstarray editinline array<StreamPlaylist> Playlists;
  var (StreamPlaylistManager) bool bDisableNotification;
  var (StreamPlaylistManager) transient bool bDirty;
  var (StreamPlaylistManager) config bool bShuffle;
  var (StreamPlaylistManager) config bool bShuffleAll;
  var (StreamPlaylistManager) config bool bRepeat;
  var (StreamPlaylistManager) config bool bRepeatAll;
  var (StreamPlaylistManager) localized string DefaultPlaylistName;
  var (StreamPlaylistManager) config array<PlaylistParser> ParserType;
  var (StreamPlaylistManager) editconstarray editconst editinline array<PlaylistParserBase> Parsers;
  var (null);


  function string GetCurrentTitle() {
    return Playlists[GetCurrentIndex()].GetTitle();                             //0000 : 04 19 10 1B 21 2C 00 00 16 01 D0 2F 39 19 06 00 00 1B 05 13 00 00 16 
    //04 19 10 1B 21 2C 00 00 16 01 D0 2F 39 19 06 00 00 1B 05 13 00 00 16 04 0B 47 
  }


  function Save() {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 F8 30 39 19 25 
    while (i < Playlists.Length) {                                              //0007 : 07 36 00 96 00 F8 30 39 19 37 01 D0 2F 39 19 16 
      Playlists[i].Save();                                                      //0017 : 19 10 00 F8 30 39 19 01 D0 2F 39 19 06 00 00 1B A0 2A 00 00 16 
      i++;                                                                      //002C : A5 00 F8 30 39 19 16 
    }
    if (!bDirty) {                                                              //0036 : 07 43 00 81 2D 01 08 32 39 19 16 
      return;                                                                   //0041 : 04 0B 
    }
    SaveConfig();                                                               //0043 : 62 18 16 
    bDirty = False;                                                             //0046 : 14 2D 01 08 32 39 19 28 
    //0F 00 F8 30 39 19 25 07 36 00 96 00 F8 30 39 19 37 01 D0 2F 39 19 16 19 10 00 F8 30 39 19 01 D0 
    //2F 39 19 06 00 00 1B A0 2A 00 00 16 A5 00 F8 30 39 19 16 06 07 00 07 43 00 81 2D 01 08 32 39 19 
    //16 04 0B 62 18 16 14 2D 01 08 32 39 19 28 04 0B 47 
  }


  function bool HandleDebugExec(string Command,string Param) {
    local int i;
    local bool Result;
    if (Super.HandleDebugExec(Command,Param)) {                                 //0000 : 07 15 00 1C A8 81 38 19 00 30 33 39 19 00 F8 35 39 19 16 
      return True;                                                              //0013 : 04 27 
    }
    switch (Locs(Command)) {                                                    //0015 : 05 00 EE 00 30 33 39 19 16 
      case "activate" :                                                         //001E : 0A A5 00 1F 61 63 74 69 76 61 74 65 00 
        if (Playlists.Length > 0) {                                             //002B : 07 41 00 97 37 01 D0 2F 39 19 25 16 
          ActivatePlaylist(0);                                                  //0037 : 1B 82 2A 00 00 25 16 
        } else {                                                                //003E : 06 4E 00 
          ActivatePlaylist(int(Param));                                         //0041 : 1B 82 2A 00 00 39 4A 00 F8 35 39 19 16 
        }
        Log("Active Playlist:"
          $ Playlists[CurrentPlaylist].GetTitle()
          @ "Tracks:"
          $ string(Playlists[CurrentPlaylist].GetPlaylistLength()),'MusicPlayer');//004E : E7 70 A8 70 1F 41 63 74 69 76 65 20 50 6C 61 79 6C 69 73 74 3A 00 19 10 01 70 36 39 19 01 D0 2F 39 19 06 00 00 1B 05 13 00 00 16 16 1F 54 72 61 63 6B 73 3A 00 16 39 53 19 10 01 70 36 39 19 01 D0 2F 39 19 06 00 04 1B 83 2A 00 00 16 16 21 4E 03 00 00 16 
        break;                                                                  //00A2 : 06 34 01 
      case "lists" :                                                            //00A5 : 0A 31 01 1F 6C 69 73 74 73 00 
        Log(" === All existing playlists === ",'MusicPlayer');                  //00AF : E7 1F 20 3D 3D 3D 20 41 6C 6C 20 65 78 69 73 74 69 6E 67 20 70 6C 61 79 6C 69 73 74 73 20 3D 3D 3D 20 00 21 4E 03 00 00 16 
        i = 0;                                                                  //00D8 : 0F 00 E8 36 39 19 25 
        while (i < Playlists.Length) {                                          //00DF : 07 31 01 96 00 E8 36 39 19 37 01 D0 2F 39 19 16 
          Log(" Playlist" @ string(i) @ " '" $ Playlists[i].GetTitle(),'MusicPlayer');//00EF : E7 70 A8 A8 1F 20 50 6C 61 79 6C 69 73 74 00 39 53 00 E8 36 39 19 16 1F 20 27 00 16 19 10 00 E8 36 39 19 01 D0 2F 39 19 06 00 00 1B 05 13 00 00 16 16 21 4E 03 00 00 16 
          i++;                                                                  //0127 : A5 00 E8 36 39 19 16 
        }
      default:                                                                  //0131 : 0A FF FF 
    }
    i = 0;                                                                      //0134 : 0F 00 E8 36 39 19 25 
    while (i < Playlists.Length) {                                              //013B : 07 86 01 96 00 E8 36 39 19 37 01 D0 2F 39 19 16 
      Result = Playlists[i].HandleDebugExec(Command,Param)
        || Result;   //014B : 14 2D 00 60 37 39 19 84 19 10 00 E8 36 39 19 01 D0 2F 39 19 10 00 04 1B D1 2A 00 00 00 30 33 39 19 00 F8 35 39 19 16 18 07 00 2D 00 60 37 39 19 16 
      i++;                                                                      //017C : A5 00 E8 36 39 19 16 
    }
    return Result;                                                              //0186 : 04 2D 00 60 37 39 19 
    //07 15 00 1C A8 81 38 19 00 30 33 39 19 00 F8 35 39 19 16 04 27 05 00 EE 00 30 33 39 19 16 0A A5 
    //00 1F 61 63 74 69 76 61 74 65 00 07 41 00 97 37 01 D0 2F 39 19 25 16 1B 82 2A 00 00 25 16 06 4E 
    //00 1B 82 2A 00 00 39 4A 00 F8 35 39 19 16 E7 70 A8 70 1F 41 63 74 69 76 65 20 50 6C 61 79 6C 69 
    //73 74 3A 00 19 10 01 70 36 39 19 01 D0 2F 39 19 06 00 00 1B 05 13 00 00 16 16 1F 54 72 61 63 6B 
    //73 3A 00 16 39 53 19 10 01 70 36 39 19 01 D0 2F 39 19 06 00 04 1B 83 2A 00 00 16 16 21 4E 03 00 
    //00 16 06 34 01 0A 31 01 1F 6C 69 73 74 73 00 E7 1F 20 3D 3D 3D 20 41 6C 6C 20 65 78 69 73 74 69 
    //6E 67 20 70 6C 61 79 6C 69 73 74 73 20 3D 3D 3D 20 00 21 4E 03 00 00 16 0F 00 E8 36 39 19 25 07 
    //31 01 96 00 E8 36 39 19 37 01 D0 2F 39 19 16 E7 70 A8 A8 1F 20 50 6C 61 79 6C 69 73 74 00 39 53 
    //00 E8 36 39 19 16 1F 20 27 00 16 19 10 00 E8 36 39 19 01 D0 2F 39 19 06 00 00 1B 05 13 00 00 16 
    //16 21 4E 03 00 00 16 A5 00 E8 36 39 19 16 06 DF 00 0A FF FF 0F 00 E8 36 39 19 25 07 86 01 96 00 
    //E8 36 39 19 37 01 D0 2F 39 19 16 14 2D 00 60 37 39 19 84 19 10 00 E8 36 39 19 01 D0 2F 39 19 10 
    //00 04 1B D1 2A 00 00 00 30 33 39 19 00 F8 35 39 19 16 18 07 00 2D 00 60 37 39 19 16 A5 00 E8 36 
    //39 19 16 06 3B 01 04 2D 00 60 37 39 19 04 0B 47 
  }


  protected function StreamPlaylist CreatePlaylist(string PlaylistName) {
    local StreamPlaylist List;
    if (PlaylistName == "") {                                                   //0000 : 07 0E 00 7A 00 00 39 39 19 1F 00 16 
      return None;                                                              //000C : 04 2A 
    }
    List = new (None,Repl(PlaylistName," ",Chr(27))) Class'StreamPlaylist';     //000E : 0F 00 78 39 39 19 11 2A C9 00 00 39 39 19 1F 20 00 EC 2C 1B 16 16 0B 20 F0 39 39 19 
    if (List != None) {                                                         //002A : 07 61 00 77 00 78 39 39 19 2A 16 
      List.SetTitle(Repl(PlaylistName,Chr(27)," "));                            //0035 : 19 00 78 39 39 19 14 00 04 1B 0A 2C 00 00 C9 00 00 39 39 19 EC 2C 1B 16 1F 20 00 16 16 
      List.Save();                                                              //0052 : 19 00 78 39 39 19 06 00 00 1B A0 2A 00 00 16 
    }
    return List;                                                                //0061 : 04 00 78 39 39 19 
    //07 0E 00 7A 00 00 39 39 19 1F 00 16 04 2A 0F 00 78 39 39 19 11 2A C9 00 00 39 39 19 1F 20 00 EC 
    //2C 1B 16 16 0B 20 F0 39 39 19 07 61 00 77 00 78 39 39 19 2A 16 19 00 78 39 39 19 14 00 04 1B 0A 
    //2C 00 00 C9 00 00 39 39 19 EC 2C 1B 16 1F 20 00 16 16 19 00 78 39 39 19 06 00 00 1B A0 2A 00 00 
    //16 04 00 78 39 39 19 04 0B 47 
  }


  function SetRepeatAll(bool bEnable) {
    bDirty = bDirty || bEnable != bRepeatAll;                                   //0000 : 14 2D 01 08 32 39 19 84 2D 01 08 32 39 19 18 0F 00 F3 2D 00 58 40 39 19 2D 01 60 41 39 19 16 16 
    bRepeatAll = bEnable;                                                       //0020 : 14 2D 01 60 41 39 19 2D 00 58 40 39 19 
    if (bEnable && bRepeat) {                                                   //002D : 07 48 00 82 2D 00 58 40 39 19 18 07 00 2D 01 D8 41 39 19 16 
      SetRepeat(False);                                                         //0041 : 1B 2C 2C 00 00 28 16 
    }
    //14 2D 01 08 32 39 19 84 2D 01 08 32 39 19 18 0F 00 F3 2D 00 58 40 39 19 2D 01 60 41 39 19 16 16 
    //14 2D 01 60 41 39 19 2D 00 58 40 39 19 07 48 00 82 2D 00 58 40 39 19 18 07 00 2D 01 D8 41 39 19 
    //16 1B 2C 2C 00 00 28 16 04 0B 47 
  }


  function SetRepeat(bool bEnable) {
    bDirty = bDirty || bEnable != bRepeat;                                      //0000 : 14 2D 01 08 32 39 19 84 2D 01 08 32 39 19 18 0F 00 F3 2D 00 00 43 39 19 2D 01 D8 41 39 19 16 16 
    bRepeat = bEnable;                                                          //0020 : 14 2D 01 D8 41 39 19 2D 00 00 43 39 19 
    if (bEnable && bRepeatAll) {                                                //002D : 07 48 00 82 2D 00 00 43 39 19 18 07 00 2D 01 60 41 39 19 16 
      SetRepeatAll(False);                                                      //0041 : 1B 2D 2C 00 00 28 16 
    }
    //14 2D 01 08 32 39 19 84 2D 01 08 32 39 19 18 0F 00 F3 2D 00 00 43 39 19 2D 01 D8 41 39 19 16 16 
    //14 2D 01 D8 41 39 19 2D 00 00 43 39 19 07 48 00 82 2D 00 00 43 39 19 18 07 00 2D 01 60 41 39 19 
    //16 1B 2D 2C 00 00 28 16 04 0B 47 
  }


  function SetShuffleAll(bool bEnable) {
    bDirty = bDirty || bEnable != bShuffleAll;                                  //0000 : 14 2D 01 08 32 39 19 84 2D 01 08 32 39 19 18 0F 00 F3 2D 00 B8 44 39 19 2D 01 C0 45 39 19 16 16 
    bShuffleAll = bEnable;                                                      //0020 : 14 2D 01 C0 45 39 19 2D 00 B8 44 39 19 
    if (bEnable && bShuffle) {                                                  //002D : 07 48 00 82 2D 00 B8 44 39 19 18 07 00 2D 01 38 46 39 19 16 
      SetShuffle(False);                                                        //0041 : 1B 2A 2C 00 00 28 16 
    }
    //14 2D 01 08 32 39 19 84 2D 01 08 32 39 19 18 0F 00 F3 2D 00 B8 44 39 19 2D 01 C0 45 39 19 16 16 
    //14 2D 01 C0 45 39 19 2D 00 B8 44 39 19 07 48 00 82 2D 00 B8 44 39 19 18 07 00 2D 01 38 46 39 19 
    //16 1B 2A 2C 00 00 28 16 04 0B 47 
  }


  function SetShuffle(bool bEnable) {
    bDirty = bDirty || bEnable != bShuffle;                                     //0000 : 14 2D 01 08 32 39 19 84 2D 01 08 32 39 19 18 0F 00 F3 2D 00 60 47 39 19 2D 01 38 46 39 19 16 16 
    bShuffle = bEnable;                                                         //0020 : 14 2D 01 38 46 39 19 2D 00 60 47 39 19 
    if (bEnable && bShuffleAll) {                                               //002D : 07 48 00 82 2D 00 60 47 39 19 18 07 00 2D 01 C0 45 39 19 16 
      SetShuffleAll(False);                                                     //0041 : 1B 2B 2C 00 00 28 16 
    }
    //14 2D 01 08 32 39 19 84 2D 01 08 32 39 19 18 0F 00 F3 2D 00 60 47 39 19 2D 01 38 46 39 19 16 16 
    //14 2D 01 38 46 39 19 2D 00 60 47 39 19 07 48 00 82 2D 00 60 47 39 19 18 07 00 2D 01 C0 45 39 19 
    //16 1B 2B 2C 00 00 28 16 04 0B 47 
  }


  function bool GetRepeatAll() {
    return bRepeatAll;                                                          //0000 : 04 2D 01 60 41 39 19 
    //04 2D 01 60 41 39 19 04 0B 47 
  }


  function bool GetRepeat() {
    return bRepeat;                                                             //0000 : 04 2D 01 D8 41 39 19 
    //04 2D 01 D8 41 39 19 04 0B 47 
  }


  function bool GetShuffleAll() {
    return bShuffleAll;                                                         //0000 : 04 2D 01 C0 45 39 19 
    //04 2D 01 C0 45 39 19 04 0B 47 
  }


  function bool GetShuffle() {
    return bShuffle;                                                            //0000 : 04 2D 01 38 46 39 19 
    //04 2D 01 38 46 39 19 04 0B 47 
  }


  function bool ValidName(string Test) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 30 4E 39 19 25 
    while (i < Playlists.Length) {                                              //0007 : 07 42 00 96 00 30 4E 39 19 37 01 D0 2F 39 19 16 
      if (Test ~= Playlists[i].GetTitle()) {                                    //0017 : 07 38 00 7C 00 B8 4D 39 19 19 10 00 30 4E 39 19 01 D0 2F 39 19 06 00 00 1B 05 13 00 00 16 16 
        return True;                                                            //0036 : 04 27 
      }
      i++;                                                                      //0038 : A5 00 30 4E 39 19 16 
    }
    return False;                                                               //0042 : 04 28 
    //0F 00 30 4E 39 19 25 07 42 00 96 00 30 4E 39 19 37 01 D0 2F 39 19 16 07 38 00 7C 00 B8 4D 39 19 
    //19 10 00 30 4E 39 19 01 D0 2F 39 19 06 00 00 1B 05 13 00 00 16 16 04 27 A5 00 30 4E 39 19 16 06 
    //07 00 04 28 04 0B 47 
  }


  function int FindPlaylistIndex(StreamPlaylist Playlist) {
    local int i;
    if (Playlist == None) {                                                     //0000 : 07 11 00 72 00 D0 4F 39 19 2A 16 
      return -1;                                                                //000B : 04 1D FF FF FF FF 
    }
    i = 0;                                                                      //0011 : 0F 00 E8 50 39 19 25 
    while (i < Playlists.Length) {                                              //0018 : 07 4D 00 96 00 E8 50 39 19 37 01 D0 2F 39 19 16 
      if (Playlists[i] == Playlist) {                                           //0028 : 07 43 00 72 10 00 E8 50 39 19 01 D0 2F 39 19 00 D0 4F 39 19 16 
        return i;                                                               //003D : 04 00 E8 50 39 19 
      }
      i++;                                                                      //0043 : A5 00 E8 50 39 19 16 
    }
    return -1;                                                                  //004D : 04 1D FF FF FF FF 
    //07 11 00 72 00 D0 4F 39 19 2A 16 04 1D FF FF FF FF 0F 00 E8 50 39 19 25 07 4D 00 96 00 E8 50 39 
    //19 37 01 D0 2F 39 19 16 07 43 00 72 10 00 E8 50 39 19 01 D0 2F 39 19 00 D0 4F 39 19 16 04 00 E8 
    //50 39 19 A5 00 E8 50 39 19 16 06 18 00 04 1D FF FF FF FF 04 0B 47 
  }


  function int FindNameIndex(string PlaylistName) {
    local int i;
    if (PlaylistName == "") {                                                   //0000 : 07 12 00 7A 00 88 52 39 19 1F 00 16 
      return -1;                                                                //000C : 04 1D FF FF FF FF 
    }
    i = 0;                                                                      //0012 : 0F 00 B0 53 39 19 25 
    while (i < Playlists.Length) {                                              //0019 : 07 58 00 96 00 B0 53 39 19 37 01 D0 2F 39 19 16 
      if (Playlists[i].GetTitle() ~= PlaylistName) {                            //0029 : 07 4E 00 7C 19 10 00 B0 53 39 19 01 D0 2F 39 19 06 00 00 1B 05 13 00 00 16 00 88 52 39 19 16 
        return i;                                                               //0048 : 04 00 B0 53 39 19 
      }
      i++;                                                                      //004E : A5 00 B0 53 39 19 16 
    }
    return -1;                                                                  //0058 : 04 1D FF FF FF FF 
    //07 12 00 7A 00 88 52 39 19 1F 00 16 04 1D FF FF FF FF 0F 00 B0 53 39 19 25 07 58 00 96 00 B0 53 
    //39 19 37 01 D0 2F 39 19 16 07 4E 00 7C 19 10 00 B0 53 39 19 01 D0 2F 39 19 06 00 00 1B 05 13 00 
    //00 16 00 88 52 39 19 16 04 00 B0 53 39 19 A5 00 B0 53 39 19 16 06 19 00 04 1D FF FF FF FF 04 0B 
    //47 
  }


  function bool ValidIndex(int Index) {
    return Index >= 0 && Index < Playlists.Length;                              //0000 : 04 82 99 00 50 55 39 19 25 16 18 0E 00 96 00 50 55 39 19 37 01 D0 2F 39 19 16 16 
    //04 82 99 00 50 55 39 19 25 16 18 0E 00 96 00 50 55 39 19 37 01 D0 2F 39 19 16 16 04 0B 47 
  }


  function int GetPlaylistCount() {
    return Playlists.Length;                                                    //0000 : 04 37 01 D0 2F 39 19 
    //04 37 01 D0 2F 39 19 04 0B 47 
  }


  function StreamPlaylist GetPlaylistAt(int idx) {
    if (!ValidIndex(idx)) {                                                     //0000 : 07 12 00 81 1B 79 2A 00 00 00 18 58 39 19 16 16 
      return None;                                                              //0010 : 04 2A 
    }
    return Playlists[idx];                                                      //0012 : 04 10 00 18 58 39 19 01 D0 2F 39 19 
    //07 12 00 81 1B 79 2A 00 00 00 18 58 39 19 16 16 04 2A 04 10 00 18 58 39 19 01 D0 2F 39 19 04 0B 
    //47 
  }


  function StreamPlaylist GetRandomPlaylist() {
    local int i;
    local int idx;
    if (Playlists.Length == 0) {                                                //0000 : 07 0E 00 9A 37 01 D0 2F 39 19 25 16 
      return None;                                                              //000C : 04 2A 
    }
    idx = Rand(Playlists.Length - 1);                                           //000E : 0F 00 E0 5A 39 19 A7 93 37 01 D0 2F 39 19 26 16 16 
    while (++i < 10) {                                                          //001F : 07 5B 00 96 A3 00 58 5B 39 19 16 2C 0A 16 
      if (ActivatePlaylist(idx)) {                                              //002D : 07 47 00 1B 82 2A 00 00 00 E0 5A 39 19 16 
        return Playlists[CurrentPlaylist];                                      //003B : 04 10 01 70 36 39 19 01 D0 2F 39 19 
      }
      idx = Rand(Playlists.Length - 1);                                         //0047 : 0F 00 E0 5A 39 19 A7 93 37 01 D0 2F 39 19 26 16 16 
    }
    return None;                                                                //005B : 04 2A 
    //07 0E 00 9A 37 01 D0 2F 39 19 25 16 04 2A 0F 00 E0 5A 39 19 A7 93 37 01 D0 2F 39 19 26 16 16 07 
    //5B 00 96 A3 00 58 5B 39 19 16 2C 0A 16 07 47 00 1B 82 2A 00 00 00 E0 5A 39 19 16 04 10 01 70 36 
    //39 19 01 D0 2F 39 19 0F 00 E0 5A 39 19 A7 93 37 01 D0 2F 39 19 26 16 16 06 1F 00 04 2A 04 0B 47 
    //
  }


  function StreamPlaylist GetCurrentPlaylist() {
    if (ValidIndex(CurrentPlaylist)) {                                          //0000 : 07 1A 00 1B 79 2A 00 00 01 70 36 39 19 16 
      return Playlists[CurrentPlaylist];                                        //000E : 04 10 01 70 36 39 19 01 D0 2F 39 19 
    }
    if (ActivatePlaylist(0)) {                                                  //001A : 07 2C 00 1B 82 2A 00 00 25 16 
      return Playlists[0];                                                      //0024 : 04 10 25 01 D0 2F 39 19 
    }
    return CreateDefaultPlaylist();                                             //002C : 04 1B 34 2B 00 00 16 
    //07 1A 00 1B 79 2A 00 00 01 70 36 39 19 16 04 10 01 70 36 39 19 01 D0 2F 39 19 07 2C 00 1B 82 2A 
    //00 00 25 16 04 10 25 01 D0 2F 39 19 04 1B 34 2B 00 00 16 04 0B 47 
  }


  function int GetCurrentIndex() {
    if (ValidIndex(CurrentPlaylist)) {                                          //0000 : 07 14 00 1B 79 2A 00 00 01 70 36 39 19 16 
      return CurrentPlaylist;                                                   //000E : 04 01 70 36 39 19 
    }
    return -1;                                                                  //0014 : 04 1D FF FF FF FF 
    //07 14 00 1B 79 2A 00 00 01 70 36 39 19 16 04 01 70 36 39 19 04 1D FF FF FF FF 04 0B 47 
  }


  function string GetRandomSong() {
    local StreamPlaylist List;
    if (GetShuffle()) {                                                         //0000 : 07 18 00 1B 0B 2B 00 00 16 
      List = GetCurrentPlaylist();                                              //0009 : 0F 00 58 60 39 19 1B 07 2B 00 00 16 
    } else {                                                                    //0015 : 06 2D 00 
      if (GetShuffleAll()) {                                                    //0018 : 07 2D 00 1B 0C 2B 00 00 16 
        List = GetRandomPlaylist();                                             //0021 : 0F 00 58 60 39 19 1B 23 2C 00 00 16 
      }
    }
    if (List != None) {                                                         //002D : 07 48 00 77 00 58 60 39 19 2A 16 
      return List.GetRandomSong();                                              //0038 : 04 19 00 58 60 39 19 06 00 00 1B CE 2A 00 00 16 
    }
    return "";                                                                  //0048 : 04 1F 00 
    //07 18 00 1B 0B 2B 00 00 16 0F 00 58 60 39 19 1B 07 2B 00 00 16 06 2D 00 07 2D 00 1B 0C 2B 00 00 
    //16 0F 00 58 60 39 19 1B 23 2C 00 00 16 07 48 00 77 00 58 60 39 19 2A 16 04 19 00 58 60 39 19 06 
    //00 00 1B CE 2A 00 00 16 04 1F 00 04 0B 47 
  }


  function string PrevSong(optional bool bForce) {
    local StreamPlaylist List;
    local Stream s;
    local string str;
    if (GetShuffleAll() || GetShuffle()) {                                      //0000 : 07 1B 00 84 1B 0C 2B 00 00 16 18 07 00 1B 0B 2B 00 00 16 16 
      return GetRandomSong();                                                   //0014 : 04 1B CE 2A 00 00 16 
    }
    List = GetCurrentPlaylist();                                                //001B : 0F 00 F8 61 39 19 1B 07 2B 00 00 16 
    if (List == None) {                                                         //0027 : 07 6E 00 72 00 F8 61 39 19 2A 16 
      Log("PlaylistManager.PrevSong() - no playlists found!",'MusicPlayer');    //0032 : E7 1F 50 6C 61 79 6C 69 73 74 4D 61 6E 61 67 65 72 2E 50 72 65 76 53 6F 6E 67 28 29 20 2D 20 6E 6F 20 70 6C 61 79 6C 69 73 74 73 20 66 6F 75 6E 64 21 00 21 4E 03 00 00 16 
      return "";                                                                //006B : 04 1F 00 
    }
    if (GetRepeat()) {                                                          //006E : 07 AA 00 1B E4 2A 00 00 16 
      s = List.GetCurrentStream();                                              //0077 : 0F 00 70 62 39 19 19 00 F8 61 39 19 06 00 04 1B 01 2B 00 00 16 
      if (s != None) {                                                          //008C : 07 A7 00 77 00 70 62 39 19 2A 16 
        return s.GetPath();                                                     //0097 : 04 19 00 70 62 39 19 06 00 00 1B 92 2A 00 00 16 
      }
    } else {                                                                    //00A7 : 06 2D 01 
      str = List.PrevSong(bForce || GetRepeat());                               //00AA : 0F 00 E8 62 39 19 19 00 F8 61 39 19 17 00 00 1B C1 2A 00 00 84 2D 00 80 61 39 19 18 07 00 1B E4 2A 00 00 16 16 16 
      if (str == "" && GetRepeatAll()
        && ActivatePlaylist(CurrentPlaylist - 1)) {//00D0 : 07 1B 01 82 82 7A 00 E8 62 39 19 1F 00 16 18 07 00 1B 09 2B 00 00 16 16 18 0F 00 1B 82 2A 00 00 93 01 70 36 39 19 26 16 16 16 
        str = Playlists[CurrentPlaylist].PrevSong(bForce);                      //00FA : 0F 00 E8 62 39 19 19 10 01 70 36 39 19 01 D0 2F 39 19 0C 00 00 1B C1 2A 00 00 2D 00 80 61 39 19 16 
      }
      if (str != "") {                                                          //011B : 07 2D 01 7B 00 E8 62 39 19 1F 00 16 
        return str;                                                             //0127 : 04 00 E8 62 39 19 
      }
    }
    return "";                                                                  //012D : 04 1F 00 
    //07 1B 00 84 1B 0C 2B 00 00 16 18 07 00 1B 0B 2B 00 00 16 16 04 1B CE 2A 00 00 16 0F 00 F8 61 39 
    //19 1B 07 2B 00 00 16 07 6E 00 72 00 F8 61 39 19 2A 16 E7 1F 50 6C 61 79 6C 69 73 74 4D 61 6E 61 
    //67 65 72 2E 50 72 65 76 53 6F 6E 67 28 29 20 2D 20 6E 6F 20 70 6C 61 79 6C 69 73 74 73 20 66 6F 
    //75 6E 64 21 00 21 4E 03 00 00 16 04 1F 00 07 AA 00 1B E4 2A 00 00 16 0F 00 70 62 39 19 19 00 F8 
    //61 39 19 06 00 04 1B 01 2B 00 00 16 07 A7 00 77 00 70 62 39 19 2A 16 04 19 00 70 62 39 19 06 00 
    //00 1B 92 2A 00 00 16 06 2D 01 0F 00 E8 62 39 19 19 00 F8 61 39 19 17 00 00 1B C1 2A 00 00 84 2D 
    //00 80 61 39 19 18 07 00 1B E4 2A 00 00 16 16 16 07 1B 01 82 82 7A 00 E8 62 39 19 1F 00 16 18 07 
    //00 1B 09 2B 00 00 16 16 18 0F 00 1B 82 2A 00 00 93 01 70 36 39 19 26 16 16 16 0F 00 E8 62 39 19 
    //19 10 01 70 36 39 19 01 D0 2F 39 19 0C 00 00 1B C1 2A 00 00 2D 00 80 61 39 19 16 07 2D 01 7B 00 
    //E8 62 39 19 1F 00 16 04 00 E8 62 39 19 04 1F 00 04 0B 47 
  }


  function string NextSong(optional bool bForce) {
    local StreamPlaylist List;
    local Stream s;
    local string str;
    if (GetShuffleAll() || GetShuffle()) {                                      //0000 : 07 1B 00 84 1B 0C 2B 00 00 16 18 07 00 1B 0B 2B 00 00 16 16 
      return GetRandomSong();                                                   //0014 : 04 1B CE 2A 00 00 16 
    }
    List = GetCurrentPlaylist();                                                //001B : 0F 00 D0 66 39 19 1B 07 2B 00 00 16 
    if (List == None) {                                                         //0027 : 07 6E 00 72 00 D0 66 39 19 2A 16 
      Log("PlaylistManager.NextSong() - no playlists found!",'MusicPlayer');    //0032 : E7 1F 50 6C 61 79 6C 69 73 74 4D 61 6E 61 67 65 72 2E 4E 65 78 74 53 6F 6E 67 28 29 20 2D 20 6E 6F 20 70 6C 61 79 6C 69 73 74 73 20 66 6F 75 6E 64 21 00 21 4E 03 00 00 16 
      return "";                                                                //006B : 04 1F 00 
    }
    if (GetRepeat()) {                                                          //006E : 07 AA 00 1B E4 2A 00 00 16 
      s = List.GetCurrentStream();                                              //0077 : 0F 00 48 67 39 19 19 00 D0 66 39 19 06 00 04 1B 01 2B 00 00 16 
      if (s != None) {                                                          //008C : 07 A7 00 77 00 48 67 39 19 2A 16 
        return s.GetPath();                                                     //0097 : 04 19 00 48 67 39 19 06 00 00 1B 92 2A 00 00 16 
      }
    } else {                                                                    //00A7 : 06 2D 01 
      str = List.NextSong(bForce || GetRepeat());                               //00AA : 0F 00 C0 67 39 19 19 00 D0 66 39 19 17 00 00 1B A4 2A 00 00 84 2D 00 88 64 39 19 18 07 00 1B E4 2A 00 00 16 16 16 
      if (str == "" && GetRepeatAll()
        && ActivatePlaylist(CurrentPlaylist + 1)) {//00D0 : 07 1B 01 82 82 7A 00 C0 67 39 19 1F 00 16 18 07 00 1B 09 2B 00 00 16 16 18 0F 00 1B 82 2A 00 00 92 01 70 36 39 19 26 16 16 16 
        str = Playlists[CurrentPlaylist].NextSong(bForce);                      //00FA : 0F 00 C0 67 39 19 19 10 01 70 36 39 19 01 D0 2F 39 19 0C 00 00 1B A4 2A 00 00 2D 00 88 64 39 19 16 
      }
      if (str != "") {                                                          //011B : 07 2D 01 7B 00 C0 67 39 19 1F 00 16 
        return str;                                                             //0127 : 04 00 C0 67 39 19 
      }
    }
    return "";                                                                  //012D : 04 1F 00 
    //07 1B 00 84 1B 0C 2B 00 00 16 18 07 00 1B 0B 2B 00 00 16 16 04 1B CE 2A 00 00 16 0F 00 D0 66 39 
    //19 1B 07 2B 00 00 16 07 6E 00 72 00 D0 66 39 19 2A 16 E7 1F 50 6C 61 79 6C 69 73 74 4D 61 6E 61 
    //67 65 72 2E 4E 65 78 74 53 6F 6E 67 28 29 20 2D 20 6E 6F 20 70 6C 61 79 6C 69 73 74 73 20 66 6F 
    //75 6E 64 21 00 21 4E 03 00 00 16 04 1F 00 07 AA 00 1B E4 2A 00 00 16 0F 00 48 67 39 19 19 00 D0 
    //66 39 19 06 00 04 1B 01 2B 00 00 16 07 A7 00 77 00 48 67 39 19 2A 16 04 19 00 48 67 39 19 06 00 
    //00 1B 92 2A 00 00 16 06 2D 01 0F 00 C0 67 39 19 19 00 D0 66 39 19 17 00 00 1B A4 2A 00 00 84 2D 
    //00 88 64 39 19 18 07 00 1B E4 2A 00 00 16 16 16 07 1B 01 82 82 7A 00 C0 67 39 19 1F 00 16 18 07 
    //00 1B 09 2B 00 00 16 16 18 0F 00 1B 82 2A 00 00 92 01 70 36 39 19 26 16 16 16 0F 00 C0 67 39 19 
    //19 10 01 70 36 39 19 01 D0 2F 39 19 0C 00 00 1B A4 2A 00 00 2D 00 88 64 39 19 16 07 2D 01 7B 00 
    //C0 67 39 19 1F 00 16 04 00 C0 67 39 19 04 1F 00 04 0B 47 
  }


  function bool ImportPlaylist(int PlaylistIndex,int InsertPosition,string Path) {
    local int i;
    local byte Type;
    Type = GetPlaylistType(Path);                                               //0000 : 0F 00 B0 6A 39 19 1B 1D 2C 00 00 00 28 6B 39 19 16 
    i = 0;                                                                      //0011 : 0F 00 A0 6B 39 19 25 
    while (i < Parsers.Length) {                                                //0018 : 07 7A 00 96 00 A0 6B 39 19 37 01 18 6C 39 19 16 
      if (Parsers[i].GetType() == Type) {                                       //0028 : 07 70 00 9A 39 3A 19 10 00 A0 6B 39 19 01 18 6C 39 19 06 00 01 1B 26 2B 00 00 16 39 3A 00 B0 6A 39 19 16 
        return Parsers[i].Import(PlaylistIndex,InsertPosition,Path);            //004B : 04 19 10 00 A0 6B 39 19 01 18 6C 39 19 15 00 04 1B D2 02 00 00 00 60 69 39 19 00 90 6C 39 19 00 28 6B 39 19 16 
      }
      i++;                                                                      //0070 : A5 00 A0 6B 39 19 16 
    }
    return False;                                                               //007A : 04 28 
    //0F 00 B0 6A 39 19 1B 1D 2C 00 00 00 28 6B 39 19 16 0F 00 A0 6B 39 19 25 07 7A 00 96 00 A0 6B 39 
    //19 37 01 18 6C 39 19 16 07 70 00 9A 39 3A 19 10 00 A0 6B 39 19 01 18 6C 39 19 06 00 01 1B 26 2B 
    //00 00 16 39 3A 00 B0 6A 39 19 16 04 19 10 00 A0 6B 39 19 01 18 6C 39 19 15 00 04 1B D2 02 00 00 
    //00 60 69 39 19 00 90 6C 39 19 00 28 6B 39 19 16 A5 00 A0 6B 39 19 16 06 18 00 04 28 04 0B 47 
  }


  function bool AddDirectory(int PlaylistIndex,int InsertPosition,string Path,bool bRecurseDirectories) {
    local int i;
    local bool bValue;
    local array<string> Results;
    if (bRecurseDirectories) {                                                  //0000 : 07 88 00 2D 00 C0 70 39 19 
      if (FileManager.GetDirectoryContents(Results,Path,1)) {                   //0009 : 07 88 00 19 01 38 71 39 19 12 00 04 1C B0 D7 38 19 00 B0 71 39 19 00 28 72 39 19 24 01 16 
        i = Results.Length - 1;                                                 //0027 : 0F 00 A0 72 39 19 93 37 00 B0 71 39 19 26 16 
        while (i >= 0) {                                                        //0036 : 07 88 00 99 00 A0 72 39 19 25 16 
          bValue = AddDirectory(PlaylistIndex,InsertPosition,Path $ Results[i] $ static.GetPathSeparator(),True)
            || bValue;//0041 : 14 2D 00 18 73 39 19 84 1B 42 2B 00 00 00 30 6E 39 19 00 90 73 39 19 70 70 00 28 72 39 19 10 00 A0 72 39 19 00 B0 71 39 19 16 1C 78 95 38 19 16 16 27 16 18 07 00 2D 00 18 73 39 19 16 
          i--;                                                                  //007E : A6 00 A0 72 39 19 16 
        }
      }
    }
    Results.Remove(0,Results.Length);                                           //0088 : 41 00 B0 71 39 19 25 37 00 B0 71 39 19 
    if (FileManager.GetDirectoryContents(Results,Path,4)) {                     //0095 : 07 5C 01 19 01 38 71 39 19 12 00 04 1C B0 D7 38 19 00 B0 71 39 19 00 28 72 39 19 24 04 16 
      if (!Playlists[PlaylistIndex].ValidStreamIndex(InsertPosition)) {         //00B3 : 07 ED 00 81 19 10 00 30 6E 39 19 01 D0 2F 39 19 0B 00 04 1B 76 2A 00 00 00 90 73 39 19 16 16 
        InsertPosition = Playlists[PlaylistIndex].GetPlaylistLength();          //00D2 : 0F 00 90 73 39 19 19 10 00 30 6E 39 19 01 D0 2F 39 19 06 00 04 1B 83 2A 00 00 16 
      }
      i = Results.Length - 1;                                                   //00ED : 0F 00 A0 72 39 19 93 37 00 B0 71 39 19 26 16 
      while (i >= 0) {                                                          //00FC : 07 5C 01 99 00 A0 72 39 19 25 16 
        bValue = Playlists[PlaylistIndex].InsertSong(InsertPosition,Path $ Results[i],bDisableNotification) != -1
          || bValue;//0107 : 14 2D 00 18 73 39 19 84 9B 19 10 00 30 6E 39 19 01 D0 2F 39 19 23 00 04 1B 1B 2B 00 00 00 90 73 39 19 70 00 28 72 39 19 10 00 A0 72 39 19 00 B0 71 39 19 16 2D 01 08 74 39 19 16 1D FF FF FF FF 16 18 07 00 2D 00 18 73 39 19 16 
        i--;                                                                    //0152 : A6 00 A0 72 39 19 16 
      }
    }
    return bValue;                                                              //015C : 04 2D 00 18 73 39 19 
    //07 88 00 2D 00 C0 70 39 19 07 88 00 19 01 38 71 39 19 12 00 04 1C B0 D7 38 19 00 B0 71 39 19 00 
    //28 72 39 19 24 01 16 0F 00 A0 72 39 19 93 37 00 B0 71 39 19 26 16 07 88 00 99 00 A0 72 39 19 25 
    //16 14 2D 00 18 73 39 19 84 1B 42 2B 00 00 00 30 6E 39 19 00 90 73 39 19 70 70 00 28 72 39 19 10 
    //00 A0 72 39 19 00 B0 71 39 19 16 1C 78 95 38 19 16 16 27 16 18 07 00 2D 00 18 73 39 19 16 A6 00 
    //A0 72 39 19 16 06 36 00 41 00 B0 71 39 19 25 37 00 B0 71 39 19 07 5C 01 19 01 38 71 39 19 12 00 
    //04 1C B0 D7 38 19 00 B0 71 39 19 00 28 72 39 19 24 04 16 07 ED 00 81 19 10 00 30 6E 39 19 01 D0 
    //2F 39 19 0B 00 04 1B 76 2A 00 00 00 90 73 39 19 16 16 0F 00 90 73 39 19 19 10 00 30 6E 39 19 01 
    //D0 2F 39 19 06 00 04 1B 83 2A 00 00 16 0F 00 A0 72 39 19 93 37 00 B0 71 39 19 26 16 07 5C 01 99 
    //00 A0 72 39 19 25 16 14 2D 00 18 73 39 19 84 9B 19 10 00 30 6E 39 19 01 D0 2F 39 19 23 00 04 1B 
    //1B 2B 00 00 00 90 73 39 19 70 00 28 72 39 19 10 00 A0 72 39 19 00 B0 71 39 19 16 2D 01 08 74 39 
    //19 16 1D FF FF FF FF 16 18 07 00 2D 00 18 73 39 19 16 A6 00 A0 72 39 19 16 06 FC 00 04 2D 00 18 
    //73 39 19 04 0B 47 
  }


  function byte GetPlaylistType(string Path) {
    local string Ext;
    Ext = static.ParseExtension(Path);                                          //0000 : 0F 00 20 77 39 19 1C D8 88 38 19 00 20 76 39 19 16 
    switch (Locs(Ext)) {                                                        //0011 : 05 00 EE 00 20 77 39 19 16 
      case "m3u" :                                                              //001A : 0A 25 00 1F 6D 33 75 00 
        return 1;                                                               //0022 : 04 24 01 
      case "b4s" :                                                              //0025 : 0A 30 00 1F 62 34 73 00 
        return 3;                                                               //002D : 04 24 03 
      case "pls" :                                                              //0030 : 0A 3B 00 1F 70 6C 73 00 
        return 2;                                                               //0038 : 04 24 02 
      default:                                                                  //003B : 0A FF FF 
        return 0;                                                               //003E : 04 24 00 
      }
    }
    //0F 00 20 77 39 19 1C D8 88 38 19 00 20 76 39 19 16 05 00 EE 00 20 77 39 19 16 0A 25 00 1F 6D 33 
    //75 00 04 24 01 0A 30 00 1F 62 34 73 00 04 24 03 0A 3B 00 1F 70 6C 73 00 04 24 02 0A FF FF 04 24 
    //00 04 0B 47 
  }


  function bool ClearCurrentPlaylist() {
    if (!ValidIndex(CurrentPlaylist)) {                                         //0000 : 07 12 00 81 1B 79 2A 00 00 01 70 36 39 19 16 16 
      return False;                                                             //0010 : 04 28 
    }
    return Playlists[CurrentPlaylist].ClearPlaylist();                          //0012 : 04 19 10 01 70 36 39 19 01 D0 2F 39 19 06 00 04 1B 1A 2B 00 00 16 
    //07 12 00 81 1B 79 2A 00 00 01 70 36 39 19 16 16 04 28 04 19 10 01 70 36 39 19 01 D0 2F 39 19 06 
    //00 04 1B 1A 2B 00 00 16 04 0B 47 
  }


  function bool RemoveFromCurrentPlaylist(string Path,optional bool bSkipNotification) {
    if (ValidIndex(CurrentPlaylist)) {                                          //0000 : 07 2F 00 1B 79 2A 00 00 01 70 36 39 19 16 
      return Playlists[CurrentPlaylist].RemoveSong(Path,bSkipNotification);     //000E : 04 19 10 01 70 36 39 19 01 D0 2F 39 19 11 00 04 1B 04 2C 00 00 00 50 7A 39 19 2D 00 38 7B 39 19 16 
    }
    return False;                                                               //002F : 04 28 
    //07 2F 00 1B 79 2A 00 00 01 70 36 39 19 16 04 19 10 01 70 36 39 19 01 D0 2F 39 19 11 00 04 1B 04 
    //2C 00 00 00 50 7A 39 19 2D 00 38 7B 39 19 16 04 28 04 0B 47 
  }


  function bool InsertInPlaylist(int PlaylistIndex,int InsertPosition,string Path,optional bool bSkipNotification) {
    local byte Type;
    local bool bResult;
    if (!ValidIndex(PlaylistIndex)) {                                           //0000 : 07 12 00 81 1B 79 2A 00 00 00 D8 7C 39 19 16 16 
      return False;                                                             //0010 : 04 28 
    }
    Type = static.ConvertToFileType(Path);                                      //0012 : 0F 00 58 7F 39 19 1C 70 84 38 19 00 D0 7F 39 19 16 
    Playlists[PlaylistIndex].InitializePlaylist(FileManager);                   //0023 : 19 10 00 D8 7C 39 19 01 D0 2F 39 19 0B 00 04 1B 1E 2B 00 00 01 38 71 39 19 16 
    switch (Type) {                                                             //003D : 05 01 00 58 7F 39 19 
      case 0 :                                                                  //0044 : 0A AC 00 24 00 
        bDisableNotification = True;                                            //0049 : 14 2D 01 08 74 39 19 27 
        bResult = AddDirectory(PlaylistIndex,InsertPosition,Path,True);         //0051 : 14 2D 00 48 80 39 19 1B 42 2B 00 00 00 D8 7C 39 19 00 C0 80 39 19 00 D0 7F 39 19 27 16 
        bDisableNotification = False;                                           //006E : 14 2D 01 08 74 39 19 28 
        if (bResult && !bSkipNotification) {                                    //0076 : 07 A5 00 82 2D 00 48 80 39 19 18 09 00 81 2D 00 38 81 39 19 16 16 
          Playlists[PlaylistIndex].OnPlaylistChanged();                         //008C : 19 10 00 D8 7C 39 19 01 D0 2F 39 19 0A 00 00 43 B0 81 39 19 B8 2A 00 00 16 
        }
        return bResult;                                                         //00A5 : 04 2D 00 48 80 39 19 
      case 5 :                                                                  //00AC : 0A 13 01 24 05 
        bDisableNotification = True;                                            //00B1 : 14 2D 01 08 74 39 19 27 
        bResult = ImportPlaylist(PlaylistIndex,InsertPosition,Path);            //00B9 : 14 2D 00 48 80 39 19 1B 20 2C 00 00 00 D8 7C 39 19 00 C0 80 39 19 00 D0 7F 39 19 16 
        bDisableNotification = False;                                           //00D5 : 14 2D 01 08 74 39 19 28 
        if (bResult && !bSkipNotification) {                                    //00DD : 07 0C 01 82 2D 00 48 80 39 19 18 09 00 81 2D 00 38 81 39 19 16 16 
          Playlists[PlaylistIndex].OnPlaylistChanged();                         //00F3 : 19 10 00 D8 7C 39 19 01 D0 2F 39 19 0A 00 00 43 B0 81 39 19 B8 2A 00 00 16 
        }
        return bResult;                                                         //010C : 04 2D 00 48 80 39 19 
      case 4 :                                                                  //0113 : 0A 50 01 24 04 
        return Playlists[PlaylistIndex].InsertSong(InsertPosition,Path,bDisableNotification || bSkipNotification) != -1;//0118 : 04 9B 19 10 00 D8 7C 39 19 01 D0 2F 39 19 21 00 04 1B 1B 2B 00 00 00 C0 80 39 19 00 D0 7F 39 19 84 2D 01 08 74 39 19 18 07 00 2D 00 38 81 39 19 16 16 1D FF FF FF FF 16 
      default:                                                                  //0150 : 0A FF FF 
        return False;                                                           //0153 : 04 28 
      }
    }
    //07 12 00 81 1B 79 2A 00 00 00 D8 7C 39 19 16 16 04 28 0F 00 58 7F 39 19 1C 70 84 38 19 00 D0 7F 
    //39 19 16 19 10 00 D8 7C 39 19 01 D0 2F 39 19 0B 00 04 1B 1E 2B 00 00 01 38 71 39 19 16 05 01 00 
    //58 7F 39 19 0A AC 00 24 00 14 2D 01 08 74 39 19 27 14 2D 00 48 80 39 19 1B 42 2B 00 00 00 D8 7C 
    //39 19 00 C0 80 39 19 00 D0 7F 39 19 27 16 14 2D 01 08 74 39 19 28 07 A5 00 82 2D 00 48 80 39 19 
    //18 09 00 81 2D 00 38 81 39 19 16 16 19 10 00 D8 7C 39 19 01 D0 2F 39 19 0A 00 00 43 B0 81 39 19 
    //B8 2A 00 00 16 04 2D 00 48 80 39 19 0A 13 01 24 05 14 2D 01 08 74 39 19 27 14 2D 00 48 80 39 19 
    //1B 20 2C 00 00 00 D8 7C 39 19 00 C0 80 39 19 00 D0 7F 39 19 16 14 2D 01 08 74 39 19 28 07 0C 01 
    //82 2D 00 48 80 39 19 18 09 00 81 2D 00 38 81 39 19 16 16 19 10 00 D8 7C 39 19 01 D0 2F 39 19 0A 
    //00 00 43 B0 81 39 19 B8 2A 00 00 16 04 2D 00 48 80 39 19 0A 50 01 24 04 04 9B 19 10 00 D8 7C 39 
    //19 01 D0 2F 39 19 21 00 04 1B 1B 2B 00 00 00 C0 80 39 19 00 D0 7F 39 19 84 2D 01 08 74 39 19 18 
    //07 00 2D 00 38 81 39 19 16 16 1D FF FF FF FF 16 0A FF FF 04 28 04 0B 47 
  }


  function bool AddToPlaylist(int PlaylistIndex,string Path,optional bool bSkipNotification) {
    if (!ValidIndex(PlaylistIndex)) {                                           //0000 : 07 2D 00 81 1B 79 2A 00 00 00 50 83 39 19 16 16 
      if (!ValidIndex(CurrentPlaylist)) {                                       //0010 : 07 22 00 81 1B 79 2A 00 00 01 70 36 39 19 16 16 
        return False;                                                           //0020 : 04 28 
      }
      PlaylistIndex = CurrentPlaylist;                                          //0022 : 0F 00 50 83 39 19 01 70 36 39 19 
    }
    return InsertInPlaylist(PlaylistIndex,-1,Path,bSkipNotification);           //002D : 04 1B 3C 2B 00 00 00 50 83 39 19 1D FF FF FF FF 00 58 84 39 19 2D 00 D0 84 39 19 16 
    //07 2D 00 81 1B 79 2A 00 00 00 50 83 39 19 16 16 07 22 00 81 1B 79 2A 00 00 01 70 36 39 19 16 16 
    //04 28 0F 00 50 83 39 19 01 70 36 39 19 04 1B 3C 2B 00 00 00 50 83 39 19 1D FF FF FF FF 00 58 84 
    //39 19 2D 00 D0 84 39 19 16 04 0B 47 
  }


  function bool RenamePlaylist(int Index,out string NewName) {
    local StreamPlaylist Temp;
    local string str;
    local int i;
    if (!ValidIndex(Index) || NewName == "") {                                  //0000 : 07 20 00 84 81 1B 79 2A 00 00 00 70 86 39 19 16 16 18 0A 00 7A 00 E8 86 39 19 1F 00 16 16 
      return False;                                                             //001E : 04 28 
    }
    str = NewName;                                                              //0020 : 0F 00 60 87 39 19 00 E8 86 39 19 
    while (ValidName(NewName)) {                                                //002B : 07 52 00 1B 48 2B 00 00 00 E8 86 39 19 16 
      NewName = str $ string(i++);                                              //0039 : 0F 00 E8 86 39 19 70 00 60 87 39 19 39 53 A5 00 D8 87 39 19 16 16 
    }
    Temp = CreatePlaylist(NewName);                                             //0052 : 0F 00 50 88 39 19 1B 08 2B 00 00 00 E8 86 39 19 16 
    if (Temp == None) {                                                         //0063 : 07 70 00 72 00 50 88 39 19 2A 16 
      return False;                                                             //006E : 04 28 
    }
    Temp.ReplaceWith(Playlists[Index]);                                         //0070 : 19 00 50 88 39 19 11 00 00 1B 06 2C 00 00 10 00 70 86 39 19 01 D0 2F 39 19 16 
    Playlists[Index].ClearConfig();                                             //008A : 19 10 00 70 86 39 19 01 D0 2F 39 19 03 00 00 62 19 16 
    Playlists[Index] = Temp;                                                    //009C : 0F 10 00 70 86 39 19 01 D0 2F 39 19 00 50 88 39 19 
    Playlists[Index].Save();                                                    //00AD : 19 10 00 70 86 39 19 01 D0 2F 39 19 06 00 00 1B A0 2A 00 00 16 
    if (!bDisableNotification) {                                                //00C2 : 07 E2 00 81 2D 01 08 74 39 19 16 
      ChangedActivePlaylist(Playlists[Index]);                                  //00CD : 43 C8 88 39 19 31 2B 00 00 10 00 70 86 39 19 01 D0 2F 39 19 16 
    }
    return True;                                                                //00E2 : 04 27 
    //07 20 00 84 81 1B 79 2A 00 00 00 70 86 39 19 16 16 18 0A 00 7A 00 E8 86 39 19 1F 00 16 16 04 28 
    //0F 00 60 87 39 19 00 E8 86 39 19 07 52 00 1B 48 2B 00 00 00 E8 86 39 19 16 0F 00 E8 86 39 19 70 
    //00 60 87 39 19 39 53 A5 00 D8 87 39 19 16 16 06 2B 00 0F 00 50 88 39 19 1B 08 2B 00 00 00 E8 86 
    //39 19 16 07 70 00 72 00 50 88 39 19 2A 16 04 28 19 00 50 88 39 19 11 00 00 1B 06 2C 00 00 10 00 
    //70 86 39 19 01 D0 2F 39 19 16 19 10 00 70 86 39 19 01 D0 2F 39 19 03 00 00 62 19 16 0F 10 00 70 
    //86 39 19 01 D0 2F 39 19 00 50 88 39 19 19 10 00 70 86 39 19 01 D0 2F 39 19 06 00 00 1B A0 2A 00 
    //00 16 07 E2 00 81 2D 01 08 74 39 19 16 43 C8 88 39 19 31 2B 00 00 10 00 70 86 39 19 01 D0 2F 39 
    //19 16 04 27 04 0B 47 
  }


  function bool RemovePlaylistAt(int Index) {
    local bool bWasActive;
    if (!ValidIndex(Index)) {                                                   //0000 : 07 12 00 81 1B 79 2A 00 00 00 68 8A 39 19 16 16 
      return False;                                                             //0010 : 04 28 
    }
    bWasActive = CurrentPlaylist == Index;                                      //0012 : 14 2D 00 88 8B 39 19 9A 01 70 36 39 19 00 68 8A 39 19 16 
    Playlists[Index].ClearConfig();                                             //0025 : 19 10 00 68 8A 39 19 01 D0 2F 39 19 03 00 00 62 19 16 
    Playlists.Remove(Index,1);                                                  //0037 : 41 01 D0 2F 39 19 00 68 8A 39 19 26 
    if (bWasActive) {                                                           //0043 : 07 53 00 2D 00 88 8B 39 19 
      ActivatePlaylist(0);                                                      //004C : 1B 82 2A 00 00 25 16 
    }
    return True;                                                                //0053 : 04 27 
    //07 12 00 81 1B 79 2A 00 00 00 68 8A 39 19 16 16 04 28 14 2D 00 88 8B 39 19 9A 01 70 36 39 19 00 
    //68 8A 39 19 16 19 10 00 68 8A 39 19 01 D0 2F 39 19 03 00 00 62 19 16 41 01 D0 2F 39 19 00 68 8A 
    //39 19 26 07 53 00 2D 00 88 8B 39 19 1B 82 2A 00 00 25 16 04 27 04 0B 47 
  }


  function bool RemovePlaylist(string PlaylistName) {
    local int i;
    i = FindNameIndex(PlaylistName);                                            //0000 : 0F 00 10 8E 39 19 1B 24 2C 00 00 00 28 8D 39 19 16 
    if (i != -1) {                                                              //0011 : 07 2C 00 9B 00 10 8E 39 19 1D FF FF FF FF 16 
      return RemovePlaylistAt(i);                                               //0020 : 04 1B 1A 2C 00 00 00 10 8E 39 19 16 
    }
    return False;                                                               //002C : 04 28 
    //0F 00 10 8E 39 19 1B 24 2C 00 00 00 28 8D 39 19 16 07 2C 00 9B 00 10 8E 39 19 1D FF FF FF FF 16 
    //04 1B 1A 2C 00 00 00 10 8E 39 19 16 04 28 04 0B 47 
  }


  protected function int AppendPlaylist(StreamPlaylist Playlist) {
    local int i;
    if (Playlist == None) {                                                     //0000 : 07 11 00 72 00 40 93 39 19 2A 16 
      return -1;                                                                //000B : 04 1D FF FF FF FF 
    }
    i = FindPlaylistIndex(Playlist);                                            //0011 : 0F 00 68 94 39 19 1B 25 2C 00 00 00 40 93 39 19 16 
    if (i == -1) {                                                              //0022 : 07 3D 00 9A 00 68 94 39 19 1D FF FF FF FF 16 
      i = Playlists.Length;                                                     //0031 : 0F 00 68 94 39 19 37 01 D0 2F 39 19 
    }
    Playlists[i] = Playlist;                                                    //003D : 0F 10 00 68 94 39 19 01 D0 2F 39 19 00 40 93 39 19 
    bDirty = True;                                                              //004E : 14 2D 01 08 32 39 19 27 
    return i;                                                                   //0056 : 04 00 68 94 39 19 
    //07 11 00 72 00 40 93 39 19 2A 16 04 1D FF FF FF FF 0F 00 68 94 39 19 1B 25 2C 00 00 00 40 93 39 
    //19 16 07 3D 00 9A 00 68 94 39 19 1D FF FF FF FF 16 0F 00 68 94 39 19 37 01 D0 2F 39 19 0F 10 00 
    //68 94 39 19 01 D0 2F 39 19 00 40 93 39 19 14 2D 01 08 32 39 19 27 04 00 68 94 39 19 04 0B 47 
  }


  function int AddPlaylist(out string NewPlaylistName) {
    local string str;
    local int i;
    if (NewPlaylistName == "") {                                                //0000 : 07 17 00 7A 00 08 96 39 19 1F 00 16 
      NewPlaylistName = DefaultPlaylistName;                                    //000C : 0F 00 08 96 39 19 01 30 97 39 19 
    }
    str = NewPlaylistName;                                                      //0017 : 0F 00 A8 97 39 19 00 08 96 39 19 
    while (ValidName(NewPlaylistName)) {                                        //0022 : 07 49 00 1B 48 2B 00 00 00 08 96 39 19 16 
      NewPlaylistName = str $ string(i++);                                      //0030 : 0F 00 08 96 39 19 70 00 A8 97 39 19 39 53 A5 00 20 98 39 19 16 16 
    }
    return AppendPlaylist(CreatePlaylist(NewPlaylistName));                     //0049 : 04 1B 38 2B 00 00 1B 08 2B 00 00 00 08 96 39 19 16 16 
    //07 17 00 7A 00 08 96 39 19 1F 00 16 0F 00 08 96 39 19 01 30 97 39 19 0F 00 A8 97 39 19 00 08 96 
    //39 19 07 49 00 1B 48 2B 00 00 00 08 96 39 19 16 0F 00 08 96 39 19 70 00 A8 97 39 19 39 53 A5 00 
    //20 98 39 19 16 16 06 22 00 04 1B 38 2B 00 00 1B 08 2B 00 00 00 08 96 39 19 16 16 04 0B 47 
  }


  function bool ActivatePlaylist(int ListIndex,optional bool bNoFail) {
    if (!ValidIndex(ListIndex)) {                                               //0000 : 07 6F 00 81 1B 79 2A 00 00 00 C0 99 39 19 16 16 
      if (bNoFail) {                                                            //0010 : 07 1B 00 2D 00 88 9B 39 19 
        return False;                                                           //0019 : 04 28 
      }
      if (GetRepeatAll()) {                                                     //001B : 07 6D 00 1B 09 2B 00 00 16 
        if (ListIndex < 0) {                                                    //0024 : 07 41 00 96 00 C0 99 39 19 25 16 
          ListIndex = Playlists.Length - 1;                                     //002F : 0F 00 C0 99 39 19 93 37 01 D0 2F 39 19 26 16 
        } else {                                                                //003E : 06 58 00 
          if (ListIndex >= Playlists.Length) {                                  //0041 : 07 58 00 99 00 C0 99 39 19 37 01 D0 2F 39 19 16 
            ListIndex = 0;                                                      //0051 : 0F 00 C0 99 39 19 25 
          }
        }
        if (!ValidIndex(ListIndex)) {                                           //0058 : 07 6A 00 81 1B 79 2A 00 00 00 C0 99 39 19 16 16 
          return False;                                                         //0068 : 04 28 
        }
      } else {                                                                  //006A : 06 6F 00 
        return False;                                                           //006D : 04 28 
      }
    }
    bDirty = bDirty || ListIndex != CurrentPlaylist;                            //006F : 14 2D 01 08 32 39 19 84 2D 01 08 32 39 19 18 0D 00 9B 00 C0 99 39 19 01 70 36 39 19 16 16 
    Playlists[ListIndex].InitializePlaylist(FileManager);                       //008D : 19 10 00 C0 99 39 19 01 D0 2F 39 19 0B 00 04 1B 1E 2B 00 00 01 38 71 39 19 16 
    CurrentPlaylist = ListIndex;                                                //00A7 : 0F 01 70 36 39 19 00 C0 99 39 19 
    if (!bDisableNotification) {                                                //00B2 : 07 D2 00 81 2D 01 08 74 39 19 16 
      ChangedActivePlaylist(Playlists[ListIndex]);                              //00BD : 43 C8 88 39 19 31 2B 00 00 10 00 C0 99 39 19 01 D0 2F 39 19 16 
    }
    return True;                                                                //00D2 : 04 27 
    //07 6F 00 81 1B 79 2A 00 00 00 C0 99 39 19 16 16 07 1B 00 2D 00 88 9B 39 19 04 28 07 6D 00 1B 09 
    //2B 00 00 16 07 41 00 96 00 C0 99 39 19 25 16 0F 00 C0 99 39 19 93 37 01 D0 2F 39 19 26 16 06 58 
    //00 07 58 00 99 00 C0 99 39 19 37 01 D0 2F 39 19 16 0F 00 C0 99 39 19 25 07 6A 00 81 1B 79 2A 00 
    //00 00 C0 99 39 19 16 16 04 28 06 6F 00 04 28 14 2D 01 08 32 39 19 84 2D 01 08 32 39 19 18 0D 00 
    //9B 00 C0 99 39 19 01 70 36 39 19 16 16 19 10 00 C0 99 39 19 01 D0 2F 39 19 0B 00 04 1B 1E 2B 00 
    //00 01 38 71 39 19 16 0F 01 70 36 39 19 00 C0 99 39 19 07 D2 00 81 2D 01 08 74 39 19 16 43 C8 88 
    //39 19 31 2B 00 00 10 00 C0 99 39 19 01 D0 2F 39 19 16 04 27 04 0B 47 
  }


  protected function StreamPlaylist CreateDefaultPlaylist() {
    local int i;
    local string Nothing;
    Nothing = DefaultPlaylistName;                                              //0000 : 0F 00 30 9E 39 19 01 30 97 39 19 
    i = AddPlaylist(Nothing);                                                   //000B : 0F 00 A8 9E 39 19 1B 35 2B 00 00 00 30 9E 39 19 16 
    if (ValidIndex(i) && ActivatePlaylist(i)) {                                 //001C : 07 46 00 82 1B 79 2A 00 00 00 A8 9E 39 19 16 18 0C 00 1B 82 2A 00 00 00 A8 9E 39 19 16 16 
      return Playlists[CurrentPlaylist];                                        //003A : 04 10 01 70 36 39 19 01 D0 2F 39 19 
    }
    return None;                                                                //0046 : 04 2A 
    //0F 00 30 9E 39 19 01 30 97 39 19 0F 00 A8 9E 39 19 1B 35 2B 00 00 00 30 9E 39 19 16 07 46 00 82 
    //1B 79 2A 00 00 00 A8 9E 39 19 16 18 0C 00 1B 82 2A 00 00 00 A8 9E 39 19 16 16 04 10 01 70 36 39 
    //19 01 D0 2F 39 19 04 2A 04 0B 47 
  }


  protected function InitializeParsers() {
    local int i;
    local int j;
    local class<PlaylistParserBase> ParseClass;
    i = 0;                                                                      //0000 : 0F 00 D0 9F 39 19 25 
    while (i < ParserType.Length) {                                             //0007 : 07 AF 00 96 00 D0 9F 39 19 37 01 68 A1 39 19 16 
      if (ParserType[i].ParserClass != "") {                                    //0017 : 07 A5 00 7B 36 68 A2 39 19 10 00 D0 9F 39 19 01 68 A1 39 19 1F 00 16 
        ParseClass = Class<PlaylistParserBase>(static.DynamicLoadObject(ParserType[i].ParserClass,Class'Class'));//002E : 0F 00 E0 A2 39 19 13 60 A3 39 19 1C 60 E7 69 0F 36 68 A2 39 19 10 00 D0 9F 39 19 01 68 A1 39 19 20 D8 DE 1F 10 16 
        if (ParseClass != None) {                                               //0054 : 07 A5 00 77 00 E0 A2 39 19 2A 16 
          j = Parsers.Length;                                                   //005F : 0F 00 A0 A8 39 19 37 01 18 6C 39 19 
          Parsers[j] = new (self) ParseClass;                                   //006B : 0F 10 00 A0 A8 39 19 01 18 6C 39 19 11 17 0B 0B 00 E0 A2 39 19 
          Parsers[j].SetType(ParserType[i].Type);                               //0080 : 19 10 00 A0 A8 39 19 01 18 6C 39 19 16 00 00 1B FA 2B 00 00 36 18 A9 39 19 10 00 D0 9F 39 19 01 68 A1 39 19 16 
        }
      }
      i++;                                                                      //00A5 : A5 00 D0 9F 39 19 16 
    }
    //0F 00 D0 9F 39 19 25 07 AF 00 96 00 D0 9F 39 19 37 01 68 A1 39 19 16 07 A5 00 7B 36 68 A2 39 19 
    //10 00 D0 9F 39 19 01 68 A1 39 19 1F 00 16 0F 00 E0 A2 39 19 13 60 A3 39 19 1C 60 E7 69 0F 36 68 
    //A2 39 19 10 00 D0 9F 39 19 01 68 A1 39 19 20 D8 DE 1F 10 16 07 A5 00 77 00 E0 A2 39 19 2A 16 0F 
    //00 A0 A8 39 19 37 01 18 6C 39 19 0F 10 00 A0 A8 39 19 01 18 6C 39 19 11 17 0B 0B 00 E0 A2 39 19 
    //19 10 00 A0 A8 39 19 01 18 6C 39 19 16 00 00 1B FA 2B 00 00 36 18 A9 39 19 10 00 D0 9F 39 19 01 
    //68 A1 39 19 16 A5 00 D0 9F 39 19 16 06 07 00 04 0B 47 
  }


  protected function InitializePlaylists() {
    local array<string> PlaylistNames;
    local StreamPlaylist NewList;
    local int i;
    PlaylistNames = static.GetPerObjectNames("UPlaylists","StreamPlaylist");    //0000 : 0F 00 40 AA 39 19 1C 90 A2 69 0F 1F 55 50 6C 61 79 6C 69 73 74 73 00 1F 53 74 72 65 61 6D 50 6C 61 79 6C 69 73 74 00 16 
    i = 0;                                                                      //0028 : 0F 00 D0 AB 39 19 25 
    while (i < PlaylistNames.Length) {                                          //002F : 07 80 00 96 00 D0 AB 39 19 37 00 40 AA 39 19 16 
      if (PlaylistNames[i] == "") {                                             //003F : 07 54 00 7A 10 00 D0 AB 39 19 00 40 AA 39 19 1F 00 16 
      } else {                                                                  //0051 : 06 76 00 
        NewList = CreatePlaylist(PlaylistNames[i]);                             //0054 : 0F 00 48 AC 39 19 1B 08 2B 00 00 10 00 D0 AB 39 19 00 40 AA 39 19 16 
        AppendPlaylist(NewList);                                                //006B : 1B 38 2B 00 00 00 48 AC 39 19 16 
      }
      i++;                                                                      //0076 : A5 00 D0 AB 39 19 16 
    }
    if (Playlists.Length == 0) {                                                //0080 : 07 95 00 9A 37 01 D0 2F 39 19 25 16 
      CreateDefaultPlaylist();                                                  //008C : 1B 34 2B 00 00 16 
    } else {                                                                    //0092 : 06 AC 00 
      if (!ActivatePlaylist(CurrentPlaylist)) {                                 //0095 : 07 AC 00 81 1B 82 2A 00 00 01 70 36 39 19 16 16 
        ActivatePlaylist(0);                                                    //00A5 : 1B 82 2A 00 00 25 16 
      }
    }
    //0F 00 40 AA 39 19 1C 90 A2 69 0F 1F 55 50 6C 61 79 6C 69 73 74 73 00 1F 53 74 72 65 61 6D 50 6C 
    //61 79 6C 69 73 74 00 16 0F 00 D0 AB 39 19 25 07 80 00 96 00 D0 AB 39 19 37 00 40 AA 39 19 16 07 
    //54 00 7A 10 00 D0 AB 39 19 00 40 AA 39 19 1F 00 16 06 76 00 0F 00 48 AC 39 19 1B 08 2B 00 00 10 
    //00 D0 AB 39 19 00 40 AA 39 19 16 1B 38 2B 00 00 00 48 AC 39 19 16 A5 00 D0 AB 39 19 16 06 2F 00 
    //07 95 00 9A 37 01 D0 2F 39 19 25 16 1B 34 2B 00 00 16 06 AC 00 07 AC 00 81 1B 82 2A 00 00 01 70 
    //36 39 19 16 16 1B 82 2A 00 00 25 16 04 0B 47 
  }


  function Initialize(StreamInterface InFileManager) {
    FileManager = InFileManager;                                                //0000 : 0F 01 38 71 39 19 00 E8 AD 39 19 
    InitializePlaylists();                                                      //000B : 1B 13 2C 00 00 16 
    InitializeParsers();                                                        //0011 : 1B 15 2C 00 00 16 
    //0F 01 38 71 39 19 00 E8 AD 39 19 1B 13 2C 00 00 16 1B 15 2C 00 00 16 04 0B 47 
  }


  delegate ChangedActivePlaylist(StreamPlaylist NewPlaylist);



