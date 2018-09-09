//==============================================================================
//  GUI_ContextWindow
//==============================================================================

class GUI_ContextWindow extends GUI_Window
    native
    dependsOn(GUI_Component)
    Transient
    Config(User)
  ;

  var GUI_Component mWatchedComponent;
  var GUI_Component mWatchedChild;


  event CloseMenu() {
    mDesktop.ShowGUIWindow(self,2);                                             //0000 : 19 01 48 0C 9D 19 09 00 00 1B 51 98 00 00 17 2C 02 16 
    if (mWatchedChild != None) {                                                //0012 : 07 8A 00 77 01 B8 DC A2 19 2A 16 
      if (mWatchedChild.IsA('GUI_ContextWindow')) {                             //001D : 07 48 00 19 01 B8 DC A2 19 08 00 04 61 2F 21 A1 97 00 00 16 
        GUI_ContextWindow(mWatchedChild).CloseMenu();                           //0031 : 19 2E 28 9E 2F 1D 01 B8 DC A2 19 06 00 00 1B D0 2B 00 00 16 
      } else {                                                                  //0045 : 06 8A 00 
        if (mWatchedChild.IsA('GUI_Window')) {                                  //0048 : 07 7A 00 19 01 B8 DC A2 19 08 00 04 61 2F 21 6E 97 00 00 16 
          mDesktop.ShowGUIWindow(GUI_Window(mWatchedChild),2);                  //005C : 19 01 48 0C 9D 19 12 00 00 1B 51 98 00 00 2E 38 EB 2E 1D 01 B8 DC A2 19 2C 02 16 
        } else {                                                                //0077 : 06 8A 00 
          mWatchedChild.SetVisible(False);                                      //007A : 19 01 B8 DC A2 19 07 00 00 1B 14 98 00 00 28 16 
        }
      }
    }
    //19 01 48 0C 9D 19 09 00 00 1B 51 98 00 00 17 2C 02 16 07 8A 00 77 01 B8 DC A2 19 2A 16 07 48 00 
    //19 01 B8 DC A2 19 08 00 04 61 2F 21 A1 97 00 00 16 19 2E 28 9E 2F 1D 01 B8 DC A2 19 06 00 00 1B 
    //D0 2B 00 00 16 06 8A 00 07 7A 00 19 01 B8 DC A2 19 08 00 04 61 2F 21 6E 97 00 00 16 19 01 48 0C 
    //9D 19 12 00 00 1B 51 98 00 00 2E 38 EB 2E 1D 01 B8 DC A2 19 2C 02 16 06 8A 00 19 01 B8 DC A2 19 
    //07 00 00 1B 14 98 00 00 28 16 04 0B 47 
  }


  event Initialize() {
    Super.Initialize();                                                         //0000 : 1C 28 9E 9E 19 16 
    SetStdBackground(9);                                                        //0006 : 1B 22 98 00 00 2C 09 16 
    //1C 28 9E 9E 19 16 1B 22 98 00 00 2C 09 16 04 0B 47 
  }



