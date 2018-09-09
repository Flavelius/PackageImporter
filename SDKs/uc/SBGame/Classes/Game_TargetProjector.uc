//==============================================================================
//  Game_TargetProjector
//==============================================================================

class Game_TargetProjector extends DynamicProjector
    dependsOn()
  ;

  var float currentRoll;
  var Rotator currentRotation;
  var float Height;
  var float targetScale;
  var float currentScale;


  function LoadTargetTexture() {
    local Material Tex;
    Tex = Material(static.DynamicLoadObject("SBGuiTX.Projectors.RangedCombiner01",Class'Combiner'));//0000 : 0F 00 E0 9A 32 11 2E C0 6D C3 00 1C 60 E7 69 0F 1F 53 42 47 75 69 54 58 2E 50 72 6F 6A 65 63 74 6F 72 73 2E 52 61 6E 67 65 64 43 6F 6D 62 69 6E 65 72 30 31 00 20 40 8D C3 00 16 
    if (Tex != None) {                                                          //003B : 07 54 00 77 00 E0 9A 32 11 2A 16 
      ProjTexture = Tex;                                                        //0046 : 0F 01 08 8D 7E 0F 00 E0 9A 32 11 
      goto jl0054;                                                              //0051 : 06 54 00 
    }
    //0F 00 E0 9A 32 11 2E C0 6D C3 00 1C 60 E7 69 0F 1F 53 42 47 75 69 54 58 2E 50 72 6F 6A 65 63 74 
    //6F 72 73 2E 52 61 6E 67 65 64 43 6F 6D 62 69 6E 65 72 30 31 00 20 40 8D C3 00 16 07 54 00 77 00 
    //E0 9A 32 11 2A 16 0F 01 08 8D 7E 0F 00 E0 9A 32 11 06 54 00 04 0B 47 
  }


  function SetIsVisible(bool B) {
    if (B) {                                                                    //0000 : 07 17 00 2D 00 A8 9C 32 11 
      MaxTraceDistance = 10000;                                                 //0009 : 0F 01 C0 8E 7E 0F 1D 10 27 00 00 
    } else {                                                                    //0014 : 06 1E 00 
      MaxTraceDistance = 0;                                                     //0017 : 0F 01 C0 8E 7E 0F 25 
    }
    //07 17 00 2D 00 A8 9C 32 11 0F 01 C0 8E 7E 0F 1D 10 27 00 00 06 1E 00 0F 01 C0 8E 7E 0F 25 04 0B 
    //47 
  }


  function bool IsVisible() {
    return MaxTraceDistance > 0;                                                //0000 : 04 97 01 C0 8E 7E 0F 25 16 
    //04 97 01 C0 8E 7E 0F 25 16 04 0B 47 
  }


  function ProjectOnToLocation(Vector projectionLocation,Vector Origin,float MaxDistance) {
    targetScale = MaxDistance;                                                  //0000 : 0F 01 C8 9F 32 11 00 40 A0 32 11 
    SetIsVisible(True);                                                         //000B : 1B 5F 0C 00 00 27 16 
    ExecuteProjection(projectionLocation);                                      //0012 : 1B 9B 0F 00 00 00 F8 9E 32 11 16 
    //0F 01 C8 9F 32 11 00 40 A0 32 11 1B 5F 0C 00 00 27 16 1B 9B 0F 00 00 00 F8 9E 32 11 16 04 0B 47 
    //
  }


  function ExecuteProjection(Vector projectionLocation) {
    local Vector NewLocation;
    if (IsVisible()) {                                                          //0000 : 07 68 00 1B 9A 0F 00 00 16 
      if (ProjTexture == None) {                                                //0009 : 07 1A 00 72 01 08 8D 7E 0F 2A 16 
        LoadTargetTexture();                                                    //0014 : 1B 99 0F 00 00 16 
      }
      NewLocation = projectionLocation;                                         //001A : 0F 00 E0 A2 32 11 00 A8 A1 32 11 
      NewLocation.Z += Height;                                                  //0025 : B8 36 38 C5 69 0F 00 E0 A2 32 11 01 58 A3 32 11 16 
      SetLocation(NewLocation);                                                 //0036 : 61 0B 00 E0 A2 32 11 16 
      currentRotation = rotator(projectionLocation - Location);                 //003E : 0F 01 D0 A3 32 11 39 50 D8 00 A8 A1 32 11 01 30 81 6C 0F 16 
      SetRotation(currentRotation);                                             //0052 : 1C 70 01 6E 0F 01 D0 A3 32 11 16 
      SetDrawScale(targetScale);                                                //005D : 1C B8 97 6B 0F 01 C8 9F 32 11 16 
    }
    //07 68 00 1B 9A 0F 00 00 16 07 1A 00 72 01 08 8D 7E 0F 2A 16 1B 99 0F 00 00 16 0F 00 E0 A2 32 11 
    //00 A8 A1 32 11 B8 36 38 C5 69 0F 00 E0 A2 32 11 01 58 A3 32 11 16 61 0B 00 E0 A2 32 11 16 0F 01 
    //D0 A3 32 11 39 50 D8 00 A8 A1 32 11 01 30 81 6C 0F 16 1C 70 01 6E 0F 01 D0 A3 32 11 16 1C B8 97 
    //6B 0F 01 C8 9F 32 11 16 04 0B 47 
  }



