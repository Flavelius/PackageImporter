#if _MSC_VER
#pragma pack (push,4)
#endif

#ifndef NAMES_ONLY
#define AUTOGENERATE_NAME(name) extern DLL_IMPORT FName SBPARTICLES_##name;
#define AUTOGENERATE_FUNCTION(cls,num,func) \
  extern DLL_IMPORT Native int##cls##func;
#define AUTOGENERATE_CLASS(TClass) \
  extern DLL_IMPORT UClass* autoclass##TClass;
#define AUTOGENERATE_PACKAGE(pkg) \
  extern DLL_IMPORT TCHAR GPackage[];
#endif


//------------------------------------------------------------------------------
//  Resource_Wood_Emitter
//------------------------------------------------------------------------------

// AResource_Wood_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AResource_Wood_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Resource_Stone_Emitter
//------------------------------------------------------------------------------

// AResource_Stone_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AResource_Stone_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Resource_Plant_Emitter
//------------------------------------------------------------------------------

// AResource_Plant_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AResource_Plant_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Resource_Gem_Emitter
//------------------------------------------------------------------------------

// AResource_Gem_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AResource_Gem_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Resource_Metal_Emitter
//------------------------------------------------------------------------------

// AResource_Metal_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AResource_Metal_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  TopicFinishEmitter
//------------------------------------------------------------------------------

// ATopicFinishEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATopicFinishEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  TopicProvideEmitter
//------------------------------------------------------------------------------

// ATopicProvideEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATopicProvideEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  TopicMidEmitter
//------------------------------------------------------------------------------

// ATopicMidEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATopicMidEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Bleeding_Small_Emitter
//------------------------------------------------------------------------------

// ABleeding_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABleeding_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Blood_Hit_Medium_Target_Emitter
//------------------------------------------------------------------------------

// ABlood_Hit_Medium_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABlood_Hit_Medium_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Soul_Tracer
//------------------------------------------------------------------------------

// ASoul_Tracer 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoul_Tracer : public AEmitter {
};


//------------------------------------------------------------------------------
//  Shard_Tracer
//------------------------------------------------------------------------------

// AShard_Tracer 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AShard_Tracer : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Tracer
//------------------------------------------------------------------------------

// ARune_Tracer 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Tracer : public AEmitter {
};


//------------------------------------------------------------------------------
//  Glow_Tracer
//------------------------------------------------------------------------------

// AGlow_Tracer 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AGlow_Tracer : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Tracer
//------------------------------------------------------------------------------

// ASpirit_Tracer 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Tracer : public AEmitter {
};


//------------------------------------------------------------------------------
//  Blood_Tracer
//------------------------------------------------------------------------------

// ABlood_Tracer 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABlood_Tracer : public AEmitter {
};


//------------------------------------------------------------------------------
//  Fire_Tracer
//------------------------------------------------------------------------------

// AFire_Tracer 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_Tracer : public AEmitter {
};


//------------------------------------------------------------------------------
//  Poisoned_Small_Emitter
//------------------------------------------------------------------------------

// APoisoned_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisoned_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Haunted_Medium_Emitter
//------------------------------------------------------------------------------

// AHaunted_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHaunted_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Soul_Hit_Spell_Medium_Target_Emitter
//------------------------------------------------------------------------------

// ASoul_Hit_Spell_Medium_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoul_Hit_Spell_Medium_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Heal_Medium_Emitter
//------------------------------------------------------------------------------

// AHeal_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHeal_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Shock_Medium_Emitter
//------------------------------------------------------------------------------

// AShock_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AShock_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Melee_Hit_Medium_Target_Emitter
//------------------------------------------------------------------------------

// AMelee_Hit_Medium_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AMelee_Hit_Medium_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Burning_Medium_Emitter
//------------------------------------------------------------------------------

// ABurning_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABurning_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Weakened_Ranged_Emitter
//------------------------------------------------------------------------------

// AWeakened_Ranged_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AWeakened_Ranged_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Corrupted_Medium_Emitter
//------------------------------------------------------------------------------

// ACorrupted_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ACorrupted_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritHit_Spell_Large_Emitter
//------------------------------------------------------------------------------

// ASpiritHit_Spell_Large_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritHit_Spell_Large_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritHit_Link_Emitter
//------------------------------------------------------------------------------

// ASpiritHit_Link_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritHit_Link_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Arrow_Hit_Single_Emitter
//------------------------------------------------------------------------------

// AArrow_Hit_Single_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AArrow_Hit_Single_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Melee_Hit_Medium_Source_Emitter
//------------------------------------------------------------------------------

// AMelee_Hit_Medium_Source_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AMelee_Hit_Medium_Source_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Lightning_Hit_1_Emitter
//------------------------------------------------------------------------------

// ALightning_Hit_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ALightning_Hit_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Physique_Diminish_Emitter
//------------------------------------------------------------------------------

// APhysique_Diminish_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APhysique_Diminish_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Hit_Spell_Medium_Target_Emitter
//------------------------------------------------------------------------------

// ARune_Hit_Spell_Medium_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Hit_Spell_Medium_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Backfire_Medium_Emitter
//------------------------------------------------------------------------------

// ABackfire_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABackfire_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Acid_Medium_Emitter
//------------------------------------------------------------------------------

// AAcid_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AAcid_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  BloodFury_Medium_Emitter
//------------------------------------------------------------------------------

// ABloodFury_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABloodFury_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Concentration_Diminish_Emitter
//------------------------------------------------------------------------------

// AConcentration_Diminish_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AConcentration_Diminish_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Explosion_Medium_Emitter
//------------------------------------------------------------------------------

// ASpirit_Explosion_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Explosion_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Teleport_Medium_Emitter
//------------------------------------------------------------------------------

// ATeleport_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATeleport_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Soul_Cast_Spell_1_Emitter
//------------------------------------------------------------------------------

// ASoul_Cast_Spell_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoul_Cast_Spell_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Poison_Shoot_Bow_1_Emitter
//------------------------------------------------------------------------------

// APoison_Shoot_Bow_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoison_Shoot_Bow_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Lightning_Shoot_1_Emitter
//------------------------------------------------------------------------------

// ALightning_Shoot_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ALightning_Shoot_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Lightning_Cone_1_Emitter
//------------------------------------------------------------------------------

// ALightning_Cone_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ALightning_Cone_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  OrangeChain_1_Emitter
//------------------------------------------------------------------------------

// AOrangeChain_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AOrangeChain_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  GrayChain_1_Emitter
//------------------------------------------------------------------------------

// AGrayChain_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AGrayChain_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Weakened_Melee_Emitter
//------------------------------------------------------------------------------

// AWeakened_Melee_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AWeakened_Melee_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritBeam_Medium_Emitter
//------------------------------------------------------------------------------

// ASpiritBeam_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritBeam_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Soul_Cast_Spell_2_Emitter
//------------------------------------------------------------------------------

// ASoul_Cast_Spell_2_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoul_Cast_Spell_2_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Distracted_Medium_Emitter
//------------------------------------------------------------------------------

// ADistracted_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADistracted_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Buff_2_Emitter
//------------------------------------------------------------------------------

// ARune_Buff_2_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Buff_2_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Cast_Spell_1_Emitter
//------------------------------------------------------------------------------

// ARune_Cast_Spell_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Cast_Spell_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Melee_Hit_Small_Target_Emitter
//------------------------------------------------------------------------------

// AMelee_Hit_Small_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AMelee_Hit_Small_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Soul_Debuff_1_Emitter
//------------------------------------------------------------------------------

// ASoul_Debuff_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoul_Debuff_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Concentration_Enhance_Emitter
//------------------------------------------------------------------------------

// AConcentration_Enhance_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AConcentration_Enhance_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Soul_Cast_Melee_Emitter
//------------------------------------------------------------------------------

// ASoul_Cast_Melee_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoul_Cast_Melee_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Cast_Melee_Emitter
//------------------------------------------------------------------------------

// ASpirit_Cast_Melee_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Cast_Melee_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Hit_Spell_Medium_Target_Emitter
//------------------------------------------------------------------------------

// ASpirit_Hit_Spell_Medium_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Hit_Spell_Medium_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Dazed_Medium_Emitter
//------------------------------------------------------------------------------

// ADazed_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADazed_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Infused_Magic_Emitter
//------------------------------------------------------------------------------

// AInfused_Magic_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AInfused_Magic_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Silenced_Medium_Emitter
//------------------------------------------------------------------------------

// ASilenced_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASilenced_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Resistant_Magic_Emitter
//------------------------------------------------------------------------------

// AResistant_Magic_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AResistant_Magic_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Reflect_Ranged_Emitter
//------------------------------------------------------------------------------

// AReflect_Ranged_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AReflect_Ranged_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Immune_Ranged_Emitter
//------------------------------------------------------------------------------

// AImmune_Ranged_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AImmune_Ranged_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Melee_Hit_Large_Target_Emitter
//------------------------------------------------------------------------------

// AMelee_Hit_Large_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AMelee_Hit_Large_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Blood_Hit_Small_Target_Emitter
//------------------------------------------------------------------------------

// ABlood_Hit_Small_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABlood_Hit_Small_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Poison_Cast_Melee_Emitter
//------------------------------------------------------------------------------

// APoison_Cast_Melee_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoison_Cast_Melee_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Cast_Melee_Emitter
//------------------------------------------------------------------------------

// ARune_Cast_Melee_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Cast_Melee_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Infused_Melee_Emitter
//------------------------------------------------------------------------------

// AInfused_Melee_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AInfused_Melee_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Weakened_Magic_Emitter
//------------------------------------------------------------------------------

// AWeakened_Magic_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AWeakened_Magic_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Immune_Melee_Emitter
//------------------------------------------------------------------------------

// AImmune_Melee_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AImmune_Melee_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Morale_Diminish_Emitter
//------------------------------------------------------------------------------

// AMorale_Diminish_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AMorale_Diminish_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Neutral_Cast_Spell_1_Emitter
//------------------------------------------------------------------------------

// ANeutral_Cast_Spell_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ANeutral_Cast_Spell_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Teleport_Location_Emitter
//------------------------------------------------------------------------------

// ATeleport_Location_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATeleport_Location_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Buff_1_Emitter
//------------------------------------------------------------------------------

// ARune_Buff_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Buff_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Shoot_Spell_1_emitter
//------------------------------------------------------------------------------

// ARune_Shoot_Spell_1_emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Shoot_Spell_1_emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Physique_Enhance_Emitter
//------------------------------------------------------------------------------

// APhysique_Enhance_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APhysique_Enhance_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  PoisonCone_Medium_Emitter
//------------------------------------------------------------------------------

// APoisonCone_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisonCone_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Cast_Spell_1_Emitter
//------------------------------------------------------------------------------

// ASpirit_Cast_Spell_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Cast_Spell_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Ice_Hit_Front_Emitter
//------------------------------------------------------------------------------

// AIce_Hit_Front_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AIce_Hit_Front_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Ice_Cast_3_Emitter
//------------------------------------------------------------------------------

// AIce_Cast_3_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AIce_Cast_3_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RippleQuake_1_Emitter
//------------------------------------------------------------------------------

// ARippleQuake_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARippleQuake_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Circle_1_Emitter
//------------------------------------------------------------------------------

// ARune_Circle_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Circle_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Soul_Circle_1_Emitter
//------------------------------------------------------------------------------

// ASoul_Circle_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoul_Circle_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Circle_1_Emitter
//------------------------------------------------------------------------------

// ASpirit_Circle_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Circle_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Ice_Cast_1_Emitter
//------------------------------------------------------------------------------

// AIce_Cast_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AIce_Cast_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Poison_Hit_Spell_Medium_Target_Emitter
//------------------------------------------------------------------------------

// APoison_Hit_Spell_Medium_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoison_Hit_Spell_Medium_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Lifetap_1_Emitter
//------------------------------------------------------------------------------

