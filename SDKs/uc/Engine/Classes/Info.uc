//==============================================================================
//  Info
//==============================================================================

class Info extends Actor
    native
    abstract
    dependsOn(PlayInfo)
  ;


  static event string GetDescriptionText(string PropName) {
    return "";                                                                  //0000 : 04 1F 00 
    //04 1F 00 04 0B 47 
  }


  static event byte GetSecurityLevel(string PropName) {
    return 0;                                                                   //0000 : 04 24 00 
    //04 24 00 04 0B 47 
  }


  static event bool AllowClassRemoval() {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }


  static event bool AcceptPlayInfoProperty(string PropertyName) {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }


  static function FillPlayInfo(PlayInfo PlayInfo) {
    PlayInfo.AddClass(default.Class);                                           //0000 : 19 00 40 6E 72 0F 08 00 04 62 BD 02 68 E5 6B 0F 16 
    //19 00 40 6E 72 0F 08 00 04 62 BD 02 68 E5 6B 0F 16 04 0B 47 
  }



