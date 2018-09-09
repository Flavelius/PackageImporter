//==============================================================================
//  PlayInfo
//==============================================================================

class PlayInfo extends Object
    native
    dependsOn(Class,Info)
  ;

  enum EPlayInfoType {
    PIT_Check ,
    PIT_Select ,
    PIT_Text ,
    PIT_Custom 
  };

  struct PlayInfoData {
      var const Property ThisProp;
      var const class<Info> ClassFrom;
      var const string SettingName;
      var const string DisplayName;
      var const string Description;
      var const string Grouping;
      var const string Data;
      var const string ExtraPriv;
      var const string Value;
      var const byte RenderType;
      var const byte SecLevel;
      var const byte Weight;
      var const bool bMPOnly;
      var const bool bAdvanced;
      var const bool bGlobal;
      var const bool bStruct;
      var const int ArrayDim;

  };


  var const array<PlayInfoData> Settings;
  var const array<class<Info>> InfoClasses;
  var const array<int> ClassStack;
  var const array<string> Groups;
  var const string LastError;


  final function SplitStringToArray(out array<string> Parts,string Source,string Delim) {
    Split(Source,Delim,Parts);                                                  //0000 : F0 00 08 0A 7C 0F 00 80 0A 7C 0F 00 48 09 7C 0F 16 
    //F0 00 08 0A 7C 0F 00 80 0A 7C 0F 00 48 09 7C 0F 16 04 0B 47 
  }


  final function class<GameInfo> GetGameInfo() {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 38 0D 7C 0F 25 
    while (i < InfoClasses.Length) {                                            //0007 : 07 48 00 96 00 38 0D 7C 0F 37 01 B0 0D 7C 0F 16 
      if (Class<GameInfo>(InfoClasses[i]) != None) {                            //0017 : 07 3E 00 77 13 58 B6 C1 00 10 00 38 0D 7C 0F 01 B0 0D 7C 0F 2A 16 
        return Class<GameInfo>(InfoClasses[i]);                                 //002D : 04 13 58 B6 C1 00 10 00 38 0D 7C 0F 01 B0 0D 7C 0F 
      }
      i++;                                                                      //003E : A5 00 38 0D 7C 0F 16 
    }
    return None;                                                                //0048 : 04 2A 
    //0F 00 38 0D 7C 0F 25 07 48 00 96 00 38 0D 7C 0F 37 01 B0 0D 7C 0F 16 07 3E 00 77 13 58 B6 C1 00 
    //10 00 38 0D 7C 0F 01 B0 0D 7C 0F 2A 16 04 13 58 B6 C1 00 10 00 38 0D 7C 0F 01 B0 0D 7C 0F A5 00 
    //38 0D 7C 0F 16 06 07 00 04 2A 04 0B 47 
  }


  final function bool Init(array<class<Info>> Classes,optional bool bStrict) {
    local int i;
    local int j;
    local bool B;
    if (Classes.Length == 0) {                                                  //0000 : 07 13 00 9A 37 00 D8 0E 7C 0F 25 16 
      return B;                                                                 //000C : 04 2D 00 80 11 7C 0F 
    }
    B = True;                                                                   //0013 : 14 2D 00 80 11 7C 0F 27 
    Clear();                                                                    //001B : 62 BC 16 
    i = 0;                                                                      //001E : 0F 00 F8 11 7C 0F 25 
    while (i < Classes.Length) {                                                //0025 : 07 CD 00 96 00 F8 11 7C 0F 37 00 D8 0E 7C 0F 16 
      if (Classes[i] == None) {                                                 //0035 : 07 AD 00 72 10 00 F8 11 7C 0F 00 D8 0E 7C 0F 2A 16 
        Log("Call in PlayInfo.Init() with 'None' value for Class array member.  Index:"
          $ string(i));//0046 : E7 70 1F 43 61 6C 6C 20 69 6E 20 50 6C 61 79 49 6E 66 6F 2E 49 6E 69 74 28 29 20 77 69 74 68 20 27 4E 6F 6E 65 27 20 76 61 6C 75 65 20 66 6F 72 20 43 6C 61 73 73 20 61 72 72 61 79 20 6D 65 6D 62 65 72 2E 20 20 49 6E 64 65 78 3A 00 39 53 00 F8 11 7C 0F 16 16 
        Classes.Remove(i--,1);                                                  //009C : 41 00 D8 0E 7C 0F A6 00 F8 11 7C 0F 16 26 
      } else {                                                                  //00AA : 06 C3 00 
        Classes[i].FillPlayInfo(self);                                          //00AD : 12 10 00 F8 11 7C 0F 00 D8 0E 7C 0F 07 00 00 1B BC 2B 00 00 17 16 
      }
      i++;                                                                      //00C3 : A5 00 F8 11 7C 0F 16 
    }
    if (bStrict) {                                                              //00CD : 07 6C 01 2D 00 70 12 7C 0F 
      i = InfoClasses.Length - 1;                                               //00D6 : 0F 00 F8 11 7C 0F 93 37 01 B0 0D 7C 0F 26 16 
      while (i >= 0) {                                                          //00E5 : 07 6C 01 99 00 F8 11 7C 0F 25 16 
        j = 0;                                                                  //00F0 : 0F 00 E8 12 7C 0F 25 
        while (j < Classes.Length) {                                            //00F7 : 07 2F 01 96 00 E8 12 7C 0F 37 00 D8 0E 7C 0F 16 
          if (InfoClasses[i] == Classes[j]) {                                   //0107 : 07 25 01 72 10 00 F8 11 7C 0F 01 B0 0D 7C 0F 10 00 E8 12 7C 0F 00 D8 0E 7C 0F 16 
            goto jl012F;                                                        //0122 : 06 2F 01 
          }
          j++;                                                                  //0125 : A5 00 E8 12 7C 0F 16 
        }
        if (j < Classes.Length) {                                               //012F : 07 42 01 96 00 E8 12 7C 0F 37 00 D8 0E 7C 0F 16 
        } else {                                                                //013F : 06 62 01 
          B = B && RemoveClass(InfoClasses[i]);                                 //0142 : 14 2D 00 80 11 7C 0F 82 2D 00 80 11 7C 0F 18 0F 00 62 BE 10 00 F8 11 7C 0F 01 B0 0D 7C 0F 16 16 
        }
        i--;                                                                    //0162 : A6 00 F8 11 7C 0F 16 
      }
    }
    return B;                                                                   //016C : 04 2D 00 80 11 7C 0F 
    //07 13 00 9A 37 00 D8 0E 7C 0F 25 16 04 2D 00 80 11 7C 0F 14 2D 00 80 11 7C 0F 27 62 BC 16 0F 00 
    //F8 11 7C 0F 25 07 CD 00 96 00 F8 11 7C 0F 37 00 D8 0E 7C 0F 16 07 AD 00 72 10 00 F8 11 7C 0F 00 
    //D8 0E 7C 0F 2A 16 E7 70 1F 43 61 6C 6C 20 69 6E 20 50 6C 61 79 49 6E 66 6F 2E 49 6E 69 74 28 29 
    //20 77 69 74 68 20 27 4E 6F 6E 65 27 20 76 61 6C 75 65 20 66 6F 72 20 43 6C 61 73 73 20 61 72 72 
    //61 79 20 6D 65 6D 62 65 72 2E 20 20 49 6E 64 65 78 3A 00 39 53 00 F8 11 7C 0F 16 16 41 00 D8 0E 
    //7C 0F A6 00 F8 11 7C 0F 16 26 06 C3 00 12 10 00 F8 11 7C 0F 00 D8 0E 7C 0F 07 00 00 1B BC 2B 00 
    //00 17 16 A5 00 F8 11 7C 0F 16 06 25 00 07 6C 01 2D 00 70 12 7C 0F 0F 00 F8 11 7C 0F 93 37 01 B0 
    //0D 7C 0F 26 16 07 6C 01 99 00 F8 11 7C 0F 25 16 0F 00 E8 12 7C 0F 25 07 2F 01 96 00 E8 12 7C 0F 
    //37 00 D8 0E 7C 0F 16 07 25 01 72 10 00 F8 11 7C 0F 01 B0 0D 7C 0F 10 00 E8 12 7C 0F 00 D8 0E 7C 
    //0F 16 06 2F 01 A5 00 E8 12 7C 0F 16 06 F7 00 07 42 01 96 00 E8 12 7C 0F 37 00 D8 0E 7C 0F 16 06 
    //62 01 14 2D 00 80 11 7C 0F 82 2D 00 80 11 7C 0F 18 0F 00 62 BE 10 00 F8 11 7C 0F 01 B0 0D 7C 0F 
    //16 16 A6 00 F8 11 7C 0F 16 06 E5 00 04 2D 00 80 11 7C 0F 04 0B 47 
  }


  final function Dump(optional string Group) {
    local int i;
    Log("** Dumping settings array for PlayInfo object '"
      $ string(Name)
      $ "' **");//0000 : E7 70 70 1F 2A 2A 20 44 75 6D 70 69 6E 67 20 73 65 74 74 69 6E 67 73 20 61 72 72 61 79 20 66 6F 72 20 50 6C 61 79 49 6E 66 6F 20 6F 62 6A 65 63 74 20 27 00 39 57 01 F0 E4 6B 0F 16 1F 27 20 2A 2A 00 16 16 
    Log("** Classes:" @ string(InfoClasses.Length));                            //0044 : E7 A8 1F 2A 2A 20 43 6C 61 73 73 65 73 3A 00 39 53 37 01 B0 0D 7C 0F 16 16 
    i = 0;                                                                      //005D : 0F 00 80 1B 7C 0F 25 
    while (i < InfoClasses.Length) {                                            //0064 : 07 AB 00 96 00 80 1B 7C 0F 37 01 B0 0D 7C 0F 16 
      Log("   " $ string(i) $ ")" @ string(InfoClasses[i].Name));               //0074 : E7 A8 70 70 1F 20 20 20 00 39 53 00 80 1B 7C 0F 16 1F 29 00 16 39 57 19 10 00 80 1B 7C 0F 01 B0 0D 7C 0F 05 00 04 01 F0 E4 6B 0F 16 16 
      i++;                                                                      //00A1 : A5 00 80 1B 7C 0F 16 
    }
    Log("");                                                                    //00AB : E7 1F 00 16 
    Log("** Groups:" @ string(Groups.Length));                                  //00AF : E7 A8 1F 2A 2A 20 47 72 6F 75 70 73 3A 00 39 53 37 01 F8 1B 7C 0F 16 16 
    i = 0;                                                                      //00C7 : 0F 00 80 1B 7C 0F 25 
    while (i < Groups.Length) {                                                 //00CE : 07 0A 01 96 00 80 1B 7C 0F 37 01 F8 1B 7C 0F 16 
      Log("   " $ string(i) $ ")" @ Groups[i]);                                 //00DE : E7 A8 70 70 1F 20 20 20 00 39 53 00 80 1B 7C 0F 16 1F 29 00 16 10 00 80 1B 7C 0F 01 F8 1B 7C 0F 16 16 
      i++;                                                                      //0100 : A5 00 80 1B 7C 0F 16 
    }
    Log("");                                                                    //010A : E7 1F 00 16 
    Log("** Settings:" @ string(Settings.Length));                              //010E : E7 A8 1F 2A 2A 20 53 65 74 74 69 6E 67 73 3A 00 39 53 37 01 70 1C 7C 0F 16 16 
    i = 0;                                                                      //0128 : 0F 00 80 1B 7C 0F 25 
    while (i < Settings.Length) {                                               //012F : 07 3C 04 96 00 80 1B 7C 0F 37 01 70 1C 7C 0F 16 
      if (Group == "" || Group ~= Settings[i].Grouping) {                       //013F : 07 32 04 84 7A 00 08 15 7C 0F 1F 00 16 18 18 00 7C 00 08 15 7C 0F 36 E8 1C 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 
        Log(string(i) $ ")" @ Settings[i].SettingName);                         //0167 : E7 A8 70 39 53 00 80 1B 7C 0F 1F 29 00 16 36 60 1D 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 
        Log("            DisplayName:" @ Settings[i].DisplayName);              //0187 : E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 20 44 69 73 70 6C 61 79 4E 61 6D 65 3A 00 36 D8 1D 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 
        Log("              ClassFrom:" @ string(Settings[i].ClassFrom));        //01B5 : E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 20 20 20 43 6C 61 73 73 46 72 6F 6D 3A 00 39 56 36 50 1E 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 
        Log("                  Group:" @ Settings[i].Grouping);                 //01E5 : E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 47 72 6F 75 70 3A 00 36 E8 1C 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 
        Log("                  Value:" @ Settings[i].Value);                    //0213 : E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 56 61 6C 75 65 3A 00 36 D0 1E 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 
        Log("                   Data:" @ Settings[i].Data);                     //0241 : E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 44 61 74 61 3A 00 36 48 1F 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 
        Log("                 Weight:" @ string(Settings[i].Weight));           //026F : E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 57 65 69 67 68 74 3A 00 39 52 36 C0 1F 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 
        Log("                 Struct:" @ string(Settings[i].bStruct));          //029F : E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 53 74 72 75 63 74 3A 00 39 54 2D 36 38 20 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 
        Log("                 Global:" @ string(Settings[i].bGlobal));          //02D0 : E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 47 6C 6F 62 61 6C 3A 00 39 54 2D 36 B0 20 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 
        Log("                 MPOnly:" @ string(Settings[i].bMPOnly));          //0301 : E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 4D 50 4F 6E 6C 79 3A 00 39 54 2D 36 28 21 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 
        Log("               SecLevel:" @ string(Settings[i].SecLevel));         //0332 : E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 53 65 63 4C 65 76 65 6C 3A 00 39 52 36 A0 21 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 
        Log("               ArrayDim:" @ string(Settings[i].ArrayDim));         //0362 : E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 41 72 72 61 79 44 69 6D 3A 00 39 53 36 18 22 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 
        Log("              bAdvanced:" @ string(Settings[i].bAdvanced));        //0392 : E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 20 20 20 62 41 64 76 61 6E 63 65 64 3A 00 39 54 2D 36 90 22 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 
        Log("              ExtraPriv:" @ Settings[i].ExtraPriv);                //03C3 : E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 20 20 20 45 78 74 72 61 50 72 69 76 3A 00 36 08 23 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 
        Log("             RenderType:"
          @ string(static.GetEnum(Enum'EPlayInfoType',Settings[i].RenderType)));//03F1 : E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 20 20 52 65 6E 64 65 72 54 79 70 65 3A 00 39 57 1C B8 E9 69 0F 20 80 23 7C 0F 39 3A 36 D0 23 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 16 
        Log("");                                                                //042E : E7 1F 00 16 
      }
      i++;                                                                      //0432 : A5 00 80 1B 7C 0F 16 
    }
    //E7 70 70 1F 2A 2A 20 44 75 6D 70 69 6E 67 20 73 65 74 74 69 6E 67 73 20 61 72 72 61 79 20 66 6F 
    //72 20 50 6C 61 79 49 6E 66 6F 20 6F 62 6A 65 63 74 20 27 00 39 57 01 F0 E4 6B 0F 16 1F 27 20 2A 
    //2A 00 16 16 E7 A8 1F 2A 2A 20 43 6C 61 73 73 65 73 3A 00 39 53 37 01 B0 0D 7C 0F 16 16 0F 00 80 
    //1B 7C 0F 25 07 AB 00 96 00 80 1B 7C 0F 37 01 B0 0D 7C 0F 16 E7 A8 70 70 1F 20 20 20 00 39 53 00 
    //80 1B 7C 0F 16 1F 29 00 16 39 57 19 10 00 80 1B 7C 0F 01 B0 0D 7C 0F 05 00 04 01 F0 E4 6B 0F 16 
    //16 A5 00 80 1B 7C 0F 16 06 64 00 E7 1F 00 16 E7 A8 1F 2A 2A 20 47 72 6F 75 70 73 3A 00 39 53 37 
    //01 F8 1B 7C 0F 16 16 0F 00 80 1B 7C 0F 25 07 0A 01 96 00 80 1B 7C 0F 37 01 F8 1B 7C 0F 16 E7 A8 
    //70 70 1F 20 20 20 00 39 53 00 80 1B 7C 0F 16 1F 29 00 16 10 00 80 1B 7C 0F 01 F8 1B 7C 0F 16 16 
    //A5 00 80 1B 7C 0F 16 06 CE 00 E7 1F 00 16 E7 A8 1F 2A 2A 20 53 65 74 74 69 6E 67 73 3A 00 39 53 
    //37 01 70 1C 7C 0F 16 16 0F 00 80 1B 7C 0F 25 07 3C 04 96 00 80 1B 7C 0F 37 01 70 1C 7C 0F 16 07 
    //32 04 84 7A 00 08 15 7C 0F 1F 00 16 18 18 00 7C 00 08 15 7C 0F 36 E8 1C 7C 0F 10 00 80 1B 7C 0F 
    //01 70 1C 7C 0F 16 16 E7 A8 70 39 53 00 80 1B 7C 0F 1F 29 00 16 36 60 1D 7C 0F 10 00 80 1B 7C 0F 
    //01 70 1C 7C 0F 16 16 E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 20 44 69 73 70 6C 61 79 4E 61 6D 
    //65 3A 00 36 D8 1D 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 E7 A8 1F 20 20 20 20 20 20 20 20 
    //20 20 20 20 20 20 43 6C 61 73 73 46 72 6F 6D 3A 00 39 56 36 50 1E 7C 0F 10 00 80 1B 7C 0F 01 70 
    //1C 7C 0F 16 16 E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 47 72 6F 75 70 3A 
    //00 36 E8 1C 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 E7 A8 1F 20 20 20 20 20 20 20 20 20 20 
    //20 20 20 20 20 20 20 20 56 61 6C 75 65 3A 00 36 D0 1E 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 
    //16 E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 44 61 74 61 3A 00 36 48 1F 
    //7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 20 20 20 
    //20 20 20 57 65 69 67 68 74 3A 00 39 52 36 C0 1F 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 E7 
    //A8 1F 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 53 74 72 75 63 74 3A 00 39 54 2D 36 38 
    //20 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 20 20 
    //20 20 20 20 47 6C 6F 62 61 6C 3A 00 39 54 2D 36 B0 20 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 
    //16 E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 4D 50 4F 6E 6C 79 3A 00 39 54 2D 
    //36 28 21 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 
    //20 20 20 20 53 65 63 4C 65 76 65 6C 3A 00 39 52 36 A0 21 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 
    //16 16 E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 41 72 72 61 79 44 69 6D 3A 00 39 53 
    //36 18 22 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 
    //20 20 20 62 41 64 76 61 6E 63 65 64 3A 00 39 54 2D 36 90 22 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 
    //0F 16 16 E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 20 20 20 45 78 74 72 61 50 72 69 76 3A 00 36 
    //08 23 7C 0F 10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 E7 A8 1F 20 20 20 20 20 20 20 20 20 20 20 20 
    //20 52 65 6E 64 65 72 54 79 70 65 3A 00 39 57 1C B8 E9 69 0F 20 80 23 7C 0F 39 3A 36 D0 23 7C 0F 
    //10 00 80 1B 7C 0F 01 70 1C 7C 0F 16 16 16 E7 1F 00 16 A5 00 80 1B 7C 0F 16 06 2F 01 04 0B 47 
  }


  final native(709) function Sort(byte SortingMethod);


  final native(708) function int FindIndex(string SettingName);


  final native(707) function bool GetSettings(string GroupName,out array<PlayInfoData> GroupSettings);


  final native(706) function bool StoreSetting(int Index,coerce string NewVal,optional string RangeData);


  final native(705) function bool SaveSettings();


  final native(704) function bool AddSetting(string Group,string PropertyName,string Description,byte SecLevel,byte Weight,string RenderType,optional string Extras,optional string ExtraPrivs,optional bool bMultiPlayerOnly,optional bool bAdvanced);


  final native(703) function bool PopClass();


  final native(702) function bool RemoveClass(class<Info> RemovingClass);


  final native(701) function bool AddClass(class<Info> AddingClass);


  final native(700) function bool Clear();



