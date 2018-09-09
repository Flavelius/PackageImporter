#if _MSC_VER
#pragma pack (push,4)
#endif

#ifndef NAMES_ONLY
#define AUTOGENERATE_NAME(name) extern DLL_IMPORT FName WINDRV_##name;
#define AUTOGENERATE_FUNCTION(cls,num,func) \
  extern DLL_IMPORT Native int##cls##func;
#define AUTOGENERATE_CLASS(TClass) \
  extern DLL_IMPORT UClass* autoclass##TClass;
#define AUTOGENERATE_PACKAGE(pkg) \
  extern DLL_IMPORT TCHAR GPackage[];
#endif


//------------------------------------------------------------------------------
//  WindowsViewport
//------------------------------------------------------------------------------

// UWindowsViewport 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UWindowsViewport : public UViewport/*,FExec*/ /*,FOutputDevice*/  {
  public:
    char Unknown0[132];
    //virtual int Exec(unsigned short const *,class FOutputDevice &);
    virtual ~UWindowsViewport(void);
    virtual void Destroy(void);
    virtual void Serialize(class FArchive &);
    virtual void ShutdownAfterError(void);
    virtual unsigned int GetCPPSize(void);
    virtual int Lock(unsigned char *,int *);
    virtual void Unlock(void);
    virtual int IsFullscreen(void);
    virtual int ResizeViewport(unsigned long,int,int,int);
    virtual void SetModeCursor(void);
    virtual void UpdateWindowFrame(void);
    virtual void OpenWindow(unsigned long,int,int,int,int,int);
    virtual void CloseWindow(void);
    virtual void UpdateInput(int,float);
    virtual void * GetWindow(void);
    virtual void UpdateMousePosition(void);
    virtual void SetMouseCapture(int,int,int);
    virtual void Repaint(int);
    virtual int TryRenderDevice(unsigned short const *,int,int,int);
    virtual unsigned short * GetLocalizedKeyName(enum EInputKey);
    virtual void MovieEncodeStart(class FString,float,int,int);
    virtual void MovieEncodeFrame(void);
    virtual void MovieEncodeStop(void);
    virtual int UsingHardwareCursor(void)const ;
    virtual int HardwareCursorAvailable(void)const ;
    virtual void SetHardwareCursorTexture(int,int,class UTexture *);
    UWindowsViewport(class UWindowsViewport const &);
    UWindowsViewport(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UWindowsViewport & operator=(class UWindowsViewport const &);
    void AttachDebugger(void);
    int CauseInputEvent(int,enum EInputAction,float);
    static struct IDirectInput8W * DirectInput8;
    void EndFullscreen(void);
    static int STDCALL EnumAxesCallback(struct DIDEVICEOBJECTINSTANCEW const *,void *);
    static int STDCALL EnumJoysticksCallback(struct DIDEVICEINSTANCEW const *,void *);
    class UWindowsClient * GetOuterUWindowsClient(void)const ;
    unsigned long GetViewportButtonFlags(unsigned long);
    static void CDECL InternalConstructor(void *);
    static struct IDirectInputDevice8W * Joystick;
    static struct DIDEVCAPS JoystickCaps;
    static struct IDirectInputDevice8W * Mouse;
    void SetTopness(void);
    static class UClass * CDECL StaticClass(void);
    void ToggleFullscreen(void);
    long ViewportWndProc(unsigned int,unsigned int,long);
  private:
    static class UClass PrivateStaticClass;
    void UpdateHardwareCursor(void);
};


//------------------------------------------------------------------------------
//  WindowsClient
//------------------------------------------------------------------------------

