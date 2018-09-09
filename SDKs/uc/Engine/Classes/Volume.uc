//==============================================================================
//  Volume
//==============================================================================

class Volume extends Brush
    native
    dependsOn(Canvas)
  ;

  var Actor AssociatedActor;
  var (Volume) name AssociatedActorTag;
  var (Volume) int LocationPriority;
  var (Volume) localized string LocationName;
  var (Volume) edfindable DecorationList DecoList;


  function DisplayDebug(Canvas Canvas,out float YL,out float YPos) {
    Super.DisplayDebug(Canvas,YL,YPos);                                         //0000 : 1C 68 EB 35 0F 00 10 6C 79 0F 00 40 6D 79 0F 00 B8 6D 79 0F 16 
    Canvas.DrawText("AssociatedActor " $ string(AssociatedActor),False);        //0015 : 19 00 10 6C 79 0F 1F 00 00 61 D1 70 1F 41 73 73 6F 63 69 61 74 65 64 41 63 74 6F 72 20 00 39 56 01 10 6A 79 0F 16 28 16 
    YPos += YL;                                                                 //003D : B8 00 B8 6D 79 0F 00 40 6D 79 0F 16 
    Canvas.SetPos(4.00000000,YPos);                                             //0049 : 19 00 10 6C 79 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 B8 6D 79 0F 16 
    //1C 68 EB 35 0F 00 10 6C 79 0F 00 40 6D 79 0F 00 B8 6D 79 0F 16 19 00 10 6C 79 0F 1F 00 00 61 D1 
    //70 1F 41 73 73 6F 63 69 61 74 65 64 41 63 74 6F 72 20 00 39 56 01 10 6A 79 0F 16 28 16 B8 00 B8 
    //6D 79 0F 00 40 6D 79 0F 16 19 00 10 6C 79 0F 10 00 00 1C 80 90 6C 0F 1E 00 00 80 40 00 B8 6D 79 
    //0F 16 04 0B 47 
  }


  function PostBeginPlay() {
    Super.PostBeginPlay();                                                      //0000 : 1C D0 02 38 0F 16 
    if (AssociatedActorTag != 'None') {                                         //0006 : 07 2F 00 FF 01 78 6F 79 0F 21 00 00 00 00 16 
      foreach AllActors(Class'Actor',AssociatedActor,AssociatedActorTag) {      //0015 : 2F 61 30 20 F8 8B C1 00 01 10 6A 79 0F 01 78 6F 79 0F 16 2E 00 
        goto jl002E;                                                            //002A : 06 2E 00 
      }
    }
    if (AssociatedActor != None) {                                              //002F : 07 4A 00 77 01 10 6A 79 0F 2A 16 
      GotoState('AssociatedTouch');                                             //003A : 71 21 EC 2B 00 00 16 
      InitialState = GetStateName();                                            //0041 : 0F 01 F8 03 38 0F 61 1C 16 
    }
    //1C D0 02 38 0F 16 07 2F 00 FF 01 78 6F 79 0F 21 00 00 00 00 16 2F 61 30 20 F8 8B C1 00 01 10 6A 
    //79 0F 01 78 6F 79 0F 16 2E 00 06 2E 00 31 30 07 4A 00 77 01 10 6A 79 0F 2A 16 71 21 EC 2B 00 00 
    //16 0F 01 F8 03 38 0F 61 1C 16 04 0B 47 
  }


  native function bool Encompasses(Actor Other);


  state AssociatedTouch {

      function BeginState() {
        local Actor A;
        foreach TouchingActors(Class'Actor',A) {                                //0000 : 2F 61 33 20 F8 8B C1 00 00 E0 5C 79 0F 16 1C 00 
          Touch(A);                                                             //0010 : 1B 39 01 00 00 00 E0 5C 79 0F 16 
        }
        //2F 61 33 20 F8 8B C1 00 00 E0 5C 79 0F 16 1C 00 1B 39 01 00 00 00 E0 5C 79 0F 16 31 30 04 0B 47 
        //
      }


      event UnTouch(Actor Other) {
        AssociatedActor.UnTouch(Other);                                         //0000 : 19 01 10 6A 79 0F 0B 00 00 1B 3A 01 00 00 00 50 69 79 0F 16 
        //19 01 10 6A 79 0F 0B 00 00 1B 3A 01 00 00 00 50 69 79 0F 16 04 0B 47 
      }


      event Touch(Actor Other) {
        if (AssociatedActor != self) {                                          //0000 : 07 22 00 77 01 10 6A 79 0F 17 16 
          AssociatedActor.Touch(Other);                                         //000B : 19 01 10 6A 79 0F 0B 00 00 1B 39 01 00 00 00 88 6A 79 0F 16 
          goto jl0022;                                                          //001F : 06 22 00 
        }
        //07 22 00 77 01 10 6A 79 0F 17 16 19 01 10 6A 79 0F 0B 00 00 1B 39 01 00 00 00 88 6A 79 0F 16 06 
        //22 00 04 0B 47 
      }


    //08 47 

  }



