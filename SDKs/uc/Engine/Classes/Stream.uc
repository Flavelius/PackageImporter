//==============================================================================
//  Stream
//==============================================================================

class Stream extends StreamBase
    native
    dependsOn(StreamTag)
  ;

  var (Stream) editconst int Handle;
  var (Stream) private const editconst string DefaultExtension;
  var (Stream) const editconst editinline StreamTag IDTag;
  var (Stream) private const editconst editinline FilePath PathName;
  var (Stream) private const editconst byte Type;
  var (Stream) const editconst bool bReadOnly;


  function DumpTags() {
    IDTag.DumpTag();                                                            //0000 : 19 01 80 D9 36 0F 06 00 00 1C F0 AC 38 19 16 
    //19 01 80 D9 36 0F 06 00 00 1C F0 AC 38 19 16 04 0B 47 
  }


  function DumpScriptTag() {
    IDTag.DumpScriptTag();                                                      //0000 : 19 01 80 D9 36 0F 06 00 00 1B FF 2A 00 00 16 
    //19 01 80 D9 36 0F 06 00 00 1B FF 2A 00 00 16 04 0B 47 
  }


  event bool SetHandle(int NewHandle) {
    Handle = NewHandle;                                                         //0000 : 0F 01 58 BF 38 19 00 A0 BE 38 19 
    return True;                                                                //000B : 04 27 
    //0F 01 58 BF 38 19 00 A0 BE 38 19 04 27 04 0B 47 
  }


  function string GetSongTitle() {
    if (IDTag == None || IDTag.Title.FieldValue == "") {                        //0000 : 07 2E 00 84 72 01 80 D9 36 0F 2A 16 18 18 00 7A 36 28 AB 38 19 19 01 80 D9 36 0F 05 00 1C 01 B0 B3 38 19 1F 00 16 16 
      return GetFileName();                                                     //0027 : 04 1B D2 2A 00 00 16 
    }
    return IDTag.Title.FieldValue;                                              //002E : 04 36 28 AB 38 19 19 01 80 D9 36 0F 05 00 1C 01 B0 B3 38 19 
    //07 2E 00 84 72 01 80 D9 36 0F 2A 16 18 18 00 7A 36 28 AB 38 19 19 01 80 D9 36 0F 05 00 1C 01 B0 
    //B3 38 19 1F 00 16 16 04 1B D2 2A 00 00 16 04 36 28 AB 38 19 19 01 80 D9 36 0F 05 00 1C 01 B0 B3 
    //38 19 04 0B 47 
  }


  function string GetFullName() {
    return GetFileName() $ "." $ GetExtension();                                //0000 : 04 70 70 1B D2 2A 00 00 16 1F 2E 00 16 1B EF 2B 00 00 16 16 
    //04 70 70 1B D2 2A 00 00 16 1F 2E 00 16 1B EF 2B 00 00 16 16 04 0B 47 
  }


  function string GetPath() {
    return PathName.FullPath;                                                   //0000 : 04 36 48 9C 38 19 01 88 C4 38 19 
    //04 36 48 9C 38 19 01 88 C4 38 19 04 0B 47 
  }


  function string GetExtension() {
    return PathName.Extension;                                                  //0000 : 04 36 A0 9E 38 19 01 88 C4 38 19 
    //04 36 A0 9E 38 19 01 88 C4 38 19 04 0B 47 
  }


  function string GetFileName() {
    return PathName.fileName;                                                   //0000 : 04 36 18 9F 38 19 01 88 C4 38 19 
    //04 36 18 9F 38 19 01 88 C4 38 19 04 0B 47 
  }


  function string GetDirectory() {
    return PathName.Directory;                                                  //0000 : 04 36 B0 9D 38 19 01 88 C4 38 19 
    //04 36 B0 9D 38 19 01 88 C4 38 19 04 0B 47 
  }


  function byte GetType() {
    return Type;                                                                //0000 : 04 01 60 CA 38 19 
    //04 01 60 CA 38 19 04 0B 47 
  }


  function StreamTag GetTag() {
    return IDTag;                                                               //0000 : 04 01 80 D9 36 0F 
    //04 01 80 D9 36 0F 04 0B 47 
  }


  function int GetHandle() {
    return Handle;                                                              //0000 : 04 01 58 BF 38 19 
    //04 01 58 BF 38 19 04 0B 47 
  }


  function bool IsReadOnly() {
    return bReadOnly;                                                           //0000 : 04 2D 01 50 CE 38 19 
    //04 2D 01 50 CE 38 19 04 0B 47 
  }


  final native function bool LoadID3Tag();


  final native function bool SaveID3Tag();



