//==============================================================================
//  ShadowProjector
//==============================================================================

class ShadowProjector extends Projector
    native
    dependsOn(ShadowBitmapMaterial,ObjectPool)
  ;

  var (ShadowProjector) Actor ShadowActor;
  var (ShadowProjector) Vector LightDirection;
  var (ShadowProjector) float LightDistance;
  var (ShadowProjector) bool RootMotion;
  var (ShadowProjector) bool bBlobShadow;
  var (ShadowProjector) bool bShadowActive;
  var ShadowBitmapMaterial ShadowTexture;


  event cl_OnTick(float delta) {
    UpdateShadow();                                                             //0000 : 1B 6D 2B 00 00 16 
    //1B 6D 2B 00 00 16 04 0B 47 
  }


  function UpdateShadow() {
    local Coords C;
    DetachProjector(True);                                                      //0000 : 1B DF 12 00 00 27 16 
    if (ShadowActor != None && !ShadowActor.bHidden
      && ShadowActor.OverlayColor.A > 0
      && ShadowTexture != None
      && bShadowActive) {//0007 : 07 12 01 82 82 82 82 77 01 88 EB 18 11 2A 16 18 12 00 81 19 01 88 EB 18 11 06 00 04 2D 01 48 5E 6E 0F 16 16 18 19 00 97 39 3A 36 48 91 6A 0F 19 01 88 EB 18 11 05 00 04 01 E0 8C 6E 0F 25 16 16 18 09 00 77 01 B0 55 2C 11 2A 16 16 18 07 00 2D 01 58 50 2C 11 16 
      if (ShadowTexture.Invalid) {                                              //005D : 07 75 00 19 01 B0 55 2C 11 06 00 04 2D 01 28 56 2C 11 
        Destroy();                                                              //006F : 61 17 16 
      } else {                                                                  //0072 : 06 12 01 
        if (RootMotion && ShadowActor.DrawType == 2
          && ShadowActor.Mesh != None) {//0075 : 07 D9 00 82 82 2D 01 68 ED 18 11 18 17 00 9A 39 3A 19 01 88 EB 18 11 05 00 01 01 60 99 6C 0F 39 3A 24 02 16 16 18 12 00 77 19 01 88 EB 18 11 05 00 04 01 D8 99 6C 0F 2A 16 16 
          C = ShadowActor.GetBoneCoords('None');                                //00AF : 0F 00 90 53 2C 11 19 01 88 EB 18 11 0B 00 30 1C 98 BC 6D 0F 21 00 00 00 00 16 
          SetLocation(C.Origin);                                                //00C9 : 61 0B 36 A0 D7 6B 0F 00 90 53 2C 11 16 
        } else {                                                                //00D6 : 06 EA 00 
          SetLocation(ShadowActor.Location);                                    //00D9 : 61 0B 19 01 88 EB 18 11 05 00 0C 01 30 81 6C 0F 16 
        }
        SetRotation(rotator(Normal(-LightDirection)));                          //00EA : 1C 70 01 6E 0F 39 50 E2 D3 01 78 EC 18 11 16 16 16 
        ShadowTexture.Dirty = True;                                             //00FB : 14 19 01 B0 55 2C 11 06 00 04 2D 01 A0 56 2C 11 27 
        AttachProjector();                                                      //010C : 1B 9F 2A 00 00 16 
      }
    }
    //1B DF 12 00 00 27 16 07 12 01 82 82 82 82 77 01 88 EB 18 11 2A 16 18 12 00 81 19 01 88 EB 18 11 
    //06 00 04 2D 01 48 5E 6E 0F 16 16 18 19 00 97 39 3A 36 48 91 6A 0F 19 01 88 EB 18 11 05 00 04 01 
    //E0 8C 6E 0F 25 16 16 18 09 00 77 01 B0 55 2C 11 2A 16 16 18 07 00 2D 01 58 50 2C 11 16 07 75 00 
    //19 01 B0 55 2C 11 06 00 04 2D 01 28 56 2C 11 61 17 16 06 12 01 07 D9 00 82 82 2D 01 68 ED 18 11 
    //18 17 00 9A 39 3A 19 01 88 EB 18 11 05 00 01 01 60 99 6C 0F 39 3A 24 02 16 16 18 12 00 77 19 01 
    //88 EB 18 11 05 00 04 01 D8 99 6C 0F 2A 16 16 0F 00 90 53 2C 11 19 01 88 EB 18 11 0B 00 30 1C 98 
    //BC 6D 0F 21 00 00 00 00 16 61 0B 36 A0 D7 6B 0F 00 90 53 2C 11 16 06 EA 00 61 0B 19 01 88 EB 18 
    //11 05 00 0C 01 30 81 6C 0F 16 1C 70 01 6E 0F 39 50 E2 D3 01 78 EC 18 11 16 16 16 14 19 01 B0 55 
    //2C 11 06 00 04 2D 01 A0 56 2C 11 27 1B 9F 2A 00 00 16 04 0B 47 
  }


  function InitShadow() {
    local Plane BoundingSphere;
    local ObjectPool localObjectPool;
    if (ShadowActor != None) {                                                  //0000 : 07 A4 01 77 01 88 EB 18 11 2A 16 
      BoundingSphere = ShadowActor.GetRenderBoundingSphere();                   //000B : 0F 00 C8 57 2C 11 19 01 88 EB 18 11 06 00 10 1C 88 93 6D 0F 16 
      FOV = static.Asin((BoundingSphere.W + 80) / LightDistance) * 180 / 3.14159274;//0020 : 0F 01 48 8E 7E 0F 39 44 AC AB 1C D0 17 6B 0F AC AE 36 48 C9 6B 0F 00 C8 57 2C 11 39 3F 2C 50 16 01 F0 EC 18 11 16 16 39 3F 2C B4 16 1E DB 0F 49 40 16 
      localObjectPool = Level.GetObjectPool();                                  //0052 : 0F 00 E0 5A 2C 11 19 01 D8 7E 6C 0F 06 00 04 1B 52 2B 00 00 16 
      ShadowTexture = ShadowBitmapMaterial(localObjectPool.AllocateObject(Class'ShadowBitmapMaterial'));//0067 : 0F 01 B0 55 2C 11 2E 50 AC D5 00 19 00 E0 5A 2C 11 0B 00 04 1B 73 2C 00 00 20 50 AC D5 00 16 
      ProjTexture = ShadowTexture;                                              //0086 : 0F 01 08 8D 7E 0F 01 B0 55 2C 11 
      if (ShadowTexture != None) {                                              //0091 : 07 6D 01 77 01 B0 55 2C 11 2A 16 
        SetDrawScale(LightDistance * Tan(0.50000000 * FOV * 3.14159274 / 180) / 0.50000000);//009C : 1C B8 97 6B 0F AC AB 01 F0 EC 18 11 BD AC AB AB 1E 00 00 00 3F 39 3F 01 48 8E 7E 0F 16 1E DB 0F 49 40 16 39 3F 2C B4 16 16 16 1E 00 00 00 3F 16 16 
        ShadowTexture.Invalid = False;                                          //00CD : 14 19 01 B0 55 2C 11 06 00 04 2D 01 28 56 2C 11 28 
        ShadowTexture.bBlobShadow = bBlobShadow;                                //00DE : 14 19 01 B0 55 2C 11 06 00 04 2D 01 58 5B 2C 11 2D 01 00 EC 18 11 
        ShadowTexture.ShadowActor = ShadowActor;                                //00F4 : 0F 19 01 B0 55 2C 11 05 00 04 01 D0 5B 2C 11 01 88 EB 18 11 
        ShadowTexture.LightDirection = Normal(LightDirection);                  //0108 : 0F 19 01 B0 55 2C 11 05 00 0C 01 48 5C 2C 11 E2 01 78 EC 18 11 16 
        ShadowTexture.LightDistance = LightDistance;                            //011E : 0F 19 01 B0 55 2C 11 05 00 04 01 C0 5C 2C 11 01 F0 EC 18 11 
        ShadowTexture.LightFOV = FOV;                                           //0132 : 0F 19 01 B0 55 2C 11 05 00 04 01 38 5D 2C 11 39 3F 01 48 8E 7E 0F 
        ShadowTexture.CullDistance = CullDistance;                              //0148 : 0F 19 01 B0 55 2C 11 05 00 04 01 B0 5D 2C 11 01 98 B7 6C 0F 
        SBWantClientTick = True;                                                //015C : 14 2D 01 F0 0F 6F 0F 27 
        UpdateShadow();                                                         //0164 : 1B 6D 2B 00 00 16 
      } else {                                                                  //016A : 06 A1 01 
        Log(string(Name)
          $ ".InitShadow: Failed to allocate texture");//016D : E7 70 39 57 01 F0 E4 6B 0F 1F 2E 49 6E 69 74 53 68 61 64 6F 77 3A 20 46 61 69 6C 65 64 20 74 6F 20 61 6C 6C 6F 63 61 74 65 20 74 65 78 74 75 72 65 00 16 16 
      }
    } else {                                                                    //01A1 : 06 C6 01 
      Log(string(Name) $ ".InitShadow: No actor");                              //01A4 : E7 70 39 57 01 F0 E4 6B 0F 1F 2E 49 6E 69 74 53 68 61 64 6F 77 3A 20 4E 6F 20 61 63 74 6F 72 00 16 16 
    }
    //07 A4 01 77 01 88 EB 18 11 2A 16 0F 00 C8 57 2C 11 19 01 88 EB 18 11 06 00 10 1C 88 93 6D 0F 16 
    //0F 01 48 8E 7E 0F 39 44 AC AB 1C D0 17 6B 0F AC AE 36 48 C9 6B 0F 00 C8 57 2C 11 39 3F 2C 50 16 
    //01 F0 EC 18 11 16 16 39 3F 2C B4 16 1E DB 0F 49 40 16 0F 00 E0 5A 2C 11 19 01 D8 7E 6C 0F 06 00 
    //04 1B 52 2B 00 00 16 0F 01 B0 55 2C 11 2E 50 AC D5 00 19 00 E0 5A 2C 11 0B 00 04 1B 73 2C 00 00 
    //20 50 AC D5 00 16 0F 01 08 8D 7E 0F 01 B0 55 2C 11 07 6D 01 77 01 B0 55 2C 11 2A 16 1C B8 97 6B 
    //0F AC AB 01 F0 EC 18 11 BD AC AB AB 1E 00 00 00 3F 39 3F 01 48 8E 7E 0F 16 1E DB 0F 49 40 16 39 
    //3F 2C B4 16 16 16 1E 00 00 00 3F 16 16 14 19 01 B0 55 2C 11 06 00 04 2D 01 28 56 2C 11 28 14 19 
    //01 B0 55 2C 11 06 00 04 2D 01 58 5B 2C 11 2D 01 00 EC 18 11 0F 19 01 B0 55 2C 11 05 00 04 01 D0 
    //5B 2C 11 01 88 EB 18 11 0F 19 01 B0 55 2C 11 05 00 0C 01 48 5C 2C 11 E2 01 78 EC 18 11 16 0F 19 
    //01 B0 55 2C 11 05 00 04 01 C0 5C 2C 11 01 F0 EC 18 11 0F 19 01 B0 55 2C 11 05 00 04 01 38 5D 2C 
    //11 39 3F 01 48 8E 7E 0F 0F 19 01 B0 55 2C 11 05 00 04 01 B0 5D 2C 11 01 98 B7 6C 0F 14 2D 01 F0 
    //0F 6F 0F 27 1B 6D 2B 00 00 16 06 A1 01 E7 70 39 57 01 F0 E4 6B 0F 1F 2E 49 6E 69 74 53 68 61 64 
    //6F 77 3A 20 46 61 69 6C 65 64 20 74 6F 20 61 6C 6C 6F 63 61 74 65 20 74 65 78 74 75 72 65 00 16 
    //16 06 C6 01 E7 70 39 57 01 F0 E4 6B 0F 1F 2E 49 6E 69 74 53 68 61 64 6F 77 3A 20 4E 6F 20 61 63 
    //74 6F 72 00 16 16 04 0B 47 
  }


  event Destroyed() {
    bShadowActive = False;                                                      //0000 : 14 2D 01 58 50 2C 11 28 
    if (ShadowTexture != None) {                                                //0008 : 07 6E 00 77 01 B0 55 2C 11 2A 16 
      ShadowTexture.ShadowActor = None;                                         //0013 : 0F 19 01 B0 55 2C 11 05 00 04 01 D0 5B 2C 11 2A 
      if (!ShadowTexture.Invalid) {                                             //0023 : 07 60 00 81 19 01 B0 55 2C 11 06 00 04 2D 01 28 56 2C 11 16 
        if (Level != None) {                                                    //0037 : 07 60 00 77 01 D8 7E 6C 0F 2A 16 
          Level.GetObjectPool().FreeObject(ShadowTexture);                      //0042 : 19 19 01 D8 7E 6C 0F 06 00 04 1B 52 2B 00 00 16 0B 00 00 1B 3A 2C 00 00 01 B0 55 2C 11 16 
        }
      }
      ShadowTexture = None;                                                     //0060 : 0F 01 B0 55 2C 11 2A 
      ProjTexture = None;                                                       //0067 : 0F 01 08 8D 7E 0F 2A 
    }
    Super.Destroyed();                                                          //006E : 1C 30 8A 6D 0F 16 
    //14 2D 01 58 50 2C 11 28 07 6E 00 77 01 B0 55 2C 11 2A 16 0F 19 01 B0 55 2C 11 05 00 04 01 D0 5B 
    //2C 11 2A 07 60 00 81 19 01 B0 55 2C 11 06 00 04 2D 01 28 56 2C 11 16 07 60 00 77 01 D8 7E 6C 0F 
    //2A 16 19 19 01 D8 7E 6C 0F 06 00 04 1B 52 2B 00 00 16 0B 00 00 1B 3A 2C 00 00 01 B0 55 2C 11 16 
    //0F 01 B0 55 2C 11 2A 0F 01 08 8D 7E 0F 2A 1C 30 8A 6D 0F 16 04 0B 47 
  }



