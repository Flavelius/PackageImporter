//==============================================================================
//  EV_Claustroport
//==============================================================================

class EV_Claustroport extends Content_Event
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Actor)
  ;

  var (Action) const name DestinationTag;
  var (Action) const float MaxDistance;
  var (Action) const bool UseOrientation;


  function sv_Execute(Game_Pawn aObject,Game_Pawn aSubject) {
    local Actor A;
    local Vector pos;
    A = FindClosestActor(Class'Actor',aSubject,DestinationTag);                 //0000 : 0F 00 40 6A FF 13 1B DC 0F 00 00 20 F8 8B C1 00 00 B8 6A FF 13 01 30 6B FF 13 16 
    if (A == None) {                                                            //001B : 07 28 00 72 00 40 6A FF 13 2A 16 
      return;                                                                   //0026 : 04 0B 
    }
    pos = RandomRadiusLocation(A,MaxDistance,-1.00000000,True,aSubject.GetCollisionExtent(),aSubject.IsGrounded());//0028 : 0F 00 A8 6B FF 13 1B 6E 10 00 00 00 40 6A FF 13 01 20 6C FF 13 1E 00 00 80 BF 27 19 00 B8 6A FF 13 06 00 0C 1B 9C 2B 00 00 16 19 00 B8 6A FF 13 06 00 04 1B 90 0F 00 00 16 16 
    if (pos == vect(0.000000, 0.000000, 0.000000)) {                            //0062 : 07 7B 00 D9 00 A8 6B FF 13 23 00 00 00 00 00 00 00 00 00 00 00 00 16 
      return;                                                                   //0079 : 04 0B 
    }
    if (UseOrientation) {                                                       //007B : 07 A5 00 2D 01 98 6C FF 13 
      ClaustroportPawn(aSubject,pos,A.Rotation);                                //0084 : 1B FD 0F 00 00 00 B8 6A FF 13 00 A8 6B FF 13 19 00 40 6A FF 13 05 00 0C 01 00 84 6C 0F 16 
    } else {                                                                    //00A2 : 06 C3 00 
      ClaustroportPawn(aSubject,pos,aSubject.Rotation);                         //00A5 : 1B FD 0F 00 00 00 B8 6A FF 13 00 A8 6B FF 13 19 00 B8 6A FF 13 05 00 0C 01 00 84 6C 0F 16 
    }
    //0F 00 40 6A FF 13 1B DC 0F 00 00 20 F8 8B C1 00 00 B8 6A FF 13 01 30 6B FF 13 16 07 28 00 72 00 
    //40 6A FF 13 2A 16 04 0B 0F 00 A8 6B FF 13 1B 6E 10 00 00 00 40 6A FF 13 01 20 6C FF 13 1E 00 00 
    //80 BF 27 19 00 B8 6A FF 13 06 00 0C 1B 9C 2B 00 00 16 19 00 B8 6A FF 13 06 00 04 1B 90 0F 00 00 
    //16 16 07 7B 00 D9 00 A8 6B FF 13 23 00 00 00 00 00 00 00 00 00 00 00 00 16 04 0B 07 A5 00 2D 01 
    //98 6C FF 13 1B FD 0F 00 00 00 B8 6A FF 13 00 A8 6B FF 13 19 00 40 6A FF 13 05 00 0C 01 00 84 6C 
    //0F 16 06 C3 00 1B FD 0F 00 00 00 B8 6A FF 13 00 A8 6B FF 13 19 00 B8 6A FF 13 05 00 0C 01 00 84 
    //6C 0F 16 04 0B 47 
  }


  function bool sv_CanExecute(Game_Pawn aObject,Game_Pawn aSubject) {
    local Actor A;
    if (aSubject == None) {                                                     //0000 : 07 0D 00 72 00 00 6E FF 13 2A 16 
      return False;                                                             //000B : 04 28 
    }
    A = FindClosestActor(Class'Actor',aSubject,DestinationTag);                 //000D : 0F 00 78 6E FF 13 1B DC 0F 00 00 20 F8 8B C1 00 00 00 6E FF 13 01 30 6B FF 13 16 
    if (A == None) {                                                            //0028 : 07 35 00 72 00 78 6E FF 13 2A 16 
      return False;                                                             //0033 : 04 28 
    }
    return True;                                                                //0035 : 04 27 
    //07 0D 00 72 00 00 6E FF 13 2A 16 04 28 0F 00 78 6E FF 13 1B DC 0F 00 00 20 F8 8B C1 00 00 00 6E 
    //FF 13 01 30 6B FF 13 16 07 35 00 72 00 78 6E FF 13 2A 16 04 28 04 27 04 0B 47 
  }



