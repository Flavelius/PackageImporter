//==============================================================================
//  HUD_ItemRecipeTooltip
//==============================================================================

class HUD_ItemRecipeTooltip extends HUD_ItemTooltip
    dependsOn(GUI_Page,GUI_Label,IC_Recipe,Game_ItemManager,GUI_BaseDesktop,GUI_Button,GUI_TextCtrl,HUD_MoneyPage)
    Transient
    Config(User)
  ;

  const RES_BUTTON_WIDTH_OFFSET =  5;
  const RES_HEIGHT_OFFSET =  1;
  var export editinline IC_Recipe mRecipe;
  var GUI_Page mResourcesPage;


  function AddNeededResources() {
    local GUI_Page lResourcePage;
    local GUI_Page lMoneyPage;
    local GUI_Label lResourceLabel;
    local GUI_Label lMoneyText;
    local GUI_Button lResourceButton;
    local GUI_TextCtrl lResourceText;
    local HUD_MoneyPage lMoney;
    local export editinline Game_ItemManager itemManager;
    local int i;
    local int lAmount;
    itemManager = GetPawn().itemManager;                                        //0000 : 0F 00 C0 8D 07 1B 19 1B 2B 0C 00 00 16 05 00 04 01 B0 2D 19 11 
    if (itemManager != None) {                                                  //0015 : 07 7D 06 77 00 C0 8D 07 1B 2A 16 
      mResourcesPage = CreatePage("GUI_Page",0,0,0,mHeight,GetClientWidth(),0); //0020 : 0F 01 40 2A 2C 26 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 39 44 01 40 88 31 16 39 44 1B 17 98 00 00 16 25 16 
      lResourceLabel = mResourcesPage.CreateLabel("GUI_Label",524288,256,0,0,mResourcesPage.GetClientWidth(),20);//0049 : 0F 00 B8 1B 06 1B 19 01 40 2A 2C 26 30 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 1D 00 01 00 00 25 25 39 44 19 01 40 2A 2C 26 06 00 04 1B 17 98 00 00 16 2C 14 16 
      lResourceLabel.SetBorder(4,0,0,0);                                        //0088 : 19 00 B8 1B 06 1B 0B 00 00 1B 2B 98 00 00 2C 04 25 25 25 16 
      lResourceLabel.SetText(Class'SBGuiStrings'.default.Necessary_resources_.Text);//009C : 19 00 B8 1B 06 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 50 8B 99 19 16 
      UpdateHeight(mResourcesPage,lResourceLabel);                              //00BE : 1B 45 98 00 00 01 40 2A 2C 26 00 B8 1B 06 1B 16 
      i = 0;                                                                    //00CE : 0F 00 10 FB 2A 26 25 
      while (i < mRecipe.Components.Length) {                                   //00D5 : 07 1B 05 96 00 10 FB 2A 26 37 19 01 18 A3 89 19 05 00 00 01 18 49 22 11 16 
        if (mRecipe.Components[i].Item == None
          || mRecipe.Components[i].Quantity == 0) {//00EE : 07 31 01 84 72 36 40 4B 22 11 10 00 10 FB 2A 26 19 01 18 A3 89 19 05 00 00 01 18 49 22 11 2A 16 18 1D 00 9A 36 B8 4B 22 11 10 00 10 FB 2A 26 19 01 18 A3 89 19 05 00 00 01 18 49 22 11 25 16 16 
        } else {                                                                //012E : 06 11 05 
          lAmount = itemManager.CountItems(mRecipe.Components[i].Item);         //0131 : 0F 00 B0 8E 07 1B 19 00 C0 8D 07 1B 1F 00 04 1C 08 4A 22 11 36 40 4B 22 11 10 00 10 FB 2A 26 19 01 18 A3 89 19 05 00 00 01 18 49 22 11 16 
          lResourcePage = mResourcesPage.CreatePage("GUI_Page",0,0,0,mResourcesPage.mHeight,mResourcesPage.GetClientWidth(),0);//015F : 0F 00 D8 9B 2B 26 19 01 40 2A 2C 26 35 00 04 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 39 44 19 01 40 2A 2C 26 05 00 04 01 40 88 31 16 39 44 19 01 40 2A 2C 26 06 00 04 1B 17 98 00 00 16 25 16 
          lResourcePage.SetSolidBackground(255.00000000,255.00000000,255.00000000,38.00000000);//01A3 : 19 00 D8 9B 2B 26 1A 00 00 1B 52 98 00 00 1E 00 00 7F 43 1E 00 00 7F 43 1E 00 00 7F 43 1E 00 00 18 42 16 
          lResourcePage.SetBorder(4,4,4,4);                                     //01C6 : 19 00 D8 9B 2B 26 0E 00 00 1B 2B 98 00 00 2C 04 2C 04 2C 04 2C 04 16 
          lResourceButton = lResourcePage.CreateButton("GUI_Button",Class'GUI_BaseDesktop'.524288,0,0,0,40,40);//01DD : 0F 00 D0 FB 8A 19 19 00 D8 9B 2B 26 27 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 12 20 00 68 D7 00 05 00 04 1D 00 00 08 00 25 25 25 2C 28 2C 28 16 
          lResourceButton.SetBackground("Dropbox","SBGuiTX.Losse_Gui.SlotsnBoxes","SlotsnBoxes");//0213 : 19 00 D0 FB 8A 19 3B 00 00 1B 1A 98 00 00 1F 44 72 6F 70 62 6F 78 00 1F 53 42 47 75 69 54 58 2E 4C 6F 73 73 65 5F 47 75 69 2E 53 6C 6F 74 73 6E 42 6F 78 65 73 00 1F 53 6C 6F 74 73 6E 42 6F 78 65 73 00 16 
          lResourceButton.SetIconMaterial(mRecipe.Components[i].Item.GetLogo(GetPawn()),4.00000000,4.00000000,32.00000000,32.00000000);//0257 : 19 00 D0 FB 8A 19 43 00 00 1B 34 98 00 00 19 36 40 4B 22 11 10 00 10 FB 2A 26 19 01 18 A3 89 19 05 00 00 01 18 49 22 11 0C 00 04 1B 71 0C 00 00 1B 2B 0C 00 00 16 16 1E 00 00 80 40 1E 00 00 80 40 1E 00 00 00 42 1E 00 00 00 42 16 
          lResourceText = GUI_TextCtrl(lResourcePage.CreatePage("GUI_TextCtrl",0,4096 | 256,40 + 5,0,lResourcePage.GetClientWidth() - 40 + 5,40));//02A3 : 0F 00 10 FF 8A 19 2E 20 79 2F 1D 19 00 D8 9B 2B 26 45 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 9E 1D 00 10 00 00 1D 00 01 00 00 16 92 2C 28 2C 05 16 25 39 44 AF 19 00 D8 9B 2B 26 06 00 04 1B 17 98 00 00 16 39 3F 92 2C 28 2C 05 16 16 2C 28 16 
          lResourceText.SetText(mRecipe.Components[i].Item.GetTypeName()
            $ ":"
            @ mRecipe.Components[i].Item.GetName());//02FC : 19 00 10 FF 8A 19 53 00 00 1B 13 98 00 00 A8 70 19 36 40 4B 22 11 10 00 10 FB 2A 26 19 01 18 A3 89 19 05 00 00 01 18 49 22 11 06 00 00 1B 0D 1A 00 00 16 1F 3A 00 16 19 36 40 4B 22 11 10 00 10 FB 2A 26 19 01 18 A3 89 19 05 00 00 01 18 49 22 11 06 00 00 1B F9 03 00 00 16 16 16 
          if (lAmount >= mRecipe.Components[i].Quantity) {                      //0358 : 07 EF 03 99 00 B0 8E 07 1B 36 B8 4B 22 11 10 00 10 FB 2A 26 19 01 18 A3 89 19 05 00 00 01 18 49 22 11 16 
            lResourceText.SetColor(216,211,243);                                //037B : 19 00 10 FF 8A 19 0C 00 00 1B 19 98 00 00 2C D8 2C D3 2C F3 16 
            lResourceButton.SetText(string(mRecipe.Components[i].Quantity)
              $ "/"
              $ string(mRecipe.Components[i].Quantity));//0390 : 19 00 D0 FB 8A 19 43 00 00 1B 13 98 00 00 70 70 39 53 36 B8 4B 22 11 10 00 10 FB 2A 26 19 01 18 A3 89 19 05 00 00 01 18 49 22 11 1F 2F 00 16 39 53 36 B8 4B 22 11 10 00 10 FB 2A 26 19 01 18 A3 89 19 05 00 00 01 18 49 22 11 16 16 
            lResourceButton.SetEnabled(True);                                   //03DC : 19 00 D0 FB 8A 19 07 00 00 1B 5F 32 00 00 27 16 
          } else {                                                              //03EC : 06 6F 04 
            lResourceText.SetColor(153,149,164);                                //03EF : 19 00 10 FF 8A 19 0C 00 00 1B 19 98 00 00 2C 99 2C 95 2C A4 16 
            lResourceButton.SetText(string(lAmount) $ "/"
              $ string(mRecipe.Components[i].Quantity));//0404 : 19 00 D0 FB 8A 19 2F 00 00 1B 13 98 00 00 70 70 39 53 00 B0 8E 07 1B 1F 2F 00 16 39 53 36 B8 4B 22 11 10 00 10 FB 2A 26 19 01 18 A3 89 19 05 00 00 01 18 49 22 11 16 16 
            lResourceButton.SetEnabled(False);                                  //043C : 19 00 D0 FB 8A 19 07 00 00 1B 5F 32 00 00 28 16 
            lResourceButton.SetIconColors(0.50000000,0.50000000,0.50000000,1.00000000);//044C : 19 00 D0 FB 8A 19 1A 00 00 1B 92 98 00 00 1E 00 00 00 3F 1E 00 00 00 3F 1E 00 00 00 3F 1E 00 00 80 3F 16 
          }
          UpdateHeight(lResourcePage,lResourceText,0.00000000,40.00000000);     //046F : 1B 45 98 00 00 00 D8 9B 2B 26 00 10 FF 8A 19 1E 00 00 00 00 1E 00 00 20 42 16 
          lResourceText.mTop = (lResourcePage.GetClientHeight() - lResourceText.GetClientHeight()) / 2;//0489 : 0F 19 00 10 FF 8A 19 05 00 04 01 80 86 31 16 AC AF 19 00 D8 9B 2B 26 06 00 04 1B 1F 98 00 00 16 19 00 10 FF 8A 19 06 00 04 1B 1F 98 00 00 16 16 39 3F 2C 02 16 
          lResourceText.Invalidate();                                           //04BE : 19 00 10 FF 8A 19 06 00 00 1B 1D 98 00 00 16 
          if (i == mRecipe.Components.Length - 1) {                             //04CD : 07 FC 04 9A 00 10 FB 2A 26 93 37 19 01 18 A3 89 19 05 00 00 01 18 49 22 11 26 16 16 
            UpdateHeight(mResourcesPage,lResourcePage);                         //04E9 : 1B 45 98 00 00 01 40 2A 2C 26 00 D8 9B 2B 26 16 
            goto jl0511;                                                        //04F9 : 06 11 05 
          }
          UpdateHeight(mResourcesPage,lResourcePage,1.00000000);                //04FC : 1B 45 98 00 00 01 40 2A 2C 26 00 D8 9B 2B 26 1E 00 00 80 3F 16 
        }
        i++;                                                                    //0511 : A5 00 10 FB 2A 26 16 
      }
      if (mRecipe.GetCraftPrice() > 0) {                                        //051B : 07 71 06 97 19 01 18 A3 89 19 06 00 04 1C 50 45 22 11 16 25 16 
        lMoneyPage = mResourcesPage.CreatePage("GUI_Page",0,0,0,mResourcesPage.mHeight,mResourcesPage.GetClientWidth(),40);//0530 : 0F 00 D0 C5 2C 26 19 01 40 2A 2C 26 36 00 04 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 39 44 19 01 40 2A 2C 26 05 00 04 01 40 88 31 16 39 44 19 01 40 2A 2C 26 06 00 04 1B 17 98 00 00 16 2C 28 16 
        lMoneyPage.SetBorder(4,4,4,4);                                          //0575 : 19 00 D0 C5 2C 26 0E 00 00 1B 2B 98 00 00 2C 04 2C 04 2C 04 2C 04 16 
        lMoneyText = lMoneyPage.CreateLabel("GUI_Label",524288,256,0,8,lMoneyPage.GetClientWidth(),20);//058C : 0F 00 C8 F5 33 26 19 00 D0 C5 2C 26 31 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 1D 00 01 00 00 25 2C 08 39 44 19 00 D0 C5 2C 26 06 00 04 1B 17 98 00 00 16 2C 14 16 
        lMoneyText.SetText(Class'SBGuiStrings'.default.Crafting_Cost_.Text);    //05CC : 19 00 C8 F5 33 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 C8 8B 99 19 16 
        lMoney = HUD_MoneyPage(lMoneyPage.CreatePage("HUD_MoneyPage",0,0,0,0,161,32));//05EE : 0F 00 48 8D 07 1B 2E B0 75 30 1D 19 00 D0 C5 2C 26 1D 00 04 1B 16 98 00 00 1F 48 55 44 5F 4D 6F 6E 65 79 50 61 67 65 00 25 25 25 25 2C A1 2C 20 16 
        lMoney.mLeft = lMoneyPage.GetClientWidth() - 161;                       //061F : 0F 19 00 48 8D 07 1B 05 00 04 01 08 86 31 16 AF 19 00 D0 C5 2C 26 06 00 04 1B 17 98 00 00 16 39 3F 2C A1 16 
        lMoney.SetMoney(mRecipe.GetCraftPrice());                               //0643 : 19 00 48 8D 07 1B 15 00 00 1B 4B 97 00 00 19 01 18 A3 89 19 06 00 04 1C 50 45 22 11 16 16 
        UpdateHeight(mResourcesPage,lMoneyPage);                                //0661 : 1B 45 98 00 00 01 40 2A 2C 26 00 D0 C5 2C 26 16 
      }
      UpdateHeight(self,mResourcesPage);                                        //0671 : 1B 45 98 00 00 17 01 40 2A 2C 26 16 
    }
    //0F 00 C0 8D 07 1B 19 1B 2B 0C 00 00 16 05 00 04 01 B0 2D 19 11 07 7D 06 77 00 C0 8D 07 1B 2A 16 
    //0F 01 40 2A 2C 26 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 39 44 01 40 88 31 16 39 
    //44 1B 17 98 00 00 16 25 16 0F 00 B8 1B 06 1B 19 01 40 2A 2C 26 30 00 04 1B 20 98 00 00 1F 47 55 
    //49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 1D 00 01 00 00 25 25 39 44 19 01 40 2A 2C 26 06 00 04 1B 
    //17 98 00 00 16 2C 14 16 19 00 B8 1B 06 1B 0B 00 00 1B 2B 98 00 00 2C 04 25 25 25 16 19 00 B8 1B 
    //06 1B 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 50 8B 99 19 16 1B 45 
    //98 00 00 01 40 2A 2C 26 00 B8 1B 06 1B 16 0F 00 10 FB 2A 26 25 07 1B 05 96 00 10 FB 2A 26 37 19 
    //01 18 A3 89 19 05 00 00 01 18 49 22 11 16 07 31 01 84 72 36 40 4B 22 11 10 00 10 FB 2A 26 19 01 
    //18 A3 89 19 05 00 00 01 18 49 22 11 2A 16 18 1D 00 9A 36 B8 4B 22 11 10 00 10 FB 2A 26 19 01 18 
    //A3 89 19 05 00 00 01 18 49 22 11 25 16 16 06 11 05 0F 00 B0 8E 07 1B 19 00 C0 8D 07 1B 1F 00 04 
    //1C 08 4A 22 11 36 40 4B 22 11 10 00 10 FB 2A 26 19 01 18 A3 89 19 05 00 00 01 18 49 22 11 16 0F 
    //00 D8 9B 2B 26 19 01 40 2A 2C 26 35 00 04 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 
    //39 44 19 01 40 2A 2C 26 05 00 04 01 40 88 31 16 39 44 19 01 40 2A 2C 26 06 00 04 1B 17 98 00 00 
    //16 25 16 19 00 D8 9B 2B 26 1A 00 00 1B 52 98 00 00 1E 00 00 7F 43 1E 00 00 7F 43 1E 00 00 7F 43 
    //1E 00 00 18 42 16 19 00 D8 9B 2B 26 0E 00 00 1B 2B 98 00 00 2C 04 2C 04 2C 04 2C 04 16 0F 00 D0 
    //FB 8A 19 19 00 D8 9B 2B 26 27 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 12 20 00 
    //68 D7 00 05 00 04 1D 00 00 08 00 25 25 25 2C 28 2C 28 16 19 00 D0 FB 8A 19 3B 00 00 1B 1A 98 00 
    //00 1F 44 72 6F 70 62 6F 78 00 1F 53 42 47 75 69 54 58 2E 4C 6F 73 73 65 5F 47 75 69 2E 53 6C 6F 
    //74 73 6E 42 6F 78 65 73 00 1F 53 6C 6F 74 73 6E 42 6F 78 65 73 00 16 19 00 D0 FB 8A 19 43 00 00 
    //1B 34 98 00 00 19 36 40 4B 22 11 10 00 10 FB 2A 26 19 01 18 A3 89 19 05 00 00 01 18 49 22 11 0C 
    //00 04 1B 71 0C 00 00 1B 2B 0C 00 00 16 16 1E 00 00 80 40 1E 00 00 80 40 1E 00 00 00 42 1E 00 00 
    //00 42 16 0F 00 10 FF 8A 19 2E 20 79 2F 1D 19 00 D8 9B 2B 26 45 00 04 1B 16 98 00 00 1F 47 55 49 
    //5F 54 65 78 74 43 74 72 6C 00 25 9E 1D 00 10 00 00 1D 00 01 00 00 16 92 2C 28 2C 05 16 25 39 44 
    //AF 19 00 D8 9B 2B 26 06 00 04 1B 17 98 00 00 16 39 3F 92 2C 28 2C 05 16 16 2C 28 16 19 00 10 FF 
    //8A 19 53 00 00 1B 13 98 00 00 A8 70 19 36 40 4B 22 11 10 00 10 FB 2A 26 19 01 18 A3 89 19 05 00 
    //00 01 18 49 22 11 06 00 00 1B 0D 1A 00 00 16 1F 3A 00 16 19 36 40 4B 22 11 10 00 10 FB 2A 26 19 
    //01 18 A3 89 19 05 00 00 01 18 49 22 11 06 00 00 1B F9 03 00 00 16 16 16 07 EF 03 99 00 B0 8E 07 
    //1B 36 B8 4B 22 11 10 00 10 FB 2A 26 19 01 18 A3 89 19 05 00 00 01 18 49 22 11 16 19 00 10 FF 8A 
    //19 0C 00 00 1B 19 98 00 00 2C D8 2C D3 2C F3 16 19 00 D0 FB 8A 19 43 00 00 1B 13 98 00 00 70 70 
    //39 53 36 B8 4B 22 11 10 00 10 FB 2A 26 19 01 18 A3 89 19 05 00 00 01 18 49 22 11 1F 2F 00 16 39 
    //53 36 B8 4B 22 11 10 00 10 FB 2A 26 19 01 18 A3 89 19 05 00 00 01 18 49 22 11 16 16 19 00 D0 FB 
    //8A 19 07 00 00 1B 5F 32 00 00 27 16 06 6F 04 19 00 10 FF 8A 19 0C 00 00 1B 19 98 00 00 2C 99 2C 
    //95 2C A4 16 19 00 D0 FB 8A 19 2F 00 00 1B 13 98 00 00 70 70 39 53 00 B0 8E 07 1B 1F 2F 00 16 39 
    //53 36 B8 4B 22 11 10 00 10 FB 2A 26 19 01 18 A3 89 19 05 00 00 01 18 49 22 11 16 16 19 00 D0 FB 
    //8A 19 07 00 00 1B 5F 32 00 00 28 16 19 00 D0 FB 8A 19 1A 00 00 1B 92 98 00 00 1E 00 00 00 3F 1E 
    //00 00 00 3F 1E 00 00 00 3F 1E 00 00 80 3F 16 1B 45 98 00 00 00 D8 9B 2B 26 00 10 FF 8A 19 1E 00 
    //00 00 00 1E 00 00 20 42 16 0F 19 00 10 FF 8A 19 05 00 04 01 80 86 31 16 AC AF 19 00 D8 9B 2B 26 
    //06 00 04 1B 1F 98 00 00 16 19 00 10 FF 8A 19 06 00 04 1B 1F 98 00 00 16 16 39 3F 2C 02 16 19 00 
    //10 FF 8A 19 06 00 00 1B 1D 98 00 00 16 07 FC 04 9A 00 10 FB 2A 26 93 37 19 01 18 A3 89 19 05 00 
    //00 01 18 49 22 11 26 16 16 1B 45 98 00 00 01 40 2A 2C 26 00 D8 9B 2B 26 16 06 11 05 1B 45 98 00 
    //00 01 40 2A 2C 26 00 D8 9B 2B 26 1E 00 00 80 3F 16 A5 00 10 FB 2A 26 16 06 D5 00 07 71 06 97 19 
    //01 18 A3 89 19 06 00 04 1C 50 45 22 11 16 25 16 0F 00 D0 C5 2C 26 19 01 40 2A 2C 26 36 00 04 1B 
    //16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 39 44 19 01 40 2A 2C 26 05 00 04 01 40 88 31 
    //16 39 44 19 01 40 2A 2C 26 06 00 04 1B 17 98 00 00 16 2C 28 16 19 00 D0 C5 2C 26 0E 00 00 1B 2B 
    //98 00 00 2C 04 2C 04 2C 04 2C 04 16 0F 00 C8 F5 33 26 19 00 D0 C5 2C 26 31 00 04 1B 20 98 00 00 
    //1F 47 55 49 5F 4C 61 62 65 6C 00 1D 00 00 08 00 1D 00 01 00 00 25 2C 08 39 44 19 00 D0 C5 2C 26 
    //06 00 04 1B 17 98 00 00 16 2C 14 16 19 00 C8 F5 33 26 19 00 00 1B 13 98 00 00 36 58 C6 6B 0F 12 
    //20 70 4B 32 1D 05 00 0C 02 C8 8B 99 19 16 0F 00 48 8D 07 1B 2E B0 75 30 1D 19 00 D0 C5 2C 26 1D 
    //00 04 1B 16 98 00 00 1F 48 55 44 5F 4D 6F 6E 65 79 50 61 67 65 00 25 25 25 25 2C A1 2C 20 16 0F 
    //19 00 48 8D 07 1B 05 00 04 01 08 86 31 16 AF 19 00 D0 C5 2C 26 06 00 04 1B 17 98 00 00 16 39 3F 
    //2C A1 16 19 00 48 8D 07 1B 15 00 00 1B 4B 97 00 00 19 01 18 A3 89 19 06 00 04 1C 50 45 22 11 16 
    //16 1B 45 98 00 00 01 40 2A 2C 26 00 D0 C5 2C 26 16 1B 45 98 00 00 17 01 40 2A 2C 26 16 04 0B 47 
    //
  }


  function AddProducedItem(string aName,string aDescription) {
    local GUI_Button lDescriptionIcon;
    local GUI_TextCtrl lNameText;
    local GUI_TextCtrl lDescriptionText;
    mDescription = CreatePage("GUI_Page",0,0,0,mHeight,GetClientWidth(),0);     //0000 : 0F 01 58 E3 A6 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 39 44 01 40 88 31 16 39 44 1B 17 98 00 00 16 25 16 
    mDescription.SetBorder(4,2,4,0);                                            //0029 : 19 01 58 E3 A6 19 0D 00 00 1B 2B 98 00 00 2C 04 2C 02 2C 04 25 16 
    lDescriptionIcon = mDescription.CreateButton("GUI_Button",Class'GUI_BaseDesktop'.524288,0,0,0,40,40);//003F : 0F 00 E0 8B 07 1B 19 01 58 E3 A6 19 27 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 12 20 00 68 D7 00 05 00 04 1D 00 00 08 00 25 25 25 2C 28 2C 28 16 
    lDescriptionIcon.SetBackground("Dropbox","SBGuiTX.Losse_Gui.SlotsnBoxes","SlotsnBoxes");//0075 : 19 00 E0 8B 07 1B 3B 00 00 1B 1A 98 00 00 1F 44 72 6F 70 62 6F 78 00 1F 53 42 47 75 69 54 58 2E 4C 6F 73 73 65 5F 47 75 69 2E 53 6C 6F 74 73 6E 42 6F 78 65 73 00 1F 53 6C 6F 74 73 6E 42 6F 78 65 73 00 16 
    lDescriptionIcon.SetIconMaterial(mRecipe.ProducedItem.GetLogo(GetPawn()),4.00000000,4.00000000,32.00000000,32.00000000);//00B9 : 19 00 E0 8B 07 1B 38 00 00 1B 34 98 00 00 19 19 01 18 A3 89 19 05 00 04 01 D8 47 2C 11 0C 00 04 1B 71 0C 00 00 1B 2B 0C 00 00 16 16 1E 00 00 80 40 1E 00 00 80 40 1E 00 00 00 42 1E 00 00 00 42 16 
    lNameText = GUI_TextCtrl(mDescription.CreatePage("GUI_TextCtrl",0,256,40 + 5,0,mDescription.GetClientWidth() - 40 + 5,20));//00FA : 0F 00 40 1B 06 1B 2E 20 79 2F 1D 19 01 58 E3 A6 19 3E 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 1D 00 01 00 00 92 2C 28 2C 05 16 25 39 44 AF 19 01 58 E3 A6 19 06 00 04 1B 17 98 00 00 16 39 3F 92 2C 28 2C 05 16 16 2C 14 16 
    lNameText.SetFont("SBFontsTX.Verdana11");                                   //014C : 19 00 40 1B 06 1B 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 31 00 16 
    lNameText.SetColor(255,255,255);                                            //0170 : 19 00 40 1B 06 1B 0C 00 00 1B 19 98 00 00 2C FF 2C FF 2C FF 16 
    lNameText.SetText(aName);                                                   //0185 : 19 00 40 1B 06 1B 0B 00 00 1B 13 98 00 00 00 00 3A 33 26 16 
    lDescriptionText = GUI_TextCtrl(mDescription.CreatePage("GUI_TextCtrl",0,256,40 + 5,20,mDescription.GetClientWidth() - 40 + 5,20));//0199 : 0F 00 D0 D8 04 1B 2E 20 79 2F 1D 19 01 58 E3 A6 19 3F 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 1D 00 01 00 00 92 2C 28 2C 05 16 2C 14 39 44 AF 19 01 58 E3 A6 19 06 00 04 1B 17 98 00 00 16 39 3F 92 2C 28 2C 05 16 16 2C 14 16 
    lDescriptionText.SetFont("SBFontsTX.Verdana10");                            //01EC : 19 00 D0 D8 04 1B 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 
    lDescriptionText.SetColor(151,147,164);                                     //0210 : 19 00 D0 D8 04 1B 0C 00 00 1B 19 98 00 00 2C 97 2C 93 2C A4 16 
    lDescriptionText.SetText(aDescription);                                     //0225 : 19 00 D0 D8 04 1B 0B 00 00 1B 13 98 00 00 00 78 3A 33 26 16 
    UpdateHeight(mDescription,lDescriptionText,20.00000000,40.00000000 - 20);   //0239 : 1B 45 98 00 00 01 58 E3 A6 19 00 D0 D8 04 1B 1E 00 00 A0 41 AF 1E 00 00 20 42 39 3F 2C 14 16 16 
    UpdateHeight(self,mDescription);                                            //0259 : 1B 45 98 00 00 17 01 58 E3 A6 19 16 
    //0F 01 58 E3 A6 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 39 44 01 40 88 31 16 39 
    //44 1B 17 98 00 00 16 25 16 19 01 58 E3 A6 19 0D 00 00 1B 2B 98 00 00 2C 04 2C 02 2C 04 25 16 0F 
    //00 E0 8B 07 1B 19 01 58 E3 A6 19 27 00 04 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 12 
    //20 00 68 D7 00 05 00 04 1D 00 00 08 00 25 25 25 2C 28 2C 28 16 19 00 E0 8B 07 1B 3B 00 00 1B 1A 
    //98 00 00 1F 44 72 6F 70 62 6F 78 00 1F 53 42 47 75 69 54 58 2E 4C 6F 73 73 65 5F 47 75 69 2E 53 
    //6C 6F 74 73 6E 42 6F 78 65 73 00 1F 53 6C 6F 74 73 6E 42 6F 78 65 73 00 16 19 00 E0 8B 07 1B 38 
    //00 00 1B 34 98 00 00 19 19 01 18 A3 89 19 05 00 04 01 D8 47 2C 11 0C 00 04 1B 71 0C 00 00 1B 2B 
    //0C 00 00 16 16 1E 00 00 80 40 1E 00 00 80 40 1E 00 00 00 42 1E 00 00 00 42 16 0F 00 40 1B 06 1B 
    //2E 20 79 2F 1D 19 01 58 E3 A6 19 3E 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 
    //00 25 1D 00 01 00 00 92 2C 28 2C 05 16 25 39 44 AF 19 01 58 E3 A6 19 06 00 04 1B 17 98 00 00 16 
    //39 3F 92 2C 28 2C 05 16 16 2C 14 16 19 00 40 1B 06 1B 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 
    //74 73 54 58 2E 56 65 72 64 61 6E 61 31 31 00 16 19 00 40 1B 06 1B 0C 00 00 1B 19 98 00 00 2C FF 
    //2C FF 2C FF 16 19 00 40 1B 06 1B 0B 00 00 1B 13 98 00 00 00 00 3A 33 26 16 0F 00 D0 D8 04 1B 2E 
    //20 79 2F 1D 19 01 58 E3 A6 19 3F 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 
    //25 1D 00 01 00 00 92 2C 28 2C 05 16 2C 14 39 44 AF 19 01 58 E3 A6 19 06 00 04 1B 17 98 00 00 16 
    //39 3F 92 2C 28 2C 05 16 16 2C 14 16 19 00 D0 D8 04 1B 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 
    //74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 19 00 D0 D8 04 1B 0C 00 00 1B 19 98 00 00 2C 97 
    //2C 93 2C A4 16 19 00 D0 D8 04 1B 0B 00 00 1B 13 98 00 00 00 78 3A 33 26 16 1B 45 98 00 00 01 58 
    //E3 A6 19 00 D0 D8 04 1B 1E 00 00 A0 41 AF 1E 00 00 20 42 39 3F 2C 14 16 16 1B 45 98 00 00 17 01 
    //58 E3 A6 19 16 04 0B 47 
  }


  function string GetRecipeName() {
    local string recipeName;
    recipeName = Class'SBGuiStrings'.default.Recipe_for_ITEMNAME.Text;          //0000 : 0F 00 40 8A 07 1B 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D8 8A 99 19 
    static.ReplaceText(recipeName,"[ITEMNAME]",mRecipe.ProducedItem.GetName()); //0019 : 1C 30 80 69 0F 00 40 8A 07 1B 1F 5B 49 54 45 4D 4E 41 4D 45 5D 00 19 19 01 18 A3 89 19 05 00 04 01 D8 47 2C 11 06 00 00 1B F9 03 00 00 16 16 
    return recipeName;                                                          //0048 : 04 00 40 8A 07 1B 
    //0F 00 40 8A 07 1B 36 58 C6 6B 0F 12 20 70 4B 32 1D 05 00 0C 02 D8 8A 99 19 1C 30 80 69 0F 00 40 
    //8A 07 1B 1F 5B 49 54 45 4D 4E 41 4D 45 5D 00 19 19 01 18 A3 89 19 05 00 04 01 D8 47 2C 11 06 00 
    //00 1B F9 03 00 00 16 16 04 00 40 8A 07 1B 04 0B 47 
  }


  event bool ShouldUpdate() {
    if (Super.ShouldUpdate()) {                                                 //0000 : 07 0B 00 1C C8 2B 06 1B 16 
      return True;                                                              //0009 : 04 27 
    }
    return False;                                                               //000B : 04 28 
    //07 0B 00 1C C8 2B 06 1B 16 04 27 04 28 04 0B 47 
  }


  function bool UpdateTooltipInfo() {
    if (mItem != None && mRecipe != None) {                                     //0000 : 07 BE 00 82 77 01 F8 22 EC 25 2A 16 18 09 00 77 01 18 A3 89 19 2A 16 16 
      if (ContextMenuOpen()) {                                                  //0018 : 07 23 00 1B 96 98 00 00 16 
        return False;                                                           //0021 : 04 28 
      }
      AddHeader(GetRecipeName(),"",mRecipe.ProducedItem.GetTypeName(),mItem.Type.GetTypeName(),mItem.Type.GetRarityColor());//0023 : 1B 3C 98 00 00 1B 28 9A 00 00 16 1F 00 19 19 01 18 A3 89 19 05 00 04 01 D8 47 2C 11 06 00 00 1B 0D 1A 00 00 16 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 00 1B 0D 1A 00 00 16 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 04 1B 7B 05 00 00 16 16 
      AddProducedItem(mRecipe.ProducedItem.GetName(),mRecipe.ProducedItem.Description.Text);//0079 : 1B 22 9A 00 00 19 19 01 18 A3 89 19 05 00 04 01 D8 47 2C 11 06 00 00 1B F9 03 00 00 16 36 58 C6 6B 0F 19 19 01 18 A3 89 19 05 00 04 01 D8 47 2C 11 05 00 0C 01 B0 F2 2B 11 16 
      AddNeededResources();                                                     //00B3 : 1B 21 9A 00 00 16 
      return True;                                                              //00B9 : 04 27 
    } else {                                                                    //00BB : 06 C0 00 
      return False;                                                             //00BE : 04 28 
    }
    //07 BE 00 82 77 01 F8 22 EC 25 2A 16 18 09 00 77 01 18 A3 89 19 2A 16 16 07 23 00 1B 96 98 00 00 
    //16 04 28 1B 3C 98 00 00 1B 28 9A 00 00 16 1F 00 19 19 01 18 A3 89 19 05 00 04 01 D8 47 2C 11 06 
    //00 00 1B 0D 1A 00 00 16 19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 00 1B 0D 1A 00 00 16 
    //19 19 01 F8 22 EC 25 05 00 04 01 98 2F 22 11 06 00 04 1B 7B 05 00 00 16 16 1B 22 9A 00 00 19 19 
    //01 18 A3 89 19 05 00 04 01 D8 47 2C 11 06 00 00 1B F9 03 00 00 16 36 58 C6 6B 0F 19 19 01 18 A3 
    //89 19 05 00 04 01 D8 47 2C 11 05 00 0C 01 B0 F2 2B 11 16 1B 21 9A 00 00 16 04 27 06 C0 00 04 28 
    //04 0B 47 
  }


  function ResetObjectTooltip() {
    if (mResourcesPage != None) {                                               //0000 : 07 1D 00 77 01 40 2A 2C 26 2A 16 
      DestroyComponent(mResourcesPage);                                         //000B : 1B 4D 98 00 00 01 40 2A 2C 26 16 
      mResourcesPage = None;                                                    //0016 : 0F 01 40 2A 2C 26 2A 
    }
    Super.ResetObjectTooltip();                                                 //001D : 1C 20 0D A6 19 16 
    //07 1D 00 77 01 40 2A 2C 26 2A 16 1B 4D 98 00 00 01 40 2A 2C 26 16 0F 01 40 2A 2C 26 2A 1C 20 0D 
    //A6 19 16 04 0B 47 
  }


  function bool UpdateTooltipObject(Object aObject) {
    mRecipe = IC_Recipe(Game_Item(aObject).Type.GetComponentByClass(Class'IC_Recipe'));//0000 : 0F 01 18 A3 89 19 2E B8 2F 5C 01 19 19 2E 30 E6 5B 01 00 E0 F7 33 26 05 00 04 01 98 2F 22 11 0B 00 04 1C 00 31 22 11 20 B8 2F 5C 01 16 
    return Super.UpdateTooltipObject(aObject);                                  //002D : 04 1C 98 E4 33 26 00 E0 F7 33 26 16 
    //0F 01 18 A3 89 19 2E B8 2F 5C 01 19 19 2E 30 E6 5B 01 00 E0 F7 33 26 05 00 04 01 98 2F 22 11 0B 
    //00 04 1C 00 31 22 11 20 B8 2F 5C 01 16 04 1C 98 E4 33 26 00 E0 F7 33 26 16 04 0B 47 
  }