// ALifetap_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ALifetap_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Teleport_Cast_Emitter
//------------------------------------------------------------------------------

// ATeleport_Cast_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATeleport_Cast_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Morale_Enhance_Emitter
//------------------------------------------------------------------------------

// AMorale_Enhance_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AMorale_Enhance_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Cast_Spell_2_Emitter
//------------------------------------------------------------------------------

// ASpirit_Cast_Spell_2_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Cast_Spell_2_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritHit_Spell_Small_Emitter
//------------------------------------------------------------------------------

// ASpiritHit_Spell_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritHit_Spell_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Shoot_Spell_1_emitter
//------------------------------------------------------------------------------

// ASpirit_Shoot_Spell_1_emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Shoot_Spell_1_emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Cast_Spell_3_Emitter
//------------------------------------------------------------------------------

// ASpirit_Cast_Spell_3_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Cast_Spell_3_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Blind_Medium_Emitter
//------------------------------------------------------------------------------

// ABlind_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABlind_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Dust_Cloud_Medium_Emitter
//------------------------------------------------------------------------------

// ADust_Cloud_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADust_Cloud_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Disarmed_Medium_Emitter
//------------------------------------------------------------------------------

// ADisarmed_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADisarmed_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Soul_Shoot_Spell_1_emitter
//------------------------------------------------------------------------------

// ASoul_Shoot_Spell_1_emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoul_Shoot_Spell_1_emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Soul_Hit_Link_Small_Emitter
//------------------------------------------------------------------------------

// ASoul_Hit_Link_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoul_Hit_Link_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Cast_Spell_2_Emitter
//------------------------------------------------------------------------------

// ARune_Cast_Spell_2_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Cast_Spell_2_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Soul_Cast_Spell_3_Emitter
//------------------------------------------------------------------------------

// ASoul_Cast_Spell_3_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoul_Cast_Spell_3_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Explosion_Large_Emitter
//------------------------------------------------------------------------------

// ARune_Explosion_Large_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Explosion_Large_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Flash_Area_Medium_Emitter
//------------------------------------------------------------------------------

// AFlash_Area_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFlash_Area_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Shoot_Bow_1_Emitter
//------------------------------------------------------------------------------

// AShoot_Bow_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AShoot_Bow_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Explosion_Small_Emitter
//------------------------------------------------------------------------------

// AExplosion_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AExplosion_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Cast_Spell_3_Emitter
//------------------------------------------------------------------------------

// ARune_Cast_Spell_3_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Cast_Spell_3_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Shoot_Bow_1_Emitter
//------------------------------------------------------------------------------

// ARune_Shoot_Bow_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Shoot_Bow_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Dust_Cloud_Small_Emitter
//------------------------------------------------------------------------------

// ADust_Cloud_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADust_Cloud_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Unarmed_Hit_Medium_Target_Emitter
//------------------------------------------------------------------------------

// AUnarmed_Hit_Medium_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AUnarmed_Hit_Medium_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Resistant_Melee_Emitter
//------------------------------------------------------------------------------

// AResistant_Melee_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AResistant_Melee_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Arrow_Cone_Medium_Emitter
//------------------------------------------------------------------------------

// AArrow_Cone_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AArrow_Cone_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Hit_Spell_Small_Target_Emitter
//------------------------------------------------------------------------------

// ARune_Hit_Spell_Small_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Hit_Spell_Small_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  BlueChain_1_Emitter
//------------------------------------------------------------------------------

// ABlueChain_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABlueChain_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Resistant_Ranged_Emitter
//------------------------------------------------------------------------------

// AResistant_Ranged_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AResistant_Ranged_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Return_Melee_Emitter
//------------------------------------------------------------------------------

// AReturn_Melee_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AReturn_Melee_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Blood_Hit_Large_Target_Emitter
//------------------------------------------------------------------------------

// ABlood_Hit_Large_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABlood_Hit_Large_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Infused_Ranged_Emitter
//------------------------------------------------------------------------------

// AInfused_Ranged_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AInfused_Ranged_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Soul_Explosion_Medium_Emitter
//------------------------------------------------------------------------------

// ASoul_Explosion_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoul_Explosion_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Claw_Hit_Medium_Target_Emitter
//------------------------------------------------------------------------------

// AClaw_Hit_Medium_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AClaw_Hit_Medium_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Poison_Explosion_Medium_Emitter
//------------------------------------------------------------------------------

// APoison_Explosion_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoison_Explosion_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Swarm_Shoot_Emitter
//------------------------------------------------------------------------------

// ASwarm_Shoot_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASwarm_Shoot_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Swarm_Status_Emitter
//------------------------------------------------------------------------------

// ASwarm_Status_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASwarm_Status_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Poison_Cast_Spell_1_Emitter
//------------------------------------------------------------------------------

// APoison_Cast_Spell_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoison_Cast_Spell_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Hit_Spell_Large_Target_Emitter
//------------------------------------------------------------------------------

// ARune_Hit_Spell_Large_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Hit_Spell_Large_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Soul_Shoot_Bow_1_Emitter
//------------------------------------------------------------------------------

// ASoul_Shoot_Bow_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoul_Shoot_Bow_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Return_Magic_Emitter
//------------------------------------------------------------------------------

// AReturn_Magic_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AReturn_Magic_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Reflect_Melee_Emitter
//------------------------------------------------------------------------------

// AReflect_Melee_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AReflect_Melee_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Cone_Medium_Emitter
//------------------------------------------------------------------------------

// ASpirit_Cone_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Cone_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Poison_Cloud_Medium_Emitter
//------------------------------------------------------------------------------

// APoison_Cloud_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoison_Cloud_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Nightmare_Medium_Emitter
//------------------------------------------------------------------------------

// ANightmare_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ANightmare_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  BloodHook_Hit_Small_Emitter
//------------------------------------------------------------------------------

// ABloodHook_Hit_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABloodHook_Hit_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritDuff_1_Emitter
//------------------------------------------------------------------------------

// ASpiritDuff_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritDuff_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Buff_1_Emitter
//------------------------------------------------------------------------------

// ASpirit_Buff_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Buff_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Shoot_Bow_1_Emitter
//------------------------------------------------------------------------------

// ASpirit_Shoot_Bow_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Shoot_Bow_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Immune_Magic_Emitter
//------------------------------------------------------------------------------

// AImmune_Magic_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AImmune_Magic_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulBeam_Medium_Emitter
//------------------------------------------------------------------------------

// ASoulBeam_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulBeam_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Explosion_Large_Emitter
//------------------------------------------------------------------------------

// AExplosion_Large_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AExplosion_Large_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Explosion_Medium_Emitter
//------------------------------------------------------------------------------

// AExplosion_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AExplosion_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulBeam_Medium2_Emitter
//------------------------------------------------------------------------------

// ASoulBeam_Medium2_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulBeam_Medium2_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulDuff_1_Emitter
//------------------------------------------------------------------------------

// ASoulDuff_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulDuff_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulAura1Emitter
//------------------------------------------------------------------------------

// ASoulAura1Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulAura1Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Explosion_Medium_Emitter
//------------------------------------------------------------------------------

// ARune_Explosion_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Explosion_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SteadFast_Medium_Emitter
//------------------------------------------------------------------------------

// ASteadFast_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASteadFast_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritBeam_Medium2_Emitter
//------------------------------------------------------------------------------

// ASpiritBeam_Medium2_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritBeam_Medium2_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Explosion_Small_Emitter
//------------------------------------------------------------------------------

// ASpirit_Explosion_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Explosion_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Return_Ranged_Emitter
//------------------------------------------------------------------------------

// AReturn_Ranged_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AReturn_Ranged_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Doomed_Medium_Emitter
//------------------------------------------------------------------------------

// ADoomed_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADoomed_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Link_Emitter
//------------------------------------------------------------------------------

// ASpirit_Link_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Link_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Impale_Medium_Emitter
//------------------------------------------------------------------------------

// AImpale_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AImpale_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  FireCast_Spell_1_Emitter
//------------------------------------------------------------------------------

// AFireCast_Spell_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFireCast_Spell_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneRingOfFire_Medium_Emitter
//------------------------------------------------------------------------------

// ARuneRingOfFire_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneRingOfFire_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Poisoned_Medium_Emitter
//------------------------------------------------------------------------------

// APoisoned_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisoned_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Fury_Medium_Emitter
//------------------------------------------------------------------------------

// AFury_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFury_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Drawn_1_Emitter
//------------------------------------------------------------------------------

// ARune_Drawn_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Drawn_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulCone_Medium_Emitter
//------------------------------------------------------------------------------

// ASoulCone_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulCone_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Soul_Explosion_Small_Emitter
//------------------------------------------------------------------------------

// ASoul_Explosion_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoul_Explosion_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulBuff_Spell_2_Emitter
//------------------------------------------------------------------------------

// ASoulBuff_Spell_2_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulBuff_Spell_2_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Unarmed_Hit_Medium_Source_Emitter
//------------------------------------------------------------------------------

// AUnarmed_Hit_Medium_Source_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AUnarmed_Hit_Medium_Source_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Ice_Cast_1_Weapon_Emitter
//------------------------------------------------------------------------------

// AIce_Cast_1_Weapon_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AIce_Cast_1_Weapon_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  DustCloudEmitter
//------------------------------------------------------------------------------

// ADustCloudEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADustCloudEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Drawn_4_Emitter
//------------------------------------------------------------------------------

// ARune_Drawn_4_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Drawn_4_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneHit_Link_Emitter
//------------------------------------------------------------------------------

// ARuneHit_Link_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneHit_Link_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Drawn_2_Emitter
//------------------------------------------------------------------------------

// ARune_Drawn_2_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Drawn_2_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritPossession_1_Emitter
//------------------------------------------------------------------------------

// ASpiritPossession_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritPossession_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Arrow_Area_Medium_Emitter
//------------------------------------------------------------------------------

// AArrow_Area_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AArrow_Area_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_ShardHands_Emitter
//------------------------------------------------------------------------------

// ARune_ShardHands_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_ShardHands_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Cone_Medium_Emitter
//------------------------------------------------------------------------------

// ARune_Cone_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Cone_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Void_Cast_1_Emitter
//------------------------------------------------------------------------------

// AVoid_Cast_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AVoid_Cast_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Ice_Hit_1_Emitter
//------------------------------------------------------------------------------

// AIce_Hit_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AIce_Hit_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ShapeShiftEmitter
//------------------------------------------------------------------------------

// AShapeShiftEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AShapeShiftEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Ice_Cast_2_Emitter
//------------------------------------------------------------------------------

// AIce_Cast_2_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AIce_Cast_2_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ORMO_Nuke
//------------------------------------------------------------------------------

// AORMO_Nuke 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AORMO_Nuke : public AEmitter {
};


//------------------------------------------------------------------------------
//  Blood_Hit_Medium_Source_Emitter
//------------------------------------------------------------------------------

// ABlood_Hit_Medium_Source_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABlood_Hit_Medium_Source_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Poison_Hit_Spell_Small_Target_Emitter
//------------------------------------------------------------------------------

// APoison_Hit_Spell_Small_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoison_Hit_Spell_Small_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Explosion_Large_Emitter
//------------------------------------------------------------------------------

// ASpirit_Explosion_Large_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Explosion_Large_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Neutral_Cast_Spell_2_Emitter
//------------------------------------------------------------------------------

// ANeutral_Cast_Spell_2_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ANeutral_Cast_Spell_2_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Drawn_5_Emitter
//------------------------------------------------------------------------------

// ARune_Drawn_5_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Drawn_5_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Claw_Hit_Large_Target_Emitter
//------------------------------------------------------------------------------

// AClaw_Hit_Large_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AClaw_Hit_Large_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Vigorous_Medium_Emitter
//------------------------------------------------------------------------------

