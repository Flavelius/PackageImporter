//==============================================================================
//  SceneSubtitles
//==============================================================================

class SceneSubtitles extends Info
    native
    dependsOn()
    Placeable
  ;

  enum ESST_Mode {
    ESST_SkipToNextLine 
  };

  var (SceneSubtitles) localized array<string> SubTitles;
  var int CurrentIndex;


  event Reset() {
    Super.Reset();                                                              //0000 : 1C A8 B4 34 0F 16 
    CurrentIndex = -1;                                                          //0006 : 0F 01 58 CE 7F 0F 1D FF FF FF FF 
    //1C A8 B4 34 0F 16 0F 01 58 CE 7F 0F 1D FF FF FF FF 04 0B 47 
  }


  function string GetSubTitles() {
    if (CurrentIndex >= SubTitles.Length) {                                     //0000 : 07 1B 00 99 01 58 CE 7F 0F 37 01 80 C0 7F 0F 16 
      CurrentIndex = -1;                                                        //0010 : 0F 01 58 CE 7F 0F 1D FF FF FF FF 
    }
    if (CurrentIndex >= 0) {                                                    //001B : 07 32 00 99 01 58 CE 7F 0F 25 16 
      return SubTitles[CurrentIndex];                                           //0026 : 04 10 01 58 CE 7F 0F 01 80 C0 7F 0F 
    }
    return "";                                                                  //0032 : 04 1F 00 
    //07 1B 00 99 01 58 CE 7F 0F 37 01 80 C0 7F 0F 16 0F 01 58 CE 7F 0F 1D FF FF FF FF 07 32 00 99 01 
    //58 CE 7F 0F 25 16 04 10 01 58 CE 7F 0F 01 80 C0 7F 0F 04 1F 00 04 0B 47 
  }


  final native function ProcessEvent(byte Mode);



