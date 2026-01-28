import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/constants/app_text_styles.dart';
import 'package:ui_task_2/constants/chat_data.dart';
import 'package:ui_task_2/screens/chat_detail_screen.dart';
import 'package:ui_task_2/widgets/nav_bar.dart'; 
import 'package:ui_task_2/widgets/custom_app_bar.dart';
import 'package:ui_task_2/widgets/search_bar.dart';


class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      
      appBar: CustomAppBar(
        
        title: "Chats",
        
        leading: GestureDetector(
          onTap: () {
            print("Edit tapped");
          }, 
          child: Container(
            height:30, 
            width: 30, 
            padding: const EdgeInsets.all(5), 
            child: Text(
              "Edit", 
              style: AppTextStyles.actionL.copyWith(color: AppColors.primaryBlue)
            )
          )
        ),
        
        trailing: GestureDetector(
          onTap: () {
            print("New chat tapped");
          },
          child: Container(
            height: 30,
            width: 30,
            padding: const EdgeInsets.all(5),
            child: SvgPicture.asset(
              'assets/icons/editbutton.svg',
              width: 20,
              height: 20,
            ),
          ),
        ),
        showDivider: false,
      ),


      body: Column(
        children: [
      
          // SEARCH BAR 
          CustomSearchBar(),
      
          const SizedBox(height: 12),
      
          // CHAT LIST
          Expanded(
            child: ListView.builder(
              itemCount: ChatData.allChats.length,
              //separatorBuilder: (ctx, i) => Divider(height: 1, indent: 82, color: AppColors.divider),
              itemBuilder: (context, index) {
                final chat = ChatData.allChats[index];
                
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  onTap: () async {
                    //chat.messages.add(
                      //MessageModel(message: "Seen your message", isMyMessage: false)
                    //);
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatDetailScreen(
                          chat: chat,
                          onMessageSent: () {
                            setState(() {});
                          },
                        ),
                      ),
                    );
                  },
                  leading: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ClipRRect(
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

      // BOTTOM NAV
      bottomNavigationBar: Container(
        height: 88,
        padding: const EdgeInsets.only(top: 12, bottom: 24, left: 16, right: 16),
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
            icon: SvgPicture.asset(
              'assets/icons/Icon.svg',
              width: 24,
              height: 24,
            ),
            label: "Chats",
            isSelected: true,
            onTap: () {
              print("Chats tapped");
            },
          ),
          CustomNavItem(
            icon: SvgPicture.asset(
              'assets/icons/Iconfriend.svg',
              width: 24,
              height: 24,
            ),
            label: "Friends",
            isSelected: false,
            onTap: () {
              print("Friends tapped");
            },
          ),
          CustomNavItem(
            icon: SvgPicture.asset(
              'assets/icons/Iconsettings.svg',
              width: 24,
              height: 24,
            ),
            label: "Settings",
            isSelected: false,
            onTap: () {
              print("Settings tapped");
            },
          ),
        ],
        ),
      ),
    );
  }
}