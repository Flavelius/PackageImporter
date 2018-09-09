//==============================================================================
//  ScriptedTexture
//==============================================================================

class ScriptedTexture extends BitmapMaterial
    native
    collapsecategories
    dependsOn()
  ;

  var const transient int RenderTarget;
  var const transient Viewport RenderViewport;
  var Actor Client;
  var transient int Revision;
  var const transient int OldRevision;
  var const transient int Invalid;


  final native function DrawPortal(int X,int Y,int width,int Height,Actor CamActor,Vector CamLocation,Rotator CamRotation,optional int FOV,optional bool ClearZ);


  final native function DrawTile(float X,float Y,float XL,float YL,float U,float V,float UL,float VL,Material Material,Color Color);


  final native function TextSize(coerce string Text,Font Font,out int width,out int Height);


  final native function DrawText(int StartX,int StartY,coerce string Text,Font Font,Color Color);


  final native function SetSize(int width,int Height);



