//==============================================================================
//  TargetProjector
//==============================================================================

class TargetProjector extends DynamicProjector
    dependsOn()
  ;

  var float currentRoll;
  var Rotator currentRotation;
  var float Height;
  var float targetScale;
  var float currentScale;


  function LoadTargetTexture() {
    if (ProjTexture == None) {                                                  //0000 : 07 0B 00 72 01 08 8D 7E 0F 2A 16 
    }
    //07 0B 00 72 01 08 8D 7E 0F 2A 16 04 0B 47 
  }


  function SetIsVisible(bool B) {
    if (B) {                                                                    //0000 : 07 22 00 2D 00 E8 64 4C 23 
      MaxTraceDistance = 10000;                                                 //0009 : 0F 01 C0 8E 7E 0F 1D 10 27 00 00 
      targetScale = 1.00000000;                                                 //0014 : 0F 01 D0 39 47 23 1E 00 00 80 3F 
    } else {                                                                    //001F : 06 29 00 
      MaxTraceDistance = 0;                                                     //0022 : 0F 01 C0 8E 7E 0F 25 
    }
    //07 22 00 2D 00 E8 64 4C 23 0F 01 C0 8E 7E 0F 1D 10 27 00 00 0F 01 D0 39 47 23 1E 00 00 80 3F 06 
    //29 00 0F 01 C0 8E 7E 0F 25 04 0B 47 
  }


  function bool IsVisible() {
    return MaxTraceDistance > 0;                                                //0000 : 04 97 01 C0 8E 7E 0F 25 16 
    //04 97 01 C0 8E 7E 0F 25 16 04 0B 47 
  }


  function ProjectOnToLocation(Vector projectionLocation,Vector Origin,float MinDistance,float MaxDistance) {
    local float Distance;
    Distance = VSize(projectionLocation - Origin);                              //0000 : 0F 00 50 12 4C 23 E1 D8 00 A0 66 87 22 00 80 60 4C 23 16 16 
    SetIsVisible(Distance < MaxDistance && Distance > MinDistance);             //0014 : 1B 5F 0C 00 00 82 B0 00 50 12 4C 23 00 70 61 4C 23 16 18 0D 00 B1 00 50 12 4C 23 00 F8 60 4C 23 16 16 16 
    ExecuteProjection(projectionLocation);                                      //0037 : 1B 9B 0F 00 00 00 A0 66 87 22 16 
    //0F 00 50 12 4C 23 E1 D8 00 A0 66 87 22 00 80 60 4C 23 16 16 1B 5F 0C 00 00 82 B0 00 50 12 4C 23 
    //00 70 61 4C 23 16 18 0D 00 B1 00 50 12 4C 23 00 F8 60 4C 23 16 16 16 1B 9B 0F 00 00 00 A0 66 87 
    //22 16 04 0B 47 
  }


  function ExecuteProjection(Vector projectionLocation) {
    local Vector loc;
    if (IsVisible()) {                                                          //0000 : 07 CC 00 1B 9A 0F 00 00 16 
      if (ProjTexture == None) {                                                //0009 : 07 1A 00 72 01 08 8D 7E 0F 2A 16 
        LoadTargetTexture();                                                    //0014 : 1B 99 0F 00 00 16 
      }
      loc = projectionLocation;                                                 //001A : 0F 00 C8 12 4C 23 00 28 66 87 22 
      loc.Z += Height;                                                          //0025 : B8 36 38 C5 69 0F 00 C8 12 4C 23 01 E0 5E 4C 23 16 
      SetLocation(loc);                                                         //0036 : 61 0B 00 C8 12 4C 23 16 
      currentRotation = rotator(projectionLocation - Location);                 //003E : 0F 01 C8 69 87 22 39 50 D8 00 28 66 87 22 01 30 81 6C 0F 16 
      currentRoll += 20;                                                        //0052 : B8 01 40 51 4C 23 39 3F 2C 14 16 
      currentRotation.Roll = currentRoll;                                       //005D : 0F 36 98 BF 69 0F 01 C8 69 87 22 39 44 01 40 51 4C 23 
      SetRotation(currentRotation);                                             //006F : 1C 70 01 6E 0F 01 C8 69 87 22 16 
      if (currentScale < targetScale) {                                         //007A : 07 9F 00 B0 01 80 76 42 23 01 D0 39 47 23 16 
        currentScale += 0.01000000 * targetScale;                               //0089 : B8 01 80 76 42 23 AB 1E 0A D7 23 3C 01 D0 39 47 23 16 16 
      } else {                                                                  //009C : 06 C1 00 
        if (currentScale < targetScale) {                                       //009F : 07 C1 00 B0 01 80 76 42 23 01 D0 39 47 23 16 
          currentScale -= 0.01000000 * targetScale;                             //00AE : B9 01 80 76 42 23 AB 1E 0A D7 23 3C 01 D0 39 47 23 16 16 
        }
      }
      SetDrawScale(currentScale);                                               //00C1 : 1C B8 97 6B 0F 01 80 76 42 23 16 
    }
    //07 CC 00 1B 9A 0F 00 00 16 07 1A 00 72 01 08 8D 7E 0F 2A 16 1B 99 0F 00 00 16 0F 00 C8 12 4C 23 
    //00 28 66 87 22 B8 36 38 C5 69 0F 00 C8 12 4C 23 01 E0 5E 4C 23 16 61 0B 00 C8 12 4C 23 16 0F 01 
    //C8 69 87 22 39 50 D8 00 28 66 87 22 01 30 81 6C 0F 16 B8 01 40 51 4C 23 39 3F 2C 14 16 0F 36 98 
    //BF 69 0F 01 C8 69 87 22 39 44 01 40 51 4C 23 1C 70 01 6E 0F 01 C8 69 87 22 16 07 9F 00 B0 01 80 
    //76 42 23 01 D0 39 47 23 16 B8 01 80 76 42 23 AB 1E 0A D7 23 3C 01 D0 39 47 23 16 16 06 C1 00 07 
    //C1 00 B0 01 80 76 42 23 01 D0 39 47 23 16 B9 01 80 76 42 23 AB 1E 0A D7 23 3C 01 D0 39 47 23 16 
    //16 1C B8 97 6B 0F 01 80 76 42 23 16 04 0B 47 
  }



