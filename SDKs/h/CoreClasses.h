#if _MSC_VER
#pragma pack (push,4)
#endif

#ifndef NAMES_ONLY
#define AUTOGENERATE_NAME(name) extern DLL_IMPORT FName CORE_##name;
#define AUTOGENERATE_FUNCTION(cls,num,func) \
  extern DLL_IMPORT Native int##cls##func;
#define AUTOGENERATE_CLASS(TClass) \
  extern DLL_IMPORT UClass* autoclass##TClass;
#define AUTOGENERATE_PACKAGE(pkg) \
  extern DLL_IMPORT TCHAR GPackage[];
#endif


//------------------------------------------------------------------------------
//  Object
//------------------------------------------------------------------------------

#define UCONST_Object_Pi  3.1415926535897932
#define UCONST_Object_MaxInt 2147483647
#define UCONST_Object_CPF_CONST  2
#define UCONST_Object_CPF_EDIT  1
#define UCONST_Object_UNKNOWN_TYPE  -1
#define UCONST_Object_NAME_TYPE  9
#define UCONST_Object_ROTATOR_TYPE  8
#define UCONST_Object_VECTOR_TYPE  7
#define UCONST_Object_STRUCT_TYPE  6
#define UCONST_Object_INT_TYPE  3
#define UCONST_Object_BOOL_TYPE  4
#define UCONST_Object_FLOAT_TYPE  2
#define UCONST_Object_OBJECT_TYPE  5
#define UCONST_Object_STRING_TYPE  1
#define UCONST_Object_BYTE_TYPE  0
#define UCONST_Object_LOG_TARGET_XML  4
#define UCONST_Object_LOG_TARGET_CONSOLE  2
#define UCONST_Object_LOG_TARGET_FILE  1
#define UCONST_Object_LOG_FATAL  5
#define UCONST_Object_LOG_ERROR  4
#define UCONST_Object_LOG_WARNING  3
#define UCONST_Object_LOG_NORMAL  2
#define UCONST_Object_LOG_DEBUG  1
#define UCONST_Object_LOG_TRACE  0
#define UCONST_Object_RF_NotForEdit 4194304
#define UCONST_Object_RF_NotForServer 2097152
#define UCONST_Object_RF_NotForClient 1048576
#define UCONST_Object_RF_Standalone 524288
#define UCONST_Object_RF_Transient 16384
#define UCONST_Object_RF_Public 4
#define UCONST_Object_RF_Transactional 1
enum EDetailMode {
  DM_Low = 0,
  DM_High = 1,
  DM_SuperHigh = 2
};

enum EDrawPivot {
  DP_UpperLeft = 0,
  DP_UpperMiddle = 1,
  DP_UpperRight = 2,
  DP_MiddleRight = 3,
  DP_LowerRight = 4,
  DP_LowerMiddle = 5,
  DP_LowerLeft = 6,
  DP_MiddleLeft = 7,
  DP_MiddleMiddle = 8
};

enum EAxis {
  AXIS_X = 0,
  AXIS_Y = 1,
  AXIS_Z = 2
};

enum ECamOrientation {
  CAMORIENT_None = 0,
  CAMORIENT_LookAtActor = 1,
  CAMORIENT_FacePath = 2,
  CAMORIENT_Interpolate = 3,
  CAMORIENT_Dolly = 4
};

// FDatabaseRow 0 ( )
struct DLL_IMPORT FDatabaseRow {
  public:
    TArray<class FString> Fields;  // 0 400000 CPF_NeedCtorLink
};

// FTMultiMap 0 ( )
struct DLL_IMPORT FTMultiMap {
  public:
    DWORD FArray_Data;  // 0 2000 CPF_Transient
    INT FArray_ArrayNum;  // 4 0
    INT FArray_ArrayMax;  // 8 0
    DWORD TMapBase_Hash;  // C 2000 CPF_Transient
    INT TMapBase_HashCount;  // 10 0
};

// FRotator 0 ( )
/*
class DLL_IMPORT FRotator {
  public:
    INT Pitch;  // 0 4001 CPF_Edit CPF_Config
    INT Yaw;  // 4 4001 CPF_Edit CPF_Config
    INT Roll;  // 8 4001 CPF_Edit CPF_Config
    FRotator(int,int,int);
    FRotator(void);
    class FRotator & operator=(class FRotator const &);
    int operator==(class FRotator const &)const ;
    int operator!=(class FRotator const &)const ;
    class FRotator const operator*(float)const ;
    class FRotator const operator-(class FRotator const &)const ;
    class FRotator const operator+(class FRotator const &)const ;
    class FRotator const & operator*=(float);
    class FRotator const & operator+=(class FRotator const &);
    class FRotator const & operator-=(class FRotator const &);
    class FRotator Add(int,int,int);
    class FRotator AddBounded(int,int,int);
    class FRotator Clamp(void);
    class FRotator ClampPos(void);
    class FRotator GridSnap(class FRotator const &);
    int IsZero(void)const ;
    class FRotator Reduce(void)const ;
    class FVector Vector(void);
    bool const print(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > *)const ;
    bool const print(class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > *)const ;
    bool const scan(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &);
    bool const scan(class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > const &);
    unsigned int const size(void)const ;
};
*/

// FLocalizedString 0 ( )
struct DLL_IMPORT FLocalizedString {
  public:
    class FString Text;  // 0 400001 CPF_Edit CPF_NeedCtorLink
    INT Id;  // 8 0
    FLocalizedString(struct FLocalizedString const &);
    FLocalizedString(class FString const &);
    FLocalizedString(int);
    FLocalizedString(unsigned short const *);
    FLocalizedString(void);
    ~FLocalizedString(void);
    struct FLocalizedString & operator=(struct FLocalizedString const &);
    struct FLocalizedString const & operator=(class FString const &);
    struct FLocalizedString const & operator=(unsigned short const *);
};

// FInterpCurvePoint 0 ( )
class DLL_IMPORT FInterpCurvePoint {
  public:
    FLOAT InVal;  // 0 1 CPF_Edit
    FLOAT OutVal;  // 4 1 CPF_Edit
    FInterpCurvePoint(float,float);
    FInterpCurvePoint(void);
    class FInterpCurvePoint & operator=(class FInterpCurvePoint const &);
    int operator==(class FInterpCurvePoint const &);
};

// FInterpCurve 0 ( )
class DLL_IMPORT FInterpCurve {
  public:
    TArray<class FInterpCurvePoint> Points;  // 0 400001 CPF_Edit CPF_NeedCtorLink
    FInterpCurve(class FInterpCurve const &);
    FInterpCurve(void);
    ~FInterpCurve(void);
    void operator=(class FInterpCurve const &);
    void AddPoint(float,float);
    float Eval(float);
};

// FVector 0 ( )
/*
class DLL_IMPORT FVector {
  public:
    FLOAT X;  // 0 4001 CPF_Edit CPF_Config
    FLOAT Y;  // 4 4001 CPF_Edit CPF_Config
    FLOAT Z;  // 8 4001 CPF_Edit CPF_Config
    FVector(class d_std::vector3 const &);
    FVector(float,float,float);
    FVector(void);
    class FVector & operator=(class FVector const &);
    int operator==(class FVector const &)const ;
    int operator!=(class FVector const &)const ;
    float & operator[](int);
    float operator[](int)const ;
    class FVector const operator*(class FVector const &)const ;
    class FVector const operator*(float)const ;
    class FVector const operator-(class FVector const &)const ;
    class FVector const operator-(void)const ;
    class FVector const operator+(class FVector const &)const ;
    class FVector const operator/(float)const ;
    class FVector const operator^(class FVector const &)const ;
    float operator|(class FVector const &)const ;
    class FVector const & operator*=(class FVector const &);
    class FVector const & operator*=(float);
    class FVector const & operator+=(class FVector const &);
    class FVector const & operator-=(class FVector const &);
    class FVector const & operator/=(class FVector const &);
    class FVector const & operator/=(float);
    void AddBounded(class FVector const &,float);
    int Booleanize(void);
    class FVector BoundToCube(float)const ;
    float & Component(int);
    void FindBestAxisVectors(class FVector &,class FVector &);
    float GetAbsMax(void)const ;
    float GetMax(void)const ;
    float GetMin(void)const ;
    class FVector GetNonParallel(void);
    class FVector GetNormalized(void);
    class FVector GridSnap(class FVector const &)const ;
    void Invalid(void);
    static class FVector CDECL InvalidVector(void);
    int IsNearlyZero(void)const ;
    int IsUniform(void);
    int IsValid(void)const ;
    int IsZero(void)const ;
    class FVector MirrorByPlane(class FPlane const &)const ;
    class FVector MirrorByVector(class FVector const &)const ;
    int Normalize(void);
    int NormalizedValidateSlow(float);
    class FVector PivotTransform(class FCoords const &)const ;
    class FVector Projection(void)const ;
    class FVector RotateAngleAxis(int,class FVector const &)const ;
    class FRotator Rotation(void)const ;
    class FVector SafeNormal(void)const ;
    float Size2D(void)const ;
    float Size(void)const ;
    float SizeSquared2D(void)const ;
    float SizeSquared(void)const ;
    class FVector TransformPointBy(class FCoords const &)const ;
    class FVector TransformVectorBy(class FCoords const &)const ;
    class FVector TransformVectorByTranspose(class FCoords const &)const ;
    class FVector UnsafeNormal(void)const ;
    void ValidateSlow(float);
    bool const print(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > *)const ;
    bool const print(class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > *)const ;
    bool const scan(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &);
    bool const scan(class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > const &);
    unsigned int const size(void)const ;
};
*/

// FBox 0 ( )
/*
class DLL_IMPORT FBox {
  public:
    class FVector Min;  // 0 0
    class FVector Max;  // C 0
    BYTE IsValid;  // 18 0
    FBox(class FVector const &,class FVector const &);
    FBox(int);
    FBox(class FVector const *,int);
    FBox(void);
    class FBox & operator=(class FBox const &);
    class FVector & operator[](int);
    class FBox const operator+(class FBox const &)const ;
    class FBox const operator+(class FVector const &)const ;
    class FBox const & operator+=(class FBox const &);
    class FBox const & operator+=(class FVector const &);
    bool CheckIsBehind(class FPlane const &)const ;
    bool CheckIsValid(void)const ;
    class FBox ExpandBy(float)const ;
    class FVector GetCenter(void)const ;
    void GetCenterAndExtents(class FVector &,class FVector &)const ;
    class FVector GetExtent(void)const ;
    class FVector & GetExtrema(int);
    class FVector const & GetExtrema(int)const ;
    void Init(void);
    bool Intersect(class FBox const &)const ;
    bool Intersect(float,class FVector const &)const ;
    class FBox TransformBy(class FCoords const &)const ;
    class FBox TransformBy(class FMatrix const &)const ;
};
*/

// FFloatBox 0 ( )
struct DLL_IMPORT FFloatBox {
  public:
    FLOAT X1;  // 0 0
    FLOAT Y1;  // 4 0
    FLOAT X2;  // 8 0
    FLOAT Y2;  // C 0
};

// FIntBox 0 ( )
struct DLL_IMPORT FIntBox {
  public:
    INT X1;  // 0 0
    INT Y1;  // 4 0
    INT X2;  // 8 0
    INT Y2;  // C 0
};

// FPlane 0 ( )
/*
class DLL_IMPORT FPlane : public FVector {
  public:
    FLOAT W;  // C 4001 CPF_Edit CPF_Config
    FPlane(class FPlane const &);
    FPlane(class FVector const &);
    FPlane(float,float,float,float);
    FPlane(class FVector,class FVector,class FVector);
    FPlane(class FVector,class FVector const &);
    FPlane(class FVector,float);
    FPlane(void);
    class FPlane & operator=(class FPlane const &);
    int operator==(class FPlane const &)const ;
    int operator!=(class FPlane const &)const ;
    class FPlane const operator*(class FPlane const &);
    class FPlane const operator*(float)const ;
    class FPlane const operator-(class FPlane const &)const ;
    class FPlane const operator+(class FPlane const &)const ;
    class FPlane const operator/(float)const ;
    class FPlane const & operator*=(class FPlane const &);
    class FPlane const & operator*=(float);
    class FPlane const & operator+=(class FPlane const &);
    class FPlane const & operator-=(class FPlane const &);
    class FPlane const & operator/=(float);
    int BoxCheck(class FVector const &,class FVector const &)const ;
    class FPlane Flip(void)const ;
    float PlaneDot(class FVector const &)const ;
    class FPlane TransformBy(class FCoords const &)const ;
    class FPlane TransformBy(class FMatrix const &)const ;
    class FPlane TransformByUsingAdjointT(class FMatrix const &,float,class FMatrix const &)const ;
    class FPlane TransformPlaneByOrtho(class FCoords const &)const ;
    class FPlane TransformPlaneByOrtho(class FMatrix const &)const ;
};
*/

// FColor 0 ( )
class DLL_IMPORT FColor {
  public:
    BYTE B;  // 0 4001 CPF_Edit CPF_Config
    BYTE G;  // 1 4001 CPF_Edit CPF_Config
    BYTE R;  // 2 4001 CPF_Edit CPF_Config
    BYTE A;  // 3 4001 CPF_Edit CPF_Config
    FColor(class FPlane const &);
    FColor(class FVector const &);
    FColor(class FVector const &,unsigned char);
    FColor(unsigned char,unsigned char,unsigned char,unsigned char);
    FColor(unsigned long);
    FColor(void);
    class FColor & operator=(class FColor const &);
    int operator==(class FColor const &)const ;
    int operator!=(class FColor const &)const ;
    operator class FPlane(void)const ;
    operator class FVector(void)const ;
    operator unsigned long(void)const ;
    class FColor operator/(float)const ;
    void operator+=(class FColor);
    class FColor & operator/=(float);
    class FColor Brighten(int);
    int Brightness(void)const ;
    unsigned long & DWColor(void);
    unsigned long const & DWColor(void)const ;
    float FBrightness(void)const ;
    unsigned short HiColor4444(void)const ;
    unsigned short HiColor555(void)const ;
    unsigned short HiColor565(void)const ;
    class FColor const & Modulate(float,float);
    class FPlane Plane(void)const ;
    class FColor RenderColor(void);
    unsigned long TrueColor(void)const ;
    bool const print(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > *)const ;
    bool const print(class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > *)const ;
    bool const scan(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &);
    bool const scan(class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > const &);
    unsigned int const size(void)const ;
};

  enum ESheerAxis {
    SHEER_None = 0,
    SHEER_XY = 1,
    SHEER_XZ = 2,
    SHEER_YX = 3,
    SHEER_YZ = 4,
    SHEER_ZX = 5,
    SHEER_ZY = 6
  };

// FScale 0 ( )
/*
class DLL_IMPORT FScale {
  public:
    class FVector Scale;  // 0 4001 CPF_Edit CPF_Config
    FLOAT SheerRate;  // C 4001 CPF_Edit CPF_Config
    BYTE SheerAxis;  // 10 4001 CPF_Edit CPF_Config
    FScale(class FVector const &,float,enum ESheerAxis);
    FScale(void);
    class FScale & operator=(class FScale const &);
    int operator==(class FScale const &)const ;
    float Orientation(void);
};
*/

// FRange 0 ( )
class DLL_IMPORT FRange {
  public:
    FLOAT Min;  // 0 4001 CPF_Edit CPF_Config
    FLOAT Max;  // 4 4001 CPF_Edit CPF_Config
    FRange(float);
    FRange(float,float);
    FRange(void);
    class FRange & operator=(class FRange const &);
    int operator==(class FRange const &)const ;
    int operator!=(class FRange const &)const ;
    class FRange const operator*(class FRange const &)const ;
    class FRange const operator*(float)const ;
    class FRange const operator-(class FRange const &)const ;
    class FRange const operator-(float)const ;
    class FRange const operator-(void)const ;
    class FRange const operator+(class FRange const &)const ;
    class FRange const operator+(float)const ;
    class FRange const operator/(float)const ;
    class FRange operator*=(class FRange const &);
    class FRange operator*=(float);
    class FRange const & operator+=(class FRange const &);
    class FRange const & operator+=(float);
    class FRange operator-=(float);
    class FRange const & operator-=(class FRange const &);
    class FRange operator/=(class FRange const &);
    class FRange operator/=(float);
    int Booleanize(void);
    float & Component(int);
    float GetCenter(void)const ;
    float GetMax(void)const ;
    float GetMin(void)const ;
    float GetRand(void)const ;
    float GetSRand(void)const ;
    class FRange GridSnap(class FRange const &);
    int IsNearlyZero(void)const ;
    int IsZero(void)const ;
    float Size(void)const ;
};

// FRangeVector 0 ( )
class DLL_IMPORT FRangeVector {
  public:
    class FRange X;  // 0 4001 CPF_Edit CPF_Config
    class FRange Y;  // 8 4001 CPF_Edit CPF_Config
    class FRange Z;  // 10 4001 CPF_Edit CPF_Config
    FRangeVector(class FRange,class FRange,class FRange);
    FRangeVector(class FVector,class FVector);
    FRangeVector(class FVector);
    FRangeVector(void);
    class FRangeVector & operator=(class FRangeVector const &);
    int operator==(class FRangeVector const &)const ;
    int operator!=(class FRangeVector const &)const ;
    class FRangeVector const operator*(class FRangeVector const &)const ;
    class FRangeVector const operator*(float)const ;
    class FRangeVector const operator-(class FRangeVector const &)const ;
    class FRangeVector const operator-(class FVector const &)const ;
    class FRangeVector const operator-(void)const ;
    class FRangeVector const operator+(class FRangeVector const &)const ;
    class FRangeVector const operator+(class FVector const &)const ;
    class FRangeVector const operator/(float)const ;
    class FRangeVector const & operator*=(class FRangeVector const &);
    class FRangeVector const & operator*=(float);
    class FRangeVector const & operator+=(class FRangeVector const &);
    class FRangeVector const & operator+=(class FVector const &);
    class FRangeVector const & operator-=(class FRangeVector const &);
    class FRangeVector const & operator-=(class FVector const &);
    class FRangeVector const & operator/=(class FRangeVector const &);
    class FRangeVector const & operator/=(float);
    class FRange & Component(int);
    class FVector GetCenter(void)const ;
    class FVector GetMax(void)const ;
    class FVector GetMin(void)const ;
    class FVector GetRand(void)const ;
    class FVector GetSRand(void)const ;
    class FRangeVector GridSnap(class FRangeVector const &);
    int IsNearlyZero(void)const ;
    int IsZero(void)const ;
};

// FQuat 0 ( )
/*
class DLL_IMPORT FQuat {
  public:
    FLOAT X;  // 0 4001 CPF_Edit CPF_Config
    FLOAT Y;  // 4 4001 CPF_Edit CPF_Config
    FLOAT Z;  // 8 4001 CPF_Edit CPF_Config
    FLOAT W;  // C 4001 CPF_Edit CPF_Config
    FQuat(float,float,float,float);
    FQuat(void);
    class FQuat & operator=(class FQuat const &);
    int operator!=(class FQuat const &)const ;
    class FQuat operator*(float const &)const ;
    class FQuat operator*(class FQuat const &)const ;
    class FQuat operator-(class FQuat const &)const ;
    class FQuat operator-(void)const ;
    class FQuat operator+(class FQuat const &)const ;
    class FQuat AngAxisToFQuat(void);
    class FQuat FQuatToAngAxis(void);
    int Normalize(void);
    class FVector RotateVector(class FVector);
};
*/

// FCoords 0 ( )
/*
class DLL_IMPORT FCoords {
  public:
    class FVector Origin;  // 0 4001 CPF_Edit CPF_Config
    class FVector XAxis;  // C 4001 CPF_Edit CPF_Config
    class FVector YAxis;  // 18 4001 CPF_Edit CPF_Config
    class FVector ZAxis;  // 24 4001 CPF_Edit CPF_Config
    FCoords(class FVector const &,class FVector const &,class FVector const &,class FVector const &);
    FCoords(class FVector const &);
    FCoords(void);
    class FCoords & operator=(class FCoords const &);
    class FCoords operator*(class FCoords const &)const ;
    class FCoords operator*(class FRotator const &)const ;
    class FCoords operator*(class FScale const &)const ;
    class FCoords operator*(class FVector const &)const ;
    class FCoords operator/(class FRotator const &)const ;
    class FCoords operator/(class FScale const &)const ;
    class FCoords operator/(class FVector const &)const ;
    class FCoords & operator*=(class FCoords const &);
    class FCoords & operator*=(class FRotator const &);
    class FCoords & operator*=(class FScale const &);
    class FCoords & operator*=(class FVector const &);
    class FCoords & operator/=(class FRotator const &);
    class FCoords & operator/=(class FScale const &);
    class FCoords & operator/=(class FVector const &);
    class FCoords ApplyPivot(class FCoords const &)const ;
    class FCoords Inverse(void)const ;
    class FMatrix Matrix(void)const ;
    class FCoords MirrorByPlane(class FPlane const &)const ;
    class FCoords MirrorByVector(class FVector const &)const ;
    int NormalizeAxesSlow(float);
    class FRotator OrthoRotation(void)const ;
    class FCoords PivotInverse(void)const ;
    class FCoords Transpose(void)const ;
};
*/

// FCompressedPosition 0 ( )
struct DLL_IMPORT FCompressedPosition {
  public:
    class FVector Location;  // 0 0
    class FRotator Rotation;  // C 0
    class FVector Velocity;  // 18 0
};

// FMatrix 0 ( )
/*
class DLL_IMPORT FMatrix {
  public:
    class FPlane XPlane;  // 0 1 CPF_Edit
    class FPlane YPlane;  // 10 1 CPF_Edit
    class FPlane ZPlane;  // 20 1 CPF_Edit
    class FPlane WPlane;  // 30 1 CPF_Edit
    FMatrix(class FPlane,class FPlane,class FPlane,class FPlane);
    FMatrix(void);
    ~FMatrix(void);
    class FMatrix & operator=(class FMatrix const &);
    int operator==(class FMatrix &)const ;
    int operator!=(class FMatrix &)const ;
    class FMatrix operator*(class FMatrix)const ;
    void operator*=(class FMatrix);
    class FCoords Coords(void);
    float Determinant(void)const ;
    static class FMatrix Identity;
    class FMatrix Inverse(void);
    class FMatrix RemoveScaling(void);
    void SetIdentity(void);
    class FPlane TransformFPlane(class FPlane const &)const ;
    class FVector TransformFVector(class FVector const &)const ;
    class FPlane TransformNormal(class FVector const &)const ;
    class FMatrix Transpose(void);
    class FMatrix TransposeAdjoint(void)const ;
};
*/

// FBoundingVolume 0 ( )
struct DLL_IMPORT FBoundingVolume : public FBox {
  public:
    class FPlane Sphere;  // 1C 0
};

// FGuid 0 ( )
/*
class DLL_IMPORT FGuid {
  public:
    INT A;  // 0 0
    INT B;  // 4 0
    INT C;  // 8 0
    INT D;  // C 0
};
*/

//  Object.FireDelegateString 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execFireDelegateString_Parms {
  class UObject* aObj;  // 0 80 CPF_Parm
  FName aFunction;  // 4 80 CPF_Parm
  class FString aValue;  // 8 400080 CPF_Parm CPF_NeedCtorLink
};


//  Object.FireDelegateObject 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execFireDelegateObject_Parms {
  class UObject* aObj;  // 0 80 CPF_Parm
  FName aFunction;  // 4 80 CPF_Parm
  class UObject* aValue;  // 8 80 CPF_Parm
};


//  Object.FireDelegateInt 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execFireDelegateInt_Parms {
  class UObject* aObj;  // 0 80 CPF_Parm
  FName aFunction;  // 4 80 CPF_Parm
  INT aValue;  // 8 80 CPF_Parm
};


//  Object.EatStr 22003 0 ( FUNC_Final FUNC_Defined FUNC_Static FUNC_Public )
struct UObject_execEatStr_Parms {
  class FString outDest;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  class FString outSource;  // 8 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  INT aNum;  // 10 80 CPF_Parm
};


//  Object.ReplaceText 22103 0 ( FUNC_Final FUNC_Defined FUNC_Simulated FUNC_Static FUNC_Public )
struct UObject_execReplaceText_Parms {
  class FString outText;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  class FString aReplace;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  class FString aWith;  // 10 400080 CPF_Parm CPF_NeedCtorLink
};


//  Object.GetItemName 22102 0 ( FUNC_Defined FUNC_Simulated FUNC_Static FUNC_Public )
struct UObject_execGetItemName_Parms {
  class FString aFullName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString ReturnValue;  // 8 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  Object.SmoothBlendAngle 22003 0 ( FUNC_Final FUNC_Defined FUNC_Static FUNC_Public )
struct UObject_execSmoothBlendAngle_Parms {
  FLOAT outCurrent;  // 0 180 CPF_Parm CPF_OutParm
  FLOAT outTarget;  // 4 180 CPF_Parm CPF_OutParm
  FLOAT aDeltaTime;  // 8 80 CPF_Parm
  FLOAT aTimeToReach1PercentOfTarget;  // C 80 CPF_Parm
  BITFIELD aTakeShortestPath : 1;  // 10 80 CPF_Parm
  BITFIELD aNoNormalization : 1;  // 14 90 CPF_OptionalParm CPF_Parm
};


//  Object.SmoothBlend 22003 0 ( FUNC_Final FUNC_Defined FUNC_Static FUNC_Public )
struct UObject_execSmoothBlend_Parms {
  FLOAT outCurrent;  // 0 180 CPF_Parm CPF_OutParm
  FLOAT aTarget;  // 4 80 CPF_Parm
  FLOAT aDeltaTime;  // 8 80 CPF_Parm
  FLOAT aTimeToReach1PercentOfTarget;  // C 80 CPF_Parm
};


//  Object.UCASSERT 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UObject_execUCASSERT_Parms {
  BITFIELD aExpression : 1;  // 0 80 CPF_Parm
  class FString aDescription;  // 4 400080 CPF_Parm CPF_NeedCtorLink
};


//  Object.BREAKPOINT 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UObject_execBREAKPOINT_Parms {
};


//  Object.GetReferencers 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UObject_execGetReferencers_Parms {
  class UObject* aTarget;  // 0 80 CPF_Parm
  TArray<class UObject*> outReferencers;  // 4 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
};


//  Object.AllObjects 20405 0 ( FUNC_Final FUNC_Iterator FUNC_Native FUNC_Public )
struct UObject_execAllObjects_Parms {
  class UClass* aBaseClass;  // 0 80 CPF_Parm
  class UObject* outObj;  // 4 180 CPF_Parm CPF_OutParm
};


//  Object.EndState 20800 0 ( FUNC_Event FUNC_Public )
struct UObject_eventEndState_Parms {
};


//  Object.BeginState 20800 0 ( FUNC_Event FUNC_Public )
struct UObject_eventBeginState_Parms {
};


//  Object.PlatformIs64Bit 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UObject_execPlatformIs64Bit_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.PlatformIsWindows 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UObject_execPlatformIsWindows_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.PlatformIsUnix 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UObject_execPlatformIsUnix_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.PlatformIsMacOS 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UObject_execPlatformIsMacOS_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.IsSoaking 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UObject_execIsSoaking_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.IsOnConsole 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UObject_execIsOnConsole_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.StopWatch 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execStopWatch_Parms {
  BITFIELD aStop : 1;  // 0 90 CPF_OptionalParm CPF_Parm
};


//  Object.GetPerObjectNames 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execGetPerObjectNames_Parms {
  class FString aININame;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString aObjectClass;  // 8 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
  INT aMaxResults;  // 10 90 CPF_OptionalParm CPF_Parm
  TArray<class FString> ReturnValue;  // 14 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  Object.StaticClearConfig 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execStaticClearConfig_Parms {
  class FString aPropName;  // 0 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
};


//  Object.ResetConfig 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execResetConfig_Parms {
  class FString aPropName;  // 0 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
};


//  Object.StaticSaveConfig 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execStaticSaveConfig_Parms {
};


