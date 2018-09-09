//==============================================================================
//  Editor_Spwnie
//==============================================================================

class Editor_Spwnie extends Editor_Pawn
    native
    dependsOn()
    Config(User)
  ;

  var bool mSelected;
  var float SpawnRadius;
  var float RespawnTime;
  var NPC_Spawner mSpawner;


  function SetSelected(bool aSelected) {
    mSelected = aSelected;                                                      //0000 : 14 2D 01 F8 87 34 11 2D 00 40 87 34 11 
    //14 2D 01 F8 87 34 11 2D 00 40 87 34 11 04 0B 47 
  }


  event cl_OnTick(float aDeltaTime) {
    local Vector groundLoc;
    local Vector traceNormal;
    local float R;
    local float G;
    local float B;
    Super.cl_OnTick(aDeltaTime);                                                //0000 : 1C E8 3A 32 0F 00 70 88 34 11 16 
    R = 0.00000000;                                                             //000B : 0F 00 98 8A 34 11 1E 00 00 00 00 
    G = 255.00000000;                                                           //0016 : 0F 00 10 8B 34 11 1E 00 00 7F 43 
    B = 255.00000000;                                                           //0021 : 0F 00 88 8B 34 11 1E 00 00 7F 43 
    if (mSelected) {                                                            //002C : 07 56 00 2D 01 F8 87 34 11 
      R = 255.00000000;                                                         //0035 : 0F 00 98 8A 34 11 1E 00 00 7F 43 
      G = 255.00000000;                                                         //0040 : 0F 00 10 8B 34 11 1E 00 00 7F 43 
      B = 255.00000000;                                                         //004B : 0F 00 88 8B 34 11 1E 00 00 7F 43 
    }
    groundLoc = Location;                                                       //0056 : 0F 00 00 8C 34 11 01 30 81 6C 0F 
    groundLoc.Z -= 400.00000000;                                                //0061 : B9 36 38 C5 69 0F 00 00 8C 34 11 1E 00 00 C8 43 16 
    Trace(groundLoc,traceNormal,groundLoc,Location,False);                      //0072 : 61 15 00 00 8C 34 11 00 78 8C 34 11 00 00 8C 34 11 01 30 81 6C 0F 28 16 
    if (groundLoc == vect(0.000000, 0.000000, 0.000000)) {                      //008A : 07 CB 00 D9 00 00 8C 34 11 23 00 00 00 00 00 00 00 00 00 00 00 00 16 
      DrawDebugSphere(Location,SpawnRadius,16,R,G,B);                           //00A1 : 1C 90 9E 6B 0F 01 30 81 6C 0F 01 F0 8C 34 11 2C 10 39 43 00 98 8A 34 11 39 43 00 10 8B 34 11 39 43 00 88 8B 34 11 16 
    } else {                                                                    //00C8 : 06 1A 01 
      DrawDebugCircle(groundLoc,traceNormal Cross vect(1.000000, 0.000000, 0.000000),traceNormal Cross vect(0.000000, 1.000000, 0.000000),SpawnRadius,16,R,G,B);//00CB : 1C 68 A2 6B 0F 00 00 8C 34 11 DC 00 78 8C 34 11 23 00 00 80 3F 00 00 00 00 00 00 00 00 16 DC 00 78 8C 34 11 23 00 00 00 00 00 00 80 3F 00 00 00 00 16 01 F0 8C 34 11 2C 10 39 43 00 98 8A 34 11 39 43 00 10 8B 34 11 39 43 00 88 8B 34 11 16 
    }
    //1C E8 3A 32 0F 00 70 88 34 11 16 0F 00 98 8A 34 11 1E 00 00 00 00 0F 00 10 8B 34 11 1E 00 00 7F 
    //43 0F 00 88 8B 34 11 1E 00 00 7F 43 07 56 00 2D 01 F8 87 34 11 0F 00 98 8A 34 11 1E 00 00 7F 43 
    //0F 00 10 8B 34 11 1E 00 00 7F 43 0F 00 88 8B 34 11 1E 00 00 7F 43 0F 00 00 8C 34 11 01 30 81 6C 
    //0F B9 36 38 C5 69 0F 00 00 8C 34 11 1E 00 00 C8 43 16 61 15 00 00 8C 34 11 00 78 8C 34 11 00 00 
    //8C 34 11 01 30 81 6C 0F 28 16 07 CB 00 D9 00 00 8C 34 11 23 00 00 00 00 00 00 00 00 00 00 00 00 
    //16 1C 90 9E 6B 0F 01 30 81 6C 0F 01 F0 8C 34 11 2C 10 39 43 00 98 8A 34 11 39 43 00 10 8B 34 11 
    //39 43 00 88 8B 34 11 16 06 1A 01 1C 68 A2 6B 0F 00 00 8C 34 11 DC 00 78 8C 34 11 23 00 00 80 3F 
    //00 00 00 00 00 00 00 00 16 DC 00 78 8C 34 11 23 00 00 00 00 00 00 80 3F 00 00 00 00 16 01 F0 8C 
    //34 11 2C 10 39 43 00 98 8A 34 11 39 43 00 10 8B 34 11 39 43 00 88 8B 34 11 16 04 0B 47 
  }



