//==============================================================================
//  Base_Component
//==============================================================================

class Base_Component extends Object
    native
    dependsOn(Class)
  ;

  var private transient int mhastransactionmanager_data;
  var private const transient int d_Component;
  var const bool ComponentInitialized;
  var private const string ComponentName;
  var transient int ExCleanIndex;


  function string GetComponentDescription() {
    local string Desc;
    if (IsPawnComponent()) {                                                    //0000 : 07 18 00 1B F5 3E 00 00 16 
      Desc = "Pawn";                                                            //0009 : 0F 00 00 BD 19 11 1F 50 61 77 6E 00 
    } else {                                                                    //0015 : 06 45 00 
      if (IsControllerComponent()) {                                            //0018 : 07 36 00 1B F2 3E 00 00 16 
        Desc = "Controller";                                                    //0021 : 0F 00 00 BD 19 11 1F 43 6F 6E 74 72 6F 6C 6C 65 72 00 
      } else {                                                                  //0033 : 06 45 00 
        Desc = "Unknown";                                                       //0036 : 0F 00 00 BD 19 11 1F 55 6E 6B 6E 6F 77 6E 00 
      }
    }
    return Desc;                                                                //006E : 04 00 00 BD 19 11 
    //07 18 00 1B F5 3E 00 00 16 0F 00 00 BD 19 11 1F 50 61 77 6E 00 06 45 00 07 36 00 1B F2 3E 00 00 
    //16 0F 00 00 BD 19 11 1F 43 6F 6E 74 72 6F 6C 6C 65 72 00 06 45 00 0F 00 00 BD 19 11 1F 55 6E 6B 
    //6E 6F 77 6E 00 0E 61 42 00 00 BD 19 11 70 1F 20 63 6F 6D 70 6F 6E 65 6E 74 3A 20 00 39 57 19 01 
    //68 E5 6B 0F 05 00 04 01 F0 E4 6B 0F 16 16 04 00 00 BD 19 11 04 0B 47 
  }


  function bool IsControllerComponent() {
    return Base_Controller(Outer) != None;                                      //0000 : 04 77 2E 78 3D 24 01 01 00 E4 6B 0F 2A 16 
    //04 77 2E 78 3D 24 01 01 00 E4 6B 0F 2A 16 04 0B 47 
  }


  function bool IsPawnComponent() {
    return Base_Pawn(Outer) != None;                                            //0000 : 04 77 2E B8 42 24 01 01 00 E4 6B 0F 2A 16 
    //04 77 2E B8 42 24 01 01 00 E4 6B 0F 2A 16 04 0B 47 
  }


  native function bool sv_CanReplicate();


  event cl_OnGroupChange(int newGroupFlags);


  event cl_OnUpdate();


  event cl_OnBaseline();


  event cl_OnShutdown() {
    ComponentInitialized = False;                                               //0000 : 14 2D 01 C8 C5 19 11 28 
    //14 2D 01 C8 C5 19 11 28 04 0B 47 
  }


  event cl_OnInit() {
    ComponentInitialized = True;                                                //0000 : 14 2D 01 C8 C5 19 11 27 
    //14 2D 01 C8 C5 19 11 27 04 0B 47 
  }


  final native event sv_OnShutdown();


  final native event sv_OnLogin();


  final native event sv_OnInit();