// UWindowsClient 1E ( CLASS_Compiled CLASS_Config CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UWindowsClient : public UClient/*,FNotifyHook*/  {
  public:
    char Unknown0[4];
    BITFIELD UseJoystick : 1;  // C4 4000 CPF_Config
    BITFIELD StartupFullscreen : 1;  // C8 4000 CPF_Config
    BITFIELD UseSpeechRecognition : 1;  // CC 4000 CPF_Config
    FLOAT MouseXMultiplier;  // D0 4000 CPF_Config
    FLOAT MouseYMultiplier;  // D4 4000 CPF_Config
    BITFIELD UseHardwareCursor : 1;  // D8 4000 CPF_Config
    char Unknown1[56];
    //virtual void Destroy(void);
    //virtual void ShutdownAfterError(void);
    //virtual void PostEditChange(void);
    //virtual unsigned int GetCPPSize(void);
    //virtual void Init(class UEngine *);
    //virtual void ShowViewportWindows(unsigned long,int);
    //virtual void EnableViewportWindows(unsigned long,int);
    //virtual void Tick(void);
    //virtual int Exec(unsigned short const *,class FOutputDevice &);
    //virtual class UViewport * NewViewport(class FName);
    //virtual void MakeCurrent(class UViewport *);
    //virtual class UViewport * GetLastCurrent(void);
    virtual ~UWindowsClient(void);
    virtual void NotifyDestroy(void *);
    UWindowsClient(class UWindowsClient const &);
    UWindowsClient(void);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,unsigned short const *,unsigned long);
    static void * CDECL operator new(unsigned int,class UObject *,class FName,unsigned long);
    static void * CDECL operator new(unsigned int,enum EInternal *);
    class UWindowsClient & operator=(class UWindowsClient const &);
    static void CDECL InternalConstructor(void *);
    static class UClass * CDECL StaticClass(void);
    void StaticConstructor(void);
  private:
    static class UClass PrivateStaticClass;
};



//------------------------------------------------------------------------------
//  UDebuggerCore
//------------------------------------------------------------------------------

class DLL_IMPORT UDebuggerCore {
  public:
    virtual ~UDebuggerCore(void);
    virtual void DebugInfo(class UObject const *,struct FFrame const *,unsigned char,int,int);
    virtual void NotifyGC(void);
    virtual void NotifyAccessedNone(void);
    virtual int NotifyAssertionFailed(int);
    virtual int NotifyInfiniteLoop(void);
    UDebuggerCore(class UDebuggerCore const &);
    UDebuggerCore(class WLog *);
    class UDebuggerCore & operator=(class UDebuggerCore const &);
    void AddWatch(unsigned short const *);
    void Break(void);
    void ChangeState(class FDebuggerState *,int);
    void ClearWatches(void);
    void Close(void);
    void DumpStack(void);
    class FBreakpointManager * GetBreakpointManager(void)const ;
    class FCallStack * GetCallStack(void)const ;
    class FStackNode const * GetCurrentNode(void)const ;
    class FDebuggerState * GetCurrentState(void)const ;
    class UDebuggerInterface * GetInterface(void)const ;
    class UClass * GetStackOwnerClass(struct FFrame const *)const ;
    void Initialize(void);
    int IsInitialized(void)const ;
    void LoadEditPackages(void);
    void ProcessInput(enum EUserAction);
    void ProcessPendingState(void);
    void RemoveWatch(unsigned short const *);
    void SetBreakOnNone(int);
    void SetCondition(unsigned short const *,unsigned short const *);
    void SetDataBreakpoint(unsigned short const *);
    void StackChanged(class FStackNode const *);
    void UpdateInterface(void);
  private:
    void BuildParentChain(int,class TMap<class UClass *,int> &,class UClass *,int);
    unsigned short * GetShortName(class UProperty *);
    void PropertyToWatch(class UProperty *,unsigned char *,int,int,int,unsigned short const *);
    void PropertyToWatch(class UProperty *,unsigned char *,int,int,unsigned short const *);
    void RefreshUserWatches(void);
    void RefreshWatch(class FStackNode const *);
};

//------------------------------------------------------------------------------
//  WWindowsViewportWindow
//------------------------------------------------------------------------------

class DLL_IMPORT WWindowsViewportWindow {
  public:
    virtual ~WWindowsViewportWindow(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual long WndProc(unsigned int,unsigned int,long);
    virtual unsigned short const * GetWClassName(void);
    WWindowsViewportWindow(class WWindowsViewportWindow const &);
    WWindowsViewportWindow(class UWindowsViewport *);
    WWindowsViewportWindow(void);
    class WWindowsViewportWindow & operator=(class WWindowsViewportWindow const &);
};


AUTOGENERATE_CLASS(UWindowsClient)
AUTOGENERATE_CLASS(UWindowsViewport)

AUTOGENERATE_PACKAGE(WinDrv)


//public: void UDebuggerCore::`default constructor closure'(void) 1110b770
//void CDECL DirectInputError(class FString,long,int) 1110ec80
//_DllMain@12 1110ec60

#ifndef NAMES_ONLY
#undef AUTOGENERATE_NAME
#undef AUTOGENERATET_FUNCTION
#undef AUTOGENERATE_CLASS
#undef AUTOGENERATE_PACKAGE
#endif NAMES_ONLY

#if _MSC_VER
#pragma pack (pop)
#endif

