//==============================================================================
//  Login_PlayerController
//==============================================================================

class Login_PlayerController extends Base_Controller
    native
    exportstructs
    dependsOn()
    Config(User)
  ;

  struct UniverseInfo {
      var int Id;
      var string Name;
      var string Language;
      var string Type;
      var string Population;

  };


  var array<UniverseInfo> mUniverses;
  var (null);
  var (null);


  delegate HandleUniverseSelectionResult(bool aSuccess,int aResult);


  delegate HandleLoginResult(bool aSuccess,int aResult);



