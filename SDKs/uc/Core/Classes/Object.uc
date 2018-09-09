//==============================================================================
//  Object
//==============================================================================

class Object
    native
    noexport
  ;

  const Pi =  3.1415926535897932;
  const MaxInt = 2147483647;
  const CPF_CONST =  2;
  const CPF_EDIT =  1;
  const UNKNOWN_TYPE =  -1;
  const NAME_TYPE =  9;
  const ROTATOR_TYPE =  8;
  const VECTOR_TYPE =  7;
  const STRUCT_TYPE =  6;
  const INT_TYPE =  3;
  const BOOL_TYPE =  4;
  const FLOAT_TYPE =  2;
  const OBJECT_TYPE =  5;
  const STRING_TYPE =  1;
  const BYTE_TYPE =  0;
  const LOG_TARGET_XML =  4;
  const LOG_TARGET_CONSOLE =  2;
  const LOG_TARGET_FILE =  1;
  const LOG_FATAL =  5;
  const LOG_ERROR =  4;
  const LOG_WARNING =  3;
  const LOG_NORMAL =  2;
  const LOG_DEBUG =  1;
  const LOG_TRACE =  0;
  const RF_NotForEdit = 4194304;
  const RF_NotForServer = 2097152;
  const RF_NotForClient = 1048576;
  const RF_Standalone = 524288;
  const RF_Transient = 16384;
  const RF_Public = 4;
  const RF_Transactional = 1;
  enum EDetailMode {
    DM_Low ,
    DM_High ,
    DM_SuperHigh 
  };

  enum EDrawPivot {
    DP_UpperLeft ,
    DP_UpperMiddle ,
    DP_UpperRight ,
    DP_MiddleRight ,
    DP_LowerRight ,
    DP_LowerMiddle ,
    DP_LowerLeft ,
    DP_MiddleLeft ,
    DP_MiddleMiddle 
  };

  enum EAxis {
    AXIS_X ,
    AXIS_Y ,
    AXIS_Z 
  };

  enum ECamOrientation {
    CAMORIENT_None ,
    CAMORIENT_LookAtActor ,
    CAMORIENT_FacePath ,
    CAMORIENT_Interpolate ,
    CAMORIENT_Dolly 
  };

  struct DatabaseRow {
      var array<string> Fields;

  };


  struct TMultiMap {
      var transient int FArray_Data;
      var int FArray_ArrayNum;
      var int FArray_ArrayMax;
      var transient int TMapBase_Hash;
      var int TMapBase_HashCount;

  };


  struct Rotator {
      var (Rotator) config int Pitch;
      var (Rotator) config int Yaw;
      var (Rotator) config int Roll;

  };


  struct LocalizedString {
      var (LocalizedString) string Text;
      var int Id;

  };


  struct InterpCurvePoint {
      var (InterpCurvePoint) float InVal;
      var (InterpCurvePoint) float OutVal;

  };


  struct InterpCurve {
      var (InterpCurve) array<InterpCurvePoint> Points;

  };


  struct Vector {
      var (Vector) config float X;
      var (Vector) config float Y;
      var (Vector) config float Z;

  };


  struct Box {
      var Vector Min;
      var Vector Max;
      var byte IsValid;

  };


  struct FloatBox {
      var float X1;
      var float Y1;
      var float X2;
      var float Y2;

  };


  struct IntBox {
      var int X1;
      var int Y1;
      var int X2;
      var int Y2;

  };


  struct Plane extends Vector {
      var (Plane) config float W;

  };


  struct Color {
      var (Color) config byte B;
      var (Color) config byte G;
      var (Color) config byte R;
      var (Color) config byte A;

  };


  struct Scale {
      enum ESheerAxis {
        SHEER_None ,
        SHEER_XY ,
        SHEER_XZ ,
        SHEER_YX ,
        SHEER_YZ ,
        SHEER_ZX ,
        SHEER_ZY 
      };

      var (Scale) config Vector Scale;
      var (Scale) config float SheerRate;
      var (Scale) config byte SheerAxis;

  };


  struct Range {
      var (Range) config float Min;
      var (Range) config float Max;

  };


  struct RangeVector {
      var (RangeVector) config Range X;
      var (RangeVector) config Range Y;
      var (RangeVector) config Range Z;

  };


  struct Quat {
      var (Quat) config float X;
      var (Quat) config float Y;
      var (Quat) config float Z;
      var (Quat) config float W;

  };


  struct Coords {
      var (Coords) config Vector Origin;
      var (Coords) config Vector XAxis;
      var (Coords) config Vector YAxis;
      var (Coords) config Vector ZAxis;

  };


  struct CompressedPosition {
      var Vector Location;
      var Rotator Rotation;
      var Vector Velocity;

  };


  struct Matrix {
      var (Matrix) Plane XPlane;
      var (Matrix) Plane YPlane;
      var (Matrix) Plane ZPlane;
      var (Matrix) Plane WPlane;

  };


  struct BoundingVolume extends Box {
      var Plane Sphere;

  };


  struct Guid {
      var int A;
      var int B;
      var int C;
      var int D;

  };


  var private const native transient int ObjectInternal[6];
  var const native Object Outer;
  var const native int ObjectFlags;
  var (Object) const native editconst name Name;
  var const native editconst class<Object> Class;


  final static native function FireDelegateString(Object aObj,name aFunction,string aValue);


  final static native function FireDelegateObject(Object aObj,name aFunction,Object aValue);


  final static native function FireDelegateInt(Object aObj,name aFunction,int aValue);


  final static function EatStr(out string outDest,out string outSource,int aNum) {
    outDest = outDest $ Left(outSource,aNum);                                   //0000 : 0F 00 E0 80 69 0F 70 00 E0 80 69 0F 80 00 C0 81 69 0F 00 38 82 69 0F 16 16 
    outSource = Mid(outSource,aNum);                                            //0019 : 0F 00 C0 81 69 0F 7F 00 C0 81 69 0F 00 38 82 69 0F 16 
    //0F 00 E0 80 69 0F 70 00 E0 80 69 0F 80 00 C0 81 69 0F 00 38 82 69 0F 16 16 0F 00 C0 81 69 0F 7F 
    //00 C0 81 69 0F 00 38 82 69 0F 16 04 0B 47 
  }


  final static simulated function ReplaceText(out string outText,string aReplace,string aWith) {
    local int i;
    local string Input;
    if (outText == "" || aReplace == "") {                                      //0000 : 07 1C 00 84 7A 00 60 83 69 0F 1F 00 16 18 0A 00 7A 00 F8 84 69 0F 1F 00 16 16 
      return;                                                                   //001A : 04 0B 
    }
    Input = outText;                                                            //001C : 0F 00 70 85 69 0F 00 60 83 69 0F 
    outText = "";                                                               //0027 : 0F 00 60 83 69 0F 1F 00 
    i = InStr(Input,aReplace);                                                  //002F : 0F 00 E8 85 69 0F 7E 00 70 85 69 0F 00 F8 84 69 0F 16 
    while (i != -1) {                                                           //0041 : 07 A0 00 9B 00 E8 85 69 0F 1D FF FF FF FF 16 
      outText = outText $ Left(Input,i) $ aWith;                                //0050 : 0F 00 60 83 69 0F 70 70 00 60 83 69 0F 80 00 70 85 69 0F 00 E8 85 69 0F 16 16 00 60 86 69 0F 16 
      Input = Mid(Input,i + Len(aReplace));                                     //0070 : 0F 00 70 85 69 0F 7F 00 70 85 69 0F 92 00 E8 85 69 0F 7D 00 F8 84 69 0F 16 16 16 
      i = InStr(Input,aReplace);                                                //008B : 0F 00 E8 85 69 0F 7E 00 70 85 69 0F 00 F8 84 69 0F 16 
    }
    outText = outText $ Input;                                                  //00A0 : 0F 00 60 83 69 0F 70 00 60 83 69 0F 00 70 85 69 0F 16 
    //07 1C 00 84 7A 00 60 83 69 0F 1F 00 16 18 0A 00 7A 00 F8 84 69 0F 1F 00 16 16 04 0B 0F 00 70 85 
    //69 0F 00 60 83 69 0F 0F 00 60 83 69 0F 1F 00 0F 00 E8 85 69 0F 7E 00 70 85 69 0F 00 F8 84 69 0F 
    //16 07 A0 00 9B 00 E8 85 69 0F 1D FF FF FF FF 16 0F 00 60 83 69 0F 70 70 00 60 83 69 0F 80 00 70 
    //85 69 0F 00 E8 85 69 0F 16 16 00 60 86 69 0F 16 0F 00 70 85 69 0F 7F 00 70 85 69 0F 92 00 E8 85 
    //69 0F 7D 00 F8 84 69 0F 16 16 16 0F 00 E8 85 69 0F 7E 00 70 85 69 0F 00 F8 84 69 0F 16 06 41 00 
    //0F 00 60 83 69 0F 70 00 60 83 69 0F 00 70 85 69 0F 16 04 0B 47 
  }


  static simulated function string GetItemName(string aFullName) {
    local int pos;
    pos = InStr(aFullName,".");                                                 //0000 : 0F 00 00 88 69 0F 7E 00 88 87 69 0F 1F 2E 00 16 
    while (pos != -1) {                                                         //0010 : 07 47 00 9B 00 00 88 69 0F 1D FF FF FF FF 16 
      aFullName = Mid(aFullName,pos + 1);                                       //001F : 0F 00 88 87 69 0F 7F 00 88 87 69 0F 92 00 00 88 69 0F 26 16 16 
      pos = InStr(aFullName,".");                                               //0034 : 0F 00 00 88 69 0F 7E 00 88 87 69 0F 1F 2E 00 16 
    }
    return aFullName;                                                           //0047 : 04 00 88 87 69 0F 
    //0F 00 00 88 69 0F 7E 00 88 87 69 0F 1F 2E 00 16 07 47 00 9B 00 00 88 69 0F 1D FF FF FF FF 16 0F 
    //00 88 87 69 0F 7F 00 88 87 69 0F 92 00 00 88 69 0F 26 16 16 0F 00 00 88 69 0F 7E 00 88 87 69 0F 
    //1F 2E 00 16 06 10 00 04 00 88 87 69 0F 04 0B 47 
  }


  final static function SmoothBlendAngle(out float outCurrent,out float outTarget,float aDeltaTime,float aTimeToReach1PercentOfTarget,bool aTakeShortestPath,optional bool aNoNormalization) {
    if (!aNoNormalization) {                                                    //0000 : 07 67 00 81 2D 00 A8 8B 69 0F 16 
      while (outTarget >= 65536) {                                              //000B : 07 3B 00 B3 00 20 8C 69 0F 39 3F 1D 00 00 01 00 16 
        outTarget -= 65536;                                                     //001C : B9 00 20 8C 69 0F 39 3F 1D 00 00 01 00 16 
        outCurrent -= 65536;                                                    //002A : B9 00 A0 89 69 0F 39 3F 1D 00 00 01 00 16 
      }
      while (outTarget < 0) {                                                   //003B : 07 67 00 B0 00 20 8C 69 0F 39 3F 25 16 
        outTarget += 65536;                                                     //0048 : B8 00 20 8C 69 0F 39 3F 1D 00 00 01 00 16 
        outCurrent += 65536;                                                    //0056 : B8 00 A0 89 69 0F 39 3F 1D 00 00 01 00 16 
      }
    }
    if (aTakeShortestPath) {                                                    //0067 : 07 D4 00 2D 00 98 8C 69 0F 
      if (outTarget < outCurrent) {                                             //0070 : 07 AB 00 B0 00 20 8C 69 0F 00 A0 89 69 0F 16 
        while (outCurrent - outTarget > 32768) {                                //007F : 07 A8 00 B1 AF 00 A0 89 69 0F 00 20 8C 69 0F 16 39 3F 1D 00 80 00 00 16 
          outCurrent -= 65536;                                                  //0097 : B9 00 A0 89 69 0F 39 3F 1D 00 00 01 00 16 
        }
      } else {                                                                  //00A8 : 06 D4 00 
        while (outTarget - outCurrent > 32768) {                                //00AB : 07 D4 00 B1 AF 00 20 8C 69 0F 00 A0 89 69 0F 16 39 3F 1D 00 80 00 00 16 
          outCurrent += 65536;                                                  //00C3 : B8 00 A0 89 69 0F 39 3F 1D 00 00 01 00 16 
        }
      }
    }
    outCurrent = outTarget + (outCurrent - outTarget) * 0.01000000 ** (aDeltaTime / aTimeToReach1PercentOfTarget);//00D4 : 0F 00 A0 89 69 0F AE 00 20 8C 69 0F AB AF 00 A0 89 69 0F 00 20 8C 69 0F 16 AA 1E 0A D7 23 3C AC 00 10 8D 69 0F 00 88 8D 69 0F 16 16 16 16 
    //07 67 00 81 2D 00 A8 8B 69 0F 16 07 3B 00 B3 00 20 8C 69 0F 39 3F 1D 00 00 01 00 16 B9 00 20 8C 
    //69 0F 39 3F 1D 00 00 01 00 16 B9 00 A0 89 69 0F 39 3F 1D 00 00 01 00 16 06 0B 00 07 67 00 B0 00 
    //20 8C 69 0F 39 3F 25 16 B8 00 20 8C 69 0F 39 3F 1D 00 00 01 00 16 B8 00 A0 89 69 0F 39 3F 1D 00 
    //00 01 00 16 06 3B 00 07 D4 00 2D 00 98 8C 69 0F 07 AB 00 B0 00 20 8C 69 0F 00 A0 89 69 0F 16 07 
    //A8 00 B1 AF 00 A0 89 69 0F 00 20 8C 69 0F 16 39 3F 1D 00 80 00 00 16 B9 00 A0 89 69 0F 39 3F 1D 
    //00 00 01 00 16 06 7F 00 06 D4 00 07 D4 00 B1 AF 00 20 8C 69 0F 00 A0 89 69 0F 16 39 3F 1D 00 80 
    //00 00 16 B8 00 A0 89 69 0F 39 3F 1D 00 00 01 00 16 06 AB 00 0F 00 A0 89 69 0F AE 00 20 8C 69 0F 
    //AB AF 00 A0 89 69 0F 00 20 8C 69 0F 16 AA 1E 0A D7 23 3C AC 00 10 8D 69 0F 00 88 8D 69 0F 16 16 
    //16 16 04 0B 47 
  }


  final static function SmoothBlend(out float outCurrent,float aTarget,float aDeltaTime,float aTimeToReach1PercentOfTarget) {
    outCurrent = aTarget + (outCurrent - aTarget) * 0.01000000 ** (aDeltaTime / aTimeToReach1PercentOfTarget);//0000 : 0F 00 F0 8F 69 0F AE 00 D8 90 69 0F AB AF 00 F0 8F 69 0F 00 D8 90 69 0F 16 AA 1E 0A D7 23 3C AC 00 50 91 69 0F 00 C8 91 69 0F 16 16 16 16 
    //0F 00 F0 8F 69 0F AE 00 D8 90 69 0F AB AF 00 F0 8F 69 0F 00 D8 90 69 0F 16 AA 1E 0A D7 23 3C AC 
    //00 50 91 69 0F 00 C8 91 69 0F 16 16 16 16 04 0B 47 
  }


  final native function UCASSERT(bool aExpression,string aDescription);


  final native function BREAKPOINT();


  final native function GetReferencers(Object aTarget,out array<Object> outReferencers);


  final native(197) iterator function AllObjects(class<Object> aBaseClass,out Object outObj);


  event EndState();


  event BeginState();


  final native function bool PlatformIs64Bit();


  final native function bool PlatformIsWindows();


  final native function bool PlatformIsUnix();


  final native function bool PlatformIsMacOS();


  final native function bool IsSoaking();


  final native function bool IsOnConsole();


  final static native(535) function StopWatch(optional bool aStop);


  final static native function array<string> GetPerObjectNames(string aININame,optional string aObjectClass,optional int aMaxResults);


  final static native function StaticClearConfig(optional string aPropName);


  final static native function ResetConfig(optional string aPropName);


  final static native function StaticSaveConfig();


  final native(537) function ClearConfig(optional string aPropName);


  final native(536) function SaveConfig();


  native function bool IsEditor();


  native function bool IsClient();


  native function bool IsServer();


  native function Object Clone(optional bool aCloneSubObjects);


  native function int GetAddress(optional out int outTopPart,optional out int outLowPart);


  native function SetNameProperty(int aIndex,name aValue);


  native function name GetNameProperty(int aIndex);


  native function SetRotatorProperty(int aIndex,Rotator aValue);


  native function Rotator GetRotatorProperty(int aIndex);


  native function SetVectorProperty(int aIndex,Vector aValue);


  native function Vector GetVectorProperty(int aIndex);


  native function SetObjectProperty(int aIndex,Object aValue);


  native function Object GetObjectProperty(int aIndex);


  native function SetStringProperty(int aIndex,string aValue);


  native function string GetStringProperty(int aIndex);


  native function SetByteProperty(int aIndex,byte aValue);


  native function byte GetByteProperty(int aIndex);


  native function SetBoolProperty(int aIndex,bool aValue);


  native function bool GetBoolProperty(int aIndex);


  native function SetFloatProperty(int aIndex,float aValue);


  native function float GetFloatProperty(int aIndex);


  native function SetIntProperty(int aIndex,int aValue);


  native function int GetIntProperty(int aIndex);


  native function int GetPropertyType(int aIndex,optional out int outFlags);


  function int GetClassPropertyType(int aIndex,optional out int outFlags) {
    return GetPropertyType(aIndex,outFlags);                                    //0000 : 04 1B B1 28 00 00 00 A8 E0 69 0F 00 68 E1 69 0F 16 
    //04 1B B1 28 00 00 00 A8 E0 69 0F 00 68 E1 69 0F 16 04 0B 47 
  }


  native function int GetClassPropertyCount(optional int aRequiredFlags);


  final native function bool SetAllPropertyTexts(string aString);


  final native function string GetAllPropertyTexts();


  final static native function Object FindObject(string aObjectName,class<Object> aObjectClass);


  final static native function Object DynamicLoadObject(string aObjectName,class<Object> aObjectClass,optional bool aMayFail);


  final static native function name GetEnum(Object aE,coerce int aI);


  final native function bool SetPropertyText(string aPropName,string aPropValue);


  final native function string GetPropertyText(string aPropName);


  final native(118) function Disable(name aProbeFunc);


  final native(117) function Enable(name aProbeFunc);


  final native(303) function bool IsA(name aClassName);


  final static native(258) function bool ClassIsChildOf(class<Object> aTestClass,class<Object> aParentClass);


  final native(284) function name GetStateName();


  final native(281) function bool IsInState(name aTestState);


  final native(113) function GotoState(optional name aNewState,optional name aLabel);


  static native function string Localize(string aSectionName,string aKeyName,string aPackageName);


  final static native(643) function SetMinLogLevel(optional int aLevel);


  final static native(642) function SBLog(coerce string aS,optional int aLevel,optional bool aUnique);


  final static native(232) function Warn(coerce string aS);


  final static native(231) function Log(coerce string aS,optional name aTag);


  final static native function name GetFName();


  final static function float ConvertURUToDegrees(float aAngleURU) {
    return aAngleURU / 182.04400635;                                            //0000 : 04 AC 00 30 10 6A 0F 1E 44 0B 36 43 16 
    //04 AC 00 30 10 6A 0F 1E 44 0B 36 43 16 04 0B 47 
  }


  final static function float ConvertDegreesToURU(float aAngleDegrees) {
    return aAngleDegrees * 182.04400635;                                        //0000 : 04 AB 00 10 12 6A 0F 1E 44 0B 36 43 16 
    //04 AB 00 10 12 6A 0F 1E 44 0B 36 43 16 04 0B 47 
  }


  final static native function bool IsInAngle(float aCurrentAngle,Vector aCurrentLocation,float aCurrentDirection,Vector aLocation,float aRadius);


  final static native function Quat QuatSlerp(Quat aA,Quat aB,float aSlerp);


  final static native function Rotator QuatToRotator(Quat aA);


  final static native function Quat QuatFromRotator(Rotator aA);


  final static native function Quat QuatFromAxisAndAngle(Vector aAxis,float aAngle);


  final static native function Quat QuatFindBetween(Vector aA,Vector aB);


  final static native function Vector QuatRotateVector(Quat aA,Vector aB);


  final static native function Quat QuatInvert(Quat aA);


  final static native function Quat QuatProduct(Quat aA,Quat aB);


  final static native function InterpCurveGetInputDomain(InterpCurve aCurve,out float outMin,out float outMax);


  final static native function InterpCurveGetOutputRange(InterpCurve aCurve,out float outMin,out float outMax);


  final static native function float InterpCurveEval(InterpCurve aCurve,float aInput);


  final static native(255) operator(26) bool !=(name aA,name aB);


  final static native(254) operator(24) bool ==(name aA,name aB);


  final static native(119) operator(26) bool !=(Object aA,Object aB);


  final static native(114) operator(24) bool ==(Object aA,Object aB);


  final static native(202) function string Eval(bool aCondition,coerce string aResultIfTrue,coerce string aResultIfFalse);


  final static native(201) function string Repl(coerce string aSrc,coerce string aMatch,coerce string aWith,optional bool aCaseSensitive);


  final static native(200) function int StrCmp(coerce string aS,coerce string aT,optional int aCount,optional bool aCaseSensitive);


  final static native(240) function int Split(coerce string aSrc,string aDivider,out array<string> outParts);


  final static native(239) function bool Divide(coerce string aSrc,string aDivider,out string outLeftPart,out string outRightPart);


  final static native(238) function string Locs(coerce string aS);


  final static native(237) function int Asc(string aS);


  final static native(236) function string Chr(int aI);


  final static native function string UpperFirst(coerce string aS);


  final static native(235) function string Caps(coerce string aS);


  final static native(234) function string Right(coerce string aS,int aI);


  final static native(128) function string Left(coerce string aS,int aI);


  final static native(127) function string Mid(coerce string aS,int aI,optional int aJ);


  final static native(126) function int InStr(coerce string aS,coerce string aT);


  final static native(125) function int Len(coerce string aS);


  final static native(324) operator(45) string -=(out string outA,coerce string aB);


  final static native(323) operator(44) string @=(out string outA,coerce string aB);


  final static native(322) operator(44) string $=(out string outA,coerce string aB);


  final static native(124) operator(24) bool ~=(string aA,string aB);


  final static native(123) operator(26) bool !=(string aA,string aB);


  final static native(122) operator(24) bool ==(string aA,string aB);


  final static native(121) operator(24) bool >=(string aA,string aB);


  final static native(120) operator(24) bool <=(string aA,string aB);


  final static native(116) operator(24) bool >(string aA,string aB);


  final static native(115) operator(24) bool <(string aA,string aB);


  final static native(168) operator(40) string @(coerce string aA,coerce string aB);


  final static native(112) operator(40) string $(coerce string aA,coerce string aB);


  final static native function Color RGBA(byte aR,byte aG,byte aB,byte aA);


  final static native function Color RGB(byte aR,byte aG,byte aB);


  final static native operator(24) bool ClockwiseFrom(int aA,int aB);


  final static native function Rotator Normalize(Rotator aRot);


  final static native function Rotator OrthoRotation(Vector aX,Vector aY,Vector aZ);


  final static native(320) function Rotator RotRand(optional bool aRoll);


  final static native(230) function GetUnAxes(Rotator aA,out Vector outX,out Vector outY,out Vector outZ);


  final static native(229) function GetAxes(Rotator aA,out Vector outX,out Vector outY,out Vector outZ);


  final static native(319) operator(34) Rotator -=(out Rotator outA,Rotator aB);


  final static native(318) operator(34) Rotator +=(out Rotator outA,Rotator aB);


  final static native(317) operator(20) Rotator -(Rotator aA,Rotator aB);


  final static native(316) operator(20) Rotator +(Rotator aA,Rotator aB);


  final static native(291) operator(34) Rotator /=(out Rotator outA,float aB);


  final static native(290) operator(34) Rotator *=(out Rotator outA,float aB);


  final static native(289) operator(16) Rotator /(Rotator aA,float aB);


  final static native(288) operator(16) Rotator *(float aA,Rotator aB);


  final static native(287) operator(16) Rotator *(Rotator aA,float aB);


  final static native(203) operator(26) bool !=(Rotator aA,Rotator aB);


  final static native(142) operator(24) bool ==(Rotator aA,Rotator aB);


  final static native(300) function Vector MirrorVectorByNormal(Vector aVect,Vector aNormal);


  final static native(252) function Vector VRand();


  final static native(227) function Invert(out Vector outX,out Vector outY,out Vector outZ);


  final static native(226) function Vector Normal(Vector aA);


  final static native(225) function float VSize(Vector aA);


  final static native(224) operator(34) Vector -=(out Vector outA,Vector aB);


  final static native(223) operator(34) Vector +=(out Vector outA,Vector aB);


  final static native(222) operator(34) Vector /=(out Vector outA,float aB);


  final static native(297) operator(34) Vector *=(out Vector outA,Vector aB);


  final static native(221) operator(34) Vector *=(out Vector outA,float aB);


  final static native(220) operator(16) Vector Cross(Vector aA,Vector aB);


  final static native(219) operator(16) float Dot(Vector aA,Vector aB);


  final static native(218) operator(26) bool !=(Vector aA,Vector aB);


  final static native(217) operator(24) bool ==(Vector aA,Vector aB);


  final static native(276) operator(22) Vector >>(Vector aA,Rotator aB);


  final static native(275) operator(22) Vector <<(Vector aA,Rotator aB);


  final static native(216) operator(20) Vector -(Vector aA,Vector aB);


  final static native(215) operator(20) Vector +(Vector aA,Vector aB);


  final static native(214) operator(16) Vector /(Vector aA,float aB);


  final static native(296) operator(16) Vector *(Vector aA,Vector aB);


  final static native(213) operator(16) Vector *(float aA,Vector aB);


  final static native(212) operator(16) Vector *(Vector aA,float aB);


  final static native(211) preoperator Vector -(Vector aA);


  final static native function float FRandRange(float aA,float aB);


  final static native(257) function float Round(float aA);


  final static native(253) function float Ceil(float aA);


  final static native(248) function float Smerp(float aAlpha,float aA,float aB);


  final static native function Vector LerpVector(Vector A,Vector B,float degree);


  final static native(247) function float Lerp(float aAlpha,float aA,float aB,optional bool aClampRange);


  final static native(246) function float FClamp(float aV,float aA,float aB);


  final static native(245) function float FMax(float aA,float aB);


  final static native(244) function float FMin(float aA,float aB);


  final static native(195) function float FRand();


  final static native(194) function float Square(float aA);


  final static native(193) function float Sqrt(float aA);


  final static native(192) function float Loge(float aA);


  final static native(191) function float Exp(float aA);


  final static native(190) function float Atan(float aA,float aB);


  final static native(189) function float Tan(float aA);


  final static native function float Acos(float aA);


  final static native(188) function float Cos(float aA);


  final static native function float Asin(float aA);


  final static native(187) function float Sin(float aA);


  final static native(186) function float Abs(float aA);


  final static native(185) operator(34) float -=(out float outA,float aB);


  final static native(184) operator(34) float +=(out float outA,float aB);


  final static native(183) operator(34) float /=(out float outA,float aB);


  final static native(182) operator(34) float *=(out float outA,float aB);


  final static native(181) operator(26) bool !=(float aA,float aB);


  final static native(210) operator(24) bool ~=(float aA,float aB);


  final static native(180) operator(24) bool ==(float aA,float aB);


  final static native(179) operator(24) bool >=(float aA,float aB);


  final static native(178) operator(24) bool <=(float aA,float aB);


  final static native(177) operator(24) bool >(float aA,float aB);


  final static native(176) operator(24) bool <(float aA,float aB);


  final static native(175) operator(20) float -(float aA,float aB);


  final static native(174) operator(20) float +(float aA,float aB);


  final static native(173) operator(18) float %(float aA,float aB);


  final static native(172) operator(16) float /(float aA,float aB);


  final static native(171) operator(16) float *(float aA,float aB);


  final static native(170) operator(12) float **(float aA,float aB);


  final static native(169) preoperator float -(float aA);


  final static native function int RandRange(int aA,int aB);


  final static native function int Mod(int aA,int aB);


  final static native(251) function int Clamp(int aV,int aA,int aB);


  final static native(250) function int Max(int aA,int aB);


  final static native(249) function int Min(int aA,int aB);


  final static native(167) function int Rand(int aMax);


  final static native(166) postoperator int --(out int outA);


  final static native(165) postoperator int ++(out int outA);


  final static native(164) preoperator int --(out int outA);


  final static native(163) preoperator int ++(out int outA);


  final static native(162) operator(34) int -=(out int outA,int aB);


  final static native(161) operator(34) int +=(out int outA,int aB);


  final static native(160) operator(34) int /=(out int outA,float aB);


  final static native(159) operator(34) int *=(out int outA,float aB);


  final static native(158) operator(28) int |(int aA,int aB);


  final static native(157) operator(28) int ^(int aA,int aB);


  final static native(156) operator(28) int &(int aA,int aB);


  final static native(155) operator(26) bool !=(int aA,int aB);


  final static native(154) operator(24) bool ==(int aA,int aB);


  final static native(153) operator(24) bool >=(int aA,int aB);


  final static native(152) operator(24) bool <=(int aA,int aB);


  final static native(151) operator(24) bool >(int aA,int aB);


  final static native(150) operator(24) bool <(int aA,int aB);


  final static native(196) operator(22) int >>>(int aA,int aB);


  final static native(149) operator(22) int >>(int aA,int aB);


  final static native(148) operator(22) int <<(int aA,int aB);


  final static native(147) operator(20) int -(int aA,int aB);


  final static native(146) operator(20) int +(int aA,int aB);


  final static native(145) operator(16) int /(int aA,int aB);


  final static native(144) operator(16) int *(int aA,int aB);


  final static native(143) preoperator int -(int aA);


  final static native(141) preoperator int ~(int aA);


  final static native(140) postoperator byte --(out byte outA);


  final static native(139) postoperator byte ++(out byte outA);


  final static native(138) preoperator byte --(out byte outA);


  final static native(137) preoperator byte ++(out byte outA);


  final static native(136) operator(34) byte -=(out byte outA,byte aB);


  final static native(135) operator(34) byte +=(out byte outA,byte aB);


  final static native(134) operator(34) byte /=(out byte outA,byte aB);


  final static native(133) operator(34) byte *=(out byte outA,byte aB);


  final static native(132) operator(32) bool ||(bool aA,skip bool aB);


  final static native(131) operator(30) bool ^^(bool aA,bool aB);


  final static native(130) operator(30) bool &&(bool aA,skip bool aB);


  final static native(243) operator(26) bool !=(bool aA,bool aB);


  final static native(242) operator(24) bool ==(bool aA,bool aB);


  final static native(129) preoperator bool !(bool aA);



