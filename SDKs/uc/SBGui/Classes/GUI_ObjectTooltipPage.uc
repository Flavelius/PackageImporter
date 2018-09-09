//==============================================================================
//  GUI_ObjectTooltipPage
//==============================================================================

class GUI_ObjectTooltipPage extends GUI_Page
    native
    exportstructs
    dependsOn(GUI_TextCtrl,Class,Canvas,GUI_Desktop,GUI_DefaultToolkit,Help_Article,GUI_Label)
    Transient
    Config(User)
  ;

  const FOOTNOTE_B =  183;
  const FOOTNOTE_G =  183;
  const FOOTNOTE_R =  183;
  const FOOTNOTE_LABEL_B =  255;
  const FOOTNOTE_LABEL_G =  208;
  const FOOTNOTE_LABEL_R =  76;
  const SUBHEADER_HEIGHT =  16;
  const MAINHEADER_HEIGHT =  15;
  struct Footnote {
      var export editinline Help_Article Article;
      var string FormattedBody;
      var GUI_Page page;

  };


  var Object mObject;
  var int mDefaultWidth;
  var bool mHelpArticlesPackageLoaded;
  var GUI_Page mMainHeader;
  var GUI_Page mSubHeader;
  var GUI_TextCtrl mHeaderMLLabel;
  var GUI_Label mHeaderMRLabel;
  var GUI_Label mHeaderSLLabel;
  var GUI_Label mHeaderSRLabel;
  var GUI_Page mDescription;
  var array<GUI_Page> mLinePages;
  var array<Footnote> mFootnotes;


  event AddLine(string aText,optional Color aForegroundColor,optional Color aBackgroundColor) {
    local GUI_TextCtrl descriptionText;
    local int currentLine;
    if (aText != "") {                                                          //0000 : 07 E0 01 7B 00 A0 DC A6 19 1F 00 16 
      currentLine = mLinePages.Length;                                          //000C : 0F 00 D8 DF A6 19 37 01 50 E0 A6 19 
      mLinePages[currentLine] = CreatePage("GUI_Page",0,0,0,mHeight,GetClientWidth(),0);//0018 : 0F 10 00 D8 DF A6 19 01 50 E0 A6 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 39 44 01 40 88 31 16 39 44 1B 17 98 00 00 16 25 16 
      mLinePages[currentLine].SetBorder(4,0,4,0);                               //0047 : 19 10 00 D8 DF A6 19 01 50 E0 A6 19 0C 00 00 1B 2B 98 00 00 2C 04 25 2C 04 25 16 
      if (aBackgroundColor.A != 0) {                                            //0062 : 07 B9 00 9B 39 3A 36 48 91 6A 0F 00 C8 E0 A6 19 25 16 
        mLinePages[currentLine].SetSolidBackground(aBackgroundColor.R,aBackgroundColor.G,aBackgroundColor.B,aBackgroundColor.A);//0074 : 19 10 00 D8 DF A6 19 01 50 E0 A6 19 36 00 00 1B 52 98 00 00 39 3C 36 D0 90 6A 0F 00 C8 E0 A6 19 39 3C 36 58 90 6A 0F 00 C8 E0 A6 19 39 3C 36 E0 8F 6A 0F 00 C8 E0 A6 19 39 3C 36 48 91 6A 0F 00 C8 E0 A6 19 16 
      }
      descriptionText = GUI_TextCtrl(mLinePages[currentLine].CreatePage("GUI_TextCtrl",0,256,0,0,mLinePages[currentLine].GetClientWidth(),20));//00B9 : 0F 00 40 E1 A6 19 2E 20 79 2F 1D 19 10 00 D8 DF A6 19 01 50 E0 A6 19 35 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 1D 00 01 00 00 25 25 39 44 19 10 00 D8 DF A6 19 01 50 E0 A6 19 06 00 04 1B 17 98 00 00 16 2C 14 16 
      descriptionText.SetFont("SBFontsTX.Verdana10");                           //0108 : 19 00 40 E1 A6 19 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 
      if (aForegroundColor.A != 0) {                                            //012C : 07 7D 01 9B 39 3A 36 48 91 6A 0F 00 B8 E1 A6 19 25 16 
        descriptionText.SetColor(aForegroundColor.R,aForegroundColor.G,aForegroundColor.B,aForegroundColor.A);//013E : 19 00 40 E1 A6 19 36 00 00 1B 19 98 00 00 39 3A 36 D0 90 6A 0F 00 B8 E1 A6 19 39 3A 36 58 90 6A 0F 00 B8 E1 A6 19 39 3A 36 E0 8F 6A 0F 00 B8 E1 A6 19 39 3A 36 48 91 6A 0F 00 B8 E1 A6 19 16 
      }
      descriptionText.SetText(ParseFootnotes(aText,aForegroundColor,Class'Canvas'.static.MakeColor(76,208,255)));//017D : 19 00 40 E1 A6 19 2D 00 00 1B 13 98 00 00 1B BB 99 00 00 00 A0 DC A6 19 00 B8 E1 A6 19 12 20 88 EE C2 00 0E 00 04 1C 88 EB 76 0F 24 4C 24 D0 39 3D 2C FF 16 16 16 
      UpdateHeight(mLinePages[currentLine],descriptionText);                    //01B3 : 1B 45 98 00 00 10 00 D8 DF A6 19 01 50 E0 A6 19 00 40 E1 A6 19 16 
      UpdateHeight(self,mLinePages[currentLine],1.00000000);                    //01C9 : 1B 45 98 00 00 17 10 00 D8 DF A6 19 01 50 E0 A6 19 1E 00 00 80 3F 16 
    }
    //07 E0 01 7B 00 A0 DC A6 19 1F 00 16 0F 00 D8 DF A6 19 37 01 50 E0 A6 19 0F 10 00 D8 DF A6 19 01 
    //50 E0 A6 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 39 44 01 40 88 31 16 39 44 1B 
    //17 98 00 00 16 25 16 19 10 00 D8 DF A6 19 01 50 E0 A6 19 0C 00 00 1B 2B 98 00 00 2C 04 25 2C 04 
    //25 16 07 B9 00 9B 39 3A 36 48 91 6A 0F 00 C8 E0 A6 19 25 16 19 10 00 D8 DF A6 19 01 50 E0 A6 19 
    //36 00 00 1B 52 98 00 00 39 3C 36 D0 90 6A 0F 00 C8 E0 A6 19 39 3C 36 58 90 6A 0F 00 C8 E0 A6 19 
    //39 3C 36 E0 8F 6A 0F 00 C8 E0 A6 19 39 3C 36 48 91 6A 0F 00 C8 E0 A6 19 16 0F 00 40 E1 A6 19 2E 
    //20 79 2F 1D 19 10 00 D8 DF A6 19 01 50 E0 A6 19 35 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 
    //74 43 74 72 6C 00 25 1D 00 01 00 00 25 25 39 44 19 10 00 D8 DF A6 19 01 50 E0 A6 19 06 00 04 1B 
    //17 98 00 00 16 2C 14 16 19 00 40 E1 A6 19 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 
    //2E 56 65 72 64 61 6E 61 31 30 00 16 07 7D 01 9B 39 3A 36 48 91 6A 0F 00 B8 E1 A6 19 25 16 19 00 
    //40 E1 A6 19 36 00 00 1B 19 98 00 00 39 3A 36 D0 90 6A 0F 00 B8 E1 A6 19 39 3A 36 58 90 6A 0F 00 
    //B8 E1 A6 19 39 3A 36 E0 8F 6A 0F 00 B8 E1 A6 19 39 3A 36 48 91 6A 0F 00 B8 E1 A6 19 16 19 00 40 
    //E1 A6 19 2D 00 00 1B 13 98 00 00 1B BB 99 00 00 00 A0 DC A6 19 00 B8 E1 A6 19 12 20 88 EE C2 00 
    //0E 00 04 1C 88 EB 76 0F 24 4C 24 D0 39 3D 2C FF 16 16 16 1B 45 98 00 00 10 00 D8 DF A6 19 01 50 
    //E0 A6 19 00 40 E1 A6 19 16 1B 45 98 00 00 17 10 00 D8 DF A6 19 01 50 E0 A6 19 1E 00 00 80 3F 16 
    //04 0B 47 
  }


  function AddDescription(string aDescription) {
    local GUI_TextCtrl descriptionText;
    if (aDescription != "") {                                                   //0000 : 07 43 01 7B 00 E0 E2 A6 19 1F 00 16 
      mDescription = CreatePage("GUI_Page",0,0,0,mHeight,GetClientWidth(),0);   //000C : 0F 01 58 E3 A6 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 39 44 01 40 88 31 16 39 44 1B 17 98 00 00 16 25 16 
      mDescription.SetBorder(4,0,4,0);                                          //0035 : 19 01 58 E3 A6 19 0C 00 00 1B 2B 98 00 00 2C 04 25 2C 04 25 16 
      descriptionText = GUI_TextCtrl(mDescription.CreatePage("GUI_TextCtrl",0,256,0,0,mDescription.GetClientWidth(),20));//004A : 0F 00 D0 E3 A6 19 2E 20 79 2F 1D 19 01 58 E3 A6 19 2F 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 1D 00 01 00 00 25 25 39 44 19 01 58 E3 A6 19 06 00 04 1B 17 98 00 00 16 2C 14 16 
      descriptionText.SetFont("SBFontsTX.Verdana10");                           //008D : 19 00 D0 E3 A6 19 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 
      descriptionText.SetColor(255,255,255);                                    //00B1 : 19 00 D0 E3 A6 19 0C 00 00 1B 19 98 00 00 2C FF 2C FF 2C FF 16 
      descriptionText.SetUseColorCodes(True);                                   //00C6 : 19 00 D0 E3 A6 19 07 00 00 1B CB 98 00 00 27 16 
      descriptionText.SetText(ParseFootnotes(aDescription,Class'Canvas'.static.MakeColor(255,255,255),Class'Canvas'.static.MakeColor(76,208,255)));//00D6 : 19 00 D0 E3 A6 19 43 00 00 1B 13 98 00 00 1B BB 99 00 00 00 E0 E2 A6 19 12 20 88 EE C2 00 12 00 04 1C 88 EB 76 0F 39 3D 2C FF 39 3D 2C FF 39 3D 2C FF 16 12 20 88 EE C2 00 0E 00 04 1C 88 EB 76 0F 24 4C 24 D0 39 3D 2C FF 16 16 16 
      UpdateHeight(mDescription,descriptionText);                               //0122 : 1B 45 98 00 00 01 58 E3 A6 19 00 D0 E3 A6 19 16 
      UpdateHeight(self,mDescription,2.00000000);                               //0132 : 1B 45 98 00 00 17 01 58 E3 A6 19 1E 00 00 00 40 16 
    }
    //07 43 01 7B 00 E0 E2 A6 19 1F 00 16 0F 01 58 E3 A6 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 
    //00 25 25 25 39 44 01 40 88 31 16 39 44 1B 17 98 00 00 16 25 16 19 01 58 E3 A6 19 0C 00 00 1B 2B 
    //98 00 00 2C 04 25 2C 04 25 16 0F 00 D0 E3 A6 19 2E 20 79 2F 1D 19 01 58 E3 A6 19 2F 00 04 1B 16 
    //98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 1D 00 01 00 00 25 25 39 44 19 01 58 E3 A6 
    //19 06 00 04 1B 17 98 00 00 16 2C 14 16 19 00 D0 E3 A6 19 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 
    //6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 19 00 D0 E3 A6 19 0C 00 00 1B 19 98 00 00 2C 
    //FF 2C FF 2C FF 16 19 00 D0 E3 A6 19 07 00 00 1B CB 98 00 00 27 16 19 00 D0 E3 A6 19 43 00 00 1B 
    //13 98 00 00 1B BB 99 00 00 00 E0 E2 A6 19 12 20 88 EE C2 00 12 00 04 1C 88 EB 76 0F 39 3D 2C FF 
    //39 3D 2C FF 39 3D 2C FF 16 12 20 88 EE C2 00 0E 00 04 1C 88 EB 76 0F 24 4C 24 D0 39 3D 2C FF 16 
    //16 16 1B 45 98 00 00 01 58 E3 A6 19 00 D0 E3 A6 19 16 1B 45 98 00 00 17 01 58 E3 A6 19 1E 00 00 
    //00 40 16 04 0B 47 
  }


  native function Help_Article GetHelpArticle(string aHelpTag);


  private protected event AddFootnotes() {
    local int idx;
    local GUI_TextCtrl lDescriptionText;
    local Footnote Footnote;
    local string s;
    SetClientHeight(mHeight + 3);                                               //0000 : 1B 0B 99 00 00 AE 01 40 88 31 16 39 3F 2C 03 16 16 
    idx = 0;                                                                    //0011 : 0F 00 D0 E6 A6 19 25 
    while (idx < mFootnotes.Length) {                                           //0018 : 07 13 02 96 00 D0 E6 A6 19 37 01 50 EA A6 19 16 
      if (mFootnotes[idx].page == None) {                                       //0028 : 07 92 00 72 36 50 EB A6 19 10 00 D0 E6 A6 19 01 50 EA A6 19 2A 16 
        mFootnotes[idx].page = CreatePage("GUI_Page",0,0,0,mHeight,GetClientWidth(),0);//003E : 0F 36 50 EB A6 19 10 00 D0 E6 A6 19 01 50 EA A6 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 39 44 01 40 88 31 16 39 44 1B 17 98 00 00 16 25 16 
        mFootnotes[idx].page.SetBorder(4,0,4,0);                                //0072 : 19 36 50 EB A6 19 10 00 D0 E6 A6 19 01 50 EA A6 19 0C 00 00 1B 2B 98 00 00 2C 04 25 2C 04 25 16 
      }
      Footnote = mFootnotes[idx];                                               //0092 : 0F 00 C8 EB A6 19 10 00 D0 E6 A6 19 01 50 EA A6 19 
      lDescriptionText = GUI_TextCtrl(Footnote.page.CreatePage("GUI_TextCtrl",0,256,0,0,Footnote.page.GetClientWidth(),20));//00A3 : 0F 00 40 EC A6 19 2E 20 79 2F 1D 19 36 50 EB A6 19 00 C8 EB A6 19 34 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 1D 00 01 00 00 25 25 39 44 19 36 50 EB A6 19 00 C8 EB A6 19 06 00 04 1B 17 98 00 00 16 2C 14 16 
      lDescriptionText.SetFont("SBFontsTX.Verdana10");                          //00F0 : 19 00 40 EC A6 19 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 
      lDescriptionText.SetColor(183,183,183);                                   //0114 : 19 00 40 EC A6 19 0C 00 00 1B 19 98 00 00 2C B7 2C B7 2C B7 16 
      lDescriptionText.SetUseColorCodes(True);                                  //0129 : 19 00 40 EC A6 19 07 00 00 1B CB 98 00 00 27 16 
      s = GUI_DefaultToolkit(mDesktop.mToolkit).SetTextColor("",76,208,255);    //0139 : 0F 00 B8 EC A6 19 19 2E F0 D5 2E 1D 19 01 48 0C 9D 19 05 00 04 01 B8 A4 97 19 10 00 00 1B E2 99 00 00 1F 00 24 4C 24 D0 39 3D 2C FF 16 
      s = s $ Footnote.Article.Title.Text;                                      //0166 : 0F 00 B8 EC A6 19 70 00 B8 EC A6 19 36 58 C6 6B 0F 19 36 30 ED A6 19 00 C8 EB A6 19 05 00 0C 01 B0 77 7F 0F 16 
      s = GUI_DefaultToolkit(mDesktop.mToolkit).SetTextColor(s,183,183,183);    //018B : 0F 00 B8 EC A6 19 19 2E F0 D5 2E 1D 19 01 48 0C 9D 19 05 00 04 01 B8 A4 97 19 11 00 00 1B E2 99 00 00 00 B8 EC A6 19 24 B7 24 B7 24 B7 16 
      lDescriptionText.SetText(s @ ":" @ Footnote.FormattedBody);               //01B9 : 19 00 40 EC A6 19 1C 00 00 1B 13 98 00 00 A8 A8 00 B8 EC A6 19 1F 3A 00 16 36 A8 ED A6 19 00 C8 EB A6 19 16 16 
      UpdateHeight(Footnote.page,lDescriptionText);                             //01DE : 1B 45 98 00 00 36 50 EB A6 19 00 C8 EB A6 19 00 40 EC A6 19 16 
      UpdateHeight(self,Footnote.page,2.00000000);                              //01F3 : 1B 45 98 00 00 17 36 50 EB A6 19 00 C8 EB A6 19 1E 00 00 00 40 16 
      idx++;                                                                    //0209 : A5 00 D0 E6 A6 19 16 
    }
    //1B 0B 99 00 00 AE 01 40 88 31 16 39 3F 2C 03 16 16 0F 00 D0 E6 A6 19 25 07 13 02 96 00 D0 E6 A6 
    //19 37 01 50 EA A6 19 16 07 92 00 72 36 50 EB A6 19 10 00 D0 E6 A6 19 01 50 EA A6 19 2A 16 0F 36 
    //50 EB A6 19 10 00 D0 E6 A6 19 01 50 EA A6 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 
    //25 39 44 01 40 88 31 16 39 44 1B 17 98 00 00 16 25 16 19 36 50 EB A6 19 10 00 D0 E6 A6 19 01 50 
    //EA A6 19 0C 00 00 1B 2B 98 00 00 2C 04 25 2C 04 25 16 0F 00 C8 EB A6 19 10 00 D0 E6 A6 19 01 50 
    //EA A6 19 0F 00 40 EC A6 19 2E 20 79 2F 1D 19 36 50 EB A6 19 00 C8 EB A6 19 34 00 04 1B 16 98 00 
    //00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 1D 00 01 00 00 25 25 39 44 19 36 50 EB A6 19 00 
    //C8 EB A6 19 06 00 04 1B 17 98 00 00 16 2C 14 16 19 00 40 EC A6 19 1B 00 00 1B 25 98 00 00 1F 53 
    //42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 19 00 40 EC A6 19 0C 00 00 1B 19 98 
    //00 00 2C B7 2C B7 2C B7 16 19 00 40 EC A6 19 07 00 00 1B CB 98 00 00 27 16 0F 00 B8 EC A6 19 19 
    //2E F0 D5 2E 1D 19 01 48 0C 9D 19 05 00 04 01 B8 A4 97 19 10 00 00 1B E2 99 00 00 1F 00 24 4C 24 
    //D0 39 3D 2C FF 16 0F 00 B8 EC A6 19 70 00 B8 EC A6 19 36 58 C6 6B 0F 19 36 30 ED A6 19 00 C8 EB 
    //A6 19 05 00 0C 01 B0 77 7F 0F 16 0F 00 B8 EC A6 19 19 2E F0 D5 2E 1D 19 01 48 0C 9D 19 05 00 04 
    //01 B8 A4 97 19 11 00 00 1B E2 99 00 00 00 B8 EC A6 19 24 B7 24 B7 24 B7 16 19 00 40 EC A6 19 1C 
    //00 00 1B 13 98 00 00 A8 A8 00 B8 EC A6 19 1F 3A 00 16 36 A8 ED A6 19 00 C8 EB A6 19 16 16 1B 45 
    //98 00 00 36 50 EB A6 19 00 C8 EB A6 19 00 40 EC A6 19 16 1B 45 98 00 00 17 36 50 EB A6 19 00 C8 
    //EB A6 19 1E 00 00 00 40 16 A5 00 D0 E6 A6 19 16 06 18 00 04 0B 47 
  }


  native function string ParseFootnotes(string aInputString,Color aMainTextColor,Color aFootnoteLabelColor);


  function SetHeaderLabelText(GUI_Label aLabel,string aText,optional Color aColor) {
    aLabel.SetText(aText);                                                      //0000 : 19 00 20 F2 A6 19 0B 00 00 1B 13 98 00 00 00 C8 F3 A6 19 16 
    if (aColor.R != 0 || aColor.G != 0 || aColor.B != 0
      || aColor.A != 0) {//0014 : 07 A4 00 84 84 84 9B 39 3A 36 D0 90 6A 0F 00 40 F4 A6 19 25 16 18 10 00 9B 39 3A 36 58 90 6A 0F 00 40 F4 A6 19 25 16 16 18 10 00 9B 39 3A 36 E0 8F 6A 0F 00 40 F4 A6 19 25 16 16 18 10 00 9B 39 3A 36 48 91 6A 0F 00 40 F4 A6 19 25 16 16 
      aLabel.SetColor(aColor.R,aColor.G,aColor.B,aColor.A);                     //0062 : 19 00 20 F2 A6 19 36 00 00 1B 19 98 00 00 39 3A 36 D0 90 6A 0F 00 40 F4 A6 19 39 3A 36 58 90 6A 0F 00 40 F4 A6 19 39 3A 36 E0 8F 6A 0F 00 40 F4 A6 19 39 3A 36 48 91 6A 0F 00 40 F4 A6 19 16 
    } else {                                                                    //00A1 : 06 BB 00 
      aLabel.SetColor(255,255,255,255);                                         //00A4 : 19 00 20 F2 A6 19 0E 00 00 1B 19 98 00 00 2C FF 2C FF 2C FF 2C FF 16 
    }
    //19 00 20 F2 A6 19 0B 00 00 1B 13 98 00 00 00 C8 F3 A6 19 16 07 A4 00 84 84 84 9B 39 3A 36 D0 90 
    //6A 0F 00 40 F4 A6 19 25 16 18 10 00 9B 39 3A 36 58 90 6A 0F 00 40 F4 A6 19 25 16 16 18 10 00 9B 
    //39 3A 36 E0 8F 6A 0F 00 40 F4 A6 19 25 16 16 18 10 00 9B 39 3A 36 48 91 6A 0F 00 40 F4 A6 19 25 
    //16 16 19 00 20 F2 A6 19 36 00 00 1B 19 98 00 00 39 3A 36 D0 90 6A 0F 00 40 F4 A6 19 39 3A 36 58 
    //90 6A 0F 00 40 F4 A6 19 39 3A 36 E0 8F 6A 0F 00 40 F4 A6 19 39 3A 36 48 91 6A 0F 00 40 F4 A6 19 
    //16 06 BB 00 19 00 20 F2 A6 19 0E 00 00 1B 19 98 00 00 2C FF 2C FF 2C FF 2C FF 16 04 0B 47 
  }


  function AddHeader(string aMLString,string aMRString,string aSLString,string aSRString,optional Color aMLColor,optional Color aMRColor,optional Color aSLColor,optional Color aSRColor) {
    mMainHeader = CreatePage("GUI_Page",0,0,0,mHeight,GetClientWidth(),0);      //0000 : 0F 01 88 FD A6 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 39 44 01 40 88 31 16 39 44 1B 17 98 00 00 16 25 16 
    mMainHeader.SetBorder(4,1,4,1);                                             //0029 : 19 01 88 FD A6 19 0C 00 00 1B 2B 98 00 00 2C 04 26 2C 04 26 16 
    if (aMLColor.R != 0 || aMLColor.G != 0
      || aMLColor.B != 0
      || aMLColor.A != 0) {//003E : 07 CE 00 84 84 84 9B 39 3A 36 D0 90 6A 0F 00 00 FE A6 19 25 16 18 10 00 9B 39 3A 36 58 90 6A 0F 00 00 FE A6 19 25 16 16 18 10 00 9B 39 3A 36 E0 8F 6A 0F 00 00 FE A6 19 25 16 16 18 10 00 9B 39 3A 36 48 91 6A 0F 00 00 FE A6 19 25 16 16 
      mMainHeader.SetSolidBackground(aMLColor.R,aMLColor.G,aMLColor.B,aMLColor.A);//008C : 19 01 88 FD A6 19 36 00 00 1B 52 98 00 00 39 3C 36 D0 90 6A 0F 00 00 FE A6 19 39 3C 36 58 90 6A 0F 00 00 FE A6 19 39 3C 36 E0 8F 6A 0F 00 00 FE A6 19 39 3C 36 48 91 6A 0F 00 00 FE A6 19 16 
    } else {                                                                    //00CB : 06 EC 00 
      mMainHeader.SetSolidBackground(158.00000000,154.00000000,168.00000000);   //00CE : 19 01 88 FD A6 19 15 00 00 1B 52 98 00 00 1E 00 00 1E 43 1E 00 00 1A 43 1E 00 00 28 43 16 
    }
    if (aMRString != "") {                                                      //00EC : 07 9A 01 7B 00 78 FE A6 19 1F 00 16 
      mHeaderMLLabel = GUI_TextCtrl(mMainHeader.CreatePage("GUI_TextCtrl",0,4096 | 256 | 2048,0,0,mMainHeader.GetClientWidth() - 30,0));//00F8 : 0F 01 F0 FE A6 19 2E 20 79 2F 1D 19 01 88 FD A6 19 42 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 9E 9E 1D 00 10 00 00 1D 00 01 00 00 16 1D 00 08 00 00 16 25 25 39 44 AF 19 01 88 FD A6 19 06 00 04 1B 17 98 00 00 16 39 3F 2C 1E 16 25 16 
      mHeaderMRLabel = mMainHeader.CreateLabel("GUI_Label",0,4096 | 1024 | 2048,0,0,mMainHeader.GetClientWidth(),15);//014E : 0F 01 68 FF A6 19 19 01 88 FD A6 19 3A 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 9E 1D 00 10 00 00 1D 00 04 00 00 16 1D 00 08 00 00 16 25 25 39 44 19 01 88 FD A6 19 06 00 04 1B 17 98 00 00 16 2C 0F 16 
    } else {                                                                    //0197 : 06 33 02 
      mHeaderMLLabel = GUI_TextCtrl(mMainHeader.CreatePage("GUI_TextCtrl",0,4096 | 256 | 2048,0,0,mMainHeader.GetClientWidth(),0));//019A : 0F 01 F0 FE A6 19 2E 20 79 2F 1D 19 01 88 FD A6 19 3C 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 9E 9E 1D 00 10 00 00 1D 00 01 00 00 16 1D 00 08 00 00 16 25 25 39 44 19 01 88 FD A6 19 06 00 04 1B 17 98 00 00 16 25 16 
      mHeaderMRLabel = mMainHeader.CreateLabel("GUI_Label",0,4096 | 1024 | 2048,0,0,mMainHeader.GetClientWidth(),15);//01EA : 0F 01 68 FF A6 19 19 01 88 FD A6 19 3A 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 9E 1D 00 10 00 00 1D 00 04 00 00 16 1D 00 08 00 00 16 25 25 39 44 19 01 88 FD A6 19 06 00 04 1B 17 98 00 00 16 2C 0F 16 
    }
    mHeaderMLLabel.SetText(aMLString);                                          //0233 : 19 01 F0 FE A6 19 0B 00 00 1B 13 98 00 00 00 68 F5 A6 19 16 
    mHeaderMLLabel.SetColor(0,0,0);                                             //0247 : 19 01 F0 FE A6 19 09 00 00 1B 19 98 00 00 25 25 25 16 
    mHeaderMLLabel.SetFont("SBFontsTX.Verdana12");                              //0259 : 19 01 F0 FE A6 19 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 32 00 16 
    mHeaderMRLabel.SetFont("SBFontsTX.Verdana12");                              //027D : 19 01 68 FF A6 19 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 32 00 16 
    SetHeaderLabelText(mHeaderMRLabel,aMRString,aMRColor);                      //02A1 : 1B 5A 99 00 00 01 68 FF A6 19 00 78 FE A6 19 00 E0 FF A6 19 16 
    mMainHeader.SetVisible(aMLString != "" || aMRString != "");                 //02B6 : 19 01 88 FD A6 19 1D 00 00 1B 14 98 00 00 84 7B 00 68 F5 A6 19 1F 00 16 18 0A 00 7B 00 78 FE A6 19 1F 00 16 16 16 
    if (aMLString != "" || aMRString != "") {                                   //02DC : 07 1C 03 84 7B 00 68 F5 A6 19 1F 00 16 18 0A 00 7B 00 78 FE A6 19 1F 00 16 16 
      UpdateHeight(mMainHeader,mHeaderMLLabel,0.00000000,15.00000000);          //02F6 : 1B 45 98 00 00 01 88 FD A6 19 01 F0 FE A6 19 1E 00 00 00 00 1E 00 00 70 41 16 
      UpdateHeight(self,mMainHeader);                                           //0310 : 1B 45 98 00 00 17 01 88 FD A6 19 16 
    }
    mSubHeader = CreatePage("GUI_Page",0,0,0,mHeight,GetClientWidth(),16);      //031C : 0F 01 58 00 A7 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 39 44 01 40 88 31 16 39 44 1B 17 98 00 00 16 2C 10 16 
    mSubHeader.SetBorder(4,0,4,0);                                              //0346 : 19 01 58 00 A7 19 0C 00 00 1B 2B 98 00 00 2C 04 25 2C 04 25 16 
    mHeaderSLLabel = mSubHeader.CreateLabel("GUI_Label",0,256 | 2048,0,0,mSubHeader.GetClientWidth(),16);//035B : 0F 01 D0 00 A7 19 19 01 58 00 A7 19 33 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 1D 00 01 00 00 1D 00 08 00 00 16 25 25 39 44 19 01 58 00 A7 19 06 00 04 1B 17 98 00 00 16 2C 10 16 
    mHeaderSRLabel = mSubHeader.CreateLabel("GUI_Label",0,1024 | 2048,0,0,mSubHeader.GetClientWidth(),16);//039D : 0F 01 48 01 A7 19 19 01 58 00 A7 19 33 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 1D 00 04 00 00 1D 00 08 00 00 16 25 25 39 44 19 01 58 00 A7 19 06 00 04 1B 17 98 00 00 16 2C 10 16 
    mHeaderSLLabel.SetFont("SBFontsTX.Verdana10");                              //03DF : 19 01 D0 00 A7 19 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 
    mHeaderSRLabel.SetFont("SBFontsTX.Verdana10");                              //0403 : 19 01 48 01 A7 19 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 30 00 16 
    if (aSLColor.R == 0 && aSLColor.G == 0
      && aSLColor.B == 0
      && aSLColor.A == 0) {//0427 : 07 90 04 82 82 82 9A 39 3A 36 D0 90 6A 0F 00 C0 01 A7 19 25 16 18 10 00 9A 39 3A 36 58 90 6A 0F 00 C0 01 A7 19 25 16 16 18 10 00 9A 39 3A 36 E0 8F 6A 0F 00 C0 01 A7 19 25 16 16 18 10 00 9A 39 3A 36 48 91 6A 0F 00 C0 01 A7 19 25 16 16 
      aSLColor = Class'Canvas'.static.MakeColor(183,183,183);                   //0475 : 0F 00 C0 01 A7 19 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 B7 24 B7 24 B7 16 
    }
    if (aSRColor.R == 0 && aSRColor.G == 0
      && aSRColor.B == 0
      && aSRColor.A == 0) {//0490 : 07 F9 04 82 82 82 9A 39 3A 36 D0 90 6A 0F 00 38 02 A7 19 25 16 18 10 00 9A 39 3A 36 58 90 6A 0F 00 38 02 A7 19 25 16 16 18 10 00 9A 39 3A 36 E0 8F 6A 0F 00 38 02 A7 19 25 16 16 18 10 00 9A 39 3A 36 48 91 6A 0F 00 38 02 A7 19 25 16 16 
      aSRColor = Class'Canvas'.static.MakeColor(183,183,183);                   //04DE : 0F 00 38 02 A7 19 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 B7 24 B7 24 B7 16 
    }
    SetHeaderLabelText(mHeaderSLLabel,aSLString,aSLColor);                      //04F9 : 1B 5A 99 00 00 01 D0 00 A7 19 00 B0 02 A7 19 00 C0 01 A7 19 16 
    SetHeaderLabelText(mHeaderSRLabel,aSRString,aSRColor);                      //050E : 1B 5A 99 00 00 01 48 01 A7 19 00 F8 09 A6 19 00 38 02 A7 19 16 
    mSubHeader.SetVisible(aSLString != "" || aSRString != "");                  //0523 : 19 01 58 00 A7 19 1D 00 00 1B 14 98 00 00 84 7B 00 B0 02 A7 19 1F 00 16 18 0A 00 7B 00 F8 09 A6 19 1F 00 16 16 16 
    if (aSLString != "" || aSRString != "") {                                   //0549 : 07 6F 05 84 7B 00 B0 02 A7 19 1F 00 16 18 0A 00 7B 00 F8 09 A6 19 1F 00 16 16 
      UpdateHeight(self,mSubHeader);                                            //0563 : 1B 45 98 00 00 17 01 58 00 A7 19 16 
    }
    //0F 01 88 FD A6 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 39 44 01 40 88 31 16 39 
    //44 1B 17 98 00 00 16 25 16 19 01 88 FD A6 19 0C 00 00 1B 2B 98 00 00 2C 04 26 2C 04 26 16 07 CE 
    //00 84 84 84 9B 39 3A 36 D0 90 6A 0F 00 00 FE A6 19 25 16 18 10 00 9B 39 3A 36 58 90 6A 0F 00 00 
    //FE A6 19 25 16 16 18 10 00 9B 39 3A 36 E0 8F 6A 0F 00 00 FE A6 19 25 16 16 18 10 00 9B 39 3A 36 
    //48 91 6A 0F 00 00 FE A6 19 25 16 16 19 01 88 FD A6 19 36 00 00 1B 52 98 00 00 39 3C 36 D0 90 6A 
    //0F 00 00 FE A6 19 39 3C 36 58 90 6A 0F 00 00 FE A6 19 39 3C 36 E0 8F 6A 0F 00 00 FE A6 19 39 3C 
    //36 48 91 6A 0F 00 00 FE A6 19 16 06 EC 00 19 01 88 FD A6 19 15 00 00 1B 52 98 00 00 1E 00 00 1E 
    //43 1E 00 00 1A 43 1E 00 00 28 43 16 07 9A 01 7B 00 78 FE A6 19 1F 00 16 0F 01 F0 FE A6 19 2E 20 
    //79 2F 1D 19 01 88 FD A6 19 42 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 00 25 
    //9E 9E 1D 00 10 00 00 1D 00 01 00 00 16 1D 00 08 00 00 16 25 25 39 44 AF 19 01 88 FD A6 19 06 00 
    //04 1B 17 98 00 00 16 39 3F 2C 1E 16 25 16 0F 01 68 FF A6 19 19 01 88 FD A6 19 3A 00 04 1B 20 98 
    //00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 9E 1D 00 10 00 00 1D 00 04 00 00 16 1D 00 08 00 00 
    //16 25 25 39 44 19 01 88 FD A6 19 06 00 04 1B 17 98 00 00 16 2C 0F 16 06 33 02 0F 01 F0 FE A6 19 
    //2E 20 79 2F 1D 19 01 88 FD A6 19 3C 00 04 1B 16 98 00 00 1F 47 55 49 5F 54 65 78 74 43 74 72 6C 
    //00 25 9E 9E 1D 00 10 00 00 1D 00 01 00 00 16 1D 00 08 00 00 16 25 25 39 44 19 01 88 FD A6 19 06 
    //00 04 1B 17 98 00 00 16 25 16 0F 01 68 FF A6 19 19 01 88 FD A6 19 3A 00 04 1B 20 98 00 00 1F 47 
    //55 49 5F 4C 61 62 65 6C 00 25 9E 9E 1D 00 10 00 00 1D 00 04 00 00 16 1D 00 08 00 00 16 25 25 39 
    //44 19 01 88 FD A6 19 06 00 04 1B 17 98 00 00 16 2C 0F 16 19 01 F0 FE A6 19 0B 00 00 1B 13 98 00 
    //00 00 68 F5 A6 19 16 19 01 F0 FE A6 19 09 00 00 1B 19 98 00 00 25 25 25 16 19 01 F0 FE A6 19 1B 
    //00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 32 00 16 19 01 68 
    //FF A6 19 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 32 00 
    //16 1B 5A 99 00 00 01 68 FF A6 19 00 78 FE A6 19 00 E0 FF A6 19 16 19 01 88 FD A6 19 1D 00 00 1B 
    //14 98 00 00 84 7B 00 68 F5 A6 19 1F 00 16 18 0A 00 7B 00 78 FE A6 19 1F 00 16 16 16 07 1C 03 84 
    //7B 00 68 F5 A6 19 1F 00 16 18 0A 00 7B 00 78 FE A6 19 1F 00 16 16 1B 45 98 00 00 01 88 FD A6 19 
    //01 F0 FE A6 19 1E 00 00 00 00 1E 00 00 70 41 16 1B 45 98 00 00 17 01 88 FD A6 19 16 0F 01 58 00 
    //A7 19 1B 16 98 00 00 1F 47 55 49 5F 50 61 67 65 00 25 25 25 39 44 01 40 88 31 16 39 44 1B 17 98 
    //00 00 16 2C 10 16 19 01 58 00 A7 19 0C 00 00 1B 2B 98 00 00 2C 04 25 2C 04 25 16 0F 01 D0 00 A7 
    //19 19 01 58 00 A7 19 33 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 1D 00 01 00 
    //00 1D 00 08 00 00 16 25 25 39 44 19 01 58 00 A7 19 06 00 04 1B 17 98 00 00 16 2C 10 16 0F 01 48 
    //01 A7 19 19 01 58 00 A7 19 33 00 04 1B 20 98 00 00 1F 47 55 49 5F 4C 61 62 65 6C 00 25 9E 1D 00 
    //04 00 00 1D 00 08 00 00 16 25 25 39 44 19 01 58 00 A7 19 06 00 04 1B 17 98 00 00 16 2C 10 16 19 
    //01 D0 00 A7 19 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 61 6E 61 31 
    //30 00 16 19 01 48 01 A7 19 1B 00 00 1B 25 98 00 00 1F 53 42 46 6F 6E 74 73 54 58 2E 56 65 72 64 
    //61 6E 61 31 30 00 16 07 90 04 82 82 82 9A 39 3A 36 D0 90 6A 0F 00 C0 01 A7 19 25 16 18 10 00 9A 
    //39 3A 36 58 90 6A 0F 00 C0 01 A7 19 25 16 16 18 10 00 9A 39 3A 36 E0 8F 6A 0F 00 C0 01 A7 19 25 
    //16 16 18 10 00 9A 39 3A 36 48 91 6A 0F 00 C0 01 A7 19 25 16 16 0F 00 C0 01 A7 19 12 20 88 EE C2 
    //00 0C 00 04 1C 88 EB 76 0F 24 B7 24 B7 24 B7 16 07 F9 04 82 82 82 9A 39 3A 36 D0 90 6A 0F 00 38 
    //02 A7 19 25 16 18 10 00 9A 39 3A 36 58 90 6A 0F 00 38 02 A7 19 25 16 16 18 10 00 9A 39 3A 36 E0 
    //8F 6A 0F 00 38 02 A7 19 25 16 16 18 10 00 9A 39 3A 36 48 91 6A 0F 00 38 02 A7 19 25 16 16 0F 00 
    //38 02 A7 19 12 20 88 EE C2 00 0C 00 04 1C 88 EB 76 0F 24 B7 24 B7 24 B7 16 1B 5A 99 00 00 01 D0 
    //00 A7 19 00 B0 02 A7 19 00 C0 01 A7 19 16 1B 5A 99 00 00 01 48 01 A7 19 00 F8 09 A6 19 00 38 02 
    //A7 19 16 19 01 58 00 A7 19 1D 00 00 1B 14 98 00 00 84 7B 00 B0 02 A7 19 1F 00 16 18 0A 00 7B 00 
    //F8 09 A6 19 1F 00 16 16 16 07 6F 05 84 7B 00 B0 02 A7 19 1F 00 16 18 0A 00 7B 00 F8 09 A6 19 1F 
    //00 16 16 1B 45 98 00 00 17 01 58 00 A7 19 16 04 0B 47 
  }


  event bool ShouldUpdate() {
    return False;                                                               //0000 : 04 28 
    //04 28 04 0B 47 
  }


  function bool UpdateTooltipInfo() {
    return True;                                                                //0000 : 04 27 
    //04 27 04 0B 47 
  }


  function bool UpdateTooltipObject(Object aObject) {
    local bool shouldBeShown;
    ResetObjectTooltip();                                                       //0000 : 1B D8 98 00 00 16 
    mObject = aObject;                                                          //0006 : 0F 01 20 EE A6 19 00 D0 0D A6 19 
    shouldBeShown = UpdateTooltipInfo();                                        //0011 : 14 2D 00 C0 0E A6 19 1B 3D 98 00 00 16 
    if (shouldBeShown) {                                                        //001E : 07 2D 00 2D 00 C0 0E A6 19 
      AddFootnotes();                                                           //0027 : 1B AA 96 00 00 16 
    }
    return shouldBeShown;                                                       //002D : 04 2D 00 C0 0E A6 19 
    //1B D8 98 00 00 16 0F 01 20 EE A6 19 00 D0 0D A6 19 14 2D 00 C0 0E A6 19 1B 3D 98 00 00 16 07 2D 
    //00 2D 00 C0 0E A6 19 1B AA 96 00 00 16 04 2D 00 C0 0E A6 19 04 0B 47 
  }


  function ResetObjectTooltip() {
    local int idx;
    mWidth = mDefaultWidth;                                                     //0000 : 0F 01 60 87 31 16 39 3F 01 50 12 A6 19 
    mHeight = 0.00000000;                                                       //000D : 0F 01 40 88 31 16 1E 00 00 00 00 
    if (mMainHeader != None) {                                                  //0018 : 07 35 00 77 01 88 FD A6 19 2A 16 
      DestroyComponent(mMainHeader);                                            //0023 : 1B 4D 98 00 00 01 88 FD A6 19 16 
      mMainHeader = None;                                                       //002E : 0F 01 88 FD A6 19 2A 
    }
    if (mSubHeader != None) {                                                   //0035 : 07 52 00 77 01 58 00 A7 19 2A 16 
      DestroyComponent(mSubHeader);                                             //0040 : 1B 4D 98 00 00 01 58 00 A7 19 16 
      mSubHeader = None;                                                        //004B : 0F 01 58 00 A7 19 2A 
    }
    if (mDescription != None) {                                                 //0052 : 07 6F 00 77 01 58 E3 A6 19 2A 16 
      DestroyComponent(mDescription);                                           //005D : 1B 4D 98 00 00 01 58 E3 A6 19 16 
      mDescription = None;                                                      //0068 : 0F 01 58 E3 A6 19 2A 
    }
    idx = 0;                                                                    //006F : 0F 00 60 10 A6 19 25 
    while (idx < mLinePages.Length) {                                           //0076 : 07 A1 00 96 00 60 10 A6 19 37 01 50 E0 A6 19 16 
      DestroyComponent(mLinePages[idx]);                                        //0086 : 1B 4D 98 00 00 10 00 60 10 A6 19 01 50 E0 A6 19 16 
      ++idx;                                                                    //0097 : A3 00 60 10 A6 19 16 
    }
    mLinePages.Length = 0;                                                      //00A1 : 0F 37 01 50 E0 A6 19 25 
    idx = 0;                                                                    //00A9 : 0F 00 60 10 A6 19 25 
    while (idx < mFootnotes.Length) {                                           //00B0 : 07 E0 00 96 00 60 10 A6 19 37 01 50 EA A6 19 16 
      DestroyComponent(mFootnotes[idx].page);                                   //00C0 : 1B 4D 98 00 00 36 50 EB A6 19 10 00 60 10 A6 19 01 50 EA A6 19 16 
      ++idx;                                                                    //00D6 : A3 00 60 10 A6 19 16 
    }
    mFootnotes.Length = 0;                                                      //00E0 : 0F 37 01 50 EA A6 19 25 
    Invalidate();                                                               //00E8 : 1B 1D 98 00 00 16 
    //0F 01 60 87 31 16 39 3F 01 50 12 A6 19 0F 01 40 88 31 16 1E 00 00 00 00 07 35 00 77 01 88 FD A6 
    //19 2A 16 1B 4D 98 00 00 01 88 FD A6 19 16 0F 01 88 FD A6 19 2A 07 52 00 77 01 58 00 A7 19 2A 16 
    //1B 4D 98 00 00 01 58 00 A7 19 16 0F 01 58 00 A7 19 2A 07 6F 00 77 01 58 E3 A6 19 2A 16 1B 4D 98 
    //00 00 01 58 E3 A6 19 16 0F 01 58 E3 A6 19 2A 0F 00 60 10 A6 19 25 07 A1 00 96 00 60 10 A6 19 37 
    //01 50 E0 A6 19 16 1B 4D 98 00 00 10 00 60 10 A6 19 01 50 E0 A6 19 16 A3 00 60 10 A6 19 16 06 76 
    //00 0F 37 01 50 E0 A6 19 25 0F 00 60 10 A6 19 25 07 E0 00 96 00 60 10 A6 19 37 01 50 EA A6 19 16 
    //1B 4D 98 00 00 36 50 EB A6 19 10 00 60 10 A6 19 01 50 EA A6 19 16 A3 00 60 10 A6 19 16 06 B0 00 
    //0F 37 01 50 EA A6 19 25 1B 1D 98 00 00 16 04 0B 47 
  }


  function Initialize() {
    Super.Initialize();                                                         //0000 : 1C 40 5B 9E 19 16 
    ResetObjectTooltip();                                                       //0006 : 1B D8 98 00 00 16 
    //1C 40 5B 9E 19 16 1B D8 98 00 00 16 04 0B 47 
  }



