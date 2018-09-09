//==============================================================================
//  Game_Travel
//==============================================================================

class Game_Travel extends Base_Component within Game_PlayerController
    native
    exportstructs
    dependsOn(Content_Requirement)
  ;

  struct TravelDestination {
      var string RouteName;
      var string ShardName;
      var string ExteriorMesh;
      var bool AllowRentACabin;
      var int CrewCost;
      var int CabinCost;

  };


  var int mTravelTimeOut;
  var (null);


  private final native function bool sv_CheckRequirements(array<Content_Requirement> aRequirement,Game_Pawn aPawn);


  private event bool cl_CheckRequirements(array<Content_Requirement> aRequirement,Game_Pawn aPawn) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 58 C0 33 11 25 
    while (i < aRequirement.Length) {                                           //0007 : 07 74 00 96 00 58 C0 33 11 37 00 10 BF 33 11 16 
      if (aRequirement[i] != None
        && aRequirement[i].cl_IsValidFor(aPawn)
        && !aRequirement[i].CheckPawn(aPawn)) {//0017 : 07 6A 00 82 82 77 10 00 58 C0 33 11 00 10 BF 33 11 2A 16 18 1B 00 19 10 00 58 C0 33 11 00 10 BF 33 11 0B 00 04 1C 98 E2 30 11 00 D0 C0 33 11 16 16 18 1D 00 81 19 10 00 58 C0 33 11 00 10 BF 33 11 0B 00 04 1C 90 E6 2B 11 00 D0 C0 33 11 16 16 16 
        return False;                                                           //0068 : 04 28 
      }
      i++;                                                                      //006A : A5 00 58 C0 33 11 16 
    }
    return True;                                                                //0074 : 04 27 
    //0F 00 58 C0 33 11 25 07 74 00 96 00 58 C0 33 11 37 00 10 BF 33 11 16 07 6A 00 82 82 77 10 00 58 
    //C0 33 11 00 10 BF 33 11 2A 16 18 1B 00 19 10 00 58 C0 33 11 00 10 BF 33 11 0B 00 04 1C 98 E2 30 
    //11 00 D0 C0 33 11 16 16 18 1D 00 81 19 10 00 58 C0 33 11 00 10 BF 33 11 0B 00 04 1C 90 E6 2B 11 
    //00 D0 C0 33 11 16 16 16 04 28 A5 00 58 C0 33 11 16 06 07 00 04 27 04 0B 47 
  }


  protected native function sv2cl_TravelResult_CallStub();


  event sv2cl_TravelResult(int Reason) {
    OnTravelResult(Reason);                                                     //0000 : 43 50 C4 33 11 FB 05 00 00 00 98 C3 33 11 16 
    //43 50 C4 33 11 FB 05 00 00 00 98 C3 33 11 16 04 0B 47 
  }


  protected native function cl2sv_CancelTravel_CallStub();


  native event cl2sv_CancelTravel(string npcName,string Destination);


  protected native function cl2sv_TravelTo_CallStub();


  native event cl2sv_TravelTo(string npcName,string Destination,bool joinCrew);


  native function cl_GetDestinations(string npcName,out array<TravelDestination> Destinations);


  protected native function sv2cl_UpdateTimeOut_CallStub();


  native event sv2cl_UpdateTimeOut(int travelTimeOut);


  delegate OnTravelResult(int Reason);



