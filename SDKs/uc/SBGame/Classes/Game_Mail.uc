//==============================================================================
//  Game_Mail
//==============================================================================

class Game_Mail extends Base_Component within Game_PlayerController
    native
    dependsOn(Game_PlayerController,Quest_Type,Game_PlayerPawn,Game_QuestLog,Conversation_Topic,Content_Event,Game_Pawn,SBDBSync,NPC_Type,Game_Character,Game_TextParser,Conversation_Node)
  ;

  const MAIL_CHECK_TIME =  300;
  const MAIL_MAX_ITEMS =  4;
  const MES_ATT3_REMOVED =  1024;
  const MES_ATT2_REMOVED =  512;
  const MES_ATT1_REMOVED =  256;
  const MES_ATT0_REMOVED =  128;
  const MES_SEND_DELETED =  32;
  const MES_RECI_DELETED =  16;
  const MES_FORWARDED =  8;
  const MES_REPLIED =  4;
  const MES_READ =  2;
  const MES_SENT =  1;
  struct MailAttachment {
      var int ItemTypeID;
      var int StackSize;
      var byte Color1;
      var byte Color2;

  };


  struct MailEntry {
      var array<MailAttachment> Attachments;
      var export editinline Quest_Type quest;
      var string sender;
      var string Recipient;
      var string Subject;
      var string Body;
      var int MailID;
      var int Status;
      var int TimeStamp;
      var int Money;
      var bool Details;
      var bool Attached;

  };


  var array<MailEntry> mMailInbox;
  var array<MailEntry> mMailOutbox;
  var bool mRequestingMails;
  var int mLastCheckTime;
  var (null);
  var (null);
  var (null);
  var (null);


  protected native function sv2cl_GiveQuest_CallStub();


  event sv2cl_GiveQuest(int mailIndex) {
    OnInboxMailDetails(mailIndex);                                              //0000 : 43 D8 5A 33 11 CF 05 00 00 00 20 5A 33 11 16 
    //43 D8 5A 33 11 CF 05 00 00 00 20 5A 33 11 16 04 0B 47 
  }


  function bool sv_GiveQuest(int mailIndex) {
    local Game_PlayerPawn pwn;
    local export editinline Quest_Type quest;
    local int eventI;
    local export editinline Content_Event eventObject;
    pwn = Game_PlayerPawn(Outer.Pawn);                                          //0000 : 0F 00 B0 5E 33 11 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 
    quest = mMailInbox[mailIndex].quest;                                        //0019 : 0F 00 28 5F 33 11 36 28 60 33 11 10 00 00 5C 33 11 01 A0 60 33 11 
    if (pwn != None && quest != None) {                                         //002F : 07 7B 01 82 77 00 B0 5E 33 11 2A 16 18 09 00 77 00 28 5F 33 11 2A 16 16 
      if (quest.CheckPawn(pwn)) {                                               //0047 : 07 76 01 19 00 28 5F 33 11 0B 00 04 1C E8 48 2E 11 00 B0 5E 33 11 16 
        if (pwn.questLog.sv_AcceptQuest(quest)) {                               //005E : 07 73 01 19 19 00 B0 5E 33 11 05 00 04 01 F0 2F 7F 0F 0B 00 04 1C 98 32 20 11 00 28 5F 33 11 16 
          if (quest.ProvideTopic != None) {                                     //007E : 07 71 01 77 19 00 28 5F 33 11 05 00 04 01 30 5B 2E 11 2A 16 
            eventI = 0;                                                         //0092 : 0F 00 18 61 33 11 25 
            while (eventI < quest.ProvideTopic.Events.Length) {                 //0099 : 07 11 01 96 00 18 61 33 11 37 19 19 00 28 5F 33 11 05 00 04 01 30 5B 2E 11 05 00 00 01 B8 AC 24 11 16 
              eventObject = quest.ProvideTopic.Events[eventI];                  //00BB : 0F 00 90 61 33 11 10 00 18 61 33 11 19 19 00 28 5F 33 11 05 00 04 01 30 5B 2E 11 05 00 00 01 B8 AC 24 11 
              if (eventObject != None
                && !eventObject.sv_CanExecute(None,pwn)) {//00DE : 07 07 01 82 77 00 90 61 33 11 2A 16 18 18 00 81 19 00 90 61 33 11 0C 00 04 1B 22 0C 00 00 2A 00 B0 5E 33 11 16 16 16 
                return False;                                                   //0105 : 04 28 
              }
              eventI++;                                                         //0107 : A5 00 18 61 33 11 16 
            }
            eventI = 0;                                                         //0111 : 0F 00 18 61 33 11 25 
            while (eventI < quest.ProvideTopic.Events.Length) {                 //0118 : 07 71 01 96 00 18 61 33 11 37 19 19 00 28 5F 33 11 05 00 04 01 30 5B 2E 11 05 00 00 01 B8 AC 24 11 16 
              quest.ProvideTopic.Events[eventI].sv_Execute(None,pwn);           //013A : 19 10 00 18 61 33 11 19 19 00 28 5F 33 11 05 00 04 01 30 5B 2E 11 05 00 00 01 B8 AC 24 11 0C 00 00 1B 23 0C 00 00 2A 00 B0 5E 33 11 16 
              eventI++;                                                         //0167 : A5 00 18 61 33 11 16 
            }
          }
          return True;                                                          //0171 : 04 27 
        }
      } else {                                                                  //0173 : 06 78 01 
        return False;                                                           //0176 : 04 28 
      }
    } else {                                                                    //0178 : 06 7D 01 
      return False;                                                             //017B : 04 28 
    }
    //0F 00 B0 5E 33 11 2E F0 47 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 0F 00 28 5F 33 11 36 
    //28 60 33 11 10 00 00 5C 33 11 01 A0 60 33 11 07 7B 01 82 77 00 B0 5E 33 11 2A 16 18 09 00 77 00 
    //28 5F 33 11 2A 16 16 07 76 01 19 00 28 5F 33 11 0B 00 04 1C E8 48 2E 11 00 B0 5E 33 11 16 07 73 
    //01 19 19 00 B0 5E 33 11 05 00 04 01 F0 2F 7F 0F 0B 00 04 1C 98 32 20 11 00 28 5F 33 11 16 07 71 
    //01 77 19 00 28 5F 33 11 05 00 04 01 30 5B 2E 11 2A 16 0F 00 18 61 33 11 25 07 11 01 96 00 18 61 
    //33 11 37 19 19 00 28 5F 33 11 05 00 04 01 30 5B 2E 11 05 00 00 01 B8 AC 24 11 16 0F 00 90 61 33 
    //11 10 00 18 61 33 11 19 19 00 28 5F 33 11 05 00 04 01 30 5B 2E 11 05 00 00 01 B8 AC 24 11 07 07 
    //01 82 77 00 90 61 33 11 2A 16 18 18 00 81 19 00 90 61 33 11 0C 00 04 1B 22 0C 00 00 2A 00 B0 5E 
    //33 11 16 16 16 04 28 A5 00 18 61 33 11 16 06 99 00 0F 00 18 61 33 11 25 07 71 01 96 00 18 61 33 
    //11 37 19 19 00 28 5F 33 11 05 00 04 01 30 5B 2E 11 05 00 00 01 B8 AC 24 11 16 19 10 00 18 61 33 
    //11 19 19 00 28 5F 33 11 05 00 04 01 30 5B 2E 11 05 00 00 01 B8 AC 24 11 0C 00 00 1B 23 0C 00 00 
    //2A 00 B0 5E 33 11 16 A5 00 18 61 33 11 16 06 18 01 04 27 06 78 01 04 28 06 7D 01 04 28 04 0B 47 
    //
  }


  protected native function cl2sv_GiveQuest_CallStub();


  event cl2sv_GiveQuest(int mailIndex) {
    if (sv_GiveQuest(mailIndex)) {                                              //0000 : 07 19 00 1B CF 0D 00 00 00 E0 63 33 11 16 
      sv2cl_GiveQuest_CallStub(mailIndex);                                      //000E : 1B D0 0D 00 00 00 E0 63 33 11 16 
    }
    //07 19 00 1B CF 0D 00 00 00 E0 63 33 11 16 1B D0 0D 00 00 00 E0 63 33 11 16 04 0B 47 
  }


  function cl_GiveQuest(int mailIndex) {
    cl2sv_GiveQuest_CallStub(mailIndex);                                        //0000 : 1B C7 0D 00 00 00 58 65 33 11 16 
    //1B C7 0D 00 00 00 58 65 33 11 16 04 0B 47 
  }


  protected native function cl2sv_DeleteMail_CallStub();


  native event cl2sv_DeleteMail(int mailIndex,bool aFromInbox);


  function cl_DeleteOutboxMail(int mailIndex) {
    cl2sv_DeleteMail_CallStub(mailIndex,False);                                 //0000 : 1B 52 0D 00 00 00 48 69 33 11 28 16 
    mMailOutbox.Remove(mailIndex,1);                                            //000C : 41 01 20 6A 33 11 00 48 69 33 11 26 
    OnUpdateEntries();                                                          //0018 : 43 98 6A 33 11 FE 05 00 00 16 
    //1B 52 0D 00 00 00 48 69 33 11 28 16 41 01 20 6A 33 11 00 48 69 33 11 26 43 98 6A 33 11 FE 05 00 
    //00 16 04 0B 47 
  }


  function cl_DeleteInboxMail(int mailIndex) {
    cl2sv_DeleteMail_CallStub(mailIndex,True);                                  //0000 : 1B 52 0D 00 00 00 C0 6B 33 11 27 16 
    mMailInbox.Remove(mailIndex,1);                                             //000C : 41 01 A0 60 33 11 00 C0 6B 33 11 26 
    OnUpdateEntries();                                                          //0018 : 43 98 6A 33 11 FE 05 00 00 16 
    //1B 52 0D 00 00 00 C0 6B 33 11 27 16 41 01 A0 60 33 11 00 C0 6B 33 11 26 43 98 6A 33 11 FE 05 00 
    //00 16 04 0B 47 
  }


  protected native function sv2cl_UpdateOutbox_CallStub();


  event sv2cl_UpdateOutbox(int mailIndex,int MailID,int Status,string Recipient,string Subject,int TimeStamp,bool Attached) {
    if (mailIndex >= mMailOutbox.Length) {                                      //0000 : 07 1F 00 99 00 F8 6D 33 11 37 01 20 6A 33 11 16 
      mMailOutbox.Length = mailIndex + 1;                                       //0010 : 0F 37 01 20 6A 33 11 92 00 F8 6D 33 11 26 16 
    }
    mMailOutbox[mailIndex].MailID = MailID;                                     //001F : 0F 36 C0 6F 33 11 10 00 F8 6D 33 11 01 20 6A 33 11 00 38 70 33 11 
    mMailOutbox[mailIndex].Status = Status;                                     //0035 : 0F 36 B0 70 33 11 10 00 F8 6D 33 11 01 20 6A 33 11 00 28 71 33 11 
    mMailOutbox[mailIndex].sender = Game_Pawn(Outer.Pawn).GetCharacterName();   //004B : 0F 36 A0 71 33 11 10 00 F8 6D 33 11 01 20 6A 33 11 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 00 1B 67 05 00 00 16 
    mMailOutbox[mailIndex].Recipient = Recipient;                               //0079 : 0F 36 18 72 33 11 10 00 F8 6D 33 11 01 20 6A 33 11 00 90 72 33 11 
    mMailOutbox[mailIndex].Subject = Subject;                                   //008F : 0F 36 08 73 33 11 10 00 F8 6D 33 11 01 20 6A 33 11 00 80 73 33 11 
    mMailOutbox[mailIndex].TimeStamp = TimeStamp;                               //00A5 : 0F 36 F8 73 33 11 10 00 F8 6D 33 11 01 20 6A 33 11 00 70 74 33 11 
    mMailOutbox[mailIndex].Attached = Attached;                                 //00BB : 14 2D 36 E8 74 33 11 10 00 F8 6D 33 11 01 20 6A 33 11 2D 00 60 75 33 11 
    //07 1F 00 99 00 F8 6D 33 11 37 01 20 6A 33 11 16 0F 37 01 20 6A 33 11 92 00 F8 6D 33 11 26 16 0F 
    //36 C0 6F 33 11 10 00 F8 6D 33 11 01 20 6A 33 11 00 38 70 33 11 0F 36 B0 70 33 11 10 00 F8 6D 33 
    //11 01 20 6A 33 11 00 28 71 33 11 0F 36 A0 71 33 11 10 00 F8 6D 33 11 01 20 6A 33 11 19 2E 18 38 
    //5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 00 1B 67 05 00 00 16 0F 36 18 72 33 11 10 
    //00 F8 6D 33 11 01 20 6A 33 11 00 90 72 33 11 0F 36 08 73 33 11 10 00 F8 6D 33 11 01 20 6A 33 11 
    //00 80 73 33 11 0F 36 F8 73 33 11 10 00 F8 6D 33 11 01 20 6A 33 11 00 70 74 33 11 14 2D 36 E8 74 
    //33 11 10 00 F8 6D 33 11 01 20 6A 33 11 2D 00 60 75 33 11 04 0B 47 
  }


  protected native function sv2cl_UpdateOutboxDetails_CallStub();


  event sv2cl_UpdateOutboxDetails(int mailIndex,string Body,int aMoney,array<MailAttachment> aAttachments) {
    mMailOutbox[mailIndex].Body = Body;                                         //0000 : 0F 36 68 78 33 11 10 00 38 77 33 11 01 20 6A 33 11 00 E0 78 33 11 
    mMailOutbox[mailIndex].Attachments = aAttachments;                          //0016 : 0F 36 58 79 33 11 10 00 38 77 33 11 01 20 6A 33 11 00 D0 79 33 11 
    mMailOutbox[mailIndex].Money = aMoney;                                      //002C : 0F 36 48 7A 33 11 10 00 38 77 33 11 01 20 6A 33 11 00 C0 7A 33 11 
    mMailOutbox[mailIndex].Details = True;                                      //0042 : 14 2D 36 38 7B 33 11 10 00 38 77 33 11 01 20 6A 33 11 27 
    OnOutboxMailDetails(mailIndex);                                             //0055 : 43 B0 7B 33 11 D8 05 00 00 00 38 77 33 11 16 
    //0F 36 68 78 33 11 10 00 38 77 33 11 01 20 6A 33 11 00 E0 78 33 11 0F 36 58 79 33 11 10 00 38 77 
    //33 11 01 20 6A 33 11 00 D0 79 33 11 0F 36 48 7A 33 11 10 00 38 77 33 11 01 20 6A 33 11 00 C0 7A 
    //33 11 14 2D 36 38 7B 33 11 10 00 38 77 33 11 01 20 6A 33 11 27 43 B0 7B 33 11 D8 05 00 00 00 38 
    //77 33 11 16 04 0B 47 
  }


  protected native function cl2sv_GetOutboxDetails_CallStub();


  event cl2sv_GetOutboxDetails(int mailIndex) {
    sv2cl_UpdateOutboxDetails_CallStub(mailIndex,mMailOutbox[mailIndex].Body,mMailOutbox[mailIndex].Money,mMailOutbox[mailIndex].Attachments);//0000 : 1B B0 0D 00 00 00 B8 80 33 11 36 68 78 33 11 10 00 B8 80 33 11 01 20 6A 33 11 36 48 7A 33 11 10 00 B8 80 33 11 01 20 6A 33 11 36 58 79 33 11 10 00 B8 80 33 11 01 20 6A 33 11 16 
    //1B B0 0D 00 00 00 B8 80 33 11 36 68 78 33 11 10 00 B8 80 33 11 01 20 6A 33 11 36 48 7A 33 11 10 
    //00 B8 80 33 11 01 20 6A 33 11 36 58 79 33 11 10 00 B8 80 33 11 01 20 6A 33 11 16 04 0B 47 
  }


  function cl_GetOutboxDetails(int mailIndex) {
    if (!mMailOutbox[mailIndex].Details) {                                      //0000 : 07 24 00 81 2D 36 38 7B 33 11 10 00 60 82 33 11 01 20 6A 33 11 16 
      cl2sv_GetOutboxDetails_CallStub(mailIndex);                               //0016 : 1B AF 0D 00 00 00 60 82 33 11 16 
    } else {                                                                    //0021 : 06 33 00 
      OnOutboxMailDetails(mailIndex);                                           //0024 : 43 B0 7B 33 11 D8 05 00 00 00 60 82 33 11 16 
    }
    //07 24 00 81 2D 36 38 7B 33 11 10 00 60 82 33 11 01 20 6A 33 11 16 1B AF 0D 00 00 00 60 82 33 11 
    //16 06 33 00 43 B0 7B 33 11 D8 05 00 00 00 60 82 33 11 16 04 0B 47 
  }


  protected native function sv2cl_UpdateInboxQuest_CallStub();


  event sv2cl_UpdateInboxQuest(int mailIndex,int Status,int questId,int TimeStamp) {
    local export editinline Quest_Type quest;
    quest = Quest_Type(Class'SBDBSync'.GetResourceObject(questId));             //0000 : 0F 00 28 85 33 11 2E F0 9D 5C 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 A0 85 33 11 16 
    if (quest != None) {                                                        //001F : 07 22 01 77 00 28 85 33 11 2A 16 
      if (mailIndex >= mMailInbox.Length) {                                     //002A : 07 49 00 99 00 B0 84 33 11 37 01 A0 60 33 11 16 
        mMailInbox.Length = mailIndex + 1;                                      //003A : 0F 37 01 A0 60 33 11 92 00 B0 84 33 11 26 16 
      }
      mMailInbox[mailIndex].Status = Status;                                    //0049 : 0F 36 B0 70 33 11 10 00 B0 84 33 11 01 A0 60 33 11 00 18 86 33 11 
      mMailInbox[mailIndex].sender = quest.Provider.GetLongName();              //005F : 0F 36 A0 71 33 11 10 00 B0 84 33 11 01 A0 60 33 11 19 19 00 28 85 33 11 05 00 04 01 70 4E 2E 11 06 00 00 1B 98 0C 00 00 16 
      mMailInbox[mailIndex].Recipient = Game_Pawn(Outer.Pawn).Character.sv_GetName();//0088 : 0F 36 18 72 33 11 10 00 B0 84 33 11 01 A0 60 33 11 19 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 68 2E 34 0F 06 00 00 1C 78 E1 18 11 16 
      mMailInbox[mailIndex].Subject = quest.Name.Text;                          //00BF : 0F 36 08 73 33 11 10 00 B0 84 33 11 01 A0 60 33 11 36 58 C6 6B 0F 19 00 28 85 33 11 05 00 0C 01 70 57 2E 11 
      mMailInbox[mailIndex].TimeStamp = TimeStamp;                              //00E3 : 0F 36 F8 73 33 11 10 00 B0 84 33 11 01 A0 60 33 11 00 90 86 33 11 
      mMailInbox[mailIndex].Details = False;                                    //00F9 : 14 2D 36 38 7B 33 11 10 00 B0 84 33 11 01 A0 60 33 11 28 
      mMailInbox[mailIndex].quest = quest;                                      //010C : 0F 36 28 60 33 11 10 00 B0 84 33 11 01 A0 60 33 11 00 28 85 33 11 
    }
    //0F 00 28 85 33 11 2E F0 9D 5C 01 12 20 30 82 24 01 0B 00 04 1B E5 0B 00 00 00 A0 85 33 11 16 07 
    //22 01 77 00 28 85 33 11 2A 16 07 49 00 99 00 B0 84 33 11 37 01 A0 60 33 11 16 0F 37 01 A0 60 33 
    //11 92 00 B0 84 33 11 26 16 0F 36 B0 70 33 11 10 00 B0 84 33 11 01 A0 60 33 11 00 18 86 33 11 0F 
    //36 A0 71 33 11 10 00 B0 84 33 11 01 A0 60 33 11 19 19 00 28 85 33 11 05 00 04 01 70 4E 2E 11 06 
    //00 00 1B 98 0C 00 00 16 0F 36 18 72 33 11 10 00 B0 84 33 11 01 A0 60 33 11 19 19 2E 18 38 5B 01 
    //19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 05 00 04 01 68 2E 34 0F 06 00 00 1C 78 E1 18 11 16 0F 
    //36 08 73 33 11 10 00 B0 84 33 11 01 A0 60 33 11 36 58 C6 6B 0F 19 00 28 85 33 11 05 00 0C 01 70 
    //57 2E 11 0F 36 F8 73 33 11 10 00 B0 84 33 11 01 A0 60 33 11 00 90 86 33 11 14 2D 36 38 7B 33 11 
    //10 00 B0 84 33 11 01 A0 60 33 11 28 0F 36 28 60 33 11 10 00 B0 84 33 11 01 A0 60 33 11 00 28 85 
    //33 11 04 0B 47 
  }


  protected native function sv2cl_UpdateInbox_CallStub();


  event sv2cl_UpdateInbox(int mailIndex,int MailID,int Status,string sender,string Subject,int TimeStamp,bool Attached) {
    if (mailIndex >= mMailInbox.Length) {                                       //0000 : 07 1F 00 99 00 68 88 33 11 37 01 A0 60 33 11 16 
      mMailInbox.Length = mailIndex + 1;                                        //0010 : 0F 37 01 A0 60 33 11 92 00 68 88 33 11 26 16 
    }
    mMailInbox[mailIndex].MailID = MailID;                                      //001F : 0F 36 C0 6F 33 11 10 00 68 88 33 11 01 A0 60 33 11 00 48 8A 33 11 
    mMailInbox[mailIndex].Status = Status;                                      //0035 : 0F 36 B0 70 33 11 10 00 68 88 33 11 01 A0 60 33 11 00 C0 8A 33 11 
    mMailInbox[mailIndex].sender = sender;                                      //004B : 0F 36 A0 71 33 11 10 00 68 88 33 11 01 A0 60 33 11 00 38 8B 33 11 
    mMailInbox[mailIndex].Recipient = Game_Pawn(Outer.Pawn).GetCharacterName(); //0061 : 0F 36 18 72 33 11 10 00 68 88 33 11 01 A0 60 33 11 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 06 00 00 1B 67 05 00 00 16 
    mMailInbox[mailIndex].Subject = Subject;                                    //008F : 0F 36 08 73 33 11 10 00 68 88 33 11 01 A0 60 33 11 00 B0 8B 33 11 
    mMailInbox[mailIndex].TimeStamp = TimeStamp;                                //00A5 : 0F 36 F8 73 33 11 10 00 68 88 33 11 01 A0 60 33 11 00 28 8C 33 11 
    mMailInbox[mailIndex].Attached = Attached;                                  //00BB : 14 2D 36 E8 74 33 11 10 00 68 88 33 11 01 A0 60 33 11 2D 00 A0 8C 33 11 
    mMailInbox[mailIndex].Details = False;                                      //00D3 : 14 2D 36 38 7B 33 11 10 00 68 88 33 11 01 A0 60 33 11 28 
    //07 1F 00 99 00 68 88 33 11 37 01 A0 60 33 11 16 0F 37 01 A0 60 33 11 92 00 68 88 33 11 26 16 0F 
    //36 C0 6F 33 11 10 00 68 88 33 11 01 A0 60 33 11 00 48 8A 33 11 0F 36 B0 70 33 11 10 00 68 88 33 
    //11 01 A0 60 33 11 00 C0 8A 33 11 0F 36 A0 71 33 11 10 00 68 88 33 11 01 A0 60 33 11 00 38 8B 33 
    //11 0F 36 18 72 33 11 10 00 68 88 33 11 01 A0 60 33 11 19 2E 18 38 5B 01 19 01 00 E4 6B 0F 05 00 
    //04 01 88 83 6C 0F 06 00 00 1B 67 05 00 00 16 0F 36 08 73 33 11 10 00 68 88 33 11 01 A0 60 33 11 
    //00 B0 8B 33 11 0F 36 F8 73 33 11 10 00 68 88 33 11 01 A0 60 33 11 00 28 8C 33 11 14 2D 36 E8 74 
    //33 11 10 00 68 88 33 11 01 A0 60 33 11 2D 00 A0 8C 33 11 14 2D 36 38 7B 33 11 10 00 68 88 33 11 
    //01 A0 60 33 11 28 04 0B 47 
  }


  protected native function sv2cl_UpdateInboxDetails_CallStub();


  event sv2cl_UpdateInboxDetails(int mailIndex,string Body,int aMoney,array<MailAttachment> aAttachments) {
    mMailInbox[mailIndex].Body = Body;                                          //0000 : 0F 36 68 78 33 11 10 00 78 8E 33 11 01 A0 60 33 11 00 A8 8F 33 11 
    mMailInbox[mailIndex].Attachments = aAttachments;                           //0016 : 0F 36 58 79 33 11 10 00 78 8E 33 11 01 A0 60 33 11 00 20 90 33 11 
    mMailInbox[mailIndex].Money = aMoney;                                       //002C : 0F 36 48 7A 33 11 10 00 78 8E 33 11 01 A0 60 33 11 00 98 90 33 11 
    mMailInbox[mailIndex].Details = True;                                       //0042 : 14 2D 36 38 7B 33 11 10 00 78 8E 33 11 01 A0 60 33 11 27 
    OnInboxMailDetails(mailIndex);                                              //0055 : 43 D8 5A 33 11 CF 05 00 00 00 78 8E 33 11 16 
    //0F 36 68 78 33 11 10 00 78 8E 33 11 01 A0 60 33 11 00 A8 8F 33 11 0F 36 58 79 33 11 10 00 78 8E 
    //33 11 01 A0 60 33 11 00 20 90 33 11 0F 36 48 7A 33 11 10 00 78 8E 33 11 01 A0 60 33 11 00 98 90 
    //33 11 14 2D 36 38 7B 33 11 10 00 78 8E 33 11 01 A0 60 33 11 27 43 D8 5A 33 11 CF 05 00 00 00 78 
    //8E 33 11 16 04 0B 47 
  }


  protected native function cl2sv_GetInboxDetails_CallStub();


  event cl2sv_GetInboxDetails(int mailIndex) {
    sv_SetInboxMailStatus(mailIndex,2);                                         //0000 : 1B A3 0E 00 00 00 E8 92 33 11 2C 02 16 
    sv2cl_UpdateInboxDetails_CallStub(mailIndex,mMailInbox[mailIndex].Body,mMailInbox[mailIndex].Money,mMailInbox[mailIndex].Attachments);//000D : 1B A6 0D 00 00 00 E8 92 33 11 36 68 78 33 11 10 00 E8 92 33 11 01 A0 60 33 11 36 48 7A 33 11 10 00 E8 92 33 11 01 A0 60 33 11 36 58 79 33 11 10 00 E8 92 33 11 01 A0 60 33 11 16 
    //1B A3 0E 00 00 00 E8 92 33 11 2C 02 16 1B A6 0D 00 00 00 E8 92 33 11 36 68 78 33 11 10 00 E8 92 
    //33 11 01 A0 60 33 11 36 48 7A 33 11 10 00 E8 92 33 11 01 A0 60 33 11 36 58 79 33 11 10 00 E8 92 
    //33 11 01 A0 60 33 11 16 04 0B 47 
  }


  function cl_GetInboxDetails(int mailIndex) {
    local export editinline Quest_Type quest;
    if (!mMailInbox[mailIndex].Details) {                                       //0000 : 07 F9 00 81 2D 36 38 7B 33 11 10 00 10 94 33 11 01 A0 60 33 11 16 
      mMailInbox[mailIndex].Status = mMailInbox[mailIndex].Status | 2;          //0016 : 0F 36 B0 70 33 11 10 00 10 94 33 11 01 A0 60 33 11 9E 36 B0 70 33 11 10 00 10 94 33 11 01 A0 60 33 11 2C 02 16 
      if (mMailInbox[mailIndex].quest == None) {                                //003B : 07 5F 00 72 36 28 60 33 11 10 00 10 94 33 11 01 A0 60 33 11 2A 16 
        cl2sv_GetInboxDetails_CallStub(mailIndex);                              //0051 : 1B A5 0D 00 00 00 10 94 33 11 16 
      } else {                                                                  //005C : 06 F6 00 
        quest = mMailInbox[mailIndex].quest;                                    //005F : 0F 00 20 96 33 11 36 28 60 33 11 10 00 10 94 33 11 01 A0 60 33 11 
        mMailInbox[mailIndex].Body = Outer.TextParser.Parse(quest.ProvideTopic.Conversations[0].Text.Text,quest.Provider,quest,Outer.Pawn,0);//0075 : 0F 36 68 78 33 11 10 00 10 94 33 11 01 A0 60 33 11 19 19 01 00 E4 6B 0F 05 00 04 01 50 07 1B 11 4F 00 00 1B 2F 0D 00 00 36 58 C6 6B 0F 19 10 25 19 19 00 20 96 33 11 05 00 04 01 30 5B 2E 11 05 00 00 01 D8 B7 24 11 05 00 0C 01 F8 67 30 11 19 00 20 96 33 11 05 00 04 01 70 4E 2E 11 00 20 96 33 11 19 01 00 E4 6B 0F 05 00 04 01 88 83 6C 0F 25 16 
        OnInboxMailDetails(mailIndex);                                          //00E7 : 43 D8 5A 33 11 CF 05 00 00 00 10 94 33 11 16 
      }
    } else {                                                                    //00F6 : 06 08 01 
      OnInboxMailDetails(mailIndex);                                            //00F9 : 43 D8 5A 33 11 CF 05 00 00 00 10 94 33 11 16 
    }
    //07 F9 00 81 2D 36 38 7B 33 11 10 00 10 94 33 11 01 A0 60 33 11 16 0F 36 B0 70 33 11 10 00 10 94 
    //33 11 01 A0 60 33 11 9E 36 B0 70 33 11 10 00 10 94 33 11 01 A0 60 33 11 2C 02 16 07 5F 00 72 36 
    //28 60 33 11 10 00 10 94 33 11 01 A0 60 33 11 2A 16 1B A5 0D 00 00 00 10 94 33 11 16 06 F6 00 0F 
    //00 20 96 33 11 36 28 60 33 11 10 00 10 94 33 11 01 A0 60 33 11 0F 36 68 78 33 11 10 00 10 94 33 
    //11 01 A0 60 33 11 19 19 01 00 E4 6B 0F 05 00 04 01 50 07 1B 11 4F 00 00 1B 2F 0D 00 00 36 58 C6 
    //6B 0F 19 10 25 19 19 00 20 96 33 11 05 00 04 01 30 5B 2E 11 05 00 00 01 D8 B7 24 11 05 00 0C 01 
    //F8 67 30 11 19 00 20 96 33 11 05 00 04 01 70 4E 2E 11 00 20 96 33 11 19 01 00 E4 6B 0F 05 00 04 
    //01 88 83 6C 0F 25 16 43 D8 5A 33 11 CF 05 00 00 00 10 94 33 11 16 06 08 01 43 D8 5A 33 11 CF 05 
    //00 00 00 10 94 33 11 16 04 0B 47 
  }


  native function sv_SetInboxMailStatus(int mailIndex,int Flag);


  function sv_OnSentMail(int aErrorCode) {
    sv2cl_SendMailStatus_CallStub(aErrorCode);                                  //0000 : 1B F7 0E 00 00 00 20 99 33 11 16 
    if (aErrorCode == 0) {                                                      //000B : 07 1D 00 9A 00 20 99 33 11 25 16 
      sv_RetrieveMailEntries(True);                                             //0016 : 1B 7C 0D 00 00 27 16 
    }
    //1B F7 0E 00 00 00 20 99 33 11 16 07 1D 00 9A 00 20 99 33 11 25 16 1B 7C 0D 00 00 27 16 04 0B 47 
    //
  }


  protected native function sv2cl_SendMailStatus_CallStub();


  event sv2cl_SendMailStatus(int aErrorCode) {
    OnSendMailStatus(aErrorCode);                                               //0000 : 43 18 9C 33 11 ED 05 00 00 00 50 9B 33 11 16 
    OnUpdateEntries();                                                          //000F : 43 98 6A 33 11 FE 05 00 00 16 
    //43 18 9C 33 11 ED 05 00 00 00 50 9B 33 11 16 43 98 6A 33 11 FE 05 00 00 16 04 0B 47 
  }


  protected native function cl2sv_SendMail_CallStub();


  private native event cl2sv_SendMail(string aRecipient,string aSubject,string aBody,int aMoney,array<int> aAttachedItems);


  function cl_SendMail(string aRecipient,string aSubject,string aBody,int aMoney,array<int> aAttachedItems) {
    cl2sv_SendMail_CallStub(aRecipient,aSubject,aBody,aMoney,aAttachedItems);   //0000 : 1B F8 0E 00 00 00 C0 A1 33 11 00 90 A2 33 11 00 08 A3 33 11 00 80 A3 33 11 00 F8 A3 33 11 16 
    //1B F8 0E 00 00 00 C0 A1 33 11 00 90 A2 33 11 00 08 A3 33 11 00 80 A3 33 11 00 F8 A3 33 11 16 04 
    //0B 47 
  }


  protected native function sv2cl_UpdateEntriesDone_CallStub();


  event sv2cl_UpdateEntriesDone() {
    OnUpdateEntries();                                                          //0000 : 43 98 6A 33 11 FE 05 00 00 16 
    //43 98 6A 33 11 FE 05 00 00 16 04 0B 47 
  }


  function sv_OnReceivedMailItems(int aErrorCode) {
    mRequestingMails = False;                                                   //0000 : 14 2D 01 F0 A7 33 11 28 
    sv_OnEntriesReceived();                                                     //0008 : 1B 1B 07 00 00 16 
    //14 2D 01 F0 A7 33 11 28 1B 1B 07 00 00 16 04 0B 47 
  }


  private event sv_OnEntriesReceived() {
    local int i;
    i = 0;                                                                      //0000 : 0F 00 18 A9 33 11 25 
    while (i < mMailInbox.Length) {                                             //0007 : 07 EB 00 96 00 18 A9 33 11 37 01 A0 60 33 11 16 
      if (mMailInbox[i].quest == None) {                                        //0017 : 07 9C 00 72 36 28 60 33 11 10 00 18 A9 33 11 01 A0 60 33 11 2A 16 
        sv2cl_UpdateInbox_CallStub(i,mMailInbox[i].MailID,mMailInbox[i].Status,mMailInbox[i].sender,mMailInbox[i].Subject,mMailInbox[i].TimeStamp,mMailInbox[i].Attached);//002D : 1B AA 0D 00 00 00 18 A9 33 11 36 C0 6F 33 11 10 00 18 A9 33 11 01 A0 60 33 11 36 B0 70 33 11 10 00 18 A9 33 11 01 A0 60 33 11 36 A0 71 33 11 10 00 18 A9 33 11 01 A0 60 33 11 36 08 73 33 11 10 00 18 A9 33 11 01 A0 60 33 11 36 F8 73 33 11 10 00 18 A9 33 11 01 A0 60 33 11 2D 36 E8 74 33 11 10 00 18 A9 33 11 01 A0 60 33 11 16 
      } else {                                                                  //0099 : 06 E1 00 
        sv2cl_UpdateInboxQuest_CallStub(i,mMailInbox[i].Status,mMailInbox[i].quest.GetResourceId(),mMailInbox[i].TimeStamp);//009C : 1B AC 0D 00 00 00 18 A9 33 11 36 B0 70 33 11 10 00 18 A9 33 11 01 A0 60 33 11 19 36 28 60 33 11 10 00 18 A9 33 11 01 A0 60 33 11 06 00 04 1C 08 90 20 11 16 36 F8 73 33 11 10 00 18 A9 33 11 01 A0 60 33 11 16 
      }
      ++i;                                                                      //00E1 : A3 00 18 A9 33 11 16 
    }
    i = 0;                                                                      //00EB : 0F 00 18 A9 33 11 25 
    while (i < mMailOutbox.Length) {                                            //00F2 : 07 78 01 96 00 18 A9 33 11 37 01 20 6A 33 11 16 
      sv2cl_UpdateOutbox_CallStub(i,mMailOutbox[i].MailID,mMailOutbox[i].Status,mMailOutbox[i].Recipient,mMailOutbox[i].Subject,mMailOutbox[i].TimeStamp,mMailOutbox[i].Attached);//0102 : 1B B3 0D 00 00 00 18 A9 33 11 36 C0 6F 33 11 10 00 18 A9 33 11 01 20 6A 33 11 36 B0 70 33 11 10 00 18 A9 33 11 01 20 6A 33 11 36 18 72 33 11 10 00 18 A9 33 11 01 20 6A 33 11 36 08 73 33 11 10 00 18 A9 33 11 01 20 6A 33 11 36 F8 73 33 11 10 00 18 A9 33 11 01 20 6A 33 11 2D 36 E8 74 33 11 10 00 18 A9 33 11 01 20 6A 33 11 16 
      ++i;                                                                      //016E : A3 00 18 A9 33 11 16 
    }
    sv2cl_UpdateEntriesDone_CallStub();                                         //0178 : 1B 61 0E 00 00 16 
    //0F 00 18 A9 33 11 25 07 EB 00 96 00 18 A9 33 11 37 01 A0 60 33 11 16 07 9C 00 72 36 28 60 33 11 
    //10 00 18 A9 33 11 01 A0 60 33 11 2A 16 1B AA 0D 00 00 00 18 A9 33 11 36 C0 6F 33 11 10 00 18 A9 
    //33 11 01 A0 60 33 11 36 B0 70 33 11 10 00 18 A9 33 11 01 A0 60 33 11 36 A0 71 33 11 10 00 18 A9 
    //33 11 01 A0 60 33 11 36 08 73 33 11 10 00 18 A9 33 11 01 A0 60 33 11 36 F8 73 33 11 10 00 18 A9 
    //33 11 01 A0 60 33 11 2D 36 E8 74 33 11 10 00 18 A9 33 11 01 A0 60 33 11 16 06 E1 00 1B AC 0D 00 
    //00 00 18 A9 33 11 36 B0 70 33 11 10 00 18 A9 33 11 01 A0 60 33 11 19 36 28 60 33 11 10 00 18 A9 
    //33 11 01 A0 60 33 11 06 00 04 1C 08 90 20 11 16 36 F8 73 33 11 10 00 18 A9 33 11 01 A0 60 33 11 
    //16 A3 00 18 A9 33 11 16 06 07 00 0F 00 18 A9 33 11 25 07 78 01 96 00 18 A9 33 11 37 01 20 6A 33 
    //11 16 1B B3 0D 00 00 00 18 A9 33 11 36 C0 6F 33 11 10 00 18 A9 33 11 01 20 6A 33 11 36 B0 70 33 
    //11 10 00 18 A9 33 11 01 20 6A 33 11 36 18 72 33 11 10 00 18 A9 33 11 01 20 6A 33 11 36 08 73 33 
    //11 10 00 18 A9 33 11 01 20 6A 33 11 36 F8 73 33 11 10 00 18 A9 33 11 01 20 6A 33 11 2D 36 E8 74 
    //33 11 10 00 18 A9 33 11 01 20 6A 33 11 16 A3 00 18 A9 33 11 16 06 F2 00 1B 61 0E 00 00 16 04 0B 
    //47 
  }


  native function sv_RetrieveMailEntries(bool aForceUpdate);


  protected native function cl2sv_RequestEntries_CallStub();


  event cl2sv_RequestEntries() {
    sv_RetrieveMailEntries(False);                                              //0000 : 1B 7C 0D 00 00 28 16 
    //1B 7C 0D 00 00 28 16 04 0B 47 
  }


  delegate OnOutboxMailDetails(int mailIndex);


  delegate OnInboxMailDetails(int mailIndex);


  delegate OnUpdateEntries();


  delegate OnSendMailStatus(int aErrorCode);



