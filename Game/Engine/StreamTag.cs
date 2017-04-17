﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Dieser Code wurde von einem Tool generiert.
//     Laufzeitversion:4.0.30319.42000
//
//     Änderungen an dieser Datei können falsches Verhalten verursachen und gehen verloren, wenn
//     der Code erneut generiert wird.
// </auto-generated>
//------------------------------------------------------------------------------

using Engine;
using SBAI;
using SBAIScripts;
using SBBase;
using SBGame;
using SBGamePlay;
using SBMiniGames;
using System;
using System.Collections;
using System.Collections.Generic;
using TCosReborn.Framework.Common;


namespace Engine
{
    
    
    public class StreamTag : StreamBase
    {
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="StreamTag")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public ID3Field TagID;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="StreamTag")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public ID3Field TrackNumber;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="StreamTag")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public ID3Field Title;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="StreamTag")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public ID3Field Artist;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="StreamTag")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public ID3Field Album;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="StreamTag")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public ID3Field Year;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="StreamTag")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public ID3Field Genre;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="StreamTag")]
        public ID3Field Duration;
        
        [TCosReborn.Framework.Attributes.FieldCategoryAttribute(Category="StreamTag")]
        [TCosReborn.Framework.Attributes.FieldConstAttribute()]
        public List<ID3Field> Fields = new List<ID3Field>();
        
        [TCosReborn.Framework.Attributes.IgnoreFieldExtractionAttribute()]
        [TCosReborn.Framework.Attributes.FieldTransientAttribute()]
        [TCosReborn.Framework.Attributes.ArraySizeForExtractionAttribute(Size=2)]
        private int[] NativeID3Tag = new int[0];
        
        public delegate<OnRefresh> @__OnRefresh__Delegate;
        
        public StreamTag()
        {
        }
    }
}
/*
final native function DumpTag();
function DumpScriptTag() {
local int i;
Log("================");                                                    
Log("      TagID:" $ TagID.FieldName
@ "#"
@ TagID.FieldValue); 
Log("TrackNumber:" $ TrackNumber.FieldName
@ "#"
@ TrackNumber.FieldValue);
Log("      Title:" $ Title.FieldName
@ "#"
@ Title.FieldValue); 
Log("     Artist:" $ Artist.FieldName
@ "#"
@ Artist.FieldValue);
Log("      Album:" $ Album.FieldName
@ "#"
@ Album.FieldValue); 
Log("       Year:" $ Year.FieldName
@ "#"
@ Year.FieldValue);   
Log("      Genre:" $ Genre.FieldName
@ "#"
@ Genre.FieldValue); 
Log("   Duration:" $ Duration.FieldName
@ "#"
@ Duration.FieldValue);
Log("  == All Fields == ");                                                 
i = 0;                                                                      
while (i < Fields.Length) {                                                 
Log("    " $ string(i) $ ") ID:" $ string(Fields[i].FieldID)
@ "Name:"
$ Fields[i].FieldName
@ "Value:"
$ Fields[i].FieldValue);
i++;                                                                      
}
Log("");                                                                    
}
delegate OnRefresh();
*/
