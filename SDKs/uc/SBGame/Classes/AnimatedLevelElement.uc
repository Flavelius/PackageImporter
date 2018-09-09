//==============================================================================
//  AnimatedLevelElement
//==============================================================================

class AnimatedLevelElement extends TriggeringLevelElement
    native
    exportstructs
    dependsOn()
  ;

  enum AnimPlayType {
    APT_Normal ,
    APT_Looped ,
    APT_PauseAtEnd 
  };

  struct AnimationParameters {
      var (AnimationParameters) byte MenuOption;
      var (AnimationParameters) name animName;
      var (AnimationParameters) byte PlayType;
      var (AnimationParameters) float speed;

  };


  var (Animations) array<AnimationParameters> Animations;
  var transient name mCurrentAnimName;


  function bool sv_OnRadialMenuOption(Game_Pawn anInstigator,int anOption) {
    if (!Super.sv_OnRadialMenuOption(anInstigator,anOption)) {                  //0000 : 07 17 00 81 1C 98 AE 35 19 00 38 64 35 0F 00 10 65 35 0F 16 16 
      return False;                                                             //0015 : 04 28 
    }
    sv2clrel_PlayOptionAnimation_CallStub(anOption);                            //0017 : 1B F2 0D 00 00 39 3D 00 10 65 35 0F 16 
    return True;                                                                //0024 : 04 27 
    //07 17 00 81 1C 98 AE 35 19 00 38 64 35 0F 00 10 65 35 0F 16 16 04 28 1B F2 0D 00 00 39 3D 00 10 
    //65 35 0F 16 04 27 04 0B 47 
  }


  function StopCurrentAnimation() {
    StopAnimating();                                                            //0000 : 1C B8 DE 6D 0F 16 
    //1C B8 DE 6D 0F 16 04 0B 47 
  }


  function PlayOptionAnimation(byte aMenuOption) {
    local int animParamIndex;
    local int ChannelNumber;
    local float speed;
    animParamIndex = GetOptionAnimParametersIndex(aMenuOption);                 //0000 : 0F 00 70 B7 35 19 1B F1 0D 00 00 00 B0 66 35 0F 16 
    if (animParamIndex >= 0) {                                                  //0011 : 07 E0 00 99 00 70 B7 35 19 25 16 
      ChannelNumber = 0;                                                        //001C : 0F 00 E8 B7 35 19 25 
      StopCurrentAnimation();                                                   //0023 : 1B F4 0D 00 00 16 
      mCurrentAnimName = Animations[animParamIndex].animName;                   //0029 : 0F 01 60 B8 35 19 36 60 B9 35 19 10 00 70 B7 35 19 01 D8 B9 35 19 
      if (mCurrentAnimName != 'None') {                                         //003F : 07 DD 00 FF 01 60 B8 35 19 21 00 00 00 00 16 
        if (ChannelNumber > 0) {                                                //004E : 07 69 00 97 00 E8 B7 35 19 25 16 
          AnimBlendParams(ChannelNumber,1.00000000);                            //0059 : 1C C0 C0 6D 0F 00 E8 B7 35 19 1E 00 00 80 3F 16 
        }
        speed = Animations[animParamIndex].speed;                               //0069 : 0F 00 50 BA 35 19 36 C8 BA 35 19 10 00 70 B7 35 19 01 D8 B9 35 19 
        if (speed < 0.10000000) {                                               //007F : 07 99 00 B0 00 50 BA 35 19 1E CD CC CC 3D 16 
          speed = 1.00000000;                                                   //008E : 0F 00 50 BA 35 19 1E 00 00 80 3F 
        }
        if (Animations[animParamIndex].PlayType == 1) {                         //0099 : 07 CA 00 9A 39 3A 36 40 BB 35 19 10 00 70 B7 35 19 01 D8 B9 35 19 39 3A 24 01 16 
          LoopAnim(mCurrentAnimName,speed,,ChannelNumber);                      //00B4 : 61 04 01 60 B8 35 19 00 50 BA 35 19 0B 00 E8 B7 35 19 16 
        } else {                                                                //00C7 : 06 DD 00 
          PlayAnim(mCurrentAnimName,speed,,ChannelNumber);                      //00CA : 61 03 01 60 B8 35 19 00 50 BA 35 19 0B 00 E8 B7 35 19 16 
        }
      }
      goto jl00E0;                                                              //00DD : 06 E0 00 
    }
    //0F 00 70 B7 35 19 1B F1 0D 00 00 00 B0 66 35 0F 16 07 E0 00 99 00 70 B7 35 19 25 16 0F 00 E8 B7 
    //35 19 25 1B F4 0D 00 00 16 0F 01 60 B8 35 19 36 60 B9 35 19 10 00 70 B7 35 19 01 D8 B9 35 19 07 
    //DD 00 FF 01 60 B8 35 19 21 00 00 00 00 16 07 69 00 97 00 E8 B7 35 19 25 16 1C C0 C0 6D 0F 00 E8 
    //B7 35 19 1E 00 00 80 3F 16 0F 00 50 BA 35 19 36 C8 BA 35 19 10 00 70 B7 35 19 01 D8 B9 35 19 07 
    //99 00 B0 00 50 BA 35 19 1E CD CC CC 3D 16 0F 00 50 BA 35 19 1E 00 00 80 3F 07 CA 00 9A 39 3A 36 
    //40 BB 35 19 10 00 70 B7 35 19 01 D8 B9 35 19 39 3A 24 01 16 61 04 01 60 B8 35 19 00 50 BA 35 19 
    //0B 00 E8 B7 35 19 16 06 DD 00 61 03 01 60 B8 35 19 00 50 BA 35 19 0B 00 E8 B7 35 19 16 06 E0 00 
    //04 0B 47 
  }


  protected native function sv2clrel_PlayOptionAnimation_CallStub();


  event sv2clrel_PlayOptionAnimation(byte aMenuOption) {
    PlayOptionAnimation(aMenuOption);                                           //0000 : 1B F3 0D 00 00 00 18 BD 35 19 16 
    //1B F3 0D 00 00 00 18 BD 35 19 16 04 0B 47 
  }


  function int GetOptionAnimParametersIndex(byte aMenuOption) {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 48 BE 35 19 25 
    while (i < Animations.Length) {                                             //0007 : 07 45 00 96 00 48 BE 35 19 37 01 D8 B9 35 19 16 
      if (Animations[i].MenuOption == aMenuOption) {                            //0017 : 07 3B 00 9A 39 3A 36 C0 BE 35 19 10 00 48 BE 35 19 01 D8 B9 35 19 39 3A 00 D0 BD 35 19 16 
        return i;                                                               //0035 : 04 00 48 BE 35 19 
      }
      ++i;                                                                      //003B : A3 00 48 BE 35 19 16 
    }
    return -1;                                                                  //0045 : 04 1D FF FF FF FF 
    //0F 00 48 BE 35 19 25 07 45 00 96 00 48 BE 35 19 37 01 D8 B9 35 19 16 07 3B 00 9A 39 3A 36 C0 BE 
    //35 19 10 00 48 BE 35 19 01 D8 B9 35 19 39 3A 00 D0 BD 35 19 16 04 00 48 BE 35 19 A3 00 48 BE 35 
    //19 16 06 07 00 04 1D FF FF FF FF 04 0B 47 
  }