// AVigorous_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AVigorous_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Claw_Hit_Small_Target_Emitter
//------------------------------------------------------------------------------

// AClaw_Hit_Small_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AClaw_Hit_Small_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Poison_Shoot_Spell_1_emitter
//------------------------------------------------------------------------------

// APoison_Shoot_Spell_1_emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoison_Shoot_Spell_1_emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Reflect_Magic_Emitter
//------------------------------------------------------------------------------

// AReflect_Magic_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AReflect_Magic_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Neutral_Shoot_Bow_1_Emitter
//------------------------------------------------------------------------------

// ANeutral_Shoot_Bow_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ANeutral_Shoot_Bow_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Neutral_Cast_Melee_Emitter
//------------------------------------------------------------------------------

// ANeutral_Cast_Melee_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ANeutral_Cast_Melee_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneDuff_1_Emitter
//------------------------------------------------------------------------------

// ARuneDuff_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneDuff_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Dust_Cloud_Large_Emitter
//------------------------------------------------------------------------------

// ADust_Cloud_Large_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADust_Cloud_Large_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Explosion_Small_Emitter
//------------------------------------------------------------------------------

// ARune_Explosion_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Explosion_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Poison_Hit_Spell_Large_Target_Emitter
//------------------------------------------------------------------------------

// APoison_Hit_Spell_Large_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoison_Hit_Spell_Large_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Poisoned_Large_Emitter
//------------------------------------------------------------------------------

// APoisoned_Large_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisoned_Large_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Soul_Explosion_Large_Emitter
//------------------------------------------------------------------------------

// ASoul_Explosion_Large_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoul_Explosion_Large_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Soul_Linked_Emitter
//------------------------------------------------------------------------------

// ASoul_Linked_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoul_Linked_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Drawn_3_Emitter
//------------------------------------------------------------------------------

// ARune_Drawn_3_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Drawn_3_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RedChain_1_Emitter
//------------------------------------------------------------------------------

// ARedChain_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARedChain_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  BloodBond_Hit_Small_Emitter
//------------------------------------------------------------------------------

// ABloodBond_Hit_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABloodBond_Hit_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Drawn_6_Emitter
//------------------------------------------------------------------------------

// ARune_Drawn_6_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Drawn_6_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  AncestralForgeAiorPillar
//------------------------------------------------------------------------------

// AAncestralForgeAiorPillar 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AAncestralForgeAiorPillar : public AEmitter {
};


//------------------------------------------------------------------------------
//  Immune_All_Emitter
//------------------------------------------------------------------------------

// AImmune_All_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AImmune_All_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ClusterBomb_Explosion_Huge_Emitter
//------------------------------------------------------------------------------

// AClusterBomb_Explosion_Huge_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AClusterBomb_Explosion_Huge_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Log_Medium_Emitter
//------------------------------------------------------------------------------

// ALog_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ALog_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Groundstomp_Medium_Emitter
//------------------------------------------------------------------------------

// AGroundstomp_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AGroundstomp_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  NailBox_Medium_Emitter
//------------------------------------------------------------------------------

// ANailBox_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ANailBox_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Ice_Hit_Medium_Target_Emitter
//------------------------------------------------------------------------------

// AIce_Hit_Medium_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AIce_Hit_Medium_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  TotA_8_Target_Emitter
//------------------------------------------------------------------------------

// ATotA_8_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATotA_8_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Ice_Explosion_Medium_Emitter
//------------------------------------------------------------------------------

// AIce_Explosion_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AIce_Explosion_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Fire_Breath_Emitter
//------------------------------------------------------------------------------

// AFire_Breath_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_Breath_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Nails_Area_Medium_Emitter
//------------------------------------------------------------------------------

// ANails_Area_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ANails_Area_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  TCLvl25_ExplosionEmitter
//------------------------------------------------------------------------------

// ATCLvl25_ExplosionEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATCLvl25_ExplosionEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Void_type4_Emitter
//------------------------------------------------------------------------------

// AVoid_type4_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AVoid_type4_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Void_type5_Emitter
//------------------------------------------------------------------------------

// AVoid_type5_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AVoid_type5_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Void_type1_Emitter
//------------------------------------------------------------------------------

// AVoid_type1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AVoid_type1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Void_type3_Emitter
//------------------------------------------------------------------------------

// AVoid_type3_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AVoid_type3_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Void_type2_Emitter
//------------------------------------------------------------------------------

// AVoid_type2_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AVoid_type2_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Void_type7_Emitter
//------------------------------------------------------------------------------

// AVoid_type7_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AVoid_type7_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Cast_Possession_3_Emitter
//------------------------------------------------------------------------------

// ASpirit_Cast_Possession_3_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Cast_Possession_3_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Cast_Possession_4_Emitter
//------------------------------------------------------------------------------

// ASpirit_Cast_Possession_4_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Cast_Possession_4_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Cast_Possession_2_Emitter
//------------------------------------------------------------------------------

// ASpirit_Cast_Possession_2_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Cast_Possession_2_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Caltrops_Area_Medium_Emitter
//------------------------------------------------------------------------------

// ACaltrops_Area_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ACaltrops_Area_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Humanoid_Pet_Emitter
//------------------------------------------------------------------------------

// AHumanoid_Pet_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHumanoid_Pet_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Monster_Pet_Emitter
//------------------------------------------------------------------------------

// AMonster_Pet_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AMonster_Pet_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Void_Cast_2_Emitter
//------------------------------------------------------------------------------

// AVoid_Cast_2_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AVoid_Cast_2_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Fire_Emitter
//------------------------------------------------------------------------------

// AFire_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Fire_Emitter_Calm
//------------------------------------------------------------------------------

// AFire_Emitter_Calm 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_Emitter_Calm : public AFire_Emitter {
};


//------------------------------------------------------------------------------
//  Fire_Emitter_Wild
//------------------------------------------------------------------------------

// AFire_Emitter_Wild 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_Emitter_Wild : public AFire_Emitter {
};


//------------------------------------------------------------------------------
//  Swordtrail1emitter
//------------------------------------------------------------------------------

// ASwordtrail1emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASwordtrail1emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Wisp01Emitter
//------------------------------------------------------------------------------

// AWisp01Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AWisp01Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  AffinityRune_Enhance_Emitter
//------------------------------------------------------------------------------

// AAffinityRune_Enhance_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AAffinityRune_Enhance_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  AF_CageMidEmitter
//------------------------------------------------------------------------------

// AAF_CageMidEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AAF_CageMidEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  AF_CageSideEmitter
//------------------------------------------------------------------------------

// AAF_CageSideEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AAF_CageSideEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  AF_CageTopDownEmitter
//------------------------------------------------------------------------------

// AAF_CageTopDownEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AAF_CageTopDownEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Alert_Medium_Emitter
//------------------------------------------------------------------------------

// AAlert_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AAlert_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  AoECircleEmitter
//------------------------------------------------------------------------------

// AAoECircleEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AAoECircleEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ArrowCone_Emitter_Medium
//------------------------------------------------------------------------------

// AArrowCone_Emitter_Medium 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AArrowCone_Emitter_Medium : public AEmitter {
};


//------------------------------------------------------------------------------
//  ArrowEmitter
//------------------------------------------------------------------------------

// AArrowEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AArrowEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ArrowHitEmitter
//------------------------------------------------------------------------------

// AArrowHitEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AArrowHitEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ArrowRainEmitter
//------------------------------------------------------------------------------

// AArrowRainEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AArrowRainEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ArrowRain_Emitter_Medium
//------------------------------------------------------------------------------

// AArrowRain_Emitter_Medium 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AArrowRain_Emitter_Medium : public AEmitter {
};


//------------------------------------------------------------------------------
//  ArrowStorm2Emitter
//------------------------------------------------------------------------------

// AArrowStorm2Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AArrowStorm2Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ArrowStormEmitter
//------------------------------------------------------------------------------

// AArrowStormEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AArrowStormEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Arrow_Hit_Multiplie_Emitter
//------------------------------------------------------------------------------

// AArrow_Hit_Multiplie_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AArrow_Hit_Multiplie_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  AshadoriaSpirit_Exit_Emitter
//------------------------------------------------------------------------------

// AAshadoriaSpirit_Exit_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AAshadoriaSpirit_Exit_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  AshadoriaSpirit_Floating_Emitter
//------------------------------------------------------------------------------

// AAshadoriaSpirit_Floating_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AAshadoriaSpirit_Floating_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ASOS_05_Sunmirror
//------------------------------------------------------------------------------

// AASOS_05_Sunmirror 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AASOS_05_Sunmirror : public AEmitter {
};


//------------------------------------------------------------------------------
//  ASOS_15_SuitofShadows_Emitter
//------------------------------------------------------------------------------

// AASOS_15_SuitofShadows_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AASOS_15_SuitofShadows_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  BigBeam1Emitter
//------------------------------------------------------------------------------

// ABigBeam1Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABigBeam1Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Bleeding_Large_Emitter
//------------------------------------------------------------------------------

// ABleeding_Large_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABleeding_Large_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Bleeding_Medium_Emitter
//------------------------------------------------------------------------------

// ABleeding_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABleeding_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Blood1Emitter
//------------------------------------------------------------------------------

// ABlood1Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABlood1Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Blood2Emitter
//------------------------------------------------------------------------------

// ABlood2Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABlood2Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Blood3Emitter
//------------------------------------------------------------------------------

// ABlood3Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABlood3Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Bloodhit1emitter
//------------------------------------------------------------------------------

// ABloodhit1emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABloodhit1emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Bloodhit2emitter
//------------------------------------------------------------------------------

// ABloodhit2emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABloodhit2emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Bloodhit3emitter
//------------------------------------------------------------------------------

// ABloodhit3emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABloodhit3emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Bloodhit4emitter
//------------------------------------------------------------------------------

// ABloodhit4emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABloodhit4emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Bloodhit5emitter
//------------------------------------------------------------------------------

// ABloodhit5emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABloodhit5emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  BloodHit_Large_Emitter
//------------------------------------------------------------------------------

// ABloodHit_Large_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABloodHit_Large_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  BloodHit_Medium_Emitter
//------------------------------------------------------------------------------

// ABloodHit_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABloodHit_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  BloodHit_Small_Emitter
//------------------------------------------------------------------------------

// ABloodHit_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABloodHit_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  BloodLargeEmitter
//------------------------------------------------------------------------------

// ABloodLargeEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABloodLargeEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  BloodLinkHit_Enemy_Emitter
//------------------------------------------------------------------------------

// ABloodLinkHit_Enemy_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABloodLinkHit_Enemy_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  BloodLink_Enemy_Emitter
//------------------------------------------------------------------------------

// ABloodLink_Enemy_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABloodLink_Enemy_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Bloodlink_Hit_Small_Emitter
//------------------------------------------------------------------------------

// ABloodlink_Hit_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABloodlink_Hit_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  BloodMediumEmitter
//------------------------------------------------------------------------------

// ABloodMediumEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABloodMediumEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  BloodSmallEmitter
//------------------------------------------------------------------------------

// ABloodSmallEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABloodSmallEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  BLTI_48_SharnExplosion_Emitter
//------------------------------------------------------------------------------

// ABLTI_48_SharnExplosion_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABLTI_48_SharnExplosion_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  BLTI_48_SharnMask_Emitter
//------------------------------------------------------------------------------

// ABLTI_48_SharnMask_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABLTI_48_SharnMask_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  BlueChain_Hit_1_Emitter
//------------------------------------------------------------------------------

// ABlueChain_Hit_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABlueChain_Hit_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Breath_Ormo_Emitter
//------------------------------------------------------------------------------

// ABreath_Ormo_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABreath_Ormo_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Burning_Respawn_Emitter
//------------------------------------------------------------------------------

