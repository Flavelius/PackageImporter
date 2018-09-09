//==============================================================================
//  Item_TypeFilter
//==============================================================================

class Item_TypeFilter extends Object
    dependsOn(Class,Item_Type)
  ;

  enum ItemFilterGroup {
    IFG_ALL_WEAPONS ,
    IFG_ARMOUR_UPPER_BODY ,
    IFG_ARMOUR_LOWER_BODY ,
    IFG_ALL_ARMOUR ,
    IFG_CLOTHES_UPPER_BODY ,
    IFG_CLOTHES_LOWER_BODY ,
    IFG_ALL_CLOTHES 
  };

  var bool mAllowFilterItems;
  var transient array<byte> mFilterList;


  private function int GetFilterIndex(byte aTestItemType) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 C0 9F 56 22 25 
    while (i < mFilterList.Length) {                                            //0007 : 07 40 00 96 00 C0 9F 56 22 37 01 28 46 63 22 16 
      if (mFilterList[i] == aTestItemType) {                                    //0017 : 07 36 00 9A 39 3A 10 00 C0 9F 56 22 01 28 46 63 22 39 3A 00 D0 92 61 22 16 
        return i;                                                               //0030 : 04 00 C0 9F 56 22 
      }
      ++i;                                                                      //0036 : A3 00 C0 9F 56 22 16 
    }
    return -1;                                                                  //0040 : 04 1D FF FF FF FF 
    //0F 00 C0 9F 56 22 25 07 40 00 96 00 C0 9F 56 22 37 01 28 46 63 22 16 07 36 00 9A 39 3A 10 00 C0 
    //9F 56 22 01 28 46 63 22 39 3A 00 D0 92 61 22 16 04 00 C0 9F 56 22 A3 00 C0 9F 56 22 16 06 07 00 
    //04 1D FF FF FF FF 04 0B 47 
  }


  event bool IsAllowedItemType(byte aTestItemType) {
    local int foundIndex;
    foundIndex = GetFilterIndex(aTestItemType);                                 //0000 : 0F 00 10 F8 7C 19 1B AF 0C 00 00 00 58 92 61 22 16 
    if (mAllowFilterItems) {                                                    //0011 : 07 27 00 2D 01 C0 14 6A 22 
      return foundIndex != -1;                                                  //001A : 04 9B 00 10 F8 7C 19 1D FF FF FF FF 16 
    }
    return foundIndex == -1;                                                    //0027 : 04 9A 00 10 F8 7C 19 1D FF FF FF FF 16 
    //0F 00 10 F8 7C 19 1B AF 0C 00 00 00 58 92 61 22 16 07 27 00 2D 01 C0 14 6A 22 04 9B 00 10 F8 7C 
    //19 1D FF FF FF FF 16 04 9A 00 10 F8 7C 19 1D FF FF FF FF 16 04 0B 47 
  }


  function RemoveFilterGroup(byte aGroupType) {
    local array<byte> helper;
    local int i;
    GetFilterGroupTypes(aGroupType,helper);                                     //0000 : 1B 53 0C 00 00 00 E0 91 61 22 00 88 F8 7C 19 16 
    i = 0;                                                                      //0010 : 0F 00 A0 9D EE 22 25 
    while (i < helper.Length) {                                                 //0017 : 07 42 00 96 00 A0 9D EE 22 37 00 88 F8 7C 19 16 
      ClearItemTypeFilter(helper[i]);                                           //0027 : 1B 8A 0F 00 00 10 00 A0 9D EE 22 00 88 F8 7C 19 16 
      ++i;                                                                      //0038 : A3 00 A0 9D EE 22 16 
    }
    //1B 53 0C 00 00 00 E0 91 61 22 00 88 F8 7C 19 16 0F 00 A0 9D EE 22 25 07 42 00 96 00 A0 9D EE 22 
    //37 00 88 F8 7C 19 16 1B 8A 0F 00 00 10 00 A0 9D EE 22 00 88 F8 7C 19 16 A3 00 A0 9D EE 22 16 06 
    //17 00 04 0B 47 
  }


  function AddFilterGroup(byte aGroupType) {
    local array<byte> helper;
    local int i;
    GetFilterGroupTypes(aGroupType,helper);                                     //0000 : 1B 53 0C 00 00 00 20 1F 6A 22 00 F0 F9 7C 19 16 
    i = 0;                                                                      //0010 : 0F 00 C8 9E EE 22 25 
    while (i < helper.Length) {                                                 //0017 : 07 42 00 96 00 C8 9E EE 22 37 00 F0 F9 7C 19 16 
      AddItemTypeFilter(helper[i]);                                             //0027 : 1B A4 0F 00 00 10 00 C8 9E EE 22 00 F0 F9 7C 19 16 
      ++i;                                                                      //0038 : A3 00 C8 9E EE 22 16 
    }
    //1B 53 0C 00 00 00 20 1F 6A 22 00 F0 F9 7C 19 16 0F 00 C8 9E EE 22 25 07 42 00 96 00 C8 9E EE 22 
    //37 00 F0 F9 7C 19 16 1B A4 0F 00 00 10 00 C8 9E EE 22 00 F0 F9 7C 19 16 A3 00 C8 9E EE 22 16 06 
    //17 00 04 0B 47 
  }


  protected function GetFilterGroupTypes(byte aGroupType,out array<byte> aResults) {
    local int oldLength;
    switch (aGroupType) {                                                       //0000 : 05 01 00 A8 1E 6A 22 
      case 0 :                                                                  //0007 : 0A B0 00 24 00 
        oldLength = aResults.Length;                                            //000C : 0F 00 B0 45 63 22 37 00 00 0C DF 22 
        aResults.Length = oldLength + 5;                                        //0018 : 0F 37 00 00 0C DF 22 92 00 B0 45 63 22 2C 05 16 
        aResults[oldLength + 0] = Class'Item_Type'.11;                          //0028 : 0F 10 92 00 B0 45 63 22 25 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 0B 
        aResults[oldLength + 1] = Class'Item_Type'.12;                          //0042 : 0F 10 92 00 B0 45 63 22 26 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 0C 
        aResults[oldLength + 2] = Class'Item_Type'.13;                          //005C : 0F 10 92 00 B0 45 63 22 2C 02 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 0D 
        aResults[oldLength + 3] = Class'Item_Type'.14;                          //0077 : 0F 10 92 00 B0 45 63 22 2C 03 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 0E 
        aResults[oldLength + 4] = Class'Item_Type'.15;                          //0092 : 0F 10 92 00 B0 45 63 22 2C 04 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 0F 
        break;                                                                  //00AD : 06 32 03 
      case 1 :                                                                  //00B0 : 0A 8F 01 24 01 
        oldLength = aResults.Length;                                            //00B5 : 0F 00 B0 45 63 22 37 00 00 0C DF 22 
        aResults.Length = oldLength + 7;                                        //00C1 : 0F 37 00 00 0C DF 22 92 00 B0 45 63 22 2C 07 16 
        aResults[oldLength + 0] = Class'Item_Type'.16;                          //00D1 : 0F 10 92 00 B0 45 63 22 25 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 10 
        aResults[oldLength + 1] = Class'Item_Type'.17;                          //00EB : 0F 10 92 00 B0 45 63 22 26 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 11 
        aResults[oldLength + 2] = Class'Item_Type'.18;                          //0105 : 0F 10 92 00 B0 45 63 22 2C 02 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 12 
        aResults[oldLength + 3] = Class'Item_Type'.19;                          //0120 : 0F 10 92 00 B0 45 63 22 2C 03 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 13 
        aResults[oldLength + 4] = Class'Item_Type'.20;                          //013B : 0F 10 92 00 B0 45 63 22 2C 04 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 14 
        aResults[oldLength + 5] = Class'Item_Type'.21;                          //0156 : 0F 10 92 00 B0 45 63 22 2C 05 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 15 
        aResults[oldLength + 6] = Class'Item_Type'.22;                          //0171 : 0F 10 92 00 B0 45 63 22 2C 06 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 16 
        break;                                                                  //018C : 06 32 03 
      case 2 :                                                                  //018F : 0A 1D 02 24 02 
        oldLength = aResults.Length;                                            //0194 : 0F 00 B0 45 63 22 37 00 00 0C DF 22 
        aResults.Length = oldLength + 4;                                        //01A0 : 0F 37 00 00 0C DF 22 92 00 B0 45 63 22 2C 04 16 
        aResults[oldLength + 0] = Class'Item_Type'.23;                          //01B0 : 0F 10 92 00 B0 45 63 22 25 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 17 
        aResults[oldLength + 1] = Class'Item_Type'.24;                          //01CA : 0F 10 92 00 B0 45 63 22 26 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 18 
        aResults[oldLength + 2] = Class'Item_Type'.34;                          //01E4 : 0F 10 92 00 B0 45 63 22 2C 02 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 22 
        aResults[oldLength + 3] = Class'Item_Type'.35;                          //01FF : 0F 10 92 00 B0 45 63 22 2C 03 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 23 
        break;                                                                  //021A : 06 32 03 
      case 3 :                                                                  //021D : 0A 3F 02 24 03 
        GetFilterGroupTypes(1,aResults);                                        //0222 : 1B 53 0C 00 00 24 01 00 00 0C DF 22 16 
        GetFilterGroupTypes(2,aResults);                                        //022F : 1B 53 0C 00 00 24 02 00 00 0C DF 22 16 
        break;                                                                  //023C : 06 32 03 
      case 4 :                                                                  //023F : 0A B2 02 24 04 
        oldLength = aResults.Length;                                            //0244 : 0F 00 B0 45 63 22 37 00 00 0C DF 22 
        aResults.Length = oldLength + 3;                                        //0250 : 0F 37 00 00 0C DF 22 92 00 B0 45 63 22 2C 03 16 
        aResults[oldLength + 0] = Class'Item_Type'.25;                          //0260 : 0F 10 92 00 B0 45 63 22 25 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 19 
        aResults[oldLength + 1] = Class'Item_Type'.26;                          //027A : 0F 10 92 00 B0 45 63 22 26 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 1A 
        aResults[oldLength + 2] = Class'Item_Type'.27;                          //0294 : 0F 10 92 00 B0 45 63 22 2C 02 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 1B 
        break;                                                                  //02AF : 06 32 03 
      case 5 :                                                                  //02B2 : 0A 0A 03 24 05 
        oldLength = aResults.Length;                                            //02B7 : 0F 00 B0 45 63 22 37 00 00 0C DF 22 
        aResults.Length = oldLength + 2;                                        //02C3 : 0F 37 00 00 0C DF 22 92 00 B0 45 63 22 2C 02 16 
        aResults[oldLength + 0] = Class'Item_Type'.28;                          //02D3 : 0F 10 92 00 B0 45 63 22 25 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 1C 
        aResults[oldLength + 1] = Class'Item_Type'.29;                          //02ED : 0F 10 92 00 B0 45 63 22 26 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 1D 
        break;                                                                  //0307 : 06 32 03 
      case 6 :                                                                  //030A : 0A 2C 03 24 06 
        GetFilterGroupTypes(4,aResults);                                        //030F : 1B 53 0C 00 00 24 04 00 00 0C DF 22 16 
        GetFilterGroupTypes(5,aResults);                                        //031C : 1B 53 0C 00 00 24 05 00 00 0C DF 22 16 
        break;                                                                  //0329 : 06 32 03 
      default:                                                                  //032C : 0A FF FF 
        break;                                                                  //032F : 06 32 03 
    }
    //05 01 00 A8 1E 6A 22 0A B0 00 24 00 0F 00 B0 45 63 22 37 00 00 0C DF 22 0F 37 00 00 0C DF 22 92 
    //00 B0 45 63 22 2C 05 16 0F 10 92 00 B0 45 63 22 25 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 
    //24 0B 0F 10 92 00 B0 45 63 22 26 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 0C 0F 10 92 00 
    //B0 45 63 22 2C 02 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 0D 0F 10 92 00 B0 45 63 22 2C 
    //03 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 0E 0F 10 92 00 B0 45 63 22 2C 04 16 00 00 0C 
    //DF 22 12 20 70 EB 5B 01 02 00 01 24 0F 06 32 03 0A 8F 01 24 01 0F 00 B0 45 63 22 37 00 00 0C DF 
    //22 0F 37 00 00 0C DF 22 92 00 B0 45 63 22 2C 07 16 0F 10 92 00 B0 45 63 22 25 16 00 00 0C DF 22 
    //12 20 70 EB 5B 01 02 00 01 24 10 0F 10 92 00 B0 45 63 22 26 16 00 00 0C DF 22 12 20 70 EB 5B 01 
    //02 00 01 24 11 0F 10 92 00 B0 45 63 22 2C 02 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 12 
    //0F 10 92 00 B0 45 63 22 2C 03 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 13 0F 10 92 00 B0 
    //45 63 22 2C 04 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 14 0F 10 92 00 B0 45 63 22 2C 05 
    //16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 15 0F 10 92 00 B0 45 63 22 2C 06 16 00 00 0C DF 
    //22 12 20 70 EB 5B 01 02 00 01 24 16 06 32 03 0A 1D 02 24 02 0F 00 B0 45 63 22 37 00 00 0C DF 22 
    //0F 37 00 00 0C DF 22 92 00 B0 45 63 22 2C 04 16 0F 10 92 00 B0 45 63 22 25 16 00 00 0C DF 22 12 
    //20 70 EB 5B 01 02 00 01 24 17 0F 10 92 00 B0 45 63 22 26 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 
    //00 01 24 18 0F 10 92 00 B0 45 63 22 2C 02 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 22 0F 
    //10 92 00 B0 45 63 22 2C 03 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 23 06 32 03 0A 3F 02 
    //24 03 1B 53 0C 00 00 24 01 00 00 0C DF 22 16 1B 53 0C 00 00 24 02 00 00 0C DF 22 16 06 32 03 0A 
    //B2 02 24 04 0F 00 B0 45 63 22 37 00 00 0C DF 22 0F 37 00 00 0C DF 22 92 00 B0 45 63 22 2C 03 16 
    //0F 10 92 00 B0 45 63 22 25 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 19 0F 10 92 00 B0 45 
    //63 22 26 16 00 00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 1A 0F 10 92 00 B0 45 63 22 2C 02 16 00 
    //00 0C DF 22 12 20 70 EB 5B 01 02 00 01 24 1B 06 32 03 0A 0A 03 24 05 0F 00 B0 45 63 22 37 00 00 
    //0C DF 22 0F 37 00 00 0C DF 22 92 00 B0 45 63 22 2C 02 16 0F 10 92 00 B0 45 63 22 25 16 00 00 0C 
    //DF 22 12 20 70 EB 5B 01 02 00 01 24 1C 0F 10 92 00 B0 45 63 22 26 16 00 00 0C DF 22 12 20 70 EB 
    //5B 01 02 00 01 24 1D 06 32 03 0A 2C 03 24 06 1B 53 0C 00 00 24 04 00 00 0C DF 22 16 1B 53 0C 00 
    //00 24 05 00 00 0C DF 22 16 06 32 03 0A FF FF 06 32 03 04 0B 47 
  }


  function bool ItemTypePresent(byte aTestItemType) {
    return GetFilterIndex(aTestItemType) != -1;                                 //0000 : 04 9B 1B AF 0C 00 00 00 30 1E 6A 22 16 1D FF FF FF FF 16 
    //04 9B 1B AF 0C 00 00 00 30 1E 6A 22 16 1D FF FF FF FF 16 04 0B 47 
  }


  function int GetNumberOfFilters() {
    return mFilterList.Length;                                                  //0000 : 04 37 01 28 46 63 22 
    //04 37 01 28 46 63 22 04 0B 47 
  }


  function ResetFilters() {
    mFilterList.Length = 0;                                                     //0000 : 0F 37 01 28 46 63 22 25 
    //0F 37 01 28 46 63 22 25 04 0B 47 
  }


  function SetItemTypeFilters(array<byte> aItemTypeFilters) {
    local int i;
    mFilterList.Length = aItemTypeFilters.Length;                               //0000 : 0F 37 01 28 46 63 22 37 00 48 FC 7C 19 
    i = 0;                                                                      //000D : 0F 00 98 9E 56 22 25 
    while (i < aItemTypeFilters.Length) {                                       //0014 : 07 45 00 96 00 98 9E 56 22 37 00 48 FC 7C 19 16 
      mFilterList[i] = aItemTypeFilters[i];                                     //0024 : 0F 10 00 98 9E 56 22 01 28 46 63 22 10 00 98 9E 56 22 00 48 FC 7C 19 
      ++i;                                                                      //003B : A3 00 98 9E 56 22 16 
    }
    //0F 37 01 28 46 63 22 37 00 48 FC 7C 19 0F 00 98 9E 56 22 25 07 45 00 96 00 98 9E 56 22 37 00 48 
    //FC 7C 19 16 0F 10 00 98 9E 56 22 01 28 46 63 22 10 00 98 9E 56 22 00 48 FC 7C 19 A3 00 98 9E 56 
    //22 16 06 14 00 04 0B 47 
  }


  function ClearItemTypeFilter(byte aItemTypeToClear) {
    local int i;
    i = GetFilterIndex(aItemTypeToClear);                                       //0000 : 0F 00 70 FD 7C 19 1B AF 0C 00 00 00 08 1D 6A 22 16 
    if (i != -1) {                                                              //0011 : 07 2C 00 9B 00 70 FD 7C 19 1D FF FF FF FF 16 
      mFilterList.Remove(i,1);                                                  //0020 : 41 01 28 46 63 22 00 70 FD 7C 19 26 
    }
    //0F 00 70 FD 7C 19 1B AF 0C 00 00 00 08 1D 6A 22 16 07 2C 00 9B 00 70 FD 7C 19 1D FF FF FF FF 16 
    //41 01 28 46 63 22 00 70 FD 7C 19 26 04 0B 47 
  }


  function AddItemTypeFilter(byte aNewItemType) {
    local int i;
    local int currentLength;
    i = GetFilterIndex(aNewItemType);                                           //0000 : 0F 00 D0 13 6A 22 1B AF 0C 00 00 00 48 14 6A 22 16 
    if (i == -1) {                                                              //0011 : 07 4C 00 9A 00 D0 13 6A 22 1D FF FF FF FF 16 
      currentLength = mFilterList.Length;                                       //0020 : 0F 00 88 FF 7C 19 37 01 28 46 63 22 
      mFilterList.Length = currentLength + 1;                                   //002C : 0F 37 01 28 46 63 22 92 00 88 FF 7C 19 26 16 
      mFilterList[currentLength] = aNewItemType;                                //003B : 0F 10 00 88 FF 7C 19 01 28 46 63 22 00 48 14 6A 22 
    }
    //0F 00 D0 13 6A 22 1B AF 0C 00 00 00 48 14 6A 22 16 07 4C 00 9A 00 D0 13 6A 22 1D FF FF FF FF 16 
    //0F 00 88 FF 7C 19 37 01 28 46 63 22 0F 37 01 28 46 63 22 92 00 88 FF 7C 19 26 16 0F 10 00 88 FF 
    //7C 19 01 28 46 63 22 00 48 14 6A 22 04 0B 47 
  }


  function SetFilterMode(bool aAllowFilterItems) {
    mAllowFilterItems = aAllowFilterItems;                                      //0000 : 14 2D 01 C0 14 6A 22 2D 00 90 1C 6A 22 
    //14 2D 01 C0 14 6A 22 2D 00 90 1C 6A 22 04 0B 47 
  }



