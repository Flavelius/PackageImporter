#if _MSC_VER
#pragma pack (push,4)
#endif

#ifndef NAMES_ONLY
#define AUTOGENERATE_NAME(name) extern DLL_IMPORT FName WINDOW_##name;
#define AUTOGENERATE_FUNCTION(cls,num,func) \
  extern DLL_IMPORT Native int##cls##func;
#define AUTOGENERATE_CLASS(TClass) \
  extern DLL_IMPORT UClass* autoclass##TClass;
#define AUTOGENERATE_PACKAGE(pkg) \
  extern DLL_IMPORT TCHAR GPackage[];
#endif


//------------------------------------------------------------------------------
//  WindowManager
//------------------------------------------------------------------------------

// UWindowManager 1A ( CLASS_Compiled CLASS_Transient CLASS_Parsed )
class DLL_IMPORT UWindowManager : public UObject {
  public:
    char Unknown0[4];
};



//------------------------------------------------------------------------------
//  FCategoryItem
//------------------------------------------------------------------------------

class DLL_IMPORT FCategoryItem {
  public:
    virtual ~FCategoryItem(void);
    virtual void Serialize(class FArchive &);
    virtual void Collapse(void);
    virtual void Expand(void);
    virtual unsigned __int64 GetId(void)const ;
    virtual class FString GetCaption(void)const ;
    FCategoryItem(class FCategoryItem const &);
    FCategoryItem(class WPropertiesBase *,class FTreeItem *,class UClass *,class FName,int);
    class FCategoryItem & operator=(class FCategoryItem const &);
};

//------------------------------------------------------------------------------
//  FClassItem
//------------------------------------------------------------------------------

class DLL_IMPORT FClassItem {
  public:
    virtual ~FClassItem(void);
    virtual void Expand(void);
    virtual unsigned char * GetBase(unsigned char *);
    virtual unsigned char * GetReadAddress(class FPropertyItem *,int);
    virtual void SetProperty(class FPropertyItem *,unsigned short const *);
    FClassItem(class FClassItem const &);
    FClassItem(class WPropertiesBase *,class FTreeItem *,unsigned long,unsigned short const *,class UClass *);
    FClassItem(void);
    class FClassItem & operator=(class FClassItem const &);
};

//------------------------------------------------------------------------------
//  FCommandTarget
//------------------------------------------------------------------------------

class DLL_IMPORT FCommandTarget {
  public:
    virtual void Unused(void);
    FCommandTarget(class FCommandTarget const &);
    FCommandTarget(void);
    class FCommandTarget & operator=(class FCommandTarget const &);
};

//------------------------------------------------------------------------------
//  FConfigItem
//------------------------------------------------------------------------------

class DLL_IMPORT FConfigItem {
  public:
    virtual ~FConfigItem(void);
    virtual void Collapse(void);
    virtual void Expand(void);
    virtual unsigned __int64 GetId(void)const ;
    virtual class FString GetCaption(void)const ;
    FConfigItem(class FConfigItem const &);
    FConfigItem(class FPreferencesInfo const &,class WPropertiesBase *,class FTreeItem *);
    FConfigItem(void);
    class FConfigItem & operator=(class FConfigItem const &);
};

//------------------------------------------------------------------------------
//  FContainer
//------------------------------------------------------------------------------

class DLL_IMPORT FContainer {
  public:
    FContainer(void);
    class FContainer & operator=(class FContainer const &);
    void RefreshControls(void);
    void SetAnchors(class TMap<unsigned long,class FWindowAnchor> *);
};

//------------------------------------------------------------------------------
//  FControlSnoop
//------------------------------------------------------------------------------

class DLL_IMPORT FControlSnoop {
  public:
    virtual void SnoopChar(class WWindow *,int);
    virtual void SnoopKeyDown(class WWindow *,int);
    virtual void SnoopLeftMouseDown(class WWindow *,struct FPoint);
    virtual void SnoopRightMouseDown(class WWindow *,struct FPoint);
    FControlSnoop(class FControlSnoop const &);
    FControlSnoop(void);
    class FControlSnoop & operator=(class FControlSnoop const &);
};

//------------------------------------------------------------------------------
//  FCurrentReferencer
//------------------------------------------------------------------------------

class DLL_IMPORT FCurrentReferencer {
  public:
    FCurrentReferencer(class FCurrentReferencer const &);
    FCurrentReferencer(void);
    ~FCurrentReferencer(void);
    class FCurrentReferencer & operator=(class FCurrentReferencer const &);
};

//------------------------------------------------------------------------------
//  FDelegate
//------------------------------------------------------------------------------

struct DLL_IMPORT FDelegate {
  public:
    virtual void operator()(void);
    FDelegate(struct FDelegate const &);
    FDelegate(class FCommandTarget *,void (__thiscall FCommandTarget::*)(void));
    struct FDelegate & operator=(struct FDelegate const &);
};

//------------------------------------------------------------------------------
//  FDelegateInt
//------------------------------------------------------------------------------

struct DLL_IMPORT FDelegateInt {
  public:
    virtual void operator()(int);
    FDelegateInt(struct FDelegateInt const &);
    FDelegateInt(class FCommandTarget *,void (__thiscall FCommandTarget::*)(int));
    struct FDelegateInt & operator=(struct FDelegateInt const &);
};

//------------------------------------------------------------------------------
//  FDelegateTCHAR
//------------------------------------------------------------------------------

struct DLL_IMPORT FDelegateTCHAR {
  public:
    virtual void operator()(unsigned short const *);
    FDelegateTCHAR(struct FDelegateTCHAR const &);
    FDelegateTCHAR(class FCommandTarget *,void (__thiscall FCommandTarget::*)(unsigned short const *));
    struct FDelegateTCHAR & operator=(struct FDelegateTCHAR const &);
};

//------------------------------------------------------------------------------
//  FDelegateUObject
//------------------------------------------------------------------------------

struct DLL_IMPORT FDelegateUObject {
  public:
    virtual void operator()(class UObject *);
    FDelegateUObject(struct FDelegateUObject const &);
    FDelegateUObject(class FCommandTarget *,void (__thiscall FCommandTarget::*)(class UObject *));
    struct FDelegateUObject & operator=(struct FDelegateUObject const &);
};

//------------------------------------------------------------------------------
//  FDelegateVoid
//------------------------------------------------------------------------------

struct DLL_IMPORT FDelegateVoid {
  public:
    virtual void operator()(void *);
    FDelegateVoid(struct FDelegateVoid const &);
    FDelegateVoid(class FCommandTarget *,void (__thiscall FCommandTarget::*)(void *));
    struct FDelegateVoid & operator=(struct FDelegateVoid const &);
};

//------------------------------------------------------------------------------
//  FHeaderItem
//------------------------------------------------------------------------------

class DLL_IMPORT FHeaderItem {
  public:
    virtual ~FHeaderItem(void);
    virtual void Draw(struct HDC__ *);
    virtual int GetHeight(void);
    virtual void OnItemSetFocus(void);
    virtual void OnItemKillFocus(int);
    virtual void SetValue(unsigned short const *);
    FHeaderItem(class FHeaderItem const &);
    FHeaderItem(class WPropertiesBase *,class FTreeItem *,int);
    FHeaderItem(void);
    class FHeaderItem & operator=(class FHeaderItem const &);
    class FVector FromHSV(unsigned char,unsigned char,unsigned char);
    void OnChooseHSLColorButton(void);
    void OnPickColorButton(void);
    class FVector ToHSL(class FVector);
};

//------------------------------------------------------------------------------
//  FNewObjectItem
//------------------------------------------------------------------------------

class DLL_IMPORT FNewObjectItem {
  public:
    virtual ~FNewObjectItem(void);
    virtual void Draw(struct HDC__ *);
    virtual void OnItemSetFocus(void);
    virtual void OnItemKillFocus(int);
    virtual unsigned __int64 GetId(void)const ;
    virtual class FString GetCaption(void)const ;
    FNewObjectItem(class FNewObjectItem const &);
    FNewObjectItem(class WPropertiesBase *,class FTreeItem *,class UObjectProperty *);
    FNewObjectItem(void);
    class FNewObjectItem & operator=(class FNewObjectItem const &);
    void ComboSelectionEndCancel(void);
    void ComboSelectionEndOk(void);
    void OnNew(void);
};

//------------------------------------------------------------------------------
//  FObjectConfigItem
//------------------------------------------------------------------------------

class DLL_IMPORT FObjectConfigItem {
  public:
    virtual ~FObjectConfigItem(void);
    virtual void Serialize(class FArchive &);
    virtual void OnItemSetFocus(void);
    virtual void Expand(void);
    virtual unsigned char * GetBase(unsigned char *);
    virtual unsigned char * GetReadAddress(class FPropertyItem *,int);
    virtual void SetProperty(class FPropertyItem *,unsigned short const *);
    FObjectConfigItem(class FObjectConfigItem const &);
    FObjectConfigItem(class WPropertiesBase *,class FTreeItem *,unsigned short const *,unsigned short const *,int,class FName);
    class FObjectConfigItem & operator=(class FObjectConfigItem const &);
    void LazyLoadClass(void);
    void OnResetToDefaultsButton(void);
};

//------------------------------------------------------------------------------
//  FObjectsItem
//------------------------------------------------------------------------------

class DLL_IMPORT FObjectsItem {
  public:
    virtual ~FObjectsItem(void);
    virtual void Serialize(class FArchive &);
    virtual void Expand(void);
    virtual unsigned char * GetBase(unsigned char *);
    virtual unsigned char * GetReadAddress(class FPropertyItem *,int);
    virtual void NotifyChange(void);
    virtual void SetProperty(class FPropertyItem *,unsigned short const *);
    virtual class FString GetCaption(void)const ;
    virtual class UObject * GetParentObject(void);
    virtual void SetObjects(class UObject * *,int);
    FObjectsItem(class FObjectsItem const &);
    FObjectsItem(class WPropertiesBase *,class FTreeItem *,unsigned long,unsigned short const *,int,int);
    FObjectsItem(void);
    class FObjectsItem & operator=(class FObjectsItem const &);
    int Eval(class FString,float *);
    class FString GrabChar(class FString *);
    int SubEval(class FString *,float *,int);
    float Val(class FString);
};

