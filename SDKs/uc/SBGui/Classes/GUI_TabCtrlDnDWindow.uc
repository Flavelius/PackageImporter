//==============================================================================
//  GUI_TabCtrlDnDWindow
//==============================================================================

class GUI_TabCtrlDnDWindow extends GUI_Window
    native
    dependsOn(Object,GUI_TabCtrl)
    Transient
    Config(User)
  ;

  var GUI_Page mOwnerTabCtrl;


  event OnEndMoving() {
    local GUI_Page draggedPage;
    if (mOwnerTabCtrl != None
      && mOwnerTabCtrl.IsOver(mDesktop.GetMouseX(),mDesktop.GetMouseY())) {//0000 : 07 C1 00 82 77 01 B8 21 A2 19 2A 16 18 2E 00 19 01 B8 21 A2 19 24 00 04 1B B8 9B 00 00 19 01 48 0C 9D 19 06 00 04 1B BB 98 00 00 16 19 01 48 0C 9D 19 06 00 04 1B BC 98 00 00 16 16 16 
      if (mObjectTag != None && mObjectTag.IsA('GUI_Page')
        && mOwnerTabCtrl.IsA('GUI_TabCtrl')) {//003D : 07 C1 00 82 82 77 01 48 91 31 16 2A 16 18 12 00 19 01 48 91 31 16 08 00 04 61 2F 21 6F 97 00 00 16 16 18 12 00 19 01 B8 21 A2 19 08 00 04 61 2F 21 FA 97 00 00 16 16 
        draggedPage = GUI_Page(mObjectTag);                                     //0074 : 0F 00 58 6B A7 19 2E D8 E5 2E 1D 01 48 91 31 16 
        DetachComponent(draggedPage);                                           //0084 : 1B 8F 9B 00 00 00 58 6B A7 19 16 
        GUI_TabCtrl(mOwnerTabCtrl).DropPage(draggedPage,mWindowTitle);          //008F : 19 2E A0 6E 2F 1D 01 B8 21 A2 19 10 00 00 1B BC 96 00 00 00 58 6B A7 19 01 20 53 A1 19 16 
        mDesktop.DestroyWindow(mWindowHandle);                                  //00AD : 19 01 48 0C 9D 19 0B 00 00 1B 54 2D 00 00 01 E8 77 9E 19 16 
      }
    }
    //07 C1 00 82 77 01 B8 21 A2 19 2A 16 18 2E 00 19 01 B8 21 A2 19 24 00 04 1B B8 9B 00 00 19 01 48 
    //0C 9D 19 06 00 04 1B BB 98 00 00 16 19 01 48 0C 9D 19 06 00 04 1B BC 98 00 00 16 16 16 07 C1 00 
    //82 82 77 01 48 91 31 16 2A 16 18 12 00 19 01 48 91 31 16 08 00 04 61 2F 21 6F 97 00 00 16 16 18 
    //12 00 19 01 B8 21 A2 19 08 00 04 61 2F 21 FA 97 00 00 16 16 0F 00 58 6B A7 19 2E D8 E5 2E 1D 01 
    //48 91 31 16 1B 8F 9B 00 00 00 58 6B A7 19 16 19 2E A0 6E 2F 1D 01 B8 21 A2 19 10 00 00 1B BC 96 
    //00 00 00 58 6B A7 19 01 20 53 A1 19 16 19 01 48 0C 9D 19 0B 00 00 1B 54 2D 00 00 01 E8 77 9E 19 
    //16 04 0B 47 
  }