// ABurning_Respawn_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABurning_Respawn_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Burning_Soul_Emitter
//------------------------------------------------------------------------------

// ABurning_Soul_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ABurning_Soul_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Caltrops_Emitter_Medium
//------------------------------------------------------------------------------

// ACaltrops_Emitter_Medium 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ACaltrops_Emitter_Medium : public AEmitter {
};


//------------------------------------------------------------------------------
//  CircleEmitter
//------------------------------------------------------------------------------

// ACircleEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ACircleEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ClawHit_Large_Emitter
//------------------------------------------------------------------------------

// AClawHit_Large_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AClawHit_Large_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ClawHit_Left_Emitter
//------------------------------------------------------------------------------

// AClawHit_Left_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AClawHit_Left_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ClawHit_Medium_Emitter
//------------------------------------------------------------------------------

// AClawHit_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AClawHit_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ClawHit_Right_Emitter
//------------------------------------------------------------------------------

// AClawHit_Right_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AClawHit_Right_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ClawHit_Small_Emitter
//------------------------------------------------------------------------------

// AClawHit_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AClawHit_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ClawLeftEmitter
//------------------------------------------------------------------------------

// AClawLeftEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AClawLeftEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ClawRightEmitter
//------------------------------------------------------------------------------

// AClawRightEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AClawRightEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Claw_Hit_Medium_Source_Emitter
//------------------------------------------------------------------------------

// AClaw_Hit_Medium_Source_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AClaw_Hit_Medium_Source_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ClearHeaded_Medium_Emitter
//------------------------------------------------------------------------------

// AClearHeaded_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AClearHeaded_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ClusterBomb_Projectle_Huge_Emitter
//------------------------------------------------------------------------------

// AClusterBomb_Projectle_Huge_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AClusterBomb_Projectle_Huge_Emitter : public ASBProjectileEmitter {
};


//------------------------------------------------------------------------------
//  CoA_Crystal_Emitter
//------------------------------------------------------------------------------

// ACoA_Crystal_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ACoA_Crystal_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  CoA_OrnateBell_1_Emitter
//------------------------------------------------------------------------------

// ACoA_OrnateBell_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ACoA_OrnateBell_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  CoA_OrnateBell_2_Emitter
//------------------------------------------------------------------------------

// ACoA_OrnateBell_2_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ACoA_OrnateBell_2_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  CoA_Tornado_Huge_Emitter
//------------------------------------------------------------------------------

// ACoA_Tornado_Huge_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ACoA_Tornado_Huge_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ConcentrationBuffEmitter
//------------------------------------------------------------------------------

// AConcentrationBuffEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AConcentrationBuffEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ConcentrationDebuffEmitter
//------------------------------------------------------------------------------

// AConcentrationDebuffEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AConcentrationDebuffEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ConcussionBombEmitter
//------------------------------------------------------------------------------

// AConcussionBombEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AConcussionBombEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Condition6Emitter
//------------------------------------------------------------------------------

// ACondition6Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ACondition6Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Condition8Emitter
//------------------------------------------------------------------------------

// ACondition8Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ACondition8Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Corrupt_Tracer
//------------------------------------------------------------------------------

// ACorrupt_Tracer 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ACorrupt_Tracer : public AEmitter {
};


//------------------------------------------------------------------------------
//  Crippled_Medium_Emitter
//------------------------------------------------------------------------------

// ACrippled_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ACrippled_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Cursed_Medium_Emitter
//------------------------------------------------------------------------------

// ACursed_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ACursed_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  DAF_Book_Fire_Emitter
//------------------------------------------------------------------------------

// ADAF_Book_Fire_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADAF_Book_Fire_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  DAF_DemonGate_Smoke_Emitter
//------------------------------------------------------------------------------

// ADAF_DemonGate_Smoke_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADAF_DemonGate_Smoke_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  DAF_DemonGate_Steam_Emitter
//------------------------------------------------------------------------------

// ADAF_DemonGate_Steam_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADAF_DemonGate_Steam_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  DAF_Tent_Fire_Emitter
//------------------------------------------------------------------------------

// ADAF_Tent_Fire_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADAF_Tent_Fire_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Dazed1Emitter
//------------------------------------------------------------------------------

// ADazed1Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADazed1Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  DazedEmitter
//------------------------------------------------------------------------------

// ADazedEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADazedEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Decay_Medium_Emitter
//------------------------------------------------------------------------------

// ADecay_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADecay_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Decay_Tracer
//------------------------------------------------------------------------------

// ADecay_Tracer 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADecay_Tracer : public AEmitter {
};


//------------------------------------------------------------------------------
//  DefaultTracer
//------------------------------------------------------------------------------

// ADefaultTracer 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADefaultTracer : public AEmitter {
};


//------------------------------------------------------------------------------
//  Default_Tracer
//------------------------------------------------------------------------------

// ADefault_Tracer 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADefault_Tracer : public AEmitter {
};


//------------------------------------------------------------------------------
//  Doom_Tracer
//------------------------------------------------------------------------------

// ADoom_Tracer 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADoom_Tracer : public AEmitter {
};


//------------------------------------------------------------------------------
//  DustCloudLargeEmitter
//------------------------------------------------------------------------------

// ADustCloudLargeEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADustCloudLargeEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  DustCloud_Emitter_Large
//------------------------------------------------------------------------------

// ADustCloud_Emitter_Large 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADustCloud_Emitter_Large : public AEmitter {
};


//------------------------------------------------------------------------------
//  DustCloud_Emitter_Medium
//------------------------------------------------------------------------------

// ADustCloud_Emitter_Medium 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADustCloud_Emitter_Medium : public AEmitter {
};


//------------------------------------------------------------------------------
//  DustCloud_Emitter_Small
//------------------------------------------------------------------------------

// ADustCloud_Emitter_Small 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADustCloud_Emitter_Small : public AEmitter {
};


//------------------------------------------------------------------------------
//  DustCloud_Large_Emitter
//------------------------------------------------------------------------------

// ADustCloud_Large_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADustCloud_Large_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  DustCloud_Medium_Emitter
//------------------------------------------------------------------------------

// ADustCloud_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADustCloud_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  DustCloud_Small_Emitter
//------------------------------------------------------------------------------

// ADustCloud_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ADustCloud_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Energy_Spike_Emitter
//------------------------------------------------------------------------------

// AEnergy_Spike_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AEnergy_Spike_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  EntHacktraceremitter
//------------------------------------------------------------------------------

// AEntHacktraceremitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AEntHacktraceremitter : public ASwordtrail1emitter {
};


//------------------------------------------------------------------------------
//  AffinityRune_Diminish_Emitter
//------------------------------------------------------------------------------

// AAffinityRune_Diminish_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AAffinityRune_Diminish_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Evasive_Medium_PartA_Emitter
//------------------------------------------------------------------------------

// AEvasive_Medium_PartA_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AEvasive_Medium_PartA_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Evasive_Medium_PartB_Emitter
//------------------------------------------------------------------------------

// AEvasive_Medium_PartB_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AEvasive_Medium_PartB_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  EXA_BlackSmoke_Emitter
//------------------------------------------------------------------------------

// AEXA_BlackSmoke_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AEXA_BlackSmoke_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  EXA_BlackSmoke_Far_Emitter
//------------------------------------------------------------------------------

// AEXA_BlackSmoke_Far_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AEXA_BlackSmoke_Far_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  EXA_Explosion_Emitter
//------------------------------------------------------------------------------

// AEXA_Explosion_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AEXA_Explosion_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  EXA_Explosion_Trails_Emitter
//------------------------------------------------------------------------------

// AEXA_Explosion_Trails_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AEXA_Explosion_Trails_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  EXA_Fire_Big_Emitter
//------------------------------------------------------------------------------

// AEXA_Fire_Big_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AEXA_Fire_Big_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  EXA_Fire_Small_Emitter
//------------------------------------------------------------------------------

// AEXA_Fire_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AEXA_Fire_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Explosion1Emitter
//------------------------------------------------------------------------------

// AExplosion1Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AExplosion1Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Explosion2Emitter
//------------------------------------------------------------------------------

// AExplosion2Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AExplosion2Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ExplosionLargeEmitter
//------------------------------------------------------------------------------

// AExplosionLargeEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AExplosionLargeEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Explosion_Emitter_Large
//------------------------------------------------------------------------------

// AExplosion_Emitter_Large 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AExplosion_Emitter_Large : public AEmitter {
};


//------------------------------------------------------------------------------
//  Explosion_Emitter_Medium
//------------------------------------------------------------------------------

// AExplosion_Emitter_Medium 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AExplosion_Emitter_Medium : public AEmitter {
};


//------------------------------------------------------------------------------
//  Explosion_Emitter_Small
//------------------------------------------------------------------------------

// AExplosion_Emitter_Small 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AExplosion_Emitter_Small : public AEmitter {
};


//------------------------------------------------------------------------------
//  Fire1Emitter
//------------------------------------------------------------------------------

// AFire1Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire1Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Fire1_Emitter
//------------------------------------------------------------------------------

// AFire1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  fireballparticleemitter
//------------------------------------------------------------------------------

// Afireballparticleemitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT Afireballparticleemitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Fire_calm_blue_l_a
//------------------------------------------------------------------------------

// AFire_calm_blue_l_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_blue_l_a : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_blue_m_a
//------------------------------------------------------------------------------

// AFire_calm_blue_m_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_blue_m_a : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_blue_s
//------------------------------------------------------------------------------

// AFire_calm_blue_s 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_blue_s : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_blue_xl_a
//------------------------------------------------------------------------------

// AFire_calm_blue_xl_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_blue_xl_a : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_blue_xs
//------------------------------------------------------------------------------

// AFire_calm_blue_xs 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_blue_xs : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_blue_xxl_a
//------------------------------------------------------------------------------

// AFire_calm_blue_xxl_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_blue_xxl_a : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_darkblue_l_a
//------------------------------------------------------------------------------

// AFire_calm_darkblue_l_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_darkblue_l_a : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_darkblue_m_a
//------------------------------------------------------------------------------

// AFire_calm_darkblue_m_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_darkblue_m_a : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_darkblue_s
//------------------------------------------------------------------------------

// AFire_calm_darkblue_s 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_darkblue_s : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_darkblue_xl_a
//------------------------------------------------------------------------------

// AFire_calm_darkblue_xl_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_darkblue_xl_a : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_darkblue_xs
//------------------------------------------------------------------------------

// AFire_calm_darkblue_xs 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_darkblue_xs : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_darkblue_xxl_a
//------------------------------------------------------------------------------

// AFire_calm_darkblue_xxl_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_darkblue_xxl_a : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_orange_l_a
//------------------------------------------------------------------------------

// AFire_calm_orange_l_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_orange_l_a : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_orange_l_b
//------------------------------------------------------------------------------

// AFire_calm_orange_l_b 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_orange_l_b : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_orange_l_c
//------------------------------------------------------------------------------

// AFire_calm_orange_l_c 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_orange_l_c : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_orange_m_a
//------------------------------------------------------------------------------

// AFire_calm_orange_m_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_orange_m_a : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_orange_m_b
//------------------------------------------------------------------------------

// AFire_calm_orange_m_b 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_orange_m_b : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_orange_m_c
//------------------------------------------------------------------------------

// AFire_calm_orange_m_c 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_orange_m_c : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_orange_s
//------------------------------------------------------------------------------

// AFire_calm_orange_s 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_orange_s : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_orange_xl_a
//------------------------------------------------------------------------------

// AFire_calm_orange_xl_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_orange_xl_a : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_orange_xl_b
//------------------------------------------------------------------------------

// AFire_calm_orange_xl_b 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_orange_xl_b : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_orange_xl_c
//------------------------------------------------------------------------------

// AFire_calm_orange_xl_c 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_orange_xl_c : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_orange_xs
//------------------------------------------------------------------------------

// AFire_calm_orange_xs 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_orange_xs : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_orange_xxl_a
//------------------------------------------------------------------------------

