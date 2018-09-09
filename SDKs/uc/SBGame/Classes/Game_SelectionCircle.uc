//==============================================================================
//  Game_SelectionCircle
//==============================================================================

class Game_SelectionCircle extends DynamicProjector
    dependsOn(Class,Actor,Base_GameClient,PlayerController,Player,InteractionMaster,Game_Pawn,Material)
  ;

  var Texture SelectionTexture;
  var float CircleScale;
  var float Height;
  var float MaxMaxTraceDistance;
  var float targetScale;
  var Game_Pawn mPawn;


  private final function bool IsScreenshotMode() {
    return Base_GameClient(Class'Actor'.static.GetGameEngine()).GPlayerController.Player.InteractionMaster.ScreenshotMode == 2;//0000 : 04 9A 19 19 19 19 2E 58 2D 24 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 05 00 04 01 B8 1A 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 70 F1 71 0F 05 00 04 01 78 F2 71 0F 2C 02 16 
    //04 9A 19 19 19 19 2E 58 2D 24 01 12 20 F8 8B C1 00 06 00 04 1C 78 2B 6E 0F 16 05 00 04 01 B8 1A 
    //6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 70 F1 71 0F 05 00 04 01 78 F2 71 0F 2C 02 16 04 0B 47 
    //
  }


  function SetPawn(Game_Pawn aPawn) {
    if (mPawn == aPawn
      && !bIsEnabled && !mPawn.IsValidActor()) {         //0000 : 07 34 00 82 72 01 E8 ED 33 11 00 90 EB 33 11 16 18 1F 00 81 82 2D 01 20 85 7E 0F 18 12 00 81 19 01 E8 ED 33 11 06 00 04 1B 2E 0D 00 00 16 16 16 16 16 
      return;                                                                   //0032 : 04 0B 
    }
    if (aPawn == None) {                                                        //0034 : 07 94 00 72 00 90 EB 33 11 2A 16 
      Height = 0.00000000;                                                      //003F : 0F 01 60 EE 33 11 1E 00 00 00 00 
      targetScale = 0.00000000;                                                 //004A : 0F 01 E8 1A 34 11 1E 00 00 00 00 
      SetDrawScale(0.00000000);                                                 //0055 : 1C B8 97 6B 0F 1E 00 00 00 00 16 
      MaxTraceDistance = 0;                                                     //0060 : 0F 01 C0 8E 7E 0F 25 
      bProjectStaticMesh = False;                                               //0067 : 14 2D 01 18 80 7E 0F 28 
      bProjectTerrain = False;                                                  //006F : 14 2D 01 10 9B 7E 0F 28 
      bIsEnabled = False;                                                       //0077 : 14 2D 01 20 85 7E 0F 28 
      cl_OnTick(0.00000000);                                                    //007F : 1B 07 0C 00 00 1E 00 00 00 00 16 
      mPawn = None;                                                             //008A : 0F 01 E8 ED 33 11 2A 
    } else {                                                                    //0091 : 06 3A 01 
      mPawn = aPawn;                                                            //0094 : 0F 01 E8 ED 33 11 00 90 EB 33 11 
      Height = CollisionHeight;                                                 //009F : 0F 01 60 EE 33 11 01 40 8A 6C 0F 
      if (ProjTexture != None) {                                                //00AA : 07 ED 00 77 01 08 8D 7E 0F 2A 16 
        targetScale = CircleScale * aPawn.SkillRadius / 0.50000000 * ProjTexture.MaterialUSize();//00B5 : 0F 01 E8 1A 34 11 AC AB 01 60 1B 34 11 19 00 90 EB 33 11 05 00 04 01 C0 57 19 11 16 AB 1E 00 00 00 3F 39 3F 19 01 08 8D 7E 0F 06 00 04 1B D6 12 00 00 16 16 16 
        goto jl00ED;                                                            //00EA : 06 ED 00 
      }
      SetDrawScale((DrawScale + targetScale) / 2.00000000);                     //00ED : 1C B8 97 6B 0F AC AE 01 F0 B3 6E 0F 01 E8 1A 34 11 16 1E 00 00 00 40 16 16 
      MaxTraceDistance = 3 * aPawn.CollisionHeight;                             //0106 : 0F 01 C0 8E 7E 0F 39 44 AB 39 3F 2C 03 19 00 90 EB 33 11 05 00 04 01 40 8A 6C 0F 16 
      bProjectStaticMesh = True;                                                //0122 : 14 2D 01 18 80 7E 0F 27 
      bProjectTerrain = True;                                                   //012A : 14 2D 01 10 9B 7E 0F 27 
      bIsEnabled = True;                                                        //0132 : 14 2D 01 20 85 7E 0F 27 
    }
    //07 34 00 82 72 01 E8 ED 33 11 00 90 EB 33 11 16 18 1F 00 81 82 2D 01 20 85 7E 0F 18 12 00 81 19 
    //01 E8 ED 33 11 06 00 04 1B 2E 0D 00 00 16 16 16 16 16 04 0B 07 94 00 72 00 90 EB 33 11 2A 16 0F 
    //01 60 EE 33 11 1E 00 00 00 00 0F 01 E8 1A 34 11 1E 00 00 00 00 1C B8 97 6B 0F 1E 00 00 00 00 16 
    //0F 01 C0 8E 7E 0F 25 14 2D 01 18 80 7E 0F 28 14 2D 01 10 9B 7E 0F 28 14 2D 01 20 85 7E 0F 28 1B 
    //07 0C 00 00 1E 00 00 00 00 16 0F 01 E8 ED 33 11 2A 06 3A 01 0F 01 E8 ED 33 11 00 90 EB 33 11 0F 
    //01 60 EE 33 11 01 40 8A 6C 0F 07 ED 00 77 01 08 8D 7E 0F 2A 16 0F 01 E8 1A 34 11 AC AB 01 60 1B 
    //34 11 19 00 90 EB 33 11 05 00 04 01 C0 57 19 11 16 AB 1E 00 00 00 3F 39 3F 19 01 08 8D 7E 0F 06 
    //00 04 1B D6 12 00 00 16 16 16 06 ED 00 1C B8 97 6B 0F AC AE 01 F0 B3 6E 0F 01 E8 1A 34 11 16 1E 
    //00 00 00 40 16 16 0F 01 C0 8E 7E 0F 39 44 AB 39 3F 2C 03 19 00 90 EB 33 11 05 00 04 01 40 8A 6C 
    //0F 16 14 2D 01 18 80 7E 0F 27 14 2D 01 10 9B 7E 0F 27 14 2D 01 20 85 7E 0F 27 04 0B 47 
  }


  function cl_OnPlayerTick(float DeltaTime) {
    if (mPawn != None) {                                                        //0000 : 07 58 00 77 01 E8 ED 33 11 2A 16 
      if (mPawn.IsDead()) {                                                     //000B : 07 27 00 19 01 E8 ED 33 11 06 00 04 1C D8 52 34 0F 16 
        SetPawn(None);                                                          //001D : 1B B7 0C 00 00 2A 16 
      } else {                                                                  //0024 : 06 55 00 
        if (IsScreenshotMode() && DrawScale > 0) {                              //0027 : 07 55 00 82 1C 88 E8 33 11 16 18 0B 00 B1 01 F0 B3 6E 0F 39 3F 25 16 16 
          SetDrawScale(0.00000000);                                             //003F : 1C B8 97 6B 0F 1E 00 00 00 00 16 
          cl_OnTick(0.00000000);                                                //004A : 1B 07 0C 00 00 1E 00 00 00 00 16 
        }
      }
    } else {                                                                    //0055 : 06 70 00 
      if (MaxTraceDistance > 0.00000000) {                                      //0058 : 07 70 00 B1 39 3F 01 C0 8E 7E 0F 1E 00 00 00 00 16 
        SetPawn(None);                                                          //0069 : 1B B7 0C 00 00 2A 16 
      }
    }
    //07 58 00 77 01 E8 ED 33 11 2A 16 07 27 00 19 01 E8 ED 33 11 06 00 04 1C D8 52 34 0F 16 1B B7 0C 
    //00 00 2A 16 06 55 00 07 55 00 82 1C 88 E8 33 11 16 18 0B 00 B1 01 F0 B3 6E 0F 39 3F 25 16 16 1C 
    //B8 97 6B 0F 1E 00 00 00 00 16 1B 07 0C 00 00 1E 00 00 00 00 16 06 70 00 07 70 00 B1 39 3F 01 C0 
    //8E 7E 0F 1E 00 00 00 00 16 1B B7 0C 00 00 2A 16 04 0B 47 
  }


  function cl_UpdateLocation(float DeltaTime) {
    local Rotator currentRotation;
    local Vector ProjLocation;
    local Vector projNormal;
    if (mPawn != None && !mPawn.IsDead()
      && !IsScreenshotMode()) {        //0000 : 07 EA 00 82 82 77 01 E8 ED 33 11 2A 16 18 12 00 81 19 01 E8 ED 33 11 06 00 04 1C D8 52 34 0F 16 16 16 18 09 00 81 1C 88 E8 33 11 16 16 16 
      ProjLocation = mPawn.Location;                                            //002E : 0F 00 60 1F 34 11 19 01 E8 ED 33 11 05 00 0C 01 30 81 6C 0F 
      ProjLocation.Z += Height;                                                 //0042 : B8 36 38 C5 69 0F 00 60 1F 34 11 01 60 EE 33 11 16 
      currentRotation = rotator(mPawn.Location - ProjLocation);                 //0053 : 0F 00 68 41 32 11 39 50 D8 19 01 E8 ED 33 11 05 00 0C 01 30 81 6C 0F 00 60 1F 34 11 16 
      SetRotation(currentRotation);                                             //0070 : 1C 70 01 6E 0F 00 68 41 32 11 16 
      SetLocation(ProjLocation);                                                //007B : 61 0B 00 60 1F 34 11 16 
      SetDrawScale(targetScale);                                                //0083 : 1C B8 97 6B 0F 01 E8 1A 34 11 16 
      projNormal = ProjLocation;                                                //008E : 0F 00 E0 41 32 11 00 60 1F 34 11 
      projNormal.Z -= MaxMaxTraceDistance;                                      //0099 : B9 36 38 C5 69 0F 00 E0 41 32 11 01 58 42 32 11 16 
      Trace(ProjLocation,projNormal,projNormal,Location,False);                 //00AA : 61 15 00 60 1F 34 11 00 E0 41 32 11 00 E0 41 32 11 01 30 81 6C 0F 28 16 
      MaxTraceDistance = 1.10000002 * VSize(ProjLocation - Location);           //00C2 : 0F 01 C0 8E 7E 0F 39 44 AB 1E CD CC 8C 3F E1 D8 00 60 1F 34 11 01 30 81 6C 0F 16 16 16 
      cl_OnTick(DeltaTime);                                                     //00DF : 1B 07 0C 00 00 00 78 1D 34 11 16 
    }
    //07 EA 00 82 82 77 01 E8 ED 33 11 2A 16 18 12 00 81 19 01 E8 ED 33 11 06 00 04 1C D8 52 34 0F 16 
    //16 16 18 09 00 81 1C 88 E8 33 11 16 16 16 0F 00 60 1F 34 11 19 01 E8 ED 33 11 05 00 0C 01 30 81 
    //6C 0F B8 36 38 C5 69 0F 00 60 1F 34 11 01 60 EE 33 11 16 0F 00 68 41 32 11 39 50 D8 19 01 E8 ED 
    //33 11 05 00 0C 01 30 81 6C 0F 00 60 1F 34 11 16 1C 70 01 6E 0F 00 68 41 32 11 16 61 0B 00 60 1F 
    //34 11 16 1C B8 97 6B 0F 01 E8 1A 34 11 16 0F 00 E0 41 32 11 00 60 1F 34 11 B9 36 38 C5 69 0F 00 
    //E0 41 32 11 01 58 42 32 11 16 61 15 00 60 1F 34 11 00 E0 41 32 11 00 E0 41 32 11 01 30 81 6C 0F 
    //28 16 0F 01 C0 8E 7E 0F 39 44 AB 1E CD CC 8C 3F E1 D8 00 60 1F 34 11 01 30 81 6C 0F 16 16 16 1B 
    //07 0C 00 00 00 78 1D 34 11 16 04 0B 47 
  }



