using System;
using Engine;
using SBBase;
using UnityEngine;

namespace SBGame
{
    [Serializable] public class Game_ItemManager : Base_Component
    {

        public new Game_Pawn Outer { get { return base.Outer as Game_Pawn; } }

        [NonSerialized, HideInInspector]
        [FieldTransient()]
        public int mItems;

        public int GetFreeSlots(Game_Item.EItemLocationType aLocationType,int aLocationID = 0)
        {
            throw new NotImplementedException();
        }

        public int CountItems(Item_Type aItemType, Game_Item.EItemLocationType aLocationType = Game_Item.EItemLocationType.ILT_Unknown)
        {
            throw new NotImplementedException();
        }
    }
}
/*
final native function int CountItemsByType(byte aType,optional byte aLocationType);
native function bool IsValidSlot(byte aLocationType,int aLocationSlot,int aLocationID);
native function Game_Item GetItemByID(int aDBID);
native function Game_Item GetItem(byte aLocationType,int aLocationSlot,optional int aLocationID);
native function array<Game_Item> GetItems(byte aLocationType,optional int aLocationID);
*/