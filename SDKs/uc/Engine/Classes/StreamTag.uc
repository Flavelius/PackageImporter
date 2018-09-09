//==============================================================================
//  StreamTag
//==============================================================================

class StreamTag extends StreamBase within Stream
    native
    dependsOn()
  ;

  var (StreamTag) const editconst ID3Field TagID;
  var (StreamTag) const editconst ID3Field TrackNumber;
  var (StreamTag) const editconst ID3Field Title;
  var (StreamTag) const editconst ID3Field Artist;
  var (StreamTag) const editconst ID3Field Album;
  var (StreamTag) const editconst ID3Field Year;
  var (StreamTag) const editconst ID3Field Genre;
  var (StreamTag) editconst ID3Field Duration;
  var (StreamTag) const editconstarray editconst array<ID3Field> Fields;
  var private transient int NativeID3Tag[2];
  var (null);


  final native function DumpTag();


  function DumpScriptTag() {
    local int i;
    Log("================");                                                    //0000 : E7 1F 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 00 16 
    Log("      TagID:" $ TagID.FieldName
      @ "#"
      @ TagID.FieldValue); //0014 : E7 A8 A8 70 1F 20 20 20 20 20 20 54 61 67 49 44 3A 00 36 B0 AA 38 19 01 C0 B2 38 19 16 1F 23 00 16 36 28 AB 38 19 01 C0 B2 38 19 16 16 
    Log("TrackNumber:" $ TrackNumber.FieldName
      @ "#"
      @ TrackNumber.FieldValue);//0041 : E7 A8 A8 70 1F 54 72 61 63 6B 4E 75 6D 62 65 72 3A 00 36 B0 AA 38 19 01 38 B3 38 19 16 1F 23 00 16 36 28 AB 38 19 01 38 B3 38 19 16 16 
    Log("      Title:" $ Title.FieldName
      @ "#"
      @ Title.FieldValue); //006E : E7 A8 A8 70 1F 20 20 20 20 20 20 54 69 74 6C 65 3A 00 36 B0 AA 38 19 01 B0 B3 38 19 16 1F 23 00 16 36 28 AB 38 19 01 B0 B3 38 19 16 16 
    Log("     Artist:" $ Artist.FieldName
      @ "#"
      @ Artist.FieldValue);//009B : E7 A8 A8 70 1F 20 20 20 20 20 41 72 74 69 73 74 3A 00 36 B0 AA 38 19 01 28 B4 38 19 16 1F 23 00 16 36 28 AB 38 19 01 28 B4 38 19 16 16 
    Log("      Album:" $ Album.FieldName
      @ "#"
      @ Album.FieldValue); //00C8 : E7 A8 A8 70 1F 20 20 20 20 20 20 41 6C 62 75 6D 3A 00 36 B0 AA 38 19 01 A0 B4 38 19 16 1F 23 00 16 36 28 AB 38 19 01 A0 B4 38 19 16 16 
    Log("       Year:" $ Year.FieldName
      @ "#"
      @ Year.FieldValue);   //00F5 : E7 A8 A8 70 1F 20 20 20 20 20 20 20 59 65 61 72 3A 00 36 B0 AA 38 19 01 18 B5 38 19 16 1F 23 00 16 36 28 AB 38 19 01 18 B5 38 19 16 16 
    Log("      Genre:" $ Genre.FieldName
      @ "#"
      @ Genre.FieldValue); //0122 : E7 A8 A8 70 1F 20 20 20 20 20 20 47 65 6E 72 65 3A 00 36 B0 AA 38 19 01 90 B5 38 19 16 1F 23 00 16 36 28 AB 38 19 01 90 B5 38 19 16 16 
    Log("   Duration:" $ Duration.FieldName
      @ "#"
      @ Duration.FieldValue);//014F : E7 A8 A8 70 1F 20 20 20 44 75 72 61 74 69 6F 6E 3A 00 36 B0 AA 38 19 01 08 B6 38 19 16 1F 23 00 16 36 28 AB 38 19 01 08 B6 38 19 16 16 
    Log("  == All Fields == ");                                                 //017C : E7 1F 20 20 3D 3D 20 41 6C 6C 20 46 69 65 6C 64 73 20 3D 3D 20 00 16 
    i = 0;                                                                      //0193 : 0F 00 30 AF 38 19 25 
    while (i < Fields.Length) {                                                 //019A : 07 19 02 96 00 30 AF 38 19 37 01 80 B6 38 19 16 
      Log("    " $ string(i) $ ") ID:" $ string(Fields[i].FieldID)
        @ "Name:"
        $ Fields[i].FieldName
        @ "Value:"
        $ Fields[i].FieldValue);//01AA : E7 70 A8 70 A8 70 70 70 1F 20 20 20 20 00 39 53 00 30 AF 38 19 16 1F 29 20 49 44 3A 00 16 39 52 36 A0 AB 38 19 10 00 30 AF 38 19 01 80 B6 38 19 16 1F 4E 61 6D 65 3A 00 16 36 B0 AA 38 19 10 00 30 AF 38 19 01 80 B6 38 19 16 1F 56 61 6C 75 65 3A 00 16 36 28 AB 38 19 10 00 30 AF 38 19 01 80 B6 38 19 16 16 
      i++;                                                                      //020F : A5 00 30 AF 38 19 16 
    }
    Log("");                                                                    //0219 : E7 1F 00 16 
    //E7 1F 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 00 16 E7 A8 A8 70 1F 20 20 20 20 20 20 54 
    //61 67 49 44 3A 00 36 B0 AA 38 19 01 C0 B2 38 19 16 1F 23 00 16 36 28 AB 38 19 01 C0 B2 38 19 16 
    //16 E7 A8 A8 70 1F 54 72 61 63 6B 4E 75 6D 62 65 72 3A 00 36 B0 AA 38 19 01 38 B3 38 19 16 1F 23 
    //00 16 36 28 AB 38 19 01 38 B3 38 19 16 16 E7 A8 A8 70 1F 20 20 20 20 20 20 54 69 74 6C 65 3A 00 
    //36 B0 AA 38 19 01 B0 B3 38 19 16 1F 23 00 16 36 28 AB 38 19 01 B0 B3 38 19 16 16 E7 A8 A8 70 1F 
    //20 20 20 20 20 41 72 74 69 73 74 3A 00 36 B0 AA 38 19 01 28 B4 38 19 16 1F 23 00 16 36 28 AB 38 
    //19 01 28 B4 38 19 16 16 E7 A8 A8 70 1F 20 20 20 20 20 20 41 6C 62 75 6D 3A 00 36 B0 AA 38 19 01 
    //A0 B4 38 19 16 1F 23 00 16 36 28 AB 38 19 01 A0 B4 38 19 16 16 E7 A8 A8 70 1F 20 20 20 20 20 20 
    //20 59 65 61 72 3A 00 36 B0 AA 38 19 01 18 B5 38 19 16 1F 23 00 16 36 28 AB 38 19 01 18 B5 38 19 
    //16 16 E7 A8 A8 70 1F 20 20 20 20 20 20 47 65 6E 72 65 3A 00 36 B0 AA 38 19 01 90 B5 38 19 16 1F 
    //23 00 16 36 28 AB 38 19 01 90 B5 38 19 16 16 E7 A8 A8 70 1F 20 20 20 44 75 72 61 74 69 6F 6E 3A 
    //00 36 B0 AA 38 19 01 08 B6 38 19 16 1F 23 00 16 36 28 AB 38 19 01 08 B6 38 19 16 16 E7 1F 20 20 
    //3D 3D 20 41 6C 6C 20 46 69 65 6C 64 73 20 3D 3D 20 00 16 0F 00 30 AF 38 19 25 07 19 02 96 00 30 
    //AF 38 19 37 01 80 B6 38 19 16 E7 70 A8 70 A8 70 70 70 1F 20 20 20 20 00 39 53 00 30 AF 38 19 16 
    //1F 29 20 49 44 3A 00 16 39 52 36 A0 AB 38 19 10 00 30 AF 38 19 01 80 B6 38 19 16 1F 4E 61 6D 65 
    //3A 00 16 36 B0 AA 38 19 10 00 30 AF 38 19 01 80 B6 38 19 16 1F 56 61 6C 75 65 3A 00 16 36 28 AB 
    //38 19 10 00 30 AF 38 19 01 80 B6 38 19 16 16 A5 00 30 AF 38 19 16 06 9A 01 E7 1F 00 16 04 0B 47 
    //
  }


  delegate OnRefresh();



