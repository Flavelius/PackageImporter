//==============================================================================
//  InteractionMaster
//==============================================================================

class InteractionMaster extends Interactions
    native
    dependsOn(Interaction,Player)
    Transient
  ;

  var transient Client Client;
  var const transient Interaction BaseMenu;
  var const transient Interaction Console;
  var transient array<Interaction> GlobalInteractions;
  var transient int ScreenshotMode;
  var transient bool bRequireRawJoystick;


  event NotifyLevelChange(array<Interaction> InteractionArray) {
    local int Index;
    Index = 0;                                                                  //0000 : 0F 00 B8 FA 7A 0F 25 
    while (Index < InteractionArray.Length) {                                   //0007 : 07 36 00 96 00 B8 FA 7A 0F 37 00 C8 F9 7A 0F 16 
      InteractionArray[Index].NotifyLevelChange();                              //0017 : 19 10 00 B8 FA 7A 0F 00 C8 F9 7A 0F 06 00 00 1B 41 03 00 00 16 
      Index++;                                                                  //002C : A5 00 B8 FA 7A 0F 16 
    }
    //0F 00 B8 FA 7A 0F 25 07 36 00 96 00 B8 FA 7A 0F 37 00 C8 F9 7A 0F 16 19 10 00 B8 FA 7A 0F 00 C8 
    //F9 7A 0F 06 00 00 1B 41 03 00 00 16 A5 00 B8 FA 7A 0F 16 06 07 00 04 0B 47 
  }


  event ProcessMessage(coerce string Msg,float MsgLife,array<Interaction> InteractionArray) {
    local int Index;
    Index = 0;                                                                  //0000 : 0F 00 A8 05 7B 0F 25 
    while (Index < InteractionArray.Length) {                                   //0007 : 07 40 00 96 00 A8 05 7B 0F 37 00 20 06 7B 0F 16 
      InteractionArray[Index].Message(Msg,MsgLife);                             //0017 : 19 10 00 A8 05 7B 0F 00 20 06 7B 0F 10 00 00 1B 37 03 00 00 00 58 FC 7A 0F 00 98 06 7B 0F 16 
      Index++;                                                                  //0036 : A5 00 A8 05 7B 0F 16 
    }
    //0F 00 A8 05 7B 0F 25 07 40 00 96 00 A8 05 7B 0F 37 00 20 06 7B 0F 16 19 10 00 A8 05 7B 0F 00 20 
    //06 7B 0F 10 00 00 1B 37 03 00 00 00 58 FC 7A 0F 00 98 06 7B 0F 16 A5 00 A8 05 7B 0F 16 06 07 00 
    //04 0B 47 
  }


  event ProcessTick(array<Interaction> InteractionArray,float DeltaTime) {
    local int Index;
    Index = 0;                                                                  //0000 : 0F 00 B0 08 7B 0F 25 
    while (Index < InteractionArray.Length) {                                   //0007 : 07 6F 00 96 00 B0 08 7B 0F 37 00 38 08 7B 0F 16 
      if (InteractionArray[Index].bRequiresTick
        && !InteractionArray[Index].bNativeEvents) {//0017 : 07 65 00 82 19 10 00 B0 08 7B 0F 00 38 08 7B 0F 06 00 04 2D 01 50 CB 71 0F 18 18 00 81 19 10 00 B0 08 7B 0F 00 38 08 7B 0F 06 00 04 2D 01 20 CC 71 0F 16 16 
        InteractionArray[Index].Tick(DeltaTime);                                //004B : 19 10 00 B0 08 7B 0F 00 38 08 7B 0F 0B 00 00 1B 50 01 00 00 00 28 09 7B 0F 16 
      }
      Index++;                                                                  //0065 : A5 00 B0 08 7B 0F 16 
    }
    //0F 00 B0 08 7B 0F 25 07 6F 00 96 00 B0 08 7B 0F 37 00 38 08 7B 0F 16 07 65 00 82 19 10 00 B0 08 
    //7B 0F 00 38 08 7B 0F 06 00 04 2D 01 50 CB 71 0F 18 18 00 81 19 10 00 B0 08 7B 0F 00 38 08 7B 0F 
    //06 00 04 2D 01 20 CC 71 0F 16 16 19 10 00 B0 08 7B 0F 00 38 08 7B 0F 0B 00 00 1B 50 01 00 00 00 
    //28 09 7B 0F 16 A5 00 B0 08 7B 0F 16 06 07 00 04 0B 47 
  }


  event ProcessPostRender(array<Interaction> InteractionArray,Canvas Canvas) {
    local int Index;
    Index = InteractionArray.Length;                                            //0000 : 0F 00 18 0C 7B 0F 37 00 C8 0A 7B 0F 
    while (Index > 0) {                                                         //000C : 07 78 00 97 00 18 0C 7B 0F 25 16 
      if (InteractionArray[Index - 1].bVisible
        && !InteractionArray[Index - 1].bNativeEvents) {//0017 : 07 6E 00 82 19 10 93 00 18 0C 7B 0F 26 16 00 C8 0A 7B 0F 06 00 04 2D 01 D8 CA 71 0F 18 1B 00 81 19 10 93 00 18 0C 7B 0F 26 16 00 C8 0A 7B 0F 06 00 04 2D 01 20 CC 71 0F 16 16 
        InteractionArray[Index - 1].PostRender(Canvas);                         //0051 : 19 10 93 00 18 0C 7B 0F 26 16 00 C8 0A 7B 0F 0B 00 00 1B 63 2B 00 00 00 90 0C 7B 0F 16 
      }
      Index--;                                                                  //006E : A6 00 18 0C 7B 0F 16 
    }
    //0F 00 18 0C 7B 0F 37 00 C8 0A 7B 0F 07 78 00 97 00 18 0C 7B 0F 25 16 07 6E 00 82 19 10 93 00 18 
    //0C 7B 0F 26 16 00 C8 0A 7B 0F 06 00 04 2D 01 D8 CA 71 0F 18 1B 00 81 19 10 93 00 18 0C 7B 0F 26 
    //16 00 C8 0A 7B 0F 06 00 04 2D 01 20 CC 71 0F 16 16 19 10 93 00 18 0C 7B 0F 26 16 00 C8 0A 7B 0F 
    //0B 00 00 1B 63 2B 00 00 00 90 0C 7B 0F 16 A6 00 18 0C 7B 0F 16 06 0C 00 04 0B 47 
  }


  event ProcessPreRender(array<Interaction> InteractionArray,Canvas Canvas) {
    local int Index;
    Index = InteractionArray.Length;                                            //0000 : 0F 00 80 0F 7B 0F 37 00 30 0E 7B 0F 
    while (Index > 0) {                                                         //000C : 07 78 00 97 00 80 0F 7B 0F 25 16 
      if (InteractionArray[Index - 1].bVisible
        && !InteractionArray[Index - 1].bNativeEvents) {//0017 : 07 6E 00 82 19 10 93 00 80 0F 7B 0F 26 16 00 30 0E 7B 0F 06 00 04 2D 01 D8 CA 71 0F 18 1B 00 81 19 10 93 00 80 0F 7B 0F 26 16 00 30 0E 7B 0F 06 00 04 2D 01 20 CC 71 0F 16 16 
        InteractionArray[Index - 1].PreRender(Canvas);                          //0051 : 19 10 93 00 80 0F 7B 0F 26 16 00 30 0E 7B 0F 0B 00 00 1B 26 2C 00 00 00 F8 0F 7B 0F 16 
      }
      Index--;                                                                  //006E : A6 00 80 0F 7B 0F 16 
    }
    //0F 00 80 0F 7B 0F 37 00 30 0E 7B 0F 07 78 00 97 00 80 0F 7B 0F 25 16 07 6E 00 82 19 10 93 00 80 
    //0F 7B 0F 26 16 00 30 0E 7B 0F 06 00 04 2D 01 D8 CA 71 0F 18 1B 00 81 19 10 93 00 80 0F 7B 0F 26 
    //16 00 30 0E 7B 0F 06 00 04 2D 01 20 CC 71 0F 16 16 19 10 93 00 80 0F 7B 0F 26 16 00 30 0E 7B 0F 
    //0B 00 00 1B 26 2C 00 00 00 F8 0F 7B 0F 16 A6 00 80 0F 7B 0F 16 06 0C 00 04 0B 47 
  }


  event bool ProcessKeyEvent(array<Interaction> InteractionArray,out byte Key,out byte Action,float delta) {
    local int Index;
    Index = 0;                                                                  //0000 : 0F 00 F0 12 7B 0F 25 
    while (Index < InteractionArray.Length) {                                   //0007 : 07 80 00 96 00 F0 12 7B 0F 37 00 98 11 7B 0F 16 
      if (InteractionArray[Index].bActive
        && !InteractionArray[Index].bNativeEvents
        && InteractionArray[Index].KeyEvent(Key,Action,delta)) {//0017 : 07 76 00 82 82 19 10 00 F0 12 7B 0F 00 98 11 7B 0F 06 00 04 2D 01 90 28 71 0F 18 18 00 81 19 10 00 F0 12 7B 0F 00 98 11 7B 0F 06 00 04 2D 01 20 CC 71 0F 16 16 18 25 00 19 10 00 F0 12 7B 0F 00 98 11 7B 0F 15 00 04 1B 35 03 00 00 00 68 13 7B 0F 00 E0 13 7B 0F 00 58 14 7B 0F 16 16 
        return True;                                                            //0074 : 04 27 
      }
      Index++;                                                                  //0076 : A5 00 F0 12 7B 0F 16 
    }
    return False;                                                               //0080 : 04 28 
    //0F 00 F0 12 7B 0F 25 07 80 00 96 00 F0 12 7B 0F 37 00 98 11 7B 0F 16 07 76 00 82 82 19 10 00 F0 
    //12 7B 0F 00 98 11 7B 0F 06 00 04 2D 01 90 28 71 0F 18 18 00 81 19 10 00 F0 12 7B 0F 00 98 11 7B 
    //0F 06 00 04 2D 01 20 CC 71 0F 16 16 18 25 00 19 10 00 F0 12 7B 0F 00 98 11 7B 0F 15 00 04 1B 35 
    //03 00 00 00 68 13 7B 0F 00 E0 13 7B 0F 00 58 14 7B 0F 16 16 04 27 A5 00 F0 12 7B 0F 16 06 07 00 
    //04 28 04 0B 47 
  }


  event bool ProcessKeyType(array<Interaction> InteractionArray,out byte Key,optional string Unicode) {
    local int Index;
    Index = 0;                                                                  //0000 : 0F 00 C0 17 7B 0F 25 
    while (Index < InteractionArray.Length) {                                   //0007 : 07 7B 00 96 00 C0 17 7B 0F 37 00 70 16 7B 0F 16 
      if (InteractionArray[Index].bActive
        && !InteractionArray[Index].bNativeEvents
        && InteractionArray[Index].KeyType(Key,Unicode)) {//0017 : 07 71 00 82 82 19 10 00 C0 17 7B 0F 00 70 16 7B 0F 06 00 04 2D 01 90 28 71 0F 18 18 00 81 19 10 00 C0 17 7B 0F 00 70 16 7B 0F 06 00 04 2D 01 20 CC 71 0F 16 16 18 20 00 19 10 00 C0 17 7B 0F 00 70 16 7B 0F 10 00 04 1B 34 03 00 00 00 38 18 7B 0F 00 B0 18 7B 0F 16 16 
        return True;                                                            //006F : 04 27 
      }
      Index++;                                                                  //0071 : A5 00 C0 17 7B 0F 16 
    }
    return False;                                                               //007B : 04 28 
    //0F 00 C0 17 7B 0F 25 07 7B 00 96 00 C0 17 7B 0F 37 00 70 16 7B 0F 16 07 71 00 82 82 19 10 00 C0 
    //17 7B 0F 00 70 16 7B 0F 06 00 04 2D 01 90 28 71 0F 18 18 00 81 19 10 00 C0 17 7B 0F 00 70 16 7B 
    //0F 06 00 04 2D 01 20 CC 71 0F 16 16 18 20 00 19 10 00 C0 17 7B 0F 00 70 16 7B 0F 10 00 04 1B 34 
    //03 00 00 00 38 18 7B 0F 00 B0 18 7B 0F 16 16 04 27 A5 00 C0 17 7B 0F 16 06 07 00 04 28 04 0B 47 
    //
  }


  event SetFocusTo(Interaction Inter,optional Player ViewportOwner) {
    local array<Interaction> InteractionArray;
    local Interaction Temp;
    local int i;
    local int iIndex;
    if (ViewportOwner != None) {                                                //0000 : 07 22 00 77 00 90 1D 7B 0F 2A 16 
      InteractionArray = ViewportOwner.LocalInteractions;                       //000B : 0F 00 08 1E 7B 0F 19 00 90 1D 7B 0F 05 00 00 01 08 F9 71 0F 
    } else {                                                                    //001F : 06 2D 00 
      InteractionArray = GlobalInteractions;                                    //0022 : 0F 00 08 1E 7B 0F 01 80 1E 7B 0F 
    }
    if (InteractionArray.Length == 0) {                                         //002D : 07 6A 00 9A 37 00 08 1E 7B 0F 25 16 
      Log("Attempt to SetFocus on an empty Array.",'IMaster');                  //0039 : E7 1F 41 74 74 65 6D 70 74 20 74 6F 20 53 65 74 46 6F 63 75 73 20 6F 6E 20 61 6E 20 65 6D 70 74 79 20 41 72 72 61 79 2E 00 21 E0 2A 00 00 16 
      return;                                                                   //0068 : 04 0B 
    }
    iIndex = -1;                                                                //006A : 0F 00 F8 1E 7B 0F 1D FF FF FF FF 
    i = 0;                                                                      //0075 : 0F 00 70 1F 7B 0F 25 
    while (i < InteractionArray.Length) {                                       //007C : 07 B9 00 96 00 70 1F 7B 0F 37 00 08 1E 7B 0F 16 
      if (InteractionArray[i] == Inter) {                                       //008C : 07 AF 00 72 10 00 70 1F 7B 0F 00 08 1E 7B 0F 00 C8 1A 7B 0F 16 
        iIndex = i;                                                             //00A1 : 0F 00 F8 1E 7B 0F 00 70 1F 7B 0F 
        goto jl00B9;                                                            //00AC : 06 B9 00 
      }
      i++;                                                                      //00AF : A5 00 70 1F 7B 0F 16 
    }
    if (iIndex < 0) {                                                           //00B9 : 07 04 01 96 00 F8 1E 7B 0F 25 16 
      Log("Interaction " $ string(Inter) $ " is not in "
        $ string(ViewportOwner)
        $ ".",'IMaster');//00C4 : E7 70 70 70 70 1F 49 6E 74 65 72 61 63 74 69 6F 6E 20 00 39 56 00 C8 1A 7B 0F 16 1F 20 69 73 20 6E 6F 74 20 69 6E 20 00 16 39 56 00 90 1D 7B 0F 16 1F 2E 00 16 21 E0 2A 00 00 16 
      return;                                                                   //00FF : 04 0B 
    } else {                                                                    //0101 : 06 11 01 
      if (iIndex == 0) {                                                        //0104 : 07 11 01 9A 00 F8 1E 7B 0F 25 16 
        return;                                                                 //010F : 04 0B 
      }
    }
    Temp = InteractionArray[iIndex];                                            //0111 : 0F 00 E8 1F 7B 0F 10 00 F8 1E 7B 0F 00 08 1E 7B 0F 
    i = 0;                                                                      //0122 : 0F 00 70 1F 7B 0F 25 
    while (i < iIndex) {                                                        //0129 : 07 5C 01 96 00 70 1F 7B 0F 00 F8 1E 7B 0F 16 
      InteractionArray[i + 1] = InteractionArray[i];                            //0138 : 0F 10 92 00 70 1F 7B 0F 26 16 00 08 1E 7B 0F 10 00 70 1F 7B 0F 00 08 1E 7B 0F 
      i++;                                                                      //0152 : A5 00 70 1F 7B 0F 16 
    }
    InteractionArray[0] = Temp;                                                 //015C : 0F 10 25 00 08 1E 7B 0F 00 E8 1F 7B 0F 
    InteractionArray[0].bActive = True;                                         //0169 : 14 19 10 25 00 08 1E 7B 0F 06 00 04 2D 01 90 28 71 0F 27 
    InteractionArray[0].bVisible = True;                                        //017C : 14 19 10 25 00 08 1E 7B 0F 06 00 04 2D 01 D8 CA 71 0F 27 
    //07 22 00 77 00 90 1D 7B 0F 2A 16 0F 00 08 1E 7B 0F 19 00 90 1D 7B 0F 05 00 00 01 08 F9 71 0F 06 
    //2D 00 0F 00 08 1E 7B 0F 01 80 1E 7B 0F 07 6A 00 9A 37 00 08 1E 7B 0F 25 16 E7 1F 41 74 74 65 6D 
    //70 74 20 74 6F 20 53 65 74 46 6F 63 75 73 20 6F 6E 20 61 6E 20 65 6D 70 74 79 20 41 72 72 61 79 
    //2E 00 21 E0 2A 00 00 16 04 0B 0F 00 F8 1E 7B 0F 1D FF FF FF FF 0F 00 70 1F 7B 0F 25 07 B9 00 96 
    //00 70 1F 7B 0F 37 00 08 1E 7B 0F 16 07 AF 00 72 10 00 70 1F 7B 0F 00 08 1E 7B 0F 00 C8 1A 7B 0F 
    //16 0F 00 F8 1E 7B 0F 00 70 1F 7B 0F 06 B9 00 A5 00 70 1F 7B 0F 16 06 7C 00 07 04 01 96 00 F8 1E 
    //7B 0F 25 16 E7 70 70 70 70 1F 49 6E 74 65 72 61 63 74 69 6F 6E 20 00 39 56 00 C8 1A 7B 0F 16 1F 
    //20 69 73 20 6E 6F 74 20 69 6E 20 00 16 39 56 00 90 1D 7B 0F 16 1F 2E 00 16 21 E0 2A 00 00 16 04 
    //0B 06 11 01 07 11 01 9A 00 F8 1E 7B 0F 25 16 04 0B 0F 00 E8 1F 7B 0F 10 00 F8 1E 7B 0F 00 08 1E 
    //7B 0F 0F 00 70 1F 7B 0F 25 07 5C 01 96 00 70 1F 7B 0F 00 F8 1E 7B 0F 16 0F 10 92 00 70 1F 7B 0F 
    //26 16 00 08 1E 7B 0F 10 00 70 1F 7B 0F 00 08 1E 7B 0F A5 00 70 1F 7B 0F 16 06 29 01 0F 10 25 00 
    //08 1E 7B 0F 00 E8 1F 7B 0F 14 19 10 25 00 08 1E 7B 0F 06 00 04 2D 01 90 28 71 0F 27 14 19 10 25 
    //00 08 1E 7B 0F 06 00 04 2D 01 D8 CA 71 0F 27 04 0B 47 
  }


  event RemoveInteraction(Interaction RemoveMe) {
    local int Index;
    if (RemoveMe.ViewportOwner != None) {                                       //0000 : 07 91 00 77 19 00 88 21 7B 0F 05 00 04 01 70 B7 71 0F 2A 16 
      Index = 0;                                                                //0014 : 0F 00 B0 23 7B 0F 25 
      while (Index < RemoveMe.ViewportOwner.LocalInteractions.Length) {         //001B : 07 8E 00 96 00 B0 23 7B 0F 37 19 19 00 88 21 7B 0F 05 00 04 01 70 B7 71 0F 05 00 00 01 08 F9 71 0F 16 
        if (RemoveMe.ViewportOwner.LocalInteractions[Index] == RemoveMe) {      //003D : 07 84 00 72 10 00 B0 23 7B 0F 19 19 00 88 21 7B 0F 05 00 04 01 70 B7 71 0F 05 00 00 01 08 F9 71 0F 00 88 21 7B 0F 16 
          RemoveMe.ViewportOwner.LocalInteractions.Remove(Index,1);             //0064 : 41 19 19 00 88 21 7B 0F 05 00 04 01 70 B7 71 0F 05 00 00 01 08 F9 71 0F 00 B0 23 7B 0F 26 
          return;                                                               //0082 : 04 0B 
        }
        Index++;                                                                //0084 : A5 00 B0 23 7B 0F 16 
      }
    } else {                                                                    //008E : 06 D5 00 
      Index = 0;                                                                //0091 : 0F 00 B0 23 7B 0F 25 
      while (Index < GlobalInteractions.Length) {                               //0098 : 07 D5 00 96 00 B0 23 7B 0F 37 01 80 1E 7B 0F 16 
        if (GlobalInteractions[Index] == RemoveMe) {                            //00A8 : 07 CB 00 72 10 00 B0 23 7B 0F 01 80 1E 7B 0F 00 88 21 7B 0F 16 
          GlobalInteractions.Remove(Index,1);                                   //00BD : 41 01 80 1E 7B 0F 00 B0 23 7B 0F 26 
          return;                                                               //00C9 : 04 0B 
        }
        Index++;                                                                //00CB : A5 00 B0 23 7B 0F 16 
      }
    }
    Log("Could not remove interaction ["
      $ string(RemoveMe)
      $ "] (Not Found)",'IMaster');//00D5 : E7 70 70 1F 43 6F 75 6C 64 20 6E 6F 74 20 72 65 6D 6F 76 65 20 69 6E 74 65 72 61 63 74 69 6F 6E 20 5B 00 39 56 00 88 21 7B 0F 16 1F 5D 20 28 4E 6F 74 20 46 6F 75 6E 64 29 00 16 21 E0 2A 00 00 16 
    //07 91 00 77 19 00 88 21 7B 0F 05 00 04 01 70 B7 71 0F 2A 16 0F 00 B0 23 7B 0F 25 07 8E 00 96 00 
    //B0 23 7B 0F 37 19 19 00 88 21 7B 0F 05 00 04 01 70 B7 71 0F 05 00 00 01 08 F9 71 0F 16 07 84 00 
    //72 10 00 B0 23 7B 0F 19 19 00 88 21 7B 0F 05 00 04 01 70 B7 71 0F 05 00 00 01 08 F9 71 0F 00 88 
    //21 7B 0F 16 41 19 19 00 88 21 7B 0F 05 00 04 01 70 B7 71 0F 05 00 00 01 08 F9 71 0F 00 B0 23 7B 
    //0F 26 04 0B A5 00 B0 23 7B 0F 16 06 1B 00 06 D5 00 0F 00 B0 23 7B 0F 25 07 D5 00 96 00 B0 23 7B 
    //0F 37 01 80 1E 7B 0F 16 07 CB 00 72 10 00 B0 23 7B 0F 01 80 1E 7B 0F 00 88 21 7B 0F 16 41 01 80 
    //1E 7B 0F 00 B0 23 7B 0F 26 04 0B A5 00 B0 23 7B 0F 16 06 98 00 E7 70 70 1F 43 6F 75 6C 64 20 6E 
    //6F 74 20 72 65 6D 6F 76 65 20 69 6E 74 65 72 61 63 74 69 6F 6E 20 5B 00 39 56 00 88 21 7B 0F 16 
    //1F 5D 20 28 4E 6F 74 20 46 6F 75 6E 64 29 00 16 21 E0 2A 00 00 16 04 0B 47 
  }


  event Interaction AddInteraction(string InteractionName,optional Player AttachTo) {
    local Interaction NewInteraction;
    local class<Interaction> NewInteractionClass;
    NewInteractionClass = Class<Interaction>(static.DynamicLoadObject(InteractionName,Class'Class'));//0000 : 0F 00 68 27 7B 0F 13 28 38 C3 00 1C 60 E7 69 0F 00 D8 24 7B 0F 20 D8 DE 1F 10 16 
    if (NewInteractionClass != None) {                                          //001B : 07 2E 01 77 00 68 27 7B 0F 2A 16 
      NewInteraction = new NewInteractionClass;                                 //0026 : 0F 00 E8 27 7B 0F 11 0B 0B 0B 00 68 27 7B 0F 
      if (NewInteraction != None) {                                             //0035 : 07 F8 00 77 00 E8 27 7B 0F 2A 16 
        if (AttachTo != None) {                                                 //0040 : 07 AB 00 77 00 60 28 7B 0F 2A 16 
          AttachTo.LocalInteractions.Length = AttachTo.LocalInteractions.Length + 1;//004B : 0F 37 19 00 60 28 7B 0F 05 00 00 01 08 F9 71 0F 92 37 19 00 60 28 7B 0F 05 00 00 01 08 F9 71 0F 26 16 
          AttachTo.LocalInteractions[AttachTo.LocalInteractions.Length - 1] = NewInteraction;//006D : 0F 10 93 37 19 00 60 28 7B 0F 05 00 00 01 08 F9 71 0F 26 16 19 00 60 28 7B 0F 05 00 00 01 08 F9 71 0F 00 E8 27 7B 0F 
          NewInteraction.ViewportOwner = AttachTo;                              //0094 : 0F 19 00 E8 27 7B 0F 05 00 04 01 70 B7 71 0F 00 60 28 7B 0F 
        } else {                                                                //00A8 : 06 D0 00 
          GlobalInteractions.Length = GlobalInteractions.Length + 1;            //00AB : 0F 37 01 80 1E 7B 0F 92 37 01 80 1E 7B 0F 26 16 
          GlobalInteractions[GlobalInteractions.Length - 1] = NewInteraction;   //00BB : 0F 10 93 37 01 80 1E 7B 0F 26 16 01 80 1E 7B 0F 00 E8 27 7B 0F 
        }
        NewInteraction.Initialize();                                            //00D0 : 19 00 E8 27 7B 0F 06 00 00 1B 38 04 00 00 16 
        NewInteraction.Master = self;                                           //00DF : 0F 19 00 E8 27 7B 0F 05 00 04 01 F8 B6 71 0F 17 
        return NewInteraction;                                                  //00EF : 04 00 E8 27 7B 0F 
      } else {                                                                  //00F5 : 06 2B 01 
        Log("Could not create interaction ["
          $ InteractionName
          $ "]",'IMaster');//00F8 : E7 70 70 1F 43 6F 75 6C 64 20 6E 6F 74 20 63 72 65 61 74 65 20 69 6E 74 65 72 61 63 74 69 6F 6E 20 5B 00 00 D8 24 7B 0F 16 1F 5D 00 16 21 E0 2A 00 00 16 
      }
    } else {                                                                    //012B : 06 5F 01 
      Log("Could not load interaction [" $ InteractionName
        $ "]",'IMaster');//012E : E7 70 70 1F 43 6F 75 6C 64 20 6E 6F 74 20 6C 6F 61 64 20 69 6E 74 65 72 61 63 74 69 6F 6E 20 5B 00 00 D8 24 7B 0F 16 1F 5D 00 16 21 E0 2A 00 00 16 
    }
    return None;                                                                //015F : 04 2A 
    //0F 00 68 27 7B 0F 13 28 38 C3 00 1C 60 E7 69 0F 00 D8 24 7B 0F 20 D8 DE 1F 10 16 07 2E 01 77 00 
    //68 27 7B 0F 2A 16 0F 00 E8 27 7B 0F 11 0B 0B 0B 00 68 27 7B 0F 07 F8 00 77 00 E8 27 7B 0F 2A 16 
    //07 AB 00 77 00 60 28 7B 0F 2A 16 0F 37 19 00 60 28 7B 0F 05 00 00 01 08 F9 71 0F 92 37 19 00 60 
    //28 7B 0F 05 00 00 01 08 F9 71 0F 26 16 0F 10 93 37 19 00 60 28 7B 0F 05 00 00 01 08 F9 71 0F 26 
    //16 19 00 60 28 7B 0F 05 00 00 01 08 F9 71 0F 00 E8 27 7B 0F 0F 19 00 E8 27 7B 0F 05 00 04 01 70 
    //B7 71 0F 00 60 28 7B 0F 06 D0 00 0F 37 01 80 1E 7B 0F 92 37 01 80 1E 7B 0F 26 16 0F 10 93 37 01 
    //80 1E 7B 0F 26 16 01 80 1E 7B 0F 00 E8 27 7B 0F 19 00 E8 27 7B 0F 06 00 00 1B 38 04 00 00 16 0F 
    //19 00 E8 27 7B 0F 05 00 04 01 F8 B6 71 0F 17 04 00 E8 27 7B 0F 06 2B 01 E7 70 70 1F 43 6F 75 6C 
    //64 20 6E 6F 74 20 63 72 65 61 74 65 20 69 6E 74 65 72 61 63 74 69 6F 6E 20 5B 00 00 D8 24 7B 0F 
    //16 1F 5D 00 16 21 E0 2A 00 00 16 06 5F 01 E7 70 70 1F 43 6F 75 6C 64 20 6E 6F 74 20 6C 6F 61 64 
    //20 69 6E 74 65 72 61 63 74 69 6F 6E 20 5B 00 00 D8 24 7B 0F 16 1F 5D 00 16 21 E0 2A 00 00 16 04 
    //2A 04 0B 47 
  }


  native function Travel(string URL);



