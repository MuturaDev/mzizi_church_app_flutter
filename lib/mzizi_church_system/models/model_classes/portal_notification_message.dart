class PortalNotificationMessage {
  int MsgID;
  String Msg;
  String DateSent;

  bool isRead;
  bool msgIsTransaction;
  bool msgIsEvents;
  bool msgIsResults;
  bool msgIsChat;

  PortalNotificationMessage(
    this.MsgID,
    this.Msg,
    this.DateSent,
    this.isRead, {
    this.msgIsTransaction,
    this.msgIsEvents,
    this.msgIsResults,
    this.msgIsChat,
  });

  @override
  String toString() {
    return 'PortalNotificationMessage MsgID: $MsgID, Msg: $Msg, DateSent: $DateSent, isRead: $isRead, msgIsTransaction: $msgIsTransaction, msgIsEvents: $msgIsEvents, msgResults: $msgIsResults';
  }
}
