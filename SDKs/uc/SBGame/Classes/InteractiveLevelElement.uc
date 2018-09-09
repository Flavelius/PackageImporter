//==============================================================================
//  InteractiveLevelElement
//==============================================================================

class InteractiveLevelElement extends Game_Actor
    native
    exportstructs
    dependsOn(Interaction_Component,StringReferences,Game_RadialMenuOptions)
  ;

  struct TaggedEffect {
      var export editinline FSkill_EffectClass_AudioVisual effect;
      var int Handle;
      var name Tag;

  };


  struct MenuInteraction {
      var (MenuInteraction) byte MenuOption;
      var deprecated name InteractionTag;
      var (MenuInteraction) editinline array<Interaction_Component> StackedActions;
      var (MenuInteraction) editinline array<Content_Requirement> Requirements;

  };


  struct IntegralRange {
      var (IntegralRange) int Min;
      var (IntegralRange) int Max;

  };


  var (Interactions) array<MenuInteraction> Actions;
  var (Requirements) array<Content_Requirement> Requirements;
  var (Requirements) bool UsableInCombat;
  var (InteractionPosition) Vector ActionPositionOffset;
  var (InteractionPosition) Rotator ActionOrientationOffset;
  var (InteractionPosition) float RequiredProximity;
  var transient Vector AbsPosition;
  var transient Rotator AbsRotation;
  var transient array<TaggedEffect> TaggedEffects;
  var (Appearance) editinline array<FSkill_EffectClass_AudioVisual> ActivatedEffects;
  var (Appearance) editinline array<FSkill_EffectClass_AudioVisual> DeactivatedEffects;
  var array<int> ActivationEffects;
  var (Description) LocalizedString Description;
  var bool IsActivated;
  var bool mNetIsActivated;
  var transient bool mRespawnTimerActive;
  var transient float mCurrentRespawnTime;
  var transient byte mCurrentOption;
  var transient Game_PlayerController mTargetController;
  var transient int mListenerIndex;
  var transient float mInteractionTime;
  var transient int mCurrentOptionIndex;
  var transient int mCurrentSubAction;
  var transient bool mReverse;
  var transient bool mCurrentSubActionStarted;
  var transient bool mIsUnderCursor;


  function cl_StopTaggedEffects(name aTag) {
    local int ti;
    ti = TaggedEffects.Length - 1;                                              //0000 : 0F 00 50 3F 32 13 93 37 01 68 39 30 0F 26 16 
    while (ti >= 0) {                                                           //000F : 07 69 00 99 00 50 3F 32 13 25 16 
      if (TaggedEffects[ti].Tag == aTag) {                                      //001A : 07 5F 00 FE 36 E0 39 30 0F 10 00 50 3F 32 13 01 68 39 30 0F 00 18 3E 32 13 16 
        Effects.cl_Stop(TaggedEffects[ti].Handle);                              //0034 : 19 01 B8 F3 1E 11 16 00 04 1C D8 65 34 0F 36 58 3A 30 0F 10 00 50 3F 32 13 01 68 39 30 0F 16 
        TaggedEffects.Remove(ti,1);                                             //0053 : 41 01 68 39 30 0F 00 50 3F 32 13 26 
      }
      ti--;                                                                     //005F : A6 00 50 3F 32 13 16 
    }
    //0F 00 50 3F 32 13 93 37 01 68 39 30 0F 26 16 07 69 00 99 00 50 3F 32 13 25 16 07 5F 00 FE 36 E0 
    //39 30 0F 10 00 50 3F 32 13 01 68 39 30 0F 00 18 3E 32 13 16 19 01 B8 F3 1E 11 16 00 04 1C D8 65 
    //34 0F 36 58 3A 30 0F 10 00 50 3F 32 13 01 68 39 30 0F 16 41 01 68 39 30 0F 00 50 3F 32 13 26 A6 
    //00 50 3F 32 13 16 06 0F 00 04 0B 47 
  }


  function cl_StartTaggedEffect(name aTag,export editinline FSkill_EffectClass_AudioVisual aEffect) {
    local TaggedEffect NewEffect;
    local int H;
    if (aEffect != None) {                                                      //0000 : 07 15 01 77 00 A8 3D 30 0F 2A 16 
      if (aEffect.RunningDuration != 0) {                                       //000B : 07 76 00 B5 19 00 A8 3D 30 0F 05 00 04 01 40 9C 24 11 39 3F 25 16 
        H = Effects.cl_Start(aEffect,Class'Game_Effects'.-1073741824,Class'Game_Effects'.-1073741824.00000000,Class'Game_Effects'.-1073741824.00000000,Class'Game_Effects'.-1073741824.00000000);//0021 : 0F 00 20 3E 30 0F 19 01 B8 F3 1E 11 43 00 04 1C 28 65 34 0F 00 A8 3D 30 0F 12 20 10 43 5F 01 05 00 04 1D 00 00 00 C0 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 16 
      } else {                                                                  //0073 : 06 C8 00 
        H = Effects.cl_Start(aEffect,Class'Game_Effects'.-1073741824,Class'Game_Effects'.-1073741824.00000000,Class'Game_Effects'.-1073741824.00000000,Class'FSkill_EffectClass_AudioVisual'.-1.00000000);//0076 : 0F 00 20 3E 30 0F 19 01 B8 F3 1E 11 43 00 04 1C 28 65 34 0F 00 A8 3D 30 0F 12 20 10 43 5F 01 05 00 04 1D 00 00 00 C0 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 80 8F 5D 01 05 00 04 1E 00 00 80 BF 16 
      }
      if (H != 0) {                                                             //00C8 : 07 15 01 9B 00 20 3E 30 0F 25 16 
        NewEffect.Tag = aTag;                                                   //00D3 : 0F 36 E0 39 30 0F 00 98 3E 30 0F 00 80 3B 30 0F 
        NewEffect.effect = aEffect;                                             //00E3 : 0F 36 10 3F 30 0F 00 98 3E 30 0F 00 A8 3D 30 0F 
        NewEffect.Handle = H;                                                   //00F3 : 0F 36 58 3A 30 0F 00 98 3E 30 0F 00 20 3E 30 0F 
        TaggedEffects[TaggedEffects.Length] = NewEffect;                        //0103 : 0F 10 37 01 68 39 30 0F 01 68 39 30 0F 00 98 3E 30 0F 
      }
    }
    //07 15 01 77 00 A8 3D 30 0F 2A 16 07 76 00 B5 19 00 A8 3D 30 0F 05 00 04 01 40 9C 24 11 39 3F 25 
    //16 0F 00 20 3E 30 0F 19 01 B8 F3 1E 11 43 00 04 1C 28 65 34 0F 00 A8 3D 30 0F 12 20 10 43 5F 01 
    //05 00 04 1D 00 00 00 C0 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 10 43 5F 01 05 00 04 1E 
    //00 00 80 CE 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 16 06 C8 00 0F 00 20 3E 30 0F 19 01 B8 F3 
    //1E 11 43 00 04 1C 28 65 34 0F 00 A8 3D 30 0F 12 20 10 43 5F 01 05 00 04 1D 00 00 00 C0 12 20 10 
    //43 5F 01 05 00 04 1E 00 00 80 CE 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 80 8F 5D 01 05 
    //00 04 1E 00 00 80 BF 16 07 15 01 9B 00 20 3E 30 0F 25 16 0F 36 E0 39 30 0F 00 98 3E 30 0F 00 80 
    //3B 30 0F 0F 36 10 3F 30 0F 00 98 3E 30 0F 00 A8 3D 30 0F 0F 36 58 3A 30 0F 00 98 3E 30 0F 00 20 
    //3E 30 0F 0F 10 37 01 68 39 30 0F 01 68 39 30 0F 00 98 3E 30 0F 04 0B 47 
  }


  protected native function sv2clrel_CancelClientSubAction_CallStub();


  event sv2clrel_CancelClientSubAction(int aOptionIndex,int aSubActionIndex) {
    mCurrentOptionIndex = aOptionIndex;                                         //0000 : 0F 01 E8 41 30 0F 00 70 41 30 0F 
    mCurrentSubAction = aSubActionIndex;                                        //000B : 0F 01 60 42 30 0F 00 D8 42 30 0F 
    if (IsCurrentSubActionValid()) {                                            //0016 : 07 45 00 1B AB 0C 00 00 16 
      Actions[aOptionIndex].StackedActions[aSubActionIndex].ClOnCancel(self,mTargetPawn);//001F : 19 10 00 D8 42 30 0F 36 50 43 30 0F 10 00 70 41 30 0F 01 C8 43 30 0F 0C 00 00 1B 7E 0F 00 00 17 01 58 96 2A 11 16 
    }
    //0F 01 E8 41 30 0F 00 70 41 30 0F 0F 01 60 42 30 0F 00 D8 42 30 0F 07 45 00 1B AB 0C 00 00 16 19 
    //10 00 D8 42 30 0F 36 50 43 30 0F 10 00 70 41 30 0F 01 C8 43 30 0F 0C 00 00 1B 7E 0F 00 00 17 01 
    //58 96 2A 11 16 04 0B 47 
  }


  function sv_CancelClientSubAction() {
    sv2clrel_CancelClientSubAction_CallStub(mCurrentOptionIndex,mCurrentSubAction);//0000 : 1B EE 0D 00 00 01 E8 41 30 0F 01 60 42 30 0F 16 
    //1B EE 0D 00 00 01 E8 41 30 0F 01 60 42 30 0F 16 04 0B 47 
  }


  protected native function sv2clrel_EndClientSubAction_CallStub();


  event sv2clrel_EndClientSubAction(int aOptionIndex,int aSubActionIndex,bool aReverse) {
    mCurrentOptionIndex = aOptionIndex;                                         //0000 : 0F 01 E8 41 30 0F 00 98 46 30 0F 
    mCurrentSubAction = aSubActionIndex;                                        //000B : 0F 01 60 42 30 0F 00 10 47 30 0F 
    if (IsCurrentSubActionValid()) {                                            //0016 : 07 4B 00 1B AB 0C 00 00 16 
      Actions[aOptionIndex].StackedActions[aSubActionIndex].ClOnEnd(self,mTargetPawn,aReverse);//001F : 19 10 00 10 47 30 0F 36 50 43 30 0F 10 00 98 46 30 0F 01 C8 43 30 0F 12 00 00 1B A8 0F 00 00 17 01 58 96 2A 11 2D 00 88 47 30 0F 16 
    }
    //0F 01 E8 41 30 0F 00 98 46 30 0F 0F 01 60 42 30 0F 00 10 47 30 0F 07 4B 00 1B AB 0C 00 00 16 19 
    //10 00 10 47 30 0F 36 50 43 30 0F 10 00 98 46 30 0F 01 C8 43 30 0F 12 00 00 1B A8 0F 00 00 17 01 
    //58 96 2A 11 2D 00 88 47 30 0F 16 04 0B 47 
  }


  function sv_EndClientSubAction() {
    sv2clrel_EndClientSubAction_CallStub(mCurrentOptionIndex,mCurrentSubAction,mReverse);//0000 : 1B ED 0D 00 00 01 E8 41 30 0F 01 60 42 30 0F 2D 01 C8 3F 32 13 16 
    //1B ED 0D 00 00 01 E8 41 30 0F 01 60 42 30 0F 2D 01 C8 3F 32 13 16 04 0B 47 
  }


  protected native function sv2clrel_StartClientSubAction_CallStub();


  event sv2clrel_StartClientSubAction(int aOptionIndex,int aSubActionIndex,bool aReverse,Game_Pawn aTargetPawn) {
    mCurrentOptionIndex = aOptionIndex;                                         //0000 : 0F 01 E8 41 30 0F 00 A0 41 32 13 
    mCurrentSubAction = aSubActionIndex;                                        //000B : 0F 01 60 42 30 0F 00 00 44 32 13 
    mTargetPawn = aTargetPawn;                                                  //0016 : 0F 01 58 96 2A 11 00 78 44 32 13 
    if (IsCurrentSubActionValid()) {                                            //0021 : 07 56 00 1B AB 0C 00 00 16 
      Actions[aOptionIndex].StackedActions[aSubActionIndex].ClOnStart(self,mTargetPawn,aReverse);//002A : 19 10 00 00 44 32 13 36 50 43 30 0F 10 00 A0 41 32 13 01 C8 43 30 0F 12 00 00 1B B3 0F 00 00 17 01 58 96 2A 11 2D 00 F0 44 32 13 16 
    }
    //0F 01 E8 41 30 0F 00 A0 41 32 13 0F 01 60 42 30 0F 00 00 44 32 13 0F 01 58 96 2A 11 00 78 44 32 
    //13 07 56 00 1B AB 0C 00 00 16 19 10 00 00 44 32 13 36 50 43 30 0F 10 00 A0 41 32 13 01 C8 43 30 
    //0F 12 00 00 1B B3 0F 00 00 17 01 58 96 2A 11 2D 00 F0 44 32 13 16 04 0B 47 
  }


  function sv_StartClientSubAction() {
    sv2clrel_StartClientSubAction_CallStub(mCurrentOptionIndex,mCurrentSubAction,mReverse,mTargetPawn);//0000 : 1B EC 0D 00 00 01 E8 41 30 0F 01 60 42 30 0F 2D 01 C8 3F 32 13 01 58 96 2A 11 16 
    //1B EC 0D 00 00 01 E8 41 30 0F 01 60 42 30 0F 2D 01 C8 3F 32 13 01 58 96 2A 11 16 04 0B 47 
  }


  function byte GetActiveMenuOption(Game_Pawn aPawn) {
    if (mCurrentOptionIndex >= 0) {                                             //0000 : 07 1F 00 99 01 E8 41 30 0F 25 16 
      return Actions[mCurrentOptionIndex].MenuOption;                           //000B : 04 36 40 47 32 13 10 01 E8 41 30 0F 01 C8 43 30 0F 
    } else {                                                                    //001C : 06 22 00 
      return 0;                                                                 //001F : 04 24 00 
    }
    //07 1F 00 99 01 E8 41 30 0F 25 16 04 36 40 47 32 13 10 01 E8 41 30 0F 01 C8 43 30 0F 06 22 00 04 
    //24 00 04 0B 47 
  }


  native function bool IsCurrentSubActionValid();


  native function bool IsCurrentActionValid();


  function sv_CancelSubAction() {
    local Interaction_Component SubAction;
    if (IsCurrentSubActionValid()) {                                            //0000 : 07 3A 00 1B AB 0C 00 00 16 
      SubAction = Actions[mCurrentOptionIndex].StackedActions[mCurrentSubAction];//0009 : 0F 00 90 4B 32 13 10 01 60 42 30 0F 36 50 43 30 0F 10 01 E8 41 30 0F 01 C8 43 30 0F 
      SubAction.SvOnCancel(self,mTargetPawn);                                   //0025 : 19 00 90 4B 32 13 0C 00 00 1B 50 07 00 00 17 01 58 96 2A 11 16 
    }
    //07 3A 00 1B AB 0C 00 00 16 0F 00 90 4B 32 13 10 01 60 42 30 0F 36 50 43 30 0F 10 01 E8 41 30 0F 
    //01 C8 43 30 0F 19 00 90 4B 32 13 0C 00 00 1B 50 07 00 00 17 01 58 96 2A 11 16 04 0B 47 
  }


  event sv_StopOptionActions() {
    sv_CancelOptionActions();                                                   //0000 : 1B FD 06 00 00 16 
    //1B FD 06 00 00 16 04 0B 47 
  }


  event sv_CancelOptionActions() {
    if (IsActivated) {                                                          //0000 : 07 0F 00 2D 01 E8 4D 32 13 
      sv_CancelSubAction();                                                     //0009 : 1B E7 0D 00 00 16 
    }
    mCurrentOptionIndex = -1;                                                   //000F : 0F 01 E8 41 30 0F 1D FF FF FF FF 
    mCurrentSubAction = -1;                                                     //001A : 0F 01 60 42 30 0F 1D FF FF FF FF 
    mReverse = False;                                                           //0025 : 14 2D 01 C8 3F 32 13 28 
    UntriggerEvent(Event,self,mTargetPawn);                                     //002D : 1C 80 AF 34 0F 01 38 9F 6C 0F 17 01 58 96 2A 11 16 
    sv_SetActivated(False);                                                     //003E : 1B 5C 0D 00 00 28 16 
    //07 0F 00 2D 01 E8 4D 32 13 1B E7 0D 00 00 16 0F 01 E8 41 30 0F 1D FF FF FF FF 0F 01 60 42 30 0F 
    //1D FF FF FF FF 14 2D 01 C8 3F 32 13 28 1C 80 AF 34 0F 01 38 9F 6C 0F 17 01 58 96 2A 11 16 1B 5C 
    //0D 00 00 28 16 04 0B 47 
  }


  function sv_StartOptionActions() {
    sv_SetActivated(True);                                                      //0000 : 1B 5C 0D 00 00 27 16 
    TriggerEvent(Event,self,mTargetPawn);                                       //0007 : 1C F8 B1 34 0F 01 38 9F 6C 0F 17 01 58 96 2A 11 16 
    if (mTargetPawn != None) {                                                  //0018 : 07 32 00 77 01 58 96 2A 11 2A 16 
      mReverse = False;                                                         //0023 : 14 2D 01 C8 3F 32 13 28 
      mCurrentSubAction = 0;                                                    //002B : 0F 01 60 42 30 0F 25 
    }
    //1B 5C 0D 00 00 27 16 1C F8 B1 34 0F 01 38 9F 6C 0F 17 01 58 96 2A 11 16 07 32 00 77 01 58 96 2A 
    //11 2A 16 14 2D 01 C8 3F 32 13 28 0F 01 60 42 30 0F 25 04 0B 47 
  }


  event bool InRange(Actor aActor) {
    return VSize(aActor.Location - AbsPosition) < RequiredProximity;            //0000 : 04 B0 E1 D8 19 00 30 50 32 13 05 00 0C 01 30 81 6C 0F 01 00 51 32 13 16 16 01 78 51 32 13 16 
    //04 B0 E1 D8 19 00 30 50 32 13 05 00 0C 01 30 81 6C 0F 01 00 51 32 13 16 16 01 78 51 32 13 16 04 
    //0B 47 
  }


  event string cl_GetToolTip() {
    if (IsEnabled) {                                                            //0000 : 07 3C 00 2D 01 30 F4 1E 11 
      if (Description.Text != "") {                                             //0009 : 07 28 00 7B 36 58 C6 6B 0F 01 10 54 32 13 1F 00 16 
        return Description.Text;                                                //001A : 04 36 58 C6 6B 0F 01 10 54 32 13 
      } else {                                                                  //0025 : 06 3C 00 
        return Class'StringReferences'.default.Interactive_Object.Text;         //0028 : 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 D0 46 1C 11 
      }
    }
    //07 3C 00 2D 01 30 F4 1E 11 07 28 00 7B 36 58 C6 6B 0F 01 10 54 32 13 1F 00 16 04 36 58 C6 6B 0F 
    //01 10 54 32 13 06 3C 00 04 36 58 C6 6B 0F 12 20 20 F7 60 01 05 00 0C 02 D0 46 1C 11 04 0B 47 
  }


  function bool sv_OnRadialMenuOption(Game_Pawn anInstigator,int anOption) {
    local int i;
    if (!IsEnabled || IsActivated) {                                            //0000 : 07 18 00 84 81 2D 01 30 F4 1E 11 16 18 07 00 2D 01 E8 4D 32 13 16 
      return False;                                                             //0016 : 04 28 
    }
    if (InRange(anInstigator)) {                                                //0018 : 07 D8 00 1B 97 05 00 00 00 38 55 32 13 16 
      mCurrentOptionIndex = -1;                                                 //0026 : 0F 01 E8 41 30 0F 1D FF FF FF FF 
      i = 0;                                                                    //0031 : 0F 00 08 57 32 13 25 
      while (i < Actions.Length) {                                              //0038 : 07 95 00 96 00 08 57 32 13 37 01 C8 43 30 0F 16 
        if (Actions[i].MenuOption == anOption
          && sv_IsEligible(anInstigator,i)) {//0048 : 07 8B 00 82 9A 39 3A 36 40 47 32 13 10 00 08 57 32 13 01 C8 43 30 0F 39 3A 39 3D 00 80 57 32 13 16 18 11 00 1C F8 57 32 13 00 38 55 32 13 00 08 57 32 13 16 16 
          mCurrentOptionIndex = i;                                              //007D : 0F 01 E8 41 30 0F 00 08 57 32 13 
          goto jl0095;                                                          //0088 : 06 95 00 
        }
        ++i;                                                                    //008B : A3 00 08 57 32 13 16 
      }
      if (IsCurrentActionValid()) {                                             //0095 : 07 D8 00 1B E8 0D 00 00 16 
        if (!sv_IsEligible(anInstigator,mCurrentOptionIndex)) {                 //009E : 07 B5 00 81 1C F8 57 32 13 00 38 55 32 13 01 E8 41 30 0F 16 16 
          return False;                                                         //00B3 : 04 28 
        }
        mTargetPawn = anInstigator;                                             //00B5 : 0F 01 58 96 2A 11 00 38 55 32 13 
        mCurrentOption = anOption;                                              //00C0 : 0F 01 A8 58 32 13 39 3D 00 80 57 32 13 
        sv_StartOptionActions();                                                //00CD : 1B 78 0F 00 00 16 
        return True;                                                            //00D3 : 04 27 
        goto jl00D8;                                                            //00D5 : 06 D8 00 
      }
    }
    return False;                                                               //00D8 : 04 28 
    //07 18 00 84 81 2D 01 30 F4 1E 11 16 18 07 00 2D 01 E8 4D 32 13 16 04 28 07 D8 00 1B 97 05 00 00 
    //00 38 55 32 13 16 0F 01 E8 41 30 0F 1D FF FF FF FF 0F 00 08 57 32 13 25 07 95 00 96 00 08 57 32 
    //13 37 01 C8 43 30 0F 16 07 8B 00 82 9A 39 3A 36 40 47 32 13 10 00 08 57 32 13 01 C8 43 30 0F 39 
    //3A 39 3D 00 80 57 32 13 16 18 11 00 1C F8 57 32 13 00 38 55 32 13 00 08 57 32 13 16 16 0F 01 E8 
    //41 30 0F 00 08 57 32 13 06 95 00 A3 00 08 57 32 13 16 06 38 00 07 D8 00 1B E8 0D 00 00 16 07 B5 
    //00 81 1C F8 57 32 13 00 38 55 32 13 01 E8 41 30 0F 16 16 04 28 0F 01 58 96 2A 11 00 38 55 32 13 
    //0F 01 A8 58 32 13 39 3D 00 80 57 32 13 1B 78 0F 00 00 16 04 27 06 D8 00 04 28 04 0B 47 
  }


  protected native function cl2sv_OnRadialMenuOption_CallStub();


  event cl2sv_OnRadialMenuOption(Game_Pawn anInstigator,int anOption) {
    sv_OnRadialMenuOption(anInstigator,anOption);                               //0000 : 1B D1 0C 00 00 00 F8 5A 32 13 00 B8 5B 32 13 16 
    //1B D1 0C 00 00 00 F8 5A 32 13 00 B8 5B 32 13 16 04 0B 47 
  }


  event RadialMenuSelect(Pawn aPlayerPawn,byte aMainOption,byte aSubOption) {
    Super.RadialMenuSelect(aPlayerPawn,aMainOption,aSubOption);                 //0000 : 1C 38 52 6C 0F 00 E0 5C 32 13 00 08 5E 32 13 00 80 5E 32 13 16 
    if (IsEnabled) {                                                            //0015 : 07 5E 00 2D 01 30 F4 1E 11 
      if (aMainOption == Class'Game_RadialMenuOptions'.0) {                     //001E : 07 5E 00 9A 39 3A 00 08 5E 32 13 39 3A 12 20 B0 D7 60 01 02 00 01 24 00 16 
        mTargetPawn = Game_Pawn(aPlayerPawn);                                   //0037 : 0F 01 58 96 2A 11 2E 18 38 5B 01 00 E0 5C 32 13 
        cl2sv_OnRadialMenuOption_CallStub(Game_Pawn(aPlayerPawn),aSubOption);   //0047 : 1B E5 0D 00 00 2E 18 38 5B 01 00 E0 5C 32 13 39 3A 00 80 5E 32 13 16 
      }
    }
    //1C 38 52 6C 0F 00 E0 5C 32 13 00 08 5E 32 13 00 80 5E 32 13 16 07 5E 00 2D 01 30 F4 1E 11 07 5E 
    //00 9A 39 3A 00 08 5E 32 13 39 3A 12 20 B0 D7 60 01 02 00 01 24 00 16 0F 01 58 96 2A 11 2E 18 38 
    //5B 01 00 E0 5C 32 13 1B E5 0D 00 00 2E 18 38 5B 01 00 E0 5C 32 13 39 3A 00 80 5E 32 13 16 04 0B 
    //47 
  }


  event RadialMenuCollect(Pawn aPlayerPawn,byte aMainOption,out array<byte> aSubOptions) {
    local Game_Pawn gamePawn;
    local int i;
    Super.RadialMenuCollect(aPlayerPawn,aMainOption,aSubOptions);               //0000 : 1C C0 24 6C 0F 00 A8 5F 32 13 00 58 61 32 13 00 D0 61 32 13 16 
    if (aMainOption == Class'Game_RadialMenuOptions'.0) {                       //0015 : 07 C2 00 9A 39 3A 00 58 61 32 13 39 3A 12 20 B0 D7 60 01 02 00 01 24 00 16 
      gamePawn = Game_Pawn(aPlayerPawn);                                        //002E : 0F 00 48 62 32 13 2E 18 38 5B 01 00 A8 5F 32 13 
      if (IsEnabled && gamePawn != None && !IsActivated) {                      //003E : 07 BA 00 82 82 2D 01 30 F4 1E 11 18 09 00 77 00 48 62 32 13 2A 16 16 18 09 00 81 2D 01 E8 4D 32 13 16 16 
        i = 0;                                                                  //0061 : 0F 00 C0 62 32 13 25 
        while (i < Actions.Length) {                                            //0068 : 07 B7 00 96 00 C0 62 32 13 37 01 C8 43 30 0F 16 
          if (cl_IsEligible(Game_Pawn(aPlayerPawn),i)) {                        //0078 : 07 AD 00 1C 38 63 32 13 2E 18 38 5B 01 00 A8 5F 32 13 00 C0 62 32 13 16 
            aSubOptions[aSubOptions.Length] = Actions[i].MenuOption;            //0090 : 0F 10 37 00 D0 61 32 13 00 D0 61 32 13 36 40 47 32 13 10 00 C0 62 32 13 01 C8 43 30 0F 
          }
          ++i;                                                                  //00AD : A3 00 C0 62 32 13 16 
        }
      } else {                                                                  //00B7 : 06 C2 00 
        aSubOptions.Length = 0;                                                 //00BA : 0F 37 00 D0 61 32 13 25 
      }
    }
    //1C C0 24 6C 0F 00 A8 5F 32 13 00 58 61 32 13 00 D0 61 32 13 16 07 C2 00 9A 39 3A 00 58 61 32 13 
    //39 3A 12 20 B0 D7 60 01 02 00 01 24 00 16 0F 00 48 62 32 13 2E 18 38 5B 01 00 A8 5F 32 13 07 BA 
    //00 82 82 2D 01 30 F4 1E 11 18 09 00 77 00 48 62 32 13 2A 16 16 18 09 00 81 2D 01 E8 4D 32 13 16 
    //16 0F 00 C0 62 32 13 25 07 B7 00 96 00 C0 62 32 13 37 01 C8 43 30 0F 16 07 AD 00 1C 38 63 32 13 
    //2E 18 38 5B 01 00 A8 5F 32 13 00 C0 62 32 13 16 0F 10 37 00 D0 61 32 13 00 D0 61 32 13 36 40 47 
    //32 13 10 00 C0 62 32 13 01 C8 43 30 0F A3 00 C0 62 32 13 16 06 68 00 06 C2 00 0F 37 00 D0 61 32 
    //13 25 04 0B 47 
  }


  function Material RadialMenuImage(Pawn aPlayerPawn,byte aMainOption,byte aSubOption) {
    return None;                                                                //0000 : 04 2A 
    //04 2A 04 0B 47 
  }


  protected final native function bool cl_IsEligible(Game_Pawn aPlayer,int aAction);


  final native function bool sv_IsEligible(Game_Pawn aPlayer,int aOption);


  event cl_NotifyUnderCursor(bool aSetting) {
    Super.cl_NotifyUnderCursor(aSetting);                                       //0000 : 1C F8 4C 6C 0F 2D 00 10 6B 32 13 16 
    if (IsEnabled && mIsUnderCursor != aSetting) {                              //000C : 07 75 00 82 2D 01 30 F4 1E 11 18 0F 00 F3 2D 01 58 6C 32 13 2D 00 10 6B 32 13 16 16 
      mIsUnderCursor = aSetting;                                                //0028 : 14 2D 01 58 6C 32 13 2D 00 10 6B 32 13 
      if (aSetting) {                                                           //0035 : 07 5B 00 2D 00 10 6B 32 13 
        Effects.cl_SetInteractionEffect(Class'Game_Effects'.1);                 //003E : 19 01 B8 F3 1E 11 11 00 00 1B 5B 0C 00 00 12 20 10 43 5F 01 02 00 01 24 01 16 
      } else {                                                                  //0058 : 06 75 00 
        Effects.cl_SetInteractionEffect(Class'Game_Effects'.0);                 //005B : 19 01 B8 F3 1E 11 11 00 00 1B 5B 0C 00 00 12 20 10 43 5F 01 02 00 01 24 00 16 
      }
    }
    //1C F8 4C 6C 0F 2D 00 10 6B 32 13 16 07 75 00 82 2D 01 30 F4 1E 11 18 0F 00 F3 2D 01 58 6C 32 13 
    //2D 00 10 6B 32 13 16 16 14 2D 01 58 6C 32 13 2D 00 10 6B 32 13 07 5B 00 2D 00 10 6B 32 13 19 01 
    //B8 F3 1E 11 11 00 00 1B 5B 0C 00 00 12 20 10 43 5F 01 02 00 01 24 01 16 06 75 00 19 01 B8 F3 1E 
    //11 11 00 00 1B 5B 0C 00 00 12 20 10 43 5F 01 02 00 01 24 00 16 04 0B 47 
  }


  function cl_SetActivated(bool Activated) {
    local int i;
    local int H;
    IsActivated = Activated;                                                    //0000 : 14 2D 01 E8 4D 32 13 2D 00 80 6D 32 13 
    i = 0;                                                                      //000D : 0F 00 68 70 32 13 25 
    while (i < ActivationEffects.Length) {                                      //0014 : 07 59 00 96 00 68 70 32 13 37 01 E0 70 32 13 16 
      if (ActivationEffects[i] != 0) {                                          //0024 : 07 4F 00 9B 10 00 68 70 32 13 01 E0 70 32 13 25 16 
        Effects.cl_Stop(ActivationEffects[i]);                                  //0035 : 19 01 B8 F3 1E 11 11 00 04 1C D8 65 34 0F 10 00 68 70 32 13 01 E0 70 32 13 16 
      }
      i++;                                                                      //004F : A5 00 68 70 32 13 16 
    }
    ActivationEffects.Length = 0;                                               //0059 : 0F 37 01 E0 70 32 13 25 
    if (IsActivated) {                                                          //0061 : 07 08 01 2D 01 E8 4D 32 13 
      i = 0;                                                                    //006A : 0F 00 68 70 32 13 25 
      while (i < ActivatedEffects.Length) {                                     //0071 : 07 05 01 96 00 68 70 32 13 37 01 58 71 32 13 16 
        if (ActivatedEffects[i] != None) {                                      //0081 : 07 FB 00 77 10 00 68 70 32 13 01 58 71 32 13 2A 16 
          H = Effects.cl_Start(ActivatedEffects[i],Class'Game_Effects'.-1073741824,Class'Game_Effects'.-1073741824.00000000,Class'Game_Effects'.-1073741824.00000000,Class'FSkill_EffectClass_AudioVisual'.-1.00000000);//0092 : 0F 00 D0 71 32 13 19 01 B8 F3 1E 11 49 00 04 1C 28 65 34 0F 10 00 68 70 32 13 01 58 71 32 13 12 20 10 43 5F 01 05 00 04 1D 00 00 00 C0 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 80 8F 5D 01 05 00 04 1E 00 00 80 BF 16 
          ActivationEffects[i] = H;                                             //00EA : 0F 10 00 68 70 32 13 01 E0 70 32 13 00 D0 71 32 13 
        }
        i++;                                                                    //00FB : A5 00 68 70 32 13 16 
      }
    } else {                                                                    //0105 : 06 A3 01 
      i = 0;                                                                    //0108 : 0F 00 68 70 32 13 25 
      while (i < DeactivatedEffects.Length) {                                   //010F : 07 A3 01 96 00 68 70 32 13 37 01 48 72 32 13 16 
        if (DeactivatedEffects[i] != None) {                                    //011F : 07 99 01 77 10 00 68 70 32 13 01 48 72 32 13 2A 16 
          H = Effects.cl_Start(DeactivatedEffects[i],Class'Game_Effects'.-1073741824,Class'Game_Effects'.-1073741824.00000000,Class'Game_Effects'.-1073741824.00000000,Class'FSkill_EffectClass_AudioVisual'.-1.00000000);//0130 : 0F 00 D0 71 32 13 19 01 B8 F3 1E 11 49 00 04 1C 28 65 34 0F 10 00 68 70 32 13 01 48 72 32 13 12 20 10 43 5F 01 05 00 04 1D 00 00 00 C0 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 80 8F 5D 01 05 00 04 1E 00 00 80 BF 16 
          ActivationEffects[i] = H;                                             //0188 : 0F 10 00 68 70 32 13 01 E0 70 32 13 00 D0 71 32 13 
        }
        i++;                                                                    //0199 : A5 00 68 70 32 13 16 
      }
    }
    //14 2D 01 E8 4D 32 13 2D 00 80 6D 32 13 0F 00 68 70 32 13 25 07 59 00 96 00 68 70 32 13 37 01 E0 
    //70 32 13 16 07 4F 00 9B 10 00 68 70 32 13 01 E0 70 32 13 25 16 19 01 B8 F3 1E 11 11 00 04 1C D8 
    //65 34 0F 10 00 68 70 32 13 01 E0 70 32 13 16 A5 00 68 70 32 13 16 06 14 00 0F 37 01 E0 70 32 13 
    //25 07 08 01 2D 01 E8 4D 32 13 0F 00 68 70 32 13 25 07 05 01 96 00 68 70 32 13 37 01 58 71 32 13 
    //16 07 FB 00 77 10 00 68 70 32 13 01 58 71 32 13 2A 16 0F 00 D0 71 32 13 19 01 B8 F3 1E 11 49 00 
    //04 1C 28 65 34 0F 10 00 68 70 32 13 01 58 71 32 13 12 20 10 43 5F 01 05 00 04 1D 00 00 00 C0 12 
    //20 10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 80 8F 5D 
    //01 05 00 04 1E 00 00 80 BF 16 0F 10 00 68 70 32 13 01 E0 70 32 13 00 D0 71 32 13 A5 00 68 70 32 
    //13 16 06 71 00 06 A3 01 0F 00 68 70 32 13 25 07 A3 01 96 00 68 70 32 13 37 01 48 72 32 13 16 07 
    //99 01 77 10 00 68 70 32 13 01 48 72 32 13 2A 16 0F 00 D0 71 32 13 19 01 B8 F3 1E 11 49 00 04 1C 
    //28 65 34 0F 10 00 68 70 32 13 01 48 72 32 13 12 20 10 43 5F 01 05 00 04 1D 00 00 00 C0 12 20 10 
    //43 5F 01 05 00 04 1E 00 00 80 CE 12 20 10 43 5F 01 05 00 04 1E 00 00 80 CE 12 20 80 8F 5D 01 05 
    //00 04 1E 00 00 80 BF 16 0F 10 00 68 70 32 13 01 E0 70 32 13 00 D0 71 32 13 A5 00 68 70 32 13 16 
    //06 0F 01 04 0B 47 
  }


  protected native function sv2clrel_UpdateNetIsActivated_CallStub();


  event sv2clrel_UpdateNetIsActivated(bool aNetIsActivated) {
    mNetIsActivated = aNetIsActivated;                                          //0000 : 14 2D 01 00 75 32 13 2D 00 20 74 32 13 
    if (mNetIsActivated != IsActivated) {                                       //000D : 07 2A 00 F3 2D 01 00 75 32 13 2D 01 E8 4D 32 13 16 
      cl_SetActivated(mNetIsActivated);                                         //001E : 1B E4 0D 00 00 2D 01 00 75 32 13 16 
    }
    //14 2D 01 00 75 32 13 2D 00 20 74 32 13 07 2A 00 F3 2D 01 00 75 32 13 2D 01 E8 4D 32 13 16 1B E4 
    //0D 00 00 2D 01 00 75 32 13 16 04 0B 47 
  }


  function sv_SetActivated(bool Active) {
    mNetIsActivated = Active;                                                   //0000 : 14 2D 01 00 75 32 13 2D 00 28 76 32 13 
    IsActivated = Active;                                                       //000D : 14 2D 01 E8 4D 32 13 2D 00 28 76 32 13 
    sv2clrel_UpdateNetIsActivated_CallStub(mNetIsActivated);                    //001A : 1B E3 0D 00 00 2D 01 00 75 32 13 16 
    //14 2D 01 00 75 32 13 2D 00 28 76 32 13 14 2D 01 E8 4D 32 13 2D 00 28 76 32 13 1B E3 0D 00 00 2D 
    //01 00 75 32 13 16 04 0B 47 
  }


  native function Initialize();


  function PostBeginPlay() {
    Super.PostBeginPlay();                                                      //0000 : 1C C0 8A 2A 11 16 
    Initialize();                                                               //0006 : 1B 38 04 00 00 16 
    //1C C0 8A 2A 11 16 1B 38 04 00 00 16 04 0B 47 
  }



