//==============================================================================
//  MovementComponent
//==============================================================================

class MovementComponent extends Base_Component within Game_Controller
    native
    exportstructs
    dependsOn()
  ;

  enum EAIMoveMode {
    AMM_None ,
    AMM_Pathfinding ,
    AMM_Wander ,
    AMM_Tactical ,
    AMM_Flee ,
    AMM_Follow 
  };

  struct MCTimer {
      var byte mMode;
      var class<Object> mState;
      var float mTimePlanning;
      var float mTimeMoving;
      var int mPlans;
      var int mMoves;

  };


  struct MovementConfigStruct {
      var Object mOwner;
      var Vector pawnLocation;
      var byte Mode;
      var Vector Destination;
      var float Range;
      var Game_Pawn Target;
      var export editinline FSkill_Type Skill;
      var AIPoint ControlPoint;
      var float speed;
      var bool Walking;
      var bool Strafing;
      var bool MovingTurn;

  };


  struct TacticalLocation {
      var Vector Location;
      var float Distance;
      var float LowerLimit;
      var float UpperLimit;
      var float Weight;
      var bool LimitPath;
      var bool Penalty;

  };


  var byte MoveMode;
  var Vector Destination;
  var float Range;
  var Game_Pawn Target;
  var export editinline FSkill_Type Skill;
  var AIPoint ControlPoint;
  var AIPoint DestinationPoint;
  var float speed;
  var bool Walking;
  var bool Strafing;
  var bool MovingTurn;
  var bool AnnotationAttached;
  var array<TacticalLocation> TacticalLocations;
  var SBAccessMap mAccessmap;
  var private SBPath mPath;
  var array<MovementConfigStruct> ConfigStack;
  var array<SBPath> mPathStack;
  var float mFrequencyTimer;
  var float mArrivedTime;
  var private int mData1;


  native function PatrolPoint GetNextPatrolPoint();


  function SetWalking(bool aWalking) {
    Walking = aWalking;                                                         //0000 : 14 2D 01 08 DF 31 0F 2D 00 50 DE 31 0F 
    //14 2D 01 08 DF 31 0F 2D 00 50 DE 31 0F 04 0B 47 
  }


  function SetSpeed(float aSpeed) {
    speed = aSpeed;                                                             //0000 : 0F 01 E8 E0 31 0F 00 30 E0 31 0F 
    //0F 01 E8 E0 31 0F 00 30 E0 31 0F 04 0B 47 
  }


  native function Approach(Vector aDestination,float aRange);


  native function Wander();


  native function MoveControlled(AIPoint aControl);


  native function MoveTo(Vector aDestination);


  native function NoMovement();



