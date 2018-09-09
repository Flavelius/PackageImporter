//==============================================================================
//  PlaylistParserBase
//==============================================================================

class PlaylistParserBase extends StreamInterface within StreamPlaylistManager
    dependsOn(StreamPlaylistManager,StreamPlaylist)
    Config(System)
  ;

  struct HtmlChar {
      var string Plain;
      var string Coded;

  };


  var private byte Type;
  var string PlaylistName;
  var array<string> Paths;
  var array<string> Lines;
  var array<HtmlChar> SpecialChars;


  static function string HtmlDecode(string src) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 70 24 3A 19 25 
    while (i < default.SpecialChars.Length) {                                   //0007 : 07 4E 00 96 00 70 24 3A 19 37 02 E8 24 3A 19 16 
      src = Repl(src,default.SpecialChars[i].Coded,default.SpecialChars[i].Plain);//0017 : 0F 00 58 23 3A 19 C9 00 58 23 3A 19 36 E8 25 3A 19 10 00 70 24 3A 19 02 E8 24 3A 19 36 60 26 3A 19 10 00 70 24 3A 19 02 E8 24 3A 19 16 
      i++;                                                                      //0044 : A5 00 70 24 3A 19 16 
    }
    return src;                                                                 //004E : 04 00 58 23 3A 19 
    //0F 00 70 24 3A 19 25 07 4E 00 96 00 70 24 3A 19 37 02 E8 24 3A 19 16 0F 00 58 23 3A 19 C9 00 58 
    //23 3A 19 36 E8 25 3A 19 10 00 70 24 3A 19 02 E8 24 3A 19 36 60 26 3A 19 10 00 70 24 3A 19 02 E8 
    //24 3A 19 16 A5 00 70 24 3A 19 16 06 07 00 04 00 58 23 3A 19 04 0B 47 
  }


  static function string GetTagged(out string Text) {
    local string Tag;
    local int opos;
    local int cpos;
    opos = InStr(Text,"<");                                                     //0000 : 0F 00 C0 29 3A 19 7E 00 00 28 3A 19 1F 3C 00 16 
    if (opos != -1) {                                                           //0010 : 07 CB 00 9B 00 C0 29 3A 19 1D FF FF FF FF 16 
      Text = Mid(Text,opos + 1);                                                //001F : 0F 00 00 28 3A 19 7F 00 00 28 3A 19 92 00 C0 29 3A 19 26 16 16 
      cpos = InStr(Text,">");                                                   //0034 : 0F 00 38 2A 3A 19 7E 00 00 28 3A 19 1F 3E 00 16 
      if (cpos == -1) {                                                         //0044 : 07 56 00 9A 00 38 2A 3A 19 1D FF FF FF FF 16 
        return "";                                                              //0053 : 04 1F 00 
      }
      Tag = Left(Text,cpos);                                                    //0056 : 0F 00 B0 2A 3A 19 80 00 00 28 3A 19 00 38 2A 3A 19 16 
      Text = Mid(Text,cpos + 1);                                                //0068 : 0F 00 00 28 3A 19 7F 00 00 28 3A 19 92 00 38 2A 3A 19 26 16 16 
      opos = InStr(Locs(Text),"</" $ Locs(Tag) $ ">");                          //007D : 0F 00 C0 29 3A 19 7E EE 00 00 28 3A 19 16 70 70 1F 3C 2F 00 EE 00 B0 2A 3A 19 16 16 1F 3E 00 16 16 
      if (opos == -1) {                                                         //009E : 07 B3 00 9A 00 C0 29 3A 19 1D FF FF FF FF 16 
        return Tag;                                                             //00AD : 04 00 B0 2A 3A 19 
      }
      Text = Left(Text,opos);                                                   //00B3 : 0F 00 00 28 3A 19 80 00 00 28 3A 19 00 C0 29 3A 19 16 
      return Tag;                                                               //00C5 : 04 00 B0 2A 3A 19 
    }
    return "";                                                                  //00CB : 04 1F 00 
    //0F 00 C0 29 3A 19 7E 00 00 28 3A 19 1F 3C 00 16 07 CB 00 9B 00 C0 29 3A 19 1D FF FF FF FF 16 0F 
    //00 00 28 3A 19 7F 00 00 28 3A 19 92 00 C0 29 3A 19 26 16 16 0F 00 38 2A 3A 19 7E 00 00 28 3A 19 
    //1F 3E 00 16 07 56 00 9A 00 38 2A 3A 19 1D FF FF FF FF 16 04 1F 00 0F 00 B0 2A 3A 19 80 00 00 28 
    //3A 19 00 38 2A 3A 19 16 0F 00 00 28 3A 19 7F 00 00 28 3A 19 92 00 38 2A 3A 19 26 16 16 0F 00 C0 
    //29 3A 19 7E EE 00 00 28 3A 19 16 70 70 1F 3C 2F 00 EE 00 B0 2A 3A 19 16 16 1F 3E 00 16 16 07 B3 
    //00 9A 00 C0 29 3A 19 1D FF FF FF FF 16 04 00 B0 2A 3A 19 0F 00 00 28 3A 19 80 00 00 28 3A 19 00 
    //C0 29 3A 19 16 04 00 B0 2A 3A 19 04 1F 00 04 0B 47 
  }


  static function string GetValue(string KeyValuePair,optional bool bAllowSpaces) {
    local int i;
    local string str;
    i = InStr(KeyValuePair,"=");                                                //0000 : 0F 00 18 2E 3A 19 7E 00 50 2C 3A 19 1F 3D 00 16 
    if (i != -1) {                                                              //0010 : 07 D1 00 9B 00 18 2E 3A 19 1D FF FF FF FF 16 
      str = Mid(KeyValuePair,i + 1);                                            //001F : 0F 00 90 2E 3A 19 7F 00 50 2C 3A 19 92 00 18 2E 3A 19 26 16 16 
      if (Left(str,1) == """) {                                                 //0034 : 07 8D 00 7A 80 00 90 2E 3A 19 26 16 1F 22 00 16 
        str = Mid(str,1);                                                       //0044 : 0F 00 90 2E 3A 19 7F 00 90 2E 3A 19 26 16 
        i = static.RevInStr(str,""");                                           //0052 : 0F 00 18 2E 3A 19 1C A0 8B 38 19 00 90 2E 3A 19 1F 22 00 16 
        if (i != -1) {                                                          //0066 : 07 87 00 9B 00 18 2E 3A 19 1D FF FF FF FF 16 
          str = Left(str,i);                                                    //0075 : 0F 00 90 2E 3A 19 80 00 90 2E 3A 19 00 18 2E 3A 19 16 
        }
        return str;                                                             //0087 : 04 00 90 2E 3A 19 
      }
      i = InStr(str," ");                                                       //008D : 0F 00 18 2E 3A 19 7E 00 90 2E 3A 19 1F 20 00 16 
      if (i != -1 && !bAllowSpaces) {                                           //009D : 07 CB 00 82 9B 00 18 2E 3A 19 1D FF FF FF FF 16 18 09 00 81 2D 00 08 2F 3A 19 16 16 
        str = Left(str,i);                                                      //00B9 : 0F 00 90 2E 3A 19 80 00 90 2E 3A 19 00 18 2E 3A 19 16 
      }
      return str;                                                               //00CB : 04 00 90 2E 3A 19 
    }
    return "";                                                                  //00D1 : 04 1F 00 
    //0F 00 18 2E 3A 19 7E 00 50 2C 3A 19 1F 3D 00 16 07 D1 00 9B 00 18 2E 3A 19 1D FF FF FF FF 16 0F 
    //00 90 2E 3A 19 7F 00 50 2C 3A 19 92 00 18 2E 3A 19 26 16 16 07 8D 00 7A 80 00 90 2E 3A 19 26 16 
    //1F 22 00 16 0F 00 90 2E 3A 19 7F 00 90 2E 3A 19 26 16 0F 00 18 2E 3A 19 1C A0 8B 38 19 00 90 2E 
    //3A 19 1F 22 00 16 07 87 00 9B 00 18 2E 3A 19 1D FF FF FF FF 16 0F 00 90 2E 3A 19 80 00 90 2E 3A 
    //19 00 18 2E 3A 19 16 04 00 90 2E 3A 19 0F 00 18 2E 3A 19 7E 00 90 2E 3A 19 1F 20 00 16 07 CB 00 
    //82 9B 00 18 2E 3A 19 1D FF FF FF FF 16 18 09 00 81 2D 00 08 2F 3A 19 16 16 0F 00 90 2E 3A 19 80 
    //00 90 2E 3A 19 00 18 2E 3A 19 16 04 00 90 2E 3A 19 04 1F 00 04 0B 47 
  }


  function ParseLines() {
    Paths.Remove(0,Paths.Length);                                               //0000 : 41 01 E8 30 3A 19 25 37 01 E8 30 3A 19 
    //41 01 E8 30 3A 19 25 37 01 E8 30 3A 19 04 0B 47 
  }


  function ImportedPlaylist(int PlaylistIndex,int InsertPosition) {
    local StreamPlaylist Playlist;
    local int i;
    ParseLines();                                                               //0000 : 1B D4 2A 00 00 16 
    if (!Outer.ValidIndex(PlaylistIndex)) {                                     //0006 : 07 39 00 81 19 01 00 E4 6B 0F 0B 00 04 1B 79 2A 00 00 00 10 32 3A 19 16 16 
      PlaylistIndex = Outer.AddPlaylist(PlaylistName);                          //001F : 0F 00 10 32 3A 19 19 01 00 E4 6B 0F 0B 00 04 1B 35 2B 00 00 01 E8 33 3A 19 16 
    }
    Playlist = Outer.Playlists[PlaylistIndex];                                  //0039 : 0F 00 60 34 3A 19 10 00 10 32 3A 19 19 01 00 E4 6B 0F 05 00 00 01 D0 2F 39 19 
    if (!Playlist.ValidStreamIndex(InsertPosition)) {                           //0053 : 07 81 00 81 19 00 60 34 3A 19 0B 00 04 1B 76 2A 00 00 00 D8 34 3A 19 16 16 
      InsertPosition = Playlist.GetPlaylistLength();                            //006C : 0F 00 D8 34 3A 19 19 00 60 34 3A 19 06 00 04 1B 83 2A 00 00 16 
    }
    i = Paths.Length - 1;                                                       //0081 : 0F 00 50 35 3A 19 93 37 01 E8 30 3A 19 26 16 
    while (i >= 0) {                                                            //0090 : 07 D1 00 99 00 50 35 3A 19 25 16 
      Outer.InsertInPlaylist(PlaylistIndex,InsertPosition,Paths[i],i > 0);      //009B : 19 01 00 E4 6B 0F 23 00 04 1B 3C 2B 00 00 00 10 32 3A 19 00 D8 34 3A 19 10 00 50 35 3A 19 01 E8 30 3A 19 97 00 50 35 3A 19 25 16 16 
      i--;                                                                      //00C7 : A6 00 50 35 3A 19 16 
    }
    Outer.Save();                                                               //00D1 : 19 01 00 E4 6B 0F 06 00 00 1B A0 2A 00 00 16 
    //1B D4 2A 00 00 16 07 39 00 81 19 01 00 E4 6B 0F 0B 00 04 1B 79 2A 00 00 00 10 32 3A 19 16 16 0F 
    //00 10 32 3A 19 19 01 00 E4 6B 0F 0B 00 04 1B 35 2B 00 00 01 E8 33 3A 19 16 0F 00 60 34 3A 19 10 
    //00 10 32 3A 19 19 01 00 E4 6B 0F 05 00 00 01 D0 2F 39 19 07 81 00 81 19 00 60 34 3A 19 0B 00 04 
    //1B 76 2A 00 00 00 D8 34 3A 19 16 16 0F 00 D8 34 3A 19 19 00 60 34 3A 19 06 00 04 1B 83 2A 00 00 
    //16 0F 00 50 35 3A 19 93 37 01 E8 30 3A 19 26 16 07 D1 00 99 00 50 35 3A 19 25 16 19 01 00 E4 6B 
    //0F 23 00 04 1B 3C 2B 00 00 00 10 32 3A 19 00 D8 34 3A 19 10 00 50 35 3A 19 01 E8 30 3A 19 97 00 
    //50 35 3A 19 25 16 16 A6 00 50 35 3A 19 16 06 90 00 19 01 00 E4 6B 0F 06 00 00 1B A0 2A 00 00 16 
    //04 0B 47 
  }


  function bool Import(int PlaylistIndex,int InsertPosition,string Path) {
    if (Outer.FileManager.LoadPlaylist(Path,Lines)) {                           //0000 : 07 37 00 19 19 01 00 E4 6B 0F 05 00 04 01 38 71 39 19 10 00 04 1C 38 DD 38 19 00 70 37 3A 19 01 E8 37 3A 19 16 
      ImportedPlaylist(PlaylistIndex,InsertPosition);                           //0025 : 1B 1F 2B 00 00 00 78 36 3A 19 00 60 38 3A 19 16 
      return True;                                                              //0035 : 04 27 
    }
    return False;                                                               //0037 : 04 28 
    //07 37 00 19 19 01 00 E4 6B 0F 05 00 04 01 38 71 39 19 10 00 04 1C 38 DD 38 19 00 70 37 3A 19 01 
    //E8 37 3A 19 16 1B 1F 2B 00 00 00 78 36 3A 19 00 60 38 3A 19 16 04 27 04 28 04 0B 47 
  }


  function SetType(byte InType) {
    if (Type != 0) {                                                            //0000 : 07 12 00 9B 39 3A 01 D0 3A 3A 19 39 3A 24 00 16 
      return;                                                                   //0010 : 04 0B 
    }
    Type = InType;                                                              //0012 : 0F 01 D0 3A 3A 19 00 00 3A 3A 19 
    //07 12 00 9B 39 3A 01 D0 3A 3A 19 39 3A 24 00 16 04 0B 0F 01 D0 3A 3A 19 00 00 3A 3A 19 04 0B 47 
    //
  }


  function byte GetType() {
    return Type;                                                                //0000 : 04 01 D0 3A 3A 19 
    //04 01 D0 3A 3A 19 04 0B 47 
  }



