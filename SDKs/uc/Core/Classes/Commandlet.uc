//==============================================================================
//  Commandlet
//==============================================================================

class Commandlet extends Object
    native
    abstract
    noexport
    dependsOn()
    Transient
  ;

  var localized string HelpCmd;
  var localized string HelpOneLiner;
  var localized string HelpUsage;
  var localized string HelpWebLink;
  var localized string HelpParm[16];
  var localized string HelpDesc[16];
  var bool LogToStdout;
  var bool _IsServer;
  var bool _IsClient;
  var bool _IsEditor;
  var bool LazyLoad;
  var bool ShowErrorCount;
  var bool ShowBanner;


  native event int Main(string aParms);