// AFire_calm_orange_xxl_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_orange_xxl_a : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_orange_xxl_b
//------------------------------------------------------------------------------

// AFire_calm_orange_xxl_b 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_orange_xxl_b : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_orange_xxl_c
//------------------------------------------------------------------------------

// AFire_calm_orange_xxl_c 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_orange_xxl_c : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_yellow_l_a
//------------------------------------------------------------------------------

// AFire_calm_yellow_l_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_yellow_l_a : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_yellow_l_b
//------------------------------------------------------------------------------

// AFire_calm_yellow_l_b 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_yellow_l_b : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_yellow_l_c
//------------------------------------------------------------------------------

// AFire_calm_yellow_l_c 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_yellow_l_c : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_yellow_m_a
//------------------------------------------------------------------------------

// AFire_calm_yellow_m_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_yellow_m_a : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_yellow_m_b
//------------------------------------------------------------------------------

// AFire_calm_yellow_m_b 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_yellow_m_b : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_yellow_m_c
//------------------------------------------------------------------------------

// AFire_calm_yellow_m_c 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_yellow_m_c : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_yellow_s
//------------------------------------------------------------------------------

// AFire_calm_yellow_s 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_yellow_s : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_yellow_xl_a
//------------------------------------------------------------------------------

// AFire_calm_yellow_xl_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_yellow_xl_a : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_yellow_xl_b
//------------------------------------------------------------------------------

// AFire_calm_yellow_xl_b 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_yellow_xl_b : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_yellow_xl_c
//------------------------------------------------------------------------------

// AFire_calm_yellow_xl_c 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_yellow_xl_c : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_yellow_xs
//------------------------------------------------------------------------------

// AFire_calm_yellow_xs 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_yellow_xs : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_yellow_xxl_a
//------------------------------------------------------------------------------

// AFire_calm_yellow_xxl_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_yellow_xxl_a : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_yellow_xxl_b
//------------------------------------------------------------------------------

// AFire_calm_yellow_xxl_b 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_yellow_xxl_b : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_calm_yellow_xxl_c
//------------------------------------------------------------------------------

// AFire_calm_yellow_xxl_c 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_calm_yellow_xxl_c : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  Fire_Effect_Emitter
//------------------------------------------------------------------------------

// AFire_Effect_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_Effect_Emitter : public AFire_Emitter {
};


//------------------------------------------------------------------------------
//  Fire_wild_blue_l_a
//------------------------------------------------------------------------------

// AFire_wild_blue_l_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_blue_l_a : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_blue_m_a
//------------------------------------------------------------------------------

// AFire_wild_blue_m_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_blue_m_a : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_blue_s
//------------------------------------------------------------------------------

// AFire_wild_blue_s 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_blue_s : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_blue_xl_a
//------------------------------------------------------------------------------

// AFire_wild_blue_xl_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_blue_xl_a : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_blue_xs
//------------------------------------------------------------------------------

// AFire_wild_blue_xs 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_blue_xs : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_blue_xxl_a
//------------------------------------------------------------------------------

// AFire_wild_blue_xxl_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_blue_xxl_a : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_darkblue_l_a
//------------------------------------------------------------------------------

// AFire_wild_darkblue_l_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_darkblue_l_a : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_darkblue_m_a
//------------------------------------------------------------------------------

// AFire_wild_darkblue_m_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_darkblue_m_a : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_darkblue_s
//------------------------------------------------------------------------------

// AFire_wild_darkblue_s 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_darkblue_s : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_darkblue_xl_a
//------------------------------------------------------------------------------

// AFire_wild_darkblue_xl_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_darkblue_xl_a : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_darkblue_xs
//------------------------------------------------------------------------------

// AFire_wild_darkblue_xs 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_darkblue_xs : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_darkblue_xxl_a
//------------------------------------------------------------------------------

// AFire_wild_darkblue_xxl_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_darkblue_xxl_a : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_orange_l_a
//------------------------------------------------------------------------------

// AFire_wild_orange_l_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_orange_l_a : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_orange_l_b
//------------------------------------------------------------------------------

// AFire_wild_orange_l_b 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_orange_l_b : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_orange_l_c
//------------------------------------------------------------------------------

// AFire_wild_orange_l_c 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_orange_l_c : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_orange_m_a
//------------------------------------------------------------------------------

// AFire_wild_orange_m_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_orange_m_a : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_orange_m_b
//------------------------------------------------------------------------------

// AFire_wild_orange_m_b 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_orange_m_b : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_orange_m_c
//------------------------------------------------------------------------------

// AFire_wild_orange_m_c 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_orange_m_c : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_orange_s
//------------------------------------------------------------------------------

// AFire_wild_orange_s 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_orange_s : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_orange_xl_a
//------------------------------------------------------------------------------

// AFire_wild_orange_xl_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_orange_xl_a : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_orange_xl_b
//------------------------------------------------------------------------------

// AFire_wild_orange_xl_b 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_orange_xl_b : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_orange_xl_c
//------------------------------------------------------------------------------

// AFire_wild_orange_xl_c 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_orange_xl_c : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_orange_xs
//------------------------------------------------------------------------------

// AFire_wild_orange_xs 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_orange_xs : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_orange_xxl_a
//------------------------------------------------------------------------------

// AFire_wild_orange_xxl_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_orange_xxl_a : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_orange_xxl_b
//------------------------------------------------------------------------------

// AFire_wild_orange_xxl_b 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_orange_xxl_b : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_orange_xxl_c
//------------------------------------------------------------------------------

// AFire_wild_orange_xxl_c 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_orange_xxl_c : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_yellow_l_a
//------------------------------------------------------------------------------

// AFire_wild_yellow_l_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_yellow_l_a : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_yellow_l_b
//------------------------------------------------------------------------------

// AFire_wild_yellow_l_b 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_yellow_l_b : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_yellow_l_c
//------------------------------------------------------------------------------

// AFire_wild_yellow_l_c 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_yellow_l_c : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_yellow_m_a
//------------------------------------------------------------------------------

// AFire_wild_yellow_m_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_yellow_m_a : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_yellow_m_b
//------------------------------------------------------------------------------

// AFire_wild_yellow_m_b 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_yellow_m_b : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_yellow_m_c
//------------------------------------------------------------------------------

// AFire_wild_yellow_m_c 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_yellow_m_c : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_yellow_s
//------------------------------------------------------------------------------

// AFire_wild_yellow_s 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_yellow_s : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_yellow_xl_a
//------------------------------------------------------------------------------

// AFire_wild_yellow_xl_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_yellow_xl_a : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_yellow_xl_b
//------------------------------------------------------------------------------

// AFire_wild_yellow_xl_b 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_yellow_xl_b : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_yellow_xl_c
//------------------------------------------------------------------------------

// AFire_wild_yellow_xl_c 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_yellow_xl_c : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_yellow_xs
//------------------------------------------------------------------------------

// AFire_wild_yellow_xs 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_yellow_xs : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_yellow_xxl_a
//------------------------------------------------------------------------------

// AFire_wild_yellow_xxl_a 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_yellow_xxl_a : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_yellow_xxl_b
//------------------------------------------------------------------------------

// AFire_wild_yellow_xxl_b 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_yellow_xxl_b : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  Fire_wild_yellow_xxl_c
//------------------------------------------------------------------------------

// AFire_wild_yellow_xxl_c 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFire_wild_yellow_xxl_c : public AFire_Emitter_Wild {
};


//------------------------------------------------------------------------------
//  FlashBombEmitter
//------------------------------------------------------------------------------

// AFlashBombEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFlashBombEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  FlashEmitter
//------------------------------------------------------------------------------

// AFlashEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFlashEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Flash_Green_Emitter
//------------------------------------------------------------------------------

// AFlash_Green_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFlash_Green_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Flash_White_Emitter
//------------------------------------------------------------------------------

// AFlash_White_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFlash_White_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  FocusEmitter
//------------------------------------------------------------------------------

// AFocusEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFocusEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Frozen_Medium_Emitter
//------------------------------------------------------------------------------

// AFrozen_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFrozen_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Frozen_Pawn_Emitter
//------------------------------------------------------------------------------

// AFrozen_Pawn_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AFrozen_Pawn_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Genericflash1emitter
//------------------------------------------------------------------------------

// AGenericflash1emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AGenericflash1emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  GrayChain_2_Emitter
//------------------------------------------------------------------------------

// AGrayChain_2_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AGrayChain_2_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  GrayChain_Cast_1_Emitter
//------------------------------------------------------------------------------

// AGrayChain_Cast_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AGrayChain_Cast_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  GreenSmokePuffEmitter
//------------------------------------------------------------------------------

// AGreenSmokePuffEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AGreenSmokePuffEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Hacktraceremitter
//------------------------------------------------------------------------------

// AHacktraceremitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHacktraceremitter : public ASwordtrail1emitter {
};


//------------------------------------------------------------------------------
//  Hamstring_Medium_Emitter
//------------------------------------------------------------------------------

// AHamstring_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHamstring_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Heal3Emitter
//------------------------------------------------------------------------------

// AHeal3Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHeal3Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  HealCastEmitter
//------------------------------------------------------------------------------

// AHealCastEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHealCastEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  HealEmitter
//------------------------------------------------------------------------------

// AHealEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHealEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  HealLargeEmitter
//------------------------------------------------------------------------------

// AHealLargeEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHealLargeEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  HealMediumEmitter
//------------------------------------------------------------------------------

// AHealMediumEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHealMediumEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  HealSmallEmitter
//------------------------------------------------------------------------------

// AHealSmallEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHealSmallEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Heal_Large_Emitter
//------------------------------------------------------------------------------

// AHeal_Large_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHeal_Large_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Heal_Small_Emitter
//------------------------------------------------------------------------------

// AHeal_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHeal_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Heal_Tracer
//------------------------------------------------------------------------------

// AHeal_Tracer 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHeal_Tracer : public AEmitter {
};


//------------------------------------------------------------------------------
//  HitArrowEmitter
//------------------------------------------------------------------------------

// AHitArrowEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHitArrowEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  HitBloodSlashEmitter
//------------------------------------------------------------------------------

// AHitBloodSlashEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHitBloodSlashEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  HitBloodStarEmitter
//------------------------------------------------------------------------------

// AHitBloodStarEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHitBloodStarEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  HitMeleeArcEmitter
//------------------------------------------------------------------------------

// AHitMeleeArcEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHitMeleeArcEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  HitMeleeBlueEmitter
//------------------------------------------------------------------------------

// AHitMeleeBlueEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHitMeleeBlueEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  HitMeleeCircleEmitter
//------------------------------------------------------------------------------

// AHitMeleeCircleEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHitMeleeCircleEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  HitMeleeLargeEmitter
//------------------------------------------------------------------------------

// AHitMeleeLargeEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHitMeleeLargeEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  HitMeleeMediumEmitter
//------------------------------------------------------------------------------

// AHitMeleeMediumEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHitMeleeMediumEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  HitMeleeSmallEmitter
//------------------------------------------------------------------------------

// AHitMeleeSmallEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AHitMeleeSmallEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Immune_Hit_Medium_Emitter
//------------------------------------------------------------------------------

// AImmune_Hit_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AImmune_Hit_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Immune_Medium_Emitter
//------------------------------------------------------------------------------

// AImmune_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AImmune_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  LevelUp_Medium_Emitter
//------------------------------------------------------------------------------

// ALevelUp_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ALevelUp_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  LifeTap_Medium_Emitter
//------------------------------------------------------------------------------

// ALifeTap_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ALifeTap_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  MeleeHit_Large_Emitter
//------------------------------------------------------------------------------

// AMeleeHit_Large_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AMeleeHit_Large_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  MeleeHit_Medium_Emitter
//------------------------------------------------------------------------------

// AMeleeHit_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AMeleeHit_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  MeleeHit_Small_Emitter
//------------------------------------------------------------------------------