//  Object.ClearConfig 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UObject_execClearConfig_Parms {
  class FString aPropName;  // 0 400090 CPF_OptionalParm CPF_Parm CPF_NeedCtorLink
};


//  Object.SaveConfig 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UObject_execSaveConfig_Parms {
};


//  Object.IsEditor 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execIsEditor_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.IsClient 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execIsClient_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.IsServer 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execIsServer_Parms {
  BITFIELD ReturnValue : 1;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Clone 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execClone_Parms {
  BITFIELD aCloneSubObjects : 1;  // 0 90 CPF_OptionalParm CPF_Parm
  class UObject* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.GetAddress 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execGetAddress_Parms {
  INT outTopPart;  // 0 190 CPF_OptionalParm CPF_Parm CPF_OutParm
  INT outLowPart;  // 4 190 CPF_OptionalParm CPF_Parm CPF_OutParm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.SetNameProperty 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execSetNameProperty_Parms {
  INT aIndex;  // 0 80 CPF_Parm
  FName aValue;  // 4 80 CPF_Parm
};


//  Object.GetNameProperty 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execGetNameProperty_Parms {
  INT aIndex;  // 0 80 CPF_Parm
  FName ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.SetRotatorProperty 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execSetRotatorProperty_Parms {
  INT aIndex;  // 0 80 CPF_Parm
  class FRotator aValue;  // 4 80 CPF_Parm
};


//  Object.GetRotatorProperty 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execGetRotatorProperty_Parms {
  INT aIndex;  // 0 80 CPF_Parm
  class FRotator ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.SetVectorProperty 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execSetVectorProperty_Parms {
  INT aIndex;  // 0 80 CPF_Parm
  class FVector aValue;  // 4 80 CPF_Parm
};


//  Object.GetVectorProperty 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execGetVectorProperty_Parms {
  INT aIndex;  // 0 80 CPF_Parm
  class FVector ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.SetObjectProperty 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execSetObjectProperty_Parms {
  INT aIndex;  // 0 80 CPF_Parm
  class UObject* aValue;  // 4 80 CPF_Parm
};


//  Object.GetObjectProperty 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execGetObjectProperty_Parms {
  INT aIndex;  // 0 80 CPF_Parm
  class UObject* ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.SetStringProperty 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execSetStringProperty_Parms {
  INT aIndex;  // 0 80 CPF_Parm
  class FString aValue;  // 4 400080 CPF_Parm CPF_NeedCtorLink
};


//  Object.GetStringProperty 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execGetStringProperty_Parms {
  INT aIndex;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  Object.SetByteProperty 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execSetByteProperty_Parms {
  INT aIndex;  // 0 80 CPF_Parm
  BYTE aValue;  // 4 80 CPF_Parm
};


//  Object.GetByteProperty 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execGetByteProperty_Parms {
  INT aIndex;  // 0 80 CPF_Parm
  BYTE ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.SetBoolProperty 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execSetBoolProperty_Parms {
  INT aIndex;  // 0 80 CPF_Parm
  BITFIELD aValue : 1;  // 4 80 CPF_Parm
};


//  Object.GetBoolProperty 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execGetBoolProperty_Parms {
  INT aIndex;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.SetFloatProperty 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execSetFloatProperty_Parms {
  INT aIndex;  // 0 80 CPF_Parm
  FLOAT aValue;  // 4 80 CPF_Parm
};


//  Object.GetFloatProperty 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execGetFloatProperty_Parms {
  INT aIndex;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.SetIntProperty 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execSetIntProperty_Parms {
  INT aIndex;  // 0 80 CPF_Parm
  INT aValue;  // 4 80 CPF_Parm
};


//  Object.GetIntProperty 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execGetIntProperty_Parms {
  INT aIndex;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.GetPropertyType 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execGetPropertyType_Parms {
  INT aIndex;  // 0 80 CPF_Parm
  INT outFlags;  // 4 190 CPF_OptionalParm CPF_Parm CPF_OutParm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.GetClassPropertyType 20002 0 ( FUNC_Defined FUNC_Public )
struct UObject_execGetClassPropertyType_Parms {
  INT aIndex;  // 0 80 CPF_Parm
  INT outFlags;  // 4 190 CPF_OptionalParm CPF_Parm CPF_OutParm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.GetClassPropertyCount 20400 0 ( FUNC_Native FUNC_Public )
struct UObject_execGetClassPropertyCount_Parms {
  INT aRequiredFlags;  // 0 90 CPF_OptionalParm CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.SetAllPropertyTexts 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UObject_execSetAllPropertyTexts_Parms {
  class FString aString;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.GetAllPropertyTexts 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UObject_execGetAllPropertyTexts_Parms {
  class FString ReturnValue;  // 0 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  Object.FindObject 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execFindObject_Parms {
  class FString aObjectName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class UClass* aObjectClass;  // 8 80 CPF_Parm
  class UObject* ReturnValue;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.DynamicLoadObject 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execDynamicLoadObject_Parms {
  class FString aObjectName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class UClass* aObjectClass;  // 8 80 CPF_Parm
  BITFIELD aMayFail : 1;  // C 90 CPF_OptionalParm CPF_Parm
  class UObject* ReturnValue;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.GetEnum 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execGetEnum_Parms {
  class UObject* aE;  // 0 80 CPF_Parm
  INT aI;  // 4 880 CPF_Parm CPF_CoerceParm
  FName ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.SetPropertyText 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UObject_execSetPropertyText_Parms {
  class FString aPropName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString aPropValue;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.GetPropertyText 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UObject_execGetPropertyText_Parms {
  class FString aPropName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString ReturnValue;  // 8 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  Object.Disable 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UObject_execDisable_Parms {
  FName aProbeFunc;  // 0 80 CPF_Parm
};


//  Object.Enable 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UObject_execEnable_Parms {
  FName aProbeFunc;  // 0 80 CPF_Parm
};


//  Object.IsA 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UObject_execIsA_Parms {
  FName aClassName;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.ClassIsChildOf 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execClassIsChildOf_Parms {
  class UClass* aTestClass;  // 0 80 CPF_Parm
  class UClass* aParentClass;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.GetStateName 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UObject_execGetStateName_Parms {
  FName ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.IsInState 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UObject_execIsInState_Parms {
  FName aTestState;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.GotoState 20401 0 ( FUNC_Final FUNC_Native FUNC_Public )
struct UObject_execGotoState_Parms {
  FName aNewState;  // 0 90 CPF_OptionalParm CPF_Parm
  FName aLabel;  // 4 90 CPF_OptionalParm CPF_Parm
};


//  Object.Localize 22400 0 ( FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execLocalize_Parms {
  class FString aSectionName;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString aKeyName;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  class FString aPackageName;  // 10 400080 CPF_Parm CPF_NeedCtorLink
  class FString ReturnValue;  // 18 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  Object.SetMinLogLevel 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execSetMinLogLevel_Parms {
  INT aLevel;  // 0 90 CPF_OptionalParm CPF_Parm
};


//  Object.SBLog 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execSBLog_Parms {
  class FString aS;  // 0 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  INT aLevel;  // 8 90 CPF_OptionalParm CPF_Parm
  BITFIELD aUnique : 1;  // C 90 CPF_OptionalParm CPF_Parm
};


//  Object.Warn 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execWarn_Parms {
  class FString aS;  // 0 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
};


//  Object.Log 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execLog_Parms {
  class FString aS;  // 0 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  FName aTag;  // 8 90 CPF_OptionalParm CPF_Parm
};


//  Object.GetFName 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execGetFName_Parms {
  FName ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.ConvertURUToDegrees 22003 0 ( FUNC_Final FUNC_Defined FUNC_Static FUNC_Public )
struct UObject_execConvertURUToDegrees_Parms {
  FLOAT aAngleURU;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.ConvertDegreesToURU 22003 0 ( FUNC_Final FUNC_Defined FUNC_Static FUNC_Public )
struct UObject_execConvertDegreesToURU_Parms {
  FLOAT aAngleDegrees;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.IsInAngle 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execIsInAngle_Parms {
  FLOAT aCurrentAngle;  // 0 80 CPF_Parm
  class FVector aCurrentLocation;  // 4 80 CPF_Parm
  FLOAT aCurrentDirection;  // 10 80 CPF_Parm
  class FVector aLocation;  // 14 80 CPF_Parm
  FLOAT aRadius;  // 20 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 24 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.QuatSlerp 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execQuatSlerp_Parms {
  class FQuat aA;  // 0 80 CPF_Parm
  class FQuat aB;  // 10 80 CPF_Parm
  FLOAT aSlerp;  // 20 80 CPF_Parm
  class FQuat ReturnValue;  // 24 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.QuatToRotator 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execQuatToRotator_Parms {
  class FQuat aA;  // 0 80 CPF_Parm
  class FRotator ReturnValue;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.QuatFromRotator 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execQuatFromRotator_Parms {
  class FRotator aA;  // 0 80 CPF_Parm
  class FQuat ReturnValue;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.QuatFromAxisAndAngle 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execQuatFromAxisAndAngle_Parms {
  class FVector aAxis;  // 0 80 CPF_Parm
  FLOAT aAngle;  // C 80 CPF_Parm
  class FQuat ReturnValue;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.QuatFindBetween 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execQuatFindBetween_Parms {
  class FVector aA;  // 0 80 CPF_Parm
  class FVector aB;  // C 80 CPF_Parm
  class FQuat ReturnValue;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.QuatRotateVector 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execQuatRotateVector_Parms {
  class FQuat aA;  // 0 80 CPF_Parm
  class FVector aB;  // 10 80 CPF_Parm
  class FVector ReturnValue;  // 1C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.QuatInvert 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execQuatInvert_Parms {
  class FQuat aA;  // 0 80 CPF_Parm
  class FQuat ReturnValue;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.QuatProduct 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execQuatProduct_Parms {
  class FQuat aA;  // 0 80 CPF_Parm
  class FQuat aB;  // 10 80 CPF_Parm
  class FQuat ReturnValue;  // 20 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.InterpCurveGetInputDomain 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execInterpCurveGetInputDomain_Parms {
  class FInterpCurve aCurve;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  FLOAT outMin;  // C 180 CPF_Parm CPF_OutParm
  FLOAT outMax;  // 10 180 CPF_Parm CPF_OutParm
};


//  Object.InterpCurveGetOutputRange 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execInterpCurveGetOutputRange_Parms {
  class FInterpCurve aCurve;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  FLOAT outMin;  // C 180 CPF_Parm CPF_OutParm
  FLOAT outMax;  // 10 180 CPF_Parm CPF_OutParm
};


//  Object.InterpCurveEval 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execInterpCurveEval_Parms {
  class FInterpCurve aCurve;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  FLOAT aInput;  // C 80 CPF_Parm
  FLOAT ReturnValue;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.NotEqual_NameName 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execNotEqual_NameName_Parms {
  FName aA;  // 0 80 CPF_Parm
  FName aB;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.EqualEqual_NameName 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execEqualEqual_NameName_Parms {
  FName aA;  // 0 80 CPF_Parm
  FName aB;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.NotEqual_ObjectObject 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execNotEqual_ObjectObject_Parms {
  class UObject* aA;  // 0 80 CPF_Parm
  class UObject* aB;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.EqualEqual_ObjectObject 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execEqualEqual_ObjectObject_Parms {
  class UObject* aA;  // 0 80 CPF_Parm
  class UObject* aB;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Eval 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execEval_Parms {
  BITFIELD aCondition : 1;  // 0 80 CPF_Parm
  class FString aResultIfTrue;  // 4 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  class FString aResultIfFalse;  // C 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  class FString ReturnValue;  // 14 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  Object.Repl 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execRepl_Parms {
  class FString aSrc;  // 0 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  class FString aMatch;  // 8 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  class FString aWith;  // 10 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  BITFIELD aCaseSensitive : 1;  // 18 90 CPF_OptionalParm CPF_Parm
  class FString ReturnValue;  // 1C 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  Object.StrCmp 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execStrCmp_Parms {
  class FString aS;  // 0 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  class FString aT;  // 8 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  INT aCount;  // 10 90 CPF_OptionalParm CPF_Parm
  BITFIELD aCaseSensitive : 1;  // 14 90 CPF_OptionalParm CPF_Parm
  INT ReturnValue;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Split 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execSplit_Parms {
  class FString aSrc;  // 0 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  class FString aDivider;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  TArray<class FString> outParts;  // 10 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  INT ReturnValue;  // 1C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Divide 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execDivide_Parms {
  class FString aSrc;  // 0 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  class FString aDivider;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  class FString outLeftPart;  // 10 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  class FString outRightPart;  // 18 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  BITFIELD ReturnValue : 1;  // 20 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Locs 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execLocs_Parms {
  class FString aS;  // 0 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  class FString ReturnValue;  // 8 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  Object.Asc 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execAsc_Parms {
  class FString aS;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Chr 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execChr_Parms {
  INT aI;  // 0 80 CPF_Parm
  class FString ReturnValue;  // 4 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  Object.UpperFirst 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execUpperFirst_Parms {
  class FString aS;  // 0 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  class FString ReturnValue;  // 8 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  Object.Caps 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execCaps_Parms {
  class FString aS;  // 0 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  class FString ReturnValue;  // 8 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  Object.Right 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execRight_Parms {
  class FString aS;  // 0 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  INT aI;  // 8 80 CPF_Parm
  class FString ReturnValue;  // C 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  Object.Left 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execLeft_Parms {
  class FString aS;  // 0 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  INT aI;  // 8 80 CPF_Parm
  class FString ReturnValue;  // C 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  Object.Mid 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execMid_Parms {
  class FString aS;  // 0 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  INT aI;  // 8 80 CPF_Parm
  INT aJ;  // C 90 CPF_OptionalParm CPF_Parm
  class FString ReturnValue;  // 10 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  Object.InStr 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execInStr_Parms {
  class FString aS;  // 0 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  class FString aT;  // 8 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  INT ReturnValue;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Len 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execLen_Parms {
  class FString aS;  // 0 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.SubtractEqual_StrStr 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execSubtractEqual_StrStr_Parms {
  class FString outA;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  class FString aB;  // 8 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  class FString ReturnValue;  // 10 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  Object.AtEqual_StrStr 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execAtEqual_StrStr_Parms {
  class FString outA;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  class FString aB;  // 8 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  class FString ReturnValue;  // 10 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  Object.ConcatEqual_StrStr 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execConcatEqual_StrStr_Parms {
  class FString outA;  // 0 400180 CPF_Parm CPF_OutParm CPF_NeedCtorLink
  class FString aB;  // 8 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  class FString ReturnValue;  // 10 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  Object.ComplementEqual_StrStr 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execComplementEqual_StrStr_Parms {
  class FString aA;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString aB;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.NotEqual_StrStr 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execNotEqual_StrStr_Parms {
  class FString aA;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString aB;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.EqualEqual_StrStr 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execEqualEqual_StrStr_Parms {
  class FString aA;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString aB;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.GreaterEqual_StrStr 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execGreaterEqual_StrStr_Parms {
  class FString aA;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString aB;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.LessEqual_StrStr 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execLessEqual_StrStr_Parms {
  class FString aA;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString aB;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Greater_StrStr 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execGreater_StrStr_Parms {
  class FString aA;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString aB;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Less_StrStr 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execLess_StrStr_Parms {
  class FString aA;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  class FString aB;  // 8 400080 CPF_Parm CPF_NeedCtorLink
  BITFIELD ReturnValue : 1;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.At_StrStr 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execAt_StrStr_Parms {
  class FString aA;  // 0 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  class FString aB;  // 8 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  class FString ReturnValue;  // 10 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  Object.Concat_StrStr 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execConcat_StrStr_Parms {
  class FString aA;  // 0 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  class FString aB;  // 8 400880 CPF_Parm CPF_CoerceParm CPF_NeedCtorLink
  class FString ReturnValue;  // 10 400580 CPF_Parm CPF_OutParm CPF_ReturnParm CPF_NeedCtorLink
};


//  Object.RGBA 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execRGBA_Parms {
  BYTE aR;  // 0 80 CPF_Parm
  BYTE aG;  // 1 80 CPF_Parm
  BYTE aB;  // 2 80 CPF_Parm
  BYTE aA;  // 3 80 CPF_Parm
  class FColor ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.RGB 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execRGB_Parms {
  BYTE aR;  // 0 80 CPF_Parm
  BYTE aG;  // 1 80 CPF_Parm
  BYTE aB;  // 2 80 CPF_Parm
  class FColor ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.ClockwiseFrom_IntInt 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execClockwiseFrom_IntInt_Parms {
  INT aA;  // 0 80 CPF_Parm
  INT aB;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Normalize 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execNormalize_Parms {
  class FRotator aRot;  // 0 80 CPF_Parm
  class FRotator ReturnValue;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.OrthoRotation 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execOrthoRotation_Parms {
  class FVector aX;  // 0 80 CPF_Parm
  class FVector aY;  // C 80 CPF_Parm
  class FVector aZ;  // 18 80 CPF_Parm
  class FRotator ReturnValue;  // 24 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.RotRand 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execRotRand_Parms {
  BITFIELD aRoll : 1;  // 0 90 CPF_OptionalParm CPF_Parm
  class FRotator ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.GetUnAxes 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execGetUnAxes_Parms {
  class FRotator aA;  // 0 80 CPF_Parm
  class FVector outX;  // C 180 CPF_Parm CPF_OutParm
  class FVector outY;  // 18 180 CPF_Parm CPF_OutParm
  class FVector outZ;  // 24 180 CPF_Parm CPF_OutParm
};


//  Object.GetAxes 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execGetAxes_Parms {
  class FRotator aA;  // 0 80 CPF_Parm
  class FVector outX;  // C 180 CPF_Parm CPF_OutParm
  class FVector outY;  // 18 180 CPF_Parm CPF_OutParm
  class FVector outZ;  // 24 180 CPF_Parm CPF_OutParm
};


//  Object.SubtractEqual_RotatorRotator 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execSubtractEqual_RotatorRotator_Parms {
  class FRotator outA;  // 0 180 CPF_Parm CPF_OutParm
  class FRotator aB;  // C 80 CPF_Parm
  class FRotator ReturnValue;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.AddEqual_RotatorRotator 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execAddEqual_RotatorRotator_Parms {
  class FRotator outA;  // 0 180 CPF_Parm CPF_OutParm
  class FRotator aB;  // C 80 CPF_Parm
  class FRotator ReturnValue;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Subtract_RotatorRotator 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execSubtract_RotatorRotator_Parms {
  class FRotator aA;  // 0 80 CPF_Parm
  class FRotator aB;  // C 80 CPF_Parm
  class FRotator ReturnValue;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Add_RotatorRotator 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execAdd_RotatorRotator_Parms {
  class FRotator aA;  // 0 80 CPF_Parm
  class FRotator aB;  // C 80 CPF_Parm
  class FRotator ReturnValue;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.DivideEqual_RotatorFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execDivideEqual_RotatorFloat_Parms {
  class FRotator outA;  // 0 180 CPF_Parm CPF_OutParm
  FLOAT aB;  // C 80 CPF_Parm
  class FRotator ReturnValue;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.MultiplyEqual_RotatorFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execMultiplyEqual_RotatorFloat_Parms {
  class FRotator outA;  // 0 180 CPF_Parm CPF_OutParm
  FLOAT aB;  // C 80 CPF_Parm
  class FRotator ReturnValue;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Divide_RotatorFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execDivide_RotatorFloat_Parms {
  class FRotator aA;  // 0 80 CPF_Parm
  FLOAT aB;  // C 80 CPF_Parm
  class FRotator ReturnValue;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Multiply_FloatRotator 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execMultiply_FloatRotator_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  class FRotator aB;  // 4 80 CPF_Parm
  class FRotator ReturnValue;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Multiply_RotatorFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execMultiply_RotatorFloat_Parms {
  class FRotator aA;  // 0 80 CPF_Parm
  FLOAT aB;  // C 80 CPF_Parm
  class FRotator ReturnValue;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.NotEqual_RotatorRotator 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execNotEqual_RotatorRotator_Parms {
  class FRotator aA;  // 0 80 CPF_Parm
  class FRotator aB;  // C 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.EqualEqual_RotatorRotator 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execEqualEqual_RotatorRotator_Parms {
  class FRotator aA;  // 0 80 CPF_Parm
  class FRotator aB;  // C 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.MirrorVectorByNormal 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execMirrorVectorByNormal_Parms {
  class FVector aVect;  // 0 80 CPF_Parm
  class FVector aNormal;  // C 80 CPF_Parm
  class FVector ReturnValue;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.VRand 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execVRand_Parms {
  class FVector ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Invert 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execInvert_Parms {
  class FVector outX;  // 0 180 CPF_Parm CPF_OutParm
  class FVector outY;  // C 180 CPF_Parm CPF_OutParm
  class FVector outZ;  // 18 180 CPF_Parm CPF_OutParm
};


//  Object.Normal 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execNormal_Parms {
  class FVector aA;  // 0 80 CPF_Parm
  class FVector ReturnValue;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.VSize 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execVSize_Parms {
  class FVector aA;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.SubtractEqual_VectorVector 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execSubtractEqual_VectorVector_Parms {
  class FVector outA;  // 0 180 CPF_Parm CPF_OutParm
  class FVector aB;  // C 80 CPF_Parm
  class FVector ReturnValue;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.AddEqual_VectorVector 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execAddEqual_VectorVector_Parms {
  class FVector outA;  // 0 180 CPF_Parm CPF_OutParm
  class FVector aB;  // C 80 CPF_Parm
  class FVector ReturnValue;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.DivideEqual_VectorFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execDivideEqual_VectorFloat_Parms {
  class FVector outA;  // 0 180 CPF_Parm CPF_OutParm
  FLOAT aB;  // C 80 CPF_Parm
  class FVector ReturnValue;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.MultiplyEqual_VectorVector 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execMultiplyEqual_VectorVector_Parms {
  class FVector outA;  // 0 180 CPF_Parm CPF_OutParm
  class FVector aB;  // C 80 CPF_Parm
  class FVector ReturnValue;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.MultiplyEqual_VectorFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execMultiplyEqual_VectorFloat_Parms {
  class FVector outA;  // 0 180 CPF_Parm CPF_OutParm
  FLOAT aB;  // C 80 CPF_Parm
  class FVector ReturnValue;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Cross_VectorVector 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execCross_VectorVector_Parms {
  class FVector aA;  // 0 80 CPF_Parm
  class FVector aB;  // C 80 CPF_Parm
  class FVector ReturnValue;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Dot_VectorVector 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execDot_VectorVector_Parms {
  class FVector aA;  // 0 80 CPF_Parm
  class FVector aB;  // C 80 CPF_Parm
  FLOAT ReturnValue;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.NotEqual_VectorVector 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execNotEqual_VectorVector_Parms {
  class FVector aA;  // 0 80 CPF_Parm
  class FVector aB;  // C 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.EqualEqual_VectorVector 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execEqualEqual_VectorVector_Parms {
  class FVector aA;  // 0 80 CPF_Parm
  class FVector aB;  // C 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.GreaterGreater_VectorRotator 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execGreaterGreater_VectorRotator_Parms {
  class FVector aA;  // 0 80 CPF_Parm
  class FRotator aB;  // C 80 CPF_Parm
  class FVector ReturnValue;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.LessLess_VectorRotator 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execLessLess_VectorRotator_Parms {
  class FVector aA;  // 0 80 CPF_Parm
  class FRotator aB;  // C 80 CPF_Parm
  class FVector ReturnValue;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Subtract_VectorVector 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execSubtract_VectorVector_Parms {
  class FVector aA;  // 0 80 CPF_Parm
  class FVector aB;  // C 80 CPF_Parm
  class FVector ReturnValue;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Add_VectorVector 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execAdd_VectorVector_Parms {
  class FVector aA;  // 0 80 CPF_Parm
  class FVector aB;  // C 80 CPF_Parm
  class FVector ReturnValue;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Divide_VectorFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execDivide_VectorFloat_Parms {
  class FVector aA;  // 0 80 CPF_Parm
  FLOAT aB;  // C 80 CPF_Parm
  class FVector ReturnValue;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Multiply_VectorVector 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execMultiply_VectorVector_Parms {
  class FVector aA;  // 0 80 CPF_Parm
  class FVector aB;  // C 80 CPF_Parm
  class FVector ReturnValue;  // 18 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Multiply_FloatVector 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execMultiply_FloatVector_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  class FVector aB;  // 4 80 CPF_Parm
  class FVector ReturnValue;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Multiply_VectorFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execMultiply_VectorFloat_Parms {
  class FVector aA;  // 0 80 CPF_Parm
  FLOAT aB;  // C 80 CPF_Parm
  class FVector ReturnValue;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Subtract_PreVector 23411 0 ( FUNC_Final FUNC_PreOperator FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execSubtract_PreVector_Parms {
  class FVector aA;  // 0 80 CPF_Parm
  class FVector ReturnValue;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.FRandRange 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execFRandRange_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT aB;  // 4 80 CPF_Parm
  FLOAT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Round 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execRound_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Ceil 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execCeil_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Smerp 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execSmerp_Parms {
  FLOAT aAlpha;  // 0 80 CPF_Parm
  FLOAT aA;  // 4 80 CPF_Parm
  FLOAT aB;  // 8 80 CPF_Parm
  FLOAT ReturnValue;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.LerpVector 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execLerpVector_Parms {
  class FVector A;  // 0 80 CPF_Parm
  class FVector B;  // C 80 CPF_Parm
  FLOAT degree;  // 18 80 CPF_Parm
  class FVector ReturnValue;  // 1C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Lerp 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execLerp_Parms {
  FLOAT aAlpha;  // 0 80 CPF_Parm
  FLOAT aA;  // 4 80 CPF_Parm
  FLOAT aB;  // 8 80 CPF_Parm
  BITFIELD aClampRange : 1;  // C 90 CPF_OptionalParm CPF_Parm
  FLOAT ReturnValue;  // 10 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.FClamp 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execFClamp_Parms {
  FLOAT aV;  // 0 80 CPF_Parm
  FLOAT aA;  // 4 80 CPF_Parm
  FLOAT aB;  // 8 80 CPF_Parm
  FLOAT ReturnValue;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.FMax 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execFMax_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT aB;  // 4 80 CPF_Parm
  FLOAT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.FMin 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execFMin_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT aB;  // 4 80 CPF_Parm
  FLOAT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.FRand 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execFRand_Parms {
  FLOAT ReturnValue;  // 0 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Square 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execSquare_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Sqrt 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execSqrt_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Loge 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execLoge_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Exp 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execExp_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Atan 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execAtan_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT aB;  // 4 80 CPF_Parm
  FLOAT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Tan 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execTan_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Acos 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execAcos_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Cos 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execCos_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Asin 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execAsin_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Sin 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execSin_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Abs 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execAbs_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.SubtractEqual_FloatFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execSubtractEqual_FloatFloat_Parms {
  FLOAT outA;  // 0 180 CPF_Parm CPF_OutParm
  FLOAT aB;  // 4 80 CPF_Parm
  FLOAT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.AddEqual_FloatFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execAddEqual_FloatFloat_Parms {
  FLOAT outA;  // 0 180 CPF_Parm CPF_OutParm
  FLOAT aB;  // 4 80 CPF_Parm
  FLOAT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.DivideEqual_FloatFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execDivideEqual_FloatFloat_Parms {
  FLOAT outA;  // 0 180 CPF_Parm CPF_OutParm
  FLOAT aB;  // 4 80 CPF_Parm
  FLOAT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.MultiplyEqual_FloatFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execMultiplyEqual_FloatFloat_Parms {
  FLOAT outA;  // 0 180 CPF_Parm CPF_OutParm
  FLOAT aB;  // 4 80 CPF_Parm
  FLOAT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.NotEqual_FloatFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execNotEqual_FloatFloat_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT aB;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.ComplementEqual_FloatFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execComplementEqual_FloatFloat_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT aB;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.EqualEqual_FloatFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execEqualEqual_FloatFloat_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT aB;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.GreaterEqual_FloatFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execGreaterEqual_FloatFloat_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT aB;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.LessEqual_FloatFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execLessEqual_FloatFloat_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT aB;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Greater_FloatFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execGreater_FloatFloat_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT aB;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Less_FloatFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execLess_FloatFloat_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT aB;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Subtract_FloatFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execSubtract_FloatFloat_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT aB;  // 4 80 CPF_Parm
  FLOAT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Add_FloatFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execAdd_FloatFloat_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT aB;  // 4 80 CPF_Parm
  FLOAT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Percent_FloatFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execPercent_FloatFloat_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT aB;  // 4 80 CPF_Parm
  FLOAT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Divide_FloatFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execDivide_FloatFloat_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT aB;  // 4 80 CPF_Parm
  FLOAT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Multiply_FloatFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execMultiply_FloatFloat_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT aB;  // 4 80 CPF_Parm
  FLOAT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.MultiplyMultiply_FloatFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execMultiplyMultiply_FloatFloat_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT aB;  // 4 80 CPF_Parm
  FLOAT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Subtract_PreFloat 23411 0 ( FUNC_Final FUNC_PreOperator FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execSubtract_PreFloat_Parms {
  FLOAT aA;  // 0 80 CPF_Parm
  FLOAT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.RandRange 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execRandRange_Parms {
  INT aA;  // 0 80 CPF_Parm
  INT aB;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Mod 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execMod_Parms {
  INT aA;  // 0 80 CPF_Parm
  INT aB;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Clamp 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execClamp_Parms {
  INT aV;  // 0 80 CPF_Parm
  INT aA;  // 4 80 CPF_Parm
  INT aB;  // 8 80 CPF_Parm
  INT ReturnValue;  // C 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Max 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execMax_Parms {
  INT aA;  // 0 80 CPF_Parm
  INT aB;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Min 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execMin_Parms {
  INT aA;  // 0 80 CPF_Parm
  INT aB;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Rand 22401 0 ( FUNC_Final FUNC_Native FUNC_Static FUNC_Public )
struct UObject_execRand_Parms {
  INT aMax;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.SubtractSubtract_Int 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execSubtractSubtract_Int_Parms {
  INT outA;  // 0 180 CPF_Parm CPF_OutParm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.AddAdd_Int 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execAddAdd_Int_Parms {
  INT outA;  // 0 180 CPF_Parm CPF_OutParm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.SubtractSubtract_PreInt 23411 0 ( FUNC_Final FUNC_PreOperator FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execSubtractSubtract_PreInt_Parms {
  INT outA;  // 0 180 CPF_Parm CPF_OutParm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.AddAdd_PreInt 23411 0 ( FUNC_Final FUNC_PreOperator FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execAddAdd_PreInt_Parms {
  INT outA;  // 0 180 CPF_Parm CPF_OutParm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.SubtractEqual_IntInt 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execSubtractEqual_IntInt_Parms {
  INT outA;  // 0 180 CPF_Parm CPF_OutParm
  INT aB;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.AddEqual_IntInt 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execAddEqual_IntInt_Parms {
  INT outA;  // 0 180 CPF_Parm CPF_OutParm
  INT aB;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.DivideEqual_IntFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execDivideEqual_IntFloat_Parms {
  INT outA;  // 0 180 CPF_Parm CPF_OutParm
  FLOAT aB;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.MultiplyEqual_IntFloat 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execMultiplyEqual_IntFloat_Parms {
  INT outA;  // 0 180 CPF_Parm CPF_OutParm
  FLOAT aB;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Or_IntInt 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execOr_IntInt_Parms {
  INT aA;  // 0 80 CPF_Parm
  INT aB;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Xor_IntInt 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execXor_IntInt_Parms {
  INT aA;  // 0 80 CPF_Parm
  INT aB;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.And_IntInt 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execAnd_IntInt_Parms {
  INT aA;  // 0 80 CPF_Parm
  INT aB;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.NotEqual_IntInt 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execNotEqual_IntInt_Parms {
  INT aA;  // 0 80 CPF_Parm
  INT aB;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.EqualEqual_IntInt 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execEqualEqual_IntInt_Parms {
  INT aA;  // 0 80 CPF_Parm
  INT aB;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.GreaterEqual_IntInt 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execGreaterEqual_IntInt_Parms {
  INT aA;  // 0 80 CPF_Parm
  INT aB;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.LessEqual_IntInt 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execLessEqual_IntInt_Parms {
  INT aA;  // 0 80 CPF_Parm
  INT aB;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Greater_IntInt 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execGreater_IntInt_Parms {
  INT aA;  // 0 80 CPF_Parm
  INT aB;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Less_IntInt 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execLess_IntInt_Parms {
  INT aA;  // 0 80 CPF_Parm
  INT aB;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.GreaterGreaterGreater_IntInt 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execGreaterGreaterGreater_IntInt_Parms {
  INT aA;  // 0 80 CPF_Parm
  INT aB;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.GreaterGreater_IntInt 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execGreaterGreater_IntInt_Parms {
  INT aA;  // 0 80 CPF_Parm
  INT aB;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.LessLess_IntInt 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execLessLess_IntInt_Parms {
  INT aA;  // 0 80 CPF_Parm
  INT aB;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Subtract_IntInt 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execSubtract_IntInt_Parms {
  INT aA;  // 0 80 CPF_Parm
  INT aB;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Add_IntInt 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execAdd_IntInt_Parms {
  INT aA;  // 0 80 CPF_Parm
  INT aB;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Divide_IntInt 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execDivide_IntInt_Parms {
  INT aA;  // 0 80 CPF_Parm
  INT aB;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Multiply_IntInt 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execMultiply_IntInt_Parms {
  INT aA;  // 0 80 CPF_Parm
  INT aB;  // 4 80 CPF_Parm
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Subtract_PreInt 23411 0 ( FUNC_Final FUNC_PreOperator FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execSubtract_PreInt_Parms {
  INT aA;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Complement_PreInt 23411 0 ( FUNC_Final FUNC_PreOperator FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execComplement_PreInt_Parms {
  INT aA;  // 0 80 CPF_Parm
  INT ReturnValue;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.SubtractSubtract_Byte 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execSubtractSubtract_Byte_Parms {
  BYTE outA;  // 0 180 CPF_Parm CPF_OutParm
  BYTE ReturnValue;  // 1 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.AddAdd_Byte 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execAddAdd_Byte_Parms {
  BYTE outA;  // 0 180 CPF_Parm CPF_OutParm
  BYTE ReturnValue;  // 1 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.SubtractSubtract_PreByte 23411 0 ( FUNC_Final FUNC_PreOperator FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execSubtractSubtract_PreByte_Parms {
  BYTE outA;  // 0 180 CPF_Parm CPF_OutParm
  BYTE ReturnValue;  // 1 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.AddAdd_PreByte 23411 0 ( FUNC_Final FUNC_PreOperator FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execAddAdd_PreByte_Parms {
  BYTE outA;  // 0 180 CPF_Parm CPF_OutParm
  BYTE ReturnValue;  // 1 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.SubtractEqual_ByteByte 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execSubtractEqual_ByteByte_Parms {
  BYTE outA;  // 0 180 CPF_Parm CPF_OutParm
  BYTE aB;  // 1 80 CPF_Parm
  BYTE ReturnValue;  // 2 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.AddEqual_ByteByte 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execAddEqual_ByteByte_Parms {
  BYTE outA;  // 0 180 CPF_Parm CPF_OutParm
  BYTE aB;  // 1 80 CPF_Parm
  BYTE ReturnValue;  // 2 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.DivideEqual_ByteByte 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execDivideEqual_ByteByte_Parms {
  BYTE outA;  // 0 180 CPF_Parm CPF_OutParm
  BYTE aB;  // 1 80 CPF_Parm
  BYTE ReturnValue;  // 2 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.MultiplyEqual_ByteByte 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execMultiplyEqual_ByteByte_Parms {
  BYTE outA;  // 0 180 CPF_Parm CPF_OutParm
  BYTE aB;  // 1 80 CPF_Parm
  BYTE ReturnValue;  // 2 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.OrOr_BoolBool 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execOrOr_BoolBool_Parms {
  BITFIELD aA : 1;  // 0 80 CPF_Parm
  BITFIELD aB : 1;  // 4 280 CPF_Parm CPF_SkipParm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.XorXor_BoolBool 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execXorXor_BoolBool_Parms {
  BITFIELD aA : 1;  // 0 80 CPF_Parm
  BITFIELD aB : 1;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.AndAnd_BoolBool 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execAndAnd_BoolBool_Parms {
  BITFIELD aA : 1;  // 0 80 CPF_Parm
  BITFIELD aB : 1;  // 4 280 CPF_Parm CPF_SkipParm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.NotEqual_BoolBool 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execNotEqual_BoolBool_Parms {
  BITFIELD aA : 1;  // 0 80 CPF_Parm
  BITFIELD aB : 1;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.EqualEqual_BoolBool 23401 0 ( FUNC_Final FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execEqualEqual_BoolBool_Parms {
  BITFIELD aA : 1;  // 0 80 CPF_Parm
  BITFIELD aB : 1;  // 4 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


//  Object.Not_PreBool 23411 0 ( FUNC_Final FUNC_PreOperator FUNC_Native FUNC_Operator FUNC_Static FUNC_Public )
struct UObject_execNot_PreBool_Parms {
  BITFIELD aA : 1;  // 0 80 CPF_Parm
  BITFIELD ReturnValue : 1;  // 4 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UObject 112 ( CLASS_Compiled CLASS_Parsed CLASS_NoExport )
/*
class DLL_IMPORT UObject {
  public:
    DWORD ObjectInternal[6];  // 0 3002 CPF_Const CPF_Native CPF_Transient
    class UObject* Outer;  // 18 1002 CPF_Const CPF_Native
    INT ObjectFlags;  // 1C 1002 CPF_Const CPF_Native
    FName Name;  // 20 21003 CPF_Edit CPF_Const CPF_Native CPF_EditConst
    class UClass* Class;  // 24 21002 CPF_Const CPF_Native CPF_EditConst
    virtual unsigned long STDCALL AddRef(void);
    virtual unsigned long STDCALL Release(void);
    virtual void ProcessEvent(class UFunction *,void *,void *);
    virtual ~UObject(void);
    virtual void ProcessDelegate(class FName,struct FScriptDelegate *,void *,void *);
    virtual void ProcessState(float);
    virtual int ProcessRemoteFunction(class UFunction *,void *,struct FFrame *);
    virtual void Modify(void);
    virtual void PostLoad(void);
    virtual void Destroy(void);
    virtual void Serialize(class FArchive &);
    virtual int IsPendingKill(void)const ;
    virtual void ExtendCleanMe(void);
    virtual int IsExtendedCleaned(void);
    virtual void SetCleanIndex(int);
    virtual void CleanWeakPointers(void);
    virtual void PostRecycled(void);
    virtual enum EGotoState GotoState(class FName);
    virtual int GotoLabel(class FName);
    virtual void ScriptInit(class ALevelInfo *);
    virtual void InitExecution(void);
    virtual void ShutdownAfterError(void);
    virtual void PostConstructObject(void);
    virtual void PostEditChange(void);
    virtual void SBPostEditChange(class UProperty *);
    virtual void PreEditUndo(void);
    virtual void PostEditUndo(void);
    virtual void CallFunction(struct FFrame &,void * const,class UFunction *);
    virtual int ScriptConsoleExec(unsigned short const *,class FOutputDevice &,class UObject *);
    virtual void Register(void);
    virtual void LanguageChange(void);
    virtual void ConditionalPostLoad(void);
    virtual void Rename(unsigned short const *,class UObject *);
    virtual class UObject * Clone(bool,bool,class UObject *)const ;
    virtual void ExecutingBadStateCode(struct FFrame &);
    virtual unsigned int GetCPPSize(void);
    virtual void ValidateObject(class TArray<struct UObject::FValidateIssue> &,bool);
    virtual class FString ValidateObjectGetName(void);
    virtual void Inspect(class UObject::FInspectInterface *);
    UObject(class UObject const &);
    UObject(enum EInPlaceConstructor,class UClass *,class UObject *,class FName,unsigned long);
    UObject(enum ENativeConstructor,class UClass *,unsigned short const *,unsigned short const *,unsigned long);
    UObject(enum EStaticConstructor,unsigned short const *,unsigned short const *,unsigned long);
    UObject(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    static void CDECL operator delete(void *,unsigned int);
    class UObject & operator=(class UObject const &);
    void AddToRoot(void);
    static void CDECL BeginLoad(void);
    static void CDECL BindPackage(class UPackage *);
    static bool CDECL CheckLoad(void);
    void ClearConfig(class UClass *,unsigned short const *);
    void ClearFlags(unsigned long);
    static void CDECL CollectGarbage(unsigned long);
    int ConditionalDestroy(void);
    void ConditionalRegister(void);
    void ConditionalShutdownAfterError(void);
    static class UPackage * CDECL CreatePackage(class UObject *,unsigned short const *);
    static int CDECL DeletePackage(unsigned short const *);
    static void CDECL DumpTraceStack(int);
    static void CDECL EndLoad(void);
    static void CDECL ExitProperties(unsigned char *,class UClass *);
    static void CDECL ExportProperties(class FOutputDevice &,class UClass *,unsigned char *,int,class UClass *,unsigned char *);
    void ExtendCleanup(void);
    int FindArrayProperty(class FString,class FArray * *,int *);
    int FindBoolProperty(class FString,int *);
    int FindFNameProperty(class FString,class FName *);
    int FindFloatProperty(class FString,float *);
    class UFunction * FindFunction(class FName,int);
    class UFunction * FindFunctionChecked(class FName,int);
    int FindIntProperty(class FString,int *);
    class UField * FindObjectField(class FName,int);
    int FindObjectProperty(class FString,class UObject * *);
    int FindPointerProperty(class FString,unsigned long *);
    class UProperty * FindProperty(int,class UClass *,int);
    class UState * FindState(class FName);
    int FindStructProperty(class FString,class UStruct * *);
    void FireDelegateInt(class UObject *,class FName,int);
    void FireDelegateObject(class UObject *,class FName,class UObject *);
    void FireDelegateString(class UObject *,class FName,class FString);
    class FString GetAllPropertyTexts(void);
    class UClass * GetClass(void)const ;
    class FName const GetFName(void)const ;
    unsigned long GetFlags(void)const ;
    unsigned short const * GetFullName(unsigned short *)const ;
    unsigned long GetIndex(void)const ;
    static class UObject * CDECL GetIndexedObject(int);
    static int CDECL GetInitialized(void);
    static unsigned short const * CDECL GetLanguage(void);
    class ULinkerLoad * GetLinker(void)const ;
    int GetLinkerIndex(void)const ;
    unsigned short const * GetName(void)const ;
    static int CDECL GetObjectHash(class FName,int);
    class UObject * GetOuter(void)const ;
    static class ULinkerLoad * CDECL GetPackageLinker(class UObject *,unsigned short const *,unsigned long,class UPackageMap *,int,class FArchive *);
    unsigned short const * GetPathName(class UObject *,unsigned short *)const ;
    static void CDECL GetPreferences(class TArray<class FPreferencesInfo> &,unsigned short const *,int);
    static void CDECL GetReferencers(class UObject *,class TArray<class UObject *> &);
    static void CDECL GetRegistryObjects(class TArray<class FRegistryObjectInfo> &,class UClass *,class UClass *,int);
    class UObject * GetRootOuter(void)const ;
    static void CDECL GetShortestRoute(class UObject *,class TArray<class UObject *> &);
    struct FStateFrame * GetStateFrame(void)const ;
    static class UPackage * CDECL GetTransientPackage(void);
    static void CDECL GlobalSetProperty(unsigned short const *,class UClass *,class UProperty *,int,int);
    void InitClassDefaultObject(class UClass *,int);
    static void CDECL InitProperties(unsigned char *,int,class UClass *,unsigned char *,int,class UObject *,class UObject *,int);
    static void CDECL InternalConstructor(void *);
    int IsA(class UClass *)const ;
    int IsIn(class UObject *)const ;
    int IsInState(class FName);
    int IsProbing(class FName);
    static int CDECL IsReferenced(class UObject * &,unsigned long,int);
    int IsValid(void)const ;
    void LoadConfig(int,class UClass *,unsigned short const *,int,int,int,class UProperty *);
    void LoadLocalized(void);
    static class UObject * CDECL LoadPackage(class UObject *,unsigned short const *,unsigned long);
    static void CDECL LogScriptProfile(void);
    void ParseParms(unsigned short const *);
    void ProcessInternal(struct FFrame &,void * const);
    static void CDECL ProcessRegistrants(void);
    void RemoveFromRoot(void);
    static void CDECL ResetConfig(class UClass *,unsigned short const *);
    static void CDECL ResetLoaders(class UObject *,int,int);
    static void CDECL ResetScriptProfile(void);
    void SaveConfig(unsigned long,unsigned short const *);
    static int CDECL SavePackage(class UObject *,class UObject *,unsigned long,unsigned short const *,class FOutputDevice *,class ULinkerLoad *);
    static void CDECL SerializeRootSet(class FArchive &,unsigned long,unsigned long);
    int SetAllPropertyTexts(class FString const &);
    void SetClass(class UClass *);
    void SetFlags(unsigned long);
    static void CDECL SetLanguage(unsigned short const *);
    static void CDECL StartThreadedGC(void);
    static class UObject * CDECL StaticAllocateObject(class UClass *,class UObject *,class FName,unsigned long,class UObject *,class FOutputDevice *,class UObject *,class UObject *);
    static class UClass * CDECL StaticClass(void);
    static unsigned short const * CDECL StaticConfigName(void);
    static class UObject * CDECL StaticConstructObject(class UClass *,class UObject *,class FName,unsigned long,class UObject *,class FOutputDevice *,class UObject *);
    void StaticConstructor(void);
    static int CDECL StaticExec(unsigned short const *,class FOutputDevice &);
    static void CDECL StaticExit(void);
    static class UObject * CDECL StaticFindObject(class UClass *,class UObject *,unsigned short const *,int);
    static class UObject * CDECL StaticFindObjectChecked(class UClass *,class UObject *,unsigned short const *,int);
    static void CDECL StaticInit(void);
    static class UClass * CDECL StaticLoadClass(class UClass *,class UObject *,unsigned short const *,unsigned short const *,unsigned long,class UPackageMap *);
    static class UObject * CDECL StaticLoadObject(class UClass *,class UObject *,unsigned short const *,unsigned short const *,unsigned long,class UPackageMap *,class FArchive *,int);
    static void CDECL StaticShutdownAfterError(void);
    static void CDECL StaticTick(void);
    enum EValidationResult UObject::ValidateObjectLowestResult(class TArray<struct UObject::FValidateIssue> const &);
    static void CDECL VerifyLinker(class ULinkerLoad *);
    void eventBeginState(void);
    void eventEndState(void);
    void execAbs(struct FFrame &,void * const);
    void execAcos(struct FFrame &,void * const);
    void execAddAdd_Byte(struct FFrame &,void * const);
    void execAddAdd_Int(struct FFrame &,void * const);
    void execAddAdd_PreByte(struct FFrame &,void * const);
    void execAddAdd_PreInt(struct FFrame &,void * const);
    void execAddEqual_ByteByte(struct FFrame &,void * const);
    void execAddEqual_FloatFloat(struct FFrame &,void * const);
    void execAddEqual_IntInt(struct FFrame &,void * const);
    void execAddEqual_RotatorRotator(struct FFrame &,void * const);
    void execAddEqual_VectorVector(struct FFrame &,void * const);
    void execAdd_FloatFloat(struct FFrame &,void * const);
    void execAdd_IntInt(struct FFrame &,void * const);
    void execAdd_RotatorRotator(struct FFrame &,void * const);
    void execAdd_VectorVector(struct FFrame &,void * const);
    void execAllObjects(struct FFrame &,void * const);
    void execAndAnd_BoolBool(struct FFrame &,void * const);
    void execAnd_IntInt(struct FFrame &,void * const);
    void execArrayElement(struct FFrame &,void * const);
    void execAsc(struct FFrame &,void * const);
    void execAsin(struct FFrame &,void * const);
    void execAssert(struct FFrame &,void * const);
    void execAtEqual_StringString(struct FFrame &,void * const);
    void execAt_StringString(struct FFrame &,void * const);
    void execAtan(struct FFrame &,void * const);
    void execBREAKPOINT(struct FFrame &,void * const);
    void execBREAKPOINT_ALWAYS(struct FFrame &,void * const);
    void execBoolToByte(struct FFrame &,void * const);
    void execBoolToFloat(struct FFrame &,void * const);
    void execBoolToInt(struct FFrame &,void * const);
    void execBoolToString(struct FFrame &,void * const);
    void execBoolVariable(struct FFrame &,void * const);
    void execByteConst(struct FFrame &,void * const);
    void execByteToBool(struct FFrame &,void * const);
    void execByteToFloat(struct FFrame &,void * const);
    void execByteToInt(struct FFrame &,void * const);
    void execByteToString(struct FFrame &,void * const);
    void execCaps(struct FFrame &,void * const);
    void execCase(struct FFrame &,void * const);
    void execCeil(struct FFrame &,void * const);
    void execChr(struct FFrame &,void * const);
    void execClamp(struct FFrame &,void * const);
    void execClassContext(struct FFrame &,void * const);
    void execClassIsChildOf(struct FFrame &,void * const);
    void execClearConfig(struct FFrame &,void * const);
    void execClockwiseFrom_IntInt(struct FFrame &,void * const);
    void execClone(struct FFrame &,void * const);
    void execComplementEqual_FloatFloat(struct FFrame &,void * const);
    void execComplementEqual_StringString(struct FFrame &,void * const);
    void execComplement_PreInt(struct FFrame &,void * const);
    void execConcatEqual_StringString(struct FFrame &,void * const);
    void execConcat_StringString(struct FFrame &,void * const);
    void execContext(struct FFrame &,void * const);
    void execCos(struct FFrame &,void * const);
    void execCross_VectorVector(struct FFrame &,void * const);
    void execDebugInfo(struct FFrame &,void * const);
    void execDefaultVariable(struct FFrame &,void * const);
    void execDelegateFunction(struct FFrame &,void * const);
    void execDelegateProperty(struct FFrame &,void * const);
    void execDisable(struct FFrame &,void * const);
    void execDivide(struct FFrame &,void * const);
    void execDivideEqual_ByteByte(struct FFrame &,void * const);
    void execDivideEqual_FloatFloat(struct FFrame &,void * const);
    void execDivideEqual_IntFloat(struct FFrame &,void * const);
    void execDivideEqual_RotatorFloat(struct FFrame &,void * const);
    void execDivideEqual_VectorFloat(struct FFrame &,void * const);
    void execDivide_FloatFloat(struct FFrame &,void * const);
    void execDivide_IntInt(struct FFrame &,void * const);
    void execDivide_RotatorFloat(struct FFrame &,void * const);
    void execDivide_VectorFloat(struct FFrame &,void * const);
    void execDot_VectorVector(struct FFrame &,void * const);
    void execDynArrayElement(struct FFrame &,void * const);
    void execDynArrayInsert(struct FFrame &,void * const);
    void execDynArrayLength(struct FFrame &,void * const);
    void execDynArrayRemove(struct FFrame &,void * const);
    void execDynamicCast(struct FFrame &,void * const);
    void execDynamicLoadObject(struct FFrame &,void * const);
    void execEatString(struct FFrame &,void * const);
    void execEnable(struct FFrame &,void * const);
    void execEndFunctionParms(struct FFrame &,void * const);
    void execEndOfScript(struct FFrame &,void * const);
    void execEqualEqual_BoolBool(struct FFrame &,void * const);
    void execEqualEqual_FloatFloat(struct FFrame &,void * const);
    void execEqualEqual_IntInt(struct FFrame &,void * const);
    void execEqualEqual_NameName(struct FFrame &,void * const);
    void execEqualEqual_ObjectObject(struct FFrame &,void * const);
    void execEqualEqual_RotatorRotator(struct FFrame &,void * const);
    void execEqualEqual_StringString(struct FFrame &,void * const);
    void execEqualEqual_VectorVector(struct FFrame &,void * const);
    void execEval(struct FFrame &,void * const);
    void execExp(struct FFrame &,void * const);
    void execFClamp(struct FFrame &,void * const);
    void execFMax(struct FFrame &,void * const);
    void execFMin(struct FFrame &,void * const);
    void execFRand(struct FFrame &,void * const);
    void execFRandRange(struct FFrame &,void * const);
    void execFalse(struct FFrame &,void * const);
    void execFinalFunction(struct FFrame &,void * const);
    void execFindObject(struct FFrame &,void * const);
    void execFireDelegateInt(struct FFrame &,void * const);
    void execFireDelegateObject(struct FFrame &,void * const);
    void execFireDelegateString(struct FFrame &,void * const);
    void execFloatConst(struct FFrame &,void * const);
    void execFloatToBool(struct FFrame &,void * const);
    void execFloatToByte(struct FFrame &,void * const);
    void execFloatToInt(struct FFrame &,void * const);
    void execFloatToString(struct FFrame &,void * const);
    void execGetAddress(struct FFrame &,void * const);
    void execGetAllPropertyTexts(struct FFrame &,void * const);
    void execGetAxes(struct FFrame &,void * const);
    void execGetBoolProperty(struct FFrame &,void * const);
    void execGetByteProperty(struct FFrame &,void * const);
    void execGetClassPropertyCount(struct FFrame &,void * const);
    void execGetEnum(struct FFrame &,void * const);
    void execGetFName(struct FFrame &,void * const);
    void execGetFloatProperty(struct FFrame &,void * const);
    void execGetIntProperty(struct FFrame &,void * const);
    void execGetNameProperty(struct FFrame &,void * const);
    void execGetObjectProperty(struct FFrame &,void * const);
    void execGetPerObjectNames(struct FFrame &,void * const);
    void execGetPropertyText(struct FFrame &,void * const);
    void execGetPropertyType(struct FFrame &,void * const);
    void execGetReferencers(struct FFrame &,void * const);
    void execGetRotatorProperty(struct FFrame &,void * const);
    void execGetStateName(struct FFrame &,void * const);
    void execGetStringProperty(struct FFrame &,void * const);
    void execGetUnAxes(struct FFrame &,void * const);
    void execGetVectorProperty(struct FFrame &,void * const);
    void execGlobalFunction(struct FFrame &,void * const);
    void execGotoLabel(struct FFrame &,void * const);
    void execGotoState(struct FFrame &,void * const);
    void execGreaterEqual_FloatFloat(struct FFrame &,void * const);
    void execGreaterEqual_IntInt(struct FFrame &,void * const);
    void execGreaterEqual_StringString(struct FFrame &,void * const);
    void execGreaterGreaterGreater_IntInt(struct FFrame &,void * const);
    void execGreaterGreater_IntInt(struct FFrame &,void * const);
    void execGreaterGreater_VectorRotator(struct FFrame &,void * const);
    void execGreater_FloatFloat(struct FFrame &,void * const);
    void execGreater_IntInt(struct FFrame &,void * const);
    void execGreater_StringString(struct FFrame &,void * const);
    void execHighNative0(struct FFrame &,void * const);
    void execHighNative10(struct FFrame &,void * const);
    void execHighNative11(struct FFrame &,void * const);
    void execHighNative12(struct FFrame &,void * const);
    void execHighNative13(struct FFrame &,void * const);
    void execHighNative14(struct FFrame &,void * const);
    void execHighNative15(struct FFrame &,void * const);
    void execHighNative1(struct FFrame &,void * const);
    void execHighNative2(struct FFrame &,void * const);
    void execHighNative3(struct FFrame &,void * const);
    void execHighNative4(struct FFrame &,void * const);
    void execHighNative5(struct FFrame &,void * const);
    void execHighNative6(struct FFrame &,void * const);
    void execHighNative7(struct FFrame &,void * const);
    void execHighNative8(struct FFrame &,void * const);
    void execHighNative9(struct FFrame &,void * const);
    void execInStr(struct FFrame &,void * const);
    void execInstanceVariable(struct FFrame &,void * const);
    void execIntConst(struct FFrame &,void * const);
    void execIntConstByte(struct FFrame &,void * const);
    void execIntOne(struct FFrame &,void * const);
    void execIntToBool(struct FFrame &,void * const);
    void execIntToByte(struct FFrame &,void * const);
    void execIntToFloat(struct FFrame &,void * const);
    void execIntToString(struct FFrame &,void * const);
    void execIntZero(struct FFrame &,void * const);
    void execInterpCurveEval(struct FFrame &,void * const);
    void execInterpCurveGetInputDomain(struct FFrame &,void * const);
    void execInterpCurveGetOutputRange(struct FFrame &,void * const);
    void execInvert(struct FFrame &,void * const);
    void execIsA(struct FFrame &,void * const);
    void execIsClient(struct FFrame &,void * const);
    void execIsEditor(struct FFrame &,void * const);
    void execIsInAngle(struct FFrame &,void * const);
    void execIsInState(struct FFrame &,void * const);
    void execIsOnConsole(struct FFrame &,void * const);
    void execIsServer(struct FFrame &,void * const);
    void execIsSoaking(struct FFrame &,void * const);
    void execIterator(struct FFrame &,void * const);
    void execJump(struct FFrame &,void * const);
    void execJumpIfNot(struct FFrame &,void * const);
    void execLeft(struct FFrame &,void * const);
    void execLen(struct FFrame &,void * const);
    void execLerp(struct FFrame &,void * const);
    void execLerpVector(struct FFrame &,void * const);
    void execLessEqual_FloatFloat(struct FFrame &,void * const);
    void execLessEqual_IntInt(struct FFrame &,void * const);
    void execLessEqual_StringString(struct FFrame &,void * const);
    void execLessLess_IntInt(struct FFrame &,void * const);
    void execLessLess_VectorRotator(struct FFrame &,void * const);
    void execLess_FloatFloat(struct FFrame &,void * const);
    void execLess_IntInt(struct FFrame &,void * const);
    void execLess_StringString(struct FFrame &,void * const);
    void execLet(struct FFrame &,void * const);
    void execLetBool(struct FFrame &,void * const);
    void execLetDelegate(struct FFrame &,void * const);
    void execLocalVariable(struct FFrame &,void * const);
    void execLocalize(struct FFrame &,void * const);
    void execLocs(struct FFrame &,void * const);
    void execLog(struct FFrame &,void * const);
    void execLoge(struct FFrame &,void * const);
    void execMax(struct FFrame &,void * const);
    void execMetaCast(struct FFrame &,void * const);
    void execMid(struct FFrame &,void * const);
    void execMin(struct FFrame &,void * const);
    void execMirrorVectorByNormal(struct FFrame &,void * const);
    void execMod(struct FFrame &,void * const);
    void execMultiplyEqual_ByteByte(struct FFrame &,void * const);
    void execMultiplyEqual_FloatFloat(struct FFrame &,void * const);
    void execMultiplyEqual_IntFloat(struct FFrame &,void * const);
    void execMultiplyEqual_RotatorFloat(struct FFrame &,void * const);
    void execMultiplyEqual_VectorFloat(struct FFrame &,void * const);
    void execMultiplyEqual_VectorVector(struct FFrame &,void * const);
    void execMultiplyMultiply_FloatFloat(struct FFrame &,void * const);
    void execMultiply_FloatFloat(struct FFrame &,void * const);
    void execMultiply_FloatRotator(struct FFrame &,void * const);
    void execMultiply_FloatVector(struct FFrame &,void * const);
    void execMultiply_IntInt(struct FFrame &,void * const);
    void execMultiply_RotatorFloat(struct FFrame &,void * const);
    void execMultiply_VectorFloat(struct FFrame &,void * const);
    void execMultiply_VectorVector(struct FFrame &,void * const);
    void execNameConst(struct FFrame &,void * const);
    void execNameToBool(struct FFrame &,void * const);
    void execNameToString(struct FFrame &,void * const);
    void execNativeParm(struct FFrame &,void * const);
    void execNew(struct FFrame &,void * const);
    void execNoObject(struct FFrame &,void * const);
    void execNormal(struct FFrame &,void * const);
    void execNormalize(struct FFrame &,void * const);
    void execNotEqual_BoolBool(struct FFrame &,void * const);
    void execNotEqual_FloatFloat(struct FFrame &,void * const);
    void execNotEqual_IntInt(struct FFrame &,void * const);
    void execNotEqual_NameName(struct FFrame &,void * const);
    void execNotEqual_ObjectObject(struct FFrame &,void * const);
    void execNotEqual_RotatorRotator(struct FFrame &,void * const);
    void execNotEqual_StringString(struct FFrame &,void * const);
    void execNotEqual_VectorVector(struct FFrame &,void * const);
    void execNot_PreBool(struct FFrame &,void * const);
    void execNothing(struct FFrame &,void * const);
    void execObjectConst(struct FFrame &,void * const);
    void execObjectToBool(struct FFrame &,void * const);
    void execObjectToString(struct FFrame &,void * const);
    void execOrOr_BoolBool(struct FFrame &,void * const);
    void execOr_IntInt(struct FFrame &,void * const);
    void execOrthoRotation(struct FFrame &,void * const);
    void execPercent_FloatFloat(struct FFrame &,void * const);
    void execPlatformIs64Bit(struct FFrame &,void * const);
    void execPlatformIsMacOS(struct FFrame &,void * const);
    void execPlatformIsUnix(struct FFrame &,void * const);
    void execPlatformIsWindows(struct FFrame &,void * const);
    void execPrimitiveCast(struct FFrame &,void * const);
    void execQuatFindBetween(struct FFrame &,void * const);
    void execQuatFromAxisAndAngle(struct FFrame &,void * const);
    void execQuatFromRotator(struct FFrame &,void * const);
    void execQuatInvert(struct FFrame &,void * const);
    void execQuatProduct(struct FFrame &,void * const);
    void execQuatRotateVector(struct FFrame &,void * const);
    void execQuatSlerp(struct FFrame &,void * const);
    void execQuatToRotator(struct FFrame &,void * const);
    void execRGB(struct FFrame &,void * const);
    void execRGBA(struct FFrame &,void * const);
    void execRand(struct FFrame &,void * const);
    void execRandRange(struct FFrame &,void * const);
    void execRepl(struct FFrame &,void * const);
    void execResetConfig(struct FFrame &,void * const);
    void execRight(struct FFrame &,void * const);
    void execRotRand(struct FFrame &,void * const);
    void execRotationConst(struct FFrame &,void * const);
    void execRotatorToBool(struct FFrame &,void * const);
    void execRotatorToString(struct FFrame &,void * const);
    void execRotatorToVector(struct FFrame &,void * const);
    void execRound(struct FFrame &,void * const);
    void execSBLog(struct FFrame &,void * const);
    void execSaveConfig(struct FFrame &,void * const);
    void execSelf(struct FFrame &,void * const);
    void execSetAllPropertyTexts(struct FFrame &,void * const);
    void execSetBoolProperty(struct FFrame &,void * const);
    void execSetByteProperty(struct FFrame &,void * const);
    void execSetFloatProperty(struct FFrame &,void * const);
    void execSetIntProperty(struct FFrame &,void * const);
    void execSetNameProperty(struct FFrame &,void * const);
    void execSetObjectProperty(struct FFrame &,void * const);
    void execSetPropertyText(struct FFrame &,void * const);
    void execSetRotatorProperty(struct FFrame &,void * const);
    void execSetStringProperty(struct FFrame &,void * const);
    void execSetVectorProperty(struct FFrame &,void * const);
    void execSin(struct FFrame &,void * const);
    void execSmerp(struct FFrame &,void * const);
    void execSplit(struct FFrame &,void * const);
    void execSqrt(struct FFrame &,void * const);
    void execSquare(struct FFrame &,void * const);
    void execStaticClearConfig(struct FFrame &,void * const);
    void execStaticSaveConfig(struct FFrame &,void * const);
    void execStop(struct FFrame &,void * const);
    void execStopWatch(struct FFrame &,void * const);
    void execStrCmp(struct FFrame &,void * const);
    void execStringConst(struct FFrame &,void * const);
    void execStringToBool(struct FFrame &,void * const);
    void execStringToByte(struct FFrame &,void * const);
    void execStringToFloat(struct FFrame &,void * const);
    void execStringToInt(struct FFrame &,void * const);
    void execStringToName(struct FFrame &,void * const);
    void execStringToRotator(struct FFrame &,void * const);
    void execStringToVector(struct FFrame &,void * const);
    void execStructCmpEq(struct FFrame &,void * const);
    void execStructCmpNe(struct FFrame &,void * const);
    void execStructMember(struct FFrame &,void * const);
    void execSubtractEqual_ByteByte(struct FFrame &,void * const);
    void execSubtractEqual_FloatFloat(struct FFrame &,void * const);
    void execSubtractEqual_IntInt(struct FFrame &,void * const);
    void execSubtractEqual_RotatorRotator(struct FFrame &,void * const);
    void execSubtractEqual_StringString(struct FFrame &,void * const);
    void execSubtractEqual_VectorVector(struct FFrame &,void * const);
    void execSubtractSubtract_Byte(struct FFrame &,void * const);
    void execSubtractSubtract_Int(struct FFrame &,void * const);
    void execSubtractSubtract_PreByte(struct FFrame &,void * const);
    void execSubtractSubtract_PreInt(struct FFrame &,void * const);
    void execSubtract_FloatFloat(struct FFrame &,void * const);
    void execSubtract_IntInt(struct FFrame &,void * const);
    void execSubtract_PreFloat(struct FFrame &,void * const);
    void execSubtract_PreInt(struct FFrame &,void * const);
    void execSubtract_PreVector(struct FFrame &,void * const);
    void execSubtract_RotatorRotator(struct FFrame &,void * const);
    void execSubtract_VectorVector(struct FFrame &,void * const);
    void execSwitch(struct FFrame &,void * const);
    void execTan(struct FFrame &,void * const);
    void execTrue(struct FFrame &,void * const);
    void execUCASSERT(struct FFrame &,void * const);
    void execUndefined(struct FFrame &,void * const);
    void execUnicodeStringConst(struct FFrame &,void * const);
    void execUpperFirst(struct FFrame &,void * const);
    void execVRand(struct FFrame &,void * const);
    void execVSize(struct FFrame &,void * const);
    void execVectorConst(struct FFrame &,void * const);
    void execVectorToBool(struct FFrame &,void * const);
    void execVectorToRotator(struct FFrame &,void * const);
    void execVectorToString(struct FFrame &,void * const);
    void execVirtualFunction(struct FFrame &,void * const);
    void execWarn(struct FFrame &,void * const);
    void execXorXor_BoolBool(struct FFrame &,void * const);
    void execXor_IntInt(struct FFrame &,void * const);
  protected:
    void AddObject(int);
    static void CDECL CacheDrivers(int);
    static class UObject * GAutoRegister;
    static int GImportCount;
    static int GIsExCleaned;
    static unsigned short * GLanguage;
    static class TArray<int> GObjAvailable;
    static int GObjBeginLoadCount;
    static unsigned short * GObjCachedLanguage;
    static class TArray<class FRegistryObjectInfo> GObjDrivers;
    static class UObject * * GObjHash;
    static int GObjInitialized;
    static class TArray<class UObject *> GObjLoaded;
    static class TMap<class UObject *,class ULinkerLoad *> GObjLoaders;
    static int GObjNoRegister;
    static class TArray<class UObject *> GObjObjects;
    static class TMultiMap<class FName,class FName> * GObjPackageRemap;
    static class TArray<class FPreferencesInfo> GObjPreferences;
    static int GObjRegisterCount;
    static class TArray<class UObject *> GObjRegistrants;
    static class TArray<class UObject *> GObjRoot;
    static class UPackage * GObjTransientPkg;
    static class TArray<class FString> GUniqueLogs;
    static class TArray<class UObject *> GWeakObjects;
    static class ULinkerLoad * CDECL GetLoader(class TMapBase<class UObject *,class ULinkerLoad *>::TIterator);
    void HashObject(void);
    static class FName CDECL MakeUniqueObjectName(class UObject *,class UClass *);
    static void CDECL PurgeGarbage(void);
    static int CDECL ResolveName(class UObject * &,unsigned short const * &,int,int);
    static void CDECL SafeLoadError(unsigned long,unsigned short const *,unsigned short const *,...);
    void SetLinker(class ULinkerLoad *,int);
    void UnhashObject(int);
    bool CDECL isLogAllowed(unsigned short const *,...);
  private:
    static class UClass PrivateStaticClass;
};
*/
AUTOGENERATE_FUNCTION(UObject,0,execAbs)
AUTOGENERATE_FUNCTION(UObject,0,execAcos)
AUTOGENERATE_FUNCTION(UObject,0,execAddAdd_Byte)
AUTOGENERATE_FUNCTION(UObject,0,execAddAdd_Int)
AUTOGENERATE_FUNCTION(UObject,0,execAddAdd_PreByte)
AUTOGENERATE_FUNCTION(UObject,0,execAddAdd_PreInt)
AUTOGENERATE_FUNCTION(UObject,0,execAddEqual_ByteByte)
AUTOGENERATE_FUNCTION(UObject,0,execAddEqual_FloatFloat)
AUTOGENERATE_FUNCTION(UObject,0,execAddEqual_IntInt)
AUTOGENERATE_FUNCTION(UObject,0,execAddEqual_RotatorRotator)
AUTOGENERATE_FUNCTION(UObject,0,execAddEqual_VectorVector)
AUTOGENERATE_FUNCTION(UObject,0,execAdd_FloatFloat)
AUTOGENERATE_FUNCTION(UObject,0,execAdd_IntInt)
AUTOGENERATE_FUNCTION(UObject,0,execAdd_RotatorRotator)
AUTOGENERATE_FUNCTION(UObject,0,execAdd_VectorVector)
AUTOGENERATE_FUNCTION(UObject,0,execAllObjects)
AUTOGENERATE_FUNCTION(UObject,0,execAndAnd_BoolBool)
AUTOGENERATE_FUNCTION(UObject,0,execAnd_IntInt)
AUTOGENERATE_FUNCTION(UObject,0,execArrayElement)
AUTOGENERATE_FUNCTION(UObject,0,execAsc)
AUTOGENERATE_FUNCTION(UObject,0,execAsin)
AUTOGENERATE_FUNCTION(UObject,0,execAssert)
AUTOGENERATE_FUNCTION(UObject,0,execAtEqual_StringString)
AUTOGENERATE_FUNCTION(UObject,0,execAt_StringString)
AUTOGENERATE_FUNCTION(UObject,0,execAtan)
AUTOGENERATE_FUNCTION(UObject,0,execBREAKPOINT)
AUTOGENERATE_FUNCTION(UObject,0,execBREAKPOINT_ALWAYS)
AUTOGENERATE_FUNCTION(UObject,0,execBoolToByte)
AUTOGENERATE_FUNCTION(UObject,0,execBoolToFloat)
AUTOGENERATE_FUNCTION(UObject,0,execBoolToInt)
AUTOGENERATE_FUNCTION(UObject,0,execBoolToString)
AUTOGENERATE_FUNCTION(UObject,0,execBoolVariable)
AUTOGENERATE_FUNCTION(UObject,0,execByteConst)
AUTOGENERATE_FUNCTION(UObject,0,execByteToBool)
AUTOGENERATE_FUNCTION(UObject,0,execByteToFloat)
AUTOGENERATE_FUNCTION(UObject,0,execByteToInt)
AUTOGENERATE_FUNCTION(UObject,0,execByteToString)
AUTOGENERATE_FUNCTION(UObject,0,execCaps)
AUTOGENERATE_FUNCTION(UObject,0,execCase)
AUTOGENERATE_FUNCTION(UObject,0,execCeil)
AUTOGENERATE_FUNCTION(UObject,0,execChr)
AUTOGENERATE_FUNCTION(UObject,0,execClamp)
AUTOGENERATE_FUNCTION(UObject,0,execClassContext)
AUTOGENERATE_FUNCTION(UObject,0,execClassIsChildOf)
AUTOGENERATE_FUNCTION(UObject,0,execClearConfig)
AUTOGENERATE_FUNCTION(UObject,0,execClockwiseFrom_IntInt)
AUTOGENERATE_FUNCTION(UObject,0,execClone)
AUTOGENERATE_FUNCTION(UObject,0,execComplementEqual_FloatFloat)
AUTOGENERATE_FUNCTION(UObject,0,execComplementEqual_StringString)
AUTOGENERATE_FUNCTION(UObject,0,execComplement_PreInt)
AUTOGENERATE_FUNCTION(UObject,0,execConcatEqual_StringString)
AUTOGENERATE_FUNCTION(UObject,0,execConcat_StringString)
AUTOGENERATE_FUNCTION(UObject,0,execContext)
AUTOGENERATE_FUNCTION(UObject,0,execCos)
AUTOGENERATE_FUNCTION(UObject,0,execCross_VectorVector)
AUTOGENERATE_FUNCTION(UObject,0,execDebugInfo)
AUTOGENERATE_FUNCTION(UObject,0,execDefaultVariable)
AUTOGENERATE_FUNCTION(UObject,0,execDelegateFunction)
AUTOGENERATE_FUNCTION(UObject,0,execDelegateProperty)
AUTOGENERATE_FUNCTION(UObject,0,execDisable)
AUTOGENERATE_FUNCTION(UObject,0,execDivide)
AUTOGENERATE_FUNCTION(UObject,0,execDivideEqual_ByteByte)
AUTOGENERATE_FUNCTION(UObject,0,execDivideEqual_FloatFloat)
AUTOGENERATE_FUNCTION(UObject,0,execDivideEqual_IntFloat)
AUTOGENERATE_FUNCTION(UObject,0,execDivideEqual_RotatorFloat)
AUTOGENERATE_FUNCTION(UObject,0,execDivideEqual_VectorFloat)
AUTOGENERATE_FUNCTION(UObject,0,execDivide_FloatFloat)
AUTOGENERATE_FUNCTION(UObject,0,execDivide_IntInt)
AUTOGENERATE_FUNCTION(UObject,0,execDivide_RotatorFloat)
AUTOGENERATE_FUNCTION(UObject,0,execDivide_VectorFloat)
AUTOGENERATE_FUNCTION(UObject,0,execDot_VectorVector)
AUTOGENERATE_FUNCTION(UObject,0,execDynArrayElement)
AUTOGENERATE_FUNCTION(UObject,0,execDynArrayInsert)
AUTOGENERATE_FUNCTION(UObject,0,execDynArrayLength)
AUTOGENERATE_FUNCTION(UObject,0,execDynArrayRemove)
AUTOGENERATE_FUNCTION(UObject,0,execDynamicCast)
AUTOGENERATE_FUNCTION(UObject,0,execDynamicLoadObject)
AUTOGENERATE_FUNCTION(UObject,0,execEatString)
AUTOGENERATE_FUNCTION(UObject,0,execEnable)
AUTOGENERATE_FUNCTION(UObject,0,execEndFunctionParms)
AUTOGENERATE_FUNCTION(UObject,0,execEndOfScript)
AUTOGENERATE_FUNCTION(UObject,0,execEqualEqual_BoolBool)
AUTOGENERATE_FUNCTION(UObject,0,execEqualEqual_FloatFloat)
AUTOGENERATE_FUNCTION(UObject,0,execEqualEqual_IntInt)
AUTOGENERATE_FUNCTION(UObject,0,execEqualEqual_NameName)
AUTOGENERATE_FUNCTION(UObject,0,execEqualEqual_ObjectObject)
AUTOGENERATE_FUNCTION(UObject,0,execEqualEqual_RotatorRotator)
AUTOGENERATE_FUNCTION(UObject,0,execEqualEqual_StringString)
AUTOGENERATE_FUNCTION(UObject,0,execEqualEqual_VectorVector)
AUTOGENERATE_FUNCTION(UObject,0,execEval)
AUTOGENERATE_FUNCTION(UObject,0,execExp)
AUTOGENERATE_FUNCTION(UObject,0,execFClamp)
AUTOGENERATE_FUNCTION(UObject,0,execFMax)
AUTOGENERATE_FUNCTION(UObject,0,execFMin)
AUTOGENERATE_FUNCTION(UObject,0,execFRand)
AUTOGENERATE_FUNCTION(UObject,0,execFRandRange)
AUTOGENERATE_FUNCTION(UObject,0,execFalse)
AUTOGENERATE_FUNCTION(UObject,0,execFinalFunction)
AUTOGENERATE_FUNCTION(UObject,0,execFindObject)
AUTOGENERATE_FUNCTION(UObject,0,execFireDelegateInt)
AUTOGENERATE_FUNCTION(UObject,0,execFireDelegateObject)
AUTOGENERATE_FUNCTION(UObject,0,execFireDelegateString)
AUTOGENERATE_FUNCTION(UObject,0,execFloatConst)
AUTOGENERATE_FUNCTION(UObject,0,execFloatToBool)
AUTOGENERATE_FUNCTION(UObject,0,execFloatToByte)
AUTOGENERATE_FUNCTION(UObject,0,execFloatToInt)
AUTOGENERATE_FUNCTION(UObject,0,execFloatToString)
AUTOGENERATE_FUNCTION(UObject,0,execGetAddress)
AUTOGENERATE_FUNCTION(UObject,0,execGetAllPropertyTexts)
AUTOGENERATE_FUNCTION(UObject,0,execGetAxes)
AUTOGENERATE_FUNCTION(UObject,0,execGetBoolProperty)
AUTOGENERATE_FUNCTION(UObject,0,execGetByteProperty)
AUTOGENERATE_FUNCTION(UObject,0,execGetClassPropertyCount)
AUTOGENERATE_FUNCTION(UObject,0,execGetEnum)
AUTOGENERATE_FUNCTION(UObject,0,execGetFName)
AUTOGENERATE_FUNCTION(UObject,0,execGetFloatProperty)
AUTOGENERATE_FUNCTION(UObject,0,execGetIntProperty)
AUTOGENERATE_FUNCTION(UObject,0,execGetNameProperty)
AUTOGENERATE_FUNCTION(UObject,0,execGetObjectProperty)
AUTOGENERATE_FUNCTION(UObject,0,execGetPerObjectNames)
AUTOGENERATE_FUNCTION(UObject,0,execGetPropertyText)
AUTOGENERATE_FUNCTION(UObject,0,execGetPropertyType)
AUTOGENERATE_FUNCTION(UObject,0,execGetReferencers)
AUTOGENERATE_FUNCTION(UObject,0,execGetRotatorProperty)
AUTOGENERATE_FUNCTION(UObject,0,execGetStateName)
AUTOGENERATE_FUNCTION(UObject,0,execGetStringProperty)
AUTOGENERATE_FUNCTION(UObject,0,execGetUnAxes)
AUTOGENERATE_FUNCTION(UObject,0,execGetVectorProperty)
AUTOGENERATE_FUNCTION(UObject,0,execGlobalFunction)
AUTOGENERATE_FUNCTION(UObject,0,execGotoLabel)
AUTOGENERATE_FUNCTION(UObject,0,execGotoState)
AUTOGENERATE_FUNCTION(UObject,0,execGreaterEqual_FloatFloat)
AUTOGENERATE_FUNCTION(UObject,0,execGreaterEqual_IntInt)
AUTOGENERATE_FUNCTION(UObject,0,execGreaterEqual_StringString)
AUTOGENERATE_FUNCTION(UObject,0,execGreaterGreaterGreater_IntInt)
AUTOGENERATE_FUNCTION(UObject,0,execGreaterGreater_IntInt)
AUTOGENERATE_FUNCTION(UObject,0,execGreaterGreater_VectorRotator)
AUTOGENERATE_FUNCTION(UObject,0,execGreater_FloatFloat)
AUTOGENERATE_FUNCTION(UObject,0,execGreater_IntInt)
AUTOGENERATE_FUNCTION(UObject,0,execGreater_StringString)
AUTOGENERATE_FUNCTION(UObject,0,execHighNative0)
AUTOGENERATE_FUNCTION(UObject,0,execHighNative1)
AUTOGENERATE_FUNCTION(UObject,0,execHighNative10)
AUTOGENERATE_FUNCTION(UObject,0,execHighNative11)
AUTOGENERATE_FUNCTION(UObject,0,execHighNative12)
AUTOGENERATE_FUNCTION(UObject,0,execHighNative13)
AUTOGENERATE_FUNCTION(UObject,0,execHighNative14)
AUTOGENERATE_FUNCTION(UObject,0,execHighNative15)
AUTOGENERATE_FUNCTION(UObject,0,execHighNative2)
AUTOGENERATE_FUNCTION(UObject,0,execHighNative3)
AUTOGENERATE_FUNCTION(UObject,0,execHighNative4)
AUTOGENERATE_FUNCTION(UObject,0,execHighNative5)
AUTOGENERATE_FUNCTION(UObject,0,execHighNative6)
AUTOGENERATE_FUNCTION(UObject,0,execHighNative7)
AUTOGENERATE_FUNCTION(UObject,0,execHighNative8)
AUTOGENERATE_FUNCTION(UObject,0,execHighNative9)
AUTOGENERATE_FUNCTION(UObject,0,execInStr)
AUTOGENERATE_FUNCTION(UObject,0,execInstanceVariable)
AUTOGENERATE_FUNCTION(UObject,0,execIntConst)
AUTOGENERATE_FUNCTION(UObject,0,execIntConstByte)
AUTOGENERATE_FUNCTION(UObject,0,execIntOne)
AUTOGENERATE_FUNCTION(UObject,0,execIntToBool)
AUTOGENERATE_FUNCTION(UObject,0,execIntToByte)
AUTOGENERATE_FUNCTION(UObject,0,execIntToFloat)
AUTOGENERATE_FUNCTION(UObject,0,execIntToString)
AUTOGENERATE_FUNCTION(UObject,0,execIntZero)
AUTOGENERATE_FUNCTION(UObject,0,execInterpCurveEval)
AUTOGENERATE_FUNCTION(UObject,0,execInterpCurveGetInputDomain)
AUTOGENERATE_FUNCTION(UObject,0,execInterpCurveGetOutputRange)
AUTOGENERATE_FUNCTION(UObject,0,execInvert)
AUTOGENERATE_FUNCTION(UObject,0,execIsA)
AUTOGENERATE_FUNCTION(UObject,0,execIsClient)
AUTOGENERATE_FUNCTION(UObject,0,execIsEditor)
AUTOGENERATE_FUNCTION(UObject,0,execIsInAngle)
AUTOGENERATE_FUNCTION(UObject,0,execIsInState)
AUTOGENERATE_FUNCTION(UObject,0,execIsOnConsole)
AUTOGENERATE_FUNCTION(UObject,0,execIsServer)
AUTOGENERATE_FUNCTION(UObject,0,execIsSoaking)
AUTOGENERATE_FUNCTION(UObject,0,execIterator)
AUTOGENERATE_FUNCTION(UObject,0,execJump)
AUTOGENERATE_FUNCTION(UObject,0,execJumpIfNot)
AUTOGENERATE_FUNCTION(UObject,0,execLeft)
AUTOGENERATE_FUNCTION(UObject,0,execLen)
AUTOGENERATE_FUNCTION(UObject,0,execLerp)
AUTOGENERATE_FUNCTION(UObject,0,execLerpVector)
AUTOGENERATE_FUNCTION(UObject,0,execLessEqual_FloatFloat)
AUTOGENERATE_FUNCTION(UObject,0,execLessEqual_IntInt)
AUTOGENERATE_FUNCTION(UObject,0,execLessEqual_StringString)
AUTOGENERATE_FUNCTION(UObject,0,execLessLess_IntInt)
AUTOGENERATE_FUNCTION(UObject,0,execLessLess_VectorRotator)
AUTOGENERATE_FUNCTION(UObject,0,execLess_FloatFloat)
AUTOGENERATE_FUNCTION(UObject,0,execLess_IntInt)
AUTOGENERATE_FUNCTION(UObject,0,execLess_StringString)
AUTOGENERATE_FUNCTION(UObject,0,execLet)
AUTOGENERATE_FUNCTION(UObject,0,execLetBool)
AUTOGENERATE_FUNCTION(UObject,0,execLetDelegate)
AUTOGENERATE_FUNCTION(UObject,0,execLocalVariable)
AUTOGENERATE_FUNCTION(UObject,0,execLocalize)
AUTOGENERATE_FUNCTION(UObject,0,execLocs)
AUTOGENERATE_FUNCTION(UObject,0,execLog)
AUTOGENERATE_FUNCTION(UObject,0,execLoge)
AUTOGENERATE_FUNCTION(UObject,0,execMax)
AUTOGENERATE_FUNCTION(UObject,0,execMetaCast)
AUTOGENERATE_FUNCTION(UObject,0,execMid)
AUTOGENERATE_FUNCTION(UObject,0,execMin)
AUTOGENERATE_FUNCTION(UObject,0,execMirrorVectorByNormal)
AUTOGENERATE_FUNCTION(UObject,0,execMod)
AUTOGENERATE_FUNCTION(UObject,0,execMultiplyEqual_ByteByte)
AUTOGENERATE_FUNCTION(UObject,0,execMultiplyEqual_FloatFloat)
AUTOGENERATE_FUNCTION(UObject,0,execMultiplyEqual_IntFloat)
AUTOGENERATE_FUNCTION(UObject,0,execMultiplyEqual_RotatorFloat)
AUTOGENERATE_FUNCTION(UObject,0,execMultiplyEqual_VectorFloat)
AUTOGENERATE_FUNCTION(UObject,0,execMultiplyEqual_VectorVector)
AUTOGENERATE_FUNCTION(UObject,0,execMultiplyMultiply_FloatFloat)
AUTOGENERATE_FUNCTION(UObject,0,execMultiply_FloatFloat)
AUTOGENERATE_FUNCTION(UObject,0,execMultiply_FloatRotator)
AUTOGENERATE_FUNCTION(UObject,0,execMultiply_FloatVector)
AUTOGENERATE_FUNCTION(UObject,0,execMultiply_IntInt)
AUTOGENERATE_FUNCTION(UObject,0,execMultiply_RotatorFloat)
AUTOGENERATE_FUNCTION(UObject,0,execMultiply_VectorFloat)
AUTOGENERATE_FUNCTION(UObject,0,execMultiply_VectorVector)
AUTOGENERATE_FUNCTION(UObject,0,execNameConst)
AUTOGENERATE_FUNCTION(UObject,0,execNameToBool)
AUTOGENERATE_FUNCTION(UObject,0,execNameToString)
AUTOGENERATE_FUNCTION(UObject,0,execNativeParm)
AUTOGENERATE_FUNCTION(UObject,0,execNew)
AUTOGENERATE_FUNCTION(UObject,0,execNoObject)
AUTOGENERATE_FUNCTION(UObject,0,execNormal)
AUTOGENERATE_FUNCTION(UObject,0,execNormalize)
AUTOGENERATE_FUNCTION(UObject,0,execNotEqual_BoolBool)
AUTOGENERATE_FUNCTION(UObject,0,execNotEqual_FloatFloat)
AUTOGENERATE_FUNCTION(UObject,0,execNotEqual_IntInt)
AUTOGENERATE_FUNCTION(UObject,0,execNotEqual_NameName)
AUTOGENERATE_FUNCTION(UObject,0,execNotEqual_ObjectObject)
AUTOGENERATE_FUNCTION(UObject,0,execNotEqual_RotatorRotator)
AUTOGENERATE_FUNCTION(UObject,0,execNotEqual_StringString)
AUTOGENERATE_FUNCTION(UObject,0,execNotEqual_VectorVector)
AUTOGENERATE_FUNCTION(UObject,0,execNot_PreBool)
AUTOGENERATE_FUNCTION(UObject,0,execNothing)
AUTOGENERATE_FUNCTION(UObject,0,execObjectConst)
AUTOGENERATE_FUNCTION(UObject,0,execObjectToBool)
AUTOGENERATE_FUNCTION(UObject,0,execObjectToString)
AUTOGENERATE_FUNCTION(UObject,0,execOrOr_BoolBool)
AUTOGENERATE_FUNCTION(UObject,0,execOr_IntInt)
AUTOGENERATE_FUNCTION(UObject,0,execOrthoRotation)
AUTOGENERATE_FUNCTION(UObject,0,execPercent_FloatFloat)
AUTOGENERATE_FUNCTION(UObject,0,execPlatformIs64Bit)
AUTOGENERATE_FUNCTION(UObject,0,execPlatformIsMacOS)
AUTOGENERATE_FUNCTION(UObject,0,execPlatformIsUnix)
AUTOGENERATE_FUNCTION(UObject,0,execPlatformIsWindows)
AUTOGENERATE_FUNCTION(UObject,0,execPrimitiveCast)
AUTOGENERATE_FUNCTION(UObject,0,execQuatFindBetween)
AUTOGENERATE_FUNCTION(UObject,0,execQuatFromAxisAndAngle)
AUTOGENERATE_FUNCTION(UObject,0,execQuatFromRotator)
AUTOGENERATE_FUNCTION(UObject,0,execQuatInvert)
AUTOGENERATE_FUNCTION(UObject,0,execQuatProduct)
AUTOGENERATE_FUNCTION(UObject,0,execQuatRotateVector)
AUTOGENERATE_FUNCTION(UObject,0,execQuatSlerp)
AUTOGENERATE_FUNCTION(UObject,0,execQuatToRotator)
AUTOGENERATE_FUNCTION(UObject,0,execRGB)
AUTOGENERATE_FUNCTION(UObject,0,execRGBA)
AUTOGENERATE_FUNCTION(UObject,0,execRand)
AUTOGENERATE_FUNCTION(UObject,0,execRandRange)
AUTOGENERATE_FUNCTION(UObject,0,execRepl)
AUTOGENERATE_FUNCTION(UObject,0,execResetConfig)
AUTOGENERATE_FUNCTION(UObject,0,execRight)
AUTOGENERATE_FUNCTION(UObject,0,execRotRand)
AUTOGENERATE_FUNCTION(UObject,0,execRotationConst)
AUTOGENERATE_FUNCTION(UObject,0,execRotatorToBool)
AUTOGENERATE_FUNCTION(UObject,0,execRotatorToString)
AUTOGENERATE_FUNCTION(UObject,0,execRotatorToVector)
AUTOGENERATE_FUNCTION(UObject,0,execRound)
AUTOGENERATE_FUNCTION(UObject,0,execSBLog)
AUTOGENERATE_FUNCTION(UObject,0,execSaveConfig)
AUTOGENERATE_FUNCTION(UObject,0,execSelf)
AUTOGENERATE_FUNCTION(UObject,0,execSetAllPropertyTexts)
AUTOGENERATE_FUNCTION(UObject,0,execSetBoolProperty)
AUTOGENERATE_FUNCTION(UObject,0,execSetByteProperty)
AUTOGENERATE_FUNCTION(UObject,0,execSetFloatProperty)
AUTOGENERATE_FUNCTION(UObject,0,execSetIntProperty)
AUTOGENERATE_FUNCTION(UObject,0,execSetNameProperty)
AUTOGENERATE_FUNCTION(UObject,0,execSetObjectProperty)
AUTOGENERATE_FUNCTION(UObject,0,execSetPropertyText)
AUTOGENERATE_FUNCTION(UObject,0,execSetRotatorProperty)
AUTOGENERATE_FUNCTION(UObject,0,execSetStringProperty)
AUTOGENERATE_FUNCTION(UObject,0,execSetVectorProperty)
AUTOGENERATE_FUNCTION(UObject,0,execSin)
AUTOGENERATE_FUNCTION(UObject,0,execSmerp)
AUTOGENERATE_FUNCTION(UObject,0,execSplit)
AUTOGENERATE_FUNCTION(UObject,0,execSqrt)
AUTOGENERATE_FUNCTION(UObject,0,execSquare)
AUTOGENERATE_FUNCTION(UObject,0,execStaticClearConfig)
AUTOGENERATE_FUNCTION(UObject,0,execStaticSaveConfig)
AUTOGENERATE_FUNCTION(UObject,0,execStop)
AUTOGENERATE_FUNCTION(UObject,0,execStopWatch)
AUTOGENERATE_FUNCTION(UObject,0,execStrCmp)
AUTOGENERATE_FUNCTION(UObject,0,execStringConst)
AUTOGENERATE_FUNCTION(UObject,0,execStringToBool)
AUTOGENERATE_FUNCTION(UObject,0,execStringToByte)
AUTOGENERATE_FUNCTION(UObject,0,execStringToFloat)
AUTOGENERATE_FUNCTION(UObject,0,execStringToInt)
AUTOGENERATE_FUNCTION(UObject,0,execStringToName)
AUTOGENERATE_FUNCTION(UObject,0,execStringToRotator)
AUTOGENERATE_FUNCTION(UObject,0,execStringToVector)
AUTOGENERATE_FUNCTION(UObject,0,execStructCmpEq)
AUTOGENERATE_FUNCTION(UObject,0,execStructCmpNe)
AUTOGENERATE_FUNCTION(UObject,0,execStructMember)
AUTOGENERATE_FUNCTION(UObject,0,execSubtractEqual_ByteByte)
AUTOGENERATE_FUNCTION(UObject,0,execSubtractEqual_FloatFloat)
AUTOGENERATE_FUNCTION(UObject,0,execSubtractEqual_IntInt)
AUTOGENERATE_FUNCTION(UObject,0,execSubtractEqual_RotatorRotator)
AUTOGENERATE_FUNCTION(UObject,0,execSubtractEqual_StringString)
AUTOGENERATE_FUNCTION(UObject,0,execSubtractEqual_VectorVector)
AUTOGENERATE_FUNCTION(UObject,0,execSubtractSubtract_Byte)
AUTOGENERATE_FUNCTION(UObject,0,execSubtractSubtract_Int)
AUTOGENERATE_FUNCTION(UObject,0,execSubtractSubtract_PreByte)
AUTOGENERATE_FUNCTION(UObject,0,execSubtractSubtract_PreInt)
AUTOGENERATE_FUNCTION(UObject,0,execSubtract_FloatFloat)
AUTOGENERATE_FUNCTION(UObject,0,execSubtract_IntInt)
AUTOGENERATE_FUNCTION(UObject,0,execSubtract_PreFloat)
AUTOGENERATE_FUNCTION(UObject,0,execSubtract_PreInt)
AUTOGENERATE_FUNCTION(UObject,0,execSubtract_PreVector)
AUTOGENERATE_FUNCTION(UObject,0,execSubtract_RotatorRotator)
AUTOGENERATE_FUNCTION(UObject,0,execSubtract_VectorVector)
AUTOGENERATE_FUNCTION(UObject,0,execSwitch)
AUTOGENERATE_FUNCTION(UObject,0,execTan)
AUTOGENERATE_FUNCTION(UObject,0,execTrue)
AUTOGENERATE_FUNCTION(UObject,0,execUCASSERT)
AUTOGENERATE_FUNCTION(UObject,0,execUnicodeStringConst)
AUTOGENERATE_FUNCTION(UObject,0,execUpperFirst)
AUTOGENERATE_FUNCTION(UObject,0,execVRand)
AUTOGENERATE_FUNCTION(UObject,0,execVSize)
AUTOGENERATE_FUNCTION(UObject,0,execVectorConst)
AUTOGENERATE_FUNCTION(UObject,0,execVectorToBool)
AUTOGENERATE_FUNCTION(UObject,0,execVectorToRotator)
AUTOGENERATE_FUNCTION(UObject,0,execVectorToString)
AUTOGENERATE_FUNCTION(UObject,0,execVirtualFunction)
AUTOGENERATE_FUNCTION(UObject,0,execWarn)
AUTOGENERATE_FUNCTION(UObject,0,execXorXor_BoolBool)
AUTOGENERATE_FUNCTION(UObject,0,execXor_IntInt)


//------------------------------------------------------------------------------
//  Commandlet
//------------------------------------------------------------------------------

//  Commandlet.Main 20C00 0 ( FUNC_Native FUNC_Event FUNC_Public )
struct UCommandlet_eventMain_Parms {
  class FString aParms;  // 0 400080 CPF_Parm CPF_NeedCtorLink
  INT ReturnValue;  // 8 580 CPF_Parm CPF_OutParm CPF_ReturnParm
};


// UCommandlet 13B ( CLASS_Abstract CLASS_Compiled CLASS_Transient CLASS_Parsed CLASS_Localized CLASS_NoExport )
/*
class DLL_IMPORT UCommandlet : public UObject {
  public:
    class FString HelpCmd;  // 28 408000 CPF_Localized CPF_NeedCtorLink
    class FString HelpOneLiner;  // 30 408000 CPF_Localized CPF_NeedCtorLink
    class FString HelpUsage;  // 38 408000 CPF_Localized CPF_NeedCtorLink
    class FString HelpWebLink;  // 40 408000 CPF_Localized CPF_NeedCtorLink
    class FString HelpParm[16];  // 48 408000 CPF_Localized CPF_NeedCtorLink
    class FString HelpDesc[16];  // C8 408000 CPF_Localized CPF_NeedCtorLink
    BITFIELD LogToStdout : 1;  // 148 0
    BITFIELD _IsServer : 1;  // 148 2000000 CPF_EditorData
    BITFIELD _IsClient : 1;  // 148 2000000 CPF_EditorData
    BITFIELD _IsEditor : 1;  // 148 2000000 CPF_EditorData
    BITFIELD LazyLoad : 1;  // 148 0
    BITFIELD ShowErrorCount : 1;  // 148 0
    BITFIELD ShowBanner : 1;  // 148 0
    virtual ~UCommandlet(void);
    virtual unsigned int GetCPPSize(void);
    virtual int Main(unsigned short const *);
    UCommandlet(class UCommandlet const &);
    UCommandlet(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UCommandlet & operator=(class UCommandlet const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    int eventMain(class FString const &);
    void execMain(struct FFrame &,void * const);
  private:
    static class UClass PrivateStaticClass;
};
*/
AUTOGENERATE_FUNCTION(UCommandlet,0,execMain)


//------------------------------------------------------------------------------
//  Subsystem
//------------------------------------------------------------------------------

// USubsystem 112 ( CLASS_Compiled CLASS_Parsed CLASS_NoExport )
/*
class DLL_IMPORT USubsystem : public UObject/*,FExec*/  {
  public:
    DWORD ExecVtbl;  // 28 3002 CPF_Const CPF_Native CPF_Transient
    virtual ~USubsystem(void);
    virtual void Tick(float);
    USubsystem(class USubsystem const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class USubsystem & operator=(class USubsystem const &);
    static class UClass * CDECL StaticClass(void);
  protected:
    USubsystem(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  System
//------------------------------------------------------------------------------

// USystem 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
/*
class DLL_IMPORT USystem : public USubsystem/*,FExec*/  {
  public:
    char Unknown0[4];
    INT PurgeCacheDays;  // 30 4000 CPF_Config
    class FString SavePath;  // 34 404000 CPF_Config CPF_NeedCtorLink
    class FString CachePath;  // 3C 404000 CPF_Config CPF_NeedCtorLink
    class FString CacheExt;  // 44 404000 CPF_Config CPF_NeedCtorLink
    TArray<class FString> CacheRecordPath;  // 4C 404000 CPF_Config CPF_NeedCtorLink
    TArray<class FString> MusicPath;  // 58 404000 CPF_Config CPF_NeedCtorLink
    class FString SpeechPath;  // 64 404000 CPF_Config CPF_NeedCtorLink
    TArray<class FString> Paths;  // 6C 404000 CPF_Config CPF_NeedCtorLink
    TArray<FName> Suppress;  // 78 404000 CPF_Config CPF_NeedCtorLink
    //virtual int Exec(unsigned short const *,class FOutputDevice &);
    virtual ~USystem(void);
    virtual unsigned int GetCPPSize(void);
    USystem(class USystem const &);
    USystem(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class USystem & operator=(class USystem const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void StaticConstructor(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  Field
//------------------------------------------------------------------------------

// UField 13 ( CLASS_Abstract CLASS_Compiled CLASS_Parsed )
/*
class DLL_IMPORT UField : public UObject {
  public:
    char Unknown0[12];
    virtual ~UField(void);
    virtual void PostLoad(void);
    virtual void Serialize(class FArchive &);
    virtual void Register(void);
    virtual void AddCppProperty(class UProperty *);
    virtual int MergeBools(void);
    virtual void Bind(void);
    virtual class UClass * GetOwnerClass(void);
    virtual int GetPropertiesSize(void)const ;
    UField(class UField const &);
    UField(class UField *);
    UField(enum ENativeConstructor,class UClass *,unsigned short const *,unsigned short const *,unsigned long,class UField *);
    UField(enum EStaticConstructor,unsigned short const *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UField & operator=(class UField const &);
    static class UClass * CDECL StaticClass(void);
  protected:
    UField(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  Property
//------------------------------------------------------------------------------

// UProperty 8013 ( CLASS_Abstract CLASS_Compiled CLASS_Parsed CLASS_Unk_08000 )
/*
class DLL_IMPORT UProperty : public UField {
  public:
    char Unknown0[56];
    virtual ~UProperty(void);
    virtual void Serialize(class FArchive &);
    virtual void Relink(unsigned char *,class std::map<class UObject *,class UObject *,struct std::less<class UObject *>,class std::allocator<struct std::pair<class UObject * const,class UObject *> > > &)const ;
    virtual void CleanupDestroyed(unsigned char *,class UClass *,int)const ;
    virtual int HasProperty(unsigned char *,class UClass *)const ;
    virtual void Link(class FArchive &,class UProperty *);
    virtual void ExportCpp(class FOutputDevice &,int,int,int,int)const ;
    virtual int ExportText(int,unsigned short *,unsigned char *,unsigned char *,int)const ;
    virtual void CopySingleValue(void *,void *,class UObject *,int)const ;
    virtual void CopyCompleteValue(void *,void *,class UObject *,int)const ;
    virtual void DestroyValue(void *)const ;
    virtual int Port(void)const ;
    virtual unsigned char GetID(void)const ;
    virtual int IsLocalized(void)const ;
    UProperty(class UProperty const &);
    UProperty(enum ECppProperty,int,unsigned short const *,unsigned long);
    UProperty(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UProperty & operator=(class UProperty const &);
    class FString GetCaseCorrectedName(void)const ;
    class UField * GetOuterUField(void)const ;
    int GetSize(void)const ;
    int Matches(void const *,void const *,int)const ;
    int ShouldSerializeValue(class FArchive &)const ;
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  StructProperty
//------------------------------------------------------------------------------

// UStructProperty 8012 ( CLASS_Compiled CLASS_Parsed CLASS_Unk_08000 )
/*
class DLL_IMPORT UStructProperty : public UProperty {
  public:
    char Unknown0[4];
    virtual ~UStructProperty(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned int GetCPPSize(void);
    virtual void Relink(unsigned char *,class std::map<class UObject *,class UObject *,struct std::less<class UObject *>,class std::allocator<struct std::pair<class UObject * const,class UObject *> > > &)const ;
    virtual void CleanupDestroyed(unsigned char *,class UClass *,int)const ;
    virtual int HasProperty(unsigned char *,class UClass *)const ;
    virtual void Link(class FArchive &,class UProperty *);
    virtual int Identical(void const *,void const *)const ;
    virtual void ExportCppItem(class FOutputDevice &,int)const ;
    virtual void SerializeItem(class FArchive &,void *,int)const ;
    virtual void ExportTextItem(unsigned short *,unsigned char *,unsigned char *,int)const ;
    virtual unsigned short const * ImportText(unsigned short const *,unsigned char *,int)const ;
    virtual void CopySingleValue(void *,void *,class UObject *,int)const ;
    virtual void ClearValue(unsigned char *)const ;
    virtual void DestroyValue(void *)const ;
    virtual int HasValue(unsigned char const *)const ;
    virtual int IsLocalized(void)const ;
    UStructProperty(class UStructProperty const &);
    UStructProperty(enum ECppProperty,int,unsigned short const *,unsigned long,class UStruct *);
    UStructProperty(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UStructProperty & operator=(class UStructProperty const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  MapProperty
//------------------------------------------------------------------------------

// UMapProperty 8012 ( CLASS_Compiled CLASS_Parsed CLASS_Unk_08000 )
/*
class DLL_IMPORT UMapProperty : public UProperty {
  public:
    char Unknown0[8];
    virtual ~UMapProperty(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned int GetCPPSize(void);
    virtual void Link(class FArchive &,class UProperty *);
    virtual int Identical(void const *,void const *)const ;
    virtual void ExportCppItem(class FOutputDevice &,int)const ;
    virtual void SerializeItem(class FArchive &,void *,int)const ;
    virtual void ExportTextItem(unsigned short *,unsigned char *,unsigned char *,int)const ;
    virtual unsigned short const * ImportText(unsigned short const *,unsigned char *,int)const ;
    virtual void CopySingleValue(void *,void *,class UObject *,int)const ;
    virtual void ClearValue(unsigned char *)const ;
    virtual void DestroyValue(void *)const ;
    virtual int HasValue(unsigned char const *)const ;
    UMapProperty(class UMapProperty const &);
    UMapProperty(enum ECppProperty,int,unsigned short const *,unsigned long);
    UMapProperty(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UMapProperty & operator=(class UMapProperty const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  ArrayProperty
//------------------------------------------------------------------------------

// UArrayProperty 8012 ( CLASS_Compiled CLASS_Parsed CLASS_Unk_08000 )
/*
class DLL_IMPORT UArrayProperty : public UProperty {
  public:
    char Unknown0[4];
    virtual ~UArrayProperty(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned int GetCPPSize(void);
    virtual void AddCppProperty(class UProperty *);
    virtual void Relink(unsigned char *,class std::map<class UObject *,class UObject *,struct std::less<class UObject *>,class std::allocator<struct std::pair<class UObject * const,class UObject *> > > &)const ;
    virtual void CleanupDestroyed(unsigned char *,class UClass *,int)const ;
    virtual int HasProperty(unsigned char *,class UClass *)const ;
    virtual void Link(class FArchive &,class UProperty *);
    virtual int Identical(void const *,void const *)const ;
    virtual void ExportCppItem(class FOutputDevice &,int)const ;
    virtual void SerializeItem(class FArchive &,void *,int)const ;
    virtual void ExportTextItem(unsigned short *,unsigned char *,unsigned char *,int)const ;
    virtual unsigned short const * ImportText(unsigned short const *,unsigned char *,int)const ;
    virtual void CopyCompleteValue(void *,void *,class UObject *,int)const ;
    virtual void ClearValue(unsigned char *)const ;
    virtual void DestroyValue(void *)const ;
    virtual int HasValue(unsigned char const *)const ;
    virtual int IsLocalized(void)const ;
    UArrayProperty(class UArrayProperty const &);
    UArrayProperty(enum ECppProperty,int,unsigned short const *,unsigned long);
    UArrayProperty(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UArrayProperty & operator=(class UArrayProperty const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  FixedArrayProperty
//------------------------------------------------------------------------------

// UFixedArrayProperty 8012 ( CLASS_Compiled CLASS_Parsed CLASS_Unk_08000 )
/*
class DLL_IMPORT UFixedArrayProperty : public UProperty {
  public:
    char Unknown0[8];
    virtual ~UFixedArrayProperty(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned int GetCPPSize(void);
    virtual void Relink(unsigned char *,class std::map<class UObject *,class UObject *,struct std::less<class UObject *>,class std::allocator<struct std::pair<class UObject * const,class UObject *> > > &)const ;
    virtual void CleanupDestroyed(unsigned char *,class UClass *,int)const ;
    virtual int HasProperty(unsigned char *,class UClass *)const ;
    virtual void Link(class FArchive &,class UProperty *);
    virtual int Identical(void const *,void const *)const ;
    virtual void ExportCppItem(class FOutputDevice &,int)const ;
    virtual void SerializeItem(class FArchive &,void *,int)const ;
    virtual void ExportTextItem(unsigned short *,unsigned char *,unsigned char *,int)const ;
    virtual unsigned short const * ImportText(unsigned short const *,unsigned char *,int)const ;
    virtual void CopySingleValue(void *,void *,class UObject *,int)const ;
    virtual void ClearValue(unsigned char *)const ;
    virtual void DestroyValue(void *)const ;
    virtual int HasValue(unsigned char const *)const ;
    UFixedArrayProperty(class UFixedArrayProperty const &);
    UFixedArrayProperty(enum ECppProperty,int,unsigned short const *,unsigned long);
    UFixedArrayProperty(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UFixedArrayProperty & operator=(class UFixedArrayProperty const &);
    void AddCppProperty(class UProperty *,int);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  StrProperty
//------------------------------------------------------------------------------

// UStrProperty 8012 ( CLASS_Compiled CLASS_Parsed CLASS_Unk_08000 )
/*
class DLL_IMPORT UStrProperty : public UProperty {
  public:
    virtual ~UStrProperty(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned int GetCPPSize(void);
    virtual void Link(class FArchive &,class UProperty *);
    virtual int Identical(void const *,void const *)const ;
    virtual void ExportCppItem(class FOutputDevice &,int)const ;
    virtual void SerializeItem(class FArchive &,void *,int)const ;
    virtual void ExportTextItem(unsigned short *,unsigned char *,unsigned char *,int)const ;
    virtual unsigned short const * ImportText(unsigned short const *,unsigned char *,int)const ;
    virtual void CopySingleValue(void *,void *,class UObject *,int)const ;
    virtual void ClearValue(unsigned char *)const ;
    virtual void DestroyValue(void *)const ;
    virtual int HasValue(unsigned char const *)const ;
    UStrProperty(class UStrProperty const &);
    UStrProperty(enum ECppProperty,int,unsigned short const *,unsigned long);
    UStrProperty(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UStrProperty & operator=(class UStrProperty const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  NameProperty
//------------------------------------------------------------------------------

// UNameProperty 8012 ( CLASS_Compiled CLASS_Parsed CLASS_Unk_08000 )
/*
class DLL_IMPORT UNameProperty : public UProperty {
  public:
    virtual ~UNameProperty(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Link(class FArchive &,class UProperty *);
    virtual int Identical(void const *,void const *)const ;
    virtual void ExportCppItem(class FOutputDevice &,int)const ;
    virtual void SerializeItem(class FArchive &,void *,int)const ;
    virtual void ExportTextItem(unsigned short *,unsigned char *,unsigned char *,int)const ;
    virtual unsigned short const * ImportText(unsigned short const *,unsigned char *,int)const ;
    virtual void CopySingleValue(void *,void *,class UObject *,int)const ;
    virtual void CopyCompleteValue(void *,void *,class UObject *,int)const ;
    virtual void ClearValue(unsigned char *)const ;
    virtual int HasValue(unsigned char const *)const ;
    UNameProperty(class UNameProperty const &);
    UNameProperty(enum ECppProperty,int,unsigned short const *,unsigned long);
    UNameProperty(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UNameProperty & operator=(class UNameProperty const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  ObjectProperty
//------------------------------------------------------------------------------

// UObjectProperty 18012 ( CLASS_Compiled CLASS_Parsed CLASS_Unk_08000 CLASS_Unk_10000 )
/*
class DLL_IMPORT UObjectProperty : public UProperty {
  public:
    char Unknown0[4];
    virtual ~UObjectProperty(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned int GetCPPSize(void);
    virtual void Relink(unsigned char *,class std::map<class UObject *,class UObject *,struct std::less<class UObject *>,class std::allocator<struct std::pair<class UObject * const,class UObject *> > > &)const ;
    virtual void CleanupDestroyed(unsigned char *,class UClass *,int)const ;
    virtual int HasProperty(unsigned char *,class UClass *)const ;
    virtual void Link(class FArchive &,class UProperty *);
    virtual int Identical(void const *,void const *)const ;
    virtual void ExportCppItem(class FOutputDevice &,int)const ;
    virtual void SerializeItem(class FArchive &,void *,int)const ;
    virtual void ExportTextItem(unsigned short *,unsigned char *,unsigned char *,int)const ;
    virtual unsigned short const * ImportText(unsigned short const *,unsigned char *,int)const ;
    virtual void CopySingleValue(void *,void *,class UObject *,int)const ;
    virtual void CopyCompleteValue(void *,void *,class UObject *,int)const ;
    virtual void ClearValue(unsigned char *)const ;
    virtual int HasValue(unsigned char const *)const ;
    UObjectProperty(class UObjectProperty const &);
    UObjectProperty(enum ECppProperty,int,unsigned short const *,unsigned long,class UClass *);
    UObjectProperty(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UObjectProperty & operator=(class UObjectProperty const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  ClassProperty
//------------------------------------------------------------------------------

// UClassProperty 18012 ( CLASS_Compiled CLASS_Parsed CLASS_Unk_08000 CLASS_Unk_10000 )
/*
class DLL_IMPORT UClassProperty : public UObjectProperty {
  public:
    char Unknown0[4];
    virtual ~UClassProperty(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned int GetCPPSize(void);
    virtual unsigned short const * ImportText(unsigned short const *,unsigned char *,int)const ;
    virtual void ClearValue(unsigned char *)const ;
    virtual int HasValue(unsigned char const *)const ;
    virtual unsigned char GetID(void)const ;
    UClassProperty(class UClassProperty const &);
    UClassProperty(enum ECppProperty,int,unsigned short const *,unsigned long,class UClass *);
    UClassProperty(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UClassProperty & operator=(class UClassProperty const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  FloatProperty
//------------------------------------------------------------------------------

// UFloatProperty 8012 ( CLASS_Compiled CLASS_Parsed CLASS_Unk_08000 )
/*
class DLL_IMPORT UFloatProperty : public UProperty {
  public:
    virtual ~UFloatProperty(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Link(class FArchive &,class UProperty *);
    virtual int Identical(void const *,void const *)const ;
    virtual void ExportCppItem(class FOutputDevice &,int)const ;
    virtual void SerializeItem(class FArchive &,void *,int)const ;
    virtual void ExportTextItem(unsigned short *,unsigned char *,unsigned char *,int)const ;
    virtual unsigned short const * ImportText(unsigned short const *,unsigned char *,int)const ;
    virtual void CopySingleValue(void *,void *,class UObject *,int)const ;
    virtual void CopyCompleteValue(void *,void *,class UObject *,int)const ;
    virtual void ClearValue(unsigned char *)const ;
    virtual int HasValue(unsigned char const *)const ;
    UFloatProperty(class UFloatProperty const &);
    UFloatProperty(enum ECppProperty,int,unsigned short const *,unsigned long);
    UFloatProperty(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UFloatProperty & operator=(class UFloatProperty const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  BoolProperty
//------------------------------------------------------------------------------

// UBoolProperty 28012 ( CLASS_Compiled CLASS_Parsed CLASS_Unk_08000 )
/*
class DLL_IMPORT UBoolProperty : public UProperty {
  public:
    char Unknown0[4];
    virtual ~UBoolProperty(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned int GetCPPSize(void);
    virtual void Link(class FArchive &,class UProperty *);
    virtual int Identical(void const *,void const *)const ;
    virtual void ExportCppItem(class FOutputDevice &,int)const ;
    virtual void SerializeItem(class FArchive &,void *,int)const ;
    virtual void ExportTextItem(unsigned short *,unsigned char *,unsigned char *,int)const ;
    virtual unsigned short const * ImportText(unsigned short const *,unsigned char *,int)const ;
    virtual void CopySingleValue(void *,void *,class UObject *,int)const ;
    virtual void ClearValue(unsigned char *)const ;
    virtual int HasValue(unsigned char const *)const ;
    UBoolProperty(class UBoolProperty const &);
    UBoolProperty(enum ECppProperty,int,unsigned short const *,unsigned long);
    UBoolProperty(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UBoolProperty & operator=(class UBoolProperty const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  DelegateProperty
//------------------------------------------------------------------------------

// UDelegateProperty 8012 ( CLASS_Compiled CLASS_Parsed CLASS_Unk_08000 )
class DLL_IMPORT UDelegateProperty : public UProperty {
  public:
    char Unknown0[4];
    virtual ~UDelegateProperty(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned int GetCPPSize(void);
    virtual void CleanupDestroyed(unsigned char *,class UClass *,int)const ;
    virtual void Link(class FArchive &,class UProperty *);
    virtual int Identical(void const *,void const *)const ;
    virtual void ExportCppItem(class FOutputDevice &,int)const ;
    virtual void SerializeItem(class FArchive &,void *,int)const ;
    virtual void ExportTextItem(unsigned short *,unsigned char *,unsigned char *,int)const ;
    virtual unsigned short const * ImportText(unsigned short const *,unsigned char *,int)const ;
    virtual void CopySingleValue(void *,void *,class UObject *,int)const ;
    virtual void CopyCompleteValue(void *,void *,class UObject *,int)const ;
    virtual void ClearValue(unsigned char *)const ;
    virtual int HasValue(unsigned char const *)const ;
    UDelegateProperty(class UDelegateProperty const &);
    UDelegateProperty(enum ECppProperty,int,unsigned short const *,unsigned long);
    UDelegateProperty(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UDelegateProperty & operator=(class UDelegateProperty const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  PointerProperty
//------------------------------------------------------------------------------

// UPointerProperty 8012 ( CLASS_Compiled CLASS_Parsed CLASS_Unk_08000 )
class DLL_IMPORT UPointerProperty : public UProperty {
  public:
    virtual ~UPointerProperty(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Link(class FArchive &,class UProperty *);
    virtual int Identical(void const *,void const *)const ;
    virtual void ExportCppItem(class FOutputDevice &,int)const ;
    virtual void SerializeItem(class FArchive &,void *,int)const ;
    virtual void ExportTextItem(unsigned short *,unsigned char *,unsigned char *,int)const ;
    virtual unsigned short const * ImportText(unsigned short const *,unsigned char *,int)const ;
    virtual void CopySingleValue(void *,void *,class UObject *,int)const ;
    virtual void CopyCompleteValue(void *,void *,class UObject *,int)const ;
    virtual void ClearValue(unsigned char *)const ;
    virtual int HasValue(unsigned char const *)const ;
    UPointerProperty(class UPointerProperty const &);
    UPointerProperty(enum ECppProperty,int,unsigned short const *,unsigned long);
    UPointerProperty(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UPointerProperty & operator=(class UPointerProperty const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  IntProperty
//------------------------------------------------------------------------------

// UIntProperty 8012 ( CLASS_Compiled CLASS_Parsed CLASS_Unk_08000 )
/*
class DLL_IMPORT UIntProperty : public UProperty {
  public:
    virtual ~UIntProperty(void);
    virtual unsigned int GetCPPSize(void);
    virtual void Link(class FArchive &,class UProperty *);
    virtual int Identical(void const *,void const *)const ;
    virtual void ExportCppItem(class FOutputDevice &,int)const ;
    virtual void SerializeItem(class FArchive &,void *,int)const ;
    virtual void ExportTextItem(unsigned short *,unsigned char *,unsigned char *,int)const ;
    virtual unsigned short const * ImportText(unsigned short const *,unsigned char *,int)const ;
    virtual void CopySingleValue(void *,void *,class UObject *,int)const ;
    virtual void CopyCompleteValue(void *,void *,class UObject *,int)const ;
    virtual void ClearValue(unsigned char *)const ;
    virtual int HasValue(unsigned char const *)const ;
    UIntProperty(class UIntProperty const &);
    UIntProperty(enum ECppProperty,int,unsigned short const *,unsigned long);
    UIntProperty(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UIntProperty & operator=(class UIntProperty const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  ByteProperty
//------------------------------------------------------------------------------

// UByteProperty 8012 ( CLASS_Compiled CLASS_Parsed CLASS_Unk_08000 )
/*
class DLL_IMPORT UByteProperty : public UProperty {
  public:
    char Unknown0[4];
    virtual ~UByteProperty(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned int GetCPPSize(void);
    virtual void Link(class FArchive &,class UProperty *);
    virtual int Identical(void const *,void const *)const ;
    virtual void ExportCppItem(class FOutputDevice &,int)const ;
    virtual void SerializeItem(class FArchive &,void *,int)const ;
    virtual void ExportTextItem(unsigned short *,unsigned char *,unsigned char *,int)const ;
    virtual unsigned short const * ImportText(unsigned short const *,unsigned char *,int)const ;
    virtual void CopySingleValue(void *,void *,class UObject *,int)const ;
    virtual void CopyCompleteValue(void *,void *,class UObject *,int)const ;
    virtual void ClearValue(unsigned char *)const ;
    virtual int HasValue(unsigned char const *)const ;
    UByteProperty(class UByteProperty const &);
    UByteProperty(enum ECppProperty,int,unsigned short const *,unsigned long,class UEnum *);
    UByteProperty(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UByteProperty & operator=(class UByteProperty const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  Language
//------------------------------------------------------------------------------

// ULanguage 1B ( CLASS_Abstract CLASS_Compiled CLASS_Transient CLASS_Parsed )
/*
class DLL_IMPORT ULanguage : public UObject {
  public:
    char Unknown0[4];
    virtual ~ULanguage(void);
    ULanguage(class ULanguage const &);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ULanguage & operator=(class ULanguage const &);
    static class UClass * CDECL StaticClass(void);
  protected:
    ULanguage(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  Factory
//------------------------------------------------------------------------------

// UFactory 13 ( CLASS_Abstract CLASS_Compiled CLASS_Parsed )
/*
class DLL_IMPORT UFactory : public UObject {
  public:
    char Unknown0[8];
    class FString Description;  // 30 400000 CPF_NeedCtorLink
    class FString InContextCommand;  // 38 400000 CPF_NeedCtorLink
    class FString OutOfContextCommand;  // 40 400000 CPF_NeedCtorLink
    TArray<class FString> Formats;  // 48 400000 CPF_NeedCtorLink
    char Unknown1[8];
    virtual ~UFactory(void);
    virtual void Serialize(class FArchive &);
    virtual class UObject * FactoryCreateText(class ULevel *,class UClass *,class UObject *,class FName,unsigned long,class UObject *,unsigned short const *,unsigned short const * &,unsigned short const *,class FFeedbackContext *);
    virtual class UObject * FactoryCreateBinary(class UClass *,class UObject *,class FName,unsigned long,class UObject *,unsigned short const *,unsigned char const * &,unsigned char const *,class FFeedbackContext *);
    virtual class UObject * FactoryCreateNew(class UClass *,class UObject *,class FName,unsigned long,class UObject *,class FFeedbackContext *);
    UFactory(class UFactory const &);
    UFactory(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UFactory & operator=(class UFactory const &);
    static class UClass * CDECL StaticClass(void);
    void StaticConstructor(void);
    static class UObject * CDECL StaticImportObject(class ULevel *,class UClass *,class UObject *,class FName,unsigned long,unsigned short const *,class UObject *,class UFactory *,unsigned short const *,class FFeedbackContext *);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  TextBufferFactory
//------------------------------------------------------------------------------

// UTextBufferFactory 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UTextBufferFactory : public UFactory {
  public:
    virtual ~UTextBufferFactory(void);
    virtual unsigned int GetCPPSize(void);
    virtual class UObject * FactoryCreateText(class ULevel *,class UClass *,class UObject *,class FName,unsigned long,class UObject *,unsigned short const *,unsigned short const * &,unsigned short const *,class FFeedbackContext *);
    UTextBufferFactory(class UTextBufferFactory const &);
    UTextBufferFactory(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UTextBufferFactory & operator=(class UTextBufferFactory const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void StaticConstructor(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Package
//------------------------------------------------------------------------------

// UPackage 12 ( CLASS_Compiled CLASS_Parsed )
/*
class DLL_IMPORT UPackage : public UObject {
  public:
    char Unknown0[28];
    virtual ~UPackage(void);
    virtual void Destroy(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned int GetCPPSize(void);
    UPackage(class UPackage const &);
    UPackage(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UPackage & operator=(class UPackage const &);
    void * GetDllExport(unsigned short const *,int);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  Linker
//------------------------------------------------------------------------------

// ULinker 1A ( CLASS_Compiled CLASS_Transient CLASS_Parsed )
/*
class DLL_IMPORT ULinker : public UObject {
  public:
    char Unknown0[120];
    virtual ~ULinker(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned int GetCPPSize(void);
    virtual int LinksToCode(void);
    ULinker(class ULinker const &);
    ULinker(class UObject *,unsigned short const *);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ULinker & operator=(class ULinker const &);
    class FString GetExportFullName(int,unsigned short const *);
    class FString GetExportPathName(int);
    class FString GetImportFullName(int);
    static void CDECL InternalConstructor(void *);
    class FString QuickMD5(void);
    static class UClass * CDECL StaticClass(void);
  protected:
    ULinker(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  LinkerSave
//------------------------------------------------------------------------------

// ULinkerSave 1A ( CLASS_Compiled CLASS_Transient CLASS_Parsed )
/*
class DLL_IMPORT ULinkerSave : public ULinker {
  public:
    char Unknown0[96];
};
*/


//------------------------------------------------------------------------------
//  LinkerLoad
//------------------------------------------------------------------------------

// ULinkerLoad 1A ( CLASS_Compiled CLASS_Transient CLASS_Parsed )
/*
class DLL_IMPORT ULinkerLoad : public ULinker/*,FArchive*/  {
  public:
    char Unknown0[1120];
  private:
    //virtual void Serialize(void *,int);
  public:
    //virtual void Preload(class UObject *);
  private:
    //virtual class FArchive & operator<<(class UObject * &);
    //virtual class FArchive & operator<<(class FName &);
    //virtual int Tell(void);
    //virtual int TotalSize(void);
    //virtual void Seek(int);
    //virtual void AttachLazyLoader(class FLazyLoader *);
    //virtual void DetachLazyLoader(class FLazyLoader *);
  public:
    //virtual unsigned short const * GetFilename(void)const ;
    virtual ~ULinkerLoad(void);
  private:
    virtual void Destroy(void);
    virtual void Serialize(class FArchive &);
  public:
    virtual unsigned int GetCPPSize(void);
    virtual int LinksToCode(void);
    ULinkerLoad(class ULinkerLoad const &);
    ULinkerLoad(class UObject *,unsigned short const *,unsigned long,class FArchive *);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class ULinkerLoad & operator=(class ULinkerLoad const &);
    class UObject * Create(class UClass *,class FName,unsigned long,int,class FString);
    int FindExportIndex(class FName,class FName,class FName,int,class FString);
    class FName GetExportClassName(int);
    class FName GetExportClassPackage(int);
    static void CDECL InternalConstructor(void *);
    void LoadAllObjects(void);
    static class UClass * CDECL StaticClass(void);
    void Verify(void);
    void VerifyImport(int);
  protected:
    ULinkerLoad(void);
  private:
    class UObject * CreateExport(int);
    class UObject * CreateImport(int);
    void DetachAllLazyLoaders(int);
    void DetachExport(int);
    class UObject * IndexToObject(int);
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  Enum
//------------------------------------------------------------------------------

// UEnum 12 ( CLASS_Compiled CLASS_Parsed )
/*
class DLL_IMPORT UEnum : public UField {
  public:
    char Unknown0[16];
    virtual ~UEnum(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned int GetCPPSize(void);
    UEnum(class UEnum const &);
    UEnum(class UEnum *);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UEnum & operator=(class UEnum const &);
    class UStruct * GetOuterUStruct(void)const ;
    class UEnum * GetSuperEnum(void)const ;
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UEnum(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  TextBuffer
//------------------------------------------------------------------------------

// UTextBuffer 12 ( CLASS_Compiled CLASS_Parsed )
/*
class DLL_IMPORT UTextBuffer : public UObject/*,FOutputDevice*/  {
  public:
    char Unknown0[20];
    //virtual void Serialize(unsigned short const *,enum EName);
    virtual ~UTextBuffer(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned int GetCPPSize(void);
    UTextBuffer(class UTextBuffer const &);
    UTextBuffer(unsigned short const *);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UTextBuffer & operator=(class UTextBuffer const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  Const
//------------------------------------------------------------------------------

// UConst 12 ( CLASS_Compiled CLASS_Parsed )
/*
class DLL_IMPORT UConst : public UField {
  public:
    char Unknown0[8];
    virtual ~UConst(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned int GetCPPSize(void);
    UConst(class UConst const &);
    UConst(class UConst *,unsigned short const *);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UConst & operator=(class UConst const &);
    class UStruct * GetOuterUStruct(void)const ;
    class UConst * GetSuperConst(void)const ;
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UConst(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  Struct
//------------------------------------------------------------------------------

// UStruct 12 ( CLASS_Compiled CLASS_Parsed )
/*
class DLL_IMPORT UStruct : public UField {
  public:
    char Unknown0[76];
    virtual ~UStruct(void);
    virtual void PostLoad(void);
    virtual void Destroy(void);
    virtual void Serialize(class FArchive &);
    virtual void Register(void);
    virtual unsigned int GetCPPSize(void);
    virtual void AddCppProperty(class UProperty *);
    virtual int GetPropertiesSize(void)const ;
    virtual void Relink(unsigned char *,class std::map<class UObject *,class UObject *,struct std::less<class UObject *>,class std::allocator<struct std::pair<class UObject * const,class UObject *> > > &);
    virtual class UStruct * GetInheritanceSuper(void);
    virtual void Link(class FArchive &,int);
    virtual void SerializeBin(class FArchive &,unsigned char *,int);
    virtual void SerializeTaggedProperties(class FArchive &,unsigned char *,class UClass *);
    virtual void CleanupDestroyed(unsigned char *,class UClass *,int);
    virtual void DestroySubObjects(unsigned char *,class UClass *);
    virtual int HasProperty(unsigned char *,class UClass *);
    virtual enum EExprToken SerializeExpr(int &,class FArchive &);
    virtual unsigned short * GetNameCPP(void)const ;
    UStruct(class UStruct const &);
    UStruct(class UStruct *);
    UStruct(enum ENativeConstructor,int,unsigned short const *,unsigned short const *,unsigned long,class UStruct *);
    UStruct(enum EStaticConstructor,int,unsigned short const *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UStruct & operator=(class UStruct const &);
    class FString FunctionMD5(void);
    unsigned long GetScriptTextCRC(void)const ;
    class UStruct * GetSuperStruct(void)const ;
    static void CDECL InternalConstructor(void *);
    int IsChildOf(class UStruct const *)const ;
    void SetPropertiesSize(int);
    static class UClass * CDECL StaticClass(void);
    int StructCompare(void const *,void const *);
  protected:
    UStruct(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  Function
//------------------------------------------------------------------------------

// UFunction 80012 ( CLASS_Compiled CLASS_Parsed )
/*
class DLL_IMPORT UFunction : public UStruct {
  public:
    char Unknown0[40];
    virtual ~UFunction(void);
    virtual void PostLoad(void);
    virtual void Destroy(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned int GetCPPSize(void);
    virtual int MergeBools(void);
    virtual void Bind(void);
    virtual class UStruct * GetInheritanceSuper(void);
    virtual void Link(class FArchive &,int);
    UFunction(class UFunction const &);
    UFunction(class UFunction *);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UFunction & operator=(class UFunction const &);
    class UState * GetOuterUState(void)const ;
    class UProperty * GetReturnProperty(void);
    class UFunction * GetSuperFunction(void)const ;
    static void CDECL InternalConstructor(void *);
    int IsReplicated(void)const ;
    static class UClass * CDECL StaticClass(void);
  protected:
    UFunction(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  State
//------------------------------------------------------------------------------

// UState 40012 ( CLASS_Compiled CLASS_Parsed )
/*
class DLL_IMPORT UState : public UStruct {
  public:
    char Unknown0[1048];
    virtual ~UState(void);
    virtual void Destroy(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned int GetCPPSize(void);
    virtual int MergeBools(void);
    virtual class UStruct * GetInheritanceSuper(void);
    virtual void Link(class FArchive &,int);
    UState(class UState const &);
    UState(class UState *);
    UState(enum ENativeConstructor,int,unsigned short const *,unsigned short const *,unsigned long,class UState *);
    UState(enum EStaticConstructor,int,unsigned short const *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UState & operator=(class UState const &);
    class UState * GetSuperState(void)const ;
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
  protected:
    UState(void);
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  Class
//------------------------------------------------------------------------------

// UClass 40012 ( CLASS_Compiled CLASS_Parsed )
/*
class DLL_IMPORT UClass : public UState {
  public:
    char Unknown0[160];
    virtual ~UClass(void);
    virtual void PostLoad(void);
    virtual void Destroy(void);
    virtual void Serialize(class FArchive &);
    virtual void Register(void);
    virtual unsigned int GetCPPSize(void);
    virtual int MergeBools(void);
    virtual void Bind(void);
    virtual class UStruct * GetInheritanceSuper(void);
    virtual void Link(class FArchive &,int);
    virtual unsigned short * GetNameCPP(void)const ;
    UClass(class UClass const &);
    UClass(class UClass *);
    UClass(enum ENativeConstructor,unsigned long,unsigned long,class UClass *,class UClass *,unsigned short const *,unsigned short const *,unsigned short const *,unsigned long,void (__cdecl*)(void *),void (__thiscall UObject::*)(void));
    UClass(enum EStaticConstructor,unsigned long,unsigned long,unsigned short const *,unsigned short const *,unsigned short const *,unsigned long,void (__cdecl*)(void *),void (__thiscall UObject::*)(void));
    UClass(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UClass & operator=(class UClass const &);
    void AddDependency(class UClass *,int);
    class TFieldFlagIterator<class UProperty,32768> ConstructPropertyList(void);
    class AActor * GetDefaultActor(void);
    class UObject * GetDefaultObject(void);
    class UObject const * GetDefaultObject(void)const ;
    class UPackage * GetOuterUPackage(void)const ;
    class UClass * GetSuperClass(void)const ;
    static void CDECL InternalConstructor(void *);
    int IsReplicated(void)const ;
    static class UClass * CDECL StaticClass(void);
  private:
    int IsA(class UClass *)const ;
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  Exporter
//------------------------------------------------------------------------------

// UExporter 13 ( CLASS_Abstract CLASS_Compiled CLASS_Parsed )
/*
class DLL_IMPORT UExporter : public UObject {
  public:
    char Unknown0[4];
    TArray<class FString> Formats;  // 2C 400000 CPF_NeedCtorLink
    char Unknown1[8];
    virtual ~UExporter(void);
    virtual void Serialize(class FArchive &);
    virtual int ExportText(class UObject *,unsigned short const *,class FOutputDevice &,class FFeedbackContext *);
    virtual int ExportBinary(class UObject *,unsigned short const *,class FArchive &,class FFeedbackContext *);
    UExporter(class UExporter const &);
    UExporter(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UExporter & operator=(class UExporter const &);
    static void CDECL ExportToArchive(class UObject *,class UExporter *,class FArchive &,unsigned short const *);
    static int CDECL ExportToFile(class UObject *,class UExporter *,unsigned short const *,int,int,unsigned short *);
    static void CDECL ExportToOutputDevice(class UObject *,class UExporter *,class FOutputDevice &,unsigned short const *,int,unsigned short *);
    static class UExporter * CDECL FindExporter(class UObject *,unsigned short const *);
    static class UClass * CDECL StaticClass(void);
    void StaticConstructor(void);
    static unsigned short * mPkgPath;
  private:
    static class UClass PrivateStaticClass;
};
*/


//------------------------------------------------------------------------------
//  ObjectExporterT3D
//------------------------------------------------------------------------------

// UObjectExporterT3D 12 ( CLASS_Compiled CLASS_Parsed )
class DLL_IMPORT UObjectExporterT3D : public UExporter {
  public:
    virtual ~UObjectExporterT3D(void);
    virtual unsigned int GetCPPSize(void);
    virtual int ExportText(class UObject *,unsigned short const *,class FOutputDevice &,class FFeedbackContext *);
    UObjectExporterT3D(class UObjectExporterT3D const &);
    UObjectExporterT3D(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UObjectExporterT3D & operator=(class UObjectExporterT3D const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void StaticConstructor(void);
  private:
    static class UClass PrivateStaticClass;
};


//------------------------------------------------------------------------------
//  Time
//------------------------------------------------------------------------------

// UTime 1A ( CLASS_Compiled CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UTime : public UObject {
};


//------------------------------------------------------------------------------
//  Locale
//------------------------------------------------------------------------------

// ULocale 1A ( CLASS_Compiled CLASS_Transient CLASS_Parsed )
class DLL_IMPORT ULocale : public UObject {
};



//------------------------------------------------------------------------------
//  FArchive
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FArchive {
  public:
    virtual ~FArchive(void);
    virtual void Serialize(void *,int);
    virtual void SerializeBits(void *,int);
    virtual void SerializeInt(unsigned long &,unsigned long);
    virtual void Preload(class UObject *);
    virtual void CountBytes(unsigned long,unsigned long);
    virtual class FArchive & operator<<(struct FLocalizedString &);
    virtual class FArchive & operator<<(class UObject * &);
    virtual class FArchive & operator<<(class FName &);
    virtual int MapName(class FName *);
    virtual int MapObject(class UObject *);
    virtual int Tell(void);
    virtual int TotalSize(void);
    virtual int AtEnd(void);
    virtual int AtStopper(void);
    virtual void SetStopper(int);
    virtual void Seek(int);
    virtual void AttachLazyLoader(class FLazyLoader *);
    virtual void DetachLazyLoader(class FLazyLoader *);
    virtual void Precache(int);
    virtual void Flush(void);
    virtual int Close(void);
    virtual int GetError(void);
    virtual unsigned short const * GetFilename(void)const ;
    FArchive(class FArchive const &);
    FArchive(void);
    class FArchive & operator=(class FArchive const &);
    friend class FArchive & CDECL operator<<(class FArchive &,signed char &);
    friend class FArchive & CDECL operator<<(class FArchive &,char &);
    friend class FArchive & CDECL operator<<(class FArchive &,unsigned char &);
    friend class FArchive & CDECL operator<<(class FArchive &,short &);
    friend class FArchive & CDECL operator<<(class FArchive &,unsigned short &);
    friend class FArchive & CDECL operator<<(class FArchive &,int &);
    friend class FArchive & CDECL operator<<(class FArchive &,unsigned long &);
    friend class FArchive & CDECL operator<<(class FArchive &,float &);
    friend class FArchive & CDECL operator<<(class FArchive &,double &);
    friend class FArchive & CDECL operator<<(class FArchive &,struct FLabelEntry &);
    friend class FArchive & CDECL operator<<(class FArchive &,struct FNameEntry &);
    friend class FArchive & CDECL operator<<(class FArchive &,struct FObjectExport &);
    friend class FArchive & CDECL operator<<(class FArchive &,struct FObjectImport &);
    friend class FArchive & CDECL operator<<(class FArchive &,struct FPackageFileSummary &);
    friend class FArchive & CDECL operator<<(class FArchive &,class FCompactIndex &);
    friend class FArchive & CDECL operator<<(class FArchive &,class FDependency &);
    friend class FArchive & CDECL operator<<(class FArchive &,class FString &);
    friend class FArchive & CDECL operator<<(class FArchive &,__int64 &);
    friend class FArchive & CDECL operator<<(class FArchive &,unsigned __int64 &);
    class FArchive & operator<<(unsigned int &);
    class FArchive & operator<<(class d_std::aabbox2 &);
    class FArchive & operator<<(class d_std::vector2 &);
    class FArchive & ByteOrderSerialize(void *,int);
    int ContainsCode(void);
    int ForClient(void);
    int ForEdit(void);
    int ForServer(void);
    int IsCriticalError(void);
    int IsError(void);
    int IsLoading(void);
    int IsNet(void);
    int IsPersistent(void);
    int IsSaving(void);
    int IsTrans(void);
    int LicenseeVer(void);
    int NetPackData(void);
    int NetVer(void);
    void ThisContainsCode(void);
    int Ver(void);
};
*/

//------------------------------------------------------------------------------
//  FArchiveBuffer
//------------------------------------------------------------------------------

class DLL_IMPORT FArchiveBuffer {
  public:
    virtual ~FArchiveBuffer(void);
    virtual void Serialize(void *,int);
    virtual class FArchive & operator<<(class FName &);
    virtual int Tell(void);
    virtual void Seek(int);
    FArchiveBuffer(class FArchiveBuffer const &);
    FArchiveBuffer(class d_std::buffer const &);
    FArchiveBuffer(void);
    class FArchiveBuffer & operator=(class FArchiveBuffer const &);
    class d_std::buffer & GetBuffer(void);
    class d_std::buffer const & GetBuffer(void)const ;
    void SetReadMode(void);
    void SetWriteMode(void);
};

//------------------------------------------------------------------------------
//  FArchiveCompressed
//------------------------------------------------------------------------------

class DLL_IMPORT FArchiveCompressed {
  public:
    virtual ~FArchiveCompressed(void);
    virtual int Tell(void);
    virtual void Seek(int);
    FArchiveCompressed(class FArchiveCompressed const &);
    FArchiveCompressed(int,unsigned int,class FOutputDevice *,unsigned short const *);
    FArchiveCompressed(void *,unsigned int,class FOutputDevice *,unsigned short const *);
    class FArchiveCompressed & operator=(class FArchiveCompressed const &);
    unsigned int GetMode(void)const ;
  protected:
    int InvalidMode(unsigned int);
  private:
    void InitFromFileDescriptor(int);
};

//------------------------------------------------------------------------------
//  FArchiveCountMem
//------------------------------------------------------------------------------

class DLL_IMPORT FArchiveCountMem {
  public:
    virtual ~FArchiveCountMem(void);
    virtual void CountBytes(unsigned long,unsigned long);
    FArchiveCountMem(class FArchiveCountMem const &);
    FArchiveCountMem(class UObject *);
    class FArchiveCountMem & operator=(class FArchiveCountMem const &);
    unsigned long GetMax(void);
    unsigned long GetNum(void);
};

//------------------------------------------------------------------------------
//  FArchiveDeflate
//------------------------------------------------------------------------------

class DLL_IMPORT FArchiveDeflate {
  public:
    virtual ~FArchiveDeflate(void);
    virtual void Serialize(void *,int);
    virtual int Tell(void);
    virtual void Seek(int);
    FArchiveDeflate(class FArchiveDeflate const &);
    FArchiveDeflate(int,class FOutputDevice *,unsigned short const *);
    FArchiveDeflate(void *,class FOutputDevice *,unsigned short const *);
    class FArchiveDeflate & operator=(class FArchiveDeflate const &);
    static void CDECL DumpDeflateStats(void);
    static void CDECL Tick(float);
  protected:
    int GetOrigFileSize(void);
    void InitCache(void);
    int PrecacheBlock(struct CAPrecacheBlock *,unsigned int,unsigned int,int);
    void Serialize_Large(void *,int);
    void Serialize_Small(void *,int);
    static int objects_created;
    static int objects_overlapping_calls;
    static int objects_present;
    static int objects_with_one_block;
  private:
    static float CurTime;
    static class FArchiveDeflate * FirstArchive;
};

//------------------------------------------------------------------------------
//  FArchiveDummySave
//------------------------------------------------------------------------------

class DLL_IMPORT FArchiveDummySave {
  public:
    virtual ~FArchiveDummySave(void);
    FArchiveDummySave(class FArchiveDummySave const &);
    FArchiveDummySave(void);
    class FArchiveDummySave & operator=(class FArchiveDummySave const &);
};

//------------------------------------------------------------------------------
//  FArchiveFindInvalidObjects
//------------------------------------------------------------------------------

class DLL_IMPORT FArchiveFindInvalidObjects {
  public:
    virtual ~FArchiveFindInvalidObjects(void);
    virtual class FArchive & operator<<(class UObject * &);
    FArchiveFindInvalidObjects(class FArchiveFindInvalidObjects const &);
    FArchiveFindInvalidObjects(void);
    class FArchiveFindInvalidObjects & operator=(class FArchiveFindInvalidObjects const &);
    int GetCheckedObjectCount(void)const ;
};

//------------------------------------------------------------------------------
//  FArchiveInflate
//------------------------------------------------------------------------------

class DLL_IMPORT FArchiveInflate {
  public:
    virtual ~FArchiveInflate(void);
    virtual void Serialize(void *,int);
    FArchiveInflate(class FArchiveInflate const &);
    FArchiveInflate(int,unsigned int,class FOutputDevice *,unsigned short const *);
    FArchiveInflate(void *,unsigned int,class FOutputDevice *,unsigned short const *);
    class FArchiveInflate & operator=(class FArchiveInflate const &);
};

//------------------------------------------------------------------------------
//  FArchiveMemCpy
//------------------------------------------------------------------------------

class DLL_IMPORT FArchiveMemCpy {
  public:
    virtual ~FArchiveMemCpy(void);
    virtual void Serialize(void *,int);
    virtual class FArchive & operator<<(class FName &);
    virtual int Tell(void);
    virtual int TotalSize(void);
    virtual void Seek(int);
    virtual int Hint(int);
    FArchiveMemCpy(class FArchiveMemCpy const &);
    FArchiveMemCpy(void);
    class FArchiveMemCpy & operator=(class FArchiveMemCpy const &);
    char const * GetData(void);
    void SetReadMode(void);
    void SetWriteMode(void);
  protected:
    void Allocate(int);
    void Read(void *,int);
    void Write(void *,int);
};

//------------------------------------------------------------------------------
//  FArray
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FArray {
  public:
    FArray(enum ENoInit);
    FArray(void);
    ~FArray(void);
    class FArray & operator=(class FArray const &);
    int Add(int,int);
    int AddZeroed(int,int);
    int Capacity(void)const ;
    static unsigned __int64 ConstructedCounter;
    void CountBytes(class FArchive &,int);
    static unsigned __int64 DestructedCounter;
    void Empty(int,int);
    void EmptyFast(void);
    void * GetData(void);
    void const * GetData(void)const ;
    void Insert(int,int,int);
    void InsertZeroed(int,int,int);
    int IsValidIndex(int)const ;
    int Num(void)const ;
    void Remove(int,int,int,int);
    void Reverse(int,int,int);
    void SetSize(int,int);
    void SetSizeZeroed(int,int);
    void SetToZero(int);
    void Shrink(int);
  protected:
    FArray(int,int);
    void Realloc(int);
};
*/

//------------------------------------------------------------------------------
//  FBitReader
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FBitReader {
  public:
    virtual ~FBitReader(void);
    virtual void Serialize(void *,int);
    virtual void SerializeBits(void *,int);
    virtual void SerializeInt(unsigned long &,unsigned long);
    virtual int AtEnd(void);
    FBitReader(struct FBitReader const &);
    FBitReader(unsigned char *,int);
    struct FBitReader & operator=(struct FBitReader const &);
    unsigned char * GetData(void);
    int GetNumBits(void);
    int GetNumBytes(void);
    int GetPosBits(void);
    unsigned char ReadBit(void);
    unsigned long ReadInt(unsigned long);
    void SetData(struct FBitReader &,int);
    void SetOverflowed(void);
};
*/

//------------------------------------------------------------------------------
//  FBitWriter
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FBitWriter {
  public:
    virtual ~FBitWriter(void);
    virtual void Serialize(void *,int);
    virtual void SerializeBits(void *,int);
    virtual void SerializeInt(unsigned long &,unsigned long);
    FBitWriter(struct FBitWriter const &);
    FBitWriter(int);
    struct FBitWriter & operator=(struct FBitWriter const &);
    unsigned char * GetData(void);
    int GetNumBits(void);
    int GetNumBytes(void);
    void SetOverflowed(void);
    void WriteBit(unsigned char);
    void WriteInt(unsigned long,unsigned long);
};
*/

//------------------------------------------------------------------------------
//  FBitWriterMark
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FBitWriterMark {
  public:
    FBitWriterMark(struct FBitWriter &);
    FBitWriterMark(void);
    struct FBitWriterMark & operator=(struct FBitWriterMark const &);
    int GetNumBits(void);
    void Pop(struct FBitWriter &);
};
*/

//------------------------------------------------------------------------------
//  FBufferReader
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FBufferReader {
  public:
    virtual ~FBufferReader(void);
    virtual void Serialize(void *,int);
    virtual int Tell(void);
    virtual int TotalSize(void);
    virtual int AtEnd(void);
    virtual void Seek(int);
    FBufferReader(class FBufferReader const &);
    FBufferReader(class TArray<unsigned char> const &);
};
*/

//------------------------------------------------------------------------------
//  FCriticalSection
//------------------------------------------------------------------------------

class DLL_IMPORT FCriticalSection {
  public:
    FCriticalSection(void);
    ~FCriticalSection(void);
    class FCriticalSection & operator=(class FCriticalSection const &);
    void Lock(void);
    void Unlock(void);
};

//------------------------------------------------------------------------------
//  FCylinder
//------------------------------------------------------------------------------

class DLL_IMPORT FCylinder {
  public:
    FCylinder(class FCylinder const &);
    FCylinder(class FVector,float);
    FCylinder(class FVector,float,float);
    FCylinder(void);
    class FCylinder & operator=(class FCylinder const &);
    bool contains(class FVector const &)const ;
};

//------------------------------------------------------------------------------
//  FDependency
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FDependency {
  public:
    FDependency(class UClass *,int);
    FDependency(void);
    class FDependency & operator=(class FDependency const &);
    int IsUpToDate(void);
};
*/

//------------------------------------------------------------------------------
//  FEdLoadError
//------------------------------------------------------------------------------

class DLL_IMPORT FEdLoadError {
  public:
    FEdLoadError(class FEdLoadError const &);
    FEdLoadError(int,unsigned short *);
    FEdLoadError(void);
    ~FEdLoadError(void);
    class FEdLoadError & operator=(class FEdLoadError);
    int operator==(class FEdLoadError const &)const ;
};

//------------------------------------------------------------------------------
//  FEdge
//------------------------------------------------------------------------------

class DLL_IMPORT FEdge {
  public:
    FEdge(class FVector,class FVector);
    FEdge(void);
    class FEdge & operator=(class FEdge const &);
    int operator==(class FEdge const &)const ;
};

//------------------------------------------------------------------------------
//  FErrorOutError
//------------------------------------------------------------------------------

class DLL_IMPORT FErrorOutError {
  public:
    virtual ~FErrorOutError(void);
    virtual void Serialize(unsigned short const *,enum EName);
    virtual void HandleError(void);
    FErrorOutError(class FErrorOutError const &);
    FErrorOutError(void);
    class FErrorOutError & operator=(class FErrorOutError const &);
};

//------------------------------------------------------------------------------
//  FExec
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FExec {
  public:
    virtual ~FExec(void);
    FExec(class FExec const &);
    FExec(void);
    class FExec & operator=(class FExec const &);
};
*/

//------------------------------------------------------------------------------
//  FFeedbackContext
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FFeedbackContext {
  public:
    virtual ~FFeedbackContext(void);
    virtual void MapCheck_Show(void);
    virtual void MapCheck_ShowConditionally(void);
    virtual void MapCheck_Hide(void);
    virtual void MapCheck_Clear(void);
    virtual void MapCheck_Add(int,void *,unsigned short const *);
    FFeedbackContext(class FFeedbackContext const &);
    FFeedbackContext(void);
    class FFeedbackContext & operator=(class FFeedbackContext const &);
};
*/

//------------------------------------------------------------------------------
//  FFileManager
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FFileManager {
  public:
    virtual ~FFileManager(void);
    virtual void Init(int);
    virtual class FString ExpandPath(unsigned short const *);
    virtual unsigned short const * CalcHomeDir(void);
    virtual int GetDriveLetters(class FString &)const ;
    virtual int IsCaseSensitive(void)const ;
    virtual int GetFileLastModTime(unsigned short const *,unsigned long &,unsigned long &,unsigned long &,unsigned long &,unsigned long &,unsigned long &);
    FFileManager(class FFileManager const &);
    FFileManager(void);
    class FFileManager & operator=(class FFileManager const &);
};
*/

//------------------------------------------------------------------------------
//  FFrame
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FFrame {
  public:
    virtual ~FFrame(void);
    virtual void Serialize(unsigned short const *,enum EName);
    FFrame(struct FFrame const &);
    FFrame(class UObject *);
    FFrame(class UObject *,class UStruct *,int,void *);
    struct FFrame & operator=(struct FFrame const &);
    float ReadFloat(void);
    int ReadInt(void);
    class FName ReadName(void);
    class UObject * ReadObject(void);
    int ReadWord(void);
    void Step(class UObject *,void * const);
};
*/

//------------------------------------------------------------------------------
//  FGenerationInfo
//------------------------------------------------------------------------------

/*
struct DLL_IMPORT FGenerationInfo {
  public:
    FGenerationInfo(int,int);
    struct FGenerationInfo & operator=(struct FGenerationInfo const &);
};
*/

//------------------------------------------------------------------------------
//  FGlobalMath
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FGlobalMath {
  public:
    FGlobalMath(void);
    float CosFloat(float);
    float CosTab(int);
    float SinFloat(float);
    float SinTab(int);
    float Sqrt(int);
};
*/

//------------------------------------------------------------------------------
//  FInterpCurveInit
//------------------------------------------------------------------------------

class DLL_IMPORT FInterpCurveInit {
  public:
    FInterpCurveInit(class FInterpCurveInit const &);
    FInterpCurveInit(void);
    ~FInterpCurveInit(void);
    class FInterpCurveInit & operator=(class FInterpCurveInit const &);
};

//------------------------------------------------------------------------------
//  FLabelEntry
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FLabelEntry {
  public:
    FLabelEntry(class FName,int);
    struct FLabelEntry & operator=(struct FLabelEntry const &);
};
*/

//------------------------------------------------------------------------------
//  FLocalizedStringProvider
//------------------------------------------------------------------------------

class DLL_IMPORT FLocalizedStringProvider {
  public:
    virtual ~FLocalizedStringProvider(void);
    FLocalizedStringProvider(class FLocalizedStringProvider const &);
    FLocalizedStringProvider(void);
    class FLocalizedStringProvider & operator=(class FLocalizedStringProvider const &);
};

//------------------------------------------------------------------------------
//  FLogOutError
//------------------------------------------------------------------------------

class DLL_IMPORT FLogOutError {
  public:
    virtual ~FLogOutError(void);
    virtual void Serialize(unsigned short const *,enum EName);
    FLogOutError(class FLogOutError const &);
    FLogOutError(void);
    class FLogOutError & operator=(class FLogOutError const &);
};

//------------------------------------------------------------------------------
//  FMemCache
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FMemCache {
  public:
    FMemCache(void);
    class FMemCache & operator=(class FMemCache const &);
    void CheckState(void);
    unsigned char * Create(unsigned __int64,class FMemCache::FCacheItem * &,int,int,int);
    int Exec(unsigned short const *,class FOutputDevice &);
    void Exit(int);
    class FCacheItem * FMemCache::First(void);
    void Flush(unsigned __int64,unsigned long,int);
    unsigned long GHash(unsigned long);
    unsigned char * Get(unsigned __int64,class FMemCache::FCacheItem * &,int);
    int GetTime(void);
    void Init(int,int,void *,int);
    class FCacheItem * FMemCache::Last(void);
    class FCacheItem * FMemCache::Next(class FMemCache::FCacheItem *);
    void Status(unsigned short *);
    void Tick(void);
  private:
    void ConditionalCheckState(void);
    void CreateNewFreeSpace(unsigned char *,unsigned char *,class FMemCache::FCacheItem *,class FMemCache::FCacheItem *,int);
    class FCacheItem * FMemCache::FlushItem(class FMemCache::FCacheItem *,int);
    class FCacheItem * FMemCache::MergeWithNext(class FMemCache::FCacheItem *);
    void Unhash(unsigned __int64);
};
*/

//------------------------------------------------------------------------------
//  FMemMark
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FMemMark {
  public:
    FMemMark(class FMemStack &);
    FMemMark(void);
    class FMemMark & operator=(class FMemMark const &);
    void Pop(void);
};
*/

//------------------------------------------------------------------------------
//  FModelCoords
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FModelCoords {
  public:
    FModelCoords(class FCoords const &,class FCoords const &);
    FModelCoords(void);
    class FModelCoords & operator=(class FModelCoords const &);
    class FModelCoords Inverse(void);
};
*/

//------------------------------------------------------------------------------
//  FName
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FName {
  public:
    FName(unsigned short const *,enum EFindName);
    FName(enum EName);
    FName(void);
    class FName & operator=(class FName const &);
    int operator==(class FName const &)const ;
    int operator!=(class FName const &)const ;
    unsigned short const * operator*(void)const ;
    void ClearFlags(unsigned long)const ;
    static void CDECL DeleteEntry(int);
    static void CDECL DisplayHash(class FOutputDevice &);
    static struct FNameEntry * CDECL GetEntry(int);
    unsigned long GetFlags(void)const ;
    int GetIndex(void)const ;
    static int CDECL GetInitialized(void);
    static int CDECL GetMaxNames(void);
    static void CDECL Hardcode(struct FNameEntry *);
    int IsValid(void);
    static unsigned short const * CDECL SafeString(enum EName);
    static int CDECL SafeSuppressed(enum EName);
    void SetFlags(unsigned long)const ;
    static void CDECL StaticExit(void);
    static void CDECL StaticInit(void);
  private:
    static class TArray<int> Available;
    static int Initialized;
    static struct FNameEntry * * NameHash;
    static class TArray<struct FNameEntry *> Names;
};
*/

//------------------------------------------------------------------------------
//  FNameEntry
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FNameEntry {
  public:
    FNameEntry(void);
    struct FNameEntry & operator=(struct FNameEntry const &);
};
*/

//------------------------------------------------------------------------------
//  FNotifyHook
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FNotifyHook {
  public:
    virtual ~FNotifyHook(void);
    virtual void NotifyDestroy(void *);
    virtual void NotifyPreChange(void *);
    virtual void NotifyPostChange(void *);
    virtual void NotifyExec(void *,unsigned short const *);
    virtual void SBNotifyPreChange(void *,class UProperty *);
    virtual void SBNotifyPostChange(void *,class UProperty *);
    FNotifyHook(class FNotifyHook const &);
    FNotifyHook(void);
    class FNotifyHook & operator=(class FNotifyHook const &);
};
*/

//------------------------------------------------------------------------------
//  FNullOutError
//------------------------------------------------------------------------------

class DLL_IMPORT FNullOutError {
  public:
    virtual ~FNullOutError(void);
    virtual void Serialize(unsigned short const *,enum EName);
    FNullOutError(class FNullOutError const &);
    FNullOutError(void);
    class FNullOutError & operator=(class FNullOutError const &);
};

//------------------------------------------------------------------------------
//  FObjectExport
//------------------------------------------------------------------------------

/*
struct DLL_IMPORT FObjectExport {
  public:
    FObjectExport(class UObject *);
    FObjectExport(void);
    struct FObjectExport & operator=(struct FObjectExport const &);
};
*/

//------------------------------------------------------------------------------
//  FObjectImport
//------------------------------------------------------------------------------

/*
struct DLL_IMPORT FObjectImport {
  public:
    FObjectImport(class UObject *);
    FObjectImport(void);
    struct FObjectImport & operator=(struct FObjectImport const &);
};
*/

//------------------------------------------------------------------------------
//  FOutputDevice
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FOutputDevice {
  public:
    virtual ~FOutputDevice(void);
    virtual void Flush(void);
    FOutputDevice(class FOutputDevice const &);
    FOutputDevice(void);
    class FOutputDevice & operator=(class FOutputDevice const &);
    void Log(class FString const &);
    void Log(unsigned short const *);
    void Log(enum EName,class FString const &);
    void Log(enum EName,unsigned short const *);
    void CDECL Logf(unsigned short const *,...);
    void CDECL Logf(enum EName,unsigned short const *,...);
};
*/

//------------------------------------------------------------------------------
//  FOutputDeviceDCONSOLE
//------------------------------------------------------------------------------

class DLL_IMPORT FOutputDeviceDCONSOLE {
  public:
    virtual ~FOutputDeviceDCONSOLE(void);
    virtual void Serialize(unsigned short const *,enum EName);
    FOutputDeviceDCONSOLE(class FOutputDeviceDCONSOLE const &);
    FOutputDeviceDCONSOLE(void);
    class FOutputDeviceDCONSOLE & operator=(class FOutputDeviceDCONSOLE const &);
  protected:
    static class d_console::clog * mLog;
    static int mRefCount;
};

//------------------------------------------------------------------------------
//  FOutputDeviceError
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FOutputDeviceError {
  public:
    virtual ~FOutputDeviceError(void);
    FOutputDeviceError(class FOutputDeviceError const &);
    FOutputDeviceError(void);
    class FOutputDeviceError & operator=(class FOutputDeviceError const &);
};
*/

//------------------------------------------------------------------------------
//  FPackageFileSummary
//------------------------------------------------------------------------------

/*
struct DLL_IMPORT FPackageFileSummary {
  public:
    FPackageFileSummary(struct FPackageFileSummary const &);
    FPackageFileSummary(void);
    ~FPackageFileSummary(void);
    struct FPackageFileSummary & operator=(struct FPackageFileSummary const &);
    int GetFileVersion(void)const ;
    int GetFileVersionComplete(void)const ;
    int GetFileVersionLicensee(void)const ;
    void SetFileVersions(int,int);
};
*/

//------------------------------------------------------------------------------
//  FPosition
//------------------------------------------------------------------------------

class DLL_IMPORT FPosition {
  public:
    FPosition(class FVector,class FCoords);
    FPosition(void);
    class FPosition & operator=(class FPosition const &);
};

//------------------------------------------------------------------------------
//  FPreferencesInfo
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FPreferencesInfo {
  public:
    FPreferencesInfo(class FPreferencesInfo const &);
    FPreferencesInfo(void);
    ~FPreferencesInfo(void);
    class FPreferencesInfo & operator=(class FPreferencesInfo const &);
};
*/

//------------------------------------------------------------------------------
//  FRainbowPtr
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FRainbowPtr {
  public:
    FRainbowPtr(void *);
    FRainbowPtr(void);
    union FRainbowPtr & operator=(union FRainbowPtr const &);
};
*/

//------------------------------------------------------------------------------
//  FRegistryObjectInfo
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FRegistryObjectInfo {
  public:
    FRegistryObjectInfo(class FRegistryObjectInfo const &);
    FRegistryObjectInfo(void);
    ~FRegistryObjectInfo(void);
    class FRegistryObjectInfo & operator=(class FRegistryObjectInfo const &);
};
*/

//------------------------------------------------------------------------------
//  FScopeCriticalSection
//------------------------------------------------------------------------------

class DLL_IMPORT FScopeCriticalSection {
  public:
    FScopeCriticalSection(class FCriticalSection *);
    ~FScopeCriticalSection(void);
    class FScopeCriticalSection & operator=(class FScopeCriticalSection const &);
};

//------------------------------------------------------------------------------
//  FScriptCallGraph
//------------------------------------------------------------------------------

struct DLL_IMPORT FScriptCallGraph {
  public:
    FScriptCallGraph(struct FScriptCallGraph const &);
    FScriptCallGraph(unsigned long);
    ~FScriptCallGraph(void);
    struct FScriptCallGraph & operator=(struct FScriptCallGraph const &);
    void EmitCycles(unsigned long);
    void EmitEnd(void);
    void EmitFrameEnd(void);
    void EmitFunction(class UFunction *);
    int IsEndMarker(unsigned long);
    int IsFrameEndMarker(unsigned long);
    void Reset(unsigned long);
    void Serialize(class FArchive &);
    void Tick(void);
};

//------------------------------------------------------------------------------
//  FScriptDelegate
//------------------------------------------------------------------------------

/*
struct DLL_IMPORT FScriptDelegate {
  public:
    FScriptDelegate(void);
    struct FScriptDelegate & operator=(struct FScriptDelegate const &);
};
*/

//------------------------------------------------------------------------------
//  FSphere
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FSphere {
  public:
    FSphere(class FSphere const &);
    FSphere(int);
    FSphere(class FVector const *,int);
    FSphere(class FVector,float);
    FSphere(void);
    class FSphere & operator=(class FSphere const &);
    class FSphere TransformBy(class FMatrix const &)const ;
};
*/

//------------------------------------------------------------------------------
//  FStateFrame
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FStateFrame {
  public:
    virtual ~FStateFrame(void);
    FStateFrame(struct FStateFrame const &);
    FStateFrame(class UObject *);
    struct FStateFrame & operator=(struct FStateFrame const &);
    unsigned short const * Describe(void);
};
*/

//------------------------------------------------------------------------------
//  FString
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FString {
  public:
    FString(class FString const &);
    FString(class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > const &);
    FString(signed char,int);
    FString(unsigned char,int);
    FString(short,int);
    FString(unsigned short,int);
    FString(int,int);
    FString(unsigned long,int);
    FString(float,int,int,int);
    FString(double,int,int,int);
    FString(char const *);
    FString(unsigned short const *);
    FString(enum ENoInit);
    FString(void);
    ~FString(void);
    class FString & operator=(class FString const &);
    class FString & operator=(class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > const &);
    class FString & operator=(unsigned short const *);
    int operator==(class FString const &)const ;
    int operator==(unsigned short const *)const ;
    int operator!=(class FString const &)const ;
    int operator!=(unsigned short const *)const ;
    unsigned short & operator[](int);
    unsigned short const & operator[](int)const ;
    operator bool(void)const ;
    class FString operator*(class FString const &)const ;
    class FString operator*(unsigned short const *)const ;
    unsigned short const * operator*(void)const ;
    class FString operator+(class FString const &);
    class FString operator+(unsigned short const *);
    int operator<(class FString const &)const ;
    int operator<(unsigned short const *)const ;
    int operator<=(class FString const &)const ;
    int operator<=(unsigned short const *)const ;
    int operator>(class FString const &)const ;
    int operator>(unsigned short const *)const ;
    int operator>=(class FString const &)const ;
    int operator>=(unsigned short const *)const ;
    class FString & operator*=(class FString const &);
    class FString & operator*=(unsigned short const *);
    class FString & operator+=(class FString const &);
    class FString & operator+=(unsigned short const *);
    class FString Caps(void)const ;
    static class FString CDECL Chr(unsigned short);
    static unsigned __int64 ConstructedCounter;
    static unsigned __int64 DestructedCounter;
    void Empty(void);
    int EndsInDigit(void);
    class FString ExtractFilename(void);
    static class FString CDECL FormatAsNumber(int);
    int HexValue(void)const ;
    int InStr(class FString const &,int)const ;
    int InStr(unsigned short const *,int)const ;
    int IsNumeric(void);
    class FString Left(int)const ;
    class FString LeftChop(int)const ;
    class FString LeftPad(int);
    int Len(void)const ;
    class FString Locs(void)const ;
    class FString Mid(int,int)const ;
    int ParseIntoArray(unsigned short const *,class TArray<class FString> *)const ;
    static class FString CDECL Printf(unsigned short const *,...);
    class FString Replace(unsigned short const *,unsigned short const *)const ;
    class FString Reverse(void);
    class FString Right(int)const ;
    class FString RightPad(int);
    void Shrink(void);
    int Split(class FString const &,class FString *,class FString *,int)const ;
    class FString SplitFilename(int,int,int);
    bool const print(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > *)const ;
    bool const print(class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > *)const ;
    bool const scan(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &);
    bool const scan(class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > const &);
    unsigned int const size(void)const ;
  protected:
    FString(int,unsigned short const *);
    void AssureUniqueIndex(void);
    void AssureUniqueValidIndex(void);
    int Num(void);
  private:
    unsigned int AddEmptyString(struct FString::StringTableEntry * &);
    unsigned int AddString(class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > const &,struct FString::StringTableEntry * &);
    unsigned int AddString(unsigned short const *,struct FString::StringTableEntry * &);
    void DereferenceIndex(unsigned int,struct FString::StringTableEntry * &);
    struct StringData * FString::GetData(void);
    static int const MAX_TABLE_SIZE;
};
*/

//------------------------------------------------------------------------------
//  FStringNoInit
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FStringNoInit {
  public:
    FStringNoInit(struct FStringNoInit const &);
    FStringNoInit(void);
    ~FStringNoInit(void);
    struct FStringNoInit & operator=(struct FStringNoInit const &);
    class FString & operator=(class FString const &);
    class FString & operator=(unsigned short const *);
};
*/

//------------------------------------------------------------------------------
//  FThrowOut
//------------------------------------------------------------------------------

class DLL_IMPORT FThrowOut {
  public:
    virtual ~FThrowOut(void);
    virtual void Serialize(unsigned short const *,enum EName);
    FThrowOut(class FThrowOut const &);
    FThrowOut(void);
    class FThrowOut & operator=(class FThrowOut const &);
};

//------------------------------------------------------------------------------
//  FTransactionBase
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FTransactionBase {
  public:
    virtual ~FTransactionBase(void);
    FTransactionBase(class FTransactionBase const &);
    FTransactionBase(void);
    class FTransactionBase & operator=(class FTransactionBase const &);
};
*/

//------------------------------------------------------------------------------
//  FUnknown
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FUnknown {
  public:
    virtual ~FUnknown(void);
    virtual unsigned long STDCALL AddRef(void);
    virtual unsigned long STDCALL Release(void);
    FUnknown(class FUnknown const &);
    FUnknown(void);
    class FUnknown & operator=(class FUnknown const &);
};
*/

//------------------------------------------------------------------------------
//  FVertexHit
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FVertexHit {
  public:
    FVertexHit(class ABrush *,int,int);
    FVertexHit(void);
    class FVertexHit & operator=(class FVertexHit const &);
    int operator==(class FVertexHit const &)const ;
    int operator!=(class FVertexHit const &)const ;
};
*/

//------------------------------------------------------------------------------
//  UUFileCheck
//------------------------------------------------------------------------------

class DLL_IMPORT UUFileCheck {
  public:
    UUFileCheck(class UUFileCheck const &);
    UUFileCheck(class FString const &,class FString const &);
    ~UUFileCheck(void);
    class UUFileCheck & operator=(class UUFileCheck const &);
    int Check(void);
    static class FString CDECL GetPackageClassesDirectory(class FString const &);
    static class FString CDECL GetPackageUFilename(class FString const &);
    void HandleError(void);
    void Remove(void);
  protected:
    struct TimeStamp UUFileCheck::GetFileTimestamp(class FString const &);
    struct TimeStamp UUFileCheck::GetNewestUCFileTimestamp(class FString const &);
    int InErrorState(void);
};

//------------------------------------------------------------------------------
//  FMemCache::FCacheItem
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FMemCache::FCacheItem {
  public:
    class FMemCache::FCacheItem & operator=(class FMemCache::FCacheItem const &);
    int GetCost(void);
    unsigned char * GetData(void);
    unsigned char GetExtra(void);
    unsigned __int64 GetId(void);
    int GetSize(void);
    unsigned short GetTime(void);
    void SetExtra(unsigned char);
    void Unlock(void);
};
*/

//------------------------------------------------------------------------------
//  FCompactIndex
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FCompactIndex {
  public:
    class FCompactIndex & operator=(class FCompactIndex const &);
};
*/

//------------------------------------------------------------------------------
//  FMemStack
//------------------------------------------------------------------------------

/*
class DLL_IMPORT FMemStack {
  public:
    class FMemStack & operator=(class FMemStack const &);
    void Exit(void);
    unsigned int GetByteCount(void);
    void Init(int);
    unsigned char * PushBytes(unsigned int,int);
    void Tick(void);
  private:
    unsigned char * AllocateNewChunk(unsigned int);
    void FreeChunks(struct FMemStack::FTaggedMemory *);
    static struct FTaggedMemory * FMemStack::UnusedChunks;
};
*/

//------------------------------------------------------------------------------
//  std
//------------------------------------------------------------------------------

class DLL_IMPORT std {
  public:
    FString::operator class basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > &(void);
    FString::operator class basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > const &(void)const ;
};


AUTOGENERATE_CLASS(UArrayProperty)
AUTOGENERATE_CLASS(UBoolProperty)
AUTOGENERATE_CLASS(UByteProperty)
AUTOGENERATE_CLASS(UClass)
AUTOGENERATE_CLASS(UClassProperty)
AUTOGENERATE_CLASS(UCommandlet)
AUTOGENERATE_CLASS(UConst)
AUTOGENERATE_CLASS(UDelegateProperty)
AUTOGENERATE_CLASS(UEnum)
AUTOGENERATE_CLASS(UExporter)
AUTOGENERATE_CLASS(UFactory)
AUTOGENERATE_CLASS(UField)
AUTOGENERATE_CLASS(UFixedArrayProperty)
AUTOGENERATE_CLASS(UFloatProperty)
AUTOGENERATE_CLASS(UFunction)
AUTOGENERATE_CLASS(UIntProperty)
AUTOGENERATE_CLASS(ULanguage)
AUTOGENERATE_CLASS(ULinker)
AUTOGENERATE_CLASS(ULinkerLoad)
AUTOGENERATE_CLASS(ULinkerSave)
AUTOGENERATE_CLASS(UMapProperty)
AUTOGENERATE_CLASS(UNameProperty)
AUTOGENERATE_CLASS(UObject)
AUTOGENERATE_CLASS(UObjectExporterT3D)
AUTOGENERATE_CLASS(UObjectProperty)
AUTOGENERATE_CLASS(UPackage)
AUTOGENERATE_CLASS(UPointerProperty)
AUTOGENERATE_CLASS(UProperty)
AUTOGENERATE_CLASS(UState)
AUTOGENERATE_CLASS(UStrProperty)
AUTOGENERATE_CLASS(UStruct)
AUTOGENERATE_CLASS(UStructProperty)
AUTOGENERATE_CLASS(USubsystem)
AUTOGENERATE_CLASS(USystem)
AUTOGENERATE_CLASS(UTextBuffer)
AUTOGENERATE_CLASS(UTextBufferFactory)

AUTOGENERATE_PACKAGE(Core)

typedef void (UObject::** GCasts)(struct FFrame &,void * const);
typedef void (__cdecl* GLoadingHook)(int,int);
typedef void (UObject::** GNatives)(struct FFrame &,void * const);
typedef void (__cdecl* GTempFunc)(void *);

//`public: FString::operator class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > &(void)'::`2'::`local static guard'{2}' 101fc128
//`public: FString::operator class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > const &(void)const '::`2'::`local static guard'{2}' 101fc104
//public: void FBitReader::`default constructor closure'(void) 101063f0
//public: void UTextBuffer::`default constructor closure'(void) 10104410
//struct FNameEntry * CDECL AllocateNameEntry(unsigned short const *,unsigned long,unsigned long,struct FNameEntry *) 1014e2d0
//struct FString::StringData * `private: struct FString::StringData * FString::GetData(void)'::`2'::Data 101fc108
//void CDECL EdClearLoadErrors(void) 10171380
//void CDECL EdLoadErrorf(int,unsigned short const *,...) 10171000
//float FAR_CLIPPING_PLANE 101d57bc
//int CDECL FIsInAngle(float,class FVector const &,float,class FVector const &,float) 10146970
//int CDECL FIsInAngleLessThan180(float,class FVector const &,float,class FVector const &,float) 10146660
//int CDECL FLineExtentBoxIntersection(class FBox const &,class FVector const &,class FVector const &,class FVector const &,class FVector &,class FVector &,float &) 10145c10
//class FQuat CDECL FQuatFindBetween(class FVector const &,class FVector const &) 10145ad0
//unsigned long GAllocatedMemory 101daca0
//int GAsyncLazyArrayEnabled 101d61dc
//class d_std::async_loader GAsyncLoader 101fc0ac
//float GAudioDefaultRadius 101d37b4
//float GAudioMaxRadiusMultiplier 101d37b0
//unsigned __int64 GBaseCycles 101d9c80
//unsigned short * GBuildLabel 101d37b8
//int GCDKS 101d9c18
//unsigned short * GCPUType 101d57d0
//unsigned long * GCRCTable 102143d0
//int GCastDuplicate 10203d14
//unsigned short * GCdPath 101d9a08
//int GCheckUFilesAtStartup 101d6940
//int GClientBuild 101d9c3c
//unsigned short * GCmdLine 102147e8
//class FConfigCache * GConfig 101d79ec
//double GCurrentTime 101dacd0
//int GDatabaseLanguageID 101d61d8
//class UDebugger * GDebugger 101d9c70
//float GDeltaTime 101dacbc
//int GDemoPlayback 101dace4
//int GDevBuild 101d9c40
//bool GDoCheckVarArgs 101d6898
//class FArchive * GDummySave 101d37ac
//class TArray<class FEdLoadError> GEdLoadErrors 101dbfb4
//int GEdSelectionLock 101d9c28
//int GEdShowFogInViewports 101d37a4
//class FOutputDeviceError * GError 101d3774
//unsigned short * GErrorHist 101d7a08
//class FExec * GExec 101d79f8
//class FFileManager * GFileManager 101d3780
//unsigned __int64 GFileManagerBytesRead 101daca8
//float GFileManagerLoadingTime 101dacb0
//float GFileManagerMiscTime 101dacb8
//float GFileManagerSeekTime 101dacb4
//float GFixedTimeStep 101dacc4
//int GGCShowObjectDestruction 101dbee8
//unsigned long GGPUDeviceID 101dacdc
//unsigned long GGPUVendorID 101dace0
//float GHz 101d57c4
//unsigned short * GIni 101d9c90
//void CDECL GInitRunaway(void) 1012f870
//int GIsAltivec 101dbf28
//int GIsBenchmarking 101d9c7c
//int GIsBot 101d9c30
//int GIsClient 101d9c2c
//int GIsClocking 101d9c6c
//int GIsCriticalError 101d9c44
//int GIsEditor 101d9c20
//int GIsGarbageCollecting 101d9c54
//int GIsGuarded 101d9c4c
//int GIsOpenGL 101dac90
//int GIsOpenGLRevComps 101dac94
//int GIsPixomatic 101dac98
//int GIsRecordingMovie 101dacc8
//int GIsRequestingExit 101d9c5c
//int GIsRunning 101d9c50
//int GIsScriptable 101d9c1c
//int GIsServer 101d9c34
//int GIsSlowTask 101d9c58
//int GIsSoaking 101d9c78
//int GIsSpellbornEd 101dbefc
//int GIsStarted 101d9c48
//int GIsStrict 101d9c60
//int GIsUCC 101d9c24
//int GLazyLoad 101d9c68
//class FLocalizedStringProvider * GLocalizedStringProvider 101fc12c
//class FOutputDevice * GLog 101d3770
//class FOutputDevice * GLogHook 101d79f4
//unsigned char * GMD5 101d69b0
//int GMTGCFrame 101dbf14
//void * GMTGCMutexA 101dbf04
//void * GMTGCMutexB 101dbf08
//int GMTGCRunning 101dbf10
//void * GMTGCThread 101dbf0c
//unsigned short * GMachineCPU 101d47b8
//unsigned short * GMachineOS 101d3fb8
//unsigned short * GMachineVideo 101d4fb8
//unsigned __int64 GMakeCacheIDIndex 101d9c88
//class FGlobalMath GMath 101dbfd0
//int GMaxScriptProfilingStackDepth 101dacd8
//class FMemStack GMem 101d79d8
//unsigned long GMemoryTag 101dac9c
//unsigned short * GModDef 101db6e8
//unsigned short * GModName 101dace8
//unsigned short * GModPath 101daee8
//int GNativeDuplicate 10203d10
//class FOutputDevice * GNull 101d3778
//unsigned short * GOldGameINIFile 101d71d8
//unsigned short * GOldUserINIFile 101d69d0
//unsigned long GPageSize 101d3798
//unsigned long GPhysicalMemory 101d37a0
//unsigned long GProcessorCount 101d379c
//unsigned char * GPropAddr 101d69c8
//class UObject * GPropObject 101d71d0
//class UProperty * GProperty 101d69c0
//unsigned char CDECL GRegisterCast(int,void (UObject::*const &)(struct FFrame &,void * const)) 101360c0
//unsigned char CDECL GRegisterNative(int,void (UObject::*const &)(struct FFrame &,void * const)) 10136060
//enum ERunningCPU GRunningCPU 101d57cc
//enum ERunningOS GRunningOS 101d57c0
//unsigned long GRuntimeUCFlags 101d7a00
//int GSVNRevision 101d59d0
//unsigned short * GSVNRevisionDescr 101d59d8
//int GSaveDescriptions 101dbeec
//struct FScriptCallGraph * GScriptCallGraph 10203d20
//int GScriptCycles 101d69c4
//int GScriptEntryTag 101d9c64
//double GSecondsPerCycle 101d3788
//int GServerBuild 101d9c38
//int GShowAppThrowf 101dbef8
//int GShowBuildLabel 101d37a8
//void * GSkillLogWindow 101dbef0
//int GSkillLogWindowVisible 101dbef4
//float GSpf 101d57c8
//class USystem * GSys 101d79fc
//double GTempDouble 101d9c08
//class FOutputDevice * GThrow 101d377c
//unsigned __int64 GTicks 101d3790
//int GTransientNaming 101d9c74
//unsigned long GUglyHackFlags 101d9c14
//class FTransactionBase * GUndo 101d79f0
//int GUnicode 101d61e0
//int GUnicodeOS 101dbf18
//int GUseFixedTimeStep 101dacc0
//unsigned short * GUserIni 101da490
//class FFeedbackContext * GWarn 101d79e8
//class USubsystem * GWindowManager 101d7a04
//unsigned short * CDECL GetDefUserFilename(void) 10147760
//unsigned short `public: unsigned short & FString::operator[](int)'::`2'::InvalidIndexChar 101fc0d8
//unsigned short `public: unsigned short const & FString::operator[](int)const '::`2'::InvalidIndexChar 101fc0dc
//unsigned short const * CDECL Localize(char const *,char const *,unsigned short const *,unsigned short const *,int) 1014aaf0
//unsigned short const * CDECL Localize(unsigned short const *,unsigned short const *,unsigned short const *,unsigned short const *,int) 10149f70
//void CDECL LocalizeBig(char const *,char const *,unsigned short const *,unsigned short const *,int,unsigned short *,int) 1014ab40
//void CDECL LocalizeBig(unsigned short const *,unsigned short const *,unsigned short const *,unsigned short const *,int,unsigned short *,int) 1014a130
//unsigned short const * CDECL LocalizeError(char const *,unsigned short const *,unsigned short const *) 1014ab90
//unsigned short const * CDECL LocalizeError(unsigned short const *,unsigned short const *,unsigned short const *) 1014a2f0
//unsigned short const * CDECL LocalizeGeneral(char const *,unsigned short const *,unsigned short const *) 1014ac20
//unsigned short const * CDECL LocalizeGeneral(unsigned short const *,unsigned short const *,unsigned short const *) 1014a350
//unsigned short const * CDECL LocalizeProgress(char const *,unsigned short const *,unsigned short const *) 1014abc0
//unsigned short const * CDECL LocalizeProgress(unsigned short const *,unsigned short const *,unsigned short const *) 1014a310
//unsigned short const * CDECL LocalizeQuery(char const *,unsigned short const *,unsigned short const *) 1014abf0
//unsigned short const * CDECL LocalizeQuery(unsigned short const *,unsigned short const *,unsigned short const *) 1014a330
//float NEAR_CLIPPING_PLANE 101d57b8
//int CDECL Parse(unsigned short const *,unsigned short const *,signed char &) 10149720
//int CDECL Parse(unsigned short const *,unsigned short const *,unsigned char &) 10149650
//int CDECL Parse(unsigned short const *,unsigned short const *,short &) 101498c0
//int CDECL Parse(unsigned short const *,unsigned short const *,unsigned short &) 101497f0
//int CDECL Parse(unsigned short const *,unsigned short const *,int &) 10149a50
//int CDECL Parse(unsigned short const *,unsigned short const *,unsigned long &) 10149590
//int CDECL Parse(unsigned short const *,unsigned short const *,float &) 10149990
//int CDECL Parse(unsigned short const *,unsigned short const *,class FName &) 101494d0
//int CDECL Parse(unsigned short const *,unsigned short const *,class FString &,unsigned short *) 1014c030
//int CDECL Parse(unsigned short const *,unsigned short const *,__int64 &) 10149290
//int CDECL Parse(unsigned short const *,unsigned short const *,unsigned __int64 &) 1014aa70
//int CDECL Parse(unsigned short const *,unsigned short const *,unsigned short *,int,unsigned short *) 10148f90
//int CDECL ParseCommand(unsigned short const * *,unsigned short const *) 10149bf0
//int CDECL ParseLine(unsigned short const * *,class FString &,int) 1014c1e0
//int CDECL ParseLine(unsigned short const * *,unsigned short *,int,int) 10149e70
//void CDECL ParseNext(unsigned short const * *) 10149d20
//int CDECL ParseObject(unsigned short const *,unsigned short const *,class UClass *,class UObject * &,class UObject *) 101493e0
//int CDECL ParseParam(unsigned short const *,unsigned short const *) 101491d0
//class FString CDECL ParseToken(unsigned short const * &,int) 1014c160
//int CDECL ParseToken(unsigned short const * &,class FString &,int) 1014c110
//int CDECL ParseToken(unsigned short const * &,unsigned short *,int,int) 10149d80
//int CDECL ParseUBOOL(unsigned short const *,unsigned short const *,int &) 10149b00
//unsigned short const * const `private: virtual class FArchive & ULinkerLoad::operator<<(class UObject * &)'::`3'::__FUNC_NAME__ 1018bdd4
//unsigned short const * const `private: virtual class FArchive & ULinkerLoad::operator<<(class FName &)'::`3'::__FUNC_NAME__ 1018c31c
//unsigned short const * const `public: void UClass::AddDependency(class UClass *,int)'::`3'::__FUNC_NAME__ 1018c140
//unsigned short const * const `public: int FString::HexValue(void)const '::`3'::__FUNC_NAME__ 1018c9b8
//unsigned short const * const `public: int FString::ParseIntoArray(unsigned short const *,class TArray<class FString> *)const '::`3'::__FUNC_NAME__ 1018ca00
//unsigned short const * const `public: class FString FString::Reverse(void)'::`3'::__FUNC_NAME__ 1018ca38
//char * CDECL appAnsiStaticString1024(void) 10148c60
//float CDECL appAtof(unsigned short const *) 10125040
//int CDECL appAtoi(unsigned short const *) 10124ff0
//unsigned short const * CDECL appBaseDir(void) 1016fd00
//unsigned char CDECL appCeilLogTwo(unsigned long) 10147200
//void CDECL appCleanFileCache(void) 10171b10
//void CDECL appClipboardCopy(unsigned short const *) 1016ec80
//class FString CDECL appClipboardPaste(void) 10170b20
//unsigned short const * CDECL appCmdLine(void) 10147750
//unsigned short const * CDECL appComputerName(void) 1016fef0
//int CDECL appCreateBitmap(unsigned short const *,int,int,unsigned long *,class FFileManager *) 10147420
//void * CDECL appCreateProc(unsigned short const *,unsigned short const *) 1016f8d0
//int CDECL appCreateTarga(unsigned short const *,int,int,unsigned long *,class FFileManager *,int) 1014ac50
//void CDECL appCreateTempFilename(unsigned short const *,unsigned short *) 1014a4e0
//unsigned short const * CDECL appDataDir(void) 1016fe20
//void CDECL appDebugBreak(void) 1016f700
//void CDECL appDebugMessagef(unsigned short const *,...) 1016f4e0
//void CDECL appExit(void) 1014a620
//unsigned short const * CDECL appFExt(unsigned short const *) 10148b50
//float CDECL appFRandRange(float,float) 10124d90
//void CDECL appFailAssert(char const *,char const *,int) 1014a9c0
//int CDECL appFindPackageFile(unsigned short const *,unsigned short *,int) 1014d4c0
//class FString CDECL appFormat(class FString,class TMultiMap<class FString,class FString> const &) 1014c320
//void CDECL appFreeDllHandle(void *) 1016f210
//unsigned short const * CDECL appFromAnsi(char const *,unsigned short *,int) 1014a890
//unsigned short const * CDECL appFromUnicode(unsigned short const *,unsigned short *,int) 101477e0
//void * CDECL appGetDllExport(void *,unsigned short const *) 1016f300
//void * CDECL appGetDllHandle(unsigned short const *) 10170dd0
//unsigned short const * CDECL appGetExt(unsigned short const *) 101477f0
//class FString CDECL appGetGMTRef(void) 101252c0
//void CDECL appGetLastError(void) 1016f630
//int CDECL appGetProcReturnCode(void *,int *) 1016faf0
//unsigned short const * CDECL appGetSystemErrorMessage(int) 1016ea50
//void CDECL appInit(unsigned short const *,unsigned short const *,class FOutputDevice *,class FOutputDeviceError *,class FFeedbackContext *,class FFileManager *,class FConfigCache * (__cdecl*)(void),int) 1014c8b0
//int CDECL appIsDebuggerPresent(void) 1016f710
//int CDECL appIsOnConsole(void) 10147400
//int CDECL appIsPureAnsi(unsigned short const *) 10146ff0
//unsigned short * CDECL appItoa(int) 10125000
//void CDECL appLaunchURL(unsigned short const *,unsigned short const *,class FString *) 101711c0
//int CDECL appLoadFileToArray(class TArray<unsigned char> &,unsigned short const *,class FFileManager *,unsigned long,int) 1014ae70
//int CDECL appLoadFileToString(class FString &,unsigned short const *,class FFileManager *,unsigned long,int) 1014c630
//void CDECL appMD5Decode(unsigned long *,unsigned char *,int) 101472f0
//void CDECL appMD5Encode(unsigned char *,unsigned long *,int) 101472a0
//void CDECL appMD5Final(unsigned char *,struct FMD5Context *) 10148ed0
//void CDECL appMD5Init(struct FMD5Context *) 10147250
//void CDECL appMD5Transform(unsigned long *,unsigned char *) 10147ea0
//void CDECL appMD5Update16(struct FMD5Context *,unsigned short) 1014aa50
//void CDECL appMD5Update32(struct FMD5Context *,int) 1014aa10
//void CDECL appMD5Update32(struct FMD5Context *,unsigned long) 1014aa30
//void CDECL appMD5Update(struct FMD5Context *,unsigned char *,int) 10148e20
//unsigned long CDECL appMemCrc(void const *,int,unsigned long) 101470d0
//int CDECL appMemIsZero(void const *,int) 10124e80
//int CDECL appMemcmp(void const *,void const *,int) 10124e60
//void * CDECL appMemmove(void *,void const *,int) 10124eb0
//void CDECL appMemset(void *,int,int) 10124ec0
//void CDECL appMemswap(void *,void *,unsigned long) 10147080
//int const CDECL appMsgf(int,unsigned short const *,...) 1016f560
//unsigned short const * CDECL appPackage(void) 10170090
//void CDECL appPreExit(void) 1014a580
//void CDECL appPrintf(unsigned short const *) 10170550
//void CDECL appQsort(void *,int,int,int (__cdecl*)(void const *,void const *)) 101250d0
//unsigned short * CDECL appQtoa(unsigned __int64,int) 10125090
//int CDECL appRandRange(int,int) 10124d50
//void CDECL appRequestExit(int) 1016e9a0
//float CDECL appSRand(void) 10124e10
//void CDECL appSRandInit(int) 10124e00
//int CDECL appSaveArrayToFile(class TArray<unsigned char> const &,unsigned short const *,class FFileManager *,unsigned long,int) 1014a420
//int CDECL appSaveStringToFile(class FString const &,unsigned short const *,class FFileManager *,unsigned long,int) 1014b050
//double CDECL appSeconds(void) 1016f790
//double CDECL appSecondsSlow(void) 1016f8a0
//void CDECL appSleep(float) 1016f7f0
//unsigned short const * CDECL appSpc(int) 10148d80
//int CDECL appSprintf(unsigned short *,unsigned short const *,...) 10124f20
//unsigned short * CDECL appStaticString1024(void) 10148c30
//unsigned long CDECL appStrCrc(unsigned short const *) 10147110
//unsigned long CDECL appStrCrcCaps(unsigned short const *) 10147180
//int CDECL appStrPrefix(unsigned short const *,unsigned short const *) 10147020
//unsigned short * CDECL appStrcat(unsigned short *,unsigned short const *) 10124fa0
//unsigned short * CDECL appStrchr(unsigned short const *,int) 10124f90
//int CDECL appStrcmp(unsigned short const *,unsigned short const *) 10124fb0
//unsigned short * CDECL appStrcpy(unsigned short *,unsigned short const *) 10124fd0
//unsigned short const * CDECL appStrfind(unsigned short const *,unsigned short const *) 10148c70
//int CDECL appStricmp(unsigned short const *,unsigned short const *) 10124fc0
//int CDECL appStrlen(unsigned short const *) 10124f70
//unsigned short * CDECL appStrncat(unsigned short *,unsigned short const *,int) 10125220
//int CDECL appStrncmp(unsigned short const *,unsigned short const *,int) 10125060
//unsigned short * CDECL appStrncpy(unsigned short *,unsigned short const *,int) 10124ef0
//int CDECL appStrnicmp(unsigned short const *,unsigned short const *,int) 10125070
//unsigned short * CDECL appStrstr(unsigned short const *,unsigned short const *) 10124f80
//int CDECL appStrtoi(unsigned short const *,unsigned short * *,int) 10125050
//unsigned __int64 CDECL appStrtoq(unsigned short const *,unsigned short * *,int) 10125080
//unsigned short * CDECL appStrupr(unsigned short *) 10124fe0
//void CDECL appSystemTime(int &,int &,int &,int &,int &,int &,int &,int &) 1016f830
//void CDECL appThrowf(unsigned short const *,...) 10147340
//unsigned short const * CDECL appTimestamp(void) 101250e0
//char const * CDECL appToAnsi(unsigned short const *,char *,int) 1014a7b0
//unsigned short const * CDECL appToUnicode(unsigned short const *,unsigned short *,int) 101477d0
//void CDECL appTrimSpaces(char *) 10148dd0
//void CDECL appUnwindf(unsigned short const *,...) 10148890
//int CDECL appUpdateFileModTime(unsigned short *) 1014a370
//unsigned short const * CDECL appUserName(void) 1016ffc0
//class d_console::clog debugLog 101dbf40
//class FCriticalSection * gethostbyname_mutex 102147e0
//unsigned int qRandSeed 101d6810
//class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > `public: FString::operator class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > &(void)'::`2'::s_EmptyString 101fc10c
//class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > `public: FString::operator class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > const &(void)const '::`2'::s_EmptyString 101fc0e8
//unsigned short * CDECL winAnsiToTCHAR(char *) 1016e950
//int CDECL winGetSizeANSI(unsigned short const *) 1016e8f0
//int CDECL winGetSizeUNICODE(char const *) 1016e930
//char * CDECL winToANSI(char *,unsigned short const *,int) 1016e890
//char * CDECL winToOEM(char *,unsigned short const *,int) 1016e8c0
//unsigned short * CDECL winToUNICODE(unsigned short *,char const *,int) 1016e910
//_DllMain@12 10101160
//GIsMMX 101dbf1c
//GIsSSE 101dbf20
//GIsSSE2 101dbf24

#ifndef NAMES_ONLY
#undef AUTOGENERATE_NAME
#undef AUTOGENERATET_FUNCTION
#undef AUTOGENERATE_CLASS
#undef AUTOGENERATE_PACKAGE
#endif NAMES_ONLY

#if _MSC_VER
#pragma pack (pop)
#endif

