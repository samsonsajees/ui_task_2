import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/constants/app_text_styles.dart';
import 'package:ui_task_2/models/chat_model.dart';
import 'package:ui_task_2/models/message_model.dart';

class ChatDetailScreen extends StatefulWidget {
  final ChatModel chat;

  const ChatDetailScreen({super.key, required this.chat});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isTyping = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: BackButton(color: AppColors.primaryBlue),
        centerTitle: true,
        title: Text(
           widget.chat.partnerName, 
           style: AppTextStyles.h4.copyWith(color: AppColors.greyDarkest)
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.progress,
              backgroundImage: NetworkImage(widget.chat.avatar),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: AppColors.divider, height: 1.0),
        ),
      ),
      body: Column(
        children: [
          // ---------------- MESSAGES LIST ----------------
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: widget.chat.messages.length,
              itemBuilder: (context, index) {
                final msg = widget.chat.messages[index];
                return _buildMessageBubble(msg);
              },
            ),
          ),

          // ---------------- INPUT AREA ----------------
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Icon(Icons.add, color: AppColors.primaryBlue, size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: AppColors.progress, // Using progress for input background
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: TextField(
                        controller: _controller,
                        style: AppTextStyles.bodyM.copyWith(color: AppColors.greyDarkest),
                        cursorColor: AppColors.primaryBlue,
                        decoration: InputDecoration(
                          hintText: "Type a message...",
                          hintStyle: AppTextStyles.bodyM.copyWith(color: AppColors.greyLight),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        onChanged: (val) {
                          setState(() {
                            _isTyping = val.isNotEmpty;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  if (_isTyping)
                    CircleAvatar(
                      backgroundColor: AppColors.primaryBlue,
                      radius: 18,
                      child: const Icon(Icons.send, color: Colors.white, size: 18),
                    )
                  else
                    Icon(Icons.camera_alt_outlined, color: AppColors.primaryBlue, size: 28),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(MessageModel msg) {
    return Align(
      alignment: msg.isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          // Logic: Blue for me, Light Grey (progress) for them
          color: msg.isMyMessage ? AppColors.primaryBlue : AppColors.progress,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: msg.isMyMessage ? const Radius.circular(16) : Radius.zero,
            bottomRight: msg.isMyMessage ? Radius.zero : const Radius.circular(16),
          ),
        ),
        child: Text(
          msg.message,
          style: AppTextStyles.bodyM.copyWith(
            // Logic: White text on Blue, Dark text on Grey
            color: msg.isMyMessage ? AppColors.white : AppColors.greyDarkest,
          ),
        ),
      ),
    );
  }
}