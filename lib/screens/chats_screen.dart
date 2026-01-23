import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/constants/app_text_styles.dart';
import 'package:ui_task_2/constants/chat_data.dart';
import 'package:ui_task_2/screens/chat_detail_screen.dart'; 

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ---------------- HEADER ----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Edit", style: AppTextStyles.actionL.copyWith(color: AppColors.primaryBlue)),
                  Text("Chats", style: AppTextStyles.h3.copyWith(fontSize: 18, color: AppColors.greyDarkest)),
                  Icon(Icons.edit_square, color: AppColors.primaryBlue, size: 20),
                ],
              ),
            ),

            // ---------------- SEARCH BAR ----------------
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
                    Text("Search", style: AppTextStyles.bodyM.copyWith(color: AppColors.greyLightest, fontSize: 15)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // ---------------- CHAT LIST ----------------
            Expanded(
              child: ListView.separated(
                itemCount: ChatData.allChats.length,
                separatorBuilder: (ctx, i) => Divider(height: 1, indent: 82, color: AppColors.divider),
                itemBuilder: (context, index) {
                  final chat = ChatData.allChats[index];
                  
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
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
                      child: Icon(Icons.person, color: AppColors.chatIcons, size: 32),
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
                            padding: const EdgeInsets.all(6),
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
      // ---------------- BOTTOM NAV ----------------
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: AppColors.greyLight,
        backgroundColor: AppColors.white,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: "Chats"),
          BottomNavigationBarItem(icon: Icon(Icons.people_outline), label: "Friends"),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: "Settings"),
        ],
      ),
    );
  }
}