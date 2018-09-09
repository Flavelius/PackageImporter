//==============================================================================
//  StreamBase
//==============================================================================

class StreamBase extends Object
    native
    abstract
    dependsOn()
  ;

  enum EStreamPlaylistType {
    SPT_None ,
    SPT_M3U ,
    SPT_PLS ,
    SPT_B4S 
  };

  enum EFileType {
    FILE_None ,
    FILE_Directory ,
    FILE_Log ,
    FILE_Ini ,
    FILE_Stream ,
    FILE_Playlist ,
    FILE_Music ,
    FILE_Map ,
    FILE_Texture ,
    FILE_Animation ,
    FILE_Static ,
    FILE_XML ,
    FILE_HTML ,
    FILE_Sound ,
    FILE_Demo ,
    FILE_DivX ,
    FILE_Content 
  };

  struct ID3Field {
      var transient int Reference;
      var string FieldName;
      var string FieldValue;
      var byte FieldID;
      var byte Code[4];

  };


  struct FilePath {
      var string FullPath;
      var string Directory;
      var string fileName;
      var string Extension;
      var array<string> DirectoryParts;

  };



  function bool HandleDebugExec(string Command,string Param) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  static function bool CompareNames(string NameA,string NameB) {
    if (static.IsCaseSensitive()) {                                             //0000 : 07 16 00 1C 98 85 38 19 16 
      return NameA == NameB;                                                    //0009 : 04 7A 00 20 85 38 19 00 48 86 38 19 16 
    }
    return NameA ~= NameB;                                                      //0016 : 04 7C 00 20 85 38 19 00 48 86 38 19 16 
    //07 16 00 1C 98 85 38 19 16 04 7A 00 20 85 38 19 00 48 86 38 19 16 04 7C 00 20 85 38 19 00 48 86 
    //38 19 16 04 0B 47 
  }


  final static event byte ConvertToFileType(string Extension) {
    local string Ext;
    if (Extension == "") {                                                      //0000 : 07 0F 00 7A 00 E8 87 38 19 1F 00 16 
      return 0;                                                                 //000C : 04 24 00 
    }
    Ext = static.ParseExtension(Extension);                                     //000F : 0F 00 60 88 38 19 1C D8 88 38 19 00 E8 87 38 19 16 
    if (Ext == "") {                                                            //0020 : 07 37 00 7A 00 60 88 38 19 1F 00 16 
      Ext = Extension;                                                          //002C : 0F 00 60 88 38 19 00 E8 87 38 19 
    }
    Ext = Locs(Ext);                                                            //0037 : 0F 00 60 88 38 19 EE 00 60 88 38 19 16 
    switch (Ext) {                                                              //0044 : 05 00 00 60 88 38 19 
      case "mp3" :                                                              //004B : 0A 53 00 1F 6D 70 33 00 
      case "ogg" :                                                              //0053 : 0A 5E 00 1F 6F 67 67 00 
        return 4;                                                               //005B : 04 24 04 
      case "wav" :                                                              //005E : 0A 66 00 1F 77 61 76 00 
      case "umx" :                                                              //0066 : 0A 71 00 1F 75 6D 78 00 
        return 6;                                                               //006E : 04 24 06 
      case "sbw" :                                                              //0071 : 0A 7C 00 1F 73 62 77 00 
        return 7;                                                               //0079 : 04 24 07 
      case "sba" :                                                              //007C : 0A 87 00 1F 73 62 61 00 
        return 9;                                                               //0084 : 04 24 09 
      case "sbs" :                                                              //0087 : 0A 92 00 1F 73 62 73 00 
        return 13;                                                              //008F : 04 24 0D 
      case "sbt" :                                                              //0092 : 0A 9D 00 1F 73 62 74 00 
        return 8;                                                               //009A : 04 24 08 
      case "dem" :                                                              //009D : 0A A8 00 1F 64 65 6D 00 
        return 14;                                                              //00A5 : 04 24 0E 
      case "sbm" :                                                              //00A8 : 0A B3 00 1F 73 62 6D 00 
        return 10;                                                              //00B0 : 04 24 0A 
      case "ini" :                                                              //00B3 : 0A BE 00 1F 69 6E 69 00 
        return 3;                                                               //00BB : 04 24 03 
      case "log" :                                                              //00BE : 0A C9 00 1F 6C 6F 67 00 
        return 2;                                                               //00C6 : 04 24 02 
      case "avi" :                                                              //00C9 : 0A D4 00 1F 61 76 69 00 
        return 15;                                                              //00D1 : 04 24 0F 
      case "xml" :                                                              //00D4 : 0A DF 00 1F 78 6D 6C 00 
        return 11;                                                              //00DC : 04 24 0B 
      case "html" :                                                             //00DF : 0A E8 00 1F 68 74 6D 6C 00 
      case "htm" :                                                              //00E8 : 0A F3 00 1F 68 74 6D 00 
        return 12;                                                              //00F0 : 04 24 0C 
      case "m3u" :                                                              //00F3 : 0A FB 00 1F 6D 33 75 00 
      case "b4s" :                                                              //00FB : 0A 03 01 1F 62 34 73 00 
      case "pls" :                                                              //0103 : 0A 0E 01 1F 70 6C 73 00 
        return 5;                                                               //010B : 04 24 05 
      case "sbg" :                                                              //010E : 0A 19 01 1F 73 62 67 00 
        return 16;                                                              //0116 : 04 24 10 
      default:                                                                  //0119 : 0A FF FF 
        return 0;                                                               //011C : 04 24 00 
      }
    }
    //07 0F 00 7A 00 E8 87 38 19 1F 00 16 04 24 00 0F 00 60 88 38 19 1C D8 88 38 19 00 E8 87 38 19 16 
    //07 37 00 7A 00 60 88 38 19 1F 00 16 0F 00 60 88 38 19 00 E8 87 38 19 0F 00 60 88 38 19 EE 00 60 
    //88 38 19 16 05 00 00 60 88 38 19 0A 53 00 1F 6D 70 33 00 0A 5E 00 1F 6F 67 67 00 04 24 04 0A 66 
    //00 1F 77 61 76 00 0A 71 00 1F 75 6D 78 00 04 24 06 0A 7C 00 1F 73 62 77 00 04 24 07 0A 87 00 1F 
    //73 62 61 00 04 24 09 0A 92 00 1F 73 62 73 00 04 24 0D 0A 9D 00 1F 73 62 74 00 04 24 08 0A A8 00 
    //1F 64 65 6D 00 04 24 0E 0A B3 00 1F 73 62 6D 00 04 24 0A 0A BE 00 1F 69 6E 69 00 04 24 03 0A C9 
    //00 1F 6C 6F 67 00 04 24 02 0A D4 00 1F 61 76 69 00 04 24 0F 0A DF 00 1F 78 6D 6C 00 04 24 0B 0A 
    //E8 00 1F 68 74 6D 6C 00 0A F3 00 1F 68 74 6D 00 04 24 0C 0A FB 00 1F 6D 33 75 00 0A 03 01 1F 62 
    //34 73 00 0A 0E 01 1F 70 6C 73 00 04 24 05 0A 19 01 1F 73 62 67 00 04 24 10 0A FF FF 04 24 00 04 
    //0B 47 
  }


  final static event string ConvertToFileExtension(byte Type) {
    switch (Type) {                                                             //0000 : 05 01 00 B0 8A 38 19 
      case 2 :                                                                  //0007 : 0A 13 00 24 02 
        return ".log";                                                          //000C : 04 1F 2E 6C 6F 67 00 
      case 3 :                                                                  //0013 : 0A 1F 00 24 03 
        return ".ini";                                                          //0018 : 04 1F 2E 69 6E 69 00 
      case 5 :                                                                  //001F : 0A 35 00 24 05 
        return ".m3u;.pls;.b4s";                                                //0024 : 04 1F 2E 6D 33 75 3B 2E 70 6C 73 3B 2E 62 34 73 00 
      case 6 :                                                                  //0035 : 0A 41 00 24 06 
        return ".umx";                                                          //003A : 04 1F 2E 75 6D 78 00 
      case 7 :                                                                  //0041 : 0A 4D 00 24 07 
        return ".sbw";                                                          //0046 : 04 1F 2E 73 62 77 00 
      case 8 :                                                                  //004D : 0A 59 00 24 08 
        return ".sbt";                                                          //0052 : 04 1F 2E 73 62 74 00 
      case 9 :                                                                  //0059 : 0A 65 00 24 09 
        return ".sba";                                                          //005E : 04 1F 2E 73 62 61 00 
      case 10 :                                                                 //0065 : 0A 71 00 24 0A 
        return ".sbm";                                                          //006A : 04 1F 2E 73 62 6D 00 
      case 11 :                                                                 //0071 : 0A 7D 00 24 0B 
        return ".xml";                                                          //0076 : 04 1F 2E 78 6D 6C 00 
      case 12 :                                                                 //007D : 0A 8F 00 24 0C 
        return ".html;.htm";                                                    //0082 : 04 1F 2E 68 74 6D 6C 3B 2E 68 74 6D 00 
      case 13 :                                                                 //008F : 0A 9B 00 24 0D 
        return ".sbs";                                                          //0094 : 04 1F 2E 73 62 73 00 
      case 14 :                                                                 //009B : 0A A9 00 24 0E 
        return ".DEMO4";                                                        //00A0 : 04 1F 2E 44 45 4D 4F 34 00 
      case 15 :                                                                 //00A9 : 0A B5 00 24 0F 
        return ".avi";                                                          //00AE : 04 1F 2E 61 76 69 00 
      case 4 :                                                                  //00B5 : 0A C6 00 24 04 
        return ".mp3;.ogg";                                                     //00BA : 04 1F 2E 6D 70 33 3B 2E 6F 67 67 00 
      case 16 :                                                                 //00C6 : 0A D2 00 24 10 
        return ".sbg";                                                          //00CB : 04 1F 2E 73 62 67 00 
      default:                                                                  //00D2 : 0A FF FF 
        return "";                                                              //00D5 : 04 1F 00 
      }
    }
    //05 01 00 B0 8A 38 19 0A 13 00 24 02 04 1F 2E 6C 6F 67 00 0A 1F 00 24 03 04 1F 2E 69 6E 69 00 0A 
    //35 00 24 05 04 1F 2E 6D 33 75 3B 2E 70 6C 73 3B 2E 62 34 73 00 0A 41 00 24 06 04 1F 2E 75 6D 78 
    //00 0A 4D 00 24 07 04 1F 2E 73 62 77 00 0A 59 00 24 08 04 1F 2E 73 62 74 00 0A 65 00 24 09 04 1F 
    //2E 73 62 61 00 0A 71 00 24 0A 04 1F 2E 73 62 6D 00 0A 7D 00 24 0B 04 1F 2E 78 6D 6C 00 0A 8F 00 
    //24 0C 04 1F 2E 68 74 6D 6C 3B 2E 68 74 6D 00 0A 9B 00 24 0D 04 1F 2E 73 62 73 00 0A A9 00 24 0E 
    //04 1F 2E 44 45 4D 4F 34 00 0A B5 00 24 0F 04 1F 2E 61 76 69 00 0A C6 00 24 04 04 1F 2E 6D 70 33 
    //3B 2E 6F 67 67 00 0A D2 00 24 10 04 1F 2E 73 62 67 00 0A FF FF 04 1F 00 04 0B 47 
  }


  final static function string FormatTimeDisplay(coerce float Seconds) {
    local int i;
    local string TimeString;
    i = Seconds / 3600;                                                         //0000 : 0F 00 00 8E 38 19 39 44 AC 00 50 8C 38 19 39 3F 1D 10 0E 00 00 16 
    if (i > 0) {                                                                //0016 : 07 33 00 97 00 00 8E 38 19 25 16 
      TimeString = string(i) $ ":";                                             //0021 : 0F 00 78 8E 38 19 70 39 53 00 00 8E 38 19 1F 3A 00 16 
    }
    i = Seconds / 60;                                                           //0033 : 0F 00 00 8E 38 19 39 44 AC 00 50 8C 38 19 39 3F 2C 3C 16 
    if (TimeString != "" && i < 10) {                                           //0046 : 07 6C 00 82 7B 00 78 8E 38 19 1F 00 16 18 0A 00 96 00 00 8E 38 19 2C 0A 16 16 
    }
    i = Seconds % 60;                                                           //0081 : 0F 00 00 8E 38 19 39 44 AD 00 50 8C 38 19 39 3F 2C 3C 16 
    if (i < 10) {                                                               //0094 : 07 AC 00 96 00 00 8E 38 19 2C 0A 16 
    }
    return TimeString;                                                          //00BC : 04 00 78 8E 38 19 
    //0F 00 00 8E 38 19 39 44 AC 00 50 8C 38 19 39 3F 1D 10 0E 00 00 16 07 33 00 97 00 00 8E 38 19 25 
    //16 0F 00 78 8E 38 19 70 39 53 00 00 8E 38 19 1F 3A 00 16 0F 00 00 8E 38 19 39 44 AC 00 50 8C 38 
    //19 39 3F 2C 3C 16 07 6C 00 82 7B 00 78 8E 38 19 1F 00 16 18 0A 00 96 00 00 8E 38 19 2C 0A 16 16 
    //0E 61 42 00 78 8E 38 19 1F 30 00 16 0E 61 42 00 78 8E 38 19 70 39 53 00 00 8E 38 19 1F 3A 00 16 
    //16 0F 00 00 8E 38 19 39 44 AD 00 50 8C 38 19 39 3F 2C 3C 16 07 AC 00 96 00 00 8E 38 19 2C 0A 16 
    //0E 61 42 00 78 8E 38 19 1F 30 00 16 0E 61 42 00 78 8E 38 19 39 53 00 00 8E 38 19 16 04 00 78 8E 
    //38 19 04 0B 47 
  }


  final static function int RevInStr(string src,string match) {
    local int pos;
    local int i;
    local string s;
    if (src == "" || match == "") {                                             //0000 : 07 20 00 84 7A 00 18 90 38 19 1F 00 16 18 0A 00 7A 00 90 90 38 19 1F 00 16 16 
      return -1;                                                                //001A : 04 1D FF FF FF FF 
    }
    s = src;                                                                    //0020 : 0F 00 08 91 38 19 00 18 90 38 19 
    i = InStr(s,match);                                                         //002B : 0F 00 80 91 38 19 7E 00 08 91 38 19 00 90 90 38 19 16 
    pos += i;                                                                   //003D : A1 00 F8 91 38 19 00 80 91 38 19 16 
    s = Mid(src,pos + 1);                                                       //0049 : 0F 00 08 91 38 19 7F 00 18 90 38 19 92 00 F8 91 38 19 26 16 16 
    i = InStr(s,match) + 1;                                                     //005E : 0F 00 80 91 38 19 92 7E 00 08 91 38 19 00 90 90 38 19 16 26 16 
    if (!i == 0) goto jl003D;                                                   //0073 : 07 3D 00 9A 00 80 91 38 19 25 16 
    return pos;                                                                 //007E : 04 00 F8 91 38 19 
    //07 20 00 84 7A 00 18 90 38 19 1F 00 16 18 0A 00 7A 00 90 90 38 19 1F 00 16 16 04 1D FF FF FF FF 
    //0F 00 08 91 38 19 00 18 90 38 19 0F 00 80 91 38 19 7E 00 08 91 38 19 00 90 90 38 19 16 A1 00 F8 
    //91 38 19 00 80 91 38 19 16 0F 00 08 91 38 19 7F 00 18 90 38 19 92 00 F8 91 38 19 26 16 16 0F 00 
    //80 91 38 19 92 7E 00 08 91 38 19 00 90 90 38 19 16 26 16 07 3D 00 9A 00 80 91 38 19 25 16 04 00 
    //F8 91 38 19 04 0B 47 
  }


  final static event array<string> ParseDirectories(out string InPath) {
    local array<string> Directories;
    local string root;
    root = static.GetPathRoot(InPath);                                          //0000 : 0F 00 50 94 38 19 1C C8 94 38 19 00 E8 92 38 19 16 
    Split(InPath,static.GetPathSeparator(),Directories);                        //0011 : F0 00 E8 92 38 19 1C 78 95 38 19 16 00 28 96 38 19 16 
    InPath = "";                                                                //0023 : 0F 00 E8 92 38 19 1F 00 
    if (root != "") {                                                           //002B : 07 4C 00 7B 00 50 94 38 19 1F 00 16 
      Directories.Insert(0,1);                                                  //0037 : 40 00 28 96 38 19 25 26 
      Directories[0] = root;                                                    //003F : 0F 10 25 00 28 96 38 19 00 50 94 38 19 
    }
    if (static.HasExtension(Directories[Directories.Length - 1])) {             //004C : 07 89 00 1C A0 96 38 19 10 93 37 00 28 96 38 19 26 16 00 28 96 38 19 16 
      InPath = Directories[Directories.Length - 1];                             //0064 : 0F 00 E8 92 38 19 10 93 37 00 28 96 38 19 26 16 00 28 96 38 19 
      Directories.Length = Directories.Length - 1;                              //0079 : 0F 37 00 28 96 38 19 93 37 00 28 96 38 19 26 16 
    }
    return Directories;                                                         //0089 : 04 00 28 96 38 19 
    //0F 00 50 94 38 19 1C C8 94 38 19 00 E8 92 38 19 16 F0 00 E8 92 38 19 1C 78 95 38 19 16 00 28 96 
    //38 19 16 0F 00 E8 92 38 19 1F 00 07 4C 00 7B 00 50 94 38 19 1F 00 16 40 00 28 96 38 19 25 26 0F 
    //10 25 00 28 96 38 19 00 50 94 38 19 07 89 00 1C A0 96 38 19 10 93 37 00 28 96 38 19 26 16 00 28 
    //96 38 19 16 0F 00 E8 92 38 19 10 93 37 00 28 96 38 19 26 16 00 28 96 38 19 0F 37 00 28 96 38 19 
    //93 37 00 28 96 38 19 26 16 04 00 28 96 38 19 04 0B 47 
  }


  final static event string ParseExtension(out string FileNameWithExtension) {
    local int i;
    local string Ext;
    if (FileNameWithExtension == "") {                                          //0000 : 07 0F 00 7A 00 68 99 38 19 1F 00 16 
      return "";                                                                //000C : 04 1F 00 
    }
    i = static.RevInStr(FileNameWithExtension,".");                             //000F : 0F 00 E0 99 38 19 1C A0 8B 38 19 00 68 99 38 19 1F 2E 00 16 
    if (i >= 0) {                                                               //0023 : 07 43 00 99 00 E0 99 38 19 25 16 
      Ext = Mid(FileNameWithExtension,i + 1);                                   //002E : 0F 00 58 9A 38 19 7F 00 68 99 38 19 92 00 E0 99 38 19 26 16 16 
    }
    if (static.ConvertToFileType(Ext) != 0) {                                   //0043 : 07 73 00 9B 39 3A 1C 70 84 38 19 00 58 9A 38 19 16 39 3A 24 00 16 
      FileNameWithExtension = Left(FileNameWithExtension,i);                    //0059 : 0F 00 68 99 38 19 80 00 68 99 38 19 00 E0 99 38 19 16 
      return Locs(Ext);                                                         //006B : 04 EE 00 58 9A 38 19 16 
    }
    return "";                                                                  //0073 : 04 1F 00 
    //07 0F 00 7A 00 68 99 38 19 1F 00 16 04 1F 00 0F 00 E0 99 38 19 1C A0 8B 38 19 00 68 99 38 19 1F 
    //2E 00 16 07 43 00 99 00 E0 99 38 19 25 16 0F 00 58 9A 38 19 7F 00 68 99 38 19 92 00 E0 99 38 19 
    //26 16 16 07 73 00 9B 39 3A 1C 70 84 38 19 00 58 9A 38 19 16 39 3A 24 00 16 0F 00 68 99 38 19 80 
    //00 68 99 38 19 00 E0 99 38 19 16 04 EE 00 58 9A 38 19 16 04 1F 00 04 0B 47 
  }


  final static event bool ParsePath(string InPath,out FilePath ParsedPath) {
    local int i;
    if (InPath == "") {                                                         //0000 : 07 0E 00 7A 00 48 9B 38 19 1F 00 16 
      return False;                                                             //000C : 04 28 
    }
    ParsedPath.FullPath = InPath;                                               //000E : 0F 36 48 9C 38 19 00 C0 9C 38 19 00 48 9B 38 19 
    i = static.RevInStr(InPath,static.GetPathSeparator());                      //001E : 0F 00 38 9D 38 19 1C A0 8B 38 19 00 48 9B 38 19 1C 78 95 38 19 16 16 
    if (i != -1) {                                                              //0035 : 07 5E 00 9B 00 38 9D 38 19 1D FF FF FF FF 16 
      ParsedPath.Directory = Left(InPath,i + 1);                                //0044 : 0F 36 B0 9D 38 19 00 C0 9C 38 19 80 00 48 9B 38 19 92 00 38 9D 38 19 26 16 16 
    }
    ParsedPath.DirectoryParts = static.ParseDirectories(InPath);                //005E : 0F 36 28 9E 38 19 00 C0 9C 38 19 1C 68 8F 38 19 00 48 9B 38 19 16 
    ParsedPath.Extension = static.ParseExtension(InPath);                       //0074 : 0F 36 A0 9E 38 19 00 C0 9C 38 19 1C D8 88 38 19 00 48 9B 38 19 16 
    ParsedPath.fileName = InPath;                                               //008A : 0F 36 18 9F 38 19 00 C0 9C 38 19 00 48 9B 38 19 
    return ParsedPath.DirectoryParts.Length > 0
      || ParsedPath.Extension != "" && ParsedPath.fileName != "";//009A : 04 84 97 37 36 28 9E 38 19 00 C0 9C 38 19 25 16 18 22 00 82 7B 36 A0 9E 38 19 00 C0 9C 38 19 1F 00 16 18 0F 00 7B 36 18 9F 38 19 00 C0 9C 38 19 1F 00 16 16 16 
    //07 0E 00 7A 00 48 9B 38 19 1F 00 16 04 28 0F 36 48 9C 38 19 00 C0 9C 38 19 00 48 9B 38 19 0F 00 
    //38 9D 38 19 1C A0 8B 38 19 00 48 9B 38 19 1C 78 95 38 19 16 16 07 5E 00 9B 00 38 9D 38 19 1D FF 
    //FF FF FF 16 0F 36 B0 9D 38 19 00 C0 9C 38 19 80 00 48 9B 38 19 92 00 38 9D 38 19 26 16 16 0F 36 
    //28 9E 38 19 00 C0 9C 38 19 1C 68 8F 38 19 00 48 9B 38 19 16 0F 36 A0 9E 38 19 00 C0 9C 38 19 1C 
    //D8 88 38 19 00 48 9B 38 19 16 0F 36 18 9F 38 19 00 C0 9C 38 19 00 48 9B 38 19 04 84 97 37 36 28 
    //9E 38 19 00 C0 9C 38 19 25 16 18 22 00 82 7B 36 A0 9E 38 19 00 C0 9C 38 19 1F 00 16 18 0F 00 7B 
    //36 18 9F 38 19 00 C0 9C 38 19 1F 00 16 16 16 04 0B 47 
  }


  final static event bool HasExtension(string Test) {
    return static.ParseExtension(Test) != "";                                   //0000 : 04 7B 1C D8 88 38 19 00 80 A0 38 19 16 1F 00 16 
    //04 7B 1C D8 88 38 19 00 80 A0 38 19 16 1F 00 16 04 0B 47 
  }


  final static event string GetPathRoot(out string InPath) {
    local int i;
    local string root;
    i = InStr(InPath,static.GetPathSeparator() $ static.GetPathSeparator());    //0000 : 0F 00 C8 A2 38 19 7E 00 70 A1 38 19 70 1C 78 95 38 19 16 1C 78 95 38 19 16 16 16 
    if (i == -1) {                                                              //001B : 07 42 00 9A 00 C8 A2 38 19 1D FF FF FF FF 16 
      i = InStr(InPath,":" $ static.GetPathSeparator());                        //002A : 0F 00 C8 A2 38 19 7E 00 70 A1 38 19 70 1F 3A 00 1C 78 95 38 19 16 16 16 
    }
    if (i != -1) {                                                              //0042 : 07 7C 00 9B 00 C8 A2 38 19 1D FF FF FF FF 16 
      root = Left(InPath,i + 1);                                                //0051 : 0F 00 40 A3 38 19 80 00 70 A1 38 19 92 00 C8 A2 38 19 26 16 16 
      InPath = Mid(InPath,i + 2);                                               //0066 : 0F 00 70 A1 38 19 7F 00 70 A1 38 19 92 00 C8 A2 38 19 2C 02 16 16 
    }
    return root;                                                                //007C : 04 00 40 A3 38 19 
    //0F 00 C8 A2 38 19 7E 00 70 A1 38 19 70 1C 78 95 38 19 16 1C 78 95 38 19 16 16 16 07 42 00 9A 00 
    //C8 A2 38 19 1D FF FF FF FF 16 0F 00 C8 A2 38 19 7E 00 70 A1 38 19 70 1F 3A 00 1C 78 95 38 19 16 
    //16 16 07 7C 00 9B 00 C8 A2 38 19 1D FF FF FF FF 16 0F 00 40 A3 38 19 80 00 70 A1 38 19 92 00 C8 
    //A2 38 19 26 16 16 0F 00 70 A1 38 19 7F 00 70 A1 38 19 92 00 C8 A2 38 19 2C 02 16 16 04 00 40 A3 
    //38 19 04 0B 47 
  }


  final static native function bool IsCaseSensitive();


  final static native function string GetPathSeparator();


  final static native operator(44) string *=(out string A,coerce string B);


  final static native operator(40) string *(coerce string A,coerce string B);



