//==============================================================================
//  Scenario
//==============================================================================

class Scenario extends Content_Type
    native
    dependsOn(Actor,Content_Requirement)
  ;

  var private transient array<Actor> mParticipants;
  var private transient Actor mOwner;
  var (Scenario) array<Content_Requirement> Requirements;
  var (Scenario) array<name> ParticipantTags;


  event ForwardEvents(Actor anActor) {
    local int i;
    if (ParticipantTags.Length > 0) {                                           //0000 : 07 5F 00 97 37 01 00 CA 31 13 25 16 
      if (mParticipants.Length <= 0) {                                          //000C : 07 23 00 98 37 01 78 CA 31 13 25 16 
        CollectActors(anActor);                                                 //0018 : 1C F0 CA 31 13 00 00 17 30 0F 16 
      }
      i = 0;                                                                    //0023 : 0F 00 A0 CB 31 13 25 
      while (i < mParticipants.Length) {                                        //002A : 07 5F 00 96 00 A0 CB 31 13 37 01 78 CA 31 13 16 
        mParticipants[i].Trigger(anActor,None);                                 //003A : 19 10 00 A0 CB 31 13 01 78 CA 31 13 0C 00 00 1B 32 01 00 00 00 00 17 30 0F 2A 16 
        i++;                                                                    //0055 : A5 00 A0 CB 31 13 16 
      }
    }
    //07 5F 00 97 37 01 00 CA 31 13 25 16 07 23 00 98 37 01 78 CA 31 13 25 16 1C F0 CA 31 13 00 00 17 
    //30 0F 16 0F 00 A0 CB 31 13 25 07 5F 00 96 00 A0 CB 31 13 37 01 78 CA 31 13 16 19 10 00 A0 CB 31 
    //13 01 78 CA 31 13 0C 00 00 1B 32 01 00 00 00 00 17 30 0F 2A 16 A5 00 A0 CB 31 13 16 06 2A 00 04 
    //0B 47 
  }


  function bool VerifyRequirements(Game_Pawn aContextPawn) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 90 CC 31 13 25 
    while (i < Requirements.Length) {                                           //0007 : 07 55 00 96 00 90 CC 31 13 37 01 08 CD 31 13 16 
      if (Requirements[i] == None
        || !Requirements[i].CheckPawn(aContextPawn)) {//0017 : 07 4B 00 84 72 10 00 90 CC 31 13 01 08 CD 31 13 2A 16 18 1D 00 81 19 10 00 90 CC 31 13 01 08 CD 31 13 0B 00 04 1C 90 E6 2B 11 00 18 CC 31 13 16 16 16 
        return False;                                                           //0049 : 04 28 
      }
      i++;                                                                      //004B : A5 00 90 CC 31 13 16 
    }
    return True;                                                                //0055 : 04 27 
    //0F 00 90 CC 31 13 25 07 55 00 96 00 90 CC 31 13 37 01 08 CD 31 13 16 07 4B 00 84 72 10 00 90 CC 
    //31 13 01 08 CD 31 13 2A 16 18 1D 00 81 19 10 00 90 CC 31 13 01 08 CD 31 13 0B 00 04 1C 90 E6 2B 
    //11 00 18 CC 31 13 16 16 16 04 28 A5 00 90 CC 31 13 16 06 07 00 04 27 04 0B 47 
  }


  final native function CollectActors(Actor anActor);



