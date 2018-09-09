//==============================================================================
//  Interaction_Attach
//==============================================================================

class Interaction_Attach extends Interaction_Component
    native
    collapsecategories
    editinlinenew
    dependsOn(Game_Pawn,Actor,InteractiveLevelElement)
  ;

  var (Interaction_Attach) StaticMesh Attachment;
  var (Interaction_Attach) string Bone;
  var (Interaction_Attach) Vector Offset;
  var (Interaction_Attach) Rotator Orientation;
  var transient name AttachmentName;


  function ClOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local Actor attachmentActor;
    Super.ClOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 78 A8 32 13 00 08 D1 F8 13 00 28 D3 F8 13 2D 00 A0 D3 F8 13 16 
    if (aInstigator != None) {                                                  //0016 : 07 10 01 77 00 28 D3 F8 13 2A 16 
      if (!aReverse) {                                                          //0021 : 07 AE 00 81 2D 00 A0 D3 F8 13 16 
        attachmentActor = aInstigator.Spawn(Class'SBAttachment',aInstigator,'None',Offset,Orientation);//002C : 0F 00 18 D4 F8 13 19 00 28 D3 F8 13 1C 00 04 61 16 20 00 7D D7 00 00 28 D3 F8 13 21 00 00 00 00 01 90 D4 F8 13 01 08 D5 F8 13 16 
        attachmentActor.SetDrawType(8);                                         //0057 : 19 00 18 D4 F8 13 08 00 00 1C 48 93 6B 0F 24 08 16 
        attachmentActor.SetStaticMesh(Attachment);                              //0068 : 19 00 18 D4 F8 13 0B 00 00 1C A8 94 6B 0F 01 80 D5 F8 13 16 
        aInstigator.AttachToBone(attachmentActor,name(Bone));                   //007C : 19 00 28 D3 F8 13 12 00 04 1C 10 B3 6D 0F 00 18 D4 F8 13 39 5A 01 F8 D5 F8 13 16 
        AttachmentName = attachmentActor.Name;                                  //0097 : 0F 01 70 D6 F8 13 19 00 18 D4 F8 13 05 00 04 01 F0 E4 6B 0F 
      } else {                                                                  //00AB : 06 10 01 
        if (AttachmentName != 'None') {                                         //00AE : 07 10 01 FF 01 70 D6 F8 13 21 00 00 00 00 16 
          attachmentActor = aInstigator.FindAttachment(AttachmentName,name(Bone));//00BD : 0F 00 18 D4 F8 13 19 00 28 D3 F8 13 12 00 04 1C 60 AF 6D 0F 01 70 D6 F8 13 39 5A 01 F8 D5 F8 13 16 
          if (attachmentActor != None) {                                        //00DE : 07 10 01 77 00 18 D4 F8 13 2A 16 
            aInstigator.DetachFromBone(attachmentActor);                        //00E9 : 19 00 28 D3 F8 13 0B 00 04 1C C0 B0 6D 0F 00 18 D4 F8 13 16 
            attachmentActor.Destroy();                                          //00FD : 19 00 18 D4 F8 13 03 00 04 61 17 16 
            attachmentActor = None;                                             //0109 : 0F 00 18 D4 F8 13 2A 
          }
        }
      }
    }
    //1C 78 A8 32 13 00 08 D1 F8 13 00 28 D3 F8 13 2D 00 A0 D3 F8 13 16 07 10 01 77 00 28 D3 F8 13 2A 
    //16 07 AE 00 81 2D 00 A0 D3 F8 13 16 0F 00 18 D4 F8 13 19 00 28 D3 F8 13 1C 00 04 61 16 20 00 7D 
    //D7 00 00 28 D3 F8 13 21 00 00 00 00 01 90 D4 F8 13 01 08 D5 F8 13 16 19 00 18 D4 F8 13 08 00 00 
    //1C 48 93 6B 0F 24 08 16 19 00 18 D4 F8 13 0B 00 00 1C A8 94 6B 0F 01 80 D5 F8 13 16 19 00 28 D3 
    //F8 13 12 00 04 1C 10 B3 6D 0F 00 18 D4 F8 13 39 5A 01 F8 D5 F8 13 16 0F 01 70 D6 F8 13 19 00 18 
    //D4 F8 13 05 00 04 01 F0 E4 6B 0F 06 10 01 07 10 01 FF 01 70 D6 F8 13 21 00 00 00 00 16 0F 00 18 
    //D4 F8 13 19 00 28 D3 F8 13 12 00 04 1C 60 AF 6D 0F 01 70 D6 F8 13 39 5A 01 F8 D5 F8 13 16 07 10 
    //01 77 00 18 D4 F8 13 2A 16 19 00 28 D3 F8 13 0B 00 04 1C C0 B0 6D 0F 00 18 D4 F8 13 16 19 00 18 
    //D4 F8 13 03 00 04 61 17 16 0F 00 18 D4 F8 13 2A 04 0B 47 
  }


  function SvOnStart(Game_Actor aOwner,Game_Pawn aInstigator,bool aReverse) {
    local InteractiveLevelElement ile;
    Super.SvOnStart(aOwner,aInstigator,aReverse);                               //0000 : 1C 60 AF 32 13 00 E8 D6 F8 13 00 E8 D7 F8 13 2D 00 60 D8 F8 13 16 
    ile = InteractiveLevelElement(aOwner);                                      //0016 : 0F 00 D8 D8 F8 13 2E F8 C7 5C 01 00 E8 D6 F8 13 
    if (ile != None) {                                                          //0026 : 07 40 00 77 00 D8 D8 F8 13 2A 16 
      ile.sv_StartClientSubAction();                                            //0031 : 19 00 D8 D8 F8 13 06 00 00 1B C3 0F 00 00 16 
    }
    //1C 60 AF 32 13 00 E8 D6 F8 13 00 E8 D7 F8 13 2D 00 60 D8 F8 13 16 0F 00 D8 D8 F8 13 2E F8 C7 5C 
    //01 00 E8 D6 F8 13 07 40 00 77 00 D8 D8 F8 13 2A 16 19 00 D8 D8 F8 13 06 00 00 1B C3 0F 00 00 16 
    //04 0B 47 
  }



