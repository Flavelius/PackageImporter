#if _MSC_VER
#pragma pack (push,4)
#endif

#ifndef NAMES_ONLY
#define AUTOGENERATE_NAME(name) extern DLL_IMPORT FName SBDATABASE_##name;
#define AUTOGENERATE_FUNCTION(cls,num,func) \
  extern DLL_IMPORT Native int##cls##func;
#define AUTOGENERATE_CLASS(TClass) \
  extern DLL_IMPORT UClass* autoclass##TClass;
#define AUTOGENERATE_PACKAGE(pkg) \
  extern DLL_IMPORT TCHAR GPackage[];
#endif







//int CDECL SBDatabase::Resources::CreateResourceId(class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > const &) 12b24f0
//class SBDatabase::StaticConnection * SBDatabase::DB_Static 12be1b4
//int SBDatabase::DB_Static_RefCount 12be1b0
//bool CDECL SBDatabase::DatabaseInitialized(unsigned int) 12b4a20
//int CDECL SBDatabase::LevelProgression::GetAttributePoints(int) 12b4840
//int CDECL SBDatabase::LevelProgression::GetComtbatBarColumns(int) 12b4780
//int CDECL SBDatabase::LevelProgression::GetComtbatBarRows(int) 12b4740
//bool CDECL SBDatabase::Descriptions::GetDescription(int,int,class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > &,int *) 12b2f40
//bool CDECL SBDatabase::Descriptions::GetDescriptionsByLanguage(int,class std::map<int,class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> >,struct std::less<int>,class std::allocator<struct std::pair<int const ,class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > > > > *) 12b3030
//class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const & CDECL SBDatabase::GetDesignVersion(void) 12b4e80
//unsigned __int64 CDECL SBDatabase::GetFailedQueryCount(void) 12b4a60
//int CDECL SBDatabase::LevelProgression::GetFameLevelCount(void) 12b3150
//int CDECL SBDatabase::LevelProgression::GetFameToReachFameLevel(int) 12b4880
//int CDECL SBDatabase::LevelProgression::GetHighestFameLevel(void) 12b3150
//int CDECL SBDatabase::LevelProgression::GetHighestPlayerLevel(void) 12b3160
//float CDECL SBDatabase::LevelProgression::GetKillFame(int) 12b48c0
//void CDECL SBDatabase::LevelProgression::GetLevelProgressions(class std::vector<struct SBDatabase::_static::level_progression_tuple,class std::allocator<struct SBDatabase::_static::level_progression_tuple> > &) 12b4940
//int CDECL SBDatabase::LevelProgression::GetLowestFameLevel(void) 12b3140
//class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > CDECL SBDatabase::Resources::GetPathName(int) 12b2400
//unsigned __int64 CDECL SBDatabase::GetQueryCount(void) 12b4a60
//float CDECL SBDatabase::LevelProgression::GetQuestFame(int) 12b4900
//int CDECL SBDatabase::Resources::GetResourceId(class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > const &) 12b2320
//class std::map<class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> >,int,struct std::less<class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > >,class std::allocator<struct std::pair<class std::basic_string<unsigned short,struct std::char_traits<unsigned short>,class std::allocator<unsigned short> > const ,int> > > const & CDECL SBDatabase::Resources::GetResources(void) 12b2500
//int CDECL SBDatabase::LevelProgression::GetSkillCount(int) 12b47c0
//int CDECL SBDatabase::LevelProgression::GetSkillTier(int) 12b4700
//int CDECL SBDatabase::LevelProgression::GetSkillTokenCount(int) 12b4800
//class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const & CDECL SBDatabase::GetUniverseDatabase(void) 12b4a50
//bool CDECL SBDatabase::InitializeDatabases(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,int,unsigned int) 12b8450
//void CDECL SBDatabase::ShutdownDatabases(unsigned int) 12b86f0
//bool CDECL SBDatabase::LevelProgression::ValidFameLevel(int) 12b3170
//class SBDatabase::_static::static_descriptions * SBDatabase::_static::descriptions 12be1bc
//class SBDatabase::_static::static_languages * SBDatabase::_static::languages 12be1b8
//class SBDatabase::_static::static_level_progression * SBDatabase::_static::level_progression 12be1c4
//class SBDatabase::_static::static_resources * SBDatabase::_static::resources 12be1c0

#ifndef NAMES_ONLY
#undef AUTOGENERATE_NAME
#undef AUTOGENERATET_FUNCTION
#undef AUTOGENERATE_CLASS
#undef AUTOGENERATE_PACKAGE
#endif NAMES_ONLY

#if _MSC_VER
#pragma pack (pop)
#endif

