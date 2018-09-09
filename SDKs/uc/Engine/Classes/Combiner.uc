//==============================================================================
//  Combiner
//==============================================================================

class Combiner extends Material
    native
    collapsecategories
    editinlinenew
    dependsOn()
  ;

  enum EAlphaOperation {
    AO_Use_Mask ,
    AO_Multiply ,
    AO_Add ,
    AO_Use_Alpha_From_Material1 ,
    AO_Use_Alpha_From_Material2 
  };

  enum EColorOperation {
    CO_Use_Color_From_Material1 ,
    CO_Use_Color_From_Material2 ,
    CO_Multiply ,
    CO_Add ,
    CO_Subtract ,
    CO_AlphaBlend_With_Mask ,
    CO_Add_With_Mask_Modulation ,
    CO_Use_Color_From_Mask 
  };

  var int combiner_dummy;
  var (Combiner) byte CombineOperation;
  var (Combiner) byte AlphaOperation;
  var (Combiner) editinline Material Material1;
  var (Combiner) editinline Material Material2;
  var (Combiner) editinline Material Mask;
  var (Combiner) bool InvertMask;
  var (Combiner) bool Modulate2X;
  var (Combiner) bool Modulate4X;



