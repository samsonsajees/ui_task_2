import 'message_model.dart';

class ChatModel {
  final String partnerName;
  final String avatar; // For the profile picture
  final String subTitle; // The gray text in the list
  final int unreadCount; // The blue badge count
  final List<MessageModel> messages;

  ChatModel({
    required this.partnerName,
    required this.avatar,
    required this.subTitle,
    required this.unreadCount,
    required this.messages,
  });
}