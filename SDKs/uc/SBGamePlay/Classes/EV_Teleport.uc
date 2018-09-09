//==============================================================================
//  EV_Teleport
//==============================================================================

class EV_Teleport extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  var (Action) int TargetWorld;
  var (Action) string Parameter;
  var (Action) bool IsInstance;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    TeleportPawn(aSubject,TargetWorld,IsInstance,Parameter);                    //0000 : 1B DB 0F 00 00 00 80 73 FF 13 01 F8 73 FF 13 2D 01 70 74 FF 13 01 E8 74 FF 13 16 
    //1B DB 0F 00 00 00 80 73 FF 13 01 F8 73 FF 13 2D 01 70 74 FF 13 01 E8 74 FF 13 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }



