//==============================================================================
//  HUD_QuestLog
//==============================================================================

class HUD_QuestLog extends GUI_Window
    dependsOn(Game_PlayerPawn,Game_PlayerQuestLog,HUD_QuestLogPage,Quest_Type,GUI_TabCtrl,GUI_TreeCtrl,Game_QuestLog,GUI_Label,GUI_DefaultToolkit,HUD_OnScreenMessages,Quest_Target,GED_Editor)
    Transient
    Config(User)
  ;

  const QL_ABANDON_QUEST =  1;
  const QL_LAYER_3_COLOR_FAILED_B =  98;
  const QL_LAYER_3_COLOR_FAILED_G =  98;
  const QL_LAYER_3_COLOR_FAILED_R =  98;
  const QL_LAYER_3_COLOR_SELECTED_B =  0;
  const QL_LAYER_3_COLOR_SELECTED_G =  0;
  const QL_LAYER_3_COLOR_SELECTED_R =  0;
  const QL_LAYER_3_COLOR_B =  255;
  const QL_LAYER_3_COLOR_G = 	1.0;
  const QL_LAYER_3_COLOR_R =  255;
  const QL_LAYER_2_COLOR_B =  229;
  const QL_LAYER_2_COLOR_G =  211;
  const QL_LAYER_2_COLOR_R =  218;
  const QL_LAYER_1_COLOR_B =  200;
  const QL_LAYER_1_COLOR_G =  182;
  const QL_LAYER_1_COLOR_R =  189;
  const QUEST_TARGET_UPDATE_TIME =  1.0;
  var HUD_QuestLogPage mQuestPage;
  var GUI_TabCtrl mTabCtrl;
  var GUI_TreeCtrl mAcceptedPageQuests;
  var GUI_TreeCtrl mCompletedPageQuests;
  var GUI_Button mAbandonQuestButton;
  var int mAncestralAreasIndex;
  var int mCompletedRootItemID;
  var int mCompletedShardItemsID;
  var int mCompletedAncestralItemsID;
  var int mRootItemID;
  var int mShardItemsID;
  var int mAncestralItemsID;
  var int mQuestItemID;
  var array<int> mCompletedAreaItems;
  var array<int> mAreaItems;
  var array<string> mQuestAreaNames;
  var float mLastTargetUpdateTime;
  var Color mCompletedTargetTextColor;
  var Color mFailedTargetTextColor;
  var Color mInProgressTargetTextColor;


  function bool MBClickHandler(GUI_MessageBox messageBox,int boxTag,int buttonTag) {
    switch (boxTag) {                                                           //0000 : 05 04 00 F8 4C 34 26 
      case 1 :                                                                  //0007 : 0A 78 00 26 
        switch (buttonTag) {                                                    //000B : 05 04 00 70 4D 34 26 
          case 4 :                                                              //0012 : 0A 72 00 2C 04 
            mDesktop.PlaySound(Class'GUI_Sounds'.default.AbandonQuest);         //0017 : 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 30 38 A6 19 16 
            Game_PlayerQuestLog(Game_PlayerPawn(GetPawn()).questLog).cl2sv_AbandonQuest_CallStub(mQuestPage.mCurrentQuest.GetResourceId());//0034 : 19 2E 30 98 5F 01 19 2E F0 47 5B 01 1B 2B 0C 00 00 16 05 00 04 01 F0 2F 7F 0F 1E 00 00 1B B8 19 00 00 19 19 01 08 52 2B 26 05 00 04 01 A8 97 33 26 06 00 04 1C 08 90 20 11 16 16 
            break;                                                              //006F : 06 75 00 
          default:                                                              //0072 : 0A FF FF 
        }
        break;                                                                  //0075 : 06 7B 00 
      default:                                                                  //0078 : 0A FF FF 
        return True;                                                            //007B : 04 27 
      }
    }
    //05 04 00 F8 4C 34 26 0A 78 00 26 05 04 00 70 4D 34 26 0A 72 00 2C 04 19 01 48 0C 9D 19 14 00 00 
    //1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 30 38 A6 19 16 19 2E 30 98 5F 01 19 2E F0 47 5B 01 
    //1B 2B 0C 00 00 16 05 00 04 01 F0 2F 7F 0F 1E 00 00 1B B8 19 00 00 19 19 01 08 52 2B 26 05 00 04 
    //01 A8 97 33 26 06 00 04 1C 08 90 20 11 16 16 06 75 00 0A FF FF 06 7B 00 0A FF FF 04 27 04 0B 47 
    //
  }


  function Tick(float DeltaTime) {
    local export editinline Quest_Type currentQuest;
    mLastTargetUpdateTime += DeltaTime;                                         //0000 : B8 01 30 53 07 1B 00 D0 4B 34 26 16 
    if (mTabCtrl.GetSelectedPage() == mAcceptedPageQuests
      && mLastTargetUpdateTime > 1.00000000) {//000C : 07 89 00 82 72 19 01 A8 B7 2C 26 06 00 04 1B 33 98 00 00 16 01 F0 87 8A 19 16 18 0D 00 B1 01 30 53 07 1B 1E 00 00 80 3F 16 16 
      currentQuest = Quest_Type(mAcceptedPageQuests.GetItemData(mAcceptedPageQuests.GetSelectedIndex()));//0036 : 0F 00 80 6B 07 1B 2E F0 9D 5C 01 19 01 F0 87 8A 19 15 00 04 1B 87 98 00 00 19 01 F0 87 8A 19 06 00 04 1B 5D 98 00 00 16 16 
      if (currentQuest != None) {                                               //005F : 07 89 00 77 00 80 6B 07 1B 2A 16 
        mQuestPage.UpdateQuest(currentQuest);                                   //006A : 19 01 08 52 2B 26 0B 00 00 1B 64 97 00 00 00 80 6B 07 1B 16 
        mLastTargetUpdateTime = 0.00000000;                                     //007E : 0F 01 30 53 07 1B 1E 00 00 00 00 
      }
    }
    //B8 01 30 53 07 1B 00 D0 4B 34 26 16 07 89 00 82 72 19 01 A8 B7 2C 26 06 00 04 1B 33 98 00 00 16 
    //01 F0 87 8A 19 16 18 0D 00 B1 01 30 53 07 1B 1E 00 00 80 3F 16 16 0F 00 80 6B 07 1B 2E F0 9D 5C 
    //01 19 01 F0 87 8A 19 15 00 04 1B 87 98 00 00 19 01 F0 87 8A 19 06 00 04 1B 5D 98 00 00 16 16 07 
    //89 00 77 00 80 6B 07 1B 2A 16 19 01 08 52 2B 26 0B 00 00 1B 64 97 00 00 00 80 6B 07 1B 16 0F 01 
    //30 53 07 1B 1E 00 00 00 00 04 0B 47 
  }


  function OnTabChanged(GUI_TabCtrl aSource,GUI_Page aNewSelectedPage,GUI_Page aPreviousSelectedPage) {
    mQuestPage.ClearQuest();                                                    //0000 : 19 01 08 52 2B 26 06 00 00 1B CA 98 00 00 16 
    mAbandonQuestButton.SetEnabled(False);                                      //000F : 19 01 C8 CF 2B 26 07 00 00 1B 5F 32 00 00 28 16 
    if (aNewSelectedPage == mAcceptedPageQuests) {                              //001F : 07 B0 00 72 00 58 4B 34 26 01 F0 87 8A 19 16 
      if (mAcceptedPageQuests.mSelectedIndex >= 0) {                            //002E : 07 AD 00 99 19 01 F0 87 8A 19 05 00 04 01 E8 EB A5 19 25 16 
        if (Quest_Type(mAcceptedPageQuests.GetItemData(mAcceptedPageQuests.GetSelectedIndex())) != None) {//0042 : 07 AD 00 77 2E F0 9D 5C 01 19 01 F0 87 8A 19 15 00 04 1B 87 98 00 00 19 01 F0 87 8A 19 06 00 04 1B 5D 98 00 00 16 16 2A 16 
          mQuestPage.SetQuest(Quest_Type(mAcceptedPageQuests.GetItemData(mAcceptedPageQuests.GetSelectedIndex())));//006B : 19 01 08 52 2B 26 29 00 00 1B 39 99 00 00 2E F0 9D 5C 01 19 01 F0 87 8A 19 15 00 04 1B 87 98 00 00 19 01 F0 87 8A 19 06 00 04 1B 5D 98 00 00 16 16 16 
          mAbandonQuestButton.SetEnabled(True);                                 //009D : 19 01 C8 CF 2B 26 07 00 00 1B 5F 32 00 00 27 16 
        }
      }
    } else {                                                                    //00AD : 06 1F 01 
      if (mCompletedPageQuests.mSelectedIndex >= 0) {                           //00B0 : 07 1F 01 99 19 01 18 54 EC 25 05 00 04 01 E8 EB A5 19 25 16 
        if (Quest_Type(mCompletedPageQuests.GetItemData(mCompletedPageQuests.GetSelectedIndex())) != None) {//00C4 : 07 1F 01 77 2E F0 9D 5C 01 19 01 18 54 EC 25 15 00 04 1B 87 98 00 00 19 01 18 54 EC 25 06 00 04 1B 5D 98 00 00 16 16 2A 16 
          mQuestPage.SetQuest(Quest_Type(mCompletedPageQuests.GetItemData(mCompletedPageQuests.GetSelectedIndex())));//00ED : 19 01 08 52 2B 26 29 00 00 1B 39 99 00 00 2E F0 9D 5C 01 19 01 18 54 EC 25 15 00 04 1B 87 98 00 00 19 01 18 54 EC 25 06 00 04 1B 5D 98 00 00 16 16 16 
        }
      }
    }
    //19 01 08 52 2B 26 06 00 00 1B CA 98 00 00 16 19 01 C8 CF 2B 26 07 00 00 1B 5F 32 00 00 28 16 07 
    //B0 00 72 00 58 4B 34 26 01 F0 87 8A 19 16 07 AD 00 99 19 01 F0 87 8A 19 05 00 04 01 E8 EB A5 19 
    //25 16 07 AD 00 77 2E F0 9D 5C 01 19 01 F0 87 8A 19 15 00 04 1B 87 98 00 00 19 01 F0 87 8A 19 06 
    //00 04 1B 5D 98 00 00 16 16 2A 16 19 01 08 52 2B 26 29 00 00 1B 39 99 00 00 2E F0 9D 5C 01 19 01 
    //F0 87 8A 19 15 00 04 1B 87 98 00 00 19 01 F0 87 8A 19 06 00 04 1B 5D 98 00 00 16 16 16 19 01 C8 
    //CF 2B 26 07 00 00 1B 5F 32 00 00 27 16 06 1F 01 07 1F 01 99 19 01 18 54 EC 25 05 00 04 01 E8 EB 
    //A5 19 25 16 07 1F 01 77 2E F0 9D 5C 01 19 01 18 54 EC 25 15 00 04 1B 87 98 00 00 19 01 18 54 EC 
    //25 06 00 04 1B 5D 98 00 00 16 16 2A 16 19 01 08 52 2B 26 29 00 00 1B 39 99 00 00 2E F0 9D 5C 01 
    //19 01 18 54 EC 25 15 00 04 1B 87 98 00 00 19 01 18 54 EC 25 06 00 04 1B 5D 98 00 00 16 16 16 04 
    //0B 47 
  }


  function AddCompletedQuest(export editinline Quest_Type aQuest) {
    AddQuest(aQuest,mCompletedPageQuests,mCompletedShardItemsID,mCompletedAncestralItemsID,mQuestAreaNames,mCompletedAreaItems);//0000 : 1B BF 19 00 00 00 A8 39 34 26 01 18 54 EC 25 01 30 5F 33 26 01 90 5D 33 26 01 50 5D 2B 26 01 A8 58 33 26 16 
    Invalidate();                                                               //0024 : 1B 1D 98 00 00 16 
    //1B BF 19 00 00 00 A8 39 34 26 01 18 54 EC 25 01 30 5F 33 26 01 90 5D 33 26 01 50 5D 2B 26 01 A8 
    //58 33 26 16 1B 1D 98 00 00 16 04 0B 47 
  }


  function AddAcceptedQuest(export editinline Quest_Type aQuest) {
    AddQuest(aQuest,mAcceptedPageQuests,mShardItemsID,mAncestralItemsID,mQuestAreaNames,mAreaItems);//0000 : 1B BF 19 00 00 00 80 38 34 26 01 F0 87 8A 19 01 28 5C 33 26 01 C0 5A 33 26 01 50 5D 2B 26 01 B8 57 33 26 16 
    Invalidate();                                                               //0024 : 1B 1D 98 00 00 16 
    //1B BF 19 00 00 00 80 38 34 26 01 F0 87 8A 19 01 28 5C 33 26 01 C0 5A 33 26 01 50 5D 2B 26 01 B8 
    //57 33 26 16 1B 1D 98 00 00 16 04 0B 47 
  }


  function bool AbandonQuestClick(GUI_Component clickedButton) {
    mDesktop.CreateMessageBox("GUI_MessageBox",Class'SBGuiStrings'.default.Abandon_Quest.Text,Class'SBGuiStrings'.default.AreYouSure_AbandonQuest.Text,4 | 8 | 32,1,self);//0000 : 19 01 48 0C 9D 19 48 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 9D 99 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 28 9D 99 19 9E 9E 2C 04 2C 08 16 2C 20 16 26 17 16 
    return True;                                                                //0051 : 04 27 
    //19 01 48 0C 9D 19 48 00 04 1B 1C 98 00 00 1F 47 55 49 5F 4D 65 73 73 61 67 65 42 6F 78 00 36 58 
    //C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 9D 99 19 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 
    //28 9D 99 19 9E 9E 2C 04 2C 08 16 2C 20 16 26 17 16 04 27 04 0B 47 
  }


  function bool HandleItemSelect(GUI_TreeCtrl Source,int itemIndex,string itemText,Object itemData) {
    local GUI_Label selectedComponent;
    local export editinline Quest_Type aQuest;
    if (itemData != None) {                                                     //0000 : 07 46 01 77 00 60 40 33 26 2A 16 
      selectedComponent = GUI_Label(Source.GetItemComponent(Source.GetSelectedIndex()));//000B : 0F 00 30 EA 32 26 2E 38 15 2F 1D 19 00 38 05 05 1B 15 00 04 1B 85 98 00 00 19 00 38 05 05 1B 06 00 04 1B 5D 98 00 00 16 16 
      if (selectedComponent != None) {                                          //0034 : 07 C6 00 77 00 30 EA 32 26 2A 16 
        aQuest = Quest_Type(Source.GetItemData(Source.GetSelectedIndex()));     //003F : 0F 00 58 6A 07 1B 2E F0 9D 5C 01 19 00 38 05 05 1B 15 00 04 1B 87 98 00 00 19 00 38 05 05 1B 06 00 04 1B 5D 98 00 00 16 16 
        if (aQuest != None) {                                                   //0068 : 07 C6 00 77 00 58 6A 07 1B 2A 16 
          if (Game_PlayerPawn(GetPawn()).questLog.FailedQuest(aQuest)) {        //0073 : 07 B1 00 19 19 2E F0 47 5B 01 1B 2B 0C 00 00 16 05 00 04 01 F0 2F 7F 0F 0B 00 04 1C 08 35 30 11 00 58 6A 07 1B 16 
            selectedComponent.SetColor(98,98,98);                               //0099 : 19 00 30 EA 32 26 0C 00 00 1B 19 98 00 00 2C 62 2C 62 2C 62 16 
          } else {                                                              //00AE : 06 C6 00 
            selectedComponent.SetColor(255,255,255);                            //00B1 : 19 00 30 EA 32 26 0C 00 00 1B 19 98 00 00 2C FF 2C FF 2C FF 16 
          }
        }
      }
      mQuestPage.SetQuest(Quest_Type(itemData));                                //00C6 : 19 01 08 52 2B 26 10 00 00 1B 39 99 00 00 2E F0 9D 5C 01 00 60 40 33 26 16 
      if (mTabCtrl.GetSelectedPage() == mAcceptedPageQuests) {                  //00DF : 07 08 01 72 19 01 A8 B7 2C 26 06 00 04 1B 33 98 00 00 16 01 F0 87 8A 19 16 
        mAbandonQuestButton.SetEnabled(True);                                   //00F8 : 19 01 C8 CF 2B 26 07 00 00 1B 5F 32 00 00 27 16 
      }
      selectedComponent = GUI_Label(Source.GetItemComponent(itemIndex));        //0108 : 0F 00 30 EA 32 26 2E 38 15 2F 1D 19 00 38 05 05 1B 0B 00 04 1B 85 98 00 00 00 E0 36 34 26 16 
      if (selectedComponent != None) {                                          //0127 : 07 44 01 77 00 30 EA 32 26 2A 16 
        selectedComponent.SetColor(0,0,0);                                      //0132 : 19 00 30 EA 32 26 09 00 00 1B 19 98 00 00 25 25 25 16 
      }
      return True;                                                              //0144 : 04 27 
    }
    return False;                                                               //0146 : 04 28 
    //07 46 01 77 00 60 40 33 26 2A 16 0F 00 30 EA 32 26 2E 38 15 2F 1D 19 00 38 05 05 1B 15 00 04 1B 
    //85 98 00 00 19 00 38 05 05 1B 06 00 04 1B 5D 98 00 00 16 16 07 C6 00 77 00 30 EA 32 26 2A 16 0F 
    //00 58 6A 07 1B 2E F0 9D 5C 01 19 00 38 05 05 1B 15 00 04 1B 87 98 00 00 19 00 38 05 05 1B 06 00 
    //04 1B 5D 98 00 00 16 16 07 C6 00 77 00 58 6A 07 1B 2A 16 07 B1 00 19 19 2E F0 47 5B 01 1B 2B 0C 
    //00 00 16 05 00 04 01 F0 2F 7F 0F 0B 00 04 1C 08 35 30 11 00 58 6A 07 1B 16 19 00 30 EA 32 26 0C 
    //00 00 1B 19 98 00 00 2C 62 2C 62 2C 62 16 06 C6 00 19 00 30 EA 32 26 0C 00 00 1B 19 98 00 00 2C 
    //FF 2C FF 2C FF 16 19 01 08 52 2B 26 10 00 00 1B 39 99 00 00 2E F0 9D 5C 01 00 60 40 33 26 16 07 
    //08 01 72 19 01 A8 B7 2C 26 06 00 04 1B 33 98 00 00 16 01 F0 87 8A 19 16 19 01 C8 CF 2B 26 07 00 
    //00 1B 5F 32 00 00 27 16 0F 00 30 EA 32 26 2E 38 15 2F 1D 19 00 38 05 05 1B 0B 00 04 1B 85 98 00 
    //00 00 E0 36 34 26 16 07 44 01 77 00 30 EA 32 26 2A 16 19 00 30 EA 32 26 09 00 00 1B 19 98 00 00 
    //25 25 25 16 04 27 04 28 04 0B 47 
  }


  function RemoveQuest(export editinline Quest_Type aQuest) {
    local int Index;
    Index = mAcceptedPageQuests.GetItemIndex(aQuest);                           //0000 : 0F 00 18 16 06 1B 19 01 F0 87 8A 19 0B 00 04 1B CD 99 00 00 00 68 36 34 26 16 
    if (Index >= 0) {                                                           //001A : 07 70 00 99 00 18 16 06 1B 25 16 
      if (mAcceptedPageQuests.GetSelectedIndex() == Index) {                    //0025 : 07 4D 00 9A 19 01 F0 87 8A 19 06 00 04 1B 5D 98 00 00 16 00 18 16 06 1B 16 
        mQuestPage.ClearQuest();                                                //003E : 19 01 08 52 2B 26 06 00 00 1B CA 98 00 00 16 
      }
      mAcceptedPageQuests.RemoveItem(Index);                                    //004D : 19 01 F0 87 8A 19 0B 00 04 1B 81 0C 00 00 00 18 16 06 1B 16 
      mAcceptedPageQuests.Invalidate();                                         //0061 : 19 01 F0 87 8A 19 06 00 00 1B 1D 98 00 00 16 
    }
    mAbandonQuestButton.SetEnabled(False);                                      //0070 : 19 01 C8 CF 2B 26 07 00 00 1B 5F 32 00 00 28 16 
    //0F 00 18 16 06 1B 19 01 F0 87 8A 19 0B 00 04 1B CD 99 00 00 00 68 36 34 26 16 07 70 00 99 00 18 
    //16 06 1B 25 16 07 4D 00 9A 19 01 F0 87 8A 19 06 00 04 1B 5D 98 00 00 16 00 18 16 06 1B 16 19 01 
    //08 52 2B 26 06 00 00 1B CA 98 00 00 16 19 01 F0 87 8A 19 0B 00 04 1B 81 0C 00 00 00 18 16 06 1B 
    //16 19 01 F0 87 8A 19 06 00 00 1B 1D 98 00 00 16 19 01 C8 CF 2B 26 07 00 00 1B 5F 32 00 00 28 16 
    //04 0B 47 
  }


  function AddQuest(export editinline Quest_Type aQuest,GUI_TreeCtrl Target,int ShardItemsID,int AncestralItemsID,out array<string> QuestAreaNames,out array<int> AreaItems) {
    local Color colorBuffer;
    local int treeFlags;
    local int areaIndex;
    local int parentID;
    areaIndex = aQuest.QuestArea;                                               //0000 : 0F 00 C0 EC 32 26 39 3A 19 00 30 06 04 1B 05 00 01 01 10 56 2E 11 
    treeFlags = Class'GUI_TreeCtrl'.1 | Class'GUI_TreeCtrl'.2;                  //0016 : 0F 00 D8 40 33 26 9E 12 20 60 7E 2F 1D 01 00 04 26 12 20 60 7E 2F 1D 02 00 04 2C 02 16 
    colorBuffer.A = 255;                                                        //0033 : 0F 36 48 91 6A 0F 00 68 3D 2B 26 39 3D 2C FF 
    colorBuffer.R = 218;                                                        //0042 : 0F 36 D0 90 6A 0F 00 68 3D 2B 26 24 DA 
    colorBuffer.G = 211;                                                        //004F : 0F 36 58 90 6A 0F 00 68 3D 2B 26 24 D3 
    colorBuffer.B = 229;                                                        //005C : 0F 36 E0 8F 6A 0F 00 68 3D 2B 26 24 E5 
    if (aQuest.QuestArea < mAncestralAreasIndex) {                              //0069 : 07 03 01 96 39 3A 19 00 30 06 04 1B 05 00 01 01 10 56 2E 11 01 A8 5F 33 26 16 
      if (AreaItems.Length < areaIndex + 1) {                                   //0083 : 07 A5 00 96 37 00 B0 05 05 1B 92 00 C0 EC 32 26 26 16 16 
        AreaItems.Length = areaIndex + 1;                                       //0096 : 0F 37 00 B0 05 05 1B 92 00 C0 EC 32 26 26 16 
      }
      if (AreaItems[areaIndex] == 0) {                                          //00A5 : 07 EF 00 9A 10 00 C0 EC 32 26 00 B0 05 05 1B 25 16 
        AreaItems[areaIndex] = Target.AddItemText(ShardItemsID,treeFlags,QuestAreaNames[areaIndex],colorBuffer,False);//00B6 : 0F 10 00 C0 EC 32 26 00 B0 05 05 1B 19 00 28 06 05 1B 21 00 04 1B 8B 98 00 00 00 00 35 34 26 00 D8 40 33 26 10 00 C0 EC 32 26 00 F0 35 34 26 00 68 3D 2B 26 28 16 
        goto jl00EF;                                                            //00EC : 06 EF 00 
      }
      parentID = AreaItems[areaIndex];                                          //00EF : 0F 00 68 69 07 1B 10 00 C0 EC 32 26 00 B0 05 05 1B 
    } else {                                                                    //0100 : 06 0E 01 
      parentID = AncestralItemsID;                                              //0103 : 0F 00 68 69 07 1B 00 78 35 34 26 
    }
    if (Game_PlayerPawn(GetPawn()).questLog.FailedQuest(aQuest)) {              //010E : 07 5E 01 19 19 2E F0 47 5B 01 1B 2B 0C 00 00 16 05 00 04 01 F0 2F 7F 0F 0B 00 04 1C 08 35 30 11 00 30 06 04 1B 16 
      colorBuffer.R = 98;                                                       //0134 : 0F 36 D0 90 6A 0F 00 68 3D 2B 26 24 62 
      colorBuffer.G = 98;                                                       //0141 : 0F 36 58 90 6A 0F 00 68 3D 2B 26 24 62 
      colorBuffer.B = 98;                                                       //014E : 0F 36 E0 8F 6A 0F 00 68 3D 2B 26 24 62 
    } else {                                                                    //015B : 06 8B 01 
      colorBuffer.R = 255;                                                      //015E : 0F 36 D0 90 6A 0F 00 68 3D 2B 26 39 3D 2C FF 
      colorBuffer.G = 255;                                                      //016D : 0F 36 58 90 6A 0F 00 68 3D 2B 26 39 3D 2C FF 
      colorBuffer.B = 255;                                                      //017C : 0F 36 E0 8F 6A 0F 00 68 3D 2B 26 39 3D 2C FF 
    }
    mQuestItemID = Target.AddItemText(parentID,0,FormatQuestName(aQuest.Name.Text),colorBuffer,False);//018B : 0F 01 08 FC 05 1B 19 00 28 06 05 1B 2B 00 04 1B 8B 98 00 00 00 68 69 07 1B 25 1B BB 9A 00 00 36 58 C6 6B 0F 19 00 30 06 04 1B 05 00 0C 01 70 57 2E 11 16 00 68 3D 2B 26 28 16 
    if (Game_PlayerPawn(GetPawn()).questLog.FailedQuest(aQuest)) {              //01C5 : 07 33 02 19 19 2E F0 47 5B 01 1B 2B 0C 00 00 16 05 00 04 01 F0 2F 7F 0F 0B 00 04 1C 08 35 30 11 00 30 06 04 1B 16 
      Target.SetItemIcon(mQuestItemID,"taskicon_failed","SBGuiTX.GUI_Styles","GUI_Styles");//01EB : 19 00 28 06 05 1B 3C 00 00 1B FA 9A 00 00 01 08 FC 05 1B 1F 74 61 73 6B 69 63 6F 6E 5F 66 61 69 6C 65 64 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 
    } else {                                                                    //0230 : 06 47 02 
      Target.ClearItemIcon(mQuestItemID);                                       //0233 : 19 00 28 06 05 1B 0B 00 00 1B FF 9A 00 00 01 08 FC 05 1B 16 
    }
    Target.SetItemData(mQuestItemID,aQuest);                                    //0247 : 19 00 28 06 05 1B 10 00 00 1B 16 9B 00 00 01 08 FC 05 1B 00 30 06 04 1B 16 
    //0F 00 C0 EC 32 26 39 3A 19 00 30 06 04 1B 05 00 01 01 10 56 2E 11 0F 00 D8 40 33 26 9E 12 20 60 
    //7E 2F 1D 01 00 04 26 12 20 60 7E 2F 1D 02 00 04 2C 02 16 0F 36 48 91 6A 0F 00 68 3D 2B 26 39 3D 
    //2C FF 0F 36 D0 90 6A 0F 00 68 3D 2B 26 24 DA 0F 36 58 90 6A 0F 00 68 3D 2B 26 24 D3 0F 36 E0 8F 
    //6A 0F 00 68 3D 2B 26 24 E5 07 03 01 96 39 3A 19 00 30 06 04 1B 05 00 01 01 10 56 2E 11 01 A8 5F 
    //33 26 16 07 A5 00 96 37 00 B0 05 05 1B 92 00 C0 EC 32 26 26 16 16 0F 37 00 B0 05 05 1B 92 00 C0 
    //EC 32 26 26 16 07 EF 00 9A 10 00 C0 EC 32 26 00 B0 05 05 1B 25 16 0F 10 00 C0 EC 32 26 00 B0 05 
    //05 1B 19 00 28 06 05 1B 21 00 04 1B 8B 98 00 00 00 00 35 34 26 00 D8 40 33 26 10 00 C0 EC 32 26 
    //00 F0 35 34 26 00 68 3D 2B 26 28 16 06 EF 00 0F 00 68 69 07 1B 10 00 C0 EC 32 26 00 B0 05 05 1B 
    //06 0E 01 0F 00 68 69 07 1B 00 78 35 34 26 07 5E 01 19 19 2E F0 47 5B 01 1B 2B 0C 00 00 16 05 00 
    //04 01 F0 2F 7F 0F 0B 00 04 1C 08 35 30 11 00 30 06 04 1B 16 0F 36 D0 90 6A 0F 00 68 3D 2B 26 24 
    //62 0F 36 58 90 6A 0F 00 68 3D 2B 26 24 62 0F 36 E0 8F 6A 0F 00 68 3D 2B 26 24 62 06 8B 01 0F 36 
    //D0 90 6A 0F 00 68 3D 2B 26 39 3D 2C FF 0F 36 58 90 6A 0F 00 68 3D 2B 26 39 3D 2C FF 0F 36 E0 8F 
    //6A 0F 00 68 3D 2B 26 39 3D 2C FF 0F 01 08 FC 05 1B 19 00 28 06 05 1B 2B 00 04 1B 8B 98 00 00 00 
    //68 69 07 1B 25 1B BB 9A 00 00 36 58 C6 6B 0F 19 00 30 06 04 1B 05 00 0C 01 70 57 2E 11 16 00 68 
    //3D 2B 26 28 16 07 33 02 19 19 2E F0 47 5B 01 1B 2B 0C 00 00 16 05 00 04 01 F0 2F 7F 0F 0B 00 04 
    //1C 08 35 30 11 00 30 06 04 1B 16 19 00 28 06 05 1B 3C 00 00 1B FA 9A 00 00 01 08 FC 05 1B 1F 74 
    //61 73 6B 69 63 6F 6E 5F 66 61 69 6C 65 64 00 1F 53 42 47 75 69 54 58 2E 47 55 49 5F 53 74 79 6C 
    //65 73 00 1F 47 55 49 5F 53 74 79 6C 65 73 00 16 06 47 02 19 00 28 06 05 1B 0B 00 00 1B FF 9A 00 
    //00 01 08 FC 05 1B 16 19 00 28 06 05 1B 10 00 00 1B 16 9B 00 00 01 08 FC 05 1B 00 30 06 04 1B 16 
    //04 0B 47 
  }


  function string FormatQuestName(string aQuestName) {
    local GUI_DefaultToolkit kit;
    kit = GUI_DefaultToolkit(mDesktop.mToolkit);                                //0000 : 0F 00 E8 65 07 1B 2E F0 D5 2E 1D 19 01 48 0C 9D 19 05 00 04 01 B8 A4 97 19 
    if (kit.GetTextWidth(aQuestName,kit.CreateFont("SBFontsTX.Verdana10"),1.00000000) > 175) {//0019 : 07 80 00 B1 19 00 E8 65 07 1B 34 00 04 1B 73 9A 00 00 00 78 FA 32 26 19 00 E8 65 07 1B 1B 00 04 1B 26 99 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 1E 00 00 80 3F 16 39 3F 2C AF 16 
      aQuestName = Left(aQuestName,23);                                         //005F : 0F 00 78 FA 32 26 80 00 78 FA 32 26 2C 17 16 
      aQuestName = aQuestName $ "...";                                          //006E : 0F 00 78 FA 32 26 70 00 78 FA 32 26 1F 2E 2E 2E 00 16 
    }
    return aQuestName;                                                          //0080 : 04 00 78 FA 32 26 
    //0F 00 E8 65 07 1B 2E F0 D5 2E 1D 19 01 48 0C 9D 19 05 00 04 01 B8 A4 97 19 07 80 00 B1 19 00 E8 
    //65 07 1B 34 00 04 1B 73 9A 00 00 00 78 FA 32 26 19 00 E8 65 07 1B 1B 00 04 1B 26 99 00 00 1F 53 
    //42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 1E 00 00 80 3F 16 39 3F 2C AF 16 0F 
    //00 78 FA 32 26 80 00 78 FA 32 26 2C 17 16 0F 00 78 FA 32 26 70 00 78 FA 32 26 1F 2E 2E 2E 00 16 
    //04 00 78 FA 32 26 04 0B 47 
  }


  function InitializeTreeView() {
    local int i;
    local int treeFlags;
    local Color colorBuffer;
    local int indexCompleted;
    local int indexAccepted;
    indexCompleted = mCompletedPageQuests.GetSelectedIndex();                   //0000 : 0F 00 30 28 05 1B 19 01 18 54 EC 25 06 00 04 1B 5D 98 00 00 16 
    indexAccepted = mAcceptedPageQuests.GetSelectedIndex();                     //0015 : 0F 00 C8 26 05 1B 19 01 F0 87 8A 19 06 00 04 1B 5D 98 00 00 16 
    mCompletedPageQuests.RemoveAllItems();                                      //002A : 19 01 18 54 EC 25 06 00 04 1B 9C 98 00 00 16 
    mAcceptedPageQuests.RemoveAllItems();                                       //0039 : 19 01 F0 87 8A 19 06 00 04 1B 9C 98 00 00 16 
    mAreaItems.Length = 0;                                                      //0048 : 0F 37 01 B8 57 33 26 25 
    mCompletedAreaItems.Length = 0;                                             //0050 : 0F 37 01 A8 58 33 26 25 
    treeFlags = Class'GUI_TreeCtrl'.1 | Class'GUI_TreeCtrl'.2;                  //0058 : 0F 00 18 03 2D 26 9E 12 20 60 7E 2F 1D 01 00 04 26 12 20 60 7E 2F 1D 02 00 04 2C 02 16 
    colorBuffer.A = 255;                                                        //0075 : 0F 36 48 91 6A 0F 00 C0 77 2B 26 39 3D 2C FF 
    colorBuffer.R = 189;                                                        //0084 : 0F 36 D0 90 6A 0F 00 C0 77 2B 26 24 BD 
    colorBuffer.G = 182;                                                        //0091 : 0F 36 58 90 6A 0F 00 C0 77 2B 26 24 B6 
    colorBuffer.B = 200;                                                        //009E : 0F 36 E0 8F 6A 0F 00 C0 77 2B 26 24 C8 
    mCompletedRootItemID = mCompletedPageQuests.SetRootText(treeFlags,"-root-",colorBuffer);//00AB : 0F 01 20 F4 05 1B 19 01 18 54 EC 25 18 00 04 1B E8 98 00 00 00 18 03 2D 26 1F 2D 72 6F 6F 74 2D 00 00 C0 77 2B 26 16 
    mRootItemID = mAcceptedPageQuests.SetRootText(treeFlags,"-root-",colorBuffer);//00D2 : 0F 01 38 F6 05 1B 19 01 F0 87 8A 19 18 00 04 1B E8 98 00 00 00 18 03 2D 26 1F 2D 72 6F 6F 74 2D 00 00 C0 77 2B 26 16 
    mCompletedPageQuests.SetItemDrawn(mCompletedRootItemID,False);              //00F9 : 19 01 18 54 EC 25 0C 00 00 1B E6 98 00 00 01 20 F4 05 1B 28 16 
    mAcceptedPageQuests.SetItemDrawn(mRootItemID,False);                        //010E : 19 01 F0 87 8A 19 0C 00 00 1B E6 98 00 00 01 38 F6 05 1B 28 16 
    mCompletedShardItemsID = mCompletedPageQuests.AddItemText(mCompletedRootItemID,treeFlags,Class'SBGuiStrings'.default.Shard_Quests.Text,colorBuffer,False);//0123 : 0F 01 30 5F 33 26 19 01 18 54 EC 25 29 00 04 1B 8B 98 00 00 01 20 F4 05 1B 00 18 03 2D 26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F0 A3 98 19 00 C0 77 2B 26 28 16 
    mCompletedAncestralItemsID = mCompletedPageQuests.AddItemText(mCompletedRootItemID,treeFlags,Class'SBGuiStrings'.default.Ancestral_Quests.Text,colorBuffer,False);//015B : 0F 01 90 5D 33 26 19 01 18 54 EC 25 29 00 04 1B 8B 98 00 00 01 20 F4 05 1B 00 18 03 2D 26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 40 9F 98 19 00 C0 77 2B 26 28 16 
    mShardItemsID = mAcceptedPageQuests.AddItemText(mRootItemID,treeFlags,Class'SBGuiStrings'.default.Shard_Quests.Text,colorBuffer,False);//0193 : 0F 01 28 5C 33 26 19 01 F0 87 8A 19 29 00 04 1B 8B 98 00 00 01 38 F6 05 1B 00 18 03 2D 26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F0 A3 98 19 00 C0 77 2B 26 28 16 
    mAncestralItemsID = mAcceptedPageQuests.AddItemText(mRootItemID,treeFlags,Class'SBGuiStrings'.default.Ancestral_Quests.Text,colorBuffer,False);//01CB : 0F 01 C0 5A 33 26 19 01 F0 87 8A 19 29 00 04 1B 8B 98 00 00 01 38 F6 05 1B 00 18 03 2D 26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 40 9F 98 19 00 C0 77 2B 26 28 16 
    i = 0;                                                                      //0203 : 0F 00 98 97 2C 26 25 
    while (i < Game_PlayerPawn(GetPawn()).questLog.Quests.Length) {             //020A : 07 65 02 96 00 98 97 2C 26 37 19 19 2E F0 47 5B 01 1B 2B 0C 00 00 16 05 00 04 01 F0 2F 7F 0F 05 00 00 01 18 31 2F 11 16 
      AddAcceptedQuest(Game_PlayerPawn(GetPawn()).questLog.Quests[i]);          //0232 : 1B CC 99 00 00 10 00 98 97 2C 26 19 19 2E F0 47 5B 01 1B 2B 0C 00 00 16 05 00 04 01 F0 2F 7F 0F 05 00 00 01 18 31 2F 11 16 
      i++;                                                                      //025B : A5 00 98 97 2C 26 16 
    }
    i = 0;                                                                      //0265 : 0F 00 98 97 2C 26 25 
    while (i < Game_PlayerPawn(GetPawn()).questLog.CompletedQuests.Length) {    //026C : 07 CC 02 96 00 98 97 2C 26 37 19 19 2E F0 47 5B 01 1B 2B 0C 00 00 16 05 00 04 01 F0 2F 7F 0F 05 00 00 01 08 51 30 11 16 
      AddCompletedQuest(Game_PlayerPawn(GetPawn()).questLog.CompletedQuests[i].quest);//0294 : 1B C0 19 00 00 36 C8 56 30 11 10 00 98 97 2C 26 19 19 2E F0 47 5B 01 1B 2B 0C 00 00 16 05 00 04 01 F0 2F 7F 0F 05 00 00 01 08 51 30 11 16 
      i++;                                                                      //02C2 : A5 00 98 97 2C 26 16 
    }
    mAcceptedPageQuests.__OnItemSelect__Delegate = HandleItemSelect;            //02CC : 45 19 01 F0 87 8A 19 05 00 08 01 20 40 A3 19 44 E3 98 00 00 
    mCompletedPageQuests.__OnItemSelect__Delegate = HandleItemSelect;           //02E0 : 45 19 01 18 54 EC 25 05 00 08 01 20 40 A3 19 44 E3 98 00 00 
    mAbandonQuestButton.SetEnabled(False);                                      //02F4 : 19 01 C8 CF 2B 26 07 00 00 1B 5F 32 00 00 28 16 
    if (mTabCtrl.GetSelectedPage() == mAcceptedPageQuests) {                    //0304 : 07 9E 03 72 19 01 A8 B7 2C 26 06 00 04 1B 33 98 00 00 16 01 F0 87 8A 19 16 
      if (mCompletedPageQuests.GetItemComponent(indexCompleted) != None) {      //031D : 07 4B 03 77 19 01 18 54 EC 25 0B 00 04 1B 85 98 00 00 00 30 28 05 1B 16 2A 16 
        mCompletedPageQuests.SelectItem(indexCompleted);                        //0337 : 19 01 18 54 EC 25 0B 00 00 1B 42 98 00 00 00 30 28 05 1B 16 
      }
      if (mAcceptedPageQuests.GetItemComponent(indexAccepted) != None) {        //034B : 07 8C 03 77 19 01 F0 87 8A 19 0B 00 04 1B 85 98 00 00 00 C8 26 05 1B 16 2A 16 
        mAcceptedPageQuests.SelectItem(indexAccepted);                          //0365 : 19 01 F0 87 8A 19 0B 00 00 1B 42 98 00 00 00 C8 26 05 1B 16 
        mAbandonQuestButton.SetEnabled(True);                                   //0379 : 19 01 C8 CF 2B 26 07 00 00 1B 5F 32 00 00 27 16 
      } else {                                                                  //0389 : 06 9B 03 
        mQuestPage.ClearQuest();                                                //038C : 19 01 08 52 2B 26 06 00 00 1B CA 98 00 00 16 
      }
    } else {                                                                    //039B : 06 0C 04 
      if (mAcceptedPageQuests.GetItemComponent(indexAccepted) != None) {        //039E : 07 CC 03 77 19 01 F0 87 8A 19 0B 00 04 1B 85 98 00 00 00 C8 26 05 1B 16 2A 16 
        mAcceptedPageQuests.SelectItem(indexAccepted);                          //03B8 : 19 01 F0 87 8A 19 0B 00 00 1B 42 98 00 00 00 C8 26 05 1B 16 
      }
      if (mCompletedPageQuests.GetItemComponent(indexCompleted) != None) {      //03CC : 07 FD 03 77 19 01 18 54 EC 25 0B 00 04 1B 85 98 00 00 00 30 28 05 1B 16 2A 16 
        mCompletedPageQuests.SelectItem(indexCompleted);                        //03E6 : 19 01 18 54 EC 25 0B 00 00 1B 42 98 00 00 00 30 28 05 1B 16 
      } else {                                                                  //03FA : 06 0C 04 
        mQuestPage.ClearQuest();                                                //03FD : 19 01 08 52 2B 26 06 00 00 1B CA 98 00 00 16 
      }
    }
    //0F 00 30 28 05 1B 19 01 18 54 EC 25 06 00 04 1B 5D 98 00 00 16 0F 00 C8 26 05 1B 19 01 F0 87 8A 
    //19 06 00 04 1B 5D 98 00 00 16 19 01 18 54 EC 25 06 00 04 1B 9C 98 00 00 16 19 01 F0 87 8A 19 06 
    //00 04 1B 9C 98 00 00 16 0F 37 01 B8 57 33 26 25 0F 37 01 A8 58 33 26 25 0F 00 18 03 2D 26 9E 12 
    //20 60 7E 2F 1D 01 00 04 26 12 20 60 7E 2F 1D 02 00 04 2C 02 16 0F 36 48 91 6A 0F 00 C0 77 2B 26 
    //39 3D 2C FF 0F 36 D0 90 6A 0F 00 C0 77 2B 26 24 BD 0F 36 58 90 6A 0F 00 C0 77 2B 26 24 B6 0F 36 
    //E0 8F 6A 0F 00 C0 77 2B 26 24 C8 0F 01 20 F4 05 1B 19 01 18 54 EC 25 18 00 04 1B E8 98 00 00 00 
    //18 03 2D 26 1F 2D 72 6F 6F 74 2D 00 00 C0 77 2B 26 16 0F 01 38 F6 05 1B 19 01 F0 87 8A 19 18 00 
    //04 1B E8 98 00 00 00 18 03 2D 26 1F 2D 72 6F 6F 74 2D 00 00 C0 77 2B 26 16 19 01 18 54 EC 25 0C 
    //00 00 1B E6 98 00 00 01 20 F4 05 1B 28 16 19 01 F0 87 8A 19 0C 00 00 1B E6 98 00 00 01 38 F6 05 
    //1B 28 16 0F 01 30 5F 33 26 19 01 18 54 EC 25 29 00 04 1B 8B 98 00 00 01 20 F4 05 1B 00 18 03 2D 
    //26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 F0 A3 98 19 00 C0 77 2B 26 28 16 0F 01 90 5D 33 
    //26 19 01 18 54 EC 25 29 00 04 1B 8B 98 00 00 01 20 F4 05 1B 00 18 03 2D 26 36 58 C6 6B 0F 12 20 
    //70 4B 32 1D 05 00 0C 02 40 9F 98 19 00 C0 77 2B 26 28 16 0F 01 28 5C 33 26 19 01 F0 87 8A 19 29 
    //00 04 1B 8B 98 00 00 01 38 F6 05 1B 00 18 03 2D 26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 
    //F0 A3 98 19 00 C0 77 2B 26 28 16 0F 01 C0 5A 33 26 19 01 F0 87 8A 19 29 00 04 1B 8B 98 00 00 01 
    //38 F6 05 1B 00 18 03 2D 26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 40 9F 98 19 00 C0 77 2B 
    //26 28 16 0F 00 98 97 2C 26 25 07 65 02 96 00 98 97 2C 26 37 19 19 2E F0 47 5B 01 1B 2B 0C 00 00 
    //16 05 00 04 01 F0 2F 7F 0F 05 00 00 01 18 31 2F 11 16 1B CC 99 00 00 10 00 98 97 2C 26 19 19 2E 
    //F0 47 5B 01 1B 2B 0C 00 00 16 05 00 04 01 F0 2F 7F 0F 05 00 00 01 18 31 2F 11 16 A5 00 98 97 2C 
    //26 16 06 0A 02 0F 00 98 97 2C 26 25 07 CC 02 96 00 98 97 2C 26 37 19 19 2E F0 47 5B 01 1B 2B 0C 
    //00 00 16 05 00 04 01 F0 2F 7F 0F 05 00 00 01 08 51 30 11 16 1B C0 19 00 00 36 C8 56 30 11 10 00 
    //98 97 2C 26 19 19 2E F0 47 5B 01 1B 2B 0C 00 00 16 05 00 04 01 F0 2F 7F 0F 05 00 00 01 08 51 30 
    //11 16 A5 00 98 97 2C 26 16 06 6C 02 45 19 01 F0 87 8A 19 05 00 08 01 20 40 A3 19 44 E3 98 00 00 
    //45 19 01 18 54 EC 25 05 00 08 01 20 40 A3 19 44 E3 98 00 00 19 01 C8 CF 2B 26 07 00 00 1B 5F 32 
    //00 00 28 16 07 9E 03 72 19 01 A8 B7 2C 26 06 00 04 1B 33 98 00 00 16 01 F0 87 8A 19 16 07 4B 03 
    //77 19 01 18 54 EC 25 0B 00 04 1B 85 98 00 00 00 30 28 05 1B 16 2A 16 19 01 18 54 EC 25 0B 00 00 
    //1B 42 98 00 00 00 30 28 05 1B 16 07 8C 03 77 19 01 F0 87 8A 19 0B 00 04 1B 85 98 00 00 00 C8 26 
    //05 1B 16 2A 16 19 01 F0 87 8A 19 0B 00 00 1B 42 98 00 00 00 C8 26 05 1B 16 19 01 C8 CF 2B 26 07 
    //00 00 1B 5F 32 00 00 27 16 06 9B 03 19 01 08 52 2B 26 06 00 00 1B CA 98 00 00 16 06 0C 04 07 CC 
    //03 77 19 01 F0 87 8A 19 0B 00 04 1B 85 98 00 00 00 C8 26 05 1B 16 2A 16 19 01 F0 87 8A 19 0B 00 
    //00 1B 42 98 00 00 00 C8 26 05 1B 16 07 FD 03 77 19 01 18 54 EC 25 0B 00 04 1B 85 98 00 00 00 30 
    //28 05 1B 16 2A 16 19 01 18 54 EC 25 0B 00 00 1B 42 98 00 00 00 30 28 05 1B 16 06 0C 04 19 01 08 
    //52 2B 26 06 00 00 1B CA 98 00 00 16 04 0B 47 
  }


  event DoShowWindow(int flags) {
    Super.DoShowWindow(flags);                                                  //0000 : 1C 20 7A 9E 19 00 60 47 33 26 16 
    if (flags == Class'GUI_BaseDesktop'.1) {                                    //000B : 07 25 00 9A 00 60 47 33 26 12 20 00 68 D7 00 01 00 04 26 16 
      InitializeTreeView();                                                     //001F : 1B D4 99 00 00 16 
    }
    //1C 20 7A 9E 19 00 60 47 33 26 16 07 25 00 9A 00 60 47 33 26 12 20 00 68 D7 00 01 00 04 26 16 1B 
    //D4 99 00 00 16 04 0B 47 
  }


  function OnFinishQuest(int aQuestID) {
    mDesktop.PlaySound(Class'GUI_Sounds'.default.FinishQuest);                  //0000 : 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 F0 36 A6 19 16 
    //19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 F0 36 A6 19 16 04 0B 47 
    //
  }


  function OnAcceptQuest(int aQuestID) {
    mDesktop.PlaySound(Class'GUI_Sounds'.default.AcceptQuest);                  //0000 : 19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 90 37 A6 19 16 
    //19 01 48 0C 9D 19 14 00 00 1B 03 06 00 00 12 20 E0 7C 9E 19 05 00 04 02 90 37 A6 19 16 04 0B 47 
    //
  }


  function OnAddCompletedQuest(export editinline Quest_Type aQuest) {
    local HUD_OnScreenMessages wnd;
    AddCompletedQuest(aQuest);                                                  //0000 : 1B C0 19 00 00 00 08 4C 33 26 16 
    wnd = HUD_OnScreenMessages(mDesktop.GetStdWindow(76));                      //000B : 0F 00 78 61 07 1B 2E 08 F6 31 1D 19 01 48 0C 9D 19 08 00 04 1B 1B 98 00 00 2C 4C 16 
    wnd.AddOnScreenMessage(Class'SBGuiStrings'.default.You_have_completed_the_Quest_.Text);//0027 : 19 00 78 61 07 1B 19 00 00 1B AC 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B0 86 2F 16 16 
    wnd.AddOnScreenMessage(aQuest.Name.Text,mInProgressTargetTextColor,"SBFontsTX.Verdana11");//0049 : 19 00 78 61 07 1B 33 00 00 1B AC 96 00 00 36 58 C6 6B 0F 19 00 08 4C 33 26 05 00 0C 01 70 57 2E 11 01 08 50 33 26 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 31 00 16 
    //1B C0 19 00 00 00 08 4C 33 26 16 0F 00 78 61 07 1B 2E 08 F6 31 1D 19 01 48 0C 9D 19 08 00 04 1B 
    //1B 98 00 00 2C 4C 16 19 00 78 61 07 1B 19 00 00 1B AC 96 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 
    //05 00 0C 02 B0 86 2F 16 16 19 00 78 61 07 1B 33 00 00 1B AC 96 00 00 36 58 C6 6B 0F 19 00 08 4C 
    //33 26 05 00 0C 01 70 57 2E 11 01 08 50 33 26 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 
    //61 31 31 00 16 04 0B 47 
  }


  function OnQuestProgress(export editinline Quest_Type aQuest,int aTargetNr,int aProgress) {
    local int Index;
    local HUD_OnScreenMessages aWindow;
    local string targetText;
    Index = mAcceptedPageQuests.GetItemIndex(aQuest);                           //0000 : 0F 00 38 5A 07 1B 19 01 F0 87 8A 19 0B 00 04 1B CD 99 00 00 00 D8 18 2B 26 16 
    if (Index >= 0) {                                                           //001A : 07 68 02 99 00 38 5A 07 1B 25 16 
      if (mAcceptedPageQuests.GetSelectedIndex() == Index) {                    //0025 : 07 52 00 9A 19 01 F0 87 8A 19 06 00 04 1B 5D 98 00 00 16 00 38 5A 07 1B 16 
        mQuestPage.UpdateQuest(aQuest);                                         //003E : 19 01 08 52 2B 26 0B 00 00 1B 64 97 00 00 00 D8 18 2B 26 16 
      }
      if (Game_PlayerPawn(GetPawn()).questLog.IsTargetVisible(aQuest,aTargetNr)
        && !aQuest.Targets[aTargetNr].IsA('Quest_Condition')
        && !Game_PlayerPawn(GetPawn()).questLog.CompletedQuest(aQuest,True)) {//0052 : 07 68 02 82 82 19 19 2E F0 47 5B 01 1B 2B 0C 00 00 16 05 00 04 01 F0 2F 7F 0F 10 00 04 1C 90 2B 30 11 00 D8 18 2B 26 00 38 99 2C 26 16 18 23 00 81 19 10 00 38 99 2C 26 19 00 D8 18 2B 26 05 00 00 01 08 4D 2E 11 08 00 04 61 2F 21 89 08 00 00 16 16 16 18 27 00 81 19 19 2E F0 47 5B 01 1B 2B 0C 00 00 16 05 00 04 01 F0 2F 7F 0F 0C 00 04 1C 58 37 30 11 00 D8 18 2B 26 27 16 16 16 
        aWindow = HUD_OnScreenMessages(mDesktop.GetStdWindow(76));              //00CF : 0F 00 00 07 06 1B 2E 08 F6 31 1D 19 01 48 0C 9D 19 08 00 04 1B 1B 98 00 00 2C 4C 16 
        targetText = aQuest.ParseText(aQuest.Targets[aTargetNr].GetDescription(aProgress),aQuest.Provider,aQuest.Targets[aTargetNr],GetPawn());//00EB : 0F 00 F0 07 06 1B 19 00 D8 18 2B 26 51 00 00 1B D8 0C 00 00 19 10 00 38 99 2C 26 19 00 D8 18 2B 26 05 00 00 01 08 4D 2E 11 0B 00 00 1C 18 D3 2F 11 00 C0 59 07 1B 16 19 00 D8 18 2B 26 05 00 04 01 70 4E 2E 11 10 00 38 99 2C 26 19 00 D8 18 2B 26 05 00 00 01 08 4D 2E 11 1B 2B 0C 00 00 16 16 
        if (aQuest.Targets[aTargetNr].Check(aProgress)) {                       //014B : 07 A7 01 19 10 00 38 99 2C 26 19 00 D8 18 2B 26 05 00 00 01 08 4D 2E 11 0B 00 04 1C 10 22 20 11 00 C0 59 07 1B 16 
          aWindow.AddOnScreenMessage(Class'SBGuiStrings'.default.Completed.Text
            $ ":"
            @ targetText,mCompletedTargetTextColor);//0171 : 19 00 00 07 06 1B 2A 00 00 1B AC 96 00 00 A8 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 E0 98 19 1F 3A 00 16 00 F0 07 06 1B 16 01 A8 32 34 26 16 
        } else {                                                                //01A4 : 06 68 02 
          if (aQuest.Targets[aTargetNr].Failed(aProgress)) {                    //01A7 : 07 03 02 19 10 00 38 99 2C 26 19 00 D8 18 2B 26 05 00 00 01 08 4D 2E 11 0B 00 04 1C 60 1B 20 11 00 C0 59 07 1B 16 
            aWindow.AddOnScreenMessage(Class'SBGuiStrings'.default.Failed.Text
              $ ":"
              @ targetText,mFailedTargetTextColor);//01CD : 19 00 00 07 06 1B 2A 00 00 1B AC 96 00 00 A8 70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B0 9C 99 19 1F 3A 00 16 00 F0 07 06 1B 16 01 20 33 34 26 16 
          } else {                                                              //0200 : 06 68 02 
            if (!aQuest.Targets[aTargetNr].IsA('QT_Wait')
              && !aQuest.Targets[aTargetNr].IsA('QC_Timed')) {//0203 : 07 68 02 82 81 19 10 00 38 99 2C 26 19 00 D8 18 2B 26 05 00 00 01 08 4D 2E 11 08 00 04 61 2F 21 8F 08 00 00 16 16 18 23 00 81 19 10 00 38 99 2C 26 19 00 D8 18 2B 26 05 00 00 01 08 4D 2E 11 08 00 04 61 2F 21 8B 08 00 00 16 16 16 
              aWindow.AddOnScreenMessage(targetText,mInProgressTargetTextColor);//024F : 19 00 00 07 06 1B 10 00 00 1B AC 96 00 00 00 F0 07 06 1B 01 08 50 33 26 16 
            }
          }
        }
      }
    }
    //0F 00 38 5A 07 1B 19 01 F0 87 8A 19 0B 00 04 1B CD 99 00 00 00 D8 18 2B 26 16 07 68 02 99 00 38 
    //5A 07 1B 25 16 07 52 00 9A 19 01 F0 87 8A 19 06 00 04 1B 5D 98 00 00 16 00 38 5A 07 1B 16 19 01 
    //08 52 2B 26 0B 00 00 1B 64 97 00 00 00 D8 18 2B 26 16 07 68 02 82 82 19 19 2E F0 47 5B 01 1B 2B 
    //0C 00 00 16 05 00 04 01 F0 2F 7F 0F 10 00 04 1C 90 2B 30 11 00 D8 18 2B 26 00 38 99 2C 26 16 18 
    //23 00 81 19 10 00 38 99 2C 26 19 00 D8 18 2B 26 05 00 00 01 08 4D 2E 11 08 00 04 61 2F 21 89 08 
    //00 00 16 16 16 18 27 00 81 19 19 2E F0 47 5B 01 1B 2B 0C 00 00 16 05 00 04 01 F0 2F 7F 0F 0C 00 
    //04 1C 58 37 30 11 00 D8 18 2B 26 27 16 16 16 0F 00 00 07 06 1B 2E 08 F6 31 1D 19 01 48 0C 9D 19 
    //08 00 04 1B 1B 98 00 00 2C 4C 16 0F 00 F0 07 06 1B 19 00 D8 18 2B 26 51 00 00 1B D8 0C 00 00 19 
    //10 00 38 99 2C 26 19 00 D8 18 2B 26 05 00 00 01 08 4D 2E 11 0B 00 00 1C 18 D3 2F 11 00 C0 59 07 
    //1B 16 19 00 D8 18 2B 26 05 00 04 01 70 4E 2E 11 10 00 38 99 2C 26 19 00 D8 18 2B 26 05 00 00 01 
    //08 4D 2E 11 1B 2B 0C 00 00 16 16 07 A7 01 19 10 00 38 99 2C 26 19 00 D8 18 2B 26 05 00 00 01 08 
    //4D 2E 11 0B 00 04 1C 10 22 20 11 00 C0 59 07 1B 16 19 00 00 07 06 1B 2A 00 00 1B AC 96 00 00 A8 
    //70 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 E0 98 19 1F 3A 00 16 00 F0 07 06 1B 16 01 A8 
    //32 34 26 16 06 68 02 07 03 02 19 10 00 38 99 2C 26 19 00 D8 18 2B 26 05 00 00 01 08 4D 2E 11 0B 
    //00 04 1C 60 1B 20 11 00 C0 59 07 1B 16 19 00 00 07 06 1B 2A 00 00 1B AC 96 00 00 A8 70 36 58 C6 
    //6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B0 9C 99 19 1F 3A 00 16 00 F0 07 06 1B 16 01 20 33 34 26 16 
    //06 68 02 07 68 02 82 81 19 10 00 38 99 2C 26 19 00 D8 18 2B 26 05 00 00 01 08 4D 2E 11 08 00 04 
    //61 2F 21 8F 08 00 00 16 16 18 23 00 81 19 10 00 38 99 2C 26 19 00 D8 18 2B 26 05 00 00 01 08 4D 
    //2E 11 08 00 04 61 2F 21 8B 08 00 00 16 16 16 19 00 00 07 06 1B 10 00 00 1B AC 96 00 00 00 F0 07 
    //06 1B 01 08 50 33 26 16 04 0B 47 
  }


  event OnComponentDestroyed() {
    local Game_PlayerPawn playerPawn;
    playerPawn = Game_PlayerPawn(GetPawn());                                    //0000 : 0F 00 A8 AB 2C 26 2E F0 47 5B 01 1B 2B 0C 00 00 16 
    if (playerPawn != None) {                                                   //0011 : 07 CA 00 77 00 A8 AB 2C 26 2A 16 
      playerPawn.questLog.__OnAddQuest__Delegate = None;                        //001C : 45 19 19 00 A8 AB 2C 26 05 00 04 01 F0 2F 7F 0F 05 00 08 01 D8 54 30 11 44 00 00 00 00 
      playerPawn.questLog.__OnAddCompletedQuest__Delegate = None;               //0039 : 45 19 19 00 A8 AB 2C 26 05 00 04 01 F0 2F 7F 0F 05 00 08 01 B8 57 30 11 44 00 00 00 00 
      playerPawn.questLog.__OnRemoveQuest__Delegate = None;                     //0056 : 45 19 19 00 A8 AB 2C 26 05 00 04 01 F0 2F 7F 0F 05 00 08 01 30 58 30 11 44 00 00 00 00 
      playerPawn.questLog.__OnQuestProgress__Delegate = None;                   //0073 : 45 19 19 00 A8 AB 2C 26 05 00 04 01 F0 2F 7F 0F 05 00 08 01 A8 58 30 11 44 00 00 00 00 
      playerPawn.questLog.__OnAcceptQuest__Delegate = None;                     //0090 : 45 19 19 00 A8 AB 2C 26 05 00 04 01 F0 2F 7F 0F 05 00 08 01 88 5A 30 11 44 00 00 00 00 
      playerPawn.questLog.__OnFinishQuest__Delegate = None;                     //00AD : 45 19 19 00 A8 AB 2C 26 05 00 04 01 F0 2F 7F 0F 05 00 08 01 00 5B 30 11 44 00 00 00 00 
    }
    Super.OnComponentDestroyed();                                               //00CA : 1C E0 DA 9D 19 16 
    //0F 00 A8 AB 2C 26 2E F0 47 5B 01 1B 2B 0C 00 00 16 07 CA 00 77 00 A8 AB 2C 26 2A 16 45 19 19 00 
    //A8 AB 2C 26 05 00 04 01 F0 2F 7F 0F 05 00 08 01 D8 54 30 11 44 00 00 00 00 45 19 19 00 A8 AB 2C 
    //26 05 00 04 01 F0 2F 7F 0F 05 00 08 01 B8 57 30 11 44 00 00 00 00 45 19 19 00 A8 AB 2C 26 05 00 
    //04 01 F0 2F 7F 0F 05 00 08 01 30 58 30 11 44 00 00 00 00 45 19 19 00 A8 AB 2C 26 05 00 04 01 F0 
    //2F 7F 0F 05 00 08 01 A8 58 30 11 44 00 00 00 00 45 19 19 00 A8 AB 2C 26 05 00 04 01 F0 2F 7F 0F 
    //05 00 08 01 88 5A 30 11 44 00 00 00 00 45 19 19 00 A8 AB 2C 26 05 00 04 01 F0 2F 7F 0F 05 00 08 
    //01 00 5B 30 11 44 00 00 00 00 1C E0 DA 9D 19 16 04 0B 47 
  }


  function SetDelegates() {
    local Game_PlayerPawn playerPawn;
    playerPawn = Game_PlayerPawn(GetPawn());                                    //0000 : 0F 00 D0 AC 2C 26 2E F0 47 5B 01 1B 2B 0C 00 00 16 
    if (playerPawn != None) {                                                   //0011 : 07 CA 00 77 00 D0 AC 2C 26 2A 16 
      playerPawn.questLog.__OnAddQuest__Delegate = AddAcceptedQuest;            //001C : 45 19 19 00 D0 AC 2C 26 05 00 04 01 F0 2F 7F 0F 05 00 08 01 D8 54 30 11 44 CC 99 00 00 
      playerPawn.questLog.__OnAddCompletedQuest__Delegate = OnAddCompletedQuest;//0039 : 45 19 19 00 D0 AC 2C 26 05 00 04 01 F0 2F 7F 0F 05 00 08 01 B8 57 30 11 44 B1 05 00 00 
      playerPawn.questLog.__OnRemoveQuest__Delegate = RemoveQuest;              //0056 : 45 19 19 00 D0 AC 2C 26 05 00 04 01 F0 2F 7F 0F 05 00 08 01 30 58 30 11 44 BC 19 00 00 
      playerPawn.questLog.__OnQuestProgress__Delegate = OnQuestProgress;        //0073 : 45 19 19 00 D0 AC 2C 26 05 00 04 01 F0 2F 7F 0F 05 00 08 01 A8 58 30 11 44 E0 05 00 00 
      playerPawn.questLog.__OnAcceptQuest__Delegate = OnAcceptQuest;            //0090 : 45 19 19 00 D0 AC 2C 26 05 00 04 01 F0 2F 7F 0F 05 00 08 01 88 5A 30 11 44 AF 05 00 00 
      playerPawn.questLog.__OnFinishQuest__Delegate = OnFinishQuest;            //00AD : 45 19 19 00 D0 AC 2C 26 05 00 04 01 F0 2F 7F 0F 05 00 08 01 00 5B 30 11 44 C7 05 00 00 
    }
    //0F 00 D0 AC 2C 26 2E F0 47 5B 01 1B 2B 0C 00 00 16 07 CA 00 77 00 D0 AC 2C 26 2A 16 45 19 19 00 
    //D0 AC 2C 26 05 00 04 01 F0 2F 7F 0F 05 00 08 01 D8 54 30 11 44 CC 99 00 00 45 19 19 00 D0 AC 2C 
    //26 05 00 04 01 F0 2F 7F 0F 05 00 08 01 B8 57 30 11 44 B1 05 00 00 45 19 19 00 D0 AC 2C 26 05 00 
    //04 01 F0 2F 7F 0F 05 00 08 01 30 58 30 11 44 BC 19 00 00 45 19 19 00 D0 AC 2C 26 05 00 04 01 F0 
    //2F 7F 0F 05 00 08 01 A8 58 30 11 44 E0 05 00 00 45 19 19 00 D0 AC 2C 26 05 00 04 01 F0 2F 7F 0F 
    //05 00 08 01 88 5A 30 11 44 AF 05 00 00 45 19 19 00 D0 AC 2C 26 05 00 04 01 F0 2F 7F 0F 05 00 08 
    //01 00 5B 30 11 44 C7 05 00 00 04 0B 47 
  }


  event Initialize() {
    local GED_Editor Editor;
    mWidth = 665.00000000;                                                      //0000 : 0F 01 60 87 31 16 1E 00 40 26 44 
    mHeight = 473.00000000;                                                     //000B : 0F 01 40 88 31 16 1E 00 80 EC 43 
    mTop = 100.00000000;                                                        //0016 : 0F 01 80 86 31 16 1E 00 00 C8 42 
    mLeft = 5.00000000;                                                         //0021 : 0F 01 08 86 31 16 1E 00 00 A0 40 
    Super.Initialize();                                                         //002C : 1C 28 9E 9E 19 16 
    SetMinBounds(0.00000000,0.00000000,mWidth,mHeight);                         //0032 : 1B 59 98 00 00 1E 00 00 00 00 1E 00 00 00 00 01 60 87 31 16 01 40 88 31 16 16 
    SetMaxBounds(0.00000000,0.00000000,mWidth,mHeight);                         //004C : 1B E0 98 00 00 1E 00 00 00 00 1E 00 00 00 00 01 60 87 31 16 01 40 88 31 16 16 
    Editor = GED_Editor(mDesktop.GetStdWindow(Class'GUI_BaseDesktop'.45));      //0066 : 0F 00 48 D3 2C 26 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 20 00 68 D7 00 02 00 04 2C 2D 16 
    Editor.Attach(self,"Quests\QuestLog.txt");                                  //008B : 19 00 48 D3 2C 26 1C 00 00 1B 3F 01 00 00 17 1F 51 75 65 73 74 73 5C 51 75 65 73 74 4C 6F 67 2E 74 78 74 00 16 
    mAcceptedPageQuests = GUI_TreeCtrl(Editor.RetrieveComponent("mAcceptedPageQuests"));//00B0 : 0F 01 F0 87 8A 19 2E 60 7E 2F 1D 19 00 48 D3 2C 26 1B 00 04 1B 15 98 00 00 1F 6D 41 63 63 65 70 74 65 64 50 61 67 65 51 75 65 73 74 73 00 16 
    mAcceptedPageQuests.__OnItemSelect__Delegate = HandleItemSelect;            //00DF : 45 19 01 F0 87 8A 19 05 00 08 01 20 40 A3 19 44 E3 98 00 00 
    mAcceptedPageQuests.HideRoot(True);                                         //00F3 : 19 01 F0 87 8A 19 07 00 00 1B EA 98 00 00 27 16 
    mCompletedPageQuests = GUI_TreeCtrl(Editor.RetrieveComponent("mCompletedPageQuests"));//0103 : 0F 01 18 54 EC 25 2E 60 7E 2F 1D 19 00 48 D3 2C 26 1C 00 04 1B 15 98 00 00 1F 6D 43 6F 6D 70 6C 65 74 65 64 50 61 67 65 51 75 65 73 74 73 00 16 
    mCompletedPageQuests.__OnItemSelect__Delegate = HandleItemSelect;           //0133 : 45 19 01 18 54 EC 25 05 00 08 01 20 40 A3 19 44 E3 98 00 00 
    mCompletedPageQuests.HideRoot(True);                                        //0147 : 19 01 18 54 EC 25 07 00 00 1B EA 98 00 00 27 16 
    mTabCtrl = GUI_TabCtrl(Editor.RetrieveComponent("mTabCtrl"));               //0157 : 0F 01 A8 B7 2C 26 2E A0 6E 2F 1D 19 00 48 D3 2C 26 10 00 04 1B 15 98 00 00 1F 6D 54 61 62 43 74 72 6C 00 16 
    mTabCtrl.SetTabTitle(Class'SBGuiStrings'.default.Completed.Text);           //017B : 19 01 A8 B7 2C 26 19 00 00 1B 6C 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 E0 98 19 16 
    mTabCtrl.SetSelectedPage(mAcceptedPageQuests);                              //019D : 19 01 A8 B7 2C 26 0B 00 00 1B 4C 98 00 00 01 F0 87 8A 19 16 
    mTabCtrl.SetTabTitle(Class'SBGuiStrings'.default.Accepted.Text);            //01B1 : 19 01 A8 B7 2C 26 19 00 00 1B 6C 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 30 BA 98 19 16 
    mAbandonQuestButton = GUI_Button(Editor.RetrieveComponent("mAbandonQuestButton"));//01D3 : 0F 01 C8 CF 2B 26 2E 78 F0 2E 1D 19 00 48 D3 2C 26 1B 00 04 1B 15 98 00 00 1F 6D 41 62 61 6E 64 6F 6E 51 75 65 73 74 42 75 74 74 6F 6E 00 16 
    mAbandonQuestButton.__OnClick__Delegate = AbandonQuestClick;                //0202 : 45 19 01 C8 CF 2B 26 05 00 08 01 98 EB 9D 19 44 C0 9A 00 00 
    mAbandonQuestButton.SetEnabled(False);                                      //0216 : 19 01 C8 CF 2B 26 07 00 00 1B 5F 32 00 00 28 16 
    mQuestPage = HUD_QuestLogPage(Editor.RetrieveComponent("mQuestPage"));      //0226 : 0F 01 08 52 2B 26 2E 30 E9 30 1D 19 00 48 D3 2C 26 12 00 04 1B 15 98 00 00 1F 6D 51 75 65 73 74 50 61 67 65 00 16 
    mTabCtrl.__OnTabChanged__Delegate = OnTabChanged;                           //024C : 45 19 01 A8 B7 2C 26 05 00 08 01 48 93 A2 19 44 25 97 00 00 
    __OnTick__Delegate = Tick;                                                  //0260 : 45 01 70 E6 9D 19 44 50 01 00 00 
    mQuestAreaNames.Insert(0,mAncestralAreasIndex);                             //026B : 40 01 50 5D 2B 26 25 01 A8 5F 33 26 
    mQuestAreaNames[0] = "Tech";                                                //0277 : 0F 10 25 01 50 5D 2B 26 1F 54 65 63 68 00 
    mQuestAreaNames[1] = Class'SBGuiStrings'.default.Carnyx.Text;               //0285 : 0F 10 26 01 50 5D 2B 26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E8 C5 98 19 
    mQuestAreaNames[2] = Class'SBGuiStrings'.default.Quarterstone.Text;         //02A0 : 0F 10 2C 02 01 50 5D 2B 26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 58 3E 98 19 
    mQuestAreaNames[3] = Class'SBGuiStrings'.default.Ringfell.Text;             //02BC : 0F 10 2C 03 01 50 5D 2B 26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 65 98 19 
    mQuestAreaNames[4] = Class'SBGuiStrings'.default.Mount_of_Heroes.Text;      //02D8 : 0F 10 2C 04 01 50 5D 2B 26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 98 98 19 
    mQuestAreaNames[5] = Class'SBGuiStrings'.default.Parliament.Text;           //02F4 : 0F 10 2C 05 01 50 5D 2B 26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 18 D2 98 19 
    mQuestAreaNames[6] = Class'SBGuiStrings'.default.Dead_Spell_Storm.Text;     //0310 : 0F 10 2C 06 01 50 5D 2B 26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 B0 98 98 19 
    InitializeTreeView();                                                       //032C : 1B D4 99 00 00 16 
    __OnMBClick__Delegate = MBClickHandler;                                     //0332 : 45 01 B8 E9 9D 19 44 2D 98 00 00 
    //0F 01 60 87 31 16 1E 00 40 26 44 0F 01 40 88 31 16 1E 00 80 EC 43 0F 01 80 86 31 16 1E 00 00 C8 
    //42 0F 01 08 86 31 16 1E 00 00 A0 40 1C 28 9E 9E 19 16 1B 59 98 00 00 1E 00 00 00 00 1E 00 00 00 
    //00 01 60 87 31 16 01 40 88 31 16 16 1B E0 98 00 00 1E 00 00 00 00 1E 00 00 00 00 01 60 87 31 16 
    //01 40 88 31 16 16 0F 00 48 D3 2C 26 2E D8 2F 32 1D 19 01 48 0C 9D 19 11 00 04 1B 1B 98 00 00 12 
    //20 00 68 D7 00 02 00 04 2C 2D 16 19 00 48 D3 2C 26 1C 00 00 1B 3F 01 00 00 17 1F 51 75 65 73 74 
    //73 5C 51 75 65 73 74 4C 6F 67 2E 74 78 74 00 16 0F 01 F0 87 8A 19 2E 60 7E 2F 1D 19 00 48 D3 2C 
    //26 1B 00 04 1B 15 98 00 00 1F 6D 41 63 63 65 70 74 65 64 50 61 67 65 51 75 65 73 74 73 00 16 45 
    //19 01 F0 87 8A 19 05 00 08 01 20 40 A3 19 44 E3 98 00 00 19 01 F0 87 8A 19 07 00 00 1B EA 98 00 
    //00 27 16 0F 01 18 54 EC 25 2E 60 7E 2F 1D 19 00 48 D3 2C 26 1C 00 04 1B 15 98 00 00 1F 6D 43 6F 
    //6D 70 6C 65 74 65 64 50 61 67 65 51 75 65 73 74 73 00 16 45 19 01 18 54 EC 25 05 00 08 01 20 40 
    //A3 19 44 E3 98 00 00 19 01 18 54 EC 25 07 00 00 1B EA 98 00 00 27 16 0F 01 A8 B7 2C 26 2E A0 6E 
    //2F 1D 19 00 48 D3 2C 26 10 00 04 1B 15 98 00 00 1F 6D 54 61 62 43 74 72 6C 00 16 19 01 A8 B7 2C 
    //26 19 00 00 1B 6C 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 A0 E0 98 19 16 19 01 A8 
    //B7 2C 26 0B 00 00 1B 4C 98 00 00 01 F0 87 8A 19 16 19 01 A8 B7 2C 26 19 00 00 1B 6C 98 00 00 36 
    //58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 30 BA 98 19 16 0F 01 C8 CF 2B 26 2E 78 F0 2E 1D 19 00 
    //48 D3 2C 26 1B 00 04 1B 15 98 00 00 1F 6D 41 62 61 6E 64 6F 6E 51 75 65 73 74 42 75 74 74 6F 6E 
    //00 16 45 19 01 C8 CF 2B 26 05 00 08 01 98 EB 9D 19 44 C0 9A 00 00 19 01 C8 CF 2B 26 07 00 00 1B 
    //5F 32 00 00 28 16 0F 01 08 52 2B 26 2E 30 E9 30 1D 19 00 48 D3 2C 26 12 00 04 1B 15 98 00 00 1F 
    //6D 51 75 65 73 74 50 61 67 65 00 16 45 19 01 A8 B7 2C 26 05 00 08 01 48 93 A2 19 44 25 97 00 00 
    //45 01 70 E6 9D 19 44 50 01 00 00 40 01 50 5D 2B 26 25 01 A8 5F 33 26 0F 10 25 01 50 5D 2B 26 1F 
    //54 65 63 68 00 0F 10 26 01 50 5D 2B 26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 E8 C5 98 19 
    //0F 10 2C 02 01 50 5D 2B 26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 58 3E 98 19 0F 10 2C 03 
    //01 50 5D 2B 26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 98 65 98 19 0F 10 2C 04 01 50 5D 2B 
    //26 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 38 98 98 19 0F 10 2C 05 01 50 5D 2B 26 36 58 C6 
    //6B 0F 12 20 70 4B 32 1D 05 00 0C 02 18 D2 98 19 0F 10 2C 06 01 50 5D 2B 26 36 58 C6 6B 0F 12 20 
    //70 4B 32 1D 05 00 0C 02 B0 98 98 19 1B D4 99 00 00 16 45 01 B8 E9 9D 19 44 2D 98 00 00 04 0B 47 
    //
  }



