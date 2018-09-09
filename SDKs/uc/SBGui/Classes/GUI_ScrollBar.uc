//==============================================================================
//  GUI_ScrollBar
//==============================================================================

class GUI_ScrollBar extends GUI_Page
    native
    dependsOn()
    Transient
    Config(User)
  ;

  const SCROLLBAR_SIZE_W =  17.0f;
  const GUI_SBS_VERTICAL =  1;
  const GUI_SBS_HORIZONTAL =  0;
  var int mDirection;
  var float mScrollRange;
  var float mScrollOffset;
  var float mMoveAnchor[2];
  var bool mRemoveWhenDisabled;
  var GUI_Button mUpButton;
  var GUI_Button mDownButton;
  var GUI_Button mThumbnail;
  var GUI_Page mThumbnailBackground;


  native function ScrollToEnd();


  native function SetEnabled(bool State);


  native function SetScrollOffset(float Offset);



