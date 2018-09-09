//==============================================================================
//  NA_Static
//==============================================================================

class NA_Static extends NPC_Appearance
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_StaticAppearance)
  ;

  var (NA_Static) StaticMesh StatMesh;
  var (NA_Static) float Scale;
  var (NA_Static) bool Statue;
  var (NA_Static) bool Ghostly;
  var (NA_Static) float CollisionRadius;
  var (NA_Static) float CollisionHeight;
  var (NA_Static) float SkillRadius;


  function Game_Appearance CreateAppearance(Game_Pawn aPawn,export editinline Game_Appearance aAppearance,bool aShifting) {
    local export editinline Game_StaticAppearance pawnAppearance;
    aAppearance = ForceAppearanceClass(aPawn,aAppearance,Class'Game_StaticAppearance');//0000 : 0F 00 40 C6 E8 14 1B EA 0F 00 00 00 60 C4 E8 14 00 40 C6 E8 14 20 30 C8 5F 01 16 
    aAppearance = Super.CreateAppearance(aPawn,aAppearance,aShifting);          //001B : 0F 00 40 C6 E8 14 1C F0 07 31 11 00 60 C4 E8 14 00 40 C6 E8 14 2D 00 B8 C6 E8 14 16 
    pawnAppearance = Game_StaticAppearance(aAppearance);                        //0037 : 0F 00 30 C7 E8 14 2E 30 C8 5F 01 00 40 C6 E8 14 
    pawnAppearance.StatMesh = StatMesh;                                         //0047 : 0F 19 00 30 C7 E8 14 05 00 04 01 A8 C7 E8 14 01 E8 C3 E8 14 
    pawnAppearance.SetScale(Scale);                                             //005B : 19 00 30 C7 E8 14 0B 00 00 1B 9D 0F 00 00 01 20 C8 E8 14 16 
    if (Statue) {                                                               //006F : 07 88 00 2D 01 98 C8 E8 14 
      pawnAppearance.SetStatue(True);                                           //0078 : 19 00 30 C7 E8 14 07 00 00 1B A5 0F 00 00 27 16 
    }
    if (Ghostly) {                                                              //0088 : 07 A1 00 2D 01 10 C9 E8 14 
      pawnAppearance.SetGhost(True);                                            //0091 : 19 00 30 C7 E8 14 07 00 00 1B ED 0F 00 00 27 16 
    }
    pawnAppearance.CollisionRadius = GetCollisionRadius();                      //00A1 : 0F 19 00 30 C7 E8 14 05 00 04 01 88 C9 E8 14 1B 9B 0C 00 00 16 
    pawnAppearance.CollisionHeight = GetCollisionHeight();                      //00B6 : 0F 19 00 30 C7 E8 14 05 00 04 01 00 CA E8 14 1B 5D 0C 00 00 16 
    pawnAppearance.SkillRadius = GetSkillRadius();                              //00CB : 0F 19 00 30 C7 E8 14 05 00 04 01 78 CA E8 14 1B 9E 0F 00 00 16 
    return aAppearance;                                                         //00E0 : 04 00 40 C6 E8 14 
    //0F 00 40 C6 E8 14 1B EA 0F 00 00 00 60 C4 E8 14 00 40 C6 E8 14 20 30 C8 5F 01 16 0F 00 40 C6 E8 
    //14 1C F0 07 31 11 00 60 C4 E8 14 00 40 C6 E8 14 2D 00 B8 C6 E8 14 16 0F 00 30 C7 E8 14 2E 30 C8 
    //5F 01 00 40 C6 E8 14 0F 19 00 30 C7 E8 14 05 00 04 01 A8 C7 E8 14 01 E8 C3 E8 14 19 00 30 C7 E8 
    //14 0B 00 00 1B 9D 0F 00 00 01 20 C8 E8 14 16 07 88 00 2D 01 98 C8 E8 14 19 00 30 C7 E8 14 07 00 
    //00 1B A5 0F 00 00 27 16 07 A1 00 2D 01 10 C9 E8 14 19 00 30 C7 E8 14 07 00 00 1B ED 0F 00 00 27 
    //16 0F 19 00 30 C7 E8 14 05 00 04 01 88 C9 E8 14 1B 9B 0C 00 00 16 0F 19 00 30 C7 E8 14 05 00 04 
    //01 00 CA E8 14 1B 5D 0C 00 00 16 0F 19 00 30 C7 E8 14 05 00 04 01 78 CA E8 14 1B 9E 0F 00 00 16 
    //04 00 40 C6 E8 14 04 0B 47 
  }