// AMeleeHit_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AMeleeHit_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  MImpact1Emitter
//------------------------------------------------------------------------------

// AMImpact1Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AMImpact1Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  MImpact2Emitter
//------------------------------------------------------------------------------

// AMImpact2Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AMImpact2Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  MImpact3Emitter
//------------------------------------------------------------------------------

// AMImpact3Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AMImpact3Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Mist_Tracer
//------------------------------------------------------------------------------

// AMist_Tracer 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AMist_Tracer : public AEmitter {
};


//------------------------------------------------------------------------------
//  MoonBeam_Emitter
//------------------------------------------------------------------------------

// AMoonBeam_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AMoonBeam_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  MoraleBuffEmitter
//------------------------------------------------------------------------------

// AMoraleBuffEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AMoraleBuffEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  MoraleDebuffEmitter
//------------------------------------------------------------------------------

// AMoraleDebuffEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AMoraleDebuffEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  NeutralBeam_Medium_Emitter
//------------------------------------------------------------------------------

// ANeutralBeam_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ANeutralBeam_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  NeutralCast_Spell_1_Emitter
//------------------------------------------------------------------------------

// ANeutralCast_Spell_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ANeutralCast_Spell_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Neutral_Hit_Spell_Large_Target_Emitter
//------------------------------------------------------------------------------

// ANeutral_Hit_Spell_Large_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ANeutral_Hit_Spell_Large_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Neutral_Hit_Spell_Medium_Target_Emitter
//------------------------------------------------------------------------------

// ANeutral_Hit_Spell_Medium_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ANeutral_Hit_Spell_Medium_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Neutral_Hit_Spell_Small_Target_Emitter
//------------------------------------------------------------------------------

// ANeutral_Hit_Spell_Small_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ANeutral_Hit_Spell_Small_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Neutral_Shoot_Spell_1_emitter
//------------------------------------------------------------------------------

// ANeutral_Shoot_Spell_1_emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ANeutral_Shoot_Spell_1_emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Nightmare_Tracer
//------------------------------------------------------------------------------

// ANightmare_Tracer 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ANightmare_Tracer : public AEmitter {
};


//------------------------------------------------------------------------------
//  NODE_03_Redsmoke_Emitter
//------------------------------------------------------------------------------

// ANODE_03_Redsmoke_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ANODE_03_Redsmoke_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  NODE_04_Yellowsmoke_Emitter
//------------------------------------------------------------------------------

// ANODE_04_Yellowsmoke_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ANODE_04_Yellowsmoke_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  NODE_05_Greensmoke_Emitter
//------------------------------------------------------------------------------

// ANODE_05_Greensmoke_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ANODE_05_Greensmoke_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  NODE_06_Blacksmoke_Emitter
//------------------------------------------------------------------------------

// ANODE_06_Blacksmoke_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ANODE_06_Blacksmoke_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  NODE_18_Stench_Emitter
//------------------------------------------------------------------------------

// ANODE_18_Stench_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ANODE_18_Stench_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  OrangeChain_Hit_1_Emitter
//------------------------------------------------------------------------------

// AOrangeChain_Hit_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AOrangeChain_Hit_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  OrangeChain_Shoot_1_Emitter
//------------------------------------------------------------------------------

// AOrangeChain_Shoot_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AOrangeChain_Shoot_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ORMO_Enchanted_Pillar_Emitter
//------------------------------------------------------------------------------

// AORMO_Enchanted_Pillar_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AORMO_Enchanted_Pillar_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ORMO_MarbleSeal_Active
//------------------------------------------------------------------------------

// AORMO_MarbleSeal_Active 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AORMO_MarbleSeal_Active : public AEmitter {
};


//------------------------------------------------------------------------------
//  ORMO_MarbleSeal_Charging
//------------------------------------------------------------------------------

// AORMO_MarbleSeal_Charging 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AORMO_MarbleSeal_Charging : public AEmitter {
};


//------------------------------------------------------------------------------
//  ORMO_MarbleSeal_Lock
//------------------------------------------------------------------------------

// AORMO_MarbleSeal_Lock 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AORMO_MarbleSeal_Lock : public AEmitter {
};


//------------------------------------------------------------------------------
//  ORMO_MarbleSeal_Locked
//------------------------------------------------------------------------------

// AORMO_MarbleSeal_Locked 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AORMO_MarbleSeal_Locked : public AEmitter {
};


//------------------------------------------------------------------------------
//  ORMO_MarbleSeal_Tier
//------------------------------------------------------------------------------

// AORMO_MarbleSeal_Tier 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AORMO_MarbleSeal_Tier : public AEmitter {
};


//------------------------------------------------------------------------------
//  Paralysed_Medium_Emitter
//------------------------------------------------------------------------------

// AParalysed_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AParalysed_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  PePUp_Medium_Emitter
//------------------------------------------------------------------------------

// APePUp_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APePUp_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Pet_Despawn_Emitter
//------------------------------------------------------------------------------

// APet_Despawn_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APet_Despawn_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Pet_Spawn_Emitter
//------------------------------------------------------------------------------

// APet_Spawn_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APet_Spawn_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Phasing_Nettle_Emitter
//------------------------------------------------------------------------------

// APhasing_Nettle_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APhasing_Nettle_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  PhysiqueBuffEmitter
//------------------------------------------------------------------------------

// APhysiqueBuffEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APhysiqueBuffEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  PhysiqueDebuffEmitter
//------------------------------------------------------------------------------

// APhysiqueDebuffEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APhysiqueDebuffEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  PlanetariumFireworks
//------------------------------------------------------------------------------

// APlanetariumFireworks 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APlanetariumFireworks : public AEmitter {
};


//------------------------------------------------------------------------------
//  Poison2Emitter
//------------------------------------------------------------------------------

// APoison2Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoison2Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Poison4Emitter
//------------------------------------------------------------------------------

// APoison4Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoison4Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  PoisonBolt_Medium_Emitter
//------------------------------------------------------------------------------

// APoisonBolt_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisonBolt_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  PoisonCast_Melee_Emitter
//------------------------------------------------------------------------------

// APoisonCast_Melee_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisonCast_Melee_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  PoisonCast_Spell_1_Emitter
//------------------------------------------------------------------------------

// APoisonCast_Spell_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisonCast_Spell_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  PoisonCloud1Emitter
//------------------------------------------------------------------------------

// APoisonCloud1Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisonCloud1Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  PoisonCloudEmitter
//------------------------------------------------------------------------------

// APoisonCloudEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisonCloudEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  PoisonCloud_Emitter_Medium
//------------------------------------------------------------------------------

// APoisonCloud_Emitter_Medium 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisonCloud_Emitter_Medium : public AEmitter {
};


//------------------------------------------------------------------------------
//  PoisonCloud_Medium_Emitter
//------------------------------------------------------------------------------

// APoisonCloud_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisonCloud_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  PoisonCone1Emitter
//------------------------------------------------------------------------------

// APoisonCone1Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisonCone1Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  PoisonConeEmitter
//------------------------------------------------------------------------------

// APoisonConeEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisonConeEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  PoisonCone_Emitter_Medium
//------------------------------------------------------------------------------

// APoisonCone_Emitter_Medium 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisonCone_Emitter_Medium : public AEmitter {
};


//------------------------------------------------------------------------------
//  PoisonEruptionEmitter
//------------------------------------------------------------------------------

// APoisonEruptionEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisonEruptionEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  PoisonExplosion1Emitter
//------------------------------------------------------------------------------

// APoisonExplosion1Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisonExplosion1Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  PoisonExplosion_Emitter_Medium
//------------------------------------------------------------------------------

// APoisonExplosion_Emitter_Medium 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisonExplosion_Emitter_Medium : public AEmitter {
};


//------------------------------------------------------------------------------
//  PoisonExplosion_Medium_Emitter
//------------------------------------------------------------------------------

// APoisonExplosion_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisonExplosion_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  PoisonHit_Spell_Large_Emitter
//------------------------------------------------------------------------------

// APoisonHit_Spell_Large_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisonHit_Spell_Large_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  PoisonHit_Spell_Medium_Emitter
//------------------------------------------------------------------------------

// APoisonHit_Spell_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisonHit_Spell_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  PoisonHit_Spell_Small_Emitter
//------------------------------------------------------------------------------

// APoisonHit_Spell_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisonHit_Spell_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  PoisonLargeEmitter
//------------------------------------------------------------------------------

// APoisonLargeEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisonLargeEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  PoisonMediumEmitter
//------------------------------------------------------------------------------

// APoisonMediumEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisonMediumEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  PoisonProjectile_Emitter_Medium
//------------------------------------------------------------------------------

// APoisonProjectile_Emitter_Medium 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisonProjectile_Emitter_Medium : public AEmitter {
};


//------------------------------------------------------------------------------
//  PoisonShootEmitter
//------------------------------------------------------------------------------

// APoisonShootEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisonShootEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  PoisonSmallEmitter
//------------------------------------------------------------------------------

// APoisonSmallEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoisonSmallEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Poison_Cone_Medium_Emitter
//------------------------------------------------------------------------------

// APoison_Cone_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoison_Cone_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Poison_Tracer
//------------------------------------------------------------------------------

// APoison_Tracer 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APoison_Tracer : public AEmitter {
};


//------------------------------------------------------------------------------
//  PossessionDemonEmitter
//------------------------------------------------------------------------------

// APossessionDemonEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APossessionDemonEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  PossessionEmitter
//------------------------------------------------------------------------------

// APossessionEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APossessionEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Possession_Tracer
//------------------------------------------------------------------------------

// APossession_Tracer 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT APossession_Tracer : public AEmitter {
};


//------------------------------------------------------------------------------
//  Quest_FX_OATG
//------------------------------------------------------------------------------

// AQuest_FX_OATG 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AQuest_FX_OATG : public AEmitter {
};


//------------------------------------------------------------------------------
//  Quest_FX_SPFK_LoreBowl
//------------------------------------------------------------------------------

// AQuest_FX_SPFK_LoreBowl 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AQuest_FX_SPFK_LoreBowl : public AEmitter {
};


//------------------------------------------------------------------------------
//  RangedHit_Medium_Emitter
//------------------------------------------------------------------------------

// ARangedHit_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARangedHit_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RangedHit_Small_Emitter
//------------------------------------------------------------------------------

// ARangedHit_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARangedHit_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RedChain_Hit_1_Emitter
//------------------------------------------------------------------------------

// ARedChain_Hit_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARedChain_Hit_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Redemption_Medium_Emitter
//------------------------------------------------------------------------------

// ARedemption_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARedemption_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Residual_lightning_Emitter
//------------------------------------------------------------------------------

// AResidual_lightning_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AResidual_lightning_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ResistanceAttackEmitter
//------------------------------------------------------------------------------

// AResistanceAttackEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AResistanceAttackEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ResistanceRuneEmitter
//------------------------------------------------------------------------------

// AResistanceRuneEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AResistanceRuneEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ResistanceSoulEmitter
//------------------------------------------------------------------------------

// AResistanceSoulEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AResistanceSoulEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ResistanceSpiritEmitter
//------------------------------------------------------------------------------

// AResistanceSpiritEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AResistanceSpiritEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Return_All_Emitter
//------------------------------------------------------------------------------

// AReturn_All_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AReturn_All_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RevHacktraceremitter
//------------------------------------------------------------------------------

// ARevHacktraceremitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARevHacktraceremitter : public ASwordtrail1emitter {
};


//------------------------------------------------------------------------------
//  Ripple_1_Emitter
//------------------------------------------------------------------------------

// ARipple_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARipple_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RoarEmitter
//------------------------------------------------------------------------------

// ARoarEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARoarEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune10Emitter
//------------------------------------------------------------------------------

// ARune10Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune10Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune5Emitter
//------------------------------------------------------------------------------

// ARune5Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune5Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneBeam_Emitter_Medium
//------------------------------------------------------------------------------

