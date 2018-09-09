//==============================================================================
//  PLSParser
//==============================================================================

class PLSParser extends PlaylistParserBase within StreamPlaylistManager
    dependsOn()
    Config(System)
  ;


  function ParseLines() {
    local int i;
    Super.ParseLines();                                                         //0000 : 1C A0 2B 3A 19 16 
    if (Lines.Length == 0) {                                                    //0006 : 07 14 00 9A 37 01 E8 37 3A 19 25 16 
      return;                                                                   //0012 : 04 0B 
    }
    i = 0;                                                                      //0014 : 0F 00 D0 B8 B0 1C 25 
    while (i < Lines.Length) {                                                  //001B : 07 F4 00 96 00 D0 B8 B0 1C 37 01 E8 37 3A 19 16 
      if (Left(Lines[i],1) == "[" || Lines[i] == "") {                          //002B : 07 58 00 84 7A 80 10 00 D0 B8 B0 1C 01 E8 37 3A 19 26 16 1F 5B 00 16 18 10 00 7A 10 00 D0 B8 B0 1C 01 E8 37 3A 19 1F 00 16 16 
      } else {                                                                  //0055 : 06 EA 00 
        if (PlaylistName == ""
          && Left(Lines[i],InStr(Lines[i],"=")) ~= "PlaylistName") {//0058 : 07 B1 00 82 7A 01 E8 33 3A 19 1F 00 16 18 2E 00 7C 80 10 00 D0 B8 B0 1C 01 E8 37 3A 19 7E 10 00 D0 B8 B0 1C 01 E8 37 3A 19 1F 3D 00 16 16 1F 50 6C 61 79 6C 69 73 74 4E 61 6D 65 00 16 16 
          PlaylistName = GetValue(Lines[i],True);                               //0096 : 0F 01 E8 33 3A 19 1B 7D 0C 00 00 10 00 D0 B8 B0 1C 01 E8 37 3A 19 27 16 
          goto jl00EA;                                                          //00AE : 06 EA 00 
        }
        if (Left(Lines[i],4) ~= "File") {                                       //00B1 : 07 EA 00 7C 80 10 00 D0 B8 B0 1C 01 E8 37 3A 19 2C 04 16 1F 46 69 6C 65 00 16 
          Paths[Paths.Length] = GetValue(Lines[i],True);                        //00CB : 0F 10 37 01 E8 30 3A 19 01 E8 30 3A 19 1B 7D 0C 00 00 10 00 D0 B8 B0 1C 01 E8 37 3A 19 27 16 
        }
      }
      i++;                                                                      //00EA : A5 00 D0 B8 B0 1C 16 
    }
    //1C A0 2B 3A 19 16 07 14 00 9A 37 01 E8 37 3A 19 25 16 04 0B 0F 00 D0 B8 B0 1C 25 07 F4 00 96 00 
    //D0 B8 B0 1C 37 01 E8 37 3A 19 16 07 58 00 84 7A 80 10 00 D0 B8 B0 1C 01 E8 37 3A 19 26 16 1F 5B 
    //00 16 18 10 00 7A 10 00 D0 B8 B0 1C 01 E8 37 3A 19 1F 00 16 16 06 EA 00 07 B1 00 82 7A 01 E8 33 
    //3A 19 1F 00 16 18 2E 00 7C 80 10 00 D0 B8 B0 1C 01 E8 37 3A 19 7E 10 00 D0 B8 B0 1C 01 E8 37 3A 
    //19 1F 3D 00 16 16 1F 50 6C 61 79 6C 69 73 74 4E 61 6D 65 00 16 16 0F 01 E8 33 3A 19 1B 7D 0C 00 
    //00 10 00 D0 B8 B0 1C 01 E8 37 3A 19 27 16 06 EA 00 07 EA 00 7C 80 10 00 D0 B8 B0 1C 01 E8 37 3A 
    //19 2C 04 16 1F 46 69 6C 65 00 16 0F 10 37 01 E8 30 3A 19 01 E8 30 3A 19 1B 7D 0C 00 00 10 00 D0 
    //B8 B0 1C 01 E8 37 3A 19 27 16 A5 00 D0 B8 B0 1C 16 06 1B 00 04 0B 47 
  }



