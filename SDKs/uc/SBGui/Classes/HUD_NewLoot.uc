//==============================================================================
//  HUD_NewLoot
//==============================================================================

class HUD_NewLoot extends GUI_Window
    exportstructs
    dependsOn(HUD_BaseItemContainer,Game_Item,Game_Pawn,Game_PlayerItemManager,Game_PlayerPawn,Game_QuestLog)
    Transient
    Config(User)
  ;

  const NEW_LOOT_WINDOW_RIGHT_MARGIN =  5;
  const NEW_LOOT_WINDOW_FADEOUT_TIME =  1;
  const NEW_LOOT_WINDOW_FADEIN_TIME =  0.25;
  const NEW_LOOT_BOTTOM_MARGIN =  100;
  const NEW_LOOT_ITEM_FADE_TIME =  1;
  const NEW_LOOT_ITEM_FADE_TIMEOUT =  7;
  const NEW_LOOT_SLOTS =  10;
  struct NewLootItem {
      var HUD_BaseItemContainer container;
      var float TimerAdded;
      var bool Fading;

  };


  var GUI_Page mLootPage;
  var transient float LootTimer;
  var transient array<NewLootItem> NewLootItems;
  var transient int TimeoutCount;


  function OnItemAddedHandler(Game_Item aItem,int aAmount) {
    local HUD_BaseItemContainer lContainer;
    if (aAmount > 0 && aItem != None) {                                         //0000 : 07 F5 00 82 97 00 48 73 33 26 25 16 18 09 00 77 00 E8 74 33 26 2A 16 16 
      lContainer = HUD_BaseItemContainer(mLootPage.CreateButton("HUD_BaseItemContainer",0,0,0,0,40,40));//0018 : 0F 00 80 DE 05 1B 2E 70 85 30 1D 19 01 C0 5F 04 1B 25 00 04 1B 18 98 00 00 1F 48 55 44 5F 42 61 73 65 49 74 65 6D 43 6F 6E 74 61 69 6E 65 72 00 25 25 25 25 2C 28 2C 28 16 
      lContainer.SetItem(aItem);                                                //0051 : 19 00 80 DE 05 1B 0B 00 00 1B 4A 97 00 00 00 E8 74 33 26 16 
      lContainer.SetStackSize(aAmount);                                         //0065 : 19 00 80 DE 05 1B 0B 00 00 1B 4E 97 00 00 00 48 73 33 26 16 
      NewLootItems.Insert(NewLootItems.Length,1);                               //0079 : 40 01 F0 76 89 19 37 01 F0 76 89 19 26 
      NewLootItems[NewLootItems.Length - 1].container = lContainer;             //0086 : 0F 36 20 3C 04 1B 10 93 37 01 F0 76 89 19 26 16 01 F0 76 89 19 00 80 DE 05 1B 
      NewLootItems[NewLootItems.Length - 1].TimerAdded = LootTimer;             //00A0 : 0F 36 10 D4 05 1B 10 93 37 01 F0 76 89 19 26 16 01 F0 76 89 19 01 58 38 04 1B 
      NewLootItems[NewLootItems.Length - 1].Fading = False;                     //00BA : 14 2D 36 D0 2E 07 1B 10 93 37 01 F0 76 89 19 26 16 01 F0 76 89 19 28 
      mDesktop.ShowStdWindow(Class'GUI_BaseDesktop'.39,Class'GUI_BaseDesktop'.1);//00D1 : 19 01 48 0C 9D 19 1B 00 04 1B DF 0B 00 00 12 20 00 68 D7 00 02 00 04 2C 27 12 20 00 68 D7 00 01 00 04 26 16 
    }
    if (NewLootItems.Length > 10) {                                             //00F5 : 07 25 01 97 37 01 F0 76 89 19 2C 0A 16 
      mLootPage.DestroyComponent(NewLootItems[0].container);                    //0102 : 19 01 C0 5F 04 1B 12 00 00 1B 4D 98 00 00 36 20 3C 04 1B 10 25 01 F0 76 89 19 16 
      NewLootItems.Remove(0,1);                                                 //011D : 41 01 F0 76 89 19 25 26 
    }
    FadeIn(0.25000000);                                                         //0125 : 1B 72 34 00 00 1E 00 00 80 3E 16 
    //07 F5 00 82 97 00 48 73 33 26 25 16 18 09 00 77 00 E8 74 33 26 2A 16 16 0F 00 80 DE 05 1B 2E 70 
    //85 30 1D 19 01 C0 5F 04 1B 25 00 04 1B 18 98 00 00 1F 48 55 44 5F 42 61 73 65 49 74 65 6D 43 6F 
    //6E 74 61 69 6E 65 72 00 25 25 25 25 2C 28 2C 28 16 19 00 80 DE 05 1B 0B 00 00 1B 4A 97 00 00 00 
    //E8 74 33 26 16 19 00 80 DE 05 1B 0B 00 00 1B 4E 97 00 00 00 48 73 33 26 16 40 01 F0 76 89 19 37 
    //01 F0 76 89 19 26 0F 36 20 3C 04 1B 10 93 37 01 F0 76 89 19 26 16 01 F0 76 89 19 00 80 DE 05 1B 
    //0F 36 10 D4 05 1B 10 93 37 01 F0 76 89 19 26 16 01 F0 76 89 19 01 58 38 04 1B 14 2D 36 D0 2E 07 
    //1B 10 93 37 01 F0 76 89 19 26 16 01 F0 76 89 19 28 19 01 48 0C 9D 19 1B 00 04 1B DF 0B 00 00 12 
    //20 00 68 D7 00 02 00 04 2C 27 12 20 00 68 D7 00 01 00 04 26 16 07 25 01 97 37 01 F0 76 89 19 2C 
    //0A 16 19 01 C0 5F 04 1B 12 00 00 1B 4D 98 00 00 36 20 3C 04 1B 10 25 01 F0 76 89 19 16 41 01 F0 
    //76 89 19 25 26 1B 72 34 00 00 1E 00 00 80 3E 16 04 0B 47 
  }


  function OnQuestItemsAddedHandler(export editinline Item_Type aItemType,int aAmount) {
    local Game_Item Item;
    Item = new Class'Game_Item';                                                //0000 : 0F 00 38 74 04 1B 11 0B 0B 0B 20 30 E6 5B 01 
    Item.Type = aItemType;                                                      //000F : 0F 19 00 38 74 04 1B 05 00 04 01 98 2F 22 11 00 E0 28 34 26 
    Item.Color1 = 0;                                                            //0023 : 0F 19 00 38 74 04 1B 05 00 01 01 08 CA 22 11 24 00 
    Item.Color2 = 0;                                                            //0034 : 0F 19 00 38 74 04 1B 05 00 01 01 F8 CA 22 11 24 00 
    Item.StackSize = 1;                                                         //0045 : 0F 19 00 38 74 04 1B 05 00 04 01 E8 CB 22 11 26 
    OnItemAddedHandler(Item,aAmount);                                           //0055 : 1B D6 99 00 00 00 38 74 04 1B 00 58 29 34 26 16 
    //0F 00 38 74 04 1B 11 0B 0B 0B 20 30 E6 5B 01 0F 19 00 38 74 04 1B 05 00 04 01 98 2F 22 11 00 E0 
    //28 34 26 0F 19 00 38 74 04 1B 05 00 01 01 08 CA 22 11 24 00 0F 19 00 38 74 04 1B 05 00 01 01 F8 
    //CA 22 11 24 00 0F 19 00 38 74 04 1B 05 00 04 01 E8 CB 22 11 26 1B D6 99 00 00 00 38 74 04 1B 00 
    //58 29 34 26 16 04 0B 47 
  }


  event DoShowWindow(int flags) {
    Super.DoShowWindow(flags);                                                  //0000 : 1C 20 7A 9E 19 00 68 28 34 26 16 
    FadeIn(0.25000000);                                                         //000B : 1B 72 34 00 00 1E 00 00 80 3E 16 
    mDesktop.BringToBottom(self);                                               //0016 : 19 01 48 0C 9D 19 07 00 00 1B AA 98 00 00 17 16 
    //1C 20 7A 9E 19 00 68 28 34 26 16 1B 72 34 00 00 1E 00 00 80 3E 16 19 01 48 0C 9D 19 07 00 00 1B 
    //AA 98 00 00 17 16 04 0B 47 
  }


  function TickHandler(float DeltaTime) {
    local int i;
    local int Count;
    local float FadeOffset;
    LootTimer += DeltaTime;                                                     //0000 : B8 01 58 38 04 1B 00 40 27 34 26 16 
    Count = 0;                                                                  //000C : 0F 00 18 32 07 1B 25 
    i = NewLootItems.Length - 1;                                                //0013 : 0F 00 58 21 2B 26 93 37 01 F0 76 89 19 26 16 
    while (i >= 0) {                                                            //0022 : 07 50 01 99 00 58 21 2B 26 25 16 
      if (LootTimer >= NewLootItems[i].TimerAdded + 7 + 1) {                    //002D : 07 80 00 B3 01 58 38 04 1B AE AE 36 10 D4 05 1B 10 00 58 21 2B 26 01 F0 76 89 19 39 3F 2C 07 16 39 3F 26 16 16 
        mLootPage.DestroyComponent(NewLootItems[i].container);                  //0052 : 19 01 C0 5F 04 1B 16 00 00 1B 4D 98 00 00 36 20 3C 04 1B 10 00 58 21 2B 26 01 F0 76 89 19 16 
        NewLootItems.Remove(i,1);                                               //0071 : 41 01 F0 76 89 19 00 58 21 2B 26 26 
      } else {                                                                  //007D : 06 46 01 
        if (LootTimer >= NewLootItems[i].TimerAdded + 7) {                      //0080 : 07 17 01 B3 01 58 38 04 1B AE 36 10 D4 05 1B 10 00 58 21 2B 26 01 F0 76 89 19 39 3F 2C 07 16 16 
          if (!NewLootItems[i].Fading) {                                        //00A0 : 07 E8 00 81 2D 36 D0 2E 07 1B 10 00 58 21 2B 26 01 F0 76 89 19 16 
            NewLootItems[i].container.FadeOut(1.00000000);                      //00B6 : 19 36 20 3C 04 1B 10 00 58 21 2B 26 01 F0 76 89 19 0B 00 00 1B 7E 34 00 00 1E 00 00 80 3F 16 
            NewLootItems[i].Fading = True;                                      //00D5 : 14 2D 36 D0 2E 07 1B 10 00 58 21 2B 26 01 F0 76 89 19 27 
          }
          FadeOffset += (LootTimer - NewLootItems[i].TimerAdded + 7) / 1 * 40;  //00E8 : B8 00 18 79 33 26 AB AC AF 01 58 38 04 1B AE 36 10 D4 05 1B 10 00 58 21 2B 26 01 F0 76 89 19 39 3F 2C 07 16 16 39 3F 26 16 39 3F 2C 28 16 16 
        }
        NewLootItems[i].container.SetPosition(0.00000000,40.00000000 * Count++);//0117 : 19 36 20 3C 04 1B 10 00 58 21 2B 26 01 F0 76 89 19 1B 00 00 1B 23 98 00 00 1E 00 00 00 00 AB 1E 00 00 20 42 39 3F A5 00 18 32 07 1B 16 16 16 
      }
      i--;                                                                      //0146 : A6 00 58 21 2B 26 16 
    }
    if (NewLootItems.Length > 0) {                                              //0150 : 07 9B 01 97 37 01 F0 76 89 19 25 16 
      Resize(45.00000000 + 5,40.00000000 * Count + 100 - FadeOffset);           //015C : 1B B9 98 00 00 AE 1E 00 00 34 42 39 3F 2C 05 16 AF AE AB 1E 00 00 20 42 39 3F 00 18 32 07 1B 16 39 3F 2C 64 16 00 18 79 33 26 16 16 
      mDesktop.UpdateWindowPositioning(self);                                   //0188 : 19 01 48 0C 9D 19 07 00 00 1C 98 01 89 19 17 16 
    } else {                                                                    //0198 : 06 A6 01 
      FadeOut(1.00000000);                                                      //019B : 1B 7E 34 00 00 1E 00 00 80 3F 16 
    }
    //B8 01 58 38 04 1B 00 40 27 34 26 16 0F 00 18 32 07 1B 25 0F 00 58 21 2B 26 93 37 01 F0 76 89 19 
    //26 16 07 50 01 99 00 58 21 2B 26 25 16 07 80 00 B3 01 58 38 04 1B AE AE 36 10 D4 05 1B 10 00 58 
    //21 2B 26 01 F0 76 89 19 39 3F 2C 07 16 39 3F 26 16 16 19 01 C0 5F 04 1B 16 00 00 1B 4D 98 00 00 
    //36 20 3C 04 1B 10 00 58 21 2B 26 01 F0 76 89 19 16 41 01 F0 76 89 19 00 58 21 2B 26 26 06 46 01 
    //07 17 01 B3 01 58 38 04 1B AE 36 10 D4 05 1B 10 00 58 21 2B 26 01 F0 76 89 19 39 3F 2C 07 16 16 
    //07 E8 00 81 2D 36 D0 2E 07 1B 10 00 58 21 2B 26 01 F0 76 89 19 16 19 36 20 3C 04 1B 10 00 58 21 
    //2B 26 01 F0 76 89 19 0B 00 00 1B 7E 34 00 00 1E 00 00 80 3F 16 14 2D 36 D0 2E 07 1B 10 00 58 21 
    //2B 26 01 F0 76 89 19 27 B8 00 18 79 33 26 AB AC AF 01 58 38 04 1B AE 36 10 D4 05 1B 10 00 58 21 
    //2B 26 01 F0 76 89 19 39 3F 2C 07 16 16 39 3F 26 16 39 3F 2C 28 16 16 19 36 20 3C 04 1B 10 00 58 
    //21 2B 26 01 F0 76 89 19 1B 00 00 1B 23 98 00 00 1E 00 00 00 00 AB 1E 00 00 20 42 39 3F A5 00 18 
    //32 07 1B 16 16 16 A6 00 58 21 2B 26 16 06 22 00 07 9B 01 97 37 01 F0 76 89 19 25 16 1B B9 98 00 
    //00 AE 1E 00 00 34 42 39 3F 2C 05 16 AF AE AB 1E 00 00 20 42 39 3F 00 18 32 07 1B 16 39 3F 2C 64 
    //16 00 18 79 33 26 16 16 19 01 48 0C 9D 19 07 00 00 1C 98 01 89 19 17 16 06 A6 01 1B 7E 34 00 00 
    //1E 00 00 80 3F 16 04 0B 47 
  }


  event OnComponentDestroyed() {
    if (GetPawn() != None) {                                                    //0000 : 07 52 00 77 1B 2B 0C 00 00 16 2A 16 
      Game_PlayerItemManager(GetPawn().itemManager).__OnItemAdded__Delegate = None;//000C : 45 19 2E F0 92 5F 01 19 1B 2B 0C 00 00 16 05 00 04 01 B0 2D 19 11 05 00 08 01 38 54 26 11 44 00 00 00 00 
      Game_PlayerPawn(GetPawn()).questLog.__OnQuestItemsAdded__Delegate = None; //002F : 45 19 19 2E F0 47 5B 01 1B 2B 0C 00 00 16 05 00 04 01 F0 2F 7F 0F 05 00 08 01 10 5A 30 11 44 00 00 00 00 
    }
    Super.OnComponentDestroyed();                                               //0052 : 1C E0 DA 9D 19 16 
    //07 52 00 77 1B 2B 0C 00 00 16 2A 16 45 19 2E F0 92 5F 01 19 1B 2B 0C 00 00 16 05 00 04 01 B0 2D 
    //19 11 05 00 08 01 38 54 26 11 44 00 00 00 00 45 19 19 2E F0 47 5B 01 1B 2B 0C 00 00 16 05 00 04 
    //01 F0 2F 7F 0F 05 00 08 01 10 5A 30 11 44 00 00 00 00 1C E0 DA 9D 19 16 04 0B 47 
  }


  function SetDelegates() {
    if (GetPawn() != None) {                                                    //0000 : 07 52 00 77 1B 2B 0C 00 00 16 2A 16 
      Game_PlayerItemManager(GetPawn().itemManager).__OnItemAdded__Delegate = OnItemAddedHandler;//000C : 45 19 2E F0 92 5F 01 19 1B 2B 0C 00 00 16 05 00 04 01 B0 2D 19 11 05 00 08 01 38 54 26 11 44 D6 99 00 00 
      Game_PlayerPawn(GetPawn()).questLog.__OnQuestItemsAdded__Delegate = OnQuestItemsAddedHandler;//002F : 45 19 19 2E F0 47 5B 01 1B 2B 0C 00 00 16 05 00 04 01 F0 2F 7F 0F 05 00 08 01 10 5A 30 11 44 B3 9A 00 00 
    }
    //07 52 00 77 1B 2B 0C 00 00 16 2A 16 45 19 2E F0 92 5F 01 19 1B 2B 0C 00 00 16 05 00 04 01 B0 2D 
    //19 11 05 00 08 01 38 54 26 11 44 D6 99 00 00 45 19 19 2E F0 47 5B 01 1B 2B 0C 00 00 16 05 00 04 
    //01 F0 2F 7F 0F 05 00 08 01 10 5A 30 11 44 B3 9A 00 00 04 0B 47 
  }


  event Initialize() {
    mWidth = 45.00000000 + 5;                                                   //0000 : 0F 01 60 87 31 16 AE 1E 00 00 34 42 39 3F 2C 05 16 
    mHeight = 45.00000000 + 100;                                                //0011 : 0F 01 40 88 31 16 AE 1E 00 00 34 42 39 3F 2C 64 16 
    mComponentStyle = mComponentStyle | 524288;                                 //0022 : 0F 01 80 DC 9D 19 9E 01 80 DC 9D 19 1D 00 00 08 00 16 
    Super.Initialize();                                                         //0034 : 1C 28 9E 9E 19 16 
    mLootPage = CreatePage("GUI_Page",0,0,0,0,45,45 * 10 + 100);                //003A : 0F 01 C0 5F 04 1B 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 25 2C 2D 92 90 2C 2D 2C 0A 16 2C 64 16 16 
    mLootPage.SetAnchors(1.00000000,0.00000000,0.00000000,0.00000000);          //0060 : 19 01 C0 5F 04 1B 1A 00 00 1B 24 98 00 00 1E 00 00 80 3F 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 00 00 16 
    mLootPage.SetStdBackground(7);                                              //0083 : 19 01 C0 5F 04 1B 08 00 00 1B 22 98 00 00 2C 07 16 
    __OnTick__Delegate = TickHandler;                                           //0094 : 45 01 70 E6 9D 19 44 4B 98 00 00 
    mDesktop.BringToBottom(self);                                               //009F : 19 01 48 0C 9D 19 07 00 00 1B AA 98 00 00 17 16 
    //0F 01 60 87 31 16 AE 1E 00 00 34 42 39 3F 2C 05 16 0F 01 40 88 31 16 AE 1E 00 00 34 42 39 3F 2C 
    //64 16 0F 01 80 DC 9D 19 9E 01 80 DC 9D 19 1D 00 00 08 00 16 1C 28 9E 9E 19 16 0F 01 C0 5F 04 1B 
    //1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 25 2C 2D 92 90 2C 2D 2C 0A 16 2C 64 16 16 
    //19 01 C0 5F 04 1B 1A 00 00 1B 24 98 00 00 1E 00 00 80 3F 1E 00 00 00 00 1E 00 00 00 00 1E 00 00 
    //00 00 16 19 01 C0 5F 04 1B 08 00 00 1B 22 98 00 00 2C 07 16 45 01 70 E6 9D 19 44 4B 98 00 00 19 
    //01 48 0C 9D 19 07 00 00 1B AA 98 00 00 17 16 04 0B 47 
  }