// ARuneBeam_Emitter_Medium 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneBeam_Emitter_Medium : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneBeam_Medium2_Emitter
//------------------------------------------------------------------------------

// ARuneBeam_Medium2_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneBeam_Medium2_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneBeam_Medium_Emitter
//------------------------------------------------------------------------------

// ARuneBeam_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneBeam_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneBlastBEmitter
//------------------------------------------------------------------------------

// ARuneBlastBEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneBlastBEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneBlastEmitter
//------------------------------------------------------------------------------

// ARuneBlastEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneBlastEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneBoltEmitter
//------------------------------------------------------------------------------

// ARuneBoltEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneBoltEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneBolt_Medium_Emitter
//------------------------------------------------------------------------------

// ARuneBolt_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneBolt_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneBuff_Spell_2_Emitter
//------------------------------------------------------------------------------

// ARuneBuff_Spell_2_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneBuff_Spell_2_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneBuff_Spell_3_Emitter
//------------------------------------------------------------------------------

// ARuneBuff_Spell_3_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneBuff_Spell_3_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneCast_Emitter
//------------------------------------------------------------------------------

// ARuneCast_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneCast_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneCast_Melee_Emitter
//------------------------------------------------------------------------------

// ARuneCast_Melee_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneCast_Melee_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneCast_Spell_1_Emitter
//------------------------------------------------------------------------------

// ARuneCast_Spell_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneCast_Spell_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneCloud1Emitter
//------------------------------------------------------------------------------

// ARuneCloud1Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneCloud1Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneConeEmitter
//------------------------------------------------------------------------------

// ARuneConeEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneConeEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneCone_Emitter_Medium
//------------------------------------------------------------------------------

// ARuneCone_Emitter_Medium 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneCone_Emitter_Medium : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneCone_Medium_Emitter
//------------------------------------------------------------------------------

// ARuneCone_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneCone_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneDrawn_1_Emitter
//------------------------------------------------------------------------------

// ARuneDrawn_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneDrawn_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneDrawn_2_Emitter
//------------------------------------------------------------------------------

// ARuneDrawn_2_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneDrawn_2_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneDrawn_3_Emitter
//------------------------------------------------------------------------------

// ARuneDrawn_3_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneDrawn_3_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneDrawn_4_Emitter
//------------------------------------------------------------------------------

// ARuneDrawn_4_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneDrawn_4_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneDrawn_5_Emitter
//------------------------------------------------------------------------------

// ARuneDrawn_5_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneDrawn_5_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneDrawn_6_Emitter
//------------------------------------------------------------------------------

// ARuneDrawn_6_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneDrawn_6_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneExplosion1Emitter
//------------------------------------------------------------------------------

// ARuneExplosion1Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneExplosion1Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneExplosion2Emitter
//------------------------------------------------------------------------------

// ARuneExplosion2Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneExplosion2Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneExplosion_Emitter_Medium
//------------------------------------------------------------------------------

// ARuneExplosion_Emitter_Medium 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneExplosion_Emitter_Medium : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneExplosion_Emitter_Small
//------------------------------------------------------------------------------

// ARuneExplosion_Emitter_Small 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneExplosion_Emitter_Small : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneExplosion_Medium_Emitter
//------------------------------------------------------------------------------

// ARuneExplosion_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneExplosion_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneExplosion_Small_Emitter
//------------------------------------------------------------------------------

// ARuneExplosion_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneExplosion_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneHit1Emitter
//------------------------------------------------------------------------------

// ARuneHit1Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneHit1Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneHit_Large_Emitter
//------------------------------------------------------------------------------

// ARuneHit_Large_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneHit_Large_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneHit_Medium_Emitter
//------------------------------------------------------------------------------

// ARuneHit_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneHit_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneHit_Small_Emitter
//------------------------------------------------------------------------------

// ARuneHit_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneHit_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneHit_Spell_Large_Emitter
//------------------------------------------------------------------------------

// ARuneHit_Spell_Large_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneHit_Spell_Large_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneHit_Spell_Medium_Emitter
//------------------------------------------------------------------------------

// ARuneHit_Spell_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneHit_Spell_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneHit_Spell_Small_Emitter
//------------------------------------------------------------------------------

// ARuneHit_Spell_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneHit_Spell_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneProjectile_Emitter_Medium
//------------------------------------------------------------------------------

// ARuneProjectile_Emitter_Medium 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneProjectile_Emitter_Medium : public AEmitter {
};


//------------------------------------------------------------------------------
//  RuneShardStakes_Medium_Emitter
//------------------------------------------------------------------------------

// ARuneShardStakes_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARuneShardStakes_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Area_Special_1_Emitter
//------------------------------------------------------------------------------

// ARune_Area_Special_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Area_Special_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Beam_Small_Emitter
//------------------------------------------------------------------------------

// ARune_Beam_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Beam_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_BloodBond_Emitter
//------------------------------------------------------------------------------

// ARune_BloodBond_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_BloodBond_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_BloodHook_Emitter
//------------------------------------------------------------------------------

// ARune_BloodHook_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_BloodHook_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Debuff_1_Emitter
//------------------------------------------------------------------------------

// ARune_Debuff_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Debuff_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Linked_Emitter
//------------------------------------------------------------------------------

// ARune_Linked_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Linked_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_Link_Emitter
//------------------------------------------------------------------------------

// ARune_Link_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_Link_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Rune_ShardShield_Emitter
//------------------------------------------------------------------------------

// ARune_ShardShield_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ARune_ShardShield_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Scared_Medium_Emitter
//------------------------------------------------------------------------------

// AScared_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AScared_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Selection_HeightMesh_Emitter
//------------------------------------------------------------------------------

// ASelection_HeightMesh_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASelection_HeightMesh_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Shape_Shift_Emitter
//------------------------------------------------------------------------------

// AShape_Shift_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AShape_Shift_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Shape_Unshift_Emitter
//------------------------------------------------------------------------------

// AShape_Unshift_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AShape_Unshift_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Shift1Emitter
//------------------------------------------------------------------------------

// AShift1Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AShift1Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  ShootBowEmitter
//------------------------------------------------------------------------------

// AShootBowEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AShootBowEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Signaling_Flare_Emitter
//------------------------------------------------------------------------------

// ASignaling_Flare_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASignaling_Flare_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Slashtraceremitter
//------------------------------------------------------------------------------

// ASlashtraceremitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASlashtraceremitter : public ASwordtrail1emitter {
};


//------------------------------------------------------------------------------
//  Slywood_Portal_Emitter
//------------------------------------------------------------------------------

// ASlywood_Portal_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASlywood_Portal_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulBeam_Emitter_Medium
//------------------------------------------------------------------------------

// ASoulBeam_Emitter_Medium 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulBeam_Emitter_Medium : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulBlastEmitter
//------------------------------------------------------------------------------

// ASoulBlastEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulBlastEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulBoltEmitter
//------------------------------------------------------------------------------

// ASoulBoltEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulBoltEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulBoltShoot1Emitter
//------------------------------------------------------------------------------

// ASoulBoltShoot1Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulBoltShoot1Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulBolt_Medium_Emitter
//------------------------------------------------------------------------------

// ASoulBolt_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulBolt_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulCast_Melee_Emitter
//------------------------------------------------------------------------------

// ASoulCast_Melee_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulCast_Melee_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulCast_Spell_1_Emitter
//------------------------------------------------------------------------------

// ASoulCast_Spell_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulCast_Spell_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulConeEmitter
//------------------------------------------------------------------------------

// ASoulConeEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulConeEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulCone_Emitter_Medium
//------------------------------------------------------------------------------

// ASoulCone_Emitter_Medium 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulCone_Emitter_Medium : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulExplosion1Emitter
//------------------------------------------------------------------------------

// ASoulExplosion1Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulExplosion1Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulExplosion_Emitter_Medium
//------------------------------------------------------------------------------

// ASoulExplosion_Emitter_Medium 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulExplosion_Emitter_Medium : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulExplosion_Medium_Emitter
//------------------------------------------------------------------------------

// ASoulExplosion_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulExplosion_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulExplosion_Small_Emitter
//------------------------------------------------------------------------------

// ASoulExplosion_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulExplosion_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulHit1Emitter
//------------------------------------------------------------------------------

// ASoulHit1Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulHit1Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulHit_Large_Emitter
//------------------------------------------------------------------------------

// ASoulHit_Large_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulHit_Large_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulHit_Link_Emitter
//------------------------------------------------------------------------------

// ASoulHit_Link_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulHit_Link_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulHit_Medium_Emitter
//------------------------------------------------------------------------------

// ASoulHit_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulHit_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulHit_Small_Emitter
//------------------------------------------------------------------------------

// ASoulHit_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulHit_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulHit_Spell_Large_Emitter
//------------------------------------------------------------------------------

// ASoulHit_Spell_Large_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulHit_Spell_Large_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulHit_Spell_Medium_Emitter
//------------------------------------------------------------------------------

// ASoulHit_Spell_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulHit_Spell_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulHit_Spell_Small_Emitter
//------------------------------------------------------------------------------

// ASoulHit_Spell_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulHit_Spell_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SoulProjectile_Emitter_Medium
//------------------------------------------------------------------------------

// ASoulProjectile_Emitter_Medium 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoulProjectile_Emitter_Medium : public AEmitter {
};


//------------------------------------------------------------------------------
//  Soul_Beam_Small_Emitter
//------------------------------------------------------------------------------

// ASoul_Beam_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoul_Beam_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Soul_Buff_1_Emitter
//------------------------------------------------------------------------------

// ASoul_Buff_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoul_Buff_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Soul_Cone_Medium_Emitter
//------------------------------------------------------------------------------

// ASoul_Cone_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoul_Cone_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Soul_Hit_Spell_Large_Target_Emitter
//------------------------------------------------------------------------------

// ASoul_Hit_Spell_Large_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoul_Hit_Spell_Large_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Soul_Hit_Spell_Small_Target_Emitter
//------------------------------------------------------------------------------

// ASoul_Hit_Spell_Small_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoul_Hit_Spell_Small_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Soul_Link_Emitter
//------------------------------------------------------------------------------

// ASoul_Link_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoul_Link_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Soul_Shard_Emitter
//------------------------------------------------------------------------------

// ASoul_Shard_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASoul_Shard_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Sparkles_Tracer
//------------------------------------------------------------------------------

// ASparkles_Tracer 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASparkles_Tracer : public AEmitter {
};


//------------------------------------------------------------------------------
//  SPFK_27_UrvhailSpawn_Emitter
//------------------------------------------------------------------------------

// ASPFK_27_UrvhailSpawn_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASPFK_27_UrvhailSpawn_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritBeam1Emitter
//------------------------------------------------------------------------------

// ASpiritBeam1Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritBeam1Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritBeam_Emitter_Medium
//------------------------------------------------------------------------------

// ASpiritBeam_Emitter_Medium 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritBeam_Emitter_Medium : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritBlastEmitter
//------------------------------------------------------------------------------

// ASpiritBlastEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritBlastEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritBoltEmitter
//------------------------------------------------------------------------------

// ASpiritBoltEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritBoltEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritBolt_Medium_Emitter
//------------------------------------------------------------------------------

// ASpiritBolt_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritBolt_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritBuff_Spell_2_Emitter
//------------------------------------------------------------------------------

// ASpiritBuff_Spell_2_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritBuff_Spell_2_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritBuff_Spell_3_Emitter
//------------------------------------------------------------------------------

// ASpiritBuff_Spell_3_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritBuff_Spell_3_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritCastEmitter
//------------------------------------------------------------------------------

// ASpiritCastEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritCastEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritCast_Melee_Emitter
//------------------------------------------------------------------------------

