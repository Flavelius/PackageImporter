//==============================================================================
//  B4SParser
//==============================================================================

class B4SParser extends PlaylistParserBase within StreamPlaylistManager
    dependsOn()
    Config(System)
  ;


  function ParseLines() {
    local int i;
    local int pos;
    local string str;
    Super.ParseLines();                                                         //0000 : 1C A0 2B 3A 19 16 
    if (Lines.Length == 0) {                                                    //0006 : 07 14 00 9A 37 01 E8 37 3A 19 25 16 
      return;                                                                   //0012 : 04 0B 
    }
    i = 0;                                                                      //0014 : 0F 00 58 92 B0 1C 25 
    while (i < Lines.Length) {                                                  //001B : 07 8B 01 96 00 58 92 B0 1C 37 01 E8 37 3A 19 16 
      if (InStr(Lines[i],"</playlist>") != -1
        || Lines[i] == "") {      //002B : 07 66 00 84 9B 7E 10 00 58 92 B0 1C 01 E8 37 3A 19 1F 3C 2F 70 6C 61 79 6C 69 73 74 3E 00 16 1D FF FF FF FF 16 18 10 00 7A 10 00 58 92 B0 1C 01 E8 37 3A 19 1F 00 16 16 
        goto jl018B;                                                            //0063 : 06 8B 01 
      }
      if (PlaylistName == "") {                                                 //0066 : 07 05 01 7A 01 E8 33 3A 19 1F 00 16 
        pos = InStr(Lines[i],"num_entries");                                    //0072 : 0F 00 20 95 B0 1C 7E 10 00 58 92 B0 1C 01 E8 37 3A 19 1F 6E 75 6D 5F 65 6E 74 72 69 65 73 00 16 
        if (pos == -1) {                                                        //0092 : 07 A4 00 9A 00 20 95 B0 1C 1D FF FF FF FF 16 
        } else {                                                                //00A1 : 06 81 01 
          pos = InStr(Lines[i],"label");                                        //00A4 : 0F 00 20 95 B0 1C 7E 10 00 58 92 B0 1C 01 E8 37 3A 19 1F 6C 61 62 65 6C 00 16 
          if (pos == -1) {                                                      //00BE : 07 E4 00 9A 00 20 95 B0 1C 1D FF FF FF FF 16 
            PlaylistName = Outer.DefaultPlaylistName;                           //00CD : 0F 01 E8 33 3A 19 19 01 00 E4 6B 0F 05 00 00 01 30 97 39 19 
          } else {                                                              //00E1 : 06 81 01 
            PlaylistName = GetValue(Mid(Lines[i],pos));                         //00E4 : 0F 01 E8 33 3A 19 1B 7D 0C 00 00 7F 10 00 58 92 B0 1C 01 E8 37 3A 19 00 20 95 B0 1C 16 16 
            goto jl0181;                                                        //0102 : 06 81 01 
          }
          if (InStr(Lines[i],"<entry ") != -1) {                                //0105 : 07 81 01 9B 7E 10 00 58 92 B0 1C 01 E8 37 3A 19 1F 3C 65 6E 74 72 79 20 00 16 1D FF FF FF FF 16 
            str = GetValue(Lines[i]);                                           //0125 : 0F 00 98 95 B0 1C 1B 7D 0C 00 00 10 00 58 92 B0 1C 01 E8 37 3A 19 16 
            if (str == "" || Left(str,5) != "file:") {                          //013C : 07 62 01 84 7A 00 98 95 B0 1C 1F 00 16 18 13 00 7B 80 00 98 95 B0 1C 2C 05 16 1F 66 69 6C 65 3A 00 16 16 
            } else {                                                            //015F : 06 81 01 
              Paths[Paths.Length] = HtmlDecode(Mid(str,5));                     //0162 : 0F 10 37 01 E8 30 3A 19 01 E8 30 3A 19 1B FE 2B 00 00 7F 00 98 95 B0 1C 2C 05 16 16 
              goto jl0181;                                                      //017E : 06 81 01 
            }
          }
        }
      }
      i++;                                                                      //0181 : A5 00 58 92 B0 1C 16 
    }
    //1C A0 2B 3A 19 16 07 14 00 9A 37 01 E8 37 3A 19 25 16 04 0B 0F 00 58 92 B0 1C 25 07 8B 01 96 00 
    //58 92 B0 1C 37 01 E8 37 3A 19 16 07 66 00 84 9B 7E 10 00 58 92 B0 1C 01 E8 37 3A 19 1F 3C 2F 70 
    //6C 61 79 6C 69 73 74 3E 00 16 1D FF FF FF FF 16 18 10 00 7A 10 00 58 92 B0 1C 01 E8 37 3A 19 1F 
    //00 16 16 06 8B 01 07 05 01 7A 01 E8 33 3A 19 1F 00 16 0F 00 20 95 B0 1C 7E 10 00 58 92 B0 1C 01 
    //E8 37 3A 19 1F 6E 75 6D 5F 65 6E 74 72 69 65 73 00 16 07 A4 00 9A 00 20 95 B0 1C 1D FF FF FF FF 
    //16 06 81 01 0F 00 20 95 B0 1C 7E 10 00 58 92 B0 1C 01 E8 37 3A 19 1F 6C 61 62 65 6C 00 16 07 E4 
    //00 9A 00 20 95 B0 1C 1D FF FF FF FF 16 0F 01 E8 33 3A 19 19 01 00 E4 6B 0F 05 00 00 01 30 97 39 
    //19 06 81 01 0F 01 E8 33 3A 19 1B 7D 0C 00 00 7F 10 00 58 92 B0 1C 01 E8 37 3A 19 00 20 95 B0 1C 
    //16 16 06 81 01 07 81 01 9B 7E 10 00 58 92 B0 1C 01 E8 37 3A 19 1F 3C 65 6E 74 72 79 20 00 16 1D 
    //FF FF FF FF 16 0F 00 98 95 B0 1C 1B 7D 0C 00 00 10 00 58 92 B0 1C 01 E8 37 3A 19 16 07 62 01 84 
    //7A 00 98 95 B0 1C 1F 00 16 18 13 00 7B 80 00 98 95 B0 1C 2C 05 16 1F 66 69 6C 65 3A 00 16 16 06 
    //81 01 0F 10 37 01 E8 30 3A 19 01 E8 30 3A 19 1B FE 2B 00 00 7F 00 98 95 B0 1C 2C 05 16 16 06 81 
    //01 A5 00 58 92 B0 1C 16 06 1B 00 04 0B 47 
  }



