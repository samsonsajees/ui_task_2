import 'message_model.dart';

class ChatModel {
  final String partnerName;
  final String avatar; 
  final String subTitle; 
  final int unreadCount;
  final List<MessageModel> messages;

  ChatModel({
    required this.partnerName,
    required this.avatar,
    required this.subTitle,
    required this.unreadCount,
    required this.messages,
  });
}