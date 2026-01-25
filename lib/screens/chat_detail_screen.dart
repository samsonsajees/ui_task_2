import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/constants/app_text_styles.dart';
import 'package:ui_task_2/models/chat_model.dart';
import 'package:ui_task_2/widgets/chat_bubble.dart';

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
           style: AppTextStyles.h4.copyWith(color: AppColors.greyDarkest, fontSize: 16)
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
        // App bar and chat divider
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: AppColors.divider, height: 1.0),
        ),
      ),
      body: Column(
        children: [
          // MESSAGES LIST
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: widget.chat.messages.length,
              itemBuilder: (context, index) {
                final msg = widget.chat.messages[index];
                return ChatBubble(message: msg);
              },
            ),
          ),

          // INPUT AREA
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
                        color: AppColors.searchBar,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: TextField(
                        controller: _controller,
                        style: AppTextStyles.bodyM.copyWith(color: AppColors.greyDarkest),
                        cursorColor: AppColors.primaryBlue,
                        decoration: InputDecoration(
                          hintText: "Type a message...",
                          hintStyle: AppTextStyles.bodyM.copyWith(color: AppColors.greyLightest,fontSize: 15),
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
                      child: const Icon(Icons.send, color: Colors.white, size: 16),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}