// ASpiritCast_Melee_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritCast_Melee_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritCast_Spell_1_Emitter
//------------------------------------------------------------------------------

// ASpiritCast_Spell_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritCast_Spell_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritConeEmitter
//------------------------------------------------------------------------------

// ASpiritConeEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritConeEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritCone_Emitter_Medium
//------------------------------------------------------------------------------

// ASpiritCone_Emitter_Medium 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritCone_Emitter_Medium : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritCone_Medium_Emitter
//------------------------------------------------------------------------------

// ASpiritCone_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritCone_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritDuff_2_Emitter
//------------------------------------------------------------------------------

// ASpiritDuff_2_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritDuff_2_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritDuff_3_Emitter
//------------------------------------------------------------------------------

// ASpiritDuff_3_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritDuff_3_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritExplosion1Emitter
//------------------------------------------------------------------------------

// ASpiritExplosion1Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritExplosion1Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritExplosion_Emitter_Medium
//------------------------------------------------------------------------------

// ASpiritExplosion_Emitter_Medium 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritExplosion_Emitter_Medium : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritExplosion_Medium_Emitter
//------------------------------------------------------------------------------

// ASpiritExplosion_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritExplosion_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritExplosion_Small_Emitter
//------------------------------------------------------------------------------

// ASpiritExplosion_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritExplosion_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritForm_Medium_Emitter
//------------------------------------------------------------------------------

// ASpiritForm_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritForm_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritHit1Emitter
//------------------------------------------------------------------------------

// ASpiritHit1Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritHit1Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritHit_Large_Emitter
//------------------------------------------------------------------------------

// ASpiritHit_Large_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritHit_Large_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritHit_Medium_Emitter
//------------------------------------------------------------------------------

// ASpiritHit_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritHit_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritHit_Small_Emitter
//------------------------------------------------------------------------------

// ASpiritHit_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritHit_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritHit_Spell_Medium_Emitter
//------------------------------------------------------------------------------

// ASpiritHit_Spell_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritHit_Spell_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritProjectile_Emitter_Medium
//------------------------------------------------------------------------------

// ASpiritProjectile_Emitter_Medium 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritProjectile_Emitter_Medium : public AEmitter {
};


//------------------------------------------------------------------------------
//  SpiritShift1Emitter
//------------------------------------------------------------------------------

// ASpiritShift1Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpiritShift1Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Beam_Small_Emitter
//------------------------------------------------------------------------------

// ASpirit_Beam_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Beam_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Buff_2_Emitter
//------------------------------------------------------------------------------

// ASpirit_Buff_2_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Buff_2_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Cast_Possession_1_Emitter
//------------------------------------------------------------------------------

// ASpirit_Cast_Possession_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Cast_Possession_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Debuff_1_Emitter
//------------------------------------------------------------------------------

// ASpirit_Debuff_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Debuff_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Hit_Link_Small_Emitter
//------------------------------------------------------------------------------

// ASpirit_Hit_Link_Small_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Hit_Link_Small_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Hit_Spell_Large_Target_Emitter
//------------------------------------------------------------------------------

// ASpirit_Hit_Spell_Large_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Hit_Spell_Large_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Hit_Spell_Small_Target_Emitter
//------------------------------------------------------------------------------

// ASpirit_Hit_Spell_Small_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Hit_Spell_Small_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Spirit_Linked_Emitter
//------------------------------------------------------------------------------

// ASpirit_Linked_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASpirit_Linked_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SproutEmitter
//------------------------------------------------------------------------------

// ASproutEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASproutEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SS_Arrow_big_expl_down
//------------------------------------------------------------------------------

// ASS_Arrow_big_expl_down 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASS_Arrow_big_expl_down : public AEmitter {
};


//------------------------------------------------------------------------------
//  SS_Arrow_big_trail
//------------------------------------------------------------------------------

// ASS_Arrow_big_trail 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASS_Arrow_big_trail : public AEmitter {
};


//------------------------------------------------------------------------------
//  State10Emitter
//------------------------------------------------------------------------------

// AState10Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AState10Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  State1Emitter
//------------------------------------------------------------------------------

// AState1Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AState1Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  State7Emitter
//------------------------------------------------------------------------------

// AState7Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AState7Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  SummonParticleEffect
//------------------------------------------------------------------------------

// ASummonParticleEffect 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASummonParticleEffect : public AEmitter {
};


//------------------------------------------------------------------------------
//  Swarm_Cone_Emitter
//------------------------------------------------------------------------------

// ASwarm_Cone_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASwarm_Cone_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Swingtraceremitter
//------------------------------------------------------------------------------

// ASwingtraceremitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASwingtraceremitter : public ASwordtrail1emitter {
};


//------------------------------------------------------------------------------
//  Swordcharge1emitter
//------------------------------------------------------------------------------

// ASwordcharge1emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ASwordcharge1emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  TBDA_14_CageExplosion_Emitter
//------------------------------------------------------------------------------

// ATBDA_14_CageExplosion_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATBDA_14_CageExplosion_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  TBFB_01_ChestEmitter
//------------------------------------------------------------------------------

// ATBFB_01_ChestEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATBFB_01_ChestEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  TCLvl15_ActiveBirthsign
//------------------------------------------------------------------------------

// ATCLvl15_ActiveBirthsign 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATCLvl15_ActiveBirthsign : public AEmitter {
};


//------------------------------------------------------------------------------
//  TCLvl15_HazyBarrierEmitter
//------------------------------------------------------------------------------

// ATCLvl15_HazyBarrierEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATCLvl15_HazyBarrierEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  TCLvl15_LezuEmitter
//------------------------------------------------------------------------------

// ATCLvl15_LezuEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATCLvl15_LezuEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  TCLvl25_ForcefieldEmitter
//------------------------------------------------------------------------------

// ATCLvl25_ForcefieldEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATCLvl25_ForcefieldEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  TCLvl25_SourceOfEvil_0_Emitter
//------------------------------------------------------------------------------

// ATCLvl25_SourceOfEvil_0_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATCLvl25_SourceOfEvil_0_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  TCLvl25_SourceOfEvil_1_Emitter
//------------------------------------------------------------------------------

// ATCLvl25_SourceOfEvil_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATCLvl25_SourceOfEvil_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  TCLvl25_SourceOfEvil_2_Emitter
//------------------------------------------------------------------------------

// ATCLvl25_SourceOfEvil_2_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATCLvl25_SourceOfEvil_2_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  TCLvl25_SourceOfEvil_3_Emitter
//------------------------------------------------------------------------------

// ATCLvl25_SourceOfEvil_3_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATCLvl25_SourceOfEvil_3_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  TCLvl50_Barrier_Emitter
//------------------------------------------------------------------------------

// ATCLvl50_Barrier_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATCLvl50_Barrier_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  TCLvl50_Cylinder_Emitter
//------------------------------------------------------------------------------

// ATCLvl50_Cylinder_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATCLvl50_Cylinder_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Team0_Banner_Emitter
//------------------------------------------------------------------------------

// ATeam0_Banner_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATeam0_Banner_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Team1_Banner_Emitter
//------------------------------------------------------------------------------

// ATeam1_Banner_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATeam1_Banner_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  TeleportEmitter
//------------------------------------------------------------------------------

// ATeleportEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATeleportEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Teleport_Emitter_Medium
//------------------------------------------------------------------------------

// ATeleport_Emitter_Medium 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATeleport_Emitter_Medium : public AEmitter {
};


//------------------------------------------------------------------------------
//  Teleport_Tracer
//------------------------------------------------------------------------------

// ATeleport_Tracer 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATeleport_Tracer : public AEmitter {
};


//------------------------------------------------------------------------------
//  Thrusttraceremitter
//------------------------------------------------------------------------------

// AThrusttraceremitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AThrusttraceremitter : public ASwordtrail1emitter {
};


//------------------------------------------------------------------------------
//  Thundercloud_Large_Emitter
//------------------------------------------------------------------------------

// AThundercloud_Large_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AThundercloud_Large_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  TotA_2_TorchEmitter
//------------------------------------------------------------------------------

// ATotA_2_TorchEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATotA_2_TorchEmitter : public AFire_Emitter_Calm {
};


//------------------------------------------------------------------------------
//  TracerEmitter
//------------------------------------------------------------------------------

// ATracerEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATracerEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  TSST_04_AlnorsPortal
//------------------------------------------------------------------------------

// ATSST_04_AlnorsPortal 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT ATSST_04_AlnorsPortal : public AEmitter {
};


//------------------------------------------------------------------------------
//  Unarmed_Hit_Large_Target_Emitter
//------------------------------------------------------------------------------

// AUnarmed_Hit_Large_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AUnarmed_Hit_Large_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Unarmed_Hit_Small_Target_Emitter
//------------------------------------------------------------------------------

// AUnarmed_Hit_Small_Target_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AUnarmed_Hit_Small_Target_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Valiant_Medium_Emitter
//------------------------------------------------------------------------------

// AValiant_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AValiant_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  VHUT_04_StatueSwitchEmitter
//------------------------------------------------------------------------------

// AVHUT_04_StatueSwitchEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AVHUT_04_StatueSwitchEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  VoidField_1_Emitter
//------------------------------------------------------------------------------

// AVoidField_1_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AVoidField_1_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  VoidField_4_Emitter
//------------------------------------------------------------------------------

// AVoidField_4_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AVoidField_4_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Void_base_Emitter
//------------------------------------------------------------------------------

// AVoid_base_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AVoid_base_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Void_Explosion_Emitter
//------------------------------------------------------------------------------

// AVoid_Explosion_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AVoid_Explosion_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Void_type6_Emitter
//------------------------------------------------------------------------------

// AVoid_type6_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AVoid_type6_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Volley1Emitter
//------------------------------------------------------------------------------

// AVolley1Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AVolley1Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  WeaponTipSpark
//------------------------------------------------------------------------------

// AWeaponTipSpark 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AWeaponTipSpark : public AEmitter {
};


//------------------------------------------------------------------------------
//  Whirlwind_Medium_Emitter
//------------------------------------------------------------------------------

// AWhirlwind_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AWhirlwind_Medium_Emitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  WildHuntEmitter
//------------------------------------------------------------------------------

// AWildHuntEmitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AWildHuntEmitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Wind_Tracer
//------------------------------------------------------------------------------

// AWind_Tracer 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AWind_Tracer : public AEmitter {
};


//------------------------------------------------------------------------------
//  Wisp_Green_Emitter
//------------------------------------------------------------------------------

// AWisp_Green_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AWisp_Green_Emitter : public AWisp01Emitter {
};


//------------------------------------------------------------------------------
//  Wisp_Red_Emitter
//------------------------------------------------------------------------------

// AWisp_Red_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AWisp_Red_Emitter : public AWisp01Emitter {
};


//------------------------------------------------------------------------------
//  Wisp_Teal_Emitter
//------------------------------------------------------------------------------

// AWisp_Teal_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AWisp_Teal_Emitter : public AWisp01Emitter {
};


//------------------------------------------------------------------------------
//  WOTM_03_crystalemitter
//------------------------------------------------------------------------------

// AWOTM_03_crystalemitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AWOTM_03_crystalemitter : public AEmitter {
};


//------------------------------------------------------------------------------
//  Yell_Medium_Emitter
//------------------------------------------------------------------------------

// AYell_Medium_Emitter 212 ( CLASS_Compiled CLASS_Parsed CLASS_NoUserCreate )
class DLL_IMPORT AYell_Medium_Emitter : public AEmitter {
};




#ifndef NAMES_ONLY
#undef AUTOGENERATE_NAME
#undef AUTOGENERATET_FUNCTION
#undef AUTOGENERATE_CLASS
#undef AUTOGENERATE_PACKAGE
#endif NAMES_ONLY

#if _MSC_VER
#pragma pack (pop)
#endif

