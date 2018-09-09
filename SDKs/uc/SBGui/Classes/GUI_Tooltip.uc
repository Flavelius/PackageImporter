//==============================================================================
//  GUI_Tooltip
//==============================================================================

class GUI_Tooltip extends GUI_Window
    native
    exportstructs
    dependsOn(GUI_ObjectTooltipPage,GUI_TextCtrl)
    Transient
    Config(User)
  ;

  struct ObjectTooltipPage {
      var GUI_ObjectTooltipPage ObjectTooltipPage;
      var string ObjectPageClassName;

  };


  var private GUI_Window mHelperWindow;
  var private GUI_TextCtrl mTextControl;
  var private globalconfig float mTooltipAppearanceDelay;
  var private globalconfig float mTooltipFadeInTime;
  var private Object mCurrentObject;
  var private string mCurrentText;
  var private Actor mCurrentActor;
  var private GUI_Component mCurrentComponent;
  var private float mTooltipTimer;
  var private array<ObjectTooltipPage> ObjectTooltipPages;
  var private int mCurrentObjectPageID;


  event ResetTooltip() {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 68 9F A3 19 25 
    while (i < ObjectTooltipPages.Length) {                                     //0007 : 07 3C 00 96 00 68 9F A3 19 37 01 90 A0 A3 19 16 
      ObjectTooltipPages[i].ObjectTooltipPage.SetVisible(False);                //0017 : 19 36 90 A1 A3 19 10 00 68 9F A3 19 01 90 A0 A3 19 07 00 00 1B 14 98 00 00 28 16 
      i++;                                                                      //0032 : A5 00 68 9F A3 19 16 
    }
    mTextControl.Empty();                                                       //003C : 19 01 08 A2 A3 19 06 00 00 1B BE 1A 00 00 16 
    mTextControl.SetVisible(False);                                             //004B : 19 01 08 A2 A3 19 07 00 00 1B 14 98 00 00 28 16 
    //0F 00 68 9F A3 19 25 07 3C 00 96 00 68 9F A3 19 37 01 90 A0 A3 19 16 19 36 90 A1 A3 19 10 00 68 
    //9F A3 19 01 90 A0 A3 19 07 00 00 1B 14 98 00 00 28 16 A5 00 68 9F A3 19 16 06 07 00 19 01 08 A2 
    //A3 19 06 00 00 1B BE 1A 00 00 16 19 01 08 A2 A3 19 07 00 00 1B 14 98 00 00 28 16 04 0B 47 
  }


  event bool ShowObjectTooltip(Object aObject,string aObjectPageClassName) {
    local GUI_ObjectTooltipPage lPage;
    local int i;
    local bool ret;
    if (aObject != None && aObjectPageClassName != "") {                        //0000 : 07 43 01 82 77 00 58 A3 A3 19 2A 16 18 0A 00 7B 00 C0 A5 A3 19 1F 00 16 16 
      i = 0;                                                                    //0019 : 0F 00 38 A6 A3 19 25 
      while (i < ObjectTooltipPages.Length) {                                   //0020 : 07 88 00 96 00 38 A6 A3 19 37 01 90 A0 A3 19 16 
        if (ObjectTooltipPages[i].ObjectPageClassName == aObjectPageClassName) {//0030 : 07 7E 00 7A 36 B0 A6 A3 19 10 00 38 A6 A3 19 01 90 A0 A3 19 00 C0 A5 A3 19 16 
          lPage = ObjectTooltipPages[i].ObjectTooltipPage;                      //004A : 0F 00 28 A7 A3 19 36 90 A1 A3 19 10 00 38 A6 A3 19 01 90 A0 A3 19 
          lPage.SetVisible(True);                                               //0060 : 19 00 28 A7 A3 19 07 00 00 1B 14 98 00 00 27 16 
          mCurrentObjectPageID = i;                                             //0070 : 0F 01 A0 A7 A3 19 00 38 A6 A3 19 
          goto jl0088;                                                          //007B : 06 88 00 
        }
        i++;                                                                    //007E : A5 00 38 A6 A3 19 16 
      }
      if (lPage == None) {                                                      //0088 : 07 FF 00 72 00 28 A7 A3 19 2A 16 
        lPage = GUI_ObjectTooltipPage(CreatePage(aObjectPageClassName,0,0,0,0,0,0));//0093 : 0F 00 28 A7 A3 19 2E E8 C2 2F 1D 1B 16 98 00 00 00 C0 A5 A3 19 25 25 25 25 25 25 16 
        ObjectTooltipPages.Insert(ObjectTooltipPages.Length,1);                 //00AF : 40 01 90 A0 A3 19 37 01 90 A0 A3 19 26 
        ObjectTooltipPages[ObjectTooltipPages.Length - 1].ObjectTooltipPage = lPage;//00BC : 0F 36 90 A1 A3 19 10 93 37 01 90 A0 A3 19 26 16 01 90 A0 A3 19 00 28 A7 A3 19 
        ObjectTooltipPages[ObjectTooltipPages.Length - 1].ObjectPageClassName = aObjectPageClassName;//00D6 : 0F 36 B0 A6 A3 19 10 93 37 01 90 A0 A3 19 26 16 01 90 A0 A3 19 00 C0 A5 A3 19 
        mCurrentObjectPageID = ObjectTooltipPages.Length - 1;                   //00F0 : 0F 01 A0 A7 A3 19 93 37 01 90 A0 A3 19 26 16 
      }
      ret = lPage.UpdateTooltipObject(aObject);                                 //00FF : 14 2D 00 A8 A8 A3 19 19 00 28 A7 A3 19 0B 00 04 1B 72 98 00 00 00 58 A3 A3 19 16 
      SetClientDimensions(lPage.mWidth,lPage.mHeight);                          //011A : 1B BC 9B 00 00 19 00 28 A7 A3 19 05 00 04 01 60 87 31 16 19 00 28 A7 A3 19 05 00 04 01 40 88 31 16 16 
      return ret;                                                               //013C : 04 2D 00 A8 A8 A3 19 
    }
    return False;                                                               //0143 : 04 28 
    //07 43 01 82 77 00 58 A3 A3 19 2A 16 18 0A 00 7B 00 C0 A5 A3 19 1F 00 16 16 0F 00 38 A6 A3 19 25 
    //07 88 00 96 00 38 A6 A3 19 37 01 90 A0 A3 19 16 07 7E 00 7A 36 B0 A6 A3 19 10 00 38 A6 A3 19 01 
    //90 A0 A3 19 00 C0 A5 A3 19 16 0F 00 28 A7 A3 19 36 90 A1 A3 19 10 00 38 A6 A3 19 01 90 A0 A3 19 
    //19 00 28 A7 A3 19 07 00 00 1B 14 98 00 00 27 16 0F 01 A0 A7 A3 19 00 38 A6 A3 19 06 88 00 A5 00 
    //38 A6 A3 19 16 06 20 00 07 FF 00 72 00 28 A7 A3 19 2A 16 0F 00 28 A7 A3 19 2E E8 C2 2F 1D 1B 16 
    //98 00 00 00 C0 A5 A3 19 25 25 25 25 25 25 16 40 01 90 A0 A3 19 37 01 90 A0 A3 19 26 0F 36 90 A1 
    //A3 19 10 93 37 01 90 A0 A3 19 26 16 01 90 A0 A3 19 00 28 A7 A3 19 0F 36 B0 A6 A3 19 10 93 37 01 
    //90 A0 A3 19 26 16 01 90 A0 A3 19 00 C0 A5 A3 19 0F 01 A0 A7 A3 19 93 37 01 90 A0 A3 19 26 16 14 
    //2D 00 A8 A8 A3 19 19 00 28 A7 A3 19 0B 00 04 1B 72 98 00 00 00 58 A3 A3 19 16 1B BC 9B 00 00 19 
    //00 28 A7 A3 19 05 00 04 01 60 87 31 16 19 00 28 A7 A3 19 05 00 04 01 40 88 31 16 16 04 2D 00 A8 
    //A8 A3 19 04 28 04 0B 47 
  }


  function Initialize() {
    Super.Initialize();                                                         //0000 : 1C 28 9E 9E 19 16 
    SetStdBackground(Class'GUI_BaseDesktop'.9);                                 //0006 : 1B 22 98 00 00 12 20 00 68 D7 00 02 00 04 2C 09 16 
    mTextControl = GUI_TextCtrl(CreatePage("GUI_TextCtrl",0,0,0,0,0,0));        //0017 : 0F 01 08 A2 A3 19 2E 20 79 2F 1D 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 25 25 25 25 25 16 
    mTextControl.SetBorder(4,0,4,2);                                            //003C : 19 01 08 A2 A3 19 0D 00 00 1B 2B 98 00 00 2C 04 25 2C 04 2C 02 16 
    mTextControl.SetSolidBackground(158.00000000,154.00000000,168.00000000,255.00000000);//0052 : 19 01 08 A2 A3 19 1A 00 00 1B 52 98 00 00 1E 00 00 1E 43 1E 00 00 1A 43 1E 00 00 28 43 1E 00 00 7F 43 16 
    mTextControl.SetColor(0,0,0);                                               //0075 : 19 01 08 A2 A3 19 09 00 00 1B 19 98 00 00 25 25 25 16 
    mTextControl.SetUseColorCodes(True);                                        //0087 : 19 01 08 A2 A3 19 07 00 00 1B CB 98 00 00 27 16 
    //1C 28 9E 9E 19 16 1B 22 98 00 00 12 20 00 68 D7 00 02 00 04 2C 09 16 0F 01 08 A2 A3 19 2E 20 79 
    //2F 1D 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 25 25 25 25 25 16 19 01 08 A2 
    //A3 19 0D 00 00 1B 2B 98 00 00 2C 04 25 2C 04 2C 02 16 19 01 08 A2 A3 19 1A 00 00 1B 52 98 00 00 
    //1E 00 00 1E 43 1E 00 00 1A 43 1E 00 00 28 43 1E 00 00 7F 43 16 19 01 08 A2 A3 19 09 00 00 1B 19 
    //98 00 00 25 25 25 16 19 01 08 A2 A3 19 07 00 00 1B CB 98 00 00 27 16 04 0B 47 
  }



