//==============================================================================
//  HUD_RewardsPage
//==============================================================================

class HUD_RewardsPage extends GUI_Page
    dependsOn(GUI_Button,FSkill_Type,Content_Inventory,Item_Type,Game_Item,HUD_MoneyPageShort,GUI_Label,Quest_Reward,QR_Money,QR_Item,QR_Skill)
    Transient
    Config(User)
  ;

  const RP_BUTTON_SPACING =  6;
  const RP_SKILL_HEIGHT =  42;
  const RP_SKILL_WIDTH =  42;
  const RP_LABEL_HEIGHT =  8;
  var private GUI_Label mRewardsLabel;
  var private HUD_MoneyPageShort mMoneyImagePage;
  var private array<GUI_Button> mRewardsItemButtons;
  var private array<GUI_Button> mRewardsSkillButtons;


  function int AddSkillRewards(export editinline FSkill_Type Skill) {
    local int idx;
    local float X;
    local float Y;
    if (Skill != None) {                                                        //0000 : 07 38 01 77 00 50 F4 06 1B 2A 16 
      mRewardsSkillButtons.Length = 1;                                          //000B : 0F 37 01 00 D7 2B 26 26 
      idx = 0;                                                                  //0013 : 0F 00 F8 39 04 1B 25 
      X = mWidth / 2 - 42 / 2;                                                  //001A : 0F 00 60 5C 06 1B AF AC 01 60 87 31 16 39 3F 2C 02 16 39 3F 91 2C 2A 2C 02 16 16 
      Y = mHeight;                                                              //0035 : 0F 00 20 59 06 1B 01 40 88 31 16 
      mRewardsSkillButtons[idx] = CreateButton("GUI_Button",0,0,X,Y,42,42);     //0040 : 0F 10 00 F8 39 04 1B 01 00 D7 2B 26 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 39 44 00 60 5C 06 1B 39 44 00 20 59 06 1B 2C 2A 2C 2A 16 
      mRewardsSkillButtons[idx].SetIconMaterial(Skill.Logo,5.00000000,5.00000000);//0072 : 19 10 00 F8 39 04 1B 01 00 D7 2B 26 1E 00 00 1B 34 98 00 00 19 00 50 F4 06 1B 05 00 04 01 68 B3 20 11 1E 00 00 A0 40 1E 00 00 A0 40 16 
      mRewardsSkillButtons[idx].SetBackground("skill_dropbox","SBGuiTX.Losse_Gui.SlotsnBoxes","SlotsnBoxes");//009F : 19 10 00 F8 39 04 1B 01 00 D7 2B 26 41 00 00 1B 1A 98 00 00 1F 73 6B 69 6C 6C 5F 64 72 6F 70 62 6F 78 00 1F 53 42 47 75 69 54 58 2E 4C 6F 73 73 65 5F 47 75 69 2E 53 6C 6F 74 73 6E 42 6F 78 65 73 00 1F 53 6C 6F 74 73 6E 42 6F 78 65 73 00 16 
      mRewardsSkillButtons[idx].SetTooltipObject(Skill,"HUD_UpgradeSkillTooltip");//00EF : 19 10 00 F8 39 04 1B 01 00 D7 2B 26 24 00 00 1B 52 97 00 00 00 50 F4 06 1B 1F 48 55 44 5F 55 70 67 72 61 64 65 53 6B 69 6C 6C 54 6F 6F 6C 74 69 70 00 16 
      mHeight += 42 + 6;                                                        //0122 : B8 01 40 88 31 16 39 3F 92 2C 2A 2C 06 16 16 
      return 42 + 6;                                                            //0131 : 04 92 2C 2A 2C 06 16 
    }
    return 0;                                                                   //0138 : 04 25 
    //07 38 01 77 00 50 F4 06 1B 2A 16 0F 37 01 00 D7 2B 26 26 0F 00 F8 39 04 1B 25 0F 00 60 5C 06 1B 
    //AF AC 01 60 87 31 16 39 3F 2C 02 16 39 3F 91 2C 2A 2C 02 16 16 0F 00 20 59 06 1B 01 40 88 31 16 
    //0F 10 00 F8 39 04 1B 01 00 D7 2B 26 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 39 
    //44 00 60 5C 06 1B 39 44 00 20 59 06 1B 2C 2A 2C 2A 16 19 10 00 F8 39 04 1B 01 00 D7 2B 26 1E 00 
    //00 1B 34 98 00 00 19 00 50 F4 06 1B 05 00 04 01 68 B3 20 11 1E 00 00 A0 40 1E 00 00 A0 40 16 19 
    //10 00 F8 39 04 1B 01 00 D7 2B 26 41 00 00 1B 1A 98 00 00 1F 73 6B 69 6C 6C 5F 64 72 6F 70 62 6F 
    //78 00 1F 53 42 47 75 69 54 58 2E 4C 6F 73 73 65 5F 47 75 69 2E 53 6C 6F 74 73 6E 42 6F 78 65 73 
    //00 1F 53 6C 6F 74 73 6E 42 6F 78 65 73 00 16 19 10 00 F8 39 04 1B 01 00 D7 2B 26 24 00 00 1B 52 
    //97 00 00 00 50 F4 06 1B 1F 48 55 44 5F 55 70 67 72 61 64 65 53 6B 69 6C 6C 54 6F 6F 6C 74 69 70 
    //00 16 B8 01 40 88 31 16 39 3F 92 2C 2A 2C 06 16 16 04 92 2C 2A 2C 06 16 04 25 04 0B 47 
  }


  function int AddItemRewards(Content_Inventory Inventory) {
    local int idx;
    local float X;
    local float Y;
    local Game_Item Item;
    mRewardsItemButtons.Length = Inventory.Items.Length;                        //0000 : 0F 37 01 78 D7 2B 26 37 19 00 50 F3 89 19 05 00 00 01 A8 67 31 11 
    idx = 0;                                                                    //0016 : 0F 00 00 1A 2B 26 25 
    while (idx < Inventory.Items.Length) {                                      //001D : 07 28 02 96 00 00 1A 2B 26 37 19 00 50 F3 89 19 05 00 00 01 A8 67 31 11 16 
      X = mWidth / 2 - (Inventory.Items.Length * (40 + 6) - 6) / 2 + idx * (40 + 6);//0036 : 0F 00 70 62 06 1B AE AF AC 01 60 87 31 16 39 3F 2C 02 16 39 3F 91 93 90 37 19 00 50 F3 89 19 05 00 00 01 A8 67 31 11 92 2C 28 2C 06 16 16 2C 06 16 2C 02 16 16 39 3F 90 00 00 1A 2B 26 92 2C 28 2C 06 16 16 16 
      Y = mHeight;                                                              //007B : 0F 00 30 5F 06 1B 01 40 88 31 16 
      mRewardsItemButtons[idx] = CreateButton("GUI_Button",0,0,X,Y,40,40);      //0086 : 0F 10 00 00 1A 2B 26 01 78 D7 2B 26 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 6F 6E 00 25 25 39 44 00 70 62 06 1B 39 44 00 30 5F 06 1B 2C 28 2C 28 16 
      mRewardsItemButtons[idx].SetIconMaterial(Inventory.Items[idx].Item.GetLogo(GetPawn()),4.00000000,4.00000000);//00B8 : 19 10 00 00 1A 2B 26 01 78 D7 2B 26 39 00 00 1B 34 98 00 00 19 36 30 67 31 11 10 00 00 1A 2B 26 19 00 50 F3 89 19 05 00 00 01 A8 67 31 11 0C 00 04 1B 71 0C 00 00 1B 2B 0C 00 00 16 16 1E 00 00 80 40 1E 00 00 80 40 16 
      mRewardsItemButtons[idx].SetBackground("dropbox","SBGuiTX.Losse_Gui.SlotsnBoxes","SlotsnBoxes");//0100 : 19 10 00 00 1A 2B 26 01 78 D7 2B 26 3B 00 00 1B 1A 98 00 00 1F 64 72 6F 70 62 6F 78 00 1F 53 42 47 75 69 54 58 2E 4C 6F 73 73 65 5F 47 75 69 2E 53 6C 6F 74 73 6E 42 6F 78 65 73 00 1F 53 6C 6F 74 73 6E 42 6F 78 65 73 00 16 
      Item = new Class'Game_Item';                                              //014A : 0F 00 28 54 04 1B 11 0B 0B 0B 20 30 E6 5B 01 
      Item.itemManager = None;                                                  //0159 : 0F 19 00 28 54 04 1B 05 00 04 01 A0 36 2E 11 2A 
      Item.Type = Inventory.Items[idx].Item;                                    //0169 : 0F 19 00 28 54 04 1B 05 00 04 01 98 2F 22 11 36 30 67 31 11 10 00 00 1A 2B 26 19 00 50 F3 89 19 05 00 00 01 A8 67 31 11 
      Item.Color1 = Inventory.Items[idx].Color1;                                //0191 : 0F 19 00 28 54 04 1B 05 00 01 01 08 CA 22 11 36 10 7D 31 11 10 00 00 1A 2B 26 19 00 50 F3 89 19 05 00 00 01 A8 67 31 11 
      Item.Color2 = Inventory.Items[idx].Color2;                                //01B9 : 0F 19 00 28 54 04 1B 05 00 01 01 F8 CA 22 11 36 88 7D 31 11 10 00 00 1A 2B 26 19 00 50 F3 89 19 05 00 00 01 A8 67 31 11 
      mRewardsItemButtons[idx].SetTooltipObject(Item,Inventory.Items[idx].Item.GetTooltipType());//01E1 : 19 10 00 00 1A 2B 26 01 78 D7 2B 26 2E 00 00 1B 52 97 00 00 00 28 54 04 1B 19 36 30 67 31 11 10 00 00 1A 2B 26 19 00 50 F3 89 19 05 00 00 01 A8 67 31 11 06 00 00 1C 38 29 2E 11 16 16 
      ++idx;                                                                    //021E : A3 00 00 1A 2B 26 16 
    }
    if (Inventory.Items.Length > 0) {                                           //0228 : 07 53 02 97 37 19 00 50 F3 89 19 05 00 00 01 A8 67 31 11 25 16 
      mHeight += 40 + 6;                                                        //023D : B8 01 40 88 31 16 39 3F 92 2C 28 2C 06 16 16 
      return 40 + 6;                                                            //024C : 04 92 2C 28 2C 06 16 
    }
    return 0;                                                                   //0253 : 04 25 
    //0F 37 01 78 D7 2B 26 37 19 00 50 F3 89 19 05 00 00 01 A8 67 31 11 0F 00 00 1A 2B 26 25 07 28 02 
    //96 00 00 1A 2B 26 37 19 00 50 F3 89 19 05 00 00 01 A8 67 31 11 16 0F 00 70 62 06 1B AE AF AC 01 
    //60 87 31 16 39 3F 2C 02 16 39 3F 91 93 90 37 19 00 50 F3 89 19 05 00 00 01 A8 67 31 11 92 2C 28 
    //2C 06 16 16 2C 06 16 2C 02 16 16 39 3F 90 00 00 1A 2B 26 92 2C 28 2C 06 16 16 16 0F 00 30 5F 06 
    //1B 01 40 88 31 16 0F 10 00 00 1A 2B 26 01 78 D7 2B 26 1B 18 98 00 00 1F 47 55 49 5F 42 75 74 74 
    //6F 6E 00 25 25 39 44 00 70 62 06 1B 39 44 00 30 5F 06 1B 2C 28 2C 28 16 19 10 00 00 1A 2B 26 01 
    //78 D7 2B 26 39 00 00 1B 34 98 00 00 19 36 30 67 31 11 10 00 00 1A 2B 26 19 00 50 F3 89 19 05 00 
    //00 01 A8 67 31 11 0C 00 04 1B 71 0C 00 00 1B 2B 0C 00 00 16 16 1E 00 00 80 40 1E 00 00 80 40 16 
    //19 10 00 00 1A 2B 26 01 78 D7 2B 26 3B 00 00 1B 1A 98 00 00 1F 64 72 6F 70 62 6F 78 00 1F 53 42 
    //47 75 69 54 58 2E 4C 6F 73 73 65 5F 47 75 69 2E 53 6C 6F 74 73 6E 42 6F 78 65 73 00 1F 53 6C 6F 
    //74 73 6E 42 6F 78 65 73 00 16 0F 00 28 54 04 1B 11 0B 0B 0B 20 30 E6 5B 01 0F 19 00 28 54 04 1B 
    //05 00 04 01 A0 36 2E 11 2A 0F 19 00 28 54 04 1B 05 00 04 01 98 2F 22 11 36 30 67 31 11 10 00 00 
    //1A 2B 26 19 00 50 F3 89 19 05 00 00 01 A8 67 31 11 0F 19 00 28 54 04 1B 05 00 01 01 08 CA 22 11 
    //36 10 7D 31 11 10 00 00 1A 2B 26 19 00 50 F3 89 19 05 00 00 01 A8 67 31 11 0F 19 00 28 54 04 1B 
    //05 00 01 01 F8 CA 22 11 36 88 7D 31 11 10 00 00 1A 2B 26 19 00 50 F3 89 19 05 00 00 01 A8 67 31 
    //11 19 10 00 00 1A 2B 26 01 78 D7 2B 26 2E 00 00 1B 52 97 00 00 00 28 54 04 1B 19 36 30 67 31 11 
    //10 00 00 1A 2B 26 19 00 50 F3 89 19 05 00 00 01 A8 67 31 11 06 00 00 1C 38 29 2E 11 16 16 A3 00 
    //00 1A 2B 26 16 06 1D 00 07 53 02 97 37 19 00 50 F3 89 19 05 00 00 01 A8 67 31 11 25 16 B8 01 40 
    //88 31 16 39 3F 92 2C 28 2C 06 16 16 04 92 2C 28 2C 06 16 04 25 04 0B 47 
  }


  function int AddMoneyRewards(int Money) {
    mMoneyImagePage.SetVisible(True);                                           //0000 : 19 01 E8 A3 2B 26 07 00 00 1B 14 98 00 00 27 16 
    mMoneyImagePage.SetMoney(Money);                                            //0010 : 19 01 E8 A3 2B 26 0B 00 00 1B 4B 97 00 00 00 88 64 06 1B 16 
    mMoneyImagePage.mLeft = mWidth / 2 - mMoneyImagePage.mWidth / 2;            //0024 : 0F 19 01 E8 A3 2B 26 05 00 04 01 08 86 31 16 AF AC 01 60 87 31 16 39 3F 2C 02 16 AC 19 01 E8 A3 2B 26 05 00 04 01 60 87 31 16 39 3F 2C 02 16 16 
    mMoneyImagePage.mTop = mHeight;                                             //0054 : 0F 19 01 E8 A3 2B 26 05 00 04 01 80 86 31 16 01 40 88 31 16 
    if (Money > 0) {                                                            //0068 : 07 99 00 97 00 88 64 06 1B 25 16 
      mHeight += mMoneyImagePage.mHeight;                                       //0073 : B8 01 40 88 31 16 19 01 E8 A3 2B 26 05 00 04 01 40 88 31 16 16 
      return mMoneyImagePage.mHeight;                                           //0088 : 04 39 44 19 01 E8 A3 2B 26 05 00 04 01 40 88 31 16 
    }
    return 0;                                                                   //0099 : 04 25 
    //19 01 E8 A3 2B 26 07 00 00 1B 14 98 00 00 27 16 19 01 E8 A3 2B 26 0B 00 00 1B 4B 97 00 00 00 88 
    //64 06 1B 16 0F 19 01 E8 A3 2B 26 05 00 04 01 08 86 31 16 AF AC 01 60 87 31 16 39 3F 2C 02 16 AC 
    //19 01 E8 A3 2B 26 05 00 04 01 60 87 31 16 39 3F 2C 02 16 16 0F 19 01 E8 A3 2B 26 05 00 04 01 80 
    //86 31 16 01 40 88 31 16 07 99 00 97 00 88 64 06 1B 25 16 B8 01 40 88 31 16 19 01 E8 A3 2B 26 05 
    //00 04 01 40 88 31 16 16 04 39 44 19 01 E8 A3 2B 26 05 00 04 01 40 88 31 16 04 25 04 0B 47 
  }


  function int AddRewards(array<Quest_Reward> Rewards) {
    local int idx;
    local float offsetY;
    offsetY = mRewardsLabel.mHeight + 6;                                        //0000 : 0F 00 70 D4 2B 26 AE 19 01 68 D8 2B 26 05 00 04 01 40 88 31 16 39 3F 2C 06 16 
    mRewardsLabel.mWidth = GetClientWidth();                                    //001A : 0F 19 01 68 D8 2B 26 05 00 04 01 60 87 31 16 1B 17 98 00 00 16 
    mHeight = offsetY;                                                          //002F : 0F 01 40 88 31 16 00 70 D4 2B 26 
    idx = 0;                                                                    //003A : 0F 00 E8 D4 2B 26 25 
    while (idx < Rewards.Length) {                                              //0041 : 07 21 01 96 00 E8 D4 2B 26 37 00 E8 DB 2C 26 16 
      if (Rewards[idx].IsA('QR_Money')) {                                       //0051 : 07 93 00 19 10 00 E8 D4 2B 26 00 E8 DB 2C 26 08 00 04 61 2F 21 A6 08 00 00 16 
        offsetY += AddMoneyRewards(QR_Money(Rewards[idx]).Money);               //006B : B8 00 70 D4 2B 26 39 3F 1B 49 9B 00 00 19 2E 90 6A 8D 01 10 00 E8 D4 2B 26 00 E8 DB 2C 26 05 00 04 01 08 58 33 19 16 16 
      }
      if (Rewards[idx].IsA('QR_Item')) {                                        //0093 : 07 D5 00 19 10 00 E8 D4 2B 26 00 E8 DB 2C 26 08 00 04 61 2F 21 A7 08 00 00 16 
        offsetY += AddItemRewards(QR_Item(Rewards[idx]).RewardItems);           //00AD : B8 00 70 D4 2B 26 39 3F 1B 4A 9B 00 00 19 2E 50 65 8D 01 10 00 E8 D4 2B 26 00 E8 DB 2C 26 05 00 04 01 30 5A 33 19 16 16 
      }
      if (Rewards[idx].IsA('QR_Skill')) {                                       //00D5 : 07 17 01 19 10 00 E8 D4 2B 26 00 E8 DB 2C 26 08 00 04 61 2F 21 A4 08 00 00 16 
        offsetY += AddSkillRewards(QR_Skill(Rewards[idx]).learnedSkill);        //00EF : B8 00 70 D4 2B 26 39 3F 1B 4B 9B 00 00 19 2E D0 6F 8D 01 10 00 E8 D4 2B 26 00 E8 DB 2C 26 05 00 04 01 A8 55 33 19 16 16 
      }
      ++idx;                                                                    //0117 : A3 00 E8 D4 2B 26 16 
    }
    if (offsetY > mRewardsLabel.mHeight + 6) {                                  //0121 : 07 6E 01 B1 00 70 D4 2B 26 AE 19 01 68 D8 2B 26 05 00 04 01 40 88 31 16 39 3F 2C 06 16 16 
      mRewardsLabel.SetVisible(True);                                           //013F : 19 01 68 D8 2B 26 07 00 00 1B 14 98 00 00 27 16 
      mHeight += 6;                                                             //014F : B8 01 40 88 31 16 39 3F 2C 06 16 
      offsetY += 6;                                                             //015A : B8 00 70 D4 2B 26 39 3F 2C 06 16 
      Invalidate();                                                             //0165 : 1B 1D 98 00 00 16 
    } else {                                                                    //016B : 06 84 01 
      mHeight = 0.00000000;                                                     //016E : 0F 01 40 88 31 16 1E 00 00 00 00 
      offsetY = 0.00000000;                                                     //0179 : 0F 00 70 D4 2B 26 1E 00 00 00 00 
    }
    return offsetY;                                                             //0184 : 04 39 44 00 70 D4 2B 26 
    //0F 00 70 D4 2B 26 AE 19 01 68 D8 2B 26 05 00 04 01 40 88 31 16 39 3F 2C 06 16 0F 19 01 68 D8 2B 
    //26 05 00 04 01 60 87 31 16 1B 17 98 00 00 16 0F 01 40 88 31 16 00 70 D4 2B 26 0F 00 E8 D4 2B 26 
    //25 07 21 01 96 00 E8 D4 2B 26 37 00 E8 DB 2C 26 16 07 93 00 19 10 00 E8 D4 2B 26 00 E8 DB 2C 26 
    //08 00 04 61 2F 21 A6 08 00 00 16 B8 00 70 D4 2B 26 39 3F 1B 49 9B 00 00 19 2E 90 6A 8D 01 10 00 
    //E8 D4 2B 26 00 E8 DB 2C 26 05 00 04 01 08 58 33 19 16 16 07 D5 00 19 10 00 E8 D4 2B 26 00 E8 DB 
    //2C 26 08 00 04 61 2F 21 A7 08 00 00 16 B8 00 70 D4 2B 26 39 3F 1B 4A 9B 00 00 19 2E 50 65 8D 01 
    //10 00 E8 D4 2B 26 00 E8 DB 2C 26 05 00 04 01 30 5A 33 19 16 16 07 17 01 19 10 00 E8 D4 2B 26 00 
    //E8 DB 2C 26 08 00 04 61 2F 21 A4 08 00 00 16 B8 00 70 D4 2B 26 39 3F 1B 4B 9B 00 00 19 2E D0 6F 
    //8D 01 10 00 E8 D4 2B 26 00 E8 DB 2C 26 05 00 04 01 A8 55 33 19 16 16 A3 00 E8 D4 2B 26 16 06 41 
    //00 07 6E 01 B1 00 70 D4 2B 26 AE 19 01 68 D8 2B 26 05 00 04 01 40 88 31 16 39 3F 2C 06 16 16 19 
    //01 68 D8 2B 26 07 00 00 1B 14 98 00 00 27 16 B8 01 40 88 31 16 39 3F 2C 06 16 B8 00 70 D4 2B 26 
    //39 3F 2C 06 16 1B 1D 98 00 00 16 06 84 01 0F 01 40 88 31 16 1E 00 00 00 00 0F 00 70 D4 2B 26 1E 
    //00 00 00 00 04 39 44 00 70 D4 2B 26 04 0B 47 
  }


  function ClearRewards() {
    local int idx;
    mRewardsLabel.SetVisible(False);                                            //0000 : 19 01 68 D8 2B 26 07 00 00 1B 14 98 00 00 28 16 
    mMoneyImagePage.SetMoney(0);                                                //0010 : 19 01 E8 A3 2B 26 07 00 00 1B 4B 97 00 00 25 16 
    mMoneyImagePage.SetVisible(False);                                          //0020 : 19 01 E8 A3 2B 26 07 00 00 1B 14 98 00 00 28 16 
    idx = 0;                                                                    //0030 : 0F 00 D0 60 2B 26 25 
    while (idx < mRewardsItemButtons.Length) {                                  //0037 : 07 79 00 96 00 D0 60 2B 26 37 01 78 D7 2B 26 16 
      mRewardsItemButtons[idx].ResetToolTipObject("");                          //0047 : 19 10 00 D0 60 2B 26 01 78 D7 2B 26 08 00 00 1B 35 97 00 00 1F 00 16 
      DestroyComponent(mRewardsItemButtons[idx]);                               //005E : 1B 4D 98 00 00 10 00 D0 60 2B 26 01 78 D7 2B 26 16 
      ++idx;                                                                    //006F : A3 00 D0 60 2B 26 16 
    }
    mRewardsItemButtons.Length = 0;                                             //0079 : 0F 37 01 78 D7 2B 26 25 
    idx = 0;                                                                    //0081 : 0F 00 D0 60 2B 26 25 
    while (idx < mRewardsSkillButtons.Length) {                                 //0088 : 07 CA 00 96 00 D0 60 2B 26 37 01 00 D7 2B 26 16 
      mRewardsSkillButtons[idx].ResetToolTipObject("");                         //0098 : 19 10 00 D0 60 2B 26 01 00 D7 2B 26 08 00 00 1B 35 97 00 00 1F 00 16 
      DestroyComponent(mRewardsSkillButtons[idx]);                              //00AF : 1B 4D 98 00 00 10 00 D0 60 2B 26 01 00 D7 2B 26 16 
      ++idx;                                                                    //00C0 : A3 00 D0 60 2B 26 16 
    }
    mRewardsSkillButtons.Length = 0;                                            //00CA : 0F 37 01 00 D7 2B 26 25 
    mHeight = 0.00000000;                                                       //00D2 : 0F 01 40 88 31 16 1E 00 00 00 00 
    //19 01 68 D8 2B 26 07 00 00 1B 14 98 00 00 28 16 19 01 E8 A3 2B 26 07 00 00 1B 4B 97 00 00 25 16 
    //19 01 E8 A3 2B 26 07 00 00 1B 14 98 00 00 28 16 0F 00 D0 60 2B 26 25 07 79 00 96 00 D0 60 2B 26 
    //37 01 78 D7 2B 26 16 19 10 00 D0 60 2B 26 01 78 D7 2B 26 08 00 00 1B 35 97 00 00 1F 00 16 1B 4D 
    //98 00 00 10 00 D0 60 2B 26 01 78 D7 2B 26 16 A3 00 D0 60 2B 26 16 06 37 00 0F 37 01 78 D7 2B 26 
    //25 0F 00 D0 60 2B 26 25 07 CA 00 96 00 D0 60 2B 26 37 01 00 D7 2B 26 16 19 10 00 D0 60 2B 26 01 
    //00 D7 2B 26 08 00 00 1B 35 97 00 00 1F 00 16 1B 4D 98 00 00 10 00 D0 60 2B 26 01 00 D7 2B 26 16 
    //A3 00 D0 60 2B 26 16 06 88 00 0F 37 01 00 D7 2B 26 25 0F 01 40 88 31 16 1E 00 00 00 00 04 0B 47 
    //
  }


  event Initialize() {
    mRewardsLabel = CreateLabel("GUI_Label",0,512 | 2048,0,0,0,8);              //0000 : 0F 01 68 D8 2B 26 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 1D 00 02 00 00 1D 00 08 00 00 16 25 25 25 2C 08 16 
    mRewardsLabel.SetFont("SBFontsTX.Verdana09");                               //0029 : 19 01 68 D8 2B 26 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 30 39 00 16 
    mRewardsLabel.SetColor(0,0,0);                                              //004D : 19 01 68 D8 2B 26 09 00 00 1B 19 98 00 00 25 25 25 16 
    mRewardsLabel.SetText("Rewards:");                                          //005F : 19 01 68 D8 2B 26 10 00 00 1B 13 98 00 00 1F 52 65 77 61 72 64 73 3A 00 16 
    mMoneyImagePage = HUD_MoneyPageShort(CreatePage("HUD_MoneyPageShort",0,0,0,0));//0078 : 0F 01 E8 A3 2B 26 2E 30 80 30 1D 1B 16 98 00 00 1F 48 55 44 5F 4D 6F 6E 65 79 50 61 67 65 53 68 6F 72 74 00 25 25 25 25 16 
    ClearRewards();                                                             //00A1 : 1B 53 99 00 00 16 
    //0F 01 68 D8 2B 26 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 1D 00 02 00 00 1D 00 08 
    //00 00 16 25 25 25 2C 08 16 19 01 68 D8 2B 26 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 
    //58 2E 56 65 72 64 61 6E 61 30 39 00 16 19 01 68 D8 2B 26 09 00 00 1B 19 98 00 00 25 25 25 16 19 
    //01 68 D8 2B 26 10 00 00 1B 13 98 00 00 1F 52 65 77 61 72 64 73 3A 00 16 0F 01 E8 A3 2B 26 2E 30 
    //80 30 1D 1B 16 98 00 00 1F 48 55 44 5F 4D 6F 6E 65 79 50 61 67 65 53 68 6F 72 74 00 25 25 25 25 
    //16 1B 53 99 00 00 16 04 0B 47 
  }