//------------------------------------------------------------------------------
//  FPropertyItem
//------------------------------------------------------------------------------

class DLL_IMPORT FPropertyItem {
  public:
    //virtual void SnoopChar(class WWindow *,int);
    virtual ~FPropertyItem(void);
    virtual void Draw(struct HDC__ *);
    virtual int GetHeight(void);
    virtual unsigned long GetTextColor(int);
    virtual void Serialize(class FArchive &);
    virtual int OnSetCursor(void);
    virtual void OnItemSetFocus(void);
    virtual void OnItemKillFocus(int);
    virtual void OnItemLeftMouseDown(struct FPoint);
    virtual void Collapse(void);
    virtual void Expand(void);
    virtual void OnItemDoubleClick(void);
    virtual unsigned char * GetBase(unsigned char *);
    virtual unsigned char * GetContents(unsigned char *);
    virtual unsigned __int64 GetId(void)const ;
    virtual class FString GetCaption(void)const ;
    virtual void SetFocusToItem(void);
    virtual void SetValue(unsigned short const *);
    virtual int IsPropertyItem(void)const ;
    virtual class FString GetToolTipText(void);
    virtual void UpdateExpandable(void);
    virtual void Advance(void);
    virtual void SendToControl(void);
    virtual void ReceiveFromControl(void);
    FPropertyItem(class FPropertyItem const &);
    FPropertyItem(class WPropertiesBase *,class FTreeItem *,class UProperty *,class FName,int,int,int);
    class FPropertyItem & operator=(class FPropertyItem const &);
    void ComboSelectionEndCancel(void);
    void ComboSelectionEndOk(void);
    void GetPropertyText(unsigned short *);
    void OnArrayAdd(void);
    void OnArrayDelete(void);
    void OnArrayEmpty(void);
    void OnArrayInsert(void);
    void OnBrowseButton(void);
    void OnChooseColorButton(void);
    void OnClearButton(void);
    void OnFindButton(void);
    void OnPickColorButton(void);
    void OnTrackBarThumbPosition(void);
    void OnTrackBarThumbTrack(void);
    void OnUseCurrentButton(void);
    static int CDECL RegisterSpecialControl(struct FPropertyItem::SpecialControlRecord const &);
  protected:
    static struct SpecialControlRecord const * CDECL FPropertyItem::NeedsSpecialControl(class UProperty *,class UObject *);
    void OnSpecialControlButton(void);
    static class std::vector<struct SpecialControlRecord,class std::allocator<struct FPropertyItem::SpecialControlRecord> > FPropertyItem::SpecialRecords;
};

//------------------------------------------------------------------------------
//  FPropertyItemBase
//------------------------------------------------------------------------------

class DLL_IMPORT FPropertyItemBase {
  public:
    virtual ~FPropertyItemBase(void);
    virtual void Serialize(class FArchive &);
    virtual void Collapse(void);
    virtual void GetStates(class TArray<class FName> &);
    virtual int AcceptFlags(unsigned long);
    virtual unsigned __int64 GetId(void)const ;
    virtual class FString GetCaption(void)const ;
    FPropertyItemBase(class FPropertyItemBase const &);
    FPropertyItemBase(class WPropertiesBase *,class FTreeItem *,unsigned long,unsigned short const *);
    FPropertyItemBase(void);
    class FPropertyItemBase & operator=(class FPropertyItemBase const &);
};

//------------------------------------------------------------------------------
//  FSBSearch
//------------------------------------------------------------------------------

struct DLL_IMPORT FSBSearch {
  public:
    virtual ~FSBSearch(void);
    virtual void Clear(void);
    virtual void SetupControls(class WWindow *,struct FPoint const &,struct FPoint const &,struct FPoint const &);
  private:
    virtual int EqualsInt(int);
    virtual int EqualsBool(unsigned long);
    virtual int EqualsString(class FString const &);
    virtual int EqualsEnum(unsigned char);
    virtual int EqualsFloat(float);
    virtual int EqualsObject(class UObject *);
    virtual int MatchesObject(class UObject *);
  public:
    FSBSearch(struct FSBSearch const &);
    FSBSearch(void);
    struct FSBSearch & operator=(struct FSBSearch const &);
    int Equals(class UObject *);
  protected:
    void Update(void);
};

//------------------------------------------------------------------------------
//  FSBSearchBoolValue
//------------------------------------------------------------------------------

struct DLL_IMPORT FSBSearchBoolValue {
  public:
    //virtual void Clear(void);
    //virtual void SetupControls(class WWindow *,struct FPoint const &,struct FPoint const &,struct FPoint const &);
    //virtual int EqualsBool(unsigned long);
    virtual ~FSBSearchBoolValue(void);
    FSBSearchBoolValue(struct FSBSearchBoolValue const &);
    FSBSearchBoolValue(void);
    struct FSBSearchBoolValue & operator=(struct FSBSearchBoolValue const &);
    void Update(void);
};

//------------------------------------------------------------------------------
//  FSBSearchEnumValue
//------------------------------------------------------------------------------

struct DLL_IMPORT FSBSearchEnumValue {
  public:
    //virtual void Clear(void);
    //virtual void SetupControls(class WWindow *,struct FPoint const &,struct FPoint const &,struct FPoint const &);
    //virtual int EqualsEnum(unsigned char);
    virtual ~FSBSearchEnumValue(void);
    FSBSearchEnumValue(struct FSBSearchEnumValue const &);
    FSBSearchEnumValue(void);
    struct FSBSearchEnumValue & operator=(struct FSBSearchEnumValue const &);
    void Update(void);
};

//------------------------------------------------------------------------------
//  FSBSearchFloatValue
//------------------------------------------------------------------------------

struct DLL_IMPORT FSBSearchFloatValue {
  public:
    //virtual void Clear(void);
    //virtual void SetupControls(class WWindow *,struct FPoint const &,struct FPoint const &,struct FPoint const &);
    //virtual int EqualsFloat(float);
    virtual ~FSBSearchFloatValue(void);
    FSBSearchFloatValue(struct FSBSearchFloatValue const &);
    FSBSearchFloatValue(void);
    struct FSBSearchFloatValue & operator=(struct FSBSearchFloatValue const &);
    void Update(void);
};

//------------------------------------------------------------------------------
//  FSBSearchIntValue
//------------------------------------------------------------------------------

struct DLL_IMPORT FSBSearchIntValue {
  public:
    //virtual void Clear(void);
    //virtual void SetupControls(class WWindow *,struct FPoint const &,struct FPoint const &,struct FPoint const &);
    //virtual int EqualsInt(int);
    virtual ~FSBSearchIntValue(void);
    FSBSearchIntValue(struct FSBSearchIntValue const &);
    FSBSearchIntValue(void);
    struct FSBSearchIntValue & operator=(struct FSBSearchIntValue const &);
    void Update(void);
};

//------------------------------------------------------------------------------
//  FSBSearchObjectValue
//------------------------------------------------------------------------------

struct DLL_IMPORT FSBSearchObjectValue {
  public:
    //virtual int EqualsString(class FString const &);
    //virtual int EqualsObject(class UObject *);
    virtual ~FSBSearchObjectValue(void);
    FSBSearchObjectValue(struct FSBSearchObjectValue const &);
    FSBSearchObjectValue(void);
    struct FSBSearchObjectValue & operator=(struct FSBSearchObjectValue const &);
};

//------------------------------------------------------------------------------
//  FSBSearchStringValue
//------------------------------------------------------------------------------

struct DLL_IMPORT FSBSearchStringValue {
  public:
    //virtual void Clear(void);
    //virtual void SetupControls(class WWindow *,struct FPoint const &,struct FPoint const &,struct FPoint const &);
    //virtual int EqualsString(class FString const &);
    virtual ~FSBSearchStringValue(void);
    FSBSearchStringValue(struct FSBSearchStringValue const &);
    FSBSearchStringValue(void);
    struct FSBSearchStringValue & operator=(struct FSBSearchStringValue const &);
    void Update(void);
};

//------------------------------------------------------------------------------
//  FTreeItem
//------------------------------------------------------------------------------

class DLL_IMPORT FTreeItem {
  public:
    //virtual void SnoopChar(class WWindow *,int);
    //virtual void SnoopKeyDown(class WWindow *,int);
    virtual ~FTreeItem(void);
    virtual void SetSelected(int);
    virtual struct HBRUSH__ * GetBackgroundBrush(int);
    virtual unsigned long GetTextColor(int);
    virtual void Serialize(class FArchive &);
    virtual int OnSetCursor(void);
    virtual struct FRect GetRect(void);
    virtual void Redraw(void);
    virtual void OnItemSetFocus(void);
    virtual void OnItemKillFocus(int);
    virtual void AddButton(unsigned short const *,struct FDelegate);
    virtual void OnItemLeftMouseDown(struct FPoint);
    virtual void OnItemRightMouseDown(struct FPoint);
    virtual int GetIndentPixels(int);
    virtual struct FRect GetExpanderRect(void);
    virtual int GetSelected(void);
    virtual void DrawTreeLines(struct HDC__ *,struct FRect,int);
    virtual void Collapse(void);
    virtual void Expand(void);
    virtual void ToggleExpansion(void);
    virtual void OnItemDoubleClick(void);
    virtual unsigned char * GetBase(unsigned char *);
    virtual unsigned char * GetContents(unsigned char *);
    virtual unsigned char * GetReadAddress(class FPropertyItem *,int);
    virtual void NotifyChange(void);
    virtual void SetProperty(class FPropertyItem *,unsigned short const *);
    virtual void GetStates(class TArray<class FName> &);
    virtual int AcceptFlags(unsigned long);
    virtual void OnItemHelp(void);
    virtual void SetFocusToItem(void);
    virtual void SetValue(unsigned short const *);
    virtual class UObject * GetParentObject(void);
    virtual int IsPropertyItem(void)const ;
    virtual class FString GetToolTipText(void);
    virtual void ExpandAll(void);
    virtual void UpdateExpandable(void);
    FTreeItem(class FTreeItem const &);
    FTreeItem(class WPropertiesBase *,class FTreeItem *,int);
    FTreeItem(void);
    class FTreeItem & operator=(class FTreeItem const &);
    void EmptyChildren(void);
    int GetIndent(void);
    int GetUnitIndentPixels(void);
    int IsReadOnly(void)const ;
};

