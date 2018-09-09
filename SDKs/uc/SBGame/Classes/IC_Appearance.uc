//==============================================================================
//  IC_Appearance
//==============================================================================

class IC_Appearance extends Item_Component
    native
    abstract
    editinlinenew
    dependsOn(Console,Appearance_Base)
  ;

  var (IC_Appearance) const editinline Appearance_Base Appearance;
  var (IC_Appearance) const int DyePrice;


  function ToConsole(Console C) {
    C.Message("        Appearance = " $ string(Appearance)
      @ string(Appearance.Part)
      @ string(Appearance._AS_Index)
      @ string(Appearance._AS_Set),0.00000000);//0000 : 19 00 20 EB 30 11 62 00 00 1B 37 03 00 00 A8 A8 A8 70 1F 20 20 20 20 20 20 20 20 41 70 70 65 61 72 61 6E 63 65 20 3D 20 00 39 56 01 A0 5F 22 11 16 39 52 19 01 A0 5F 22 11 05 00 01 01 A0 6F 21 11 16 39 53 19 01 A0 5F 22 11 05 00 04 01 50 74 21 11 16 39 54 19 01 A0 5F 22 11 06 00 04 2D 01 C8 74 21 11 16 1E 00 00 00 00 16 
    //19 00 20 EB 30 11 62 00 00 1B 37 03 00 00 A8 A8 A8 70 1F 20 20 20 20 20 20 20 20 41 70 70 65 61 
    //72 61 6E 63 65 20 3D 20 00 39 56 01 A0 5F 22 11 16 39 52 19 01 A0 5F 22 11 05 00 01 01 A0 6F 21 
    //11 16 39 53 19 01 A0 5F 22 11 05 00 04 01 50 74 21 11 16 39 54 19 01 A0 5F 22 11 06 00 04 2D 01 
    //C8 74 21 11 16 1E 00 00 00 00 16 04 0B 47 
  }


  function Appearance_Base GetAppearance() {
    return Appearance;                                                          //0000 : 04 01 A0 5F 22 11 
    //04 01 A0 5F 22 11 04 0B 47 
  }



