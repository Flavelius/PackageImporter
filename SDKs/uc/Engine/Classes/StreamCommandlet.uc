//==============================================================================
//  StreamCommandlet
//==============================================================================

class StreamCommandlet extends Commandlet
    dependsOn()
    Transient
  ;


  function int RevInStr(string src,string match) {
    local int pos;
    local int i;
    local string s;
    if (src == "" || match == "") {                                             //0000 : 07 20 00 84 7A 00 10 3E F2 1C 1F 00 16 18 0A 00 7A 00 00 40 F2 1C 1F 00 16 16 
      return -1;                                                                //001A : 04 1D FF FF FF FF 
    }
    s = src;                                                                    //0020 : 0F 00 80 4F F2 1C 00 10 3E F2 1C 
    i = InStr(s,match);                                                         //002B : 0F 00 20 69 F2 1C 7E 00 80 4F F2 1C 00 00 40 F2 1C 16 
    pos += i;                                                                   //003D : A1 00 78 40 F2 1C 00 20 69 F2 1C 16 
    s = Mid(src,pos + 1);                                                       //0049 : 0F 00 80 4F F2 1C 7F 00 10 3E F2 1C 92 00 78 40 F2 1C 26 16 16 
    i = InStr(s,match) + 1;                                                     //005E : 0F 00 20 69 F2 1C 92 7E 00 80 4F F2 1C 00 00 40 F2 1C 16 26 16 
    if (!i == 0) goto jl003D;                                                   //0073 : 07 3D 00 9A 00 20 69 F2 1C 25 16 
    return pos;                                                                 //007E : 04 00 78 40 F2 1C 
    //07 20 00 84 7A 00 10 3E F2 1C 1F 00 16 18 0A 00 7A 00 00 40 F2 1C 1F 00 16 16 04 1D FF FF FF FF 
    //0F 00 80 4F F2 1C 00 10 3E F2 1C 0F 00 20 69 F2 1C 7E 00 80 4F F2 1C 00 00 40 F2 1C 16 A1 00 78 
    //40 F2 1C 00 20 69 F2 1C 16 0F 00 80 4F F2 1C 7F 00 10 3E F2 1C 92 00 78 40 F2 1C 26 16 16 0F 00 
    //20 69 F2 1C 92 7E 00 80 4F F2 1C 00 00 40 F2 1C 16 26 16 07 3D 00 9A 00 20 69 F2 1C 25 16 04 00 
    //78 40 F2 1C 04 0B 47 
  }


  function Chart(string src) {
    local int i;
    local int j;
    local int k;
    local string s;
    local string t;
    i = 0;                                                                      //0000 : 0F 00 68 72 F2 1C 25 
    while (i < Len(src)) {                                                      //0007 : 07 80 00 96 00 68 72 F2 1C 7D 00 E8 09 F2 1C 16 16 
      j = i % 10;                                                               //0018 : 0F 00 08 29 F2 1C 39 44 AD 39 3F 00 68 72 F2 1C 39 3F 2C 0A 16 
      if (j == 0) {                                                             //002D : 07 5A 00 9A 00 08 29 F2 1C 25 16 
        k = i / 10;                                                             //0038 : 0F 00 20 1C F2 1C 91 00 68 72 F2 1C 2C 0A 16 
      } else {                                                                  //0057 : 06 66 00 
      }
      i++;                                                                      //0076 : A5 00 68 72 F2 1C 16 
    }
    Log(src);                                                                   //0080 : E7 00 E8 09 F2 1C 16 
    Log(s);                                                                     //0087 : E7 00 C8 21 F2 1C 16 
    Log(t);                                                                     //008E : E7 00 D0 39 F2 1C 16 
    //0F 00 68 72 F2 1C 25 07 80 00 96 00 68 72 F2 1C 7D 00 E8 09 F2 1C 16 16 0F 00 08 29 F2 1C 39 44 
    //AD 39 3F 00 68 72 F2 1C 39 3F 2C 0A 16 07 5A 00 9A 00 08 29 F2 1C 25 16 0F 00 20 1C F2 1C 91 00 
    //68 72 F2 1C 2C 0A 16 0E 61 42 00 D0 39 F2 1C 39 53 00 20 1C F2 1C 16 06 66 00 0E 61 42 00 D0 39 
    //F2 1C 1F 20 00 16 0E 61 42 00 C8 21 F2 1C 39 53 00 08 29 F2 1C 16 A5 00 68 72 F2 1C 16 06 07 00 
    //E7 00 E8 09 F2 1C 16 E7 00 C8 21 F2 1C 16 E7 00 D0 39 F2 1C 16 04 0B 47 
  }


  event int Main(string Parms) {
    local string src;
    local string match;
    if (!Divide(Parms,";",src,match)) {                                         //0000 : 07 1B 00 81 EF 00 50 CD 7C 19 1F 3B 00 00 A8 68 F2 1C 00 00 35 F2 1C 16 16 
      return 0;                                                                 //0019 : 04 25 
    }
    Log("Source '" $ src $ "'   Match '"
      $ match
      $ "'");            //001B : E7 70 70 70 70 1F 53 6F 75 72 63 65 20 27 00 00 A8 68 F2 1C 16 1F 27 20 20 20 4D 61 74 63 68 20 27 00 16 00 00 35 F2 1C 16 1F 27 00 16 16 
    Log("Result of reverse search is" @ string(RevInStr(src,match)));           //0049 : E7 A8 1F 52 65 73 75 6C 74 20 6F 66 20 72 65 76 65 72 73 65 20 73 65 61 72 63 68 20 69 73 00 39 53 1B 40 2B 00 00 00 A8 68 F2 1C 00 00 35 F2 1C 16 16 16 
    Log("");                                                                    //007C : E7 1F 00 16 
    Chart(src);                                                                 //0080 : 1B 4D 2C 00 00 00 A8 68 F2 1C 16 
    return 0;                                                                   //008B : 04 25 
    //07 1B 00 81 EF 00 50 CD 7C 19 1F 3B 00 00 A8 68 F2 1C 00 00 35 F2 1C 16 16 04 25 E7 70 70 70 70 
    //1F 53 6F 75 72 63 65 20 27 00 00 A8 68 F2 1C 16 1F 27 20 20 20 4D 61 74 63 68 20 27 00 16 00 00 
    //35 F2 1C 16 1F 27 00 16 16 E7 A8 1F 52 65 73 75 6C 74 20 6F 66 20 72 65 76 65 72 73 65 20 73 65 
    //61 72 63 68 20 69 73 00 39 53 1B 40 2B 00 00 00 A8 68 F2 1C 00 00 35 F2 1C 16 16 16 E7 1F 00 16 
    //1B 4D 2C 00 00 00 A8 68 F2 1C 16 04 25 04 0B 47 
  }



