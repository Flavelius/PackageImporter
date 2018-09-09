//==============================================================================
//  Game_TextParser
//==============================================================================

class Game_TextParser extends Base_Component within Game_Controller
    native
    dependsOn()
  ;

  enum ETextParseFlags {
    ETP_PawnProperties ,
    ETP_ContentProperties ,
    ETP_Style ,
    ETP_Reserved 
  };


  static native function string GetActiveText(Game_ActiveTextItem aItem);


  native function string Parse(string aActiveText,Object aSpeaker,Object aSubject,Object aTarget,int aFlags);



