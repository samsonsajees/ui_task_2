import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/constants/app_text_styles.dart';
import 'package:ui_task_2/constants/chat_data.dart';
import 'package:ui_task_2/screens/chat_detail_screen.dart';
import 'package:ui_task_2/widgets/search_bar.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen>  with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSearchBar(),
        const SizedBox(height: 12),
        Expanded(
          child: ListView.builder(
            itemCount: ChatData.allChats.length,
            itemBuilder: (context, index) {
              final chat = ChatData.allChats[index];
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatDetailScreen(
                        chat: chat,
                        onMessageSent: () => {setState(() {})},
                      ),
                    ),
                  );
                },
                leading: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: 42, height: 42,
                      color: AppColors.selected,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SvgPicture.asset('assets/icons/avatar.svg', width: 33, height: 33, fit: BoxFit.contain),
                      ),
                    ),
                  ),
                ),

                title: Text(
                  chat.partnerName, 
                  style: AppTextStyles.h4.copyWith(color: AppColors.listText)),
                
                subtitle: Text(
                  chat.subTitle, 
                  style: AppTextStyles.bodyM.copyWith(color: AppColors.greyLight), 
                  maxLines: 2, 
                  overflow: TextOverflow.ellipsis
                ),
                
                trailing: chat.unreadCount > 0
                    ? Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: AppColors.primaryBlue, shape: BoxShape.circle),
                        child: Text(chat.unreadCount.toString(), style: AppTextStyles.captionM.copyWith(color: AppColors.white)),
                      )
                    : null,
              );
            },
          ),
        ),
      ],
    );
  }
}