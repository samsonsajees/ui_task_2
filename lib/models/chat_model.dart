import 'message_model.dart';

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

  String get subTitle => messages.isNotEmpty ? messages.last.message : '';
}