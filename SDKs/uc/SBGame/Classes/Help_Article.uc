//==============================================================================
//  Help_Article
//==============================================================================

class Help_Article extends Content_Type
    native
    dependsOn()
  ;

  var (Article) string Tag;
  var (Article) LocalizedString Title;
  var (Article) LocalizedString Body;
  var (Article) array<Help_Article> SubArticles;


  function string GetBody() {
    return Body.Text;                                                           //0000 : 04 36 58 C6 6B 0F 01 28 78 7F 0F 
    //04 36 58 C6 6B 0F 01 28 78 7F 0F 04 0B 47 
  }


  function string GetTitle() {
    return Title.Text;                                                          //0000 : 04 36 58 C6 6B 0F 01 B0 77 7F 0F 
    //04 36 58 C6 6B 0F 01 B0 77 7F 0F 04 0B 47 
  }



