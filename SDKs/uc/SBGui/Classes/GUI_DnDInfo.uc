//==============================================================================
//  GUI_DnDInfo
//==============================================================================

class GUI_DnDInfo extends Object
    native
    dependsOn()
  ;

  var GUI_Desktop mDesktop;
  var GUI_Component mSource;
  var GUI_Component mDestination;
  var GUI_Component mDraggedComponent;
  var Material mMaterial;
  var float mMaterialWidth;
  var float mMaterialHeight;
  var float mOffsetX;
  var float mOffsetY;
  var Object mParam;
  var Color mDrawColor;
  var GUI_Image mImage;
  var float mImageX;
  var float mImageY;
  var int mIndex;
  var bool mDropSucceeded;


  native function bool IsDragging();


  native function EndDrag();


  native function SetMaterial(Material dragMaterial,float materialWidth,float materialHeight,optional float offsetX,optional float offsetY);


  native function SetImage(GUI_Image image,optional float offsetX,optional float offsetY);


  native function BeginDrag(GUI_Component Source,optional Object Param);



