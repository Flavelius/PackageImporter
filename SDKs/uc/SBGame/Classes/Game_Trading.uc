//==============================================================================
//  Game_Trading
//==============================================================================

class Game_Trading extends Base_Component within Game_Pawn
    native
    dependsOn(Game_Item,Item_Type,IC_Broken,Game_Pawn,Game_Character,Game_PlayerItemManager,IC_Recipe,Game_ItemManager,Shop_Base,IC_Appearance,Game_PlayerCharacter,SBDBSync,Game_PlayerController,Game_GUI,Game_TradeManager,Game_PlayerFriends,Player,StringReferences,Game_Desktop,Game_GameInfo)
  ;

  const MAX_TRADE_ITEMS =  16;
  enum EItemForgeError {
    IFE_InternalError ,
    IFE_WrongShopType ,
    IFE_NoneForgableItem ,
    IFE_SlotInvalid ,
    IFE_NotAToken ,
    IFE_IncompatibleSlotType ,
    IFE_LevelTooLow ,
    IFE_TokenRankTooHigh ,
    IFE_NotEnoughMoney ,
    IFE_NoTokensToRemove ,
    IFE_NotEnoughInventorySpace 
  };

  enum ETradingMessages {
    TM_REQ_BUSY_SELF ,
    TM_REQ_BUSY_PARTNER ,
    TM_REQ_IGNORED_ME ,
    TM_REQ_FAILED ,
    TM_DISCONNECT ,
    TM_DIED ,
    TM_REQ_CANCEL ,
    TM_REQ_REJECT ,
    TM_REQ_ACCEPTED ,
    TM_TRADE_CANCELED ,
    TM_OFFER_ACCEPTED ,
    TM_OFFER_CANCELED ,
    TM_INSUFFICIENT_SPACE ,
    TM_PARTNER_INSUFFICIENT_SPACE ,
    TM_FINALIZING ,
    TM_FAILED ,
    TM_DONE 
  };

  enum EClientTradeStates {
    CTS_NONE ,
    CTS_REQUESTING ,
    CTS_RESPONSE ,
    CTS_ACCEPTING ,
    CTS_TRADING ,
    CTS_OFFERED ,
    CTS_FINALIZING 
  };

  struct PaintItem {
      var int DBID;
      var byte Color1;
      var byte Color2;

  };


  var private byte mTradeState;
  var private int mMoney;
  var private string mPartnerName;
  var private transient Shop_Base mShop;
  var private transient byte mShopOption;
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);
  var (null);


  protected native function sv2cl_RemoveSigilsCompleted_CallStub();


  event sv2cl_RemoveSigilsCompleted(bool aSuccess,byte aErrorMessage) {
    OnRemoveSigilsComplete(aSuccess,aErrorMessage);                             //0000 : 43 A0 18 22 11 E7 05 00 00 2D 00 D8 17 22 11 00 18 19 22 11 16 
    //43 A0 18 22 11 E7 05 00 00 2D 00 D8 17 22 11 00 18 19 22 11 16 04 0B 47 
  }


  event sv_RemoveSigilsCompleted(int aErrorCode) {
    sv2cl_RemoveSigilsCompleted_CallStub(aErrorCode == 0,0);                    //0000 : 1B E9 0D 00 00 9A 00 90 1A 22 11 25 16 24 00 16 
    //1B E9 0D 00 00 9A 00 90 1A 22 11 25 16 24 00 16 04 0B 47 
  }


  protected native function cl2sv_RemoveSigils_CallStub();


  native event cl2sv_RemoveSigils(int aDBID);


  function cl_RemoveSigils(Game_Item aItem) {
    cl2sv_RemoveSigils_CallStub(aItem.DBID);                                    //0000 : 1B F0 0D 00 00 19 00 C8 1D 22 11 05 00 04 01 18 1F 22 11 16 
    //1B F0 0D 00 00 19 00 C8 1D 22 11 05 00 04 01 18 1F 22 11 16 04 0B 47 
  }


  delegate OnRemoveSigilsComplete(bool aSuccess,byte aErrorMessage);


  protected native function sv2cl_ForgeSigilCompleted_CallStub();


  event sv2cl_ForgeSigilCompleted(bool aSuccess,byte aErrorMessage) {
    OnForgeSigilComplete(aSuccess,aErrorMessage);                               //0000 : 43 88 23 22 11 C8 05 00 00 2D 00 C0 22 22 11 00 00 24 22 11 16 
    //43 88 23 22 11 C8 05 00 00 2D 00 C0 22 22 11 00 00 24 22 11 16 04 0B 47 
  }


  event sv_ForgeSigilCompleted(int aErrorCode) {
    sv2cl_ForgeSigilCompleted_CallStub(aErrorCode == 0,0);                      //0000 : 1B F8 0D 00 00 9A 00 28 25 22 11 25 16 24 00 16 
    //1B F8 0D 00 00 9A 00 28 25 22 11 25 16 24 00 16 04 0B 47 
  }


  protected native function cl2sv_ForgeSigil_CallStub();


  native event cl2sv_ForgeSigil(int aTokenDBID,int aTargetLocationSlot,int aTargetLocationID);


  function cl_ForgeSigil(Game_Item aTokenItem,int aTargetLocationSlot,int aTargetLocationID) {
    cl2sv_ForgeSigil_CallStub(aTokenItem.DBID,aTargetLocationSlot,aTargetLocationID);//0000 : 1B F9 0D 00 00 19 00 60 29 22 11 05 00 04 01 18 1F 22 11 00 D8 29 22 11 00 50 2A 22 11 16 
    //1B F9 0D 00 00 19 00 60 29 22 11 05 00 04 01 18 1F 22 11 00 D8 29 22 11 00 50 2A 22 11 16 04 0B 
    //47 
  }


  delegate OnForgeSigilComplete(bool aSuccess,byte aErrorMessage);


  function bool CanCreateRecipe(Game_Item aItem,export out editinline Item_Type aOutRecipeType,out int aCost) {
    local export editinline IC_Broken brokenComponent;
    if (mShopOption != 27) {                                                    //0000 : 07 12 00 9B 39 3A 01 20 2F 22 11 39 3A 24 1B 16 
      return False;                                                             //0010 : 04 28 
    }
    if (aItem == None || aItem.Type.ItemType != 38) {                           //0012 : 07 43 00 84 72 00 48 2D 22 11 2A 16 18 20 00 9B 39 3A 19 19 00 48 2D 22 11 05 00 04 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 26 16 16 
      return False;                                                             //0041 : 04 28 
    }
    brokenComponent = IC_Broken(aItem.Type.GetComponentByClass(Class'IC_Broken'));//0043 : 0F 00 88 30 22 11 2E B8 44 5C 01 19 19 00 48 2D 22 11 05 00 04 01 98 2F 22 11 0B 00 04 1C 00 31 22 11 20 B8 44 5C 01 16 
    if (brokenComponent == None || brokenComponent.Recipe == None) {            //006B : 07 8E 00 84 72 00 88 30 22 11 2A 16 18 12 00 72 19 00 88 30 22 11 05 00 04 01 B0 31 22 11 2A 16 16 
      return False;                                                             //008C : 04 28 
    }
    aCost = brokenComponent.GetRecipePrice();                                   //008E : 0F 00 28 32 22 11 19 00 88 30 22 11 06 00 04 1C A0 32 22 11 16 
    if (aCost > Outer.Character.GetMoney()) {                                   //00A3 : 07 C7 00 97 00 28 32 22 11 19 19 01 00 E4 6B 0F 05 00 04 01 68 2E 34 0F 06 00 04 1C 50 33 22 11 16 16 
      return False;                                                             //00C5 : 04 28 
    }
    aOutRecipeType = brokenComponent.Recipe;                                    //00C7 : 0F 00 00 34 22 11 19 00 88 30 22 11 05 00 04 01 B0 31 22 11 
    return True;                                                                //00DB : 04 27 
    //07 12 00 9B 39 3A 01 20 2F 22 11 39 3A 24 1B 16 04 28 07 43 00 84 72 00 48 2D 22 11 2A 16 18 20 
    //00 9B 39 3A 19 19 00 48 2D 22 11 05 00 04 01 98 2F 22 11 05 00 01 01 10 30 22 11 39 3A 24 26 16 
    //16 04 28 0F 00 88 30 22 11 2E B8 44 5C 01 19 19 00 48 2D 22 11 05 00 04 01 98 2F 22 11 0B 00 04 
    //1C 00 31 22 11 20 B8 44 5C 01 16 07 8E 00 84 72 00 88 30 22 11 2A 16 18 12 00 72 19 00 88 30 22 
    //11 05 00 04 01 B0 31 22 11 2A 16 16 04 28 0F 00 28 32 22 11 19 00 88 30 22 11 06 00 04 1C A0 32 
    //22 11 16 07 C7 00 97 00 28 32 22 11 19 19 01 00 E4 6B 0F 05 00 04 01 68 2E 34 0F 06 00 04 1C 50 
    //33 22 11 16 16 04 28 0F 00 00 34 22 11 19 00 88 30 22 11 05 00 04 01 B0 31 22 11 04 27 04 0B 47 
    //
  }


  protected native function sv2cl_CreateRecipeCompleted_CallStub();


  event sv2cl_CreateRecipeCompleted(bool aSuccess) {
    OnCreateRecipeComplete(aSuccess);                                           //0000 : 43 10 37 22 11 BF 05 00 00 2D 00 50 36 22 11 16 
    //43 10 37 22 11 BF 05 00 00 2D 00 50 36 22 11 16 04 0B 47 
  }


  function sv_CreateRecipeCompleted(int aErrorCode) {
    sv2cl_CreateRecipeCompleted_CallStub(aErrorCode == 0);                      //0000 : 1B 63 0D 00 00 9A 00 38 38 22 11 25 16 16 
    //1B 63 0D 00 00 9A 00 38 38 22 11 25 16 16 04 0B 47 
  }


  native function bool sv_CreateRecipe(Game_Item aItem,export editinline Item_Type aRecipeType,int aCost,SBDBAsyncCallback aCallback);


  protected native function cl2sv_CreateRecipe_CallStub();


  event cl2sv_CreateRecipe(int aDBID) {
    local Game_Item Item;
    local export editinline Item_Type recipeType;
    local int cost;
    local SBDBAsyncCallback callback;
    Item = Game_PlayerItemManager(Outer.itemManager).GetItemByID(aDBID);        //0000 : 0F 00 38 3F 22 11 19 2E F0 92 5F 01 19 01 00 E4 6B 0F 05 00 04 01 B0 2D 19 11 0B 00 04 1B 7A 0C 00 00 00 A0 3D 22 11 16 
    if (CanCreateRecipe(Item,recipeType,cost) == False) {                       //0028 : 07 45 00 F2 1B 04 0E 00 00 00 38 3F 22 11 00 B0 3F 22 11 00 28 40 22 11 16 28 16 
      return;                                                                   //0043 : 04 0B 
    }
    callback.ObjectName = static.GetFName();                                    //0045 : 0F 36 D0 01 20 11 00 A0 40 22 11 1C F0 06 6A 0F 16 
    callback.funcName = name("sv_CreateRecipeCompleted");                       //0056 : 0F 36 48 02 20 11 00 A0 40 22 11 39 5A 1F 73 76 5F 43 72 65 61 74 65 52 65 63 69 70 65 43 6F 6D 70 6C 65 74 65 64 00 
    callback.UserData = 0;                                                      //007D : 0F 36 C0 02 20 11 00 A0 40 22 11 25 
    if (!sv_CreateRecipe(Item,recipeType,cost,callback)) {                      //0089 : 07 B1 00 81 1B 0E 0E 00 00 00 38 3F 22 11 00 B0 3F 22 11 00 28 40 22 11 00 A0 40 22 11 16 16 
      sv2cl_CreateRecipeCompleted_CallStub(False);                              //00A8 : 1B 63 0D 00 00 28 16 
      return;                                                                   //00AF : 04 0B 
    }
    //0F 00 38 3F 22 11 19 2E F0 92 5F 01 19 01 00 E4 6B 0F 05 00 04 01 B0 2D 19 11 0B 00 04 1B 7A 0C 
    //00 00 00 A0 3D 22 11 16 07 45 00 F2 1B 04 0E 00 00 00 38 3F 22 11 00 B0 3F 22 11 00 28 40 22 11 
    //16 28 16 04 0B 0F 36 D0 01 20 11 00 A0 40 22 11 1C F0 06 6A 0F 16 0F 36 48 02 20 11 00 A0 40 22 
    //11 39 5A 1F 73 76 5F 43 72 65 61 74 65 52 65 63 69 70 65 43 6F 6D 70 6C 65 74 65 64 00 0F 36 C0 
    //02 20 11 00 A0 40 22 11 25 07 B1 00 81 1B 0E 0E 00 00 00 38 3F 22 11 00 B0 3F 22 11 00 28 40 22 
    //11 00 A0 40 22 11 16 16 1B 63 0D 00 00 28 16 04 0B 04 0B 47 
  }


  function cl_CreateRecipe(Game_Item aItem) {
    cl2sv_CreateRecipe_CallStub(aItem.DBID);                                    //0000 : 1B 0F 0E 00 00 19 00 C8 41 22 11 05 00 04 01 18 1F 22 11 16 
    //1B 0F 0E 00 00 19 00 C8 41 22 11 05 00 04 01 18 1F 22 11 16 04 0B 47 
  }


  delegate OnCreateRecipeComplete(bool aSuccess);


  function bool CanAffordRecipe(export editinline IC_Recipe aRecipeComponent) {
    return aRecipeComponent != None
      && Outer.Character.GetMoney() >= aRecipeComponent.GetCraftPrice();//0000 : 04 82 77 00 60 44 22 11 2A 16 18 2A 00 99 19 19 01 00 E4 6B 0F 05 00 04 01 68 2E 34 0F 06 00 04 1C 50 33 22 11 16 19 00 60 44 22 11 06 00 04 1C 50 45 22 11 16 16 16 
    //04 82 77 00 60 44 22 11 2A 16 18 2A 00 99 19 19 01 00 E4 6B 0F 05 00 04 01 68 2E 34 0F 06 00 04 
    //1C 50 33 22 11 16 19 00 60 44 22 11 06 00 04 1C 50 45 22 11 16 16 16 04 0B 47 
  }


  function bool HasRecipeResources(export editinline IC_Recipe aRecipeComponent) {
    local int i;
    local int avaiableAmount;
    if (aRecipeComponent != None) {                                             //0000 : 07 93 00 77 00 28 47 22 11 2A 16 
      i = 0;                                                                    //000B : 0F 00 A0 48 22 11 25 
      while (i < aRecipeComponent.Components.Length) {                          //0012 : 07 91 00 96 00 A0 48 22 11 37 19 00 28 47 22 11 05 00 00 01 18 49 22 11 16 
        avaiableAmount = Outer.itemManager.CountItems(aRecipeComponent.Components[i].Item);//002B : 0F 00 90 49 22 11 19 19 01 00 E4 6B 0F 05 00 04 01 B0 2D 19 11 1F 00 04 1C 08 4A 22 11 36 40 4B 22 11 10 00 A0 48 22 11 19 00 28 47 22 11 05 00 00 01 18 49 22 11 16 
        if (avaiableAmount < aRecipeComponent.Components[i].Quantity) {         //0062 : 07 87 00 96 00 90 49 22 11 36 B8 4B 22 11 10 00 A0 48 22 11 19 00 28 47 22 11 05 00 00 01 18 49 22 11 16 
          return False;                                                         //0085 : 04 28 
        }
        ++i;                                                                    //0087 : A3 00 A0 48 22 11 16 
      }
      return True;                                                              //0091 : 04 27 
    }
    return False;                                                               //0093 : 04 28 
    //07 93 00 77 00 28 47 22 11 2A 16 0F 00 A0 48 22 11 25 07 91 00 96 00 A0 48 22 11 37 19 00 28 47 
    //22 11 05 00 00 01 18 49 22 11 16 0F 00 90 49 22 11 19 19 01 00 E4 6B 0F 05 00 04 01 B0 2D 19 11 
    //1F 00 04 1C 08 4A 22 11 36 40 4B 22 11 10 00 A0 48 22 11 19 00 28 47 22 11 05 00 00 01 18 49 22 
    //11 16 07 87 00 96 00 90 49 22 11 36 B8 4B 22 11 10 00 A0 48 22 11 19 00 28 47 22 11 05 00 00 01 
    //18 49 22 11 16 04 28 A3 00 A0 48 22 11 16 06 12 00 04 27 04 28 04 0B 47 
  }


  function bool IsValidRecipeItem(Game_Item aItem,export out editinline IC_Recipe aOutRecipeComponent) {
    if (mShop != None) {                                                        //0000 : 07 2A 00 77 01 D0 4D 22 11 2A 16 
      return mShop.IsValidRecipeItem(aItem,mShopOption,aOutRecipeComponent);    //000B : 04 19 01 D0 4D 22 11 15 00 04 1B 07 0D 00 00 00 58 4D 22 11 01 20 2F 22 11 00 48 4E 22 11 16 
    }
    return False;                                                               //002A : 04 28 
    //07 2A 00 77 01 D0 4D 22 11 2A 16 04 19 01 D0 4D 22 11 15 00 04 1B 07 0D 00 00 00 58 4D 22 11 01 
    //20 2F 22 11 00 48 4E 22 11 16 04 28 04 0B 47 
  }


  protected native function sv2cl_CraftRecipeCompleted_CallStub();


  event sv2cl_CraftRecipeCompleted(bool aSuccess) {
    OnCraftRecipeComplete(aSuccess);                                            //0000 : 43 58 51 22 11 BE 05 00 00 2D 00 98 50 22 11 16 
    //43 58 51 22 11 BE 05 00 00 2D 00 98 50 22 11 16 04 0B 47 
  }


  function sv_CraftRecipeCompleted(int aErrorCode) {
    sv2cl_CraftRecipeCompleted_CallStub(aErrorCode == 0);                       //0000 : 1B 69 0D 00 00 9A 00 80 52 22 11 25 16 16 
    //1B 69 0D 00 00 9A 00 80 52 22 11 25 16 16 04 0B 47 
  }


  native function bool sv_CraftRecipe(Game_Item aItem,export editinline IC_Recipe aRecipeComponent,SBDBAsyncCallback aCallback);


  protected native function cl2sv_CraftRecipe_CallStub();


  event cl2sv_CraftRecipe(int aDBID) {
    local Game_Item Item;
    local export editinline IC_Recipe recipeComp;
    local SBDBAsyncCallback callback;
    callback.ObjectName = static.GetFName();                                    //0000 : 0F 36 D0 01 20 11 00 20 59 22 11 1C F0 06 6A 0F 16 
    callback.funcName = name("sv_CraftRecipeCompleted");                        //0011 : 0F 36 48 02 20 11 00 20 59 22 11 39 5A 1F 73 76 5F 43 72 61 66 74 52 65 63 69 70 65 43 6F 6D 70 6C 65 74 65 64 00 
    callback.UserData = 0;                                                      //0037 : 0F 36 C0 02 20 11 00 20 59 22 11 25 
    Item = Game_PlayerItemManager(Outer.itemManager).GetItemByID(aDBID);        //0043 : 0F 00 98 59 22 11 19 2E F0 92 5F 01 19 01 00 E4 6B 0F 05 00 04 01 B0 2D 19 11 0B 00 04 1B 7A 0C 00 00 00 68 57 22 11 16 
    if (!IsValidRecipeItem(Item,recipeComp)) {                                  //006B : 07 82 00 81 1B 07 0D 00 00 00 98 59 22 11 00 10 5A 22 11 16 16 
      return;                                                                   //0080 : 04 0B 
    }
    if (!CanAffordRecipe(recipeComp)
      || !HasRecipeResources(recipeComp)) {//0082 : 07 A6 00 84 81 1B 10 0E 00 00 00 10 5A 22 11 16 16 18 0E 00 81 1B 1A 0E 00 00 00 10 5A 22 11 16 16 16 
      return;                                                                   //00A4 : 04 0B 
    }
    if (!sv_CraftRecipe(Item,recipeComp,callback)) {                            //00A6 : 07 C9 00 81 1B 1F 0E 00 00 00 98 59 22 11 00 10 5A 22 11 00 20 59 22 11 16 16 
      sv2cl_CraftRecipeCompleted_CallStub(False);                               //00C0 : 1B 69 0D 00 00 28 16 
      return;                                                                   //00C7 : 04 0B 
    }
    //0F 36 D0 01 20 11 00 20 59 22 11 1C F0 06 6A 0F 16 0F 36 48 02 20 11 00 20 59 22 11 39 5A 1F 73 
    //76 5F 43 72 61 66 74 52 65 63 69 70 65 43 6F 6D 70 6C 65 74 65 64 00 0F 36 C0 02 20 11 00 20 59 
    //22 11 25 0F 00 98 59 22 11 19 2E F0 92 5F 01 19 01 00 E4 6B 0F 05 00 04 01 B0 2D 19 11 0B 00 04 
    //1B 7A 0C 00 00 00 68 57 22 11 16 07 82 00 81 1B 07 0D 00 00 00 98 59 22 11 00 10 5A 22 11 16 16 
    //04 0B 07 A6 00 84 81 1B 10 0E 00 00 00 10 5A 22 11 16 16 18 0E 00 81 1B 1A 0E 00 00 00 10 5A 22 
    //11 16 16 16 04 0B 07 C9 00 81 1B 1F 0E 00 00 00 98 59 22 11 00 10 5A 22 11 00 20 59 22 11 16 16 
    //1B 69 0D 00 00 28 16 04 0B 04 0B 47 
  }


  function cl_CraftRecipe(Game_Item aItem) {
    cl2sv_CraftRecipe_CallStub(aItem.DBID);                                     //0000 : 1B 21 0E 00 00 19 00 38 5B 22 11 05 00 04 01 18 1F 22 11 16 
    //1B 21 0E 00 00 19 00 38 5B 22 11 05 00 04 01 18 1F 22 11 16 04 0B 47 
  }


  delegate OnCraftRecipeComplete(bool aSuccess);


  event int GetPaintCost(Game_Item aItem) {
    local export editinline IC_Appearance appearanceComp;
    appearanceComp = IC_Appearance(aItem.Type.GetComponentByClass(Class'IC_Appearance'));//0000 : 0F 00 28 5F 22 11 2E B8 F0 5B 01 19 19 00 00 5E 22 11 05 00 04 01 98 2F 22 11 0B 00 04 1C 00 31 22 11 20 B8 F0 5B 01 16 
    if (appearanceComp == None
      || appearanceComp.Appearance == None) {    //0028 : 07 4F 00 84 72 00 28 5F 22 11 2A 16 18 12 00 72 19 00 28 5F 22 11 05 00 04 01 A0 5F 22 11 2A 16 16 
      return -1;                                                                //0049 : 04 1D FF FF FF FF 
    }
    return appearanceComp.DyePrice;                                             //004F : 04 19 00 28 5F 22 11 05 00 04 01 18 60 22 11 
    //0F 00 28 5F 22 11 2E B8 F0 5B 01 19 19 00 00 5E 22 11 05 00 04 01 98 2F 22 11 0B 00 04 1C 00 31 
    //22 11 20 B8 F0 5B 01 16 07 4F 00 84 72 00 28 5F 22 11 2A 16 18 12 00 72 19 00 28 5F 22 11 05 00 
    //04 01 A0 5F 22 11 2A 16 16 04 1D FF FF FF FF 04 19 00 28 5F 22 11 05 00 04 01 18 60 22 11 04 0B 
    //47 
  }


  event bool CanPaintItem(Game_Item aItem) {
    if (aItem != None && aItem.Type != None) {                                  //0000 : 07 25 01 82 77 00 B8 61 22 11 2A 16 18 12 00 77 19 00 B8 61 22 11 05 00 04 01 98 2F 22 11 2A 16 16 
      switch (aItem.Type.ItemType) {                                            //0021 : 05 01 19 19 00 B8 61 22 11 05 00 04 01 98 2F 22 11 05 00 01 01 10 30 22 11 
        case Class'Item_Type'.16 :                                              //003A : 0A 48 00 12 20 70 EB 5B 01 02 00 01 24 10 
        case Class'Item_Type'.17 :                                              //0048 : 0A 56 00 12 20 70 EB 5B 01 02 00 01 24 11 
        case Class'Item_Type'.18 :                                              //0056 : 0A 64 00 12 20 70 EB 5B 01 02 00 01 24 12 
        case Class'Item_Type'.19 :                                              //0064 : 0A 72 00 12 20 70 EB 5B 01 02 00 01 24 13 
        case Class'Item_Type'.20 :                                              //0072 : 0A 80 00 12 20 70 EB 5B 01 02 00 01 24 14 
        case Class'Item_Type'.21 :                                              //0080 : 0A 8E 00 12 20 70 EB 5B 01 02 00 01 24 15 
        case Class'Item_Type'.22 :                                              //008E : 0A 9C 00 12 20 70 EB 5B 01 02 00 01 24 16 
        case Class'Item_Type'.23 :                                              //009C : 0A AA 00 12 20 70 EB 5B 01 02 00 01 24 17 
        case Class'Item_Type'.24 :                                              //00AA : 0A B8 00 12 20 70 EB 5B 01 02 00 01 24 18 
        case Class'Item_Type'.34 :                                              //00B8 : 0A C6 00 12 20 70 EB 5B 01 02 00 01 24 22 
        case Class'Item_Type'.35 :                                              //00C6 : 0A D4 00 12 20 70 EB 5B 01 02 00 01 24 23 
        case Class'Item_Type'.25 :                                              //00D4 : 0A E2 00 12 20 70 EB 5B 01 02 00 01 24 19 
        case Class'Item_Type'.26 :                                              //00E2 : 0A F0 00 12 20 70 EB 5B 01 02 00 01 24 1A 
        case Class'Item_Type'.27 :                                              //00F0 : 0A FE 00 12 20 70 EB 5B 01 02 00 01 24 1B 
        case Class'Item_Type'.28 :                                              //00FE : 0A 0C 01 12 20 70 EB 5B 01 02 00 01 24 1C 
        case Class'Item_Type'.29 :                                              //010C : 0A 1F 01 12 20 70 EB 5B 01 02 00 01 24 1D 
          return True;                                                          //011A : 04 27 
          break;                                                                //011C : 06 25 01 
        default:                                                                //011F : 0A FF FF 
          break;                                                                //0122 : 06 25 01 
      }
    }
    return False;                                                               //0125 : 04 28 
    //07 25 01 82 77 00 B8 61 22 11 2A 16 18 12 00 77 19 00 B8 61 22 11 05 00 04 01 98 2F 22 11 2A 16 
    //16 05 01 19 19 00 B8 61 22 11 05 00 04 01 98 2F 22 11 05 00 01 01 10 30 22 11 0A 48 00 12 20 70 
    //EB 5B 01 02 00 01 24 10 0A 56 00 12 20 70 EB 5B 01 02 00 01 24 11 0A 64 00 12 20 70 EB 5B 01 02 
    //00 01 24 12 0A 72 00 12 20 70 EB 5B 01 02 00 01 24 13 0A 80 00 12 20 70 EB 5B 01 02 00 01 24 14 
    //0A 8E 00 12 20 70 EB 5B 01 02 00 01 24 15 0A 9C 00 12 20 70 EB 5B 01 02 00 01 24 16 0A AA 00 12 
    //20 70 EB 5B 01 02 00 01 24 17 0A B8 00 12 20 70 EB 5B 01 02 00 01 24 18 0A C6 00 12 20 70 EB 5B 
    //01 02 00 01 24 22 0A D4 00 12 20 70 EB 5B 01 02 00 01 24 23 0A E2 00 12 20 70 EB 5B 01 02 00 01 
    //24 19 0A F0 00 12 20 70 EB 5B 01 02 00 01 24 1A 0A FE 00 12 20 70 EB 5B 01 02 00 01 24 1B 0A 0C 
    //01 12 20 70 EB 5B 01 02 00 01 24 1C 0A 1F 01 12 20 70 EB 5B 01 02 00 01 24 1D 04 27 06 25 01 0A 
    //FF FF 06 25 01 04 28 04 0B 47 
  }


  protected native function sv2cl_PaintCompleted_CallStub();


  event sv2cl_PaintCompleted(bool aSuccess) {
    OnPaintComplete(aSuccess);                                                  //0000 : 43 90 66 22 11 D9 05 00 00 2D 00 D0 65 22 11 16 
    //43 90 66 22 11 D9 05 00 00 2D 00 D0 65 22 11 16 04 0B 47 
  }


  function sv_PaintCompleted(int aErrorCode) {
    sv2cl_PaintCompleted_CallStub(aErrorCode == 0);                             //0000 : 1B 7F 0C 00 00 9A 00 B8 67 22 11 25 16 16 
    //1B 7F 0C 00 00 9A 00 B8 67 22 11 25 16 16 04 0B 47 
  }


  final native function bool sv_PaintItems(array<PaintItem> aRepItems,int aCost,SBDBAsyncCallback aCallback);


  protected native function cl2sv_PaintItems_CallStub();


  event cl2sv_PaintItems(array<PaintItem> aPaintItems) {
    local SBDBAsyncCallback callback;
    local Game_Item Item;
    local export editinline Game_PlayerItemManager itemManager;
    local int totalCost;
    local int i;
    local int tempCost;
    itemManager = Game_PlayerItemManager(Outer.itemManager);                    //0000 : 0F 00 58 71 22 11 2E F0 92 5F 01 19 01 00 E4 6B 0F 05 00 04 01 B0 2D 19 11 
    if (itemManager == None) {                                                  //0019 : 07 2D 00 72 00 58 71 22 11 2A 16 
      sv2cl_PaintCompleted_CallStub(False);                                     //0024 : 1B 7F 0C 00 00 28 16 
      return;                                                                   //002B : 04 0B 
    }
    totalCost = 0;                                                              //002D : 0F 00 D0 71 22 11 25 
    i = 0;                                                                      //0034 : 0F 00 48 72 22 11 25 
    while (i < aPaintItems.Length) {                                            //003B : 07 D5 00 96 00 48 72 22 11 37 00 08 6F 22 11 16 
      Item = itemManager.GetItemByID(aPaintItems[i].DBID);                      //004B : 0F 00 C0 72 22 11 19 00 58 71 22 11 16 00 04 1B 7A 0C 00 00 36 C8 6B 22 11 10 00 48 72 22 11 00 08 6F 22 11 16 
      if (Item == None || !CanPaintItem(Item)) {                                //0070 : 07 96 00 84 72 00 C0 72 22 11 2A 16 18 0E 00 81 1B 88 04 00 00 00 C0 72 22 11 16 16 16 
        sv2cl_PaintCompleted_CallStub(False);                                   //008D : 1B 7F 0C 00 00 28 16 
        return;                                                                 //0094 : 04 0B 
      }
      tempCost = GetPaintCost(Item);                                            //0096 : 0F 00 38 73 22 11 1B 78 05 00 00 00 C0 72 22 11 16 
      if (tempCost == -1) {                                                     //00A7 : 07 BF 00 9A 00 38 73 22 11 1D FF FF FF FF 16 
        sv2cl_PaintCompleted_CallStub(False);                                   //00B6 : 1B 7F 0C 00 00 28 16 
        return;                                                                 //00BD : 04 0B 
      }
      totalCost += tempCost;                                                    //00BF : A1 00 D0 71 22 11 00 38 73 22 11 16 
      ++i;                                                                      //00CB : A3 00 48 72 22 11 16 
    }
    callback.ObjectName = static.GetFName();                                    //00D5 : 0F 36 D0 01 20 11 00 B0 73 22 11 1C F0 06 6A 0F 16 
    callback.funcName = name("sv_PaintCompleted");                              //00E6 : 0F 36 48 02 20 11 00 B0 73 22 11 39 5A 1F 73 76 5F 50 61 69 6E 74 43 6F 6D 70 6C 65 74 65 64 00 
    callback.UserData = 0;                                                      //0106 : 0F 36 C0 02 20 11 00 B0 73 22 11 25 
    if (sv_PaintItems(aPaintItems,totalCost,callback)) {                        //0112 : 07 2C 01 1C 08 67 22 11 00 08 6F 22 11 00 D0 71 22 11 00 B0 73 22 11 16 
      return;                                                                   //012A : 04 0B 
    }
    sv2cl_PaintCompleted_CallStub(False);                                       //012C : 1B 7F 0C 00 00 28 16 
    //0F 00 58 71 22 11 2E F0 92 5F 01 19 01 00 E4 6B 0F 05 00 04 01 B0 2D 19 11 07 2D 00 72 00 58 71 
    //22 11 2A 16 1B 7F 0C 00 00 28 16 04 0B 0F 00 D0 71 22 11 25 0F 00 48 72 22 11 25 07 D5 00 96 00 
    //48 72 22 11 37 00 08 6F 22 11 16 0F 00 C0 72 22 11 19 00 58 71 22 11 16 00 04 1B 7A 0C 00 00 36 
    //C8 6B 22 11 10 00 48 72 22 11 00 08 6F 22 11 16 07 96 00 84 72 00 C0 72 22 11 2A 16 18 0E 00 81 
    //1B 88 04 00 00 00 C0 72 22 11 16 16 16 1B 7F 0C 00 00 28 16 04 0B 0F 00 38 73 22 11 1B 78 05 00 
    //00 00 C0 72 22 11 16 07 BF 00 9A 00 38 73 22 11 1D FF FF FF FF 16 1B 7F 0C 00 00 28 16 04 0B A1 
    //00 D0 71 22 11 00 38 73 22 11 16 A3 00 48 72 22 11 16 06 3B 00 0F 36 D0 01 20 11 00 B0 73 22 11 
    //1C F0 06 6A 0F 16 0F 36 48 02 20 11 00 B0 73 22 11 39 5A 1F 73 76 5F 50 61 69 6E 74 43 6F 6D 70 
    //6C 65 74 65 64 00 0F 36 C0 02 20 11 00 B0 73 22 11 25 07 2C 01 1C 08 67 22 11 00 08 6F 22 11 00 
    //D0 71 22 11 00 B0 73 22 11 16 04 0B 1B 7F 0C 00 00 28 16 04 0B 47 
  }


  function cl_PaintItems(array<PaintItem> aPaintItems) {
    if (aPaintItems.Length > 0) {                                               //0000 : 07 17 00 97 37 00 50 75 22 11 25 16 
      cl2sv_PaintItems_CallStub(aPaintItems);                                   //000C : 1B 33 0E 00 00 00 50 75 22 11 16 
    }
    //07 17 00 97 37 00 50 75 22 11 25 16 1B 33 0E 00 00 00 50 75 22 11 16 04 0B 47 
  }


  delegate OnPaintComplete(bool aSuccess);


  event bool CanBuyItem(export editinline Item_Type aItemType,int aAmount) {
    local int playerMoney;
    if (Outer != None && Outer.Character != None) {                             //0000 : 07 44 00 82 77 01 00 E4 6B 0F 2A 16 18 12 00 77 19 01 00 E4 6B 0F 05 00 04 01 68 2E 34 0F 2A 16 16 
      playerMoney = Game_PlayerCharacter(Outer.Character).GetMoney();           //0021 : 0F 00 E0 79 22 11 19 2E 30 83 5F 01 19 01 00 E4 6B 0F 05 00 04 01 68 2E 34 0F 06 00 04 1C 50 33 22 11 16 
    }
    return aItemType != None && aAmount > 0
      && playerMoney >= aItemType.GetBuyPrice() * aAmount
      && mShop != None
      && mShop.HasItemInStock(aItemType.GetResourceId(),aAmount);//0044 : 04 82 82 82 82 77 00 48 78 22 11 2A 16 18 09 00 97 00 58 7A 22 11 25 16 16 18 1E 00 99 00 E0 79 22 11 90 19 00 48 78 22 11 06 00 04 1C D0 7A 22 11 16 00 58 7A 22 11 16 16 16 18 09 00 77 01 D0 4D 22 11 2A 16 16 18 24 00 19 01 D0 4D 22 11 1A 00 04 1B CA 0D 00 00 19 00 48 78 22 11 06 00 04 1C 08 90 20 11 16 00 58 7A 22 11 16 16 
    //07 44 00 82 77 01 00 E4 6B 0F 2A 16 18 12 00 77 19 01 00 E4 6B 0F 05 00 04 01 68 2E 34 0F 2A 16 
    //16 0F 00 E0 79 22 11 19 2E 30 83 5F 01 19 01 00 E4 6B 0F 05 00 04 01 68 2E 34 0F 06 00 04 1C 50 
    //33 22 11 16 04 82 82 82 82 77 00 48 78 22 11 2A 16 18 09 00 97 00 58 7A 22 11 25 16 16 18 1E 00 
    //99 00 E0 79 22 11 90 19 00 48 78 22 11 06 00 04 1C D0 7A 22 11 16 00 58 7A 22 11 16 16 16 18 09 
    //00 77 01 D0 4D 22 11 2A 16 16 18 24 00 19 01 D0 4D 22 11 1A 00 04 1B CA 0D 00 00 19 00 48 78 22 
    //11 06 00 04 1C 08 90 20 11 16 00 58 7A 22 11 16 16 04 0B 47 
  }


  protected native function sv2cl_BuyCompleted_CallStub();


  event sv2cl_BuyCompleted(bool aSuccess) {
    OnBuyComplete(aSuccess);                                                    //0000 : 43 18 7E 22 11 B6 05 00 00 2D 00 58 7D 22 11 16 
    //43 18 7E 22 11 B6 05 00 00 2D 00 58 7D 22 11 16 04 0B 47 
  }


  function sv_BuyCompleted(int aErrorCode) {
    sv2cl_BuyCompleted_CallStub(aErrorCode == 0);                               //0000 : 1B 72 0D 00 00 9A 00 40 7F 22 11 25 16 16 
    //1B 72 0D 00 00 9A 00 40 7F 22 11 25 16 16 04 0B 47 
  }


  native function bool sv_BuyItem(export editinline Item_Type aItem,int aAmount,int aTargetLocationSlot,SBDBAsyncCallback aCallback);


  protected native function cl2sv_BuyItem_CallStub();


  event cl2sv_BuyItem(int aItemTypeID,int aAmount,int aTargetLocationSlot) {
    local SBDBAsyncCallback callback;
    local export editinline Item_Type ItemType;
    callback.ObjectName = static.GetFName();                                    //0000 : 0F 36 D0 01 20 11 00 20 85 22 11 1C F0 06 6A 0F 16 
    callback.funcName = name("sv_BuyCompleted");                                //0011 : 0F 36 48 02 20 11 00 20 85 22 11 39 5A 1F 73 76 5F 42 75 79 43 6F 6D 70 6C 65 74 65 64 00 
    callback.UserData = 0;                                                      //002F : 0F 36 C0 02 20 11 00 20 85 22 11 25 
    if (aAmount <= 0) {                                                         //003B : 07 50 00 98 00 98 85 22 11 25 16 
      aAmount = 1;                                                              //0046 : 0F 00 98 85 22 11 26 
    } else {                                                                    //004D : 06 64 00 
      if (aAmount > 10) {                                                       //0050 : 07 64 00 97 00 98 85 22 11 2C 0A 16 
        aAmount = 10;                                                           //005C : 0F 00 98 85 22 11 2C 0A 
      }
    }
    ItemType = Item_Type(Class'SBDBSync'.GetResourceObject(aItemTypeID));       //0064 : 0F 00 10 86 22 11 2E 70 EB 5B 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 A8 84 22 11 16 
    if (CanBuyItem(ItemType,aAmount)
      && sv_BuyItem(ItemType,aAmount,aTargetLocationSlot,callback)) {//0083 : 07 B7 00 82 1B 84 04 00 00 00 10 86 22 11 00 98 85 22 11 16 18 1B 00 1B 42 0E 00 00 00 10 86 22 11 00 98 85 22 11 00 88 86 22 11 00 20 85 22 11 16 16 
      return;                                                                   //00B5 : 04 0B 
    }
    sv2cl_BuyCompleted_CallStub(False);                                         //00B7 : 1B 72 0D 00 00 28 16 
    //0F 36 D0 01 20 11 00 20 85 22 11 1C F0 06 6A 0F 16 0F 36 48 02 20 11 00 20 85 22 11 39 5A 1F 73 
    //76 5F 42 75 79 43 6F 6D 70 6C 65 74 65 64 00 0F 36 C0 02 20 11 00 20 85 22 11 25 07 50 00 98 00 
    //98 85 22 11 25 16 0F 00 98 85 22 11 26 06 64 00 07 64 00 97 00 98 85 22 11 2C 0A 16 0F 00 98 85 
    //22 11 2C 0A 0F 00 10 86 22 11 2E 70 EB 5B 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 A8 84 
    //22 11 16 07 B7 00 82 1B 84 04 00 00 00 10 86 22 11 00 98 85 22 11 16 18 1B 00 1B 42 0E 00 00 00 
    //10 86 22 11 00 98 85 22 11 00 88 86 22 11 00 20 85 22 11 16 16 04 0B 1B 72 0D 00 00 28 16 04 0B 
    //47 
  }


  function cl_BuyItem(Game_Item aItem,int aAmount,int aTargetLocationSlot) {
    cl2sv_BuyItem_CallStub(aItem.Type.GetResourceId(),aAmount,aTargetLocationSlot);//0000 : 1B B0 0F 00 00 19 19 00 B0 87 22 11 05 00 04 01 98 2F 22 11 06 00 04 1C 08 90 20 11 16 00 90 88 22 11 00 08 89 22 11 16 
    //1B B0 0F 00 00 19 19 00 B0 87 22 11 05 00 04 01 98 2F 22 11 06 00 04 1C 08 90 20 11 16 00 90 88 
    //22 11 00 08 89 22 11 16 04 0B 47 
  }


  delegate OnBuyComplete(bool aSuccess);


  event bool CanSellItem(Game_Item aItem) {
    if (mShopOption < 20 || mShopOption > 26) {                                 //0000 : 07 24 00 84 96 39 3A 01 20 2F 22 11 39 3A 24 14 16 18 0E 00 97 39 3A 01 20 2F 22 11 39 3A 24 1A 16 16 
      return False;                                                             //0022 : 04 28 
    }
    return aItem != None && aItem.Type != None
      && aItem.Type.Sellable
      && mShop != None
      && mShop.CanBuyItem(aItem.Type.ItemType);//0024 : 04 82 82 82 82 77 00 88 8B 22 11 2A 16 18 12 00 77 19 00 88 8B 22 11 05 00 04 01 98 2F 22 11 2A 16 16 18 19 00 19 19 00 88 8B 22 11 05 00 04 01 98 2F 22 11 06 00 04 2D 01 00 8D 22 11 16 18 09 00 77 01 D0 4D 22 11 2A 16 16 18 27 00 19 01 D0 4D 22 11 1D 00 04 1B 84 04 00 00 19 19 00 88 8B 22 11 05 00 04 01 98 2F 22 11 05 00 01 01 10 30 22 11 16 16 
    //07 24 00 84 96 39 3A 01 20 2F 22 11 39 3A 24 14 16 18 0E 00 97 39 3A 01 20 2F 22 11 39 3A 24 1A 
    //16 16 04 28 04 82 82 82 82 77 00 88 8B 22 11 2A 16 18 12 00 77 19 00 88 8B 22 11 05 00 04 01 98 
    //2F 22 11 2A 16 16 18 19 00 19 19 00 88 8B 22 11 05 00 04 01 98 2F 22 11 06 00 04 2D 01 00 8D 22 
    //11 16 18 09 00 77 01 D0 4D 22 11 2A 16 16 18 27 00 19 01 D0 4D 22 11 1D 00 04 1B 84 04 00 00 19 
    //19 00 88 8B 22 11 05 00 04 01 98 2F 22 11 05 00 01 01 10 30 22 11 16 16 04 0B 47 
  }


  protected native function sv2cl_SellCompleted_CallStub();


  event sv2cl_SellCompleted(bool aSuccess) {
    OnSellComplete(aSuccess);                                                   //0000 : 43 10 90 22 11 EC 05 00 00 2D 00 50 8F 22 11 16 
    //43 10 90 22 11 EC 05 00 00 2D 00 50 8F 22 11 16 04 0B 47 
  }


  function sv_SellCompleted(int aErrorCode) {
    sv2cl_SellCompleted_CallStub(aErrorCode == 0);                              //0000 : 1B 76 0D 00 00 9A 00 38 91 22 11 25 16 16 
    //1B 76 0D 00 00 9A 00 38 91 22 11 25 16 16 04 0B 47 
  }


  native function bool sv_SellItems(array<Game_Item> aItem,SBDBAsyncCallback aCallback);


  protected native function cl2sv_SellItems_CallStub();


  event cl2sv_SellItems(array<int> aItemIDs) {
    local int i;
    local Game_Item Item;
    local array<Game_Item> Items;
    local SBDBAsyncCallback callback;
    if (aItemIDs.Length > 0) {                                                  //0000 : 07 EF 00 97 37 00 E0 95 22 11 25 16 
      callback.ObjectName = static.GetFName();                                  //000C : 0F 36 D0 01 20 11 00 58 96 22 11 1C F0 06 6A 0F 16 
      callback.funcName = name("sv_SellCompleted");                             //001D : 0F 36 48 02 20 11 00 58 96 22 11 39 5A 1F 73 76 5F 53 65 6C 6C 43 6F 6D 70 6C 65 74 65 64 00 
      callback.UserData = 0;                                                    //003C : 0F 36 C0 02 20 11 00 58 96 22 11 25 
      i = 0;                                                                    //0048 : 0F 00 D0 96 22 11 25 
      while (i < aItemIDs.Length) {                                             //004F : 07 C9 00 96 00 D0 96 22 11 37 00 E0 95 22 11 16 
        Item = Game_PlayerItemManager(Outer.itemManager).GetItemByID(aItemIDs[i]);//005F : 0F 00 48 97 22 11 19 2E F0 92 5F 01 19 01 00 E4 6B 0F 05 00 04 01 B0 2D 19 11 11 00 04 1B 7A 0C 00 00 10 00 D0 96 22 11 00 E0 95 22 11 16 
        if (Item == None || !CanSellItem(Item)) {                               //008D : 07 AD 00 84 72 00 48 97 22 11 2A 16 18 0E 00 81 1B 8A 04 00 00 00 48 97 22 11 16 16 16 
          goto jl00C9;                                                          //00AA : 06 C9 00 
        }
        Items[Items.Length] = Item;                                             //00AD : 0F 10 37 00 C0 97 22 11 00 C0 97 22 11 00 48 97 22 11 
        ++i;                                                                    //00BF : A3 00 D0 96 22 11 16 
      }
      if (Items.Length == aItemIDs.Length) {                                    //00C9 : 07 EF 00 9A 37 00 C0 97 22 11 37 00 E0 95 22 11 16 
        if (sv_SellItems(Items,callback)) {                                     //00DA : 07 EF 00 1B 57 0E 00 00 00 C0 97 22 11 00 58 96 22 11 16 
          return;                                                               //00ED : 04 0B 
        }
      }
    }
    sv2cl_SellCompleted_CallStub(False);                                        //00EF : 1B 76 0D 00 00 28 16 
    //07 EF 00 97 37 00 E0 95 22 11 25 16 0F 36 D0 01 20 11 00 58 96 22 11 1C F0 06 6A 0F 16 0F 36 48 
    //02 20 11 00 58 96 22 11 39 5A 1F 73 76 5F 53 65 6C 6C 43 6F 6D 70 6C 65 74 65 64 00 0F 36 C0 02 
    //20 11 00 58 96 22 11 25 0F 00 D0 96 22 11 25 07 C9 00 96 00 D0 96 22 11 37 00 E0 95 22 11 16 0F 
    //00 48 97 22 11 19 2E F0 92 5F 01 19 01 00 E4 6B 0F 05 00 04 01 B0 2D 19 11 11 00 04 1B 7A 0C 00 
    //00 10 00 D0 96 22 11 00 E0 95 22 11 16 07 AD 00 84 72 00 48 97 22 11 2A 16 18 0E 00 81 1B 8A 04 
    //00 00 00 48 97 22 11 16 16 16 06 C9 00 0F 10 37 00 C0 97 22 11 00 C0 97 22 11 00 48 97 22 11 A3 
    //00 D0 96 22 11 16 06 4F 00 07 EF 00 9A 37 00 C0 97 22 11 37 00 E0 95 22 11 16 07 EF 00 1B 57 0E 
    //00 00 00 C0 97 22 11 00 58 96 22 11 16 04 0B 1B 76 0D 00 00 28 16 04 0B 47 
  }


  function cl_SellItems(array<int> aItemIDs) {
    cl2sv_SellItems_CallStub(aItemIDs);                                         //0000 : 1B 58 0E 00 00 00 D8 99 22 11 16 
    //1B 58 0E 00 00 00 D8 99 22 11 16 04 0B 47 
  }


  delegate OnSellComplete(bool aSuccess);


  function array<Game_Item> cl_GetShopStock() {
    return mShop.GetItems();                                                    //0000 : 04 19 01 D0 4D 22 11 06 00 00 1B 02 0D 00 00 16 
    //04 19 01 D0 4D 22 11 06 00 00 1B 02 0D 00 00 16 04 0B 47 
  }


  function bool IsShopping() {
    return mShop != None;                                                       //0000 : 04 77 01 D0 4D 22 11 2A 16 
    //04 77 01 D0 4D 22 11 2A 16 04 0B 47 
  }


  function byte cl_GetShopOption() {
    return mShopOption;                                                         //0000 : 04 01 20 2F 22 11 
    //04 01 20 2F 22 11 04 0B 47 
  }


  function Shop_Base cl_GetShop() {
    return mShop;                                                               //0000 : 04 01 D0 4D 22 11 
    //04 01 D0 4D 22 11 04 0B 47 
  }


  function ResetShop() {
    mShop = None;                                                               //0000 : 0F 01 D0 4D 22 11 2A 
    mShopOption = 36;                                                           //0007 : 0F 01 20 2F 22 11 24 24 
    //0F 01 D0 4D 22 11 2A 0F 01 20 2F 22 11 24 24 04 0B 47 
  }


  protected native function cl2sv_ExitShop_CallStub();


  event cl2sv_ExitShop() {
    ResetShop();                                                                //0000 : 1B ED 0C 00 00 16 
    //1B ED 0C 00 00 16 04 0B 47 
  }


  function cl_ExitShop() {
    ResetShop();                                                                //0000 : 1B ED 0C 00 00 16 
    cl2sv_ExitShop_CallStub();                                                  //0006 : 1B 7D 0D 00 00 16 
    //1B ED 0C 00 00 16 1B 7D 0D 00 00 16 04 0B 47 
  }


  protected native function sv2cl_EnterShop_CallStub();


  event sv2cl_EnterShop() {
    if (mShop != None) {                                                        //0000 : 07 3E 00 77 01 D0 4D 22 11 2A 16 
      Game_PlayerController(Outer.Controller).GUI.ShowShop(mShop,mShopOption);  //000B : 19 19 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 40 8A 1B 11 10 00 00 1B CD 0E 00 00 01 D0 4D 22 11 01 20 2F 22 11 16 
    } else {                                                                    //003B : 06 4A 00 
      cl2sv_ExitShop_CallStub();                                                //003E : 1B 7D 0D 00 00 16 
      ResetShop();                                                              //0044 : 1B ED 0C 00 00 16 
    }
    //07 3E 00 77 01 D0 4D 22 11 2A 16 19 19 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 
    //05 00 04 01 40 8A 1B 11 10 00 00 1B CD 0E 00 00 01 D0 4D 22 11 01 20 2F 22 11 16 06 4A 00 1B 7D 
    //0D 00 00 16 1B ED 0C 00 00 16 04 0B 47 
  }


  function sv_EnterShop(Shop_Base aShopInfo,byte aOption) {
    mShop = aShopInfo;                                                          //0000 : 0F 01 D0 4D 22 11 00 A0 A8 22 11 
    mShopOption = aOption;                                                      //000B : 0F 01 20 2F 22 11 00 70 A9 22 11 
    sv2cl_EnterShop_CallStub();                                                 //0016 : 1B 8A 0E 00 00 16 
    //0F 01 D0 4D 22 11 00 A0 A8 22 11 0F 01 20 2F 22 11 00 70 A9 22 11 1B 8A 0E 00 00 16 04 0B 47 
  }


  function cl_SetShop(Shop_Base aShopInfo,byte aOption) {
    mShop = aShopInfo;                                                          //0000 : 0F 01 D0 4D 22 11 00 98 AA 22 11 
    mShopOption = aOption;                                                      //000B : 0F 01 20 2F 22 11 00 60 AB 22 11 
    //0F 01 D0 4D 22 11 00 98 AA 22 11 0F 01 20 2F 22 11 00 60 AB 22 11 04 0B 47 
  }


  protected native function cl2sv_AcceptOffer_CallStub();


  private event cl2sv_AcceptOffer() {
    sv_GetTradeManager().sv_AcceptOffer(Outer);                                 //0000 : 19 1B 11 0C 00 00 16 0B 00 00 1B A0 0E 00 00 01 00 E4 6B 0F 16 
    //19 1B 11 0C 00 00 16 0B 00 00 1B A0 0E 00 00 01 00 E4 6B 0F 16 04 0B 47 
  }


  function cl_AcceptOffer() {
    mTradeState = 5;                                                            //0000 : 0F 01 78 AE 22 11 24 05 
    cl2sv_AcceptOffer_CallStub();                                               //0008 : 1B 98 0E 00 00 16 
    //0F 01 78 AE 22 11 24 05 1B 98 0E 00 00 16 04 0B 47 
  }


  protected native function cl2sv_CancelTrade_CallStub();


  private event cl2sv_CancelTrade() {
    sv_GetTradeManager().sv_CancelTrade(Outer);                                 //0000 : 19 1B 11 0C 00 00 16 0B 00 00 1B A4 0E 00 00 01 00 E4 6B 0F 16 
    //19 1B 11 0C 00 00 16 0B 00 00 1B A4 0E 00 00 01 00 E4 6B 0F 16 04 0B 47 
  }


  protected native function cl2sv_CancelOffer_CallStub();


  event cl2sv_CancelOffer() {
    sv_GetTradeManager().sv_CancelOffer(Outer);                                 //0000 : 19 1B 11 0C 00 00 16 0B 00 00 1B A1 0E 00 00 01 00 E4 6B 0F 16 
    //19 1B 11 0C 00 00 16 0B 00 00 1B A1 0E 00 00 01 00 E4 6B 0F 16 04 0B 47 
  }


  function cl_CancelTrade() {
    if (mTradeState == 5) {                                                     //0000 : 07 21 00 9A 39 3A 01 78 AE 22 11 39 3A 24 05 16 
      mTradeState = 4;                                                          //0010 : 0F 01 78 AE 22 11 24 04 
      cl2sv_CancelOffer_CallStub();                                             //0018 : 1B EA 0E 00 00 16 
    } else {                                                                    //001E : 06 34 00 
      cl_ReInit();                                                              //0021 : 1B 32 0C 00 00 16 
      cl_ShowTradeWindow(False);                                                //0027 : 1B 64 0C 00 00 28 16 
      cl2sv_CancelTrade_CallStub();                                             //002E : 1B EF 0D 00 00 16 
    }
    //07 21 00 9A 39 3A 01 78 AE 22 11 39 3A 24 05 16 0F 01 78 AE 22 11 24 04 1B EA 0E 00 00 16 06 34 
    //00 1B 32 0C 00 00 16 1B 64 0C 00 00 28 16 1B EF 0D 00 00 16 04 0B 47 
  }


  protected native function sv2cl_ResetPartnerOffer_CallStub();


  event sv2cl_ResetPartnerOffer() {
    OnResetPartnerOffer();                                                      //0000 : 43 18 B5 22 11 E8 05 00 00 16 
    //43 18 B5 22 11 E8 05 00 00 16 04 0B 47 
  }


  protected native function cl2sv_ResetOffer_CallStub();


  private event cl2sv_ResetOffer() {
    sv_GetTradeManager().sv_ResetOffer(Outer);                                  //0000 : 19 1B 11 0C 00 00 16 0B 00 00 1B 06 0D 00 00 01 00 E4 6B 0F 16 
    //19 1B 11 0C 00 00 16 0B 00 00 1B 06 0D 00 00 01 00 E4 6B 0F 16 04 0B 47 
  }


  function cl_ResetOffer() {
    mMoney = 0;                                                                 //0000 : 0F 01 30 B8 22 11 25 
    cl2sv_ResetOffer_CallStub();                                                //0007 : 1B 57 0F 00 00 16 
    //0F 01 30 B8 22 11 25 1B 57 0F 00 00 16 04 0B 47 
  }


  protected native function sv2cl_SetPartnerMoney_CallStub();


  event sv2cl_SetPartnerMoney(int aMoney) {
    OnSetPartnerMoney(aMoney);                                                  //0000 : 43 C0 BA 22 11 F2 05 00 00 00 08 BA 22 11 16 
    //43 C0 BA 22 11 F2 05 00 00 00 08 BA 22 11 16 04 0B 47 
  }


  protected native function cl2sv_SetTradeMoney_CallStub();


  private event cl2sv_SetTradeMoney(int aMoney) {
    sv_GetTradeManager().sv_SetTradeMoney(Outer,aMoney);                        //0000 : 19 1B 11 0C 00 00 16 10 00 00 1B 05 0D 00 00 01 00 E4 6B 0F 00 98 BC 22 11 16 
    //19 1B 11 0C 00 00 16 10 00 00 1B 05 0D 00 00 01 00 E4 6B 0F 00 98 BC 22 11 16 04 0B 47 
  }


  function cl_SetTradeMoney(int aMoney) {
    if (aMoney > 0) {                                                           //0000 : 07 19 00 97 00 10 BE 22 11 25 16 
      mMoney = aMoney;                                                          //000B : 0F 01 30 B8 22 11 00 10 BE 22 11 
    } else {                                                                    //0016 : 06 20 00 
      mMoney = 0;                                                               //0019 : 0F 01 30 B8 22 11 25 
    }
    cl2sv_SetTradeMoney_CallStub(mMoney);                                       //0020 : 1B 54 0F 00 00 01 30 B8 22 11 16 
    //07 19 00 97 00 10 BE 22 11 25 16 0F 01 30 B8 22 11 00 10 BE 22 11 06 20 00 0F 01 30 B8 22 11 25 
    //1B 54 0F 00 00 01 30 B8 22 11 16 04 0B 47 
  }


  protected native function sv2cl_RemovePartnerItem_CallStub();


  event sv2cl_RemovePartnerItem(int aLocationSlot) {
    OnRemovePartnerItem(aLocationSlot);                                         //0000 : 43 08 C1 22 11 E5 05 00 00 00 50 C0 22 11 16 
    //43 08 C1 22 11 E5 05 00 00 00 50 C0 22 11 16 04 0B 47 
  }


  protected native function cl2sv_RemoveItem_CallStub();


  private event cl2sv_RemoveItem(int aLocationSlot) {
    sv_GetTradeManager().sv_RemoveItem(Outer,aLocationSlot);                    //0000 : 19 1B 11 0C 00 00 16 10 00 00 1B 04 0D 00 00 01 00 E4 6B 0F 00 E0 C2 22 11 16 
    //19 1B 11 0C 00 00 16 10 00 00 1B 04 0D 00 00 01 00 E4 6B 0F 00 E0 C2 22 11 16 04 0B 47 
  }


  function cl_RemoveItem(int aLocationSlot) {
    if (aLocationSlot >= 0 && aLocationSlot < 16) {                             //0000 : 07 24 00 82 99 00 58 C4 22 11 25 16 18 0A 00 96 00 58 C4 22 11 2C 10 16 16 
      cl2sv_RemoveItem_CallStub(aLocationSlot);                                 //0019 : 1B 35 0F 00 00 00 58 C4 22 11 16 
    }
    //07 24 00 82 99 00 58 C4 22 11 25 16 18 0A 00 96 00 58 C4 22 11 2C 10 16 16 1B 35 0F 00 00 00 58 
    //C4 22 11 16 04 0B 47 
  }


  protected native function sv2cl_SetPartnerItem_CallStub();


  event sv2cl_SetPartnerItem(ReplicatedItem aItem,int aLocationSlot) {
    local export editinline Item_Type ItemType;
    local Game_Item Item;
    local int i;
    ItemType = Item_Type(Class'SBDBSync'.GetResourceObject(aItem.ItemTypeID));  //0000 : 0F 00 18 C8 22 11 2E 70 EB 5B 01 12 20 30 82 24 01 10 00 04 1B E5 0B 00 00 36 18 C9 22 11 00 90 C6 22 11 16 
    Item = new Class'Game_Item';                                                //0024 : 0F 00 90 C9 22 11 11 0B 0B 0B 20 30 E6 5B 01 
    Item.Type = ItemType;                                                       //0033 : 0F 19 00 90 C9 22 11 05 00 04 01 98 2F 22 11 00 18 C8 22 11 
    Item.Color1 = aItem.Color1;                                                 //0047 : 0F 19 00 90 C9 22 11 05 00 01 01 08 CA 22 11 36 80 CA 22 11 00 90 C6 22 11 
    Item.Color2 = aItem.Color2;                                                 //0060 : 0F 19 00 90 C9 22 11 05 00 01 01 F8 CA 22 11 36 70 CB 22 11 00 90 C6 22 11 
    Item.StackSize = aItem.StackSize;                                           //0079 : 0F 19 00 90 C9 22 11 05 00 04 01 E8 CB 22 11 36 60 CC 22 11 00 90 C6 22 11 
    OnSetPartnerItem(Item,aLocationSlot);                                       //0092 : 43 D8 CC 22 11 F1 05 00 00 00 90 C9 22 11 00 50 CD 22 11 16 
    //0F 00 18 C8 22 11 2E 70 EB 5B 01 12 20 30 82 24 01 10 00 04 1B E5 0B 00 00 36 18 C9 22 11 00 90 
    //C6 22 11 16 0F 00 90 C9 22 11 11 0B 0B 0B 20 30 E6 5B 01 0F 19 00 90 C9 22 11 05 00 04 01 98 2F 
    //22 11 00 18 C8 22 11 0F 19 00 90 C9 22 11 05 00 01 01 08 CA 22 11 36 80 CA 22 11 00 90 C6 22 11 
    //0F 19 00 90 C9 22 11 05 00 01 01 F8 CA 22 11 36 70 CB 22 11 00 90 C6 22 11 0F 19 00 90 C9 22 11 
    //05 00 04 01 E8 CB 22 11 36 60 CC 22 11 00 90 C6 22 11 43 D8 CC 22 11 F1 05 00 00 00 90 C9 22 11 
    //00 50 CD 22 11 16 04 0B 47 
  }


  protected native function cl2sv_SetTradeItem_CallStub();


  private event cl2sv_SetTradeItem(int aDBID,int aAmount,int aLocationSlot) {
    sv_GetTradeManager().sv_SetTradeItem(Outer,aDBID,aAmount,aLocationSlot);    //0000 : 19 1B 11 0C 00 00 16 1A 00 00 1B 03 0D 00 00 01 00 E4 6B 0F 00 68 D0 22 11 00 40 D1 22 11 00 B8 D1 22 11 16 
    //19 1B 11 0C 00 00 16 1A 00 00 1B 03 0D 00 00 01 00 E4 6B 0F 00 68 D0 22 11 00 40 D1 22 11 00 B8 
    //D1 22 11 16 04 0B 47 
  }


  function cl_SetTradeItem(Game_Item aItem,int aAmount,int aLocationSlot) {
    if (aItem != None) {                                                        //0000 : 07 29 00 77 00 E0 D2 22 11 2A 16 
      cl2sv_SetTradeItem_CallStub(aItem.DBID,aAmount,aLocationSlot);            //000B : 1B 80 0E 00 00 19 00 E0 D2 22 11 05 00 04 01 18 1F 22 11 00 C0 D3 22 11 00 38 D4 22 11 16 
    }
    //07 29 00 77 00 E0 D2 22 11 2A 16 1B 80 0E 00 00 19 00 E0 D2 22 11 05 00 04 01 18 1F 22 11 00 C0 
    //D3 22 11 00 38 D4 22 11 16 04 0B 47 
  }


  protected native function sv2cl_RequestAccepted_CallStub();


  event sv2cl_RequestAccepted() {
    mTradeState = 4;                                                            //0000 : 0F 01 78 AE 22 11 24 04 
    cl_ShowTradeRequestWindow(False);                                           //0008 : 1B 21 0C 00 00 28 16 
    cl_ShowTradeWindow(True);                                                   //000F : 1B 64 0C 00 00 27 16 
    //0F 01 78 AE 22 11 24 04 1B 21 0C 00 00 28 16 1B 64 0C 00 00 27 16 04 0B 47 
  }


  protected native function cl2sv_AcceptRequest_CallStub();


  private event cl2sv_AcceptRequest() {
    sv_GetTradeManager().sv_AcceptRequest(Outer);                               //0000 : 19 1B 11 0C 00 00 16 0B 00 00 1B A5 0E 00 00 01 00 E4 6B 0F 16 
    //19 1B 11 0C 00 00 16 0B 00 00 1B A5 0E 00 00 01 00 E4 6B 0F 16 04 0B 47 
  }


  function cl_AcceptTradeRequest() {
    mTradeState = 3;                                                            //0000 : 0F 01 78 AE 22 11 24 03 
    cl_ShowTradeRequestWindow(False);                                           //0008 : 1B 21 0C 00 00 28 16 
    cl_SendTradeStatusMessage(8);                                               //000F : 1B 3D 0D 00 00 24 08 16 
    cl2sv_AcceptRequest_CallStub();                                             //0017 : 1B 68 0F 00 00 16 
    //0F 01 78 AE 22 11 24 03 1B 21 0C 00 00 28 16 1B 3D 0D 00 00 24 08 16 1B 68 0F 00 00 16 04 0B 47 
    //
  }


  protected native function cl2sv_RejectRequest_CallStub();


  private event cl2sv_RejectRequest(byte aMessage) {
    sv_GetTradeManager().sv_RejectRequest(Outer,aMessage);                      //0000 : 19 1B 11 0C 00 00 16 10 00 00 1B A6 0E 00 00 01 00 E4 6B 0F 00 78 DA 22 11 16 
    //19 1B 11 0C 00 00 16 10 00 00 1B A6 0E 00 00 01 00 E4 6B 0F 00 78 DA 22 11 16 04 0B 47 
  }


  function cl_RejectTradeRequest(byte aMessage) {
    cl_ReInit();                                                                //0000 : 1B 32 0C 00 00 16 
    cl_ShowTradeRequestWindow(False);                                           //0006 : 1B 21 0C 00 00 28 16 
    cl2sv_RejectRequest_CallStub(aMessage);                                     //000D : 1B 15 0F 00 00 00 40 DC 22 11 16 
    //1B 32 0C 00 00 16 1B 21 0C 00 00 28 16 1B 15 0F 00 00 00 40 DC 22 11 16 04 0B 47 
  }


  protected native function cl2sv_CancelRequest_CallStub();


  private event cl2sv_CancelRequest() {
    sv_GetTradeManager().sv_CancelRequest(Outer);                               //0000 : 19 1B 11 0C 00 00 16 0B 00 00 1B AC 0E 00 00 01 00 E4 6B 0F 16 
    //19 1B 11 0C 00 00 16 0B 00 00 1B AC 0E 00 00 01 00 E4 6B 0F 16 04 0B 47 
  }


  function cl_CancelTradeRequest() {
    cl_ReInit();                                                                //0000 : 1B 32 0C 00 00 16 
    cl_ShowTradeRequestWindow(False);                                           //0006 : 1B 21 0C 00 00 28 16 
    cl2sv_CancelRequest_CallStub();                                             //000D : 1B 10 0F 00 00 16 
    //1B 32 0C 00 00 16 1B 21 0C 00 00 28 16 1B 10 0F 00 00 16 04 0B 47 
  }


  protected native function sv2cl_RequestTrade_CallStub();


  event sv2cl_RequestTrade(Game_Pawn aInitiator) {
    if (Game_PlayerController(Outer.Controller).GroupingFriends.IsIgnoring(aInitiator)) {//0000 : 07 38 00 19 19 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 50 A2 1B 11 0B 00 04 1B 52 0F 00 00 00 10 E1 22 11 16 
      cl_RejectTradeRequest(2);                                                 //002E : 1B 12 0F 00 00 24 02 16 
      return;                                                                   //0036 : 04 0B 
    }
    mPartnerName = aInitiator.GetCharacterName();                               //0038 : 0F 01 38 E2 22 11 19 00 10 E1 22 11 06 00 00 1B 67 05 00 00 16 
    mTradeState = 2;                                                            //004D : 0F 01 78 AE 22 11 24 02 
    cl_ShowTradeRequestWindow(True);                                            //0055 : 1B 21 0C 00 00 27 16 
    //07 38 00 19 19 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 50 A2 1B 11 
    //0B 00 04 1B 52 0F 00 00 00 10 E1 22 11 16 1B 12 0F 00 00 24 02 16 04 0B 0F 01 38 E2 22 11 19 00 
    //10 E1 22 11 06 00 00 1B 67 05 00 00 16 0F 01 78 AE 22 11 24 02 1B 21 0C 00 00 27 16 04 0B 47 
  }


  protected native function cl2sv_RequestTrade_CallStub();


  event cl2sv_RequestTrade(Game_Pawn aPartner) {
    sv_GetTradeManager().sv_RequestTrade(Outer,aPartner);                       //0000 : 19 1B 11 0C 00 00 16 10 00 00 1B AD 0E 00 00 01 00 E4 6B 0F 00 10 E4 22 11 16 
    //19 1B 11 0C 00 00 16 10 00 00 1B AD 0E 00 00 01 00 E4 6B 0F 00 10 E4 22 11 16 04 0B 47 
  }


  function cl_RequestTrade(Game_Pawn aPartner) {
    if (aPartner != None) {                                                     //0000 : 07 3A 00 77 00 88 E5 22 11 2A 16 
      mPartnerName = aPartner.GetCharacterName();                               //000B : 0F 01 38 E2 22 11 19 00 88 E5 22 11 06 00 00 1B 67 05 00 00 16 
      mTradeState = 1;                                                          //0020 : 0F 01 78 AE 22 11 24 01 
      cl_ShowTradeRequestWindow(True);                                          //0028 : 1B 21 0C 00 00 27 16 
      cl2sv_RequestTrade_CallStub(aPartner);                                    //002F : 1B FF 0E 00 00 00 88 E5 22 11 16 
    }
    //07 3A 00 77 00 88 E5 22 11 2A 16 0F 01 38 E2 22 11 19 00 88 E5 22 11 06 00 00 1B 67 05 00 00 16 
    //0F 01 78 AE 22 11 24 01 1B 21 0C 00 00 27 16 1B FF 0E 00 00 00 88 E5 22 11 16 04 0B 47 
  }


  private function cl_ReInit() {
    mPartnerName = "";                                                          //0000 : 0F 01 38 E2 22 11 1F 00 
    mTradeState = 0;                                                            //0008 : 0F 01 78 AE 22 11 24 00 
    mMoney = 0;                                                                 //0010 : 0F 01 30 B8 22 11 25 
    //0F 01 38 E2 22 11 1F 00 0F 01 78 AE 22 11 24 00 0F 01 30 B8 22 11 25 04 0B 47 
  }


  protected native function sv2cl_TradingMessage_CallStub();


  event sv2cl_TradingMessage(byte aMessage) {
    cl_SendTradeStatusMessage(aMessage);                                        //0000 : 1B 3D 0D 00 00 00 E0 E8 22 11 16 
    switch (aMessage) {                                                         //000B : 05 01 00 E0 E8 22 11 
      case 4 :                                                                  //0012 : 0A 17 00 24 04 
      case 5 :                                                                  //0017 : 0A 33 00 24 05 
        cl_ReInit();                                                            //001C : 1B 32 0C 00 00 16 
        cl_ShowTradeRequestWindow(False);                                       //0022 : 1B 21 0C 00 00 28 16 
        cl_ShowTradeWindow(False);                                              //0029 : 1B 64 0C 00 00 28 16 
        break;                                                                  //0030 : 06 0F 01 
      case 0 :                                                                  //0033 : 0A 38 00 24 00 
      case 1 :                                                                  //0038 : 0A 3D 00 24 01 
      case 2 :                                                                  //003D : 0A 42 00 24 02 
      case 3 :                                                                  //0042 : 0A 47 00 24 03 
      case 6 :                                                                  //0047 : 0A 4C 00 24 06 
      case 7 :                                                                  //004C : 0A 61 00 24 07 
        cl_ReInit();                                                            //0051 : 1B 32 0C 00 00 16 
        cl_ShowTradeRequestWindow(False);                                       //0057 : 1B 21 0C 00 00 28 16 
        break;                                                                  //005E : 06 0F 01 
      case 8 :                                                                  //0061 : 0A 70 00 24 08 
        cl_ShowTradeRequestWindow(False);                                       //0066 : 1B 21 0C 00 00 28 16 
        break;                                                                  //006D : 06 0F 01 
      case 9 :                                                                  //0070 : 0A 85 00 24 09 
        cl_ReInit();                                                            //0075 : 1B 32 0C 00 00 16 
        cl_ShowTradeWindow(False);                                              //007B : 1B 64 0C 00 00 28 16 
        break;                                                                  //0082 : 06 0F 01 
      case 12 :                                                                 //0085 : 0A 9F 00 24 0C 
        mTradeState = 4;                                                        //008A : 0F 01 78 AE 22 11 24 04 
        OnAcceptCancelled();                                                    //0092 : 43 F8 EA 22 11 AE 05 00 00 16 
        break;                                                                  //009C : 06 0F 01 
      case 13 :                                                                 //009F : 0A BC 00 24 0D 
        OnSetPartnerOffered(True);                                              //00A4 : 43 70 EB 22 11 F3 05 00 00 27 16 
        OnAcceptCancelled();                                                    //00AF : 43 F8 EA 22 11 AE 05 00 00 16 
        break;                                                                  //00B9 : 06 0F 01 
      case 10 :                                                                 //00BC : 0A CF 00 24 0A 
        OnSetPartnerOffered(True);                                              //00C1 : 43 70 EB 22 11 F3 05 00 00 27 16 
        break;                                                                  //00CC : 06 0F 01 
      case 11 :                                                                 //00CF : 0A E2 00 24 0B 
        OnSetPartnerOffered(False);                                             //00D4 : 43 70 EB 22 11 F3 05 00 00 28 16 
        break;                                                                  //00DF : 06 0F 01 
      case 14 :                                                                 //00E2 : 0A F9 00 24 0E 
        mTradeState = 6;                                                        //00E7 : 0F 01 78 AE 22 11 24 06 
        cl_ShowTradeWindow(False);                                              //00EF : 1B 64 0C 00 00 28 16 
        break;                                                                  //00F6 : 06 0F 01 
      case 15 :                                                                 //00F9 : 0A FE 00 24 0F 
      case 16 :                                                                 //00FE : 0A 0C 01 24 10 
        cl_ReInit();                                                            //0103 : 1B 32 0C 00 00 16 
        break;                                                                  //0109 : 06 0F 01 
      default:                                                                  //010C : 0A FF FF 
    }
    //1B 3D 0D 00 00 00 E0 E8 22 11 16 05 01 00 E0 E8 22 11 0A 17 00 24 04 0A 33 00 24 05 1B 32 0C 00 
    //00 16 1B 21 0C 00 00 28 16 1B 64 0C 00 00 28 16 06 0F 01 0A 38 00 24 00 0A 3D 00 24 01 0A 42 00 
    //24 02 0A 47 00 24 03 0A 4C 00 24 06 0A 61 00 24 07 1B 32 0C 00 00 16 1B 21 0C 00 00 28 16 06 0F 
    //01 0A 70 00 24 08 1B 21 0C 00 00 28 16 06 0F 01 0A 85 00 24 09 1B 32 0C 00 00 16 1B 64 0C 00 00 
    //28 16 06 0F 01 0A 9F 00 24 0C 0F 01 78 AE 22 11 24 04 43 F8 EA 22 11 AE 05 00 00 16 06 0F 01 0A 
    //BC 00 24 0D 43 70 EB 22 11 F3 05 00 00 27 16 43 F8 EA 22 11 AE 05 00 00 16 06 0F 01 0A CF 00 24 
    //0A 43 70 EB 22 11 F3 05 00 00 27 16 06 0F 01 0A E2 00 24 0B 43 70 EB 22 11 F3 05 00 00 28 16 06 
    //0F 01 0A F9 00 24 0E 0F 01 78 AE 22 11 24 06 1B 64 0C 00 00 28 16 06 0F 01 0A FE 00 24 0F 0A 0C 
    //01 24 10 1B 32 0C 00 00 16 06 0F 01 0A FF FF 04 0B 47 
  }


  private function cl_SendTradeStatusMessage(byte aMessage) {
    local Game_Desktop desktop;
    local string partner;
    local string Message;
    desktop = Game_Desktop(Game_PlayerController(Outer.Controller).Player.GUIDesktop);//0000 : 0F 00 70 F2 22 11 2E 60 CE 5A 01 19 19 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 
    partner = cl_GetPartnerName();                                              //0030 : 0F 00 E8 F2 22 11 1B E7 0E 00 00 16 
    switch (aMessage) {                                                         //003C : 05 01 00 98 EC 22 11 
      case 4 :                                                                  //0043 : 0A 97 00 24 04 
        Message = Class'StringReferences'.default.PARTNERNAME_has_left_the_area.Text;//0048 : 0F 00 60 F3 22 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 80 5A 1C 11 
        static.ReplaceText(Message,"[PARTNERNAME]",partner);                    //0061 : 1C 30 80 69 0F 00 60 F3 22 11 1F 5B 50 41 52 54 4E 45 52 4E 41 4D 45 5D 00 00 E8 F2 22 11 16 
        desktop.AddScreenMessage(Message);                                      //0080 : 19 00 70 F2 22 11 0B 00 00 1B EF 0B 00 00 00 60 F3 22 11 16 
        break;                                                                  //0094 : 06 C7 03 
      case 5 :                                                                  //0097 : 0A EB 00 24 05 
        Message = Class'StringReferences'.default.PARTNERNAME_has_died.Text;    //009C : 0F 00 60 F3 22 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F8 5A 1C 11 
        static.ReplaceText(Message,"[PARTNERNAME]",partner);                    //00B5 : 1C 30 80 69 0F 00 60 F3 22 11 1F 5B 50 41 52 54 4E 45 52 4E 41 4D 45 5D 00 00 E8 F2 22 11 16 
        desktop.AddScreenMessage(Message);                                      //00D4 : 19 00 70 F2 22 11 0B 00 00 1B EF 0B 00 00 00 60 F3 22 11 16 
        break;                                                                  //00E8 : 06 C7 03 
      case 0 :                                                                  //00EB : 0A 15 01 24 00 
        desktop.AddScreenMessage(Class'StringReferences'.default.The_server_is_still_busy_with_your_previous_trade.Text);//00F0 : 19 00 70 F2 22 11 19 00 00 1B EF 0B 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 70 5B 1C 11 16 
        break;                                                                  //0112 : 06 C7 03 
      case 1 :                                                                  //0115 : 0A 69 01 24 01 
        Message = Class'StringReferences'.default.PARTNERNAME_is_busy.Text;     //011A : 0F 00 60 F3 22 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 E8 5B 1C 11 
        static.ReplaceText(Message,"[PARTNERNAME]",partner);                    //0133 : 1C 30 80 69 0F 00 60 F3 22 11 1F 5B 50 41 52 54 4E 45 52 4E 41 4D 45 5D 00 00 E8 F2 22 11 16 
        desktop.AddScreenMessage(Message);                                      //0152 : 19 00 70 F2 22 11 0B 00 00 1B EF 0B 00 00 00 60 F3 22 11 16 
        break;                                                                  //0166 : 06 C7 03 
      case 2 :                                                                  //0169 : 0A BC 01 24 02 
        Message = Class'StringReferences'.default.PLAYERNAME_ignored_you_.Text; //016E : 0F 00 60 F3 22 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B0 66 1C 11 
        static.ReplaceText(Message,"[PLAYERNAME]",partner);                     //0187 : 1C 30 80 69 0F 00 60 F3 22 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 E8 F2 22 11 16 
        desktop.AddScreenMessage(Message);                                      //01A5 : 19 00 70 F2 22 11 0B 00 00 1B EF 0B 00 00 00 60 F3 22 11 16 
        break;                                                                  //01B9 : 06 C7 03 
      case 3 :                                                                  //01BC : 0A E6 01 24 03 
        desktop.AddScreenMessage(Class'StringReferences'.default.Internal_trade_error.Text);//01C1 : 19 00 70 F2 22 11 19 00 00 1B EF 0B 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 60 5C 1C 11 16 
        break;                                                                  //01E3 : 06 C7 03 
      case 6 :                                                                  //01E6 : 0A 3A 02 24 06 
        Message = Class'StringReferences'.default.PARTNERNAME_has_cancelled_the_trade_invitation.Text;//01EB : 0F 00 60 F3 22 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 D8 5C 1C 11 
        static.ReplaceText(Message,"[PARTNERNAME]",partner);                    //0204 : 1C 30 80 69 0F 00 60 F3 22 11 1F 5B 50 41 52 54 4E 45 52 4E 41 4D 45 5D 00 00 E8 F2 22 11 16 
        desktop.AddScreenMessage(Message);                                      //0223 : 19 00 70 F2 22 11 0B 00 00 1B EF 0B 00 00 00 60 F3 22 11 16 
        break;                                                                  //0237 : 06 C7 03 
      case 7 :                                                                  //023A : 0A 8E 02 24 07 
        Message = Class'StringReferences'.default.PARTNERNAME_has_rejected_your_trade_invitation.Text;//023F : 0F 00 60 F3 22 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 50 5D 1C 11 
        static.ReplaceText(Message,"[PARTNERNAME]",partner);                    //0258 : 1C 30 80 69 0F 00 60 F3 22 11 1F 5B 50 41 52 54 4E 45 52 4E 41 4D 45 5D 00 00 E8 F2 22 11 16 
        desktop.AddScreenMessage(Message);                                      //0277 : 19 00 70 F2 22 11 0B 00 00 1B EF 0B 00 00 00 60 F3 22 11 16 
        break;                                                                  //028B : 06 C7 03 
      case 8 :                                                                  //028E : 0A 96 02 24 08 
        break;                                                                  //0293 : 06 C7 03 
      case 9 :                                                                  //0296 : 0A EA 02 24 09 
        Message = Class'StringReferences'.default.PARTNERNAME_cancelled_the_trade.Text;//029B : 0F 00 60 F3 22 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 40 5E 1C 11 
        static.ReplaceText(Message,"[PARTNERNAME]",partner);                    //02B4 : 1C 30 80 69 0F 00 60 F3 22 11 1F 5B 50 41 52 54 4E 45 52 4E 41 4D 45 5D 00 00 E8 F2 22 11 16 
        desktop.AddScreenMessage(Message);                                      //02D3 : 19 00 70 F2 22 11 0B 00 00 1B EF 0B 00 00 00 60 F3 22 11 16 
        break;                                                                  //02E7 : 06 C7 03 
      case 12 :                                                                 //02EA : 0A 14 03 24 0C 
        desktop.AddScreenMessage(Class'StringReferences'.default.Not_enough_space_in_your_inventory.Text);//02EF : 19 00 70 F2 22 11 19 00 00 1B EF 0B 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 B8 5E 1C 11 16 
        break;                                                                  //0311 : 06 C7 03 
      case 13 :                                                                 //0314 : 0A 68 03 24 0D 
        Message = Class'StringReferences'.default.PARTNERNAME_not_enough_space_in_inventory.Text;//0319 : 0F 00 60 F3 22 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 30 5F 1C 11 
        static.ReplaceText(Message,"[PARTNERNAME]",partner);                    //0332 : 1C 30 80 69 0F 00 60 F3 22 11 1F 5B 50 41 52 54 4E 45 52 4E 41 4D 45 5D 00 00 E8 F2 22 11 16 
        desktop.AddScreenMessage(Message);                                      //0351 : 19 00 70 F2 22 11 0B 00 00 1B EF 0B 00 00 00 60 F3 22 11 16 
        break;                                                                  //0365 : 06 C7 03 
      case 14 :                                                                 //0368 : 0A 70 03 24 0E 
        break;                                                                  //036D : 06 C7 03 
      case 15 :                                                                 //0370 : 0A 9A 03 24 0F 
        desktop.AddScreenMessage(Class'StringReferences'.default.Trade_failed.Text);//0375 : 19 00 70 F2 22 11 19 00 00 1B EF 0B 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 20 60 1C 11 16 
        break;                                                                  //0397 : 06 C7 03 
      case 16 :                                                                 //039A : 0A C4 03 24 10 
        desktop.AddScreenMessage(Class'StringReferences'.default.Trade_completed.Text);//039F : 19 00 70 F2 22 11 19 00 00 1B EF 0B 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 98 60 1C 11 16 
        break;                                                                  //03C1 : 06 C7 03 
      default:                                                                  //03C4 : 0A FF FF 
    }
    //0F 00 70 F2 22 11 2E 60 CE 5A 01 19 19 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 
    //05 00 04 01 28 25 71 0F 05 00 04 01 90 C0 79 0F 0F 00 E8 F2 22 11 1B E7 0E 00 00 16 05 01 00 98 
    //EC 22 11 0A 97 00 24 04 0F 00 60 F3 22 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 80 5A 1C 
    //11 1C 30 80 69 0F 00 60 F3 22 11 1F 5B 50 41 52 54 4E 45 52 4E 41 4D 45 5D 00 00 E8 F2 22 11 16 
    //19 00 70 F2 22 11 0B 00 00 1B EF 0B 00 00 00 60 F3 22 11 16 06 C7 03 0A EB 00 24 05 0F 00 60 F3 
    //22 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 F8 5A 1C 11 1C 30 80 69 0F 00 60 F3 22 11 1F 
    //5B 50 41 52 54 4E 45 52 4E 41 4D 45 5D 00 00 E8 F2 22 11 16 19 00 70 F2 22 11 0B 00 00 1B EF 0B 
    //00 00 00 60 F3 22 11 16 06 C7 03 0A 15 01 24 00 19 00 70 F2 22 11 19 00 00 1B EF 0B 00 00 36 58 
    //C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 70 5B 1C 11 16 06 C7 03 0A 69 01 24 01 0F 00 60 F3 22 11 
    //36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 E8 5B 1C 11 1C 30 80 69 0F 00 60 F3 22 11 1F 5B 50 
    //41 52 54 4E 45 52 4E 41 4D 45 5D 00 00 E8 F2 22 11 16 19 00 70 F2 22 11 0B 00 00 1B EF 0B 00 00 
    //00 60 F3 22 11 16 06 C7 03 0A BC 01 24 02 0F 00 60 F3 22 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 
    //00 0C 02 B0 66 1C 11 1C 30 80 69 0F 00 60 F3 22 11 1F 5B 50 4C 41 59 45 52 4E 41 4D 45 5D 00 00 
    //E8 F2 22 11 16 19 00 70 F2 22 11 0B 00 00 1B EF 0B 00 00 00 60 F3 22 11 16 06 C7 03 0A E6 01 24 
    //03 19 00 70 F2 22 11 19 00 00 1B EF 0B 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 60 5C 
    //1C 11 16 06 C7 03 0A 3A 02 24 06 0F 00 60 F3 22 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 
    //D8 5C 1C 11 1C 30 80 69 0F 00 60 F3 22 11 1F 5B 50 41 52 54 4E 45 52 4E 41 4D 45 5D 00 00 E8 F2 
    //22 11 16 19 00 70 F2 22 11 0B 00 00 1B EF 0B 00 00 00 60 F3 22 11 16 06 C7 03 0A 8E 02 24 07 0F 
    //00 60 F3 22 11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 50 5D 1C 11 1C 30 80 69 0F 00 60 F3 
    //22 11 1F 5B 50 41 52 54 4E 45 52 4E 41 4D 45 5D 00 00 E8 F2 22 11 16 19 00 70 F2 22 11 0B 00 00 
    //1B EF 0B 00 00 00 60 F3 22 11 16 06 C7 03 0A 96 02 24 08 06 C7 03 0A EA 02 24 09 0F 00 60 F3 22 
    //11 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 40 5E 1C 11 1C 30 80 69 0F 00 60 F3 22 11 1F 5B 
    //50 41 52 54 4E 45 52 4E 41 4D 45 5D 00 00 E8 F2 22 11 16 19 00 70 F2 22 11 0B 00 00 1B EF 0B 00 
    //00 00 60 F3 22 11 16 06 C7 03 0A 14 03 24 0C 19 00 70 F2 22 11 19 00 00 1B EF 0B 00 00 36 58 C6 
    //6B 0F 12 20 20 F7 60 01 05 00 0C 02 B8 5E 1C 11 16 06 C7 03 0A 68 03 24 0D 0F 00 60 F3 22 11 36 
    //58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 30 5F 1C 11 1C 30 80 69 0F 00 60 F3 22 11 1F 5B 50 41 
    //52 54 4E 45 52 4E 41 4D 45 5D 00 00 E8 F2 22 11 16 19 00 70 F2 22 11 0B 00 00 1B EF 0B 00 00 00 
    //60 F3 22 11 16 06 C7 03 0A 70 03 24 0E 06 C7 03 0A 9A 03 24 0F 19 00 70 F2 22 11 19 00 00 1B EF 
    //0B 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 20 60 1C 11 16 06 C7 03 0A C4 03 24 10 19 
    //00 70 F2 22 11 19 00 00 1B EF 0B 00 00 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 98 60 1C 11 
    //16 06 C7 03 0A FF FF 04 0B 47 
  }


  private function cl_ShowTradeWindow(bool aShow) {
    if (aShow) {                                                                //0000 : 07 32 00 2D 00 88 F4 22 11 
      Game_PlayerController(Outer.Controller).GUI.ShowTrade();                  //0009 : 19 19 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 40 8A 1B 11 06 00 00 1B 95 0F 00 00 16 
    } else {                                                                    //002F : 06 58 00 
      Game_PlayerController(Outer.Controller).GUI.HideTrade();                  //0032 : 19 19 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 40 8A 1B 11 06 00 00 1B D4 0E 00 00 16 
    }
    //07 32 00 2D 00 88 F4 22 11 19 19 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 
    //04 01 40 8A 1B 11 06 00 00 1B 95 0F 00 00 16 06 58 00 19 19 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 
    //00 04 01 00 6E 6C 0F 05 00 04 01 40 8A 1B 11 06 00 00 1B D4 0E 00 00 16 04 0B 47 
  }


  private function cl_ShowTradeRequestWindow(bool aShow) {
    if (aShow) {                                                                //0000 : 07 32 00 2D 00 58 F6 22 11 
      Game_PlayerController(Outer.Controller).GUI.ShowTradeRequest();           //0009 : 19 19 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 40 8A 1B 11 06 00 00 1B C9 0E 00 00 16 
    } else {                                                                    //002F : 06 58 00 
      Game_PlayerController(Outer.Controller).GUI.HideTradeRequest();           //0032 : 19 19 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 04 01 40 8A 1B 11 06 00 00 1B CA 0E 00 00 16 
    }
    //07 32 00 2D 00 58 F6 22 11 19 19 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 00 04 01 00 6E 6C 0F 05 00 
    //04 01 40 8A 1B 11 06 00 00 1B C9 0E 00 00 16 06 58 00 19 19 2E 90 18 5B 01 19 01 00 E4 6B 0F 05 
    //00 04 01 00 6E 6C 0F 05 00 04 01 40 8A 1B 11 06 00 00 1B CA 0E 00 00 16 04 0B 47 
  }


  function byte cl_GetTradeState() {
    return mTradeState;                                                         //0000 : 04 01 78 AE 22 11 
    //04 01 78 AE 22 11 04 0B 47 
  }


  function string cl_GetPartnerName() {
    return mPartnerName;                                                        //0000 : 04 01 38 E2 22 11 
    //04 01 38 E2 22 11 04 0B 47 
  }


  event bool cl_IsTrading() {
    return mTradeState != 0;                                                    //0000 : 04 9B 39 3A 01 78 AE 22 11 39 3A 24 00 16 
    //04 9B 39 3A 01 78 AE 22 11 39 3A 24 00 16 04 0B 47 
  }


  protected native function cl2sv_HandleDeath_CallStub();


  event cl2sv_HandleDeath() {
    sv_GetTradeManager().sv_HandleDeath(Outer);                                 //0000 : 19 1B 11 0C 00 00 16 0B 00 00 1B AB 0F 00 00 01 00 E4 6B 0F 16 
    //19 1B 11 0C 00 00 16 0B 00 00 1B AB 0F 00 00 01 00 E4 6B 0F 16 04 0B 47 
  }


  private function Game_TradeManager sv_GetTradeManager() {
    local Game_GameInfo GameInfo;
    if (Outer != None && Outer.Level != None) {                                 //0000 : 07 6B 00 82 77 01 00 E4 6B 0F 2A 16 18 12 00 77 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 2A 16 16 
      GameInfo = Game_GameInfo(Outer.GetGameInfo());                            //0021 : 0F 00 90 FF 22 11 2E 10 F9 5A 01 19 01 00 E4 6B 0F 06 00 04 1C 38 E1 6C 0F 16 
      if (GameInfo != None && GameInfo.mTradeManager != None) {                 //003B : 07 6B 00 82 77 00 90 FF 22 11 2A 16 18 12 00 77 19 00 90 FF 22 11 05 00 04 01 08 00 23 11 2A 16 16 
        return GameInfo.mTradeManager;                                          //005C : 04 19 00 90 FF 22 11 05 00 04 01 08 00 23 11 
      }
    }
    return None;                                                                //006B : 04 2A 
    //07 6B 00 82 77 01 00 E4 6B 0F 2A 16 18 12 00 77 19 01 00 E4 6B 0F 05 00 04 01 D8 7E 6C 0F 2A 16 
    //16 0F 00 90 FF 22 11 2E 10 F9 5A 01 19 01 00 E4 6B 0F 06 00 04 1C 38 E1 6C 0F 16 07 6B 00 82 77 
    //00 90 FF 22 11 2A 16 18 12 00 77 19 00 90 FF 22 11 05 00 04 01 08 00 23 11 2A 16 16 04 19 00 90 
    //FF 22 11 05 00 04 01 08 00 23 11 04 2A 04 0B 47 
  }


  delegate OnAcceptCancelled();


  delegate OnSetPartnerOffered(bool aOffered);


  delegate OnResetPartnerOffer();


  delegate OnSetPartnerMoney(int aMoney);


  delegate OnRemovePartnerItem(int aLocationSlot);


  delegate OnSetPartnerItem(Game_Item aItem,int aLocationSlot);


  function cl_HandleDeath() {
    if (mTradeState != 0) {                                                     //0000 : 07 2D 00 9B 39 3A 01 78 AE 22 11 39 3A 24 00 16 
      cl_ShowTradeRequestWindow(False);                                         //0010 : 1B 21 0C 00 00 28 16 
      cl_ShowTradeWindow(False);                                                //0017 : 1B 64 0C 00 00 28 16 
      cl_ReInit();                                                              //001E : 1B 32 0C 00 00 16 
      cl2sv_HandleDeath_CallStub();                                             //0024 : 1B DC 0E 00 00 16 
    } else {                                                                    //002A : 06 3E 00 
      if (mShop != None) {                                                      //002D : 07 3E 00 77 01 D0 4D 22 11 2A 16 
        cl_ExitShop();                                                          //0038 : 1B 6F 0E 00 00 16 
      }
    }
    //07 2D 00 9B 39 3A 01 78 AE 22 11 39 3A 24 00 16 1B 21 0C 00 00 28 16 1B 64 0C 00 00 28 16 1B 32 
    //0C 00 00 16 1B DC 0E 00 00 16 06 3E 00 07 3E 00 77 01 D0 4D 22 11 2A 16 1B 6F 0E 00 00 16 04 0B 
    //47 
  }



