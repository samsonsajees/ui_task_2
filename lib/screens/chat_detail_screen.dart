import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/constants/app_text_styles.dart';
import 'package:ui_task_2/models/chat_model.dart';
import 'package:ui_task_2/widgets/chat_bubble.dart';
import 'package:ui_task_2/widgets/custom_app_bar.dart';
import 'package:flutter_svg/svg.dart';

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

      appBar: CustomAppBar(
        title: widget.chat.partnerName,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.primaryBlue, size: 20),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: 42,
            height: 42,
            color: AppColors.selected,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                'assets/icons/avatar.svg',
                 width: 33,
                 height: 33,
                 fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        showDivider: false,
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