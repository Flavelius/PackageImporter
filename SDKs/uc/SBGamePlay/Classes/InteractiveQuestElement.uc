//==============================================================================
//  InteractiveQuestElement
//==============================================================================

class InteractiveQuestElement extends InteractiveLevelElement
    native
    exportstructs
    dependsOn(Quest_Target,QT_Interactor,QT_Place,QT_Take)
  ;


  event string cl_GetToolTip() {
    local export editinline Quest_Target objective;
    foreach AllObjects(Class'Quest_Target',objective) {                         //0000 : 2F C5 20 30 A3 5C 01 00 28 CC 31 0F 16 F7 00 
      if (objective.IsA('QT_Interactor')) {                                     //000F : 07 5D 00 19 00 28 CC 31 0F 08 00 04 61 2F 21 9E 08 00 00 16 
        if (QT_Interactor(objective).TargetTag == Tag) {                        //0023 : 07 5A 00 FE 19 2E 50 93 8D 01 00 28 CC 31 0F 05 00 04 01 50 3E 33 19 01 C0 9E 6C 0F 16 
          return QT_Interactor(objective).TargetDescription.Text;               //0041 : 04 36 58 C6 6B 0F 19 2E 50 93 8D 01 00 28 CC 31 0F 05 00 0C 01 40 3A 33 19 
        }
      } else {                                                                  //005A : 06 F6 00 
        if (objective.IsA('QT_Place')) {                                        //005D : 07 AB 00 19 00 28 CC 31 0F 08 00 04 61 2F 21 95 08 00 00 16 
          if (QT_Place(objective).TargetTag == Tag) {                           //0071 : 07 A8 00 FE 19 2E 90 C2 8D 01 00 28 CC 31 0F 05 00 04 01 78 0C 33 19 01 C0 9E 6C 0F 16 
            return QT_Place(objective).TargetDescription.Text;                  //008F : 04 36 58 C6 6B 0F 19 2E 90 C2 8D 01 00 28 CC 31 0F 05 00 0C 01 30 05 33 19 
          }
        } else {                                                                //00A8 : 06 F6 00 
          if (objective.IsA('QT_Take')) {                                       //00AB : 07 F6 00 19 00 28 CC 31 0F 08 00 04 61 2F 21 94 08 00 00 16 
            if (QT_Take(objective).SourceTag == Tag) {                          //00BF : 07 F6 00 FE 19 2E D0 C7 8D 01 00 28 CC 31 0F 05 00 04 01 18 AD 32 19 01 C0 9E 6C 0F 16 
              return QT_Take(objective).SourceDescription.Text;                 //00DD : 04 36 58 C6 6B 0F 19 2E D0 C7 8D 01 00 28 CC 31 0F 05 00 0C 01 D0 A5 32 19 
            }
          }
        }
      }
    }
    return Super.cl_GetToolTip();                                               //00F8 : 04 1C 80 4F 32 13 16 
    //2F C5 20 30 A3 5C 01 00 28 CC 31 0F 16 F7 00 07 5D 00 19 00 28 CC 31 0F 08 00 04 61 2F 21 9E 08 
    //00 00 16 07 5A 00 FE 19 2E 50 93 8D 01 00 28 CC 31 0F 05 00 04 01 50 3E 33 19 01 C0 9E 6C 0F 16 
    //30 04 36 58 C6 6B 0F 19 2E 50 93 8D 01 00 28 CC 31 0F 05 00 0C 01 40 3A 33 19 06 F6 00 07 AB 00 
    //19 00 28 CC 31 0F 08 00 04 61 2F 21 95 08 00 00 16 07 A8 00 FE 19 2E 90 C2 8D 01 00 28 CC 31 0F 
    //05 00 04 01 78 0C 33 19 01 C0 9E 6C 0F 16 30 04 36 58 C6 6B 0F 19 2E 90 C2 8D 01 00 28 CC 31 0F 
    //05 00 0C 01 30 05 33 19 06 F6 00 07 F6 00 19 00 28 CC 31 0F 08 00 04 61 2F 21 94 08 00 00 16 07 
    //F6 00 FE 19 2E D0 C7 8D 01 00 28 CC 31 0F 05 00 04 01 18 AD 32 19 01 C0 9E 6C 0F 16 30 04 36 58 
    //C6 6B 0F 19 2E D0 C7 8D 01 00 28 CC 31 0F 05 00 0C 01 D0 A5 32 19 31 30 04 1C 80 4F 32 13 16 04 
    //0B 47 
  }