//------------------------------------------------------------------------------
//  FTreeItemBase
//------------------------------------------------------------------------------

class DLL_IMPORT FTreeItemBase {
  public:
    FTreeItemBase(class FTreeItemBase const &);
    FTreeItemBase(void);
    class FTreeItemBase & operator=(class FTreeItemBase const &);
};

//------------------------------------------------------------------------------
//  FUDNHelpTopic
//------------------------------------------------------------------------------

class DLL_IMPORT FUDNHelpTopic {
  public:
    FUDNHelpTopic(class FUDNHelpTopic const &);
    FUDNHelpTopic(class FString,class FString);
    FUDNHelpTopic(void);
    ~FUDNHelpTopic(void);
    class FUDNHelpTopic & operator=(class FUDNHelpTopic const &);
};

//------------------------------------------------------------------------------
//  FWaitCursor
//------------------------------------------------------------------------------

class DLL_IMPORT FWaitCursor {
  public:
    FWaitCursor(void);
    ~FWaitCursor(void);
    class FWaitCursor & operator=(class FWaitCursor const &);
    void Restore(void);
};

//------------------------------------------------------------------------------
//  FWindowAnchor
//------------------------------------------------------------------------------

class DLL_IMPORT FWindowAnchor {
  public:
    FWindowAnchor(struct HWND__ *,struct HWND__ *,int,int,int,int,int,int);
    FWindowAnchor(void);
    ~FWindowAnchor(void);
    class FWindowAnchor operator=(class FWindowAnchor const &);
};

//------------------------------------------------------------------------------
//  FWindowsBitmap
//------------------------------------------------------------------------------

class DLL_IMPORT FWindowsBitmap {
  public:
    FWindowsBitmap(int);
    ~FWindowsBitmap(void);
    struct HBITMAP__ * GetBitmapHandle(void);
    int LoadFile(unsigned short const *);
  private:
    void operator=(class FWindowsBitmap &);
};

//------------------------------------------------------------------------------
//  WBitmapButton
//------------------------------------------------------------------------------

