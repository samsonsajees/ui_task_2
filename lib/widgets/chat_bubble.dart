import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/constants/app_text_styles.dart';
import 'package:ui_task_2/models/message_model.dart';
import 'dart:io';

class ChatBubble extends StatelessWidget {
  final MessageModel message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {

    final isImage = message.type == MessageType.image;

    return Align(
      alignment: message.isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: isImage 
            ? const EdgeInsets.all(4)
            : const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.68,
        ),

        decoration: BoxDecoration(
          color: message.isMyMessage ? AppColors.primaryBlue : AppColors.friendChatBubble,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: message.isMyMessage ? const Radius.circular(16) : Radius.zero,
            bottomRight: message.isMyMessage ? Radius.zero : const Radius.circular(16),
          ),
        ),
        child: isImage 
            ? ImageBubbleContent(path: message.message) 
            : TextBubbleContent(
                text: message.message, 
                isMyMessage: message.isMyMessage
              ),
      ),
    );
  }
}

class TextBubbleContent extends StatelessWidget {
  final String text;
  final bool isMyMessage;

  const TextBubbleContent({
    super.key, 
    required this.text, 
    required this.isMyMessage
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.bodyM.copyWith(
        color: isMyMessage ? AppColors.white : AppColors.listText,
        fontSize: 15,
      ),
    );
  }
}

class ImageBubbleContent extends StatelessWidget {
  final String path;

  const ImageBubbleContent({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.file(
        File(path),
        fit: BoxFit.cover,
      ),
    );
  }
}