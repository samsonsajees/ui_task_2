import 'package:flutter/material.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/constants/app_text_styles.dart';
import 'package:ui_task_2/constants/chat_data.dart';
import 'package:ui_task_2/screens/chat_detail_screen.dart';
import 'package:ui_task_2/widgets/nav_bar.dart'; 

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Edit", style: AppTextStyles.actionL.copyWith(color: AppColors.primaryBlue)),
                  Text("Chats", style: AppTextStyles.h3.copyWith(color: AppColors.greyDarkest)),
                  Icon(Icons.edit_square, color: AppColors.primaryBlue, size: 24),
                ],
              ),
            ),

            // SEARCH BAR 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.searchBar, 
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Icon(Icons.search_rounded, color: AppColors.searchIcon, size: 22),
                    const SizedBox(width: 12),
                    Text("Search", style: AppTextStyles.bodyL.copyWith(color: AppColors.greyLightest)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // CHAT LIST
            Expanded(
              child: ListView.separated(
                itemCount: ChatData.allChats.length,
                separatorBuilder: (ctx, i) => Divider(height: 1, indent: 82, color: AppColors.divider),
                itemBuilder: (context, index) {
                  final chat = ChatData.allChats[index];
                  
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatDetailScreen(chat: chat),
                        ),
                      );
                    },
                    // Avatar
                    leading: CircleAvatar(
                      radius: 24,
                      backgroundColor: AppColors.selected,
                      child: Icon(Icons.person, color: AppColors.chatIcons, size: 40),
                    ),
                    // Name
                    title: Text(
                      chat.partnerName,
                      style: AppTextStyles.h4.copyWith(color: AppColors.listText),
                    ),
                    // Subtitle
                    subtitle: Text(
                      chat.subTitle,
                      style: AppTextStyles.bodyM.copyWith(color: AppColors.greyLight),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Unread Badge
                    trailing: chat.unreadCount > 0
                        ? Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.primaryBlue,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              chat.unreadCount.toString(),
                              style: AppTextStyles.captionM.copyWith(color: AppColors.white),
                            ),
                          )
                        : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // BOTTOM NAV
      bottomNavigationBar: Container(
        height: 88, // Typical height for modern nav bars
        padding: const EdgeInsets.only(top: 12, bottom: 24, left: 16, right: 16), // Space for labels and safe area
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border(
            top: BorderSide(color: AppColors.divider, width: 1),
          ),
        ),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomNavItem(
            icon: Icons.chat_bubble_rounded,
            label: "Chats",
            isSelected: true,
            onTap: () {},
          ),
          CustomNavItem(
            icon: Icons.person_rounded,
            label: "Friends",
            isSelected: false,
            onTap: () {},
          ),
          CustomNavItem(
            icon: Icons.settings_rounded,
            label: "Settings",
            isSelected: false,
            onTap: () {},
          ),
        ],
        ),
      ),
    );
  }
}