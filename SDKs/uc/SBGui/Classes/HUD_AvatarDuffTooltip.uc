//==============================================================================
//  HUD_AvatarDuffTooltip
//==============================================================================

class HUD_AvatarDuffTooltip extends GUI_ObjectTooltipPage
    dependsOn(FSkill_Event_Duff)
    Transient
    Config(User)
  ;

  var export editinline FSkill_Event_Duff mDuff;


  function bool UpdateTooltipInfo() {
    local int startPos;
    local int endPos;
    local export editinline Help_Article Article;
    local string duffName;
    local string duffDescription;
    if (mDuff != None) {                                                        //0000 : 07 FF 00 77 01 70 FD 05 1B 2A 16 
      duffName = mDuff.GetName();                                               //000B : 0F 00 A8 B6 8A 19 19 01 70 FD 05 1B 06 00 00 1C D0 60 33 0F 16 
      startPos = InStr(duffName,"[[");                                          //0020 : 0F 00 08 92 33 26 7E 00 A8 B6 8A 19 1F 5B 5B 00 16 
      endPos = InStr(duffName,"]]");                                            //0031 : 0F 00 30 97 33 26 7E 00 A8 B6 8A 19 1F 5D 5D 00 16 
      if (startPos >= 0 && endPos >= 0) {                                       //0042 : 07 85 00 82 99 00 08 92 33 26 25 16 18 09 00 99 00 30 97 33 26 25 16 16 
        duffName = Mid(duffName,2,Len(duffName) - 4);                           //005A : 0F 00 A8 B6 8A 19 7F 00 A8 B6 8A 19 2C 02 93 7D 00 A8 B6 8A 19 16 2C 04 16 16 
        Article = GetHelpArticle(duffName);                                     //0074 : 0F 00 A8 01 06 1B 1B 56 9A 00 00 00 A8 B6 8A 19 16 
      }
      if (Article != None) {                                                    //0085 : 07 C5 00 77 00 A8 01 06 1B 2A 16 
        duffName = Article.Title.Text;                                          //0090 : 0F 00 A8 B6 8A 19 36 58 C6 6B 0F 19 00 A8 01 06 1B 05 00 0C 01 B0 77 7F 0F 
        duffDescription = Article.Body.Text;                                    //00A9 : 0F 00 F0 56 07 1B 36 58 C6 6B 0F 19 00 A8 01 06 1B 05 00 0C 01 28 78 7F 0F 
      } else {                                                                  //00C2 : 06 DE 00 
        duffDescription = mDuff.Description.Text;                               //00C5 : 0F 00 F0 56 07 1B 36 58 C6 6B 0F 19 01 70 FD 05 1B 05 00 0C 01 18 EC 25 11 
      }
      AddHeader(duffName,"","","");                                             //00DE : 1B 3C 98 00 00 00 A8 B6 8A 19 1F 00 1F 00 1F 00 16 
      AddDescription(duffDescription);                                          //00EF : 1B 48 98 00 00 00 F0 56 07 1B 16 
      return True;                                                              //00FA : 04 27 
    } else {                                                                    //00FC : 06 01 01 
      return False;                                                             //00FF : 04 28 
    }
    //07 FF 00 77 01 70 FD 05 1B 2A 16 0F 00 A8 B6 8A 19 19 01 70 FD 05 1B 06 00 00 1C D0 60 33 0F 16 
    //0F 00 08 92 33 26 7E 00 A8 B6 8A 19 1F 5B 5B 00 16 0F 00 30 97 33 26 7E 00 A8 B6 8A 19 1F 5D 5D 
    //00 16 07 85 00 82 99 00 08 92 33 26 25 16 18 09 00 99 00 30 97 33 26 25 16 16 0F 00 A8 B6 8A 19 
    //7F 00 A8 B6 8A 19 2C 02 93 7D 00 A8 B6 8A 19 16 2C 04 16 16 0F 00 A8 01 06 1B 1B 56 9A 00 00 00 
    //A8 B6 8A 19 16 07 C5 00 77 00 A8 01 06 1B 2A 16 0F 00 A8 B6 8A 19 36 58 C6 6B 0F 19 00 A8 01 06 
    //1B 05 00 0C 01 B0 77 7F 0F 0F 00 F0 56 07 1B 36 58 C6 6B 0F 19 00 A8 01 06 1B 05 00 0C 01 28 78 
    //7F 0F 06 DE 00 0F 00 F0 56 07 1B 36 58 C6 6B 0F 19 01 70 FD 05 1B 05 00 0C 01 18 EC 25 11 1B 3C 
    //98 00 00 00 A8 B6 8A 19 1F 00 1F 00 1F 00 16 1B 48 98 00 00 00 F0 56 07 1B 16 04 27 06 01 01 04 
    //28 04 0B 47 
  }


  function bool UpdateTooltipObject(Object aObject) {
    mDuff = FSkill_Event_Duff(aObject);                                         //0000 : 0F 01 70 FD 05 1B 2E 80 65 5D 01 00 70 74 33 26 
    return Super.UpdateTooltipObject(aObject);                                  //0010 : 04 1C C8 0B A6 19 00 70 74 33 26 16 
    //0F 01 70 FD 05 1B 2E 80 65 5D 01 00 70 74 33 26 04 1C C8 0B A6 19 00 70 74 33 26 16 04 0B 47 
  }



