using System;
using System.Collections.Generic;
using Sirenix.OdinInspector;

namespace SBGame
{
    [Serializable]
    public class Content_Inventory: Content_API
    {
        [FoldoutGroup("Items")]
        public List<ContentItem> Items = new List<ContentItem>();

        [Serializable]
        public struct ContentItem
        {
            public Item_Type Item;
            public int StackSize;
            public byte Color1;
            public byte Color2;
        }

        public bool Empty()
        {
            throw new NotImplementedException();
        }

        public bool RemoveFromInventory(Game_Pawn aPawn, Action callback = null)
        {
            int i;
            Item_Type Type;
            int Amount;
            Game_PlayerItemManager itemManager;
            if (aPawn.itemManager == null)
            {
                return false;
            }
            itemManager = (aPawn.itemManager as Game_PlayerItemManager);
            if (itemManager == null)
            {
                return false;
            }
            i = 0;
            while (i < Items.Count)
            {
                Type = Items[i].Item;
                if (Type != null)
                {
                    Amount = Items[i].StackSize;
                    if (CountItems(aPawn, Type) < Amount)
                    {
                        return false;
                    }
                    if (!itemManager.sv_QueueRemoveByType(Type, Amount))
                    {
                        return false;
                    }
                }
                i++;
            }
            if (itemManager.sv_ExecuteRemoveByType(callback))
            {
            }
            return true;
        }

        public int SlotCount()
        {
            AutoStack(true);
            return Items.Count;
        }

        void AutoStack(bool aUseStackableAmount)
        {
            throw new NotImplementedException();
        }

        public bool HasItemsInInventory(Game_Pawn aPawn)
        {
            int i;
            int ii;
            List<Item_Type> uniqueItem = new List<Item_Type>();
            List<int> uniqueCount = new List<int>();
            i = 0;
            while (i < Items.Count)
            {
                ii = 0;
                while (ii < uniqueItem.Count)
                {
                    if (uniqueItem[ii] == Items[i].Item)
                    {
                        continue;
                    }
                    ii++;
                }
                uniqueItem[ii] = Items[i].Item;
                uniqueCount[ii] += Items[i].StackSize;
                i++;
            }
            ii = 0;
            while (ii < uniqueItem.Count)
            {
                if (aPawn.itemManager.CountItems(uniqueItem[ii]) < uniqueCount[ii])
                {
                    return false;
                }
                ii++;
            }
            return true;
        }
    }
}
/*
event string GetActiveText(Game_ActiveTextItem aItem) {
if (aItem == None) {                                                        
return Description();                                                     
} else {                                                                    
if (aItem.Tag == "O") {                                                   
return Items[aItem.Ordinality].Item.GetActiveText(aItem.SubItem);       
}
}
}
event string Description() {
local int i;
local string ret;
if (Empty()) {                                                              
return Class'StringReferences'.default.EmptyContentInventoryText.Text;    
} else {                                                                    
i = 0;                                                                    
while (i < Items.Length) {                                                
if (Items[i].Item != None) {                                            
if (Items[i].StackSize == 1) {                                        
return Items[i].Item.GetName();                                     
goto jl00B0;                                                        
}
return string(Items[i].StackSize) @ Items[i].Item.GetName();          
}
i++;                                                                    
}
return ret;                                                               
}
}
event AddToInventory(Game_Pawn aPawn) {
local int i;
local export editinline Item_Type Type;
local export editinline Game_PlayerItemManager itemManager;
if (aPawn.itemManager == None) {                                            
return;                                                                   
}
itemManager = Game_PlayerItemManager(aPawn.itemManager);                    
if (itemManager == None) {                                                  
return;                                                                   
}
AutoStack(False);                                                           
i = 0;                                                                      
while (i < Items.Length) {                                                  
Type = Items[i].Item;                                                     
if (Type != None) {                                                       
if (!itemManager.sv_QueueAddItem(Type,Items[i].StackSize,0,Items[i].Color1,Items[i].Color2)) {
return;                                                               
}
}
i++;                                                                      
}
itemManager.sv_ExecuteAddItems(1);                                          
}
final native function int GetStackSize(int aIndex);
function byte GetColor2(int aIndex) {
return Items[aIndex].Color2;                                                
}
function byte GetColor1(int aIndex) {
return Items[aIndex].Color1;                                                
}
final native function Item_Type GetItem(int aIndex);
function bool AddItem(export editinline Item_Type aType,int aStack,byte aColor1,byte aColor2) {
local ContentItem newItem;
newItem.Item = aType;                                                       
newItem.StackSize = aStack;                                                 
newItem.Color1 = aColor1;                                                   
newItem.Color2 = aColor2;                                                   
Items[Items.Length] = newItem;                                              
return True;                                                                
}
final native function int Count();
*/
