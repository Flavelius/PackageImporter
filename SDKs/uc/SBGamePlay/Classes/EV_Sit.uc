//==============================================================================
//  EV_Sit
//==============================================================================

class EV_Sit extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Actor,Game_Controller)
  ;

  var (Action) name Chair;
  var (Action) Vector Offset;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    local Actor chairActor;
    if (string(Chair) != "None") {                                              //0000 : 07 C5 00 7B 39 57 01 C0 60 FF 13 1F 4E 6F 6E 65 00 16 
      chairActor = FindClosestActor(Class'Actor',aObject,Chair);                //0012 : 0F 00 38 61 FF 13 1B DC 0F 00 00 20 F8 8B C1 00 00 A8 5E FF 13 01 C0 60 FF 13 16 
      aObject.SetLocation(chairActor.Location + Offset);                        //002D : 19 00 A8 5E FF 13 18 00 04 61 0B D7 19 00 38 61 FF 13 05 00 0C 01 30 81 6C 0F 01 B0 61 FF 13 16 16 
      aObject.SetRotation(chairActor.Rotation);                                 //004E : 19 00 A8 5E FF 13 14 00 04 1C 70 01 6E 0F 19 00 38 61 FF 13 05 00 0C 01 00 84 6C 0F 16 
      ApiTrace("EV_Sit.sv_Execute Sitting down on chair"
        @ string(Chair)
        @ "="
        @ string(chairActor));//006B : 1B F3 0B 00 00 A8 A8 A8 1F 45 56 5F 53 69 74 2E 73 76 5F 45 78 65 63 75 74 65 20 53 69 74 74 69 6E 67 20 64 6F 77 6E 20 6F 6E 20 63 68 61 69 72 00 39 57 01 C0 60 FF 13 16 1F 3D 00 16 39 56 00 38 61 FF 13 16 16 
      aObject.sv_Sit(True,True);                                                //00B1 : 19 00 A8 5E FF 13 08 00 00 1B 94 0C 00 00 27 27 16 
    } else {                                                                    //00C2 : 06 0A 01 
      ApiTrace("EV_Sit.sv_Execute Sitting down on the ground");                 //00C5 : 1B F3 0B 00 00 1F 45 56 5F 53 69 74 2E 73 76 5F 45 78 65 63 75 74 65 20 53 69 74 74 69 6E 67 20 64 6F 77 6E 20 6F 6E 20 74 68 65 20 67 72 6F 75 6E 64 00 16 
      aObject.sv_Sit(True,False);                                               //00F9 : 19 00 A8 5E FF 13 08 00 00 1B 94 0C 00 00 27 28 16 
    }
    //07 C5 00 7B 39 57 01 C0 60 FF 13 1F 4E 6F 6E 65 00 16 0F 00 38 61 FF 13 1B DC 0F 00 00 20 F8 8B 
    //C1 00 00 A8 5E FF 13 01 C0 60 FF 13 16 19 00 A8 5E FF 13 18 00 04 61 0B D7 19 00 38 61 FF 13 05 
    //00 0C 01 30 81 6C 0F 01 B0 61 FF 13 16 16 19 00 A8 5E FF 13 14 00 04 1C 70 01 6E 0F 19 00 38 61 
    //FF 13 05 00 0C 01 00 84 6C 0F 16 1B F3 0B 00 00 A8 A8 A8 1F 45 56 5F 53 69 74 2E 73 76 5F 45 78 
    //65 63 75 74 65 20 53 69 74 74 69 6E 67 20 64 6F 77 6E 20 6F 6E 20 63 68 61 69 72 00 39 57 01 C0 
    //60 FF 13 16 1F 3D 00 16 39 56 00 38 61 FF 13 16 16 19 00 A8 5E FF 13 08 00 00 1B 94 0C 00 00 27 
    //27 16 06 0A 01 1B F3 0B 00 00 1F 45 56 5F 53 69 74 2E 73 76 5F 45 78 65 63 75 74 65 20 53 69 74 
    //74 69 6E 67 20 64 6F 77 6E 20 6F 6E 20 74 68 65 20 67 72 6F 75 6E 64 00 16 19 00 A8 5E FF 13 08 
    //00 00 1B 94 0C 00 00 27 28 16 04 0B 47 
  }


  function bool ApiTracing() {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    local Actor chairActor;
    if (string(Chair) != "None") {                                              //0000 : 07 36 00 7B 39 57 01 C0 60 FF 13 1F 4E 6F 6E 65 00 16 
      chairActor = FindClosestActor(Class'Actor',aObject,Chair);                //0012 : 0F 00 20 65 FF 13 1B DC 0F 00 00 20 F8 8B C1 00 00 F8 63 FF 13 01 C0 60 FF 13 16 
      return chairActor != None;                                                //002D : 04 77 00 20 65 FF 13 2A 16 
    }
    if (!Game_Controller(aObject.Controller).IsIdle()) {                        //0036 : 07 5A 00 81 19 2E 10 0E 5B 01 19 00 F8 63 FF 13 05 00 04 01 00 6E 6C 0F 06 00 04 1B 9C 05 00 00 16 16 
      return False;                                                             //0058 : 04 28 
    }
    return True;                                                                //005A : 04 27 
    //07 36 00 7B 39 57 01 C0 60 FF 13 1F 4E 6F 6E 65 00 16 0F 00 20 65 FF 13 1B DC 0F 00 00 20 F8 8B 
    //C1 00 00 F8 63 FF 13 01 C0 60 FF 13 16 04 77 00 20 65 FF 13 2A 16 07 5A 00 81 19 2E 10 0E 5B 01 
    //19 00 F8 63 FF 13 05 00 04 01 00 6E 6C 0F 06 00 04 1B 9C 05 00 00 16 16 04 28 04 27 04 0B 47 
  }



