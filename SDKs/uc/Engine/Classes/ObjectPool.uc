//==============================================================================
//  ObjectPool
//==============================================================================

class ObjectPool extends Object
    dependsOn()
  ;

  var array<Object> Objects;


  simulated function Shrink() {
    while (Objects.Length > 0) {                                                //0000 : 07 1F 00 97 37 01 20 D9 7B 0F 25 16 
      Objects.Remove(Objects.Length - 1,1);                                     //000C : 41 01 20 D9 7B 0F 93 37 01 20 D9 7B 0F 26 16 26 
    }
    //07 1F 00 97 37 01 20 D9 7B 0F 25 16 41 01 20 D9 7B 0F 93 37 01 20 D9 7B 0F 26 16 26 06 00 00 04 
    //0B 47 
  }


  simulated function FreeObject(Object Obj) {
    Objects.Length = Objects.Length + 1;                                        //0000 : 0F 37 01 20 D9 7B 0F 92 37 01 20 D9 7B 0F 26 16 
    Objects[Objects.Length - 1] = Obj;                                          //0010 : 0F 10 93 37 01 20 D9 7B 0F 26 16 01 20 D9 7B 0F 00 48 DA 7B 0F 
    //0F 37 01 20 D9 7B 0F 92 37 01 20 D9 7B 0F 26 16 0F 10 93 37 01 20 D9 7B 0F 26 16 01 20 D9 7B 0F 
    //00 48 DA 7B 0F 04 0B 47 
  }


  simulated function Object AllocateObject(class<Object> ObjectClass) {
    local Object Result;
    local int ObjectIndex;
    ObjectIndex = 0;                                                            //0000 : 0F 00 80 DC 7B 0F 25 
    while (ObjectIndex < Objects.Length) {                                      //0007 : 07 5F 00 96 00 80 DC 7B 0F 37 01 20 D9 7B 0F 16 
      if (Objects[ObjectIndex].Class == ObjectClass) {                          //0017 : 07 55 00 72 19 10 00 80 DC 7B 0F 01 20 D9 7B 0F 05 00 04 01 68 E5 6B 0F 00 20 DB 7B 0F 16 
        Result = Objects[ObjectIndex];                                          //0035 : 0F 00 F8 DC 7B 0F 10 00 80 DC 7B 0F 01 20 D9 7B 0F 
        Objects.Remove(ObjectIndex,1);                                          //0046 : 41 01 20 D9 7B 0F 00 80 DC 7B 0F 26 
        goto jl005F;                                                            //0052 : 06 5F 00 
      }
      ObjectIndex++;                                                            //0055 : A5 00 80 DC 7B 0F 16 
    }
    if (Result == None) {                                                       //005F : 07 7D 00 72 00 F8 DC 7B 0F 2A 16 
      Result = new (Outer) ObjectClass;                                         //006A : 0F 00 F8 DC 7B 0F 11 01 00 E4 6B 0F 0B 0B 00 20 DB 7B 0F 
    }
    return Result;                                                              //007D : 04 00 F8 DC 7B 0F 
    //0F 00 80 DC 7B 0F 25 07 5F 00 96 00 80 DC 7B 0F 37 01 20 D9 7B 0F 16 07 55 00 72 19 10 00 80 DC 
    //7B 0F 01 20 D9 7B 0F 05 00 04 01 68 E5 6B 0F 00 20 DB 7B 0F 16 0F 00 F8 DC 7B 0F 10 00 80 DC 7B 
    //0F 01 20 D9 7B 0F 41 01 20 D9 7B 0F 00 80 DC 7B 0F 26 06 5F 00 A5 00 80 DC 7B 0F 16 06 07 00 07 
    //7D 00 72 00 F8 DC 7B 0F 2A 16 0F 00 F8 DC 7B 0F 11 01 00 E4 6B 0F 0B 0B 00 20 DB 7B 0F 04 00 F8 
    //DC 7B 0F 04 0B 47 
  }



