//==============================================================================
//  FSkill_EffectClass_Range
//==============================================================================

class FSkill_EffectClass_Range extends FSkill_EffectClass
    native
    dependsOn(Game_Pawn)
  ;

  const MAX_SKILLSIZE =  200.0;
  const MAX_SPEED =  1000.0;
  var (direction) const Vector LocationOffset;
  var (direction) const int RotationOffset;
  var (Angle) const float Angle;
  var (Radius) const float MinRadius;
  var (Radius) const float MaxRadius;
  var (Sorting) const byte SortingMethod;


  native function CalcOffsetLocation(out Vector outLocation,out Rotator outRotation);


  final event DrawStaticDebugInfo(Game_Pawn aPawn,Vector aLocation) {
    local Vector lLeft;
    local Vector lRight;
    local Rotator lRotation;
    local float oldYaw;
    CalcOffsetLocation(aLocation,aPawn.Rotation);                               //0000 : 1B 85 0E 00 00 00 80 A9 2B 11 19 00 F0 A6 2B 11 05 00 0C 01 00 84 6C 0F 16 
    lRotation = aPawn.Rotation;                                                 //0019 : 0F 00 F8 A9 2B 11 19 00 F0 A6 2B 11 05 00 0C 01 00 84 6C 0F 
    oldYaw = lRotation.Yaw;                                                     //002D : 0F 00 70 AA 2B 11 39 3F 36 20 BF 69 0F 00 F8 A9 2B 11 
    lRotation.Yaw = oldYaw + static.ConvertDegreesToURU(RotationOffset + Angle / 2);//003F : 0F 36 20 BF 69 0F 00 F8 A9 2B 11 39 44 AE 00 70 AA 2B 11 1C 80 0F 6A 0F AE 39 3F 01 E8 AA 2B 11 AC 01 60 AB 2B 11 39 3F 2C 02 16 16 16 16 
    lRight = vector(lRotation) * MaxRadius + aLocation;                         //006D : 0F 00 D8 AB 2B 11 D7 D4 39 39 00 F8 A9 2B 11 01 50 AC 2B 11 16 00 80 A9 2B 11 16 
    lRotation.Yaw = oldYaw + static.ConvertDegreesToURU(RotationOffset - Angle / 2);//0088 : 0F 36 20 BF 69 0F 00 F8 A9 2B 11 39 44 AE 00 70 AA 2B 11 1C 80 0F 6A 0F AF 39 3F 01 E8 AA 2B 11 AC 01 60 AB 2B 11 39 3F 2C 02 16 16 16 16 
    lLeft = vector(lRotation) * MaxRadius + aLocation;                          //00B6 : 0F 00 C8 AC 2B 11 D7 D4 39 39 00 F8 A9 2B 11 01 50 AC 2B 11 16 00 80 A9 2B 11 16 
    aPawn.DrawDebugLine(aLocation,lLeft,255,255,255);                           //00D1 : 19 00 F0 A6 2B 11 1C 00 00 1C 80 90 6D 0F 00 80 A9 2B 11 00 C8 AC 2B 11 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 16 
    aPawn.DrawDebugLine(aLocation,lRight,255,255,255);                          //00F6 : 19 00 F0 A6 2B 11 1C 00 00 1C 80 90 6D 0F 00 80 A9 2B 11 00 D8 AB 2B 11 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 16 
    aPawn.DrawDebugCapsule(aLocation,MaxRadius * 2,MinRadius,16,155,0);         //011B : 19 00 F0 A6 2B 11 21 00 00 1C B0 9D 6B 0F 00 80 A9 2B 11 AB 01 50 AC 2B 11 39 3F 2C 02 16 01 40 AD 2B 11 24 10 24 9B 24 00 16 
    aPawn.DrawDebugSphere(aLocation,MaxRadius,16,220,220,0);                    //0145 : 19 00 F0 A6 2B 11 18 00 00 1C 90 9E 6B 0F 00 80 A9 2B 11 01 50 AC 2B 11 2C 10 24 DC 24 DC 24 00 16 
    //1B 85 0E 00 00 00 80 A9 2B 11 19 00 F0 A6 2B 11 05 00 0C 01 00 84 6C 0F 16 0F 00 F8 A9 2B 11 19 
    //00 F0 A6 2B 11 05 00 0C 01 00 84 6C 0F 0F 00 70 AA 2B 11 39 3F 36 20 BF 69 0F 00 F8 A9 2B 11 0F 
    //36 20 BF 69 0F 00 F8 A9 2B 11 39 44 AE 00 70 AA 2B 11 1C 80 0F 6A 0F AE 39 3F 01 E8 AA 2B 11 AC 
    //01 60 AB 2B 11 39 3F 2C 02 16 16 16 16 0F 00 D8 AB 2B 11 D7 D4 39 39 00 F8 A9 2B 11 01 50 AC 2B 
    //11 16 00 80 A9 2B 11 16 0F 36 20 BF 69 0F 00 F8 A9 2B 11 39 44 AE 00 70 AA 2B 11 1C 80 0F 6A 0F 
    //AF 39 3F 01 E8 AA 2B 11 AC 01 60 AB 2B 11 39 3F 2C 02 16 16 16 16 0F 00 C8 AC 2B 11 D7 D4 39 39 
    //00 F8 A9 2B 11 01 50 AC 2B 11 16 00 80 A9 2B 11 16 19 00 F0 A6 2B 11 1C 00 00 1C 80 90 6D 0F 00 
    //80 A9 2B 11 00 C8 AC 2B 11 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 16 19 00 F0 A6 2B 11 1C 00 00 1C 
    //80 90 6D 0F 00 80 A9 2B 11 00 D8 AB 2B 11 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 16 19 00 F0 A6 2B 
    //11 21 00 00 1C B0 9D 6B 0F 00 80 A9 2B 11 AB 01 50 AC 2B 11 39 3F 2C 02 16 01 40 AD 2B 11 24 10 
    //24 9B 24 00 16 19 00 F0 A6 2B 11 18 00 00 1C 90 9E 6B 0F 00 80 A9 2B 11 01 50 AC 2B 11 2C 10 24 
    //DC 24 DC 24 00 16 04 0B 47 
  }



