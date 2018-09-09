//==============================================================================
//  NA_Skeletal
//==============================================================================

class NA_Skeletal extends NA_RaceBodyGender
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_SkeletalAppearance)
  ;

  var (NA_Skeletal) Mesh SkeletalMesh;
  var (NA_Skeletal) Mesh SkeletalMeshAddition;
  var (NA_Skeletal) Material SkinTexture;
  var (Modifiers) bool Ghostly;
  var (Modifiers) bool Statue;
  var (Modifiers) float Scale;


  function Game_Appearance CreateAppearance(Game_Pawn aPawn,export editinline Game_Appearance aAppearance,bool aShifting) {
    local export editinline Game_SkeletalAppearance pawnAppearance;
    aAppearance = ForceAppearanceClass(aPawn,aAppearance,Class'Game_SkeletalAppearance');//0000 : 0F 00 F8 E7 E8 14 1B EA 0F 00 00 00 88 E5 E8 14 00 F8 E7 E8 14 20 F0 C2 5F 01 16 
    aAppearance = Super.CreateAppearance(aPawn,aAppearance,aShifting);          //001B : 0F 00 F8 E7 E8 14 1C F0 07 31 11 00 88 E5 E8 14 00 F8 E7 E8 14 2D 00 70 E8 E8 14 16 
    pawnAppearance = Game_SkeletalAppearance(aAppearance);                      //0037 : 0F 00 E8 E8 E8 14 2E F0 C2 5F 01 00 F8 E7 E8 14 
    pawnAppearance.SkeletalMesh = SkeletalMesh;                                 //0047 : 0F 19 00 E8 E8 E8 14 05 00 04 01 60 E9 E8 14 01 10 E5 E8 14 
    pawnAppearance.SkeletalMeshAddition = SkeletalMeshAddition;                 //005B : 0F 19 00 E8 E8 E8 14 05 00 04 01 D8 E9 E8 14 01 50 EA E8 14 
    pawnAppearance.SkinTexture = SkinTexture;                                   //006F : 0F 19 00 E8 E8 E8 14 05 00 04 01 C8 EA E8 14 01 40 EB E8 14 
    pawnAppearance.SetScale(Scale);                                             //0083 : 19 00 E8 E8 E8 14 0B 00 00 1B 9D 0F 00 00 01 B8 EB E8 14 16 
    if (Statue) {                                                               //0097 : 07 B0 00 2D 01 30 EC E8 14 
      pawnAppearance.SetStatue(True);                                           //00A0 : 19 00 E8 E8 E8 14 07 00 00 1B A5 0F 00 00 27 16 
    }
    if (Ghostly) {                                                              //00B0 : 07 C9 00 2D 01 A8 EC E8 14 
      pawnAppearance.SetGhost(True);                                            //00B9 : 19 00 E8 E8 E8 14 07 00 00 1B ED 0F 00 00 27 16 
    }
    pawnAppearance.SetRace(Race);                                               //00C9 : 19 00 E8 E8 E8 14 0B 00 00 1B 0E 10 00 00 01 80 BC E8 14 16 
    pawnAppearance.SetGender(Gender);                                           //00DD : 19 00 E8 E8 E8 14 0B 00 00 1B 0F 10 00 00 01 F0 B7 E8 14 16 
    pawnAppearance.SetBody(Bodytype);                                           //00F1 : 19 00 E8 E8 E8 14 0B 00 00 1B 10 10 00 00 01 40 C0 E8 14 16 
    pawnAppearance.CollisionRadius = GetCollisionRadius();                      //0105 : 0F 19 00 E8 E8 E8 14 05 00 04 01 20 ED E8 14 1B 9B 0C 00 00 16 
    pawnAppearance.CollisionHeight = GetCollisionHeight();                      //011A : 0F 19 00 E8 E8 E8 14 05 00 04 01 98 ED E8 14 1B 5D 0C 00 00 16 
    pawnAppearance.SkillRadius = GetSkillRadius();                              //012F : 0F 19 00 E8 E8 E8 14 05 00 04 01 10 EE E8 14 1B 9E 0F 00 00 16 
    return aAppearance;                                                         //0144 : 04 00 F8 E7 E8 14 
    //0F 00 F8 E7 E8 14 1B EA 0F 00 00 00 88 E5 E8 14 00 F8 E7 E8 14 20 F0 C2 5F 01 16 0F 00 F8 E7 E8 
    //14 1C F0 07 31 11 00 88 E5 E8 14 00 F8 E7 E8 14 2D 00 70 E8 E8 14 16 0F 00 E8 E8 E8 14 2E F0 C2 
    //5F 01 00 F8 E7 E8 14 0F 19 00 E8 E8 E8 14 05 00 04 01 60 E9 E8 14 01 10 E5 E8 14 0F 19 00 E8 E8 
    //E8 14 05 00 04 01 D8 E9 E8 14 01 50 EA E8 14 0F 19 00 E8 E8 E8 14 05 00 04 01 C8 EA E8 14 01 40 
    //EB E8 14 19 00 E8 E8 E8 14 0B 00 00 1B 9D 0F 00 00 01 B8 EB E8 14 16 07 B0 00 2D 01 30 EC E8 14 
    //19 00 E8 E8 E8 14 07 00 00 1B A5 0F 00 00 27 16 07 C9 00 2D 01 A8 EC E8 14 19 00 E8 E8 E8 14 07 
    //00 00 1B ED 0F 00 00 27 16 19 00 E8 E8 E8 14 0B 00 00 1B 0E 10 00 00 01 80 BC E8 14 16 19 00 E8 
    //E8 E8 14 0B 00 00 1B 0F 10 00 00 01 F0 B7 E8 14 16 19 00 E8 E8 E8 14 0B 00 00 1B 10 10 00 00 01 
    //40 C0 E8 14 16 0F 19 00 E8 E8 E8 14 05 00 04 01 20 ED E8 14 1B 9B 0C 00 00 16 0F 19 00 E8 E8 E8 
    //14 05 00 04 01 98 ED E8 14 1B 5D 0C 00 00 16 0F 19 00 E8 E8 E8 14 05 00 04 01 10 EE E8 14 1B 9E 
    //0F 00 00 16 04 00 F8 E7 E8 14 04 0B 47 
  }



