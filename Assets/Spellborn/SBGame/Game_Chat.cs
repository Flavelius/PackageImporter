using System;
using SBBase;
using UnityEngine;

namespace SBGame
{
    [Serializable]
    public class Game_Chat: Base_Component
    {
        public const int MAX_CHAT_MESSAGE_LENGTH = 256;

        public enum EGameChatRanges
        {
            GCR_LOCAL,
            GCR_WORLD,
            GCR_TRADE,
            GCR_TEAM,
            GCR_GUILD,
            GCR_PRIVATE,
            GCR_COMBAT,
            GCR_SYSTEM,
            GCR_BROADCAST,
        }

        public void cl2sv_SendMessage(byte aRange, string aReceiver, string aMessage)
        {
            //Game_PlayerController PlayerController;
            if (((Outer as Game_Controller).Pawn as Game_Pawn).IsMuted((EGameChatRanges)aRange))
            {
                //sv2cl_OnMessage_CallStub("", "You are muted on this channel!", 0);
                return;
            }
            if (aMessage.StartsWith("/me", StringComparison.OrdinalIgnoreCase))
            {
                aMessage = aMessage.Substring(3, aMessage.Length - 3);
            }
            switch ((EGameChatRanges)aRange)
            {
                case EGameChatRanges.GCR_LOCAL:
                    //var pp = (Outer as Game_Controller).Pawn as Game_PlayerPawn;
                    //pp.sv2rel_SendMessage_CallStub(Game_PlayerPawn(Outer.Pawn).Character.sv_GetName(), aMessage, Class'Game_Desktop'.0);
                    break;
                case EGameChatRanges.GCR_WORLD:
                    //foreach Outer.AllActors(Class'Game_PlayerController', PlayerController, 'None') {
                    //    if (PlayerController != Game_PlayerPawn(Outer.Pawn).Controller)
                    //    {
                    //        PlayerController.Chat.sv2cl_OnMessage_CallStub(Game_Pawn(Outer.Pawn).Character.sv_GetName(), aMessage, Class'Game_Desktop'.1);
                    //    }
                    //}
                    break;
                case EGameChatRanges.GCR_TRADE:
                    //foreach Outer.AllActors(Class'Game_PlayerController', PlayerController, 'None') {
                    //    if (PlayerController != Game_PlayerPawn(Outer.Pawn).Controller)
                    //    {
                    //        PlayerController.Chat.sv2cl_OnMessage_CallStub(Game_Pawn(Outer.Pawn).Character.sv_GetName(), aMessage, Class'Game_Desktop'.2);
                    //    }
                    //}
                    //goto jl02E9;
                    break;
                case EGameChatRanges.GCR_TEAM:
                case EGameChatRanges.GCR_GUILD:
                    //SendMessageToUniverse(aRange, Game_PlayerPawn(Outer.Pawn).GetCharacterID(), "", aMessage);
                    //goto jl02E9;
                    break;
                case EGameChatRanges.GCR_PRIVATE:
                    //SendMessageToUniverse(5, Game_PlayerPawn(Outer.Pawn).GetCharacterID(), aReceiver, aMessage);
                    //goto jl02E9;
                    break;
            }
            Debug.LogWarning("TODO chat ranges");
        }
    }
}
/*
protected native function sv2cl_SendOnScreenMessage_CallStub();
event sv2cl_SendOnScreenMessage(int aLocalizedStringID,optional Color aColor) {
local string lMessage;
lMessage = Class'SBDBSync'.GetDescription(aLocalizedStringID);              
if (lMessage != "") {                                                       
Outer.Player.GUIDesktop.AddScreenMessage(lMessage,aColor);                
goto jl0054;                                                              
}
}
exec function SlashChatMessage() {
if (Outer.GUI.ChatHandle == 0) {                                            
Outer.GUI.ShowChat();                                                     
}
OnBeginSlashChatMessageEntry();                                             
}
exec function EnterChatMessage(optional string aMessage) {
if (Outer.GUI.ChatHandle == 0) {                                            
Outer.GUI.ShowChat();                                                     
}
OnBeginChatMessageEntry(aMessage);                                          
}
function cl_OnMessage(string aSender,string aMessage,int aChannel) {
if (!Outer.GroupingFriends.IsIgnoringName(aSender)) {                       
Game_Desktop(Outer.Player.GUIDesktop).AddMessage(aSender,aMessage,aChannel);
}
}
function cl_NPCMessage(string aSender,string aMessage) {
cl_OnMessage(aSender,aMessage,Class'Game_Desktop'.0);                       
}
protected native function sv2cl_OnMessage_CallStub();
event sv2cl_OnMessage(string aSender,string aMessage,int aChannel) {
cl_OnMessage(aSender,aMessage,aChannel);                                    
}
native function SendMessageToUniverse(byte aRange,int aSenderID,string aReceiver,string aMessage);
protected native function cl2sv_SendMessage_CallStub();
event cl_SendMessageTo(byte aRange,string aReceiver,string aMessage) {
cl2sv_SendMessage_CallStub(aRange,aReceiver,aMessage);                      
}
event cl_SendMessage(byte aRange,string aMessage) {
cl2sv_SendMessage_CallStub(aRange,"",aMessage);                             
}
native function LogChatMessage(int aAccountID,string aCharacterName,string aMessage);
delegate OnBeginSlashChatMessageEntry();
delegate OnBeginChatMessageEntry(optional string aMessage);
delegate OnChatMessageReceived(byte aRange,string aSender,string aMessage,optional bool me);
*/
