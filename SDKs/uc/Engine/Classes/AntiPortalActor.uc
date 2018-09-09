//==============================================================================
//  AntiPortalActor
//==============================================================================

class AntiPortalActor extends Actor
    native
    dependsOn()
    Placeable
  ;


  state() TriggerToggle {

      simulated event Trigger(Actor Other,Pawn EventInstigator) {
        if (DrawType == 11) {                                                   //0000 : 07 1B 00 9A 39 3A 01 60 99 6C 0F 39 3A 24 0B 16 
          SetDrawType(0);                                                       //0010 : 1C 48 93 6B 0F 24 00 16 
        } else {                                                                //0018 : 06 33 00 
          if (DrawType == 0) {                                                  //001B : 07 33 00 9A 39 3A 01 60 99 6C 0F 39 3A 24 00 16 
            SetDrawType(11);                                                    //002B : 1C 48 93 6B 0F 24 0B 16 
          }
        }
        //07 1B 00 9A 39 3A 01 60 99 6C 0F 39 3A 24 0B 16 1C 48 93 6B 0F 24 00 16 06 33 00 07 33 00 9A 39 
        //3A 01 60 99 6C 0F 39 3A 24 00 16 1C 48 93 6B 0F 24 0B 16 04 0B 47 
      }


    //08 47 

  }


  state() TriggerControl {

      simulated event UnTrigger(Actor Other,Pawn EventInstigator) {
        SetDrawType(11);                                                        //0000 : 1C 48 93 6B 0F 24 0B 16 
        //1C 48 93 6B 0F 24 0B 16 04 0B 47 
      }


      simulated event Trigger(Actor Other,Pawn EventInstigator) {
        SetDrawType(0);                                                         //0000 : 1C 48 93 6B 0F 24 00 16 
        //1C 48 93 6B 0F 24 00 16 04 0B 47 
      }


    //08 47 

  }



