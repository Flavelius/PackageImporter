//==============================================================================
//  Game_ActiveTextItem
//==============================================================================

class Game_ActiveTextItem extends Object
    native
    dependsOn()
  ;

  enum EActiveTextString {
    ATS_None ,
    ATS_GenderNoun ,
    ATS_GenderGender ,
    ATS_GenderObjective ,
    ATS_GenderSubjective ,
    ATS_GenderPossessive ,
    ATS_House ,
    ATS_DayPart ,
    ATS_Greeting 
  };

  enum EActiveTextType {
    ATT_None ,
    ATT_Speaker ,
    ATT_Subject ,
    ATT_Target ,
    ATT_Reference ,
    ATT_World 
  };

  var int Type;
  var string Tag;
  var int Ordinality;
  var array<string> FreeOptions;
  var Game_ActiveTextItem SubItem;



