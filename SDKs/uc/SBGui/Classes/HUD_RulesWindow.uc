//==============================================================================
//  HUD_RulesWindow
//==============================================================================

class HUD_RulesWindow extends HUD_HelpKnowledgeBase
    dependsOn(SBDBSync)
    Transient
    Config(User)
  ;


  function bool SetTutorialByID(int articleID) {
    local export editinline Help_Article Article;
    Article = Help_Article(Class'SBDBSync'.GetResourceObject(articleID));       //0000 : 0F 00 A0 45 A3 19 2E 78 26 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 A8 44 A3 19 16 
    LoadContent(mHelpTitle,mHelpContent,Article);                               //001F : 1B 9A 98 00 00 01 E8 36 A3 19 01 60 37 A3 19 00 A0 45 A3 19 16 
    return Article != None;                                                     //0034 : 04 77 00 A0 45 A3 19 2A 16 
    //0F 00 A0 45 A3 19 2E 78 26 5D 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 A8 44 A3 19 16 1B 
    //9A 98 00 00 01 E8 36 A3 19 01 60 37 A3 19 00 A0 45 A3 19 16 04 77 00 A0 45 A3 19 2A 16 04 0B 47 
    //
  }


  function Initialize() {
    Super.Initialize();                                                         //0000 : 1C B8 39 A3 19 16 
    mTutorialButton.SetVisible(False);                                          //0006 : 19 01 D0 34 A3 19 07 00 00 1B 14 98 00 00 28 16 
    //1C B8 39 A3 19 16 19 01 D0 34 A3 19 07 00 00 1B 14 98 00 00 28 16 04 0B 47 
  }



