//==============================================================================
//  M3UParser
//==============================================================================

class M3UParser extends PlaylistParserBase within StreamPlaylistManager
    dependsOn()
    Config(System)
  ;

  var FilePath ParsedPath;


  function string MatchPath(string str) {
    local int i;
    local array<string> Parts;
    local string Result;
    Split(str,static.GetPathSeparator(),Parts);                                 //0000 : F0 00 F8 A3 B0 1C 1C 78 95 38 19 16 00 70 A4 B0 1C 16 
    i = 0;                                                                      //0012 : 0F 00 E8 A4 B0 1C 25 
    while (i < ParsedPath.DirectoryParts.Length) {                              //0019 : 07 8F 00 96 00 E8 A4 B0 1C 37 36 28 9E 38 19 01 60 A5 B0 1C 16 
      if (CompareNames(ParsedPath.DirectoryParts[i],Parts[0])) {                //002E : 07 51 00 1B EB 2B 00 00 10 00 E8 A4 B0 1C 36 28 9E 38 19 01 60 A5 B0 1C 10 25 00 70 A4 B0 1C 16 
        goto jl008F;                                                            //004E : 06 8F 00 
      }
      if (Result != "") {                                                       //0051 : 07 6C 00 7B 00 D8 A5 B0 1C 1F 00 16 
      }
      i++;                                                                      //0085 : A5 00 E8 A4 B0 1C 16 
    }
    if (i == ParsedPath.DirectoryParts.Length) {                                //008F : 07 AC 00 9A 00 E8 A4 B0 1C 37 36 28 9E 38 19 01 60 A5 B0 1C 16 
      Result = "";                                                              //00A4 : 0F 00 D8 A5 B0 1C 1F 00 
    }
    i = 0;                                                                      //00AC : 0F 00 E8 A4 B0 1C 25 
    while (i < Parts.Length) {                                                  //00B3 : 07 FC 00 96 00 E8 A4 B0 1C 37 00 70 A4 B0 1C 16 
      if (Result != "") {                                                       //00C3 : 07 DE 00 7B 00 D8 A5 B0 1C 1F 00 16 
      }
      i++;                                                                      //00F2 : A5 00 E8 A4 B0 1C 16 
    }
    return Result;                                                              //00FC : 04 00 D8 A5 B0 1C 
    //F0 00 F8 A3 B0 1C 1C 78 95 38 19 16 00 70 A4 B0 1C 16 0F 00 E8 A4 B0 1C 25 07 8F 00 96 00 E8 A4 
    //B0 1C 37 36 28 9E 38 19 01 60 A5 B0 1C 16 07 51 00 1B EB 2B 00 00 10 00 E8 A4 B0 1C 36 28 9E 38 
    //19 01 60 A5 B0 1C 10 25 00 70 A4 B0 1C 16 06 8F 00 07 6C 00 7B 00 D8 A5 B0 1C 1F 00 16 0E 61 42 
    //00 D8 A5 B0 1C 1C 78 95 38 19 16 16 0E 61 42 00 D8 A5 B0 1C 10 00 E8 A4 B0 1C 36 28 9E 38 19 01 
    //60 A5 B0 1C 16 A5 00 E8 A4 B0 1C 16 06 19 00 07 AC 00 9A 00 E8 A4 B0 1C 37 36 28 9E 38 19 01 60 
    //A5 B0 1C 16 0F 00 D8 A5 B0 1C 1F 00 0F 00 E8 A4 B0 1C 25 07 FC 00 96 00 E8 A4 B0 1C 37 00 70 A4 
    //B0 1C 16 07 DE 00 7B 00 D8 A5 B0 1C 1F 00 16 0E 61 42 00 D8 A5 B0 1C 1C 78 95 38 19 16 16 0E 61 
    //42 00 D8 A5 B0 1C 10 00 E8 A4 B0 1C 00 70 A4 B0 1C 16 A5 00 E8 A4 B0 1C 16 06 B3 00 04 00 D8 A5 
    //B0 1C 04 0B 47 
  }


  function ParseLines() {
    local int i;
    local string str;
    Super.ParseLines();                                                         //0000 : 1C A0 2B 3A 19 16 
    if (Lines.Length == 0) {                                                    //0006 : 07 14 00 9A 37 01 E8 37 3A 19 25 16 
      return;                                                                   //0012 : 04 0B 
    }
    i = 0;                                                                      //0014 : 0F 00 F0 A7 B0 1C 25 
    while (i < Lines.Length) {                                                  //001B : 07 AC 00 96 00 F0 A7 B0 1C 37 01 E8 37 3A 19 16 
      if (Left(Lines[i],1) == "#" || Lines[i] == "") {                          //002B : 07 58 00 84 7A 80 10 00 F0 A7 B0 1C 01 E8 37 3A 19 26 16 1F 23 00 16 18 10 00 7A 10 00 F0 A7 B0 1C 01 E8 37 3A 19 1F 00 16 16 
      } else {                                                                  //0055 : 06 A2 00 
        str = Lines[i];                                                         //0058 : 0F 00 80 A9 B0 1C 10 00 F0 A7 B0 1C 01 E8 37 3A 19 
        if (Left(str,1) == static.GetPathSeparator()) {                         //0069 : 07 8A 00 7A 80 00 80 A9 B0 1C 26 16 1C 78 95 38 19 16 16 
          str = Mid(str,1);                                                     //007C : 0F 00 80 A9 B0 1C 7F 00 80 A9 B0 1C 26 16 
        }
        Paths[Paths.Length] = MatchPath(str);                                   //008A : 0F 10 37 01 E8 30 3A 19 01 E8 30 3A 19 1B FF 2B 00 00 00 80 A9 B0 1C 16 
      }
      i++;                                                                      //00A2 : A5 00 F0 A7 B0 1C 16 
    }
    //1C A0 2B 3A 19 16 07 14 00 9A 37 01 E8 37 3A 19 25 16 04 0B 0F 00 F0 A7 B0 1C 25 07 AC 00 96 00 
    //F0 A7 B0 1C 37 01 E8 37 3A 19 16 07 58 00 84 7A 80 10 00 F0 A7 B0 1C 01 E8 37 3A 19 26 16 1F 23 
    //00 16 18 10 00 7A 10 00 F0 A7 B0 1C 01 E8 37 3A 19 1F 00 16 16 06 A2 00 0F 00 80 A9 B0 1C 10 00 
    //F0 A7 B0 1C 01 E8 37 3A 19 07 8A 00 7A 80 00 80 A9 B0 1C 26 16 1C 78 95 38 19 16 16 0F 00 80 A9 
    //B0 1C 7F 00 80 A9 B0 1C 26 16 0F 10 37 01 E8 30 3A 19 01 E8 30 3A 19 1B FF 2B 00 00 00 80 A9 B0 
    //1C 16 A5 00 F0 A7 B0 1C 16 06 1B 00 04 0B 47 
  }


  function bool Import(int PlaylistIndex,int InsertPosition,string Path) {
    if (Outer.FileManager.LoadPlaylist(Path,Lines)
      && static.ParsePath(Path,ParsedPath)) {//0000 : 07 4C 00 82 19 19 01 00 E4 6B 0F 05 00 04 01 38 71 39 19 10 00 04 1C 38 DD 38 19 00 70 AA B0 1C 01 E8 37 3A 19 16 18 11 00 1C B8 98 38 19 00 70 AA B0 1C 01 60 A5 B0 1C 16 16 
      ImportedPlaylist(PlaylistIndex,InsertPosition);                           //003A : 1B 1F 2B 00 00 00 F8 A9 B0 1C 00 E8 AA B0 1C 16 
      return True;                                                              //004A : 04 27 
    }
    return False;                                                               //004C : 04 28 
    //07 4C 00 82 19 19 01 00 E4 6B 0F 05 00 04 01 38 71 39 19 10 00 04 1C 38 DD 38 19 00 70 AA B0 1C 
    //01 E8 37 3A 19 16 18 11 00 1C B8 98 38 19 00 70 AA B0 1C 01 60 A5 B0 1C 16 16 1B 1F 2B 00 00 00 
    //F8 A9 B0 1C 00 E8 AA B0 1C 16 04 27 04 28 04 0B 47 
  }



