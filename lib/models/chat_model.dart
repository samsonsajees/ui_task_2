import 'package:ui_task_2/models/message_model.dart';

class ChatModel {
  final String partnerName;
  final String avatar;
  final int unreadCount;
  final List<MessageModel> messages;

  ChatModel({
    required this.partnerName,
    required this.avatar,
    required this.unreadCount,
    required this.messages,
  });

  // DYNAMIC GETTER: Calculates the subtitle every time the screen builds
  String get subTitle 
  {
    if (messages.isEmpty) 
    {
      return "No messages yet";
    }
    
    final lastMsg = messages.last;
    
    if (lastMsg.type == MessageType.image) 
    {
      return "Sent an image";
    }
    
    return lastMsg.message;
  }
}