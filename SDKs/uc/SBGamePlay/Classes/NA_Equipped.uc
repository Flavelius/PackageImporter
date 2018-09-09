//==============================================================================
//  NA_Equipped
//==============================================================================

class NA_Equipped extends NA_RaceBodyGender
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_EquippedAppearance,Appearance_Hair)
  ;

  var (Decoration) const int Head;
  var (Decoration) const editinline Appearance_Hair Hair;
  var (Colour) const byte BodyColor;
  var (Colour) const byte HairColor;
  var (Effects) bool Ghostly;
  var (Effects) bool Statue;


  event int GetHead() {
    return Head;                                                                //0000 : 04 01 60 D6 E8 14 
    //04 01 60 D6 E8 14 04 0B 47 
  }


  event SetHead(int NewHead) {
    Head = NewHead;                                                             //0000 : 0F 01 60 D6 E8 14 00 88 D7 E8 14 
    //0F 01 60 D6 E8 14 00 88 D7 E8 14 04 0B 47 
  }


  function Game_Appearance CreateAppearance(Game_Pawn aPawn,export editinline Game_Appearance aAppearance,bool aShifting) {
    local export editinline Game_EquippedAppearance pawnAppearance;
    aAppearance = ForceAppearanceClass(aPawn,aAppearance,Class'Game_EquippedAppearance');//0000 : 0F 00 A0 DA E8 14 1B EA 0F 00 00 00 40 D8 E8 14 00 A0 DA E8 14 20 70 B8 5F 01 16 
    aAppearance = Super.CreateAppearance(aPawn,aAppearance,aShifting);          //001B : 0F 00 A0 DA E8 14 1C F0 07 31 11 00 40 D8 E8 14 00 A0 DA E8 14 2D 00 18 DB E8 14 16 
    pawnAppearance = Game_EquippedAppearance(aAppearance);                      //0037 : 0F 00 90 DB E8 14 2E 70 B8 5F 01 00 A0 DA E8 14 
    if (Statue) {                                                               //0047 : 07 60 00 2D 01 08 DC E8 14 
      pawnAppearance.SetStatue(True);                                           //0050 : 19 00 90 DB E8 14 07 00 00 1B A5 0F 00 00 27 16 
    }
    if (Ghostly) {                                                              //0060 : 07 79 00 2D 01 80 DC E8 14 
      pawnAppearance.SetGhost(True);                                            //0069 : 19 00 90 DB E8 14 07 00 00 1B ED 0F 00 00 27 16 
    }
    pawnAppearance.SetRace(Race);                                               //0079 : 19 00 90 DB E8 14 0B 00 00 1B 0E 10 00 00 01 80 BC E8 14 16 
    pawnAppearance.SetGender(Gender);                                           //008D : 19 00 90 DB E8 14 0B 00 00 1B 0F 10 00 00 01 F0 B7 E8 14 16 
    pawnAppearance.SetBody(Bodytype);                                           //00A1 : 19 00 90 DB E8 14 0B 00 00 1B 10 10 00 00 01 40 C0 E8 14 16 
    pawnAppearance.SetHead(Head);                                               //00B5 : 19 00 90 DB E8 14 0D 00 00 1B 19 06 00 00 39 3D 01 60 D6 E8 14 16 
    pawnAppearance.SetColorValue(21,BodyColor,0);                               //00CB : 19 00 90 DB E8 14 0F 00 00 1B 04 0C 00 00 24 15 01 F8 DC E8 14 24 00 16 
    if (Hair != None) {                                                         //00E3 : 07 28 01 77 01 70 DD E8 14 2A 16 
      pawnAppearance.SetColorValue(18,HairColor,0);                             //00EE : 19 00 90 DB E8 14 0F 00 00 1B 04 0C 00 00 24 12 01 E8 DD E8 14 24 00 16 
      pawnAppearance.SetValue(18,Hair._AS_Index);                               //0106 : 19 00 90 DB E8 14 16 00 00 1B 37 0C 00 00 24 12 19 01 70 DD E8 14 05 00 04 01 50 74 21 11 16 
    } else {                                                                    //0125 : 06 3A 01 
      pawnAppearance.SetValue(18,0);                                            //0128 : 19 00 90 DB E8 14 09 00 00 1B 37 0C 00 00 24 12 25 16 
    }
    return aAppearance;                                                         //013A : 04 00 A0 DA E8 14 
    //0F 00 A0 DA E8 14 1B EA 0F 00 00 00 40 D8 E8 14 00 A0 DA E8 14 20 70 B8 5F 01 16 0F 00 A0 DA E8 
    //14 1C F0 07 31 11 00 40 D8 E8 14 00 A0 DA E8 14 2D 00 18 DB E8 14 16 0F 00 90 DB E8 14 2E 70 B8 
    //5F 01 00 A0 DA E8 14 07 60 00 2D 01 08 DC E8 14 19 00 90 DB E8 14 07 00 00 1B A5 0F 00 00 27 16 
    //07 79 00 2D 01 80 DC E8 14 19 00 90 DB E8 14 07 00 00 1B ED 0F 00 00 27 16 19 00 90 DB E8 14 0B 
    //00 00 1B 0E 10 00 00 01 80 BC E8 14 16 19 00 90 DB E8 14 0B 00 00 1B 0F 10 00 00 01 F0 B7 E8 14 
    //16 19 00 90 DB E8 14 0B 00 00 1B 10 10 00 00 01 40 C0 E8 14 16 19 00 90 DB E8 14 0D 00 00 1B 19 
    //06 00 00 39 3D 01 60 D6 E8 14 16 19 00 90 DB E8 14 0F 00 00 1B 04 0C 00 00 24 15 01 F8 DC E8 14 
    //24 00 16 07 28 01 77 01 70 DD E8 14 2A 16 19 00 90 DB E8 14 0F 00 00 1B 04 0C 00 00 24 12 01 E8 
    //DD E8 14 24 00 16 19 00 90 DB E8 14 16 00 00 1B 37 0C 00 00 24 12 19 01 70 DD E8 14 05 00 04 01 
    //50 74 21 11 16 06 3A 01 19 00 90 DB E8 14 09 00 00 1B 37 0C 00 00 24 12 25 16 04 00 A0 DA E8 14 
    //04 0B 47 
  }



