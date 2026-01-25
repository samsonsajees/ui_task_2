import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/constants/app_text_styles.dart';
import 'package:ui_task_2/models/message_model.dart';

class ChatBubble extends StatelessWidget {
  final MessageModel message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    
    return Align(
      
      alignment: message.isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
      
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        
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
        child: Text(
          message.message,
          style: AppTextStyles.bodyM.copyWith(
            color: message.isMyMessage ? AppColors.white : AppColors.listText,
            fontSize: 15
          ),
        ),
      ),
    );
  }
}