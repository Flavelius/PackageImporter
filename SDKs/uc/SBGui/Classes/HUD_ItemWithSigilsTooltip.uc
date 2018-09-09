//==============================================================================
//  HUD_ItemWithSigilsTooltip
//==============================================================================

class HUD_ItemWithSigilsTooltip extends HUD_ItemTooltip
    dependsOn(GUI_Page,HUD_ShopSigilItemContainer,IC_TokenSlot,GUI_Label,GUI_TextCtrl)
    Transient
    Config(User)
  ;

  var GUI_Page mSigils;
  var Color mSigilColorAvailable;
  var Color mSigilColorNotAvailable;
  var int mCurrentFameLevel;


  function AddSigils() {
    local int i;
    local int SlotCount;
    local float lWidth;
    local export editinline IC_TokenSlot slotComp;
    local GUI_Page lSigilSlots;
    local GUI_Page lSigilInfo;
    local GUI_Page lInfoPage;
    local HUD_ShopSigilItemContainer lContainer;
    local GUI_Label lInfoNum;
    local GUI_TextCtrl lInfoText;
    local Game_Item lTokenItem;
    SlotCount = mItem.GetTokenSlotCount();                                      //0000 : 0F 00 C0 D9 04 1B 19 01 F8 22 EC 25 06 00 04 1C E8 35 2C 11 16 
    if (SlotCount > 0) {                                                        //0015 : 07 C3 04 97 00 C0 D9 04 1B 25 16 
      slotComp = IC_TokenSlot(mItem.Type.GetComponentByClass(Class'IC_TokenSlot'));//0020 : 0F 00 18 EE 33 26 2E F8 1F 5C 01 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 0B 00 04 1C 00 31 22 11 20 F8 1F 5C 01 16 
      mSigils = CreatePage("GUI_Page",0,0,0,mHeight,GetClientWidth(),0);        //0048 : 0F 01 98 0B 2B 26 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 39 44 01 40 88 31 16 39 44 1B 17 98 00 00 16 25 16 
      mSigils.SetBorder(0,6,0,0);                                               //0071 : 19 01 98 0B 2B 26 0B 00 00 1B 2B 98 00 00 25 2C 06 25 25 16 
      lWidth = SlotCount * (40 + 6) - 6;                                        //0085 : 0F 00 08 94 07 1B AF 39 3F 90 00 C0 D9 04 1B 92 2C 28 2C 06 16 16 39 3F 2C 06 16 
      lSigilSlots = mSigils.CreatePage("GUI_Page",0,0,(mSigils.GetClientWidth() - lWidth) / 2,0,lWidth,40);//00A0 : 0F 00 70 95 07 1B 19 01 98 0B 2B 26 38 00 04 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 91 39 44 AF 19 01 98 0B 2B 26 06 00 04 1B 17 98 00 00 16 00 08 94 07 1B 16 2C 02 16 25 39 44 00 08 94 07 1B 2C 28 16 
      UpdateHeight(mSigils,lSigilSlots,6.00000000);                             //00E7 : 1B 45 98 00 00 01 98 0B 2B 26 00 70 95 07 1B 1E 00 00 C0 40 16 
      lSigilInfo = mSigils.CreatePage("GUI_Page",0,0,0,mSigils.mHeight,mSigils.GetClientWidth(),0);//00FC : 0F 00 F8 DA 2C 26 19 01 98 0B 2B 26 35 00 04 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 39 44 19 01 98 0B 2B 26 05 00 04 01 40 88 31 16 39 44 19 01 98 0B 2B 26 06 00 04 1B 17 98 00 00 16 25 16 
      i = 0;                                                                    //0140 : 0F 00 20 97 2C 26 25 
      while (i < SlotCount) {                                                   //0147 : 07 B3 04 96 00 20 97 2C 26 00 C0 D9 04 1B 16 
        lContainer = HUD_ShopSigilItemContainer(lSigilSlots.CreateButton("HUD_ShopSigilItemContainer",524288,0,i * (40 + 6),0,40,40));//0156 : 0F 00 60 96 07 1B 2E F0 CE 30 1D 19 00 70 95 07 1B 3A 00 04 1B 18 98 00 00 1F 48 55 44 5F 53 68 6F 70 53 69 67 69 6C 49 74 65 6D 43 6F 6E 74 61 69 6E 65 72 00 1D 00 00 08 00 25 90 00 20 97 2C 26 92 2C 28 2C 06 16 16 25 2C 28 2C 28 16 
        lContainer.SetSlotType(slotComp.slots[i].SlotType);                     //01A4 : 19 00 60 96 07 1B 1F 00 00 1B DB 99 00 00 36 28 03 3A 11 10 00 20 97 2C 26 19 00 18 EE 33 26 05 00 00 01 E8 FF 39 11 16 
        lInfoPage = lSigilInfo.CreatePage("GUI_Page",0,0,0,lSigilInfo.mHeight,lSigilInfo.GetClientWidth(),0);//01CC : 0F 00 70 DB 2C 26 19 00 F8 DA 2C 26 35 00 04 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 39 44 19 00 F8 DA 2C 26 05 00 04 01 40 88 31 16 39 44 19 00 F8 DA 2C 26 06 00 04 1B 17 98 00 00 16 25 16 
        lInfoPage.SetSolidBackground(255.00000000,255.00000000,255.00000000,38.00000000);//0210 : 19 00 70 DB 2C 26 1A 00 00 1B 52 98 00 00 1E 00 00 7F 43 1E 00 00 7F 43 1E 00 00 7F 43 1E 00 00 18 42 16 
        lInfoNum = lInfoPage.CreateLabel("GUI_Label",524288,4096 | 256,0,0,15,15);//0233 : 0F 00 90 3A 06 1B 19 00 70 DB 2C 26 28 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 9E 1D 00 10 00 00 1D 00 01 00 00 16 25 25 2C 0F 2C 0F 16 
        lInfoNum.SetText("" @ string(i + 1));                                   //026A : 19 00 90 3A 06 1B 14 00 00 1B 13 98 00 00 A8 1F 00 39 53 92 00 20 97 2C 26 26 16 16 16 
        lInfoText = GUI_TextCtrl(lInfoPage.CreatePage("GUI_TextCtrl",0,4096 | 256,15,0,GetClientWidth() - 15,0));//0287 : 0F 00 18 65 04 1B 2E 20 79 2F 1D 19 00 70 DB 2C 26 33 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 9E 1D 00 10 00 00 1D 00 01 00 00 16 2C 0F 25 39 44 AF 1B 17 98 00 00 16 39 3F 2C 0F 16 25 16 
        lTokenItem = mItem.GetToken(i);                                         //02CE : 0F 00 70 3C 06 1B 19 01 F8 22 EC 25 0B 00 04 1C 40 37 2C 11 00 20 97 2C 26 16 
        if (lTokenItem != None) {                                               //02E8 : 07 BF 03 77 00 70 3C 06 1B 2A 16 
          if (GetPawn() != None) {                                              //02F3 : 07 13 03 77 1B 2B 0C 00 00 16 2A 16 
            lContainer.SetItem(lTokenItem);                                     //02FF : 19 00 60 96 07 1B 0B 00 00 1B 4A 97 00 00 00 70 3C 06 1B 16 
          }
          lInfoNum.SetColor(mSigilColorAvailable.R,mSigilColorAvailable.G,mSigilColorAvailable.B,mSigilColorAvailable.A);//0313 : 19 00 90 3A 06 1B 36 00 00 1B 19 98 00 00 39 3A 36 D0 90 6A 0F 01 C8 3B 2B 26 39 3A 36 58 90 6A 0F 01 C8 3B 2B 26 39 3A 36 E0 8F 6A 0F 01 C8 3B 2B 26 39 3A 36 48 91 6A 0F 01 C8 3B 2B 26 16 
          lInfoText.SetColor(mSigilColorAvailable.R,mSigilColorAvailable.G,mSigilColorAvailable.B,mSigilColorAvailable.A);//0352 : 19 00 18 65 04 1B 36 00 00 1B 19 98 00 00 39 3A 36 D0 90 6A 0F 01 C8 3B 2B 26 39 3A 36 58 90 6A 0F 01 C8 3B 2B 26 39 3A 36 E0 8F 6A 0F 01 C8 3B 2B 26 39 3A 36 48 91 6A 0F 01 C8 3B 2B 26 16 
          lInfoText.SetText(lTokenItem.Type.Description.Text);                  //0391 : 19 00 18 65 04 1B 22 00 00 1B 13 98 00 00 36 58 C6 6B 0F 19 19 00 70 3C 06 1B 05 00 04 01 98 2F 22 11 05 00 0C 01 B0 F2 2B 11 16 
        } else {                                                                //03BC : 06 5F 04 
          lInfoNum.SetColor(mSigilColorAvailable.R,mSigilColorAvailable.G,mSigilColorAvailable.B,mSigilColorAvailable.A);//03BF : 19 00 90 3A 06 1B 36 00 00 1B 19 98 00 00 39 3A 36 D0 90 6A 0F 01 C8 3B 2B 26 39 3A 36 58 90 6A 0F 01 C8 3B 2B 26 39 3A 36 E0 8F 6A 0F 01 C8 3B 2B 26 39 3A 36 48 91 6A 0F 01 C8 3B 2B 26 16 
          lInfoText.SetColor(mSigilColorNotAvailable.R,mSigilColorNotAvailable.G,mSigilColorNotAvailable.B,mSigilColorNotAvailable.A);//03FE : 19 00 18 65 04 1B 36 00 00 1B 19 98 00 00 39 3A 36 D0 90 6A 0F 01 D8 20 06 1B 39 3A 36 58 90 6A 0F 01 D8 20 06 1B 39 3A 36 E0 8F 6A 0F 01 D8 20 06 1B 39 3A 36 48 91 6A 0F 01 D8 20 06 1B 16 
          lInfoText.SetText(Class'SBGuiStrings'.default.Slot_Empty.Text);       //043D : 19 00 18 65 04 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 8F 99 19 16 
        }
        UpdateHeight(lInfoPage,lInfoText);                                      //045F : 1B 45 98 00 00 00 70 DB 2C 26 00 18 65 04 1B 16 
        if (i == SlotCount - 1) {                                               //046F : 07 94 04 9A 00 20 97 2C 26 93 00 C0 D9 04 1B 26 16 16 
          UpdateHeight(lSigilInfo,lInfoPage);                                   //0481 : 1B 45 98 00 00 00 F8 DA 2C 26 00 70 DB 2C 26 16 
        } else {                                                                //0491 : 06 A9 04 
          UpdateHeight(lSigilInfo,lInfoPage,1.00000000);                        //0494 : 1B 45 98 00 00 00 F8 DA 2C 26 00 70 DB 2C 26 1E 00 00 80 3F 16 
        }
        i++;                                                                    //04A9 : A5 00 20 97 2C 26 16 
      }
      UpdateHeight(mSigils,lSigilInfo);                                         //04B3 : 1B 45 98 00 00 01 98 0B 2B 26 00 F8 DA 2C 26 16 
    }
    UpdateHeight(self,mSigils,9.00000000);                                      //04C3 : 1B 45 98 00 00 17 01 98 0B 2B 26 1E 00 00 10 41 16 
    //0F 00 C0 D9 04 1B 19 01 F8 22 EC 25 06 00 04 1C E8 35 2C 11 16 07 C3 04 97 00 C0 D9 04 1B 25 16 
    //0F 00 18 EE 33 26 2E F8 1F 5C 01 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 0B 00 04 1C 00 31 
    //22 11 20 F8 1F 5C 01 16 0F 01 98 0B 2B 26 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 
    //39 44 01 40 88 31 16 39 44 1B 17 98 00 00 16 25 16 19 01 98 0B 2B 26 0B 00 00 1B 2B 98 00 00 25 
    //2C 06 25 25 16 0F 00 08 94 07 1B AF 39 3F 90 00 C0 D9 04 1B 92 2C 28 2C 06 16 16 39 3F 2C 06 16 
    //0F 00 70 95 07 1B 19 01 98 0B 2B 26 38 00 04 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 
    //91 39 44 AF 19 01 98 0B 2B 26 06 00 04 1B 17 98 00 00 16 00 08 94 07 1B 16 2C 02 16 25 39 44 00 
    //08 94 07 1B 2C 28 16 1B 45 98 00 00 01 98 0B 2B 26 00 70 95 07 1B 1E 00 00 C0 40 16 0F 00 F8 DA 
    //2C 26 19 01 98 0B 2B 26 35 00 04 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 39 44 19 
    //01 98 0B 2B 26 05 00 04 01 40 88 31 16 39 44 19 01 98 0B 2B 26 06 00 04 1B 17 98 00 00 16 25 16 
    //0F 00 20 97 2C 26 25 07 B3 04 96 00 20 97 2C 26 00 C0 D9 04 1B 16 0F 00 60 96 07 1B 2E F0 CE 30 
    //1D 19 00 70 95 07 1B 3A 00 04 1B 18 98 00 00 1F 48 55 44 5F 53 68 6F 70 53 69 67 69 6C 49 74 65 
    //6D 43 6F 6E 74 61 69 6E 65 72 00 1D 00 00 08 00 25 90 00 20 97 2C 26 92 2C 28 2C 06 16 16 25 2C 
    //28 2C 28 16 19 00 60 96 07 1B 1F 00 00 1B DB 99 00 00 36 28 03 3A 11 10 00 20 97 2C 26 19 00 18 
    //EE 33 26 05 00 00 01 E8 FF 39 11 16 0F 00 70 DB 2C 26 19 00 F8 DA 2C 26 35 00 04 1B 16 98 00 00 
    //1F 47 55 49 5F 50 61 67 65 00 25 25 25 39 44 19 00 F8 DA 2C 26 05 00 04 01 40 88 31 16 39 44 19 
    //00 F8 DA 2C 26 06 00 04 1B 17 98 00 00 16 25 16 19 00 70 DB 2C 26 1A 00 00 1B 52 98 00 00 1E 00 
    //00 7F 43 1E 00 00 7F 43 1E 00 00 7F 43 1E 00 00 18 42 16 0F 00 90 3A 06 1B 19 00 70 DB 2C 26 28 
    //00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 9E 1D 00 10 00 00 1D 00 01 
    //00 00 16 25 25 2C 0F 2C 0F 16 19 00 90 3A 06 1B 14 00 00 1B 13 98 00 00 A8 1F 00 39 53 92 00 20 
    //97 2C 26 26 16 16 16 0F 00 18 65 04 1B 2E 20 79 2F 1D 19 00 70 DB 2C 26 33 00 04 1B 16 98 00 00 
    //1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 9E 1D 00 10 00 00 1D 00 01 00 00 16 2C 0F 25 39 44 
    //AF 1B 17 98 00 00 16 39 3F 2C 0F 16 25 16 0F 00 70 3C 06 1B 19 01 F8 22 EC 25 0B 00 04 1C 40 37 
    //2C 11 00 20 97 2C 26 16 07 BF 03 77 00 70 3C 06 1B 2A 16 07 13 03 77 1B 2B 0C 00 00 16 2A 16 19 
    //00 60 96 07 1B 0B 00 00 1B 4A 97 00 00 00 70 3C 06 1B 16 19 00 90 3A 06 1B 36 00 00 1B 19 98 00 
    //00 39 3A 36 D0 90 6A 0F 01 C8 3B 2B 26 39 3A 36 58 90 6A 0F 01 C8 3B 2B 26 39 3A 36 E0 8F 6A 0F 
    //01 C8 3B 2B 26 39 3A 36 48 91 6A 0F 01 C8 3B 2B 26 16 19 00 18 65 04 1B 36 00 00 1B 19 98 00 00 
    //39 3A 36 D0 90 6A 0F 01 C8 3B 2B 26 39 3A 36 58 90 6A 0F 01 C8 3B 2B 26 39 3A 36 E0 8F 6A 0F 01 
    //C8 3B 2B 26 39 3A 36 48 91 6A 0F 01 C8 3B 2B 26 16 19 00 18 65 04 1B 22 00 00 1B 13 98 00 00 36 
    //58 C6 6B 0F 19 19 00 70 3C 06 1B 05 00 04 01 98 2F 22 11 05 00 0C 01 B0 F2 2B 11 16 06 5F 04 19 
    //00 90 3A 06 1B 36 00 00 1B 19 98 00 00 39 3A 36 D0 90 6A 0F 01 C8 3B 2B 26 39 3A 36 58 90 6A 0F 
    //01 C8 3B 2B 26 39 3A 36 E0 8F 6A 0F 01 C8 3B 2B 26 39 3A 36 48 91 6A 0F 01 C8 3B 2B 26 16 19 00 
    //18 65 04 1B 36 00 00 1B 19 98 00 00 39 3A 36 D0 90 6A 0F 01 D8 20 06 1B 39 3A 36 58 90 6A 0F 01 
    //D8 20 06 1B 39 3A 36 E0 8F 6A 0F 01 D8 20 06 1B 39 3A 36 48 91 6A 0F 01 D8 20 06 1B 16 19 00 18 
    //65 04 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 10 8F 99 19 16 1B 
    //45 98 00 00 00 70 DB 2C 26 00 18 65 04 1B 16 07 94 04 9A 00 20 97 2C 26 93 00 C0 D9 04 1B 26 16 
    //16 1B 45 98 00 00 00 F8 DA 2C 26 00 70 DB 2C 26 16 06 A9 04 1B 45 98 00 00 00 F8 DA 2C 26 00 70 
    //DB 2C 26 1E 00 00 80 3F 16 A5 00 20 97 2C 26 16 06 47 01 1B 45 98 00 00 01 98 0B 2B 26 00 F8 DA 
    //2C 26 16 1B 45 98 00 00 17 01 98 0B 2B 26 1E 00 00 10 41 16 04 0B 47 
  }


  event bool ShouldUpdate() {
    if (Super.ShouldUpdate()) {                                                 //0000 : 07 0B 00 1C C8 2B 06 1B 16 
      return True;                                                              //0009 : 04 27 
    }
    return mCurrentFameLevel != GetPawn().CharacterStats.mRecord.FameLevel;     //000B : 04 9B 01 80 EF 33 26 36 00 2D 34 0F 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 16 
    //07 0B 00 1C C8 2B 06 1B 16 04 27 04 9B 01 80 EF 33 26 36 00 2D 34 0F 19 19 1B 2B 0C 00 00 16 05 
    //00 04 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 16 04 0B 47 
  }


  function bool UpdateTooltipInfo() {
    if (mItem != None) {                                                        //0000 : 07 C6 00 77 01 F8 22 EC 25 2A 16 
      if (ContextMenuOpen()) {                                                  //000B : 07 16 00 1B 96 98 00 00 16 
        return False;                                                           //0014 : 04 28 
      }
      AddHeader(mItem.Type.GetName(),GetLevelString(),GetAttuned(),mItem.Type.GetTypeName(),mItem.Type.GetRarityColor(),GetLevelColor());//0016 : 1B 3C 98 00 00 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 00 1B F9 03 00 00 16 1B D1 98 00 00 16 1B BD 99 00 00 16 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 00 1B 0D 1A 00 00 16 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 04 1B 7B 05 00 00 16 1B D0 98 00 00 16 16 
      AddDescription(mItem.Type.Description.Text);                              //0076 : 1B 48 98 00 00 36 58 C6 6B 0F 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 05 00 0C 01 B0 F2 2B 11 16 
      AddSigils();                                                              //0098 : 1B 1F 9A 00 00 16 
      mCurrentFameLevel = GetPawn().CharacterStats.mRecord.FameLevel;           //009E : 0F 01 80 EF 33 26 36 00 2D 34 0F 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 43 34 0F 05 00 68 01 78 2D 34 0F 
      return True;                                                              //00C1 : 04 27 
    } else {                                                                    //00C3 : 06 C8 00 
      return False;                                                             //00C6 : 04 28 
    }
    //07 C6 00 77 01 F8 22 EC 25 2A 16 07 16 00 1B 96 98 00 00 16 04 28 1B 3C 98 00 00 19 19 01 F8 22 
    //EC 25 05 00 04 01 98 2F 22 11 06 00 00 1B F9 03 00 00 16 1B D1 98 00 00 16 1B BD 99 00 00 16 19 
    //19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 00 1B 0D 1A 00 00 16 19 19 01 F8 22 EC 25 05 00 
    //04 01 98 2F 22 11 06 00 04 1B 7B 05 00 00 16 1B D0 98 00 00 16 16 1B 48 98 00 00 36 58 C6 6B 0F 
    //19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 05 00 0C 01 B0 F2 2B 11 16 1B 1F 9A 00 00 16 0F 01 
    //80 EF 33 26 36 00 2D 34 0F 19 19 1B 2B 0C 00 00 16 05 00 04 01 08 43 34 0F 05 00 68 01 78 2D 34 
    //0F 04 27 06 C8 00 04 28 04 0B 47 
  }


  function ResetObjectTooltip() {
    if (mSigils != None) {                                                      //0000 : 07 1D 00 77 01 98 0B 2B 26 2A 16 
      DestroyComponent(mSigils);                                                //000B : 1B 4D 98 00 00 01 98 0B 2B 26 16 
      mSigils = None;                                                           //0016 : 0F 01 98 0B 2B 26 2A 
    }
    Super.ResetObjectTooltip();                                                 //001D : 1C 20 0D A6 19 16 
    //07 1D 00 77 01 98 0B 2B 26 2A 16 1B 4D 98 00 00 01 98 0B 2B 26 16 0F 01 98 0B 2B 26 2A 1C 20 0D 
    //A6 19 16 04 0B 47 
  }



