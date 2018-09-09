//==============================================================================
//  GUI_Component
//==============================================================================

class GUI_Component extends Object
    native
    abstract
    dependsOn(PlayerController,GUI_Desktop,Class,GUI_Page)
    Transient
    Config(User)
  ;

  const GUI_MAX_FUNCTION_PTRS =  4;
  const GUI_CDS_REPEAT =  1;
  const GUI_CDS_NORMAL =  0;
  enum EToolTipMode {
    ETT_Cached ,
    ETT_Dynamic 
  };

  var GUI_Desktop mDesktop;
  var GUI_Page mOwnerPage;
  var int mComponentHandle;
  var string mComponentTitle;
  var int mComponentStyle;
  var private bool mVisible;
  var private bool mWantedVisible;
  var private bool mEnabled;
  var private bool mWantedEnabled;
  var float mAlphaFactor;
  var bool mWantTick;
  var bool mPostDrawEnabled;
  var bool mCanBecomeMouseDownComponent;
  var bool mDoubleClickEnabled;
  var float mLastClickMouseX;
  var float mLastClickMouseY;
  var int mLastButtonStates;
  var int mLastDeltaButton;
  var GUI_Component mLastFromChild;
  var globalconfig float mMaxDoubleClickTime;
  var int mBackgroundType;
  var int mBorderType;
  var int mIconType;
  var Material mIconMaterial;
  var float mIconBounds[4];
  var float mIconTexCoords[4];
  var float mBackgroundColors[4];
  var float mIconColors[4];
  var int mDrawPriority;
  var float mLeft;
  var float mTop;
  var float mWidth;
  var float mHeight;
  var float mMinWidth;
  var float mMinHeight;
  var float mTexWidth;
  var float mTexHeight;
  var float mAnchors[4];
  var float mMinBounds[4];
  var float mMaxBounds[4];
  var bool mMinBoundsSet;
  var bool mMaxBoundsSet;
  var private bool mValidated;
  var int mTabIndex;
  var int mIntTag;
  var string mStringTag;
  var Object mObjectTag;
  var string mShortKeyCommand;
  var string mShortKeyName;
  var bool mFadeIn;
  var bool mFadeOut;
  var bool mHideOnFadePolicy;
  var bool mUseParentAlpha;
  var private float mFadeTimeStart;
  var private float mFadeTime;
  var private float mAlphaStart;
  var private byte mTooltipMode;
  var string mTooltipText;
  var Object mTooltipObject;
  var string mTooltipObjectPageClassName;
  var private bool mPositionTooltip;
  var private int mTooltipOffsetX;
  var private int mTooltipOffsetY;
  var int mMouseOverCursor;
  var int mMouseDownCursor;
  var private int mFunctionPtrs[4];
  var private float mFunctionPtrTimeouts[4];
  var private float mFunctionPtrTimeReset[4];
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var private int mComponentData;


  delegate Object OnGetTooltipObject(GUI_Component aSender);


  delegate string OnGetTooltipText(GUI_Component aSender);


  delegate OnShow();


  delegate OnHitTest(float MouseX,float MouseY);


  delegate OnWatch();


  delegate OnDeActivate();


  delegate OnActivate();


  delegate OnChange(GUI_Component aSender);


  delegate OnTimer(GUI_Component aSender);


  delegate bool OnCapturedMouseMove(float deltaX,float deltaY);


  delegate OnMouseRelease(GUI_Component aSender);


  delegate OnMousePressed(GUI_Component sender,bool bRepeat);


  delegate bool OnDblClick();


  delegate bool OnHover(GUI_Component aSender);


  delegate OnRendered(Canvas aCanvas);


  delegate OnRender(Canvas aCanvas);


  delegate OnEndDrag(GUI_DnDInfo dndInfo,GUI_Component Target,float X,float Y,GUI_Component fromChild);


  delegate bool OnDrop(GUI_DnDInfo dndInfo,float relMouseX,float relMouseY,GUI_Component fromChild);


  delegate bool OnDrag(GUI_DnDInfo dndInfo,float relMouseX,float relMouseY,GUI_Component fromChild);


  delegate OnHide();


  delegate bool OnFocusChanged(bool newState);


  delegate bool OnDoubleClick(GUI_Component clickedComponent);


  delegate bool OnRightClick(GUI_Component clickedComponent);


  delegate bool OnClick(GUI_Component clickedComponent);


  delegate bool OnComponentClick(GUI_Component clickedComponent,optional bool hasDoubleClicked);


  delegate bool OnKeyType(GUI_Component component,out byte Key,string Unicode);


  delegate bool OnKeyEvent(GUI_Component component,out byte Key,out byte State,float delta);


  delegate bool OnMBClick(GUI_MessageBox messageBox,int boxTag,int buttonTag);


  delegate bool OnMouseMove(GUI_Component fromChild,float MouseX,float MouseY,float deltaX,float deltaY,int buttons);


  delegate bool OnMouseUp(float MouseX,float MouseY,int buttons);


  delegate bool OnMouseDown(float MouseX,float MouseY,int buttons);


  delegate bool OnWhileMouseDown(float MouseX,float MouseY,int buttonStates,int deltaButtonStates);


  delegate bool OnDeHilite(GUI_Component fromChild);


  delegate bool OnHilite(GUI_Component fromChild);


  delegate OnTick(float DeltaTime);


  delegate bool OnPostDraw(Canvas aCanvas);


  delegate bool OnPreDraw(Canvas aCanvas);


  native function UpdateHeight(GUI_Component aTargetComponent,GUI_Component aSourceComponent,optional float aOffset,optional float aMinimum);


  native function int GetMouseDragCursor();


  native function int GetMouseDownCursor();


  native function int GetMouseOverCursor();


  function GUI_Desktop GetDesktop() {
    return mDesktop;                                                            //0000 : 04 01 48 0C 9D 19 
    //04 01 48 0C 9D 19 04 0B 47 
  }


  native function SetProperty(string aKey,string aValue);


  native function Rotator GetPropertyAsRotator(string Key);


  native function Vector GetPropertyAsVector(string Key);


  native function float GetPropertyAsFloat(string aKey);


  native function int GetPropertyAsInt(string aKey);


  native function string GetProperty(string aKey);


  event UpdateComponent(int anIntParam,optional string aStringParam) {
    //04 0B 47 
  }


  native function InvalidateFunctionPtrs();


  event ResolveShortkeyNames() {
    mShortKeyName = GetPlayerController().ConsoleCommand("BINDINGTOKEY "" $ mShortKeyCommand
      $ """);//0000 : 0F 01 30 1B 9D 19 19 1B 0E 2F 00 00 16 22 00 00 1B 65 0C 00 00 70 70 1F 42 49 4E 44 49 4E 47 54 4F 4B 45 59 20 22 00 01 A8 1B 9D 19 16 1F 22 00 16 16 
    if (Len(mShortKeyName) == 0) {                                              //0032 : 07 49 00 9A 7D 01 30 1B 9D 19 16 25 16 
      mShortKeyName = "[]";                                                     //003F : 0F 01 30 1B 9D 19 1F 5B 5D 00 
    }
    //0F 01 30 1B 9D 19 19 1B 0E 2F 00 00 16 22 00 00 1B 65 0C 00 00 70 70 1F 42 49 4E 44 49 4E 47 54 
    //4F 4B 45 59 20 22 00 01 A8 1B 9D 19 16 1F 22 00 16 16 07 49 00 9A 7D 01 30 1B 9D 19 16 25 16 0F 
    //01 30 1B 9D 19 1F 5B 5D 00 04 0B 47 
  }


  event string GetTooltipObjectPageClassName() {
    return mTooltipObjectPageClassName;                                         //0000 : 04 01 80 1D 9D 19 
    //04 01 80 1D 9D 19 04 0B 47 
  }


  event SetTooltipObjectPageClassName(string aClassName) {
    mTooltipObjectPageClassName = aClassName;                                   //0000 : 0F 01 80 1D 9D 19 00 A8 1E 9D 19 
    //0F 01 80 1D 9D 19 00 A8 1E 9D 19 04 0B 47 
  }


  event ResetToolTipObject(optional string aTooltipText) {
    mTooltipObject = None;                                                      //0000 : 0F 01 E8 20 9D 19 2A 
    mTooltipObjectPageClassName = "";                                           //0007 : 0F 01 80 1D 9D 19 1F 00 
    if (aTooltipText != "") {                                                   //000F : 07 26 00 7B 00 10 20 9D 19 1F 00 16 
      SetTooltipText(aTooltipText);                                             //001B : 1B 54 97 00 00 00 10 20 9D 19 16 
    }
    //0F 01 E8 20 9D 19 2A 0F 01 80 1D 9D 19 1F 00 07 26 00 7B 00 10 20 9D 19 1F 00 16 1B 54 97 00 00 
    //00 10 20 9D 19 16 04 0B 47 
  }


  event SetTooltipObject(Object aObject,string aPageClassName) {
    mTooltipObject = aObject;                                                   //0000 : 0F 01 E8 20 9D 19 00 10 22 9D 19 
    mTooltipObjectPageClassName = aPageClassName;                               //000B : 0F 01 80 1D 9D 19 00 88 22 9D 19 
    mTooltipMode = 0;                                                           //0016 : 0F 01 00 23 9D 19 24 00 
    //0F 01 E8 20 9D 19 00 10 22 9D 19 0F 01 80 1D 9D 19 00 88 22 9D 19 0F 01 00 23 9D 19 24 00 04 0B 
    //47 
  }


  native function Object GetTooltipObject();


  native function string GetTooltipText();


  event SetTooltipText(string aText) {
    mTooltipText = aText;                                                       //0000 : 0F 01 98 27 9D 19 00 D8 26 9D 19 
    mTooltipMode = 0;                                                           //000B : 0F 01 00 23 9D 19 24 00 
    //0F 01 98 27 9D 19 00 D8 26 9D 19 0F 01 00 23 9D 19 24 00 04 0B 47 
  }


  event SetComponentTitle(string Title) {
    mComponentTitle = Title;                                                    //0000 : 0F 01 78 29 9D 19 00 C0 28 9D 19 
    //0F 01 78 29 9D 19 00 C0 28 9D 19 04 0B 47 
  }


  event ResetTooltipMode() {
    mTooltipMode = 1;                                                           //0000 : 0F 01 00 23 9D 19 24 01 
    //0F 01 00 23 9D 19 24 01 04 0B 47 
  }


  native event FadeOut(optional float FadeTime);


  native event FadeIn(optional float FadeTime);


  native function float GetTimeSeconds();


  native function Level GetLevel();


  native function Game_Pawn GetPawn();


  native function Login_PlayerController GetLoginController();


  native function Character_PlayerController GetCharacterController();


  native function Game_PlayerController GetGamePlayerController();


  native function PlayerController GetPlayerController();


  function float GetAlphaFactor() {
    return mAlphaFactor;                                                        //0000 : 04 01 60 38 9D 19 
    //04 01 60 38 9D 19 04 0B 47 
  }


  function SetAlphaFactor(float Alpha) {
    mAlphaFactor = Alpha;                                                       //0000 : 0F 01 60 38 9D 19 00 88 39 9D 19 
    //0F 01 60 38 9D 19 00 88 39 9D 19 04 0B 47 
  }


  function SetIconColors(float R,float G,float B,float A) {
    mIconColors[0] = R;                                                         //0000 : 0F 1A 25 01 E0 3B 9D 19 00 F0 3A 9D 19 
    mIconColors[1] = G;                                                         //000D : 0F 1A 26 01 E0 3B 9D 19 00 58 3C 9D 19 
    mIconColors[2] = B;                                                         //001A : 0F 1A 2C 02 01 E0 3B 9D 19 00 D0 3C 9D 19 
    mIconColors[3] = A;                                                         //0028 : 0F 1A 2C 03 01 E0 3B 9D 19 00 48 3D 9D 19 
    //0F 1A 25 01 E0 3B 9D 19 00 F0 3A 9D 19 0F 1A 26 01 E0 3B 9D 19 00 58 3C 9D 19 0F 1A 2C 02 01 E0 
    //3B 9D 19 00 D0 3C 9D 19 0F 1A 2C 03 01 E0 3B 9D 19 00 48 3D 9D 19 04 0B 47 
  }


  function SetBackgroundColors(float R,float G,float B,float A) {
    mBackgroundColors[0] = R;                                                   //0000 : 0F 1A 25 01 60 3F 9D 19 00 70 3E 9D 19 
    mBackgroundColors[1] = G;                                                   //000D : 0F 1A 26 01 60 3F 9D 19 00 D8 3F 9D 19 
    mBackgroundColors[2] = B;                                                   //001A : 0F 1A 2C 02 01 60 3F 9D 19 00 50 40 9D 19 
    mBackgroundColors[3] = A;                                                   //0028 : 0F 1A 2C 03 01 60 3F 9D 19 00 C8 40 9D 19 
    //0F 1A 25 01 60 3F 9D 19 00 70 3E 9D 19 0F 1A 26 01 60 3F 9D 19 00 D8 3F 9D 19 0F 1A 2C 02 01 60 
    //3F 9D 19 00 50 40 9D 19 0F 1A 2C 03 01 60 3F 9D 19 00 C8 40 9D 19 04 0B 47 
  }


  native function DrawTile(Canvas aCanvas,Material aMaterial,float Left,float top,optional float width,optional float Height,optional int uleft,optional int utop,optional int uwidth,optional int uheight,optional float Z,optional Color Color,optional Plane fog);


  native function DrawImage(Canvas aCanvas,GUI_Image aImage,float Left,float top,optional float width,optional float Height,optional float uleft,optional float utop,optional float uwidth,optional float uheight,optional float Z,optional Color Color,optional Plane fog);


  native function TexRotator CreateRotator(GUI_Image image);


  native function GUI_Image CreateImage(string imageBaseName,string TexturePackage,string imageSet,optional string anImageClassName);


  native function Font CreateFont(string FontName);


  native function AdjustBorder(int Left,int top,int Right,int Bottom);


  native function GetIconMaterialBounds(out float Left,out float top,out float width,out float Height);


  function Material GetIconMaterial() {
    return mIconMaterial;                                                       //0000 : 04 01 F0 5C 9D 19 
    //04 01 F0 5C 9D 19 04 0B 47 
  }


  native function SetIconMaterial(Material Material,float Left,float top,optional float width,optional float Height,optional int uleft,optional int utop,optional int uwidth,optional int uheight);


  native function SetStateIcon(int stateIndex,string imageBaseName,string TexturePackage,string imageSet);


  native function SetStdIcon(int iconType);


  native function SetStdBorder(int borderType);


  native function SetStdBackground(int backgroundType);


  native function ClearIcon();


  native function SetIcon(string imageBaseName,optional string texturePackages,optional string imageSet);


  native function SetBorder(int offsetX,int offsetY,int offsetW,int offsetH,optional string imageBaseName,optional string texturePackages,optional string imageSet);


  native function ClearBackground();


  native function SetSolidBackground(float R,float G,float B,optional float A);


  native function SetBackground(string imageBaseName,optional string TexturePackage,optional string imageSet,optional int backgroundType);


  event bool OnFocus(bool State) {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }


  function bool IsFocused() {
    return mDesktop.GetFocusedComponent() == self;                              //0000 : 04 72 19 01 48 0C 9D 19 06 00 04 1C 80 08 89 19 16 17 16 
    //04 72 19 01 48 0C 9D 19 06 00 04 1C 80 08 89 19 16 17 16 04 0B 47 
  }


  function SetFocus() {
    mDesktop.FocusComponent(self);                                              //0000 : 19 01 48 0C 9D 19 07 00 00 1B 89 98 00 00 17 16 
    //19 01 48 0C 9D 19 07 00 00 1B 89 98 00 00 17 16 04 0B 47 
  }


  function SetContextMenuEnabled(bool Enabled) {
    if (Enabled) {                                                              //0000 : 07 14 00 2D 00 50 7C 9D 19 
      mMouseOverCursor = 19;                                                    //0009 : 0F 01 20 7D 9D 19 2C 13 
    } else {                                                                    //0011 : 06 1B 00 
      mMouseOverCursor = 0;                                                     //0014 : 0F 01 20 7D 9D 19 25 
    }
    //07 14 00 2D 00 50 7C 9D 19 0F 01 20 7D 9D 19 2C 13 06 1B 00 0F 01 20 7D 9D 19 25 04 0B 47 
  }


  function bool HasMouseCapture() {
    return mDesktop.GetMouseCaptureComponent() == self;                         //0000 : 04 72 19 01 48 0C 9D 19 06 00 04 1C 70 03 89 19 16 17 16 
    //04 72 19 01 48 0C 9D 19 06 00 04 1C 70 03 89 19 16 17 16 04 0B 47 
  }


  function bool IsMouseOwner() {
    return mDesktop.GetMouseOwner() == self;                                    //0000 : 04 72 19 01 48 0C 9D 19 06 00 04 1C D0 04 89 19 16 17 16 
    //04 72 19 01 48 0C 9D 19 06 00 04 1C D0 04 89 19 16 17 16 04 0B 47 
  }


  function bool IsHiliteComponent() {
    return mDesktop.GetHiliteComponent() == self;                               //0000 : 04 72 19 01 48 0C 9D 19 06 00 04 1C B0 0D 89 19 16 17 16 
    //04 72 19 01 48 0C 9D 19 06 00 04 1C B0 0D 89 19 16 17 16 04 0B 47 
  }


  final function bool IsVisible() {
    return mVisible;                                                            //0000 : 04 2D 01 98 82 9D 19 
    //04 2D 01 98 82 9D 19 04 0B 47 
  }


  native function SetVisible(bool State);


  final function bool IsEnabled() {
    return mEnabled;                                                            //0000 : 04 2D 01 D0 85 9D 19 
    //04 2D 01 D0 85 9D 19 04 0B 47 
  }


  native function SetEnabled(bool State);


  function bool IsOver(float X,float Y) {
    local float Left;
    local float top;
    local float width;
    local float Height;
    GetWindowRect(Left,top,width,Height);                                       //0000 : 1B 6B 99 00 00 00 D0 88 9D 19 00 48 89 9D 19 00 C0 89 9D 19 00 38 8A 9D 19 16 
    return X >= Left && X <= Left + width && Y >= top
      && Y <= top + Height;//001A : 04 82 82 82 B3 00 58 88 9D 19 00 D0 88 9D 19 16 18 14 00 B2 00 58 88 9D 19 AE 00 D0 88 9D 19 00 C0 89 9D 19 16 16 16 18 0D 00 B3 00 B0 8A 9D 19 00 48 89 9D 19 16 16 18 14 00 B2 00 B0 8A 9D 19 AE 00 48 89 9D 19 00 38 8A 9D 19 16 16 16 
    //1B 6B 99 00 00 00 D0 88 9D 19 00 48 89 9D 19 00 C0 89 9D 19 00 38 8A 9D 19 16 04 82 82 82 B3 00 
    //58 88 9D 19 00 D0 88 9D 19 16 18 14 00 B2 00 58 88 9D 19 AE 00 D0 88 9D 19 00 C0 89 9D 19 16 16 
    //16 18 0D 00 B3 00 B0 8A 9D 19 00 48 89 9D 19 16 16 18 14 00 B2 00 B0 8A 9D 19 AE 00 48 89 9D 19 
    //00 38 8A 9D 19 16 16 16 04 0B 47 
  }


  native function bool IsMouseOver();


  native function SetClientHeight(float aHeight);


  native function SetClientWidth(float aWidth);


  native function SetClientDimensions(float aWidth,float aHeight);


  native function float GetClientHeight();


  native function float GetClientWidth();


  native function SetCustomClipRect(float Left,float top,float Right,float Bottom);


  native function SetMaxBounds(float Left,float top,float width,float Height);


  native function SetMinBounds(float Left,float top,float width,float Height);


  native function SetAnchors(float Left,float top,float Right,float Bottom);


  native function GetClientRect(out float X,out float Y,out float width,out float Height);


  native function GetWindowRect(out float X,out float Y,out float width,out float Height);


  native function SetPosition(float X,float Y,optional float width,optional float Height);


  function int GetDrawPriority() {
    return mDrawPriority;                                                       //0000 : 04 01 88 A9 9D 19 
    //04 01 88 A9 9D 19 04 0B 47 
  }


  function SetDrawPriority(int aNewPrio) {
    mDrawPriority = aNewPrio;                                                   //0000 : 0F 01 88 A9 9D 19 00 B0 AA 9D 19 
    //0F 01 88 A9 9D 19 00 B0 AA 9D 19 04 0B 47 
  }


  native function GUI_Component GetOwnerClass(class<Object> aClass);


  native function GUI_Component GetTopLevelOwner();


  function GUI_Component GetOwnerPage() {
    return mOwnerPage;                                                          //0000 : 04 01 08 B0 9D 19 
    //04 01 08 B0 9D 19 04 0B 47 
  }


  event PositionChanged(float X,float Y);


  event SetDelegates();


  event PreLogin();


  event OnLogin();


  event OnComponentHidden();


  event OnComponentShown();


  event ResolutionChanged(int ResX,int ResY);


  native function Invalidate();


  event bool OnMouseWheel(bool isUp) {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  event OnTimeout(Object Source,optional int Id) {
    if ((mComponentStyle & Class'GUI_Desktop'.768) > 0) {                       //0000 : 07 34 00 97 9C 01 80 DC 9D 19 12 20 48 DB 2E 1D 05 00 04 1D 00 03 00 00 16 25 16 
      mOwnerPage.OnTimeout(Source,Id);                                          //001B : 19 01 08 B0 9D 19 10 00 00 1B 27 97 00 00 00 90 DB 9D 19 00 F8 DC 9D 19 16 
    }
    //07 34 00 97 9C 01 80 DC 9D 19 12 20 48 DB 2E 1D 05 00 04 1D 00 03 00 00 16 25 16 19 01 08 B0 9D 
    //19 10 00 00 1B 27 97 00 00 00 90 DB 9D 19 00 F8 DC 9D 19 16 04 0B 47 
  }


  event OnComponentDestroyed();


  event Initialize() {
    SetDelegates();                                                             //0000 : 1B 44 97 00 00 16 
    //1B 44 97 00 00 16 04 0B 47 
  }


  native function int GetComponentState();



