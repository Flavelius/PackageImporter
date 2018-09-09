//==============================================================================
//  BaseGUIController
//==============================================================================

class BaseGUIController extends Interaction
    native
    dependsOn()
    Transient
    Config(System)
  ;

  var Material DefaultPens[3];
  var config string NetworkMsgMenu;
  var config string QuestionMenuClass;


  function HandleEvent(int eventID,Object Source,optional Object context);


  event SetRequiredGameResolution(string GameRes);


  event bool NeedsMenuResolution();


  event InitializeController();


  function SetControllerStatus(bool On) {
    bActive = On;                                                               //0000 : 14 2D 01 90 28 71 0F 2D 00 18 B2 7B 0F 
    bVisible = On;                                                              //000D : 14 2D 01 D8 CA 71 0F 2D 00 18 B2 7B 0F 
    bRequiresTick = On;                                                         //001A : 14 2D 01 50 CB 71 0F 2D 00 18 B2 7B 0F 
    //14 2D 01 90 28 71 0F 2D 00 18 B2 7B 0F 14 2D 01 D8 CA 71 0F 2D 00 18 B2 7B 0F 14 2D 01 50 CB 71 
    //0F 2D 00 18 B2 7B 0F 04 0B 47 
  }


  event CloseAll(bool bCancel,optional bool bForced);


  event bool CloseMenu(optional bool bCanceled) {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }


  event bool ReplaceMenu(string NewMenuName,optional string Param1,optional string Param2,optional bool bCancelled) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event AutoLoadMenus();


  event bool OpenMenu(string NewMenuName,optional string Param1,optional string Param2) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  simulated event QuitGame();


  simulated event SetTextData(int windowID,string textData);


  simulated event CloseAllWindows();


  simulated event CloseWindow(int windowID,optional bool bCanceled);


  simulated event InternalFocusChanged(int windowID);


  simulated event FocusWindow(int windowID);


  simulated event EnableWindow(int windowID,bool newState);


  simulated event SendWindowMessage(Object aSender,int windowID,optional int intParam,optional Object objParam,optional string stringParam);


  simulated event UpdateWindow(int windowID,optional int intParam,optional Object objParam,optional string stringParam);


  simulated event int OpenWindow(string windowName,optional int intParam,optional Object objParam,optional string stringParam);