class DLL_IMPORT WBitmapButton {
  public:
    virtual ~WBitmapButton(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnDrawItem(struct tagDRAWITEMSTRUCT *);
    virtual void OnDestroy(void);
    virtual unsigned short const * GetWClassName(void);
    virtual void Clicked(void);
    WBitmapButton(class WBitmapButton const &);
    WBitmapButton(class WWindow *,int,struct FDelegate,long (__stdcall*)(struct HWND__ *,unsigned int,unsigned int,long));
    WBitmapButton(void);
    class WBitmapButton & operator=(class WBitmapButton const &);
    void OpenWindow(int,unsigned long,unsigned long,struct HBITMAP__ *,struct FRect,struct FRect,struct FRect);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
};

//------------------------------------------------------------------------------
//  WBrowser
//------------------------------------------------------------------------------

class DLL_IMPORT WBrowser {
  public:
    virtual ~WBrowser(void);
    virtual void Show(int);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnSetFocus(struct HWND__ *);
    virtual void OnSize(unsigned long,int,int);
    virtual void OnCommand(int);
    virtual int OnSysCommand(int);
    virtual void OnPaint(void);
    virtual void OnCreate(void);
    virtual int OnSetCursor(void);
    virtual void OnDestroy(void);
    virtual unsigned short const * GetWClassName(void);
    virtual void OpenWindow(int,int);
    virtual void SetCaption(class FString *);
    virtual class FString GetCaption(void);
    virtual void UpdateMenu(void);
    virtual void PositionChildControls(void);
    virtual class FString GetCurrentPathName(void);
    virtual void RefreshAll(void);
    WBrowser(class WBrowser const &);
    WBrowser(class FName,class WWindow *,struct HWND__ *,int);
    class WBrowser & operator=(class WBrowser const &);
    static int CDECL BrowseClassName(class FString);
    int FormatFilenames(char *);
    int IsDocked(void);
  protected:
    bool EditorDestroy(class UObject *);
    static int CDECL MatchClassHierarchy(class FString,class FString);
};

//------------------------------------------------------------------------------
//  WBrowserEditorBase
//------------------------------------------------------------------------------

class DLL_IMPORT WBrowserEditorBase {
  protected:
    //virtual void NotifyDestroy(void *);
    //virtual void NotifyPreChange(void *);
    //virtual void NotifyPostChange(void *);
    //virtual void NotifyExec(void *,unsigned short const *);
  public:
    virtual ~WBrowserEditorBase(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnCommand(int);
    virtual bool OnClose(void);
    virtual void OnDestroy(void);
    virtual unsigned short const * GetWClassName(void);
    virtual void OpenWindow(int,int);
    virtual void UpdateMenu(void);
    virtual void PositionChildControls(void);
  protected:
    virtual class UObject * GetSelectedObject(void);
    virtual void SetSelectedObject(class UObject *);
    virtual int SavePackages(void);
    virtual void CreateToolBar(void);
    virtual int CheckSave(void);
  public:
    WBrowserEditorBase(class WBrowserEditorBase const &);
    WBrowserEditorBase(class FName,class WWindow *,struct HWND__ *,int,struct HBITMAP__ *,class FNotifyHook *);
    class WBrowserEditorBase & operator=(class WBrowserEditorBase const &);
    static class std::set<class FUseObjectSupplier *,struct std::less<class FUseObjectSupplier *>,class std::allocator<class FUseObjectSupplier *> > const & CDECL GetUseObjectSuppliers(void);
    static int CDECL IsPackageLocked(class UPackage *);
    static class FString CDECL ObjectIsLockedFunc(class UObject const *);
    static void CDECL RegisterUseObjectSupplier(class FUseObjectSupplier *);
    static int CDECL ShouldLockControls(class UObject *);
    static void CDECL UnregisterUseObjectSupplier(class FUseObjectSupplier *);
  protected:
    static int CDECL BrowseClassName(class FString);
    void EnableSavePackagesButton(bool);
    int LoadPackages(class TArray<class FString> const &,int,void (__cdecl*)(unsigned short const *));
    void ResetObjectList(class UClass *);
    static class UClass * CDECL SelectSubclass(class UClass *);
    void SetupSearchBox(void);
    void UpdateObjectList(void);
  private:
    void OnSearch(void);
    static class std::set<class FUseObjectSupplier *,struct std::less<class FUseObjectSupplier *>,class std::allocator<class FUseObjectSupplier *> > UseObjectSuppliers;
};

//------------------------------------------------------------------------------
//  WButton
//------------------------------------------------------------------------------

class DLL_IMPORT WButton {
  public:
    virtual ~WButton(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual int InterceptControlCommand(unsigned int,unsigned int,long);
    virtual void OnDrawItem(struct tagDRAWITEMSTRUCT *);
    virtual unsigned short const * GetWClassName(void);
    virtual void Clicked(void);
    WButton(class WButton const &);
    WButton(class WWindow *,int,struct FDelegate,long (__stdcall*)(struct HWND__ *,unsigned int,unsigned int,long));
    WButton(void);
    class WButton & operator=(class WButton const &);
    int IsChecked(void);
    void OpenWindow(int,int,int,int,int,unsigned short const *,int,unsigned long);
    void SetBitmap(struct HBITMAP__ *);
    void SetCheck(int);
    void SetVisibleText(unsigned short const *);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
};

//------------------------------------------------------------------------------
//  WCheckBox
//------------------------------------------------------------------------------

class DLL_IMPORT WCheckBox {
  public:
    virtual ~WCheckBox(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnCreate(void);
    virtual void OnRightButtonDown(void);
    virtual unsigned short const * GetWClassName(void);
    virtual void Clicked(void);
    WCheckBox(class WCheckBox const &);
    WCheckBox(class WWindow *,int,struct FDelegate);
    WCheckBox(void);
    class WCheckBox & operator=(class WCheckBox const &);
    void OpenWindow(int,int,int,int,int,unsigned short const *,int,int,unsigned long);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
};

//------------------------------------------------------------------------------
//  WCheckListBox
//------------------------------------------------------------------------------

class DLL_IMPORT WCheckListBox {
  public:
    virtual ~WCheckListBox(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnDrawItem(struct tagDRAWITEMSTRUCT *);
    virtual void OnLeftButtonDown(void);
    virtual void OnDestroy(void);
    virtual unsigned short const * GetWClassName(void);
    WCheckListBox(class WCheckListBox const &);
    WCheckListBox(class WWindow *,int,long (__stdcall*)(struct HWND__ *,unsigned int,unsigned int,long));
    WCheckListBox(void);
    class WCheckListBox & operator=(class WCheckListBox const &);
    void OpenWindow(int,int,int,int,unsigned long);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
};

//------------------------------------------------------------------------------
//  WClassProperties
//------------------------------------------------------------------------------

class DLL_IMPORT WClassProperties {
  public:
    virtual ~WClassProperties(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual unsigned short const * GetWClassName(void);
    virtual class FTreeItem * GetRoot(void);
    WClassProperties(class WClassProperties const &);
    WClassProperties(class FName,unsigned long,unsigned short const *,class UClass *);
    WClassProperties(void);
    class WClassProperties & operator=(class WClassProperties const &);
};

//------------------------------------------------------------------------------
//  WColorButton
//------------------------------------------------------------------------------

class DLL_IMPORT WColorButton {
  public:
    virtual ~WColorButton(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnDrawItem(struct tagDRAWITEMSTRUCT *);
    virtual unsigned short const * GetWClassName(void);
    WColorButton(class WColorButton const &);
    WColorButton(class WWindow *,int,struct FDelegate,long (__stdcall*)(struct HWND__ *,unsigned int,unsigned int,long));
    WColorButton(void);
    class WColorButton & operator=(class WColorButton const &);
    void GetColor(int &,int &,int &);
    void OpenWindow(int,unsigned long);
    void SetColor(int,int,int);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
};

//------------------------------------------------------------------------------
//  WComboBox
//------------------------------------------------------------------------------

class DLL_IMPORT WComboBox {
  public:
    virtual ~WComboBox(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual long WndProc(unsigned int,unsigned int,long);
    virtual int InterceptControlCommand(unsigned int,unsigned int,long);
    virtual unsigned short const * GetWClassName(void);
    virtual int AddString(unsigned short const *);
    virtual void RemoveString(int);
    virtual class FString GetString(int);
    virtual int GetCount(void);
    virtual void SetCurrent(unsigned short const *);
    virtual void SetCurrent(int);
    virtual int GetCurrent(void);
    virtual int FindString(unsigned short const *);
    virtual int FindStringExact(unsigned short const *);
    WComboBox(class WComboBox const &);
    WComboBox(class WWindow *,int,long (__stdcall*)(struct HWND__ *,unsigned int,unsigned int,long));
    WComboBox(void);
    class WComboBox & operator=(class WComboBox const &);
    void Empty(void);
    void * GetItemData(int);
    void OpenWindow(int,int,unsigned int);
    void SetItemData(int,int);
    void SetItemData(int,void *);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
};

//------------------------------------------------------------------------------
//  WConfigProperties
//------------------------------------------------------------------------------

class DLL_IMPORT WConfigProperties {
  public:
    virtual ~WConfigProperties(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual unsigned short const * GetWClassName(void);
    virtual class FTreeItem * GetRoot(void);
    WConfigProperties(class WConfigProperties const &);
    WConfigProperties(class FName,unsigned short const *);
    WConfigProperties(void);
    class WConfigProperties & operator=(class WConfigProperties const &);
};

//------------------------------------------------------------------------------
//  WControl
//------------------------------------------------------------------------------

class DLL_IMPORT WControl {
  public:
    virtual ~WControl(void);
    virtual long CallDefaultProc(unsigned int,unsigned int,long);
    WControl(class WControl const &);
    WControl(class WWindow *,int,long (__stdcall*)(struct HWND__ *,unsigned int,unsigned int,long));
    WControl(void);
    class WControl & operator=(class WControl const &);
    typedef long (__stdcall*CDECL RegisterWindowClass(unsigned short const *,unsigned short const *))(struct HWND__ *,unsigned int,unsigned int,long);
};

//------------------------------------------------------------------------------
//  WCoolButton
//------------------------------------------------------------------------------

class DLL_IMPORT WCoolButton {
  public:
    virtual ~WCoolButton(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnDestroy(void);
    virtual unsigned short const * GetWClassName(void);
    WCoolButton(class WCoolButton const &);
    WCoolButton(class WWindow *,int,struct FDelegate,unsigned long);
    WCoolButton(void);
    class WCoolButton & operator=(class WCoolButton const &);
    static class WCoolButton * GlobalCoolButton;
    void OpenWindow(int,int,int,int,int,unsigned short const *);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
};

//------------------------------------------------------------------------------
//  WCrashBoxDialog
//------------------------------------------------------------------------------

class DLL_IMPORT WCrashBoxDialog {
  public:
    virtual ~WCrashBoxDialog(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnCopy(void);
    virtual void OnInitDialog(void);
    virtual unsigned short const * GetWClassName(void);
    WCrashBoxDialog(class WCrashBoxDialog const &);
    WCrashBoxDialog(unsigned short const *,unsigned short const *);
    WCrashBoxDialog(void);
    class WCrashBoxDialog & operator=(class WCrashBoxDialog const &);
    void OnBugReport(void);
};

//------------------------------------------------------------------------------
//  WCustomLabel
//------------------------------------------------------------------------------

class DLL_IMPORT WCustomLabel {
  public:
    virtual ~WCustomLabel(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnPaint(void);
    virtual unsigned short const * GetWClassName(void);
    WCustomLabel(class WCustomLabel const &);
    WCustomLabel(class WWindow *,int,long (__stdcall*)(struct HWND__ *,unsigned int,unsigned int,long));
    WCustomLabel(void);
    class WCustomLabel & operator=(class WCustomLabel const &);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
};

//------------------------------------------------------------------------------
//  WDialog
//------------------------------------------------------------------------------

class DLL_IMPORT WDialog {
  public:
    virtual ~WDialog(void);
    virtual void Show(int);
    virtual long CallDefaultProc(unsigned int,unsigned int,long);
    virtual void OnInitDialog(void);
    virtual bool OnClose(void);
    virtual int DoModal(struct HINSTANCE__ *);
    virtual void LocalizeText(unsigned short const *,unsigned short const *);
    WDialog(class WDialog const &);
    WDialog(class FName,int,class WWindow *);
    WDialog(void);
    class WDialog & operator=(class WDialog const &);
    void CenterInOwnerWindow(void);
    void CenterOnDesktop(void);
    void EndDialog(int);
    void EndDialogFalse(void);
    void EndDialogTrue(void);
    static int STDCALL LocalizeTextEnumProc(struct HWND__ *,long);
    void OpenChildWindow(int,int);
};

//------------------------------------------------------------------------------
//  WDragInterceptor
//------------------------------------------------------------------------------

class DLL_IMPORT WDragInterceptor {
  public:
    virtual ~WDragInterceptor(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnKeyDown(unsigned short);
    virtual void OnReleaseCapture(void);
    virtual void OnMouseMove(unsigned long,struct FPoint);
    virtual void OnLeftButtonUp(void);
    virtual unsigned short const * GetWClassName(void);
    virtual void OpenWindow(void);
    virtual void ToggleDraw(struct HDC__ *);
    WDragInterceptor(class WDragInterceptor const &);
    WDragInterceptor(class WWindow *,struct FPoint,struct FRect,struct FPoint);
    WDragInterceptor(void);
    class WDragInterceptor & operator=(class WDragInterceptor const &);
};

//------------------------------------------------------------------------------
//  WEdit
//------------------------------------------------------------------------------

class DLL_IMPORT WEdit {
  public:
    virtual ~WEdit(void);
    virtual void Enable(int);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual int InterceptControlCommand(unsigned int,unsigned int,long);
    virtual unsigned short const * GetWClassName(void);
    WEdit(class WEdit const &);
    WEdit(class WWindow *,int,long (__stdcall*)(struct HWND__ *,unsigned int,unsigned int,long));
    WEdit(void);
    class WEdit & operator=(class WEdit const &);
    int GetLineCount(void);
    int GetLineIndex(int);
    int GetModify(void);
    int GetReadOnly(void);
    void GetSelection(int &,int &);
    void OpenWindow(int,int,int,int,int);
    void ScrollCaret(void);
    void SetModify(int);
    void SetReadOnly(int);
    void SetSelectedText(unsigned short const *);
    void SetSelection(int,int);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
};

//------------------------------------------------------------------------------
//  WEditTerminal
//------------------------------------------------------------------------------

class DLL_IMPORT WEditTerminal {
  public:
    virtual ~WEditTerminal(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnChar(unsigned short);
    virtual void OnPaste(void);
    virtual void OnUndo(void);
    virtual void OnRightButtonDown(void);
    virtual unsigned short const * GetWClassName(void);
    WEditTerminal(class WEditTerminal const &);
    WEditTerminal(class WTerminalBase *);
    class WEditTerminal & operator=(class WEditTerminal const &);
};

//------------------------------------------------------------------------------
//  WGroupBox
//------------------------------------------------------------------------------

class DLL_IMPORT WGroupBox {
  public:
    virtual ~WGroupBox(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual unsigned short const * GetWClassName(void);
    WGroupBox(class WGroupBox const &);
    WGroupBox(class WWindow *,int,long (__stdcall*)(struct HWND__ *,unsigned int,unsigned int,long));
    WGroupBox(void);
    class WGroupBox & operator=(class WGroupBox const &);
    void OpenWindow(int,unsigned long);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
};

//------------------------------------------------------------------------------
//  WItemBox
//------------------------------------------------------------------------------

class DLL_IMPORT WItemBox {
  public:
    virtual ~WItemBox(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual int OnEraseBkgnd(void);
    virtual void OnDrawItem(struct tagDRAWITEMSTRUCT *);
    virtual void OnMeasureItem(struct tagMEASUREITEMSTRUCT *);
    virtual unsigned short const * GetWClassName(void);
    WItemBox(class WItemBox const &);
    WItemBox(class WWindow *,int);
    WItemBox(void);
    class WItemBox & operator=(class WItemBox const &);
};

//------------------------------------------------------------------------------
//  WLabel
//------------------------------------------------------------------------------

class DLL_IMPORT WLabel {
  public:
    virtual ~WLabel(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual unsigned short const * GetWClassName(void);
    WLabel(class WLabel const &);
    WLabel(class WWindow *,int,long (__stdcall*)(struct HWND__ *,unsigned int,unsigned int,long));
    WLabel(void);
    class WLabel & operator=(class WLabel const &);
    void OpenWindow(int,int,unsigned long);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
};

//------------------------------------------------------------------------------
//  WListBox
//------------------------------------------------------------------------------

class DLL_IMPORT WListBox {
  public:
    virtual ~WListBox(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual int InterceptControlCommand(unsigned int,unsigned int,long);
    virtual void OnRightButtonDown(void);
    virtual unsigned short const * GetWClassName(void);
    WListBox(class WListBox const &);
    WListBox(class WWindow *,int,long (__stdcall*)(struct HWND__ *,unsigned int,unsigned int,long));
    WListBox(void);
    class WListBox & operator=(class WListBox const &);
    int AddItem(void const *);
    int AddString(unsigned short const *);
    void ClearSel(void);
    void DeleteString(int);
    void Empty(void);
    int FindItem(void const *);
    int FindItemChecked(void const *);
    int FindString(unsigned short const *);
    int FindStringChecked(unsigned short const *);
    int FindStringExact(unsigned short const *);
    int GetCount(void);
    int GetCurrent(void);
    void * GetItemData(int);
    int GetItemHeight(int);
    struct FRect GetItemRect(int);
    int GetSelected(int);
    int GetSelectedCount(void);
    int GetSelectedItems(int,int *);
    class FString GetString(int);
    int GetTop(void);
    void InsertItem(int,void const *);
    void InsertItemAfter(void const *,void const *);
    void InsertString(int,unsigned short const *);
    void InsertStringAfter(unsigned short const *,unsigned short const *);
    int ItemFromPoint(struct FPoint);
    void OpenWindow(int,int,int,int,int,unsigned long);
    int SetCurrent(int,int);
    void SetItemData(int,int);
    void SetItemData(int,void *);
    void SetTop(int);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
};

//------------------------------------------------------------------------------
//  WListView
//------------------------------------------------------------------------------

class DLL_IMPORT WListView {
  public:
    virtual ~WListView(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual int InterceptControlCommand(unsigned int,unsigned int,long);
    virtual unsigned short const * GetWClassName(void);
    WListView(class WListView const &);
    WListView(class WWindow *,int,long (__stdcall*)(struct HWND__ *,unsigned int,unsigned int,long));
    WListView(void);
    class WListView & operator=(class WListView const &);
    int DeleteColumn(int);
    int DeleteItem(int);
    void Empty(void);
    void EnableMultipleSelect(int);
    int GetCount(void);
    int GetCurrent(void);
    void GetItem(struct tagLVITEMW *);
    void * GetItemData(int,int);
    class FString GetItemString(int,int);
    int GetLastClickedColumn(void);
    int GetLastSortedColumn(void);
    int InsertColumn(int,struct tagLVCOLUMNW const *);
    int InsertItem(struct tagLVITEMW const *);
    int IsRowSelected(int);
    void OpenWindow(int,unsigned long);
    void SelectAll(int);
    void SelectHitItem(bool);
    void SelectRow(int,int);
    int SetItem(struct tagLVITEMW const *);
    void SetLastSortedColumn(int);
    void SortItems(int (__stdcall*)(long,long,long),unsigned long);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
    void UpdateColumn(int,struct tagLVCOLUMNW const *);
};

//------------------------------------------------------------------------------
//  WLog
//------------------------------------------------------------------------------

class DLL_IMPORT WLog {
  public:
    virtual ~WLog(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual long WndProc(unsigned int,unsigned int,long);
    virtual void SetText(unsigned short const *);
    virtual void OnCopyData(struct HWND__ *,struct tagCOPYDATASTRUCT *);
    virtual void OnCommand(int);
    virtual void OnShowWindow(int);
    virtual void OnCreate(void);
    virtual bool OnClose(void);
    virtual void OnDestroy(void);
    virtual unsigned short const * GetWClassName(void);
    WLog(class WLog const &);
    WLog(unsigned short const *,class FArchive * &,class FName,class WWindow *);
    WLog(void);
    void OpenWindow(int,int);
};

//------------------------------------------------------------------------------
//  WObjectProperties
//------------------------------------------------------------------------------

class DLL_IMPORT WObjectProperties {
  public:
    virtual ~WObjectProperties(void);
    virtual void Enable(int);
    virtual void Show(int);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void SetText(unsigned short const *);
    virtual unsigned short const * GetWClassName(void);
    virtual class FTreeItem * GetRoot(void);
    virtual void SetReadOnly(int);
    WObjectProperties(class WObjectProperties const &);
    WObjectProperties(class FName,unsigned long,unsigned short const *,class WWindow *,int);
    WObjectProperties(void);
    class WObjectProperties & operator=(class WObjectProperties const &);
    void SetObjectLocked(int);
};

//------------------------------------------------------------------------------
//  WPictureButton
//------------------------------------------------------------------------------

class DLL_IMPORT WPictureButton {
  public:
    virtual ~WPictureButton(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnSize(unsigned long,int,int);
    virtual void OnPaint(void);
    virtual void OnLeftButtonDown(void);
    virtual void OnDestroy(void);
    virtual unsigned short const * GetWClassName(void);
    WPictureButton(class WPictureButton const &);
    WPictureButton(class WWindow *);
    class WPictureButton & operator=(class WPictureButton const &);
    void OpenWindow(void);
    void SetUp(class FString,int,int,int,int,int,struct HBITMAP__ *,int,int,int,int,struct HBITMAP__ *,int,int,int,int);
};

//------------------------------------------------------------------------------
//  WProgressBar
//------------------------------------------------------------------------------

class DLL_IMPORT WProgressBar {
  public:
    virtual ~WProgressBar(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual unsigned short const * GetWClassName(void);
    WProgressBar(class WProgressBar const &);
    WProgressBar(class WWindow *,int,long (__stdcall*)(struct HWND__ *,unsigned int,unsigned int,long));
    WProgressBar(void);
    class WProgressBar & operator=(class WProgressBar const &);
    void OpenWindow(int);
    void SetProgress(__int64,__int64);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
};

//------------------------------------------------------------------------------
//  WProperties
//------------------------------------------------------------------------------

class DLL_IMPORT WProperties {
  public:
    //virtual void SnoopChar(class WWindow *,int);
    //virtual void SnoopKeyDown(class WWindow *,int);
    //virtual void SnoopLeftMouseDown(class WWindow *,struct FPoint);
    //virtual void SnoopRightMouseDown(class WWindow *,struct FPoint);
    virtual ~WProperties(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned short const * GetPackageName(void);
    virtual void DoDestroy(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnSize(unsigned long,int,int);
    virtual void OnActivate(int);
    virtual void OnPaint(void);
    virtual void OnFinishSplitterDrag(class WDragInterceptor *,int);
    virtual int OnSetCursor(void);
    virtual void OnDestroy(void);
    virtual void SetItemFocus(int);
    virtual void SetValue(unsigned short const *);
    virtual unsigned short const * GetWClassName(void);
    virtual int GetDividerWidth(void);
    virtual void ResizeList(void);
    virtual void ForceRefresh(void);
    virtual void BeginSplitterDrag(void);
    virtual void ExpandAll(void);
    WProperties(class WProperties const &);
    WProperties(class FName,class WWindow *);
    WProperties(void);
    class WProperties & operator=(class WProperties const &);
    void OnListDoubleClick(void);
    void OnListSelectionChange(void);
    void OpenChildWindow(int);
    void OpenWindow(struct HWND__ *);
    static class TArray<class WProperties *> PropertiesWindows;
};

//------------------------------------------------------------------------------
//  WPropertiesBase
//------------------------------------------------------------------------------

class DLL_IMPORT WPropertiesBase {
  public:
    virtual ~WPropertiesBase(void);
    virtual void SetItemFocus(int);
    virtual void SetValue(unsigned short const *);
    virtual void SetReadOnly(int);
    WPropertiesBase(class WPropertiesBase const &);
    WPropertiesBase(class FName,class WWindow *);
    WPropertiesBase(void);
    class WPropertiesBase & operator=(class WPropertiesBase const &);
    class FTreeItem * GetListItem(int);
    int GetReadOnly(void)const ;
};

//------------------------------------------------------------------------------
//  WPropertyPage
//------------------------------------------------------------------------------

class DLL_IMPORT WPropertyPage {
  public:
    virtual ~WPropertyPage(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual unsigned short const * GetWClassName(void);
    virtual void OpenWindow(int,struct HINSTANCE__ *);
    virtual void Refresh(void);
    WPropertyPage(class WPropertyPage const &);
    WPropertyPage(class WWindow *);
    class WPropertyPage & operator=(class WPropertyPage const &);
    void Cleanup(void);
    void Finalize(void);
    class FString GetCaption(void);
    int GetID(void);
    void PlaceControl(class WControl *);
};

//------------------------------------------------------------------------------
//  WPropertySheet
//------------------------------------------------------------------------------

class DLL_IMPORT WPropertySheet {
  public:
    virtual ~WPropertySheet(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnSize(unsigned long,int,int);
    virtual void OnCreate(void);
    virtual unsigned short const * GetWClassName(void);
    WPropertySheet(class WPropertySheet const &);
    WPropertySheet(class WWindow *,int,long (__stdcall*)(struct HWND__ *,unsigned int,unsigned int,long));
    WPropertySheet(void);
    class WPropertySheet & operator=(class WPropertySheet const &);
    void AddPage(class WPropertyPage *,class FString *);
    void Empty(void);
    void OnTabsSelChange(void);
    void OpenWindow(int,int,unsigned long);
    void RefreshPages(void);
    int SetCurrent(int);
    int SetCurrent(class WPropertyPage *);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
};

//------------------------------------------------------------------------------
//  WQueryOptionsDialog
//------------------------------------------------------------------------------

class DLL_IMPORT WQueryOptionsDialog {
  public:
    virtual ~WQueryOptionsDialog(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnInitDialog(void);
    virtual unsigned short const * GetWClassName(void);
    WQueryOptionsDialog(class WQueryOptionsDialog const &);
    WQueryOptionsDialog(unsigned short const *,class std::vector<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >,class std::allocator<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > > > const &,unsigned long,unsigned long *);
    void OnCancel(void);
    void OnItemSelChange(void);
    void OnOK(void);
};

//------------------------------------------------------------------------------
//  WQueryStringDialog
//------------------------------------------------------------------------------

class DLL_IMPORT WQueryStringDialog {
  public:
    virtual ~WQueryStringDialog(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnInitDialog(void);
    virtual unsigned short const * GetWClassName(void);
    WQueryStringDialog(class WQueryStringDialog const &);
    WQueryStringDialog(unsigned short const *,unsigned short const *,unsigned short const *,class FString *);
    class WQueryStringDialog & operator=(class WQueryStringDialog const &);
    void OnCancel(void);
    void OnOK(void);
};

//------------------------------------------------------------------------------
//  WRichEdit
//------------------------------------------------------------------------------

class DLL_IMPORT WRichEdit {
  public:
    virtual ~WRichEdit(void);
    virtual void Enable(int);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual int InterceptControlCommand(unsigned int,unsigned int,long);
    virtual unsigned short const * GetWClassName(void);
    WRichEdit(class WRichEdit const &);
    WRichEdit(class WWindow *,int,long (__stdcall*)(struct HWND__ *,unsigned int,unsigned int,long));
    WRichEdit(void);
    class WRichEdit & operator=(class WRichEdit const &);
    void OpenWindow(int,int);
    void SetReadOnly(int);
    void SetTextLimit(int);
    void StreamTextIn(char *,int);
    void StreamTextOut(char *,int);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
};

//------------------------------------------------------------------------------
//  WSBObjectList
//------------------------------------------------------------------------------

class DLL_IMPORT WSBObjectList {
  public:
    virtual ~WSBObjectList(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnCreate(void);
    virtual unsigned short const * GetWClassName(void);
    virtual void AddObject(class UObject const *,int);
    virtual void GetSelection(class TArray<class UObject *> *);
    virtual int GetIndex(class UObject const *);
    virtual class UObject * GetObjectW(int);
    virtual class FString GetSubItem(int,int);
  protected:
    virtual void DoSort(void);
  public:
    WSBObjectList(class WSBObjectList const &);
    WSBObjectList(class WWindow *,int,class TArray<struct FSBObjectListColumn> const &);
    class WSBObjectList & operator=(class WSBObjectList const &);
    void AddColumn(int,class UProperty *);
    void AddObjects(class TArray<class UObject *> const &,int);
    void AddObjectsOfClass(class UClass const *,int);
    void AddObjectsOfExactClass(class UClass const *,int);
    void BeginUpdate(void);
    void ClearAllColumns(void);
    void ClearAllObjects(void);
    void EndUpdate(void);
    class UProperty * GetColumnType(int);
    class UObject * GetCurrentObject(void);
    void GetSelection(class TArray<int> *);
    int GetSortedAscending(void)const ;
    void OpenWindow(int,int,unsigned long,unsigned long,unsigned long);
    void SelectObject(class UObject const *,int);
    void SortColumn(int,int);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
  protected:
    void InitializeColumn(int);
    void Sort(void);
};

//------------------------------------------------------------------------------
//  WSBObjectSearchDialog
//------------------------------------------------------------------------------

class DLL_IMPORT WSBObjectSearchDialog {
  public:
    virtual ~WSBObjectSearchDialog(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnShowWindow(int);
    virtual void OnInitDialog(void);
    virtual void OnDestroy(void);
    virtual unsigned short const * GetWClassName(void);
    WSBObjectSearchDialog(class WSBObjectSearchDialog const &);
    WSBObjectSearchDialog(class WWindow *,class TArray<class UProperty *> const &,struct FPoint,int,class TArray<struct FSBObjectListColumn> const &,class UClass *,class TArray<class UPackage *> *,class UObject *,int);
    class WSBObjectSearchDialog & operator=(class WSBObjectSearchDialog const &);
    class WSBObjectList * GetList(void);
    class TArray<class UObject *> const & GetMultipleSelection(void)const ;
    class UObject * GetSelection(void);
  protected:
    void OnCancel(void);
    void OnDoubleClick(void);
    void OnOk(void);
    void OnSearch(void);
  private:
    static bool CDECL AllowObject(void *,class UObject const *);
};

//------------------------------------------------------------------------------
//  WSBObjectVirtualList
//------------------------------------------------------------------------------

class DLL_IMPORT WSBObjectVirtualList {
  public:
    virtual ~WSBObjectVirtualList(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual int InterceptControlCommand(unsigned int,unsigned int,long);
    virtual void OnCreate(void);
    virtual unsigned short const * GetWClassName(void);
    virtual void AddObject(class UObject const *,int);
    virtual void GetSelection(class TArray<class UObject *> *);
    virtual int GetIndex(class UObject const *);
    virtual class UObject * GetObjectW(int);
    virtual class FString GetSubItem(int,int);
  protected:
    virtual void DoSort(void);
  public:
    WSBObjectVirtualList(class WSBObjectVirtualList const &);
    WSBObjectVirtualList(class WWindow *,int,class TArray<struct FSBObjectListColumn> const &);
    class WSBObjectVirtualList & operator=(class WSBObjectVirtualList const &);
    void ClearAllObjects(void);
    void OpenWindow(int,int,unsigned long,unsigned long,int);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
};

//------------------------------------------------------------------------------
//  WSBPropertyTabs
//------------------------------------------------------------------------------

class DLL_IMPORT WSBPropertyTabs {
  public:
    virtual ~WSBPropertyTabs(void);
    virtual void Enable(int);
    virtual void Serialize(class FArchive &);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnSize(unsigned long,int,int);
    virtual void OnCommand(int);
    virtual void OnCreate(void);
    virtual void OnDestroy(void);
    virtual unsigned short const * GetWClassName(void);
    WSBPropertyTabs(class WSBPropertyTabs const &);
    WSBPropertyTabs(class WWindow *,class FNotifyHook *);
    class WSBPropertyTabs & operator=(class WSBPropertyTabs const &);
    void AddTab(class FString,class TArray<class FName> const &);
    void AddTabsPerCategory(class UClass *);
    int GetCurrentTab(void)const ;
    class UObject * GetObjectW(void);
    class WObjectProperties * GetSelectedPropertyWindow(void);
    void OpenWindow(int,int,unsigned long,unsigned long);
    void PositionChildControls(void);
    void ResetTabs(void);
    void SetCurrentTab(int);
    void SetObject(class UObject *);
    void SetOnTabsSelChange(class FCommandTarget *,void (__thiscall FCommandTarget::*)(void));
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
  protected:
    void GetClassCategories(class UClass *,class TArray<class FName> &);
    void OnTabsSelChange(void);
    void SetDefaultAnchor(void);
    void SetObjectInternal(void);
};

//------------------------------------------------------------------------------
//  WSBScrollArea
//------------------------------------------------------------------------------

class DLL_IMPORT WSBScrollArea {
  public:
    virtual ~WSBScrollArea(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnSize(unsigned long,int,int);
    virtual void OnVScroll(unsigned int,long);
    virtual void OnHScroll(unsigned int,long);
    virtual void OnPaint(void);
    virtual void OnCreate(void);
    virtual void OnDestroy(void);
    virtual unsigned short const * GetWClassName(void);
  protected:
    virtual class WWindow * CreatePanel(class WWindow *);
  public:
    WSBScrollArea(class WSBScrollArea const &);
    WSBScrollArea(class WWindow *,int);
    class WSBScrollArea & operator=(class WSBScrollArea const &);
    class WWindow * GetPanel(void);
    void OpenWindow(int);
    void ResizeScrollArea(int,int,int,int);
    void SetScrollPosition(int,int);
  protected:
    void ReconfigScrollbars(void);
};

//------------------------------------------------------------------------------
//  WSBSearchBox
//------------------------------------------------------------------------------

class DLL_IMPORT WSBSearchBox {
  public:
    virtual ~WSBSearchBox(void);
    virtual void Serialize(class FArchive &);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnCreate(void);
    virtual void OnTimer(unsigned int);
    virtual void OnDestroy(void);
    virtual unsigned short const * GetWClassName(void);
    WSBSearchBox(class WSBSearchBox const &);
    WSBSearchBox(class WWindow *,int,class TArray<class UProperty *>,struct FPoint,int);
    class WSBSearchBox & operator=(class WSBSearchBox const &);
    void AddCustomSearch(struct FSBSearch *);
    int Equals(class UObject *);
    int IsEmptySearch(void)const ;
    void OpenWindow(int);
    void Reset(void);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
  protected:
    void DoUpdate(void);
    void OnAutoSearchChange(void);
    void OnClearClick(void);
    void OnSearchClick(void);
    void StartUpdate(void);
};

//------------------------------------------------------------------------------
//  WSBStatusWindow
//------------------------------------------------------------------------------

class DLL_IMPORT WSBStatusWindow {
  public:
    virtual ~WSBStatusWindow(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnShowWindow(int);
    virtual void OnPaint(void);
    virtual void OnCreate(void);
    virtual void OnDestroy(void);
    virtual unsigned short const * GetWClassName(void);
    WSBStatusWindow(class WSBStatusWindow const &);
    WSBStatusWindow(class WWindow *);
    class WSBStatusWindow & operator=(class WSBStatusWindow const &);
    struct HWND__ * GetLabelHandle(void);
    struct HWND__ * GetProgressHandle(void);
    void OpenWindow(void);
};

//------------------------------------------------------------------------------
//  WScrollBar
//------------------------------------------------------------------------------

class DLL_IMPORT WScrollBar {
  public:
    virtual ~WScrollBar(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual unsigned short const * GetWClassName(void);
    WScrollBar(class WScrollBar const &);
    WScrollBar(class WWindow *,int,long (__stdcall*)(struct HWND__ *,unsigned int,unsigned int,long));
    WScrollBar(void);
    class WScrollBar & operator=(class WScrollBar const &);
    void OpenWindow(int,int,int,int,int,int);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
};

//------------------------------------------------------------------------------
//  WSplitter
//------------------------------------------------------------------------------

class DLL_IMPORT WSplitter {
  public:
    virtual ~WSplitter(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnPaint(void);
    virtual void OnMouseMove(unsigned long,struct FPoint);
    virtual void OnLeftButtonDown(void);
    virtual void OnLeftButtonUp(void);
    virtual int OnSetCursor(void);
    virtual unsigned short const * GetWClassName(void);
    WSplitter(class WSplitter const &);
    WSplitter(class WWindow *);
    WSplitter(void);
    class WSplitter & operator=(class WSplitter const &);
    void OpenWindow(int);
    void PositionSplitter(void);
};

//------------------------------------------------------------------------------
//  WSplitterContainer
//------------------------------------------------------------------------------

class DLL_IMPORT WSplitterContainer {
  public:
    virtual ~WSplitterContainer(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnSize(unsigned long,int,int);
    virtual void OnPaint(void);
    virtual void OnDestroy(void);
    virtual unsigned short const * GetWClassName(void);
    virtual void OpenWindow(int);
    WSplitterContainer(class WSplitterContainer const &);
    WSplitterContainer(class WWindow *);
    class WSplitterContainer & operator=(class WSplitterContainer const &);
    void PositionPanes(void);
    void SetPct(float);
};

//------------------------------------------------------------------------------
//  WSplitterPane
//------------------------------------------------------------------------------

class DLL_IMPORT WSplitterPane {
  public:
    virtual ~WSplitterPane(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnPaint(void);
    virtual unsigned short const * GetWClassName(void);
    WSplitterPane(class WSplitterPane const &);
    WSplitterPane(class WWindow *);
    WSplitterPane(void);
    class WSplitterPane & operator=(class WSplitterPane const &);
    void OpenWindow(void);
};

//------------------------------------------------------------------------------
//  WTabControl
//------------------------------------------------------------------------------

class DLL_IMPORT WTabControl {
  public:
    virtual ~WTabControl(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual int InterceptControlCommand(unsigned int,unsigned int,long);
    virtual unsigned short const * GetWClassName(void);
    WTabControl(class WTabControl const &);
    WTabControl(class WWindow *,int,long (__stdcall*)(struct HWND__ *,unsigned int,unsigned int,long));
    WTabControl(void);
    class WTabControl & operator=(class WTabControl const &);
    void AddTab(class FString,int);
    void Empty(void);
    int GetCount(void);
    int GetCurrent(void);
    int GetIndexFromlParam(int);
    class FString GetString(int);
    int GetlParam(int);
    void OpenWindow(int,unsigned long);
    int SetCurrent(int);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
};

//------------------------------------------------------------------------------
//  WTerminal
//------------------------------------------------------------------------------

class DLL_IMPORT WTerminal {
  public:
    //virtual void Serialize(unsigned short const *,enum EName);
    virtual ~WTerminal(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnSetFocus(struct HWND__ *);
    virtual void OnSize(unsigned long,int,int);
    virtual void OnShowWindow(int);
    virtual void OnCreate(void);
    virtual unsigned short const * GetWClassName(void);
    virtual void TypeChar(unsigned short);
    virtual void Paste(void);
    WTerminal(class WTerminal const &);
    WTerminal(class FName,class WWindow *);
    WTerminal(void);
    class WTerminal & operator=(class WTerminal const &);
    void OpenWindow(int,int);
    void SelectTyping(void);
    void SetExec(class FExec *);
    void SetMaxLines(int);
    void UpdateTyping(void);
};

//------------------------------------------------------------------------------
//  WTerminalBase
//------------------------------------------------------------------------------

class DLL_IMPORT WTerminalBase {
  public:
    virtual ~WTerminalBase(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual unsigned short const * GetWClassName(void);
    WTerminalBase(class WTerminalBase const &);
    WTerminalBase(class FName,class WWindow *);
    WTerminalBase(void);
    class WTerminalBase & operator=(class WTerminalBase const &);
};

//------------------------------------------------------------------------------
//  WThinScrollBar
//------------------------------------------------------------------------------

class DLL_IMPORT WThinScrollBar {
  public:
    virtual ~WThinScrollBar(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnPaint(void);
    virtual void OnMouseMove(unsigned long,struct FPoint);
    virtual void OnLeftButtonDown(void);
    virtual void OnLeftButtonDoubleClick(void);
    virtual void OnLeftButtonUp(void);
    virtual int OnSetCursor(void);
    virtual void OnDestroy(void);
    virtual unsigned short const * GetWClassName(void);
    WThinScrollBar(class WThinScrollBar const &);
    WThinScrollBar(class WWindow *,int);
    class WThinScrollBar & operator=(class WThinScrollBar const &);
    int GetPos(void);
    struct FRect GetThumbRect(void);
    void OpenWindow(int,int,int,int);
    void SetPos(int,float);
    void SetRange(int);
};

//------------------------------------------------------------------------------
//  WTimeScrollBar
//------------------------------------------------------------------------------

class DLL_IMPORT WTimeScrollBar {
  public:
    virtual ~WTimeScrollBar(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnPaint(void);
    virtual void OnMouseMove(unsigned long,struct FPoint);
    virtual void OnLeftButtonDown(void);
    virtual void OnLeftButtonDoubleClick(void);
    virtual void OnRightButtonDown(void);
    virtual void OnLeftButtonUp(void);
    virtual int OnSetCursor(void);
    virtual void OnDestroy(void);
    virtual unsigned short const * GetWClassName(void);
    WTimeScrollBar(class WTimeScrollBar const &);
    WTimeScrollBar(class WWindow *,int);
    class WTimeScrollBar & operator=(class WTimeScrollBar const &);
    float GetPct(void);
    int GetPos(void);
    struct FRect GetThumbRect(void);
    void OpenWindow(int,int,int);
    void SetPct(float);
    void SetPos(int);
    void SetRange(int);
};

//------------------------------------------------------------------------------
//  WToolTip
//------------------------------------------------------------------------------

class DLL_IMPORT WToolTip {
  public:
    virtual ~WToolTip(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual unsigned short const * GetWClassName(void);
    WToolTip(class WToolTip const &);
    WToolTip(class WWindow *,int,long (__stdcall*)(struct HWND__ *,unsigned int,unsigned int,long));
    WToolTip(void);
    class WToolTip & operator=(class WToolTip const &);
    void AddTool(struct HWND__ *,class FString,int,struct tagRECT *);
    void OpenWindow(void);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
};

//------------------------------------------------------------------------------
//  WTrackBar
//------------------------------------------------------------------------------

class DLL_IMPORT WTrackBar {
  public:
    virtual ~WTrackBar(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual int InterceptControlCommand(unsigned int,unsigned int,long);
    virtual unsigned short const * GetWClassName(void);
    WTrackBar(class WTrackBar const &);
    WTrackBar(class WWindow *,int,long (__stdcall*)(struct HWND__ *,unsigned int,unsigned int,long));
    WTrackBar(void);
    class WTrackBar & operator=(class WTrackBar const &);
    int GetPos(void);
    void OpenWindow(int,int);
    void SetPos(int);
    void SetRange(int,int);
    void SetTicFreq(int);
    void SetTicks(int *,int);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
};

//------------------------------------------------------------------------------
//  WTreeView
//------------------------------------------------------------------------------

class DLL_IMPORT WTreeView {
  public:
    virtual ~WTreeView(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual int InterceptControlCommand(unsigned int,unsigned int,long);
    virtual void OnRightButtonDown(void);
    virtual unsigned short const * GetWClassName(void);
    WTreeView(class WTreeView const &);
    WTreeView(class WWindow *,int,long (__stdcall*)(struct HWND__ *,unsigned int,unsigned int,long));
    WTreeView(void);
    class WTreeView & operator=(class WTreeView const &);
    struct _TREEITEM * AddItem(unsigned short const *,struct _TREEITEM *,int,void *);
    void BeginUpdate(void);
    void DeleteItem(struct _TREEITEM *);
    void Empty(void);
    void EndUpdate(void);
    void OpenWindow(int,int,int,int,int,unsigned long);
    void SetNodeText(struct _TREEITEM *,unsigned short const *);
    void SortItems(struct _TREEITEM *,int,int (__stdcall*)(long,long,long),long);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
  private:
    void SortRecursive(struct _TREEITEM *,int (__stdcall*)(long,long,long),long);
};

//------------------------------------------------------------------------------
//  WUDNWindow
//------------------------------------------------------------------------------

class DLL_IMPORT WUDNWindow {
  public:
    virtual ~WUDNWindow(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnKeyDown(unsigned short);
    virtual void OnMouseMove(unsigned long,struct FPoint);
    virtual void OnLeftButtonDown(void);
    virtual unsigned short const * GetWClassName(void);
    WUDNWindow(class WUDNWindow const &);
    WUDNWindow(class WWindow *);
    class WUDNWindow & operator=(class WUDNWindow const &);
    void Capture(void);
    int GetCurrentTopicID(void);
    void OpenWindow(void);
    void Release(void);
};

//------------------------------------------------------------------------------
//  WUrlButton
//------------------------------------------------------------------------------

class DLL_IMPORT WUrlButton {
  public:
    virtual ~WUrlButton(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual unsigned short const * GetWClassName(void);
    WUrlButton(class WUrlButton const &);
    WUrlButton(class WWindow *,unsigned short const *,int);
    WUrlButton(void);
    class WUrlButton & operator=(class WUrlButton const &);
    void OnClick(void);
    typedef long (__stdcall* SuperProc)(struct HWND__ *,unsigned int,unsigned int,long);
};

//------------------------------------------------------------------------------
//  WWindow
//------------------------------------------------------------------------------

class DLL_IMPORT WWindow {
  public:
    virtual ~WWindow(void);
    virtual void Enable(int);
    virtual void Show(int);
    virtual void Serialize(class FArchive &);
    virtual unsigned short const * GetPackageName(void);
    virtual void DoDestroy(void);
    virtual long WndProc(unsigned int,unsigned int,long);
    virtual long CallDefaultProc(unsigned int,unsigned int,long);
    virtual int InterceptControlCommand(unsigned int,unsigned int,long);
    virtual class FString GetText(void);
    virtual void SetText(unsigned short const *);
    virtual int GetLength(void);
    virtual void OnCopyData(struct HWND__ *,struct tagCOPYDATASTRUCT *);
    virtual void OnSetFocus(struct HWND__ *);
    virtual void OnKillFocus(struct HWND__ *);
    virtual void OnSize(unsigned long,int,int);
    virtual void OnWindowPosChanging(int *,int *,int *,int *);
    virtual void OnMove(int,int);
    virtual void OnCommand(int);
    virtual int OnSysCommand(int);
    virtual void OnActivate(int);
    virtual void OnChar(unsigned short);
    virtual void OnKeyDown(unsigned short);
    virtual void OnCut(void);
    virtual void OnCopy(void);
    virtual void OnPaste(void);
    virtual void OnShowWindow(int);
    virtual void OnUndo(void);
    virtual int OnEraseBkgnd(void);
    virtual void OnVScroll(unsigned int,long);
    virtual void OnHScroll(unsigned int,long);
    virtual void OnKeyUp(unsigned int,long);
    virtual void OnPaint(void);
    virtual void OnCreate(void);
    virtual void OnDrawItem(struct tagDRAWITEMSTRUCT *);
    virtual void OnMeasureItem(struct tagMEASUREITEMSTRUCT *);
    virtual void OnInitDialog(void);
    virtual void OnEnterIdle(void);
    virtual void OnMouseEnter(void);
    virtual void OnMouseLeave(void);
    virtual void OnMouseHover(void);
    virtual void OnTimer(unsigned int);
    virtual void OnReleaseCapture(void);
    virtual void OnMdiActivate(int);
    virtual void OnMouseMove(unsigned long,struct FPoint);
    virtual void OnLeftButtonDown(void);
    virtual void OnLeftButtonDoubleClick(void);
    virtual void OnMiddleButtonDoubleClick(void);
    virtual void OnRightButtonDoubleClick(void);
    virtual void OnRightButtonDown(void);
    virtual void OnLeftButtonUp(void);
    virtual void OnRightButtonUp(void);
    virtual void OnFinishSplitterDrag(class WDragInterceptor *,int);
    virtual int OnSetCursor(void);
    virtual bool OnClose(void);
    virtual void OnDestroy(void);
    virtual void MyDrawEdge(struct HDC__ *,struct tagRECT *,int);
    virtual void SetItemFocus(int);
    virtual void SetValue(unsigned short const *);
    virtual unsigned short const * GetWClassName(void);
    WWindow(class WWindow const &);
    WWindow(class FName,class WWindow *,int);
    class WWindow & operator=(class WWindow const &);
    operator struct HWND__ *(void)const ;
    struct FPoint ClientToScreen(struct FPoint const &);
    struct FRect ClientToScreen(struct FRect const &);
    struct FRect GetClientRect(void)const ;
    struct FPoint GetCursorPos(void);
    struct FRect GetWindowRect(int)const ;
    void MaybeDestroy(void);
    static int ModalCount;
    void MoveWindow(int,int,int,int,int);
    void MoveWindow(struct FRect,int);
    void PerformCreateWindowEx(unsigned long,unsigned short const *,unsigned long,int,int,int,int,struct HWND__ *,struct HMENU__ *,struct HINSTANCE__ *);
    typedef long (__stdcall*CDECL RegisterWindowClass(unsigned short const *,unsigned long))(struct HWND__ *,unsigned int,unsigned int,long);
    void ResizeWindow(int,int,int);
    void SaveWindowPos(void);
    struct FPoint ScreenToClient(struct FPoint const &);
    struct FRect ScreenToClient(struct FRect const &);
    void SetFont(struct HFONT__ *);
    void SetNotifyHook(class FNotifyHook *);
    void SetRedraw(int);
    void SetSpecialFont(int,int,unsigned short const *,int);
    static int STDCALL StaticDlgProc(struct HWND__ *,unsigned int,unsigned int,long);
    static long STDCALL StaticWndProc(struct HWND__ *,unsigned int,unsigned int,long);
    void VerifyPosition(void);
    void _CloseWindow(void);
    static class TArray<class WWindow *> _DeleteWindows;
    static class TArray<class WWindow *> _Windows;
};

//------------------------------------------------------------------------------
//  WWizardDialog
//------------------------------------------------------------------------------

class DLL_IMPORT WWizardDialog {
  public:
    virtual ~WWizardDialog(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual void OnInitDialog(void);
    virtual bool OnClose(void);
    virtual void OnDestroy(void);
    virtual unsigned short const * GetWClassName(void);
    virtual void Advance(class WWizardPage *);
    virtual void RefreshPage(void);
    virtual void OnBack(void);
    virtual void OnNext(void);
    virtual void OnFinish(void);
    virtual void OnCancel(void);
    WWizardDialog(class WWizardDialog const &);
    WWizardDialog(void);
    class WWizardDialog & operator=(class WWizardDialog const &);
};

//------------------------------------------------------------------------------
//  WWizardPage
//------------------------------------------------------------------------------

class DLL_IMPORT WWizardPage {
  public:
    virtual ~WWizardPage(void);
    virtual unsigned short const * GetPackageName(void);
    virtual void GetWindowClassName(unsigned short *);
    virtual unsigned short const * GetWClassName(void);
    virtual void OnCurrent(void);
    virtual class WWizardPage * GetNext(void);
    virtual unsigned short const * GetBackText(void);
    virtual unsigned short const * GetNextText(void);
    virtual unsigned short const * GetFinishText(void);
    virtual unsigned short const * GetCancelText(void);
    virtual int GetShow(void);
    virtual void OnCancel(void);
    WWizardPage(class WWizardPage const &);
    WWizardPage(unsigned short const *,int,class WWizardDialog *);
    WWizardPage(void);
    class WWizardPage & operator=(class WWizardPage const &);
};

//------------------------------------------------------------------------------
//  FSBObjectListMetaData
//------------------------------------------------------------------------------

struct DLL_IMPORT FSBObjectListMetaData {
  public:
    struct FSBObjectListMetaData & operator=(struct FSBObjectListMetaData const &);
};

//------------------------------------------------------------------------------
//  __cdecl*WSBObjectList
//------------------------------------------------------------------------------

struct DLL_IMPORT __cdecl*WSBObjectList {
  public:
    typedef bool (LimitObjectsByFunction(void *,bool (__cdecl*)(void *,class UObject const *)))(void *,class UObject const *);
};


AUTOGENERATE_CLASS(UWindowManager)

AUTOGENERATE_PACKAGE(Window)

typedef int (__stdcall* SHGetSpecialFolderPathWX)(struct HWND__ *,unsigned short *,int,int);
typedef int (__stdcall* Shell_NotifyIconWX)(unsigned long,struct _NOTIFYICONDATAW *);

//public: void FDelegate::`default constructor closure'(void) 1102cd80
//public: void FDelegateInt::`default constructor closure'(void) 1102cdb0
//public: void FDelegateTCHAR::`default constructor closure'(void) 1102cde0
//public: void FDelegateUObject::`default constructor closure'(void) 1102ce60
//public: void FDelegateVoid::`default constructor closure'(void) 1102ce90
//public: void FWindowsBitmap::`default constructor closure'(void) 1102d330
//public: void WEditTerminal::`default constructor closure'(void) 1103b620
//public: void WWindow::`default constructor closure'(void) 11038dd0
//void CDECL DeinitWindowing(void) 1102b810
//class UProperty * CDECL FindProperty(class UClass *,unsigned short const *,int) 11005530
//class WBrowser * GCurrentBrowser 11077138
//class WLog * GLogWindow 110773f8
//int GLogWindowCreationAndDestruction 11077238
//int GNotify 110773fc
//void CDECL GOnKillFocus(struct HWND__ *) 1102b8a0
//void CDECL GOnSetFocus(struct HWND__ *) 1102b8f0
//class TArray<struct FSBObjectListColumn> const & CDECL GatherObjectListData(struct FSBObjectListMetaData *,class TArray<class UProperty *> *) 11006270
//void CDECL GetEnumNames(class UClass *,class FName,class TArray<class FString> &) 11038a20
//class FString CDECL GetFilenameOnly(class FString) 11001720
//class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > CDECL GetFullIndentedNameWithoutClass(class UObject *,int,int) 11032a60
//void CDECL GetSubClasses(class UClass *,int,class std::vector<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >,class std::allocator<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > > > &) 110407d0
//void CDECL InitWindowing(void) 11035640
//struct HBITMAP__ * CDECL LoadFileToBitmap(unsigned short const *,int &,int &) 1102b700
//struct HMENU__ * CDECL LoadLocalizedMenu(struct HINSTANCE__ *,int,unsigned short const *,unsigned short const *) 1102d210
//struct _NOTIFYICONDATAW NID 11077268
//struct _NOTIFYICONDATAA NIDA 11077328
//unsigned int WindowMessageMouseWheel 1107730c
//unsigned int WindowMessageOpen 11077258
//unsigned short const * const `public: WProperties::WProperties(class FName,class WWindow *)'::`3'::__FUNC_NAME__ 1104ba6c
//unsigned short const * const `public: virtual FTreeItem::~FTreeItem(void)'::`3'::__FUNC_NAME__ 1104b98c
//unsigned short const * const `struct HMENU__ * CDECL LoadLocalizedMenu(struct HINSTANCE__ *,int,unsigned short const *,unsigned short const *)'::`3'::__FUNC_NAME__ 1104fb24
//struct HBRUSH__ * hBrushBlack 11077314
//struct HBRUSH__ * hBrushCurrent 110773b4
//struct HBRUSH__ * hBrushCyanHighlight 110773ac
//struct HBRUSH__ * hBrushCyanLow 110773bc
//struct HBRUSH__ * hBrushDark 1107739c
//struct HBRUSH__ * hBrushDarkGrey 11077248
//struct HBRUSH__ * hBrushGrey160 110773b8
//struct HBRUSH__ * hBrushGrey180 1107738c
//struct HBRUSH__ * hBrushGrey197 11077380
//struct HBRUSH__ * hBrushGrey 11077388
//struct HBRUSH__ * hBrushGreyWindow 11077250
//struct HBRUSH__ * hBrushHeadline 110773a0
//struct HBRUSH__ * hBrushOffWhite 11077320
//struct HBRUSH__ * hBrushWhite 11077398
//struct HFONT__ * hFontHeadline 11077300
//struct HFONT__ * hFontText 110773e8
//struct HFONT__ * hFontUrl 110773f0
//struct HINSTANCE__ * hInstanceWindow 11077318
//bool CDECL gui::query_integer(char const *,char const *,int,int *,class WWindow *) 1101c740
//bool CDECL gui::query_message(char const *,char const *) 1101b2f0
//bool CDECL gui::query_options(char const *,class std::vector<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >,class std::allocator<class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > > > const &,unsigned long,unsigned long *,class WWindow *) 1101c940
//bool CDECL gui::query_options(char const *,char const * *,unsigned long,unsigned long,unsigned long *,class WWindow *) 1101cf00
//bool CDECL gui::query_string(char const *,char const *,char const *,char *,unsigned long,class WWindow *) 1101c500
//void CDECL gui::show_message(char const *,char const *) 1101b3b0
//_DllMain@12 1102b690

#ifndef NAMES_ONLY
#undef AUTOGENERATE_NAME
#undef AUTOGENERATET_FUNCTION
#undef AUTOGENERATE_CLASS
#undef AUTOGENERATE_PACKAGE
#endif NAMES_ONLY

#if _MSC_VER
#pragma pack (pop)
#endif

