//==============================================================================
//  GED_Editor
//==============================================================================

class GED_Editor extends GUI_Window
    native
    dependsOn()
    Transient
    Config(User)
  ;

  const GED_EXPORT_COMPONENT_LIST_NAME =  "componentVector";
  const GED_EXPORT_VAR_NAME =  "currentComponent";
  var GUI_Window mCurrentWindow;
  var GUI_Component mCurrentComponent;
  var GUI_Image mCurrentImage;
  var array<GUI_Component> mSessionComponents;
  var bool mDebugSession;


  native function Deregister(string aName);


  native function Register(GUI_Component aComponent,string aName);


  function bool ResolveComponents(out array<string> filenames,out array<string> references,out array<GUI_Component> Result) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 68 6B A1 19 25 
    while (i < filenames.Length) {                                              //0007 : 07 45 00 96 00 68 6B A1 19 37 00 E8 69 A1 19 16 
      if (ShowWindow(filenames[i],Class'GUI_BaseDesktop'.2) == None) {          //0017 : 07 3B 00 72 1B 57 2D 00 00 10 00 68 6B A1 19 00 E8 69 A1 19 12 20 00 68 D7 00 02 00 04 2C 02 16 2A 16 
        return False;                                                           //0039 : 04 28 
      }
      i++;                                                                      //003B : A5 00 68 6B A1 19 16 
    }
    i = 0;                                                                      //0045 : 0F 00 68 6B A1 19 25 
    while (i < references.Length) {                                             //004C : 07 9B 00 96 00 68 6B A1 19 37 00 E0 6B A1 19 16 
      Result[Result.Length] = RetrieveComponent(references[i]);                 //005C : 0F 10 37 00 58 6C A1 19 00 58 6C A1 19 1B 15 98 00 00 10 00 68 6B A1 19 00 E0 6B A1 19 16 
      if (Result[Result.Length - 1] == None) {                                  //007A : 07 91 00 72 10 93 37 00 58 6C A1 19 26 16 00 58 6C A1 19 2A 16 
        return False;                                                           //008F : 04 28 
      }
      i++;                                                                      //0091 : A5 00 68 6B A1 19 16 
    }
    return True;                                                                //009B : 04 27 
    //0F 00 68 6B A1 19 25 07 45 00 96 00 68 6B A1 19 37 00 E8 69 A1 19 16 07 3B 00 72 1B 57 2D 00 00 
    //10 00 68 6B A1 19 00 E8 69 A1 19 12 20 00 68 D7 00 02 00 04 2C 02 16 2A 16 04 28 A5 00 68 6B A1 
    //19 16 06 07 00 0F 00 68 6B A1 19 25 07 9B 00 96 00 68 6B A1 19 37 00 E0 6B A1 19 16 0F 10 37 00 
    //58 6C A1 19 00 58 6C A1 19 1B 15 98 00 00 10 00 68 6B A1 19 00 E0 6B A1 19 16 07 91 00 72 10 93 
    //37 00 58 6C A1 19 26 16 00 58 6C A1 19 2A 16 04 28 A5 00 68 6B A1 19 16 06 4C 00 04 27 04 0B 47 
    //
  }


  function bool OnEndDragHandler(GUI_DnDInfo dndInfo) {
    HandleEndDrag(dndInfo);                                                     //0000 : 1B 6D 9B 00 00 00 60 6F A1 19 16 
    return True;                                                                //000B : 04 27 
    //1B 6D 9B 00 00 00 60 6F A1 19 16 04 27 04 0B 47 
  }


  function bool OnDropHandler(GUI_DnDInfo dndInfo,float relMouseX,float relMouseY,GUI_Component fromChild) {
    HandleDropEvent(dndInfo,relMouseX,relMouseY,fromChild);                     //0000 : 1B 70 9B 00 00 00 40 71 A1 19 00 10 72 A1 19 00 88 72 A1 19 00 00 73 A1 19 16 
    return True;                                                                //001A : 04 27 
    //1B 70 9B 00 00 00 40 71 A1 19 00 10 72 A1 19 00 88 72 A1 19 00 00 73 A1 19 16 04 27 04 0B 47 
  }


  function bool OnDragHandler(GUI_DnDInfo dndInfo,float relMouseX,float relMouseY,GUI_Component fromChild) {
    HandleDragEvent(dndInfo,relMouseX,relMouseY,fromChild);                     //0000 : 1B 71 9B 00 00 00 A0 74 A1 19 00 70 75 A1 19 00 E8 75 A1 19 00 60 76 A1 19 16 
    return True;                                                                //001A : 04 27 
    //1B 71 9B 00 00 00 A0 74 A1 19 00 70 75 A1 19 00 E8 75 A1 19 00 60 76 A1 19 16 04 27 04 0B 47 
  }


  function bool OnClickHandler(GUI_Button clickedButton) {
    HandleClickEvent(clickedButton);                                            //0000 : 1B 72 9B 00 00 00 00 78 A1 19 16 
    return True;                                                                //000B : 04 27 
    //1B 72 9B 00 00 00 00 78 A1 19 16 04 27 04 0B 47 
  }


  native function DumpRegistry();


  native function GUI_Window ReloadWindow(string fileName);


  native function GUI_Window GetWindow(string fileName);


  native function GUI_Window ShowWindow(string fileName,int ShowFlags);


  native function Flush();


  native function GUI_Component RetrieveComponent(string Name);


  native function Attach(GUI_Component Source,string specificationFile);


  native function HandleEndDrag(GUI_DnDInfo dndInfo);


  native function HandleDropEvent(GUI_DnDInfo dndInfo,float relMouseX,float relMouseY,GUI_Component fromChild);


  native function HandleDragEvent(GUI_DnDInfo dndInfo,float relMouseX,float relMouseY,GUI_Component fromChild);


  native function HandleClickEvent(GUI_Component Source);


  native function Parse(string Input);



