enum MessageType { text, image }

class MessageModel {
  final String message;  // Stores "Text" OR "File Path"
  final bool isMyMessage;
  final MessageType type;
  final bool read;

  MessageModel({
    required this.message,
    required this.isMyMessage,
    this.type = MessageType.text,
    this.read = false,
  });
}