import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_task_2/constants/app_colors.dart';
import 'package:ui_task_2/constants/app_text_styles.dart';
import 'package:ui_task_2/widgets/nav_bar.dart'; 
import 'package:ui_task_2/widgets/custom_app_bar.dart';
import 'package:ui_task_2/screens/friends_screen.dart';
import 'package:ui_task_2/screens/settings_screen.dart';
import 'package:ui_task_2/screens/chat_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  late TabController _tabController;
  int _selectedIndex = 0;
  final List<String> _titles = ["Chats", "Friends", "Settings"];

  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.animation!.addListener(() {

      if (!_tabController.indexIsChanging) { // Avoids double-update during tap animation

        final int value = _tabController.animation!.value.round();
        if (value != _selectedIndex) {
          setState(() {
            _selectedIndex = value;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onNavTapped(int index) {
    setState(() => _selectedIndex = index);
    _tabController.animateTo(
      index, 
      
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      
      appBar: CustomAppBar(
        
        title: _titles[_selectedIndex],
        
        leading: GestureDetector(
          onTap: () => print("Edit tapped"),

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
          onTap: () => print("New chat tapped"),

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
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ChatsScreen(),  
                FriendsScreen(), 
                SettingsScreen(), 
              ],
            ),
          ),

          
          Container(
            height: 88,
            padding: const EdgeInsets.only(top: 12, bottom: 24, left: 16, right: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                CustomNavBar(
                  icon: SvgPicture.asset(
                    'assets/icons/Icon.svg', 
                    width: 24, 
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      _selectedIndex == 0 ? AppColors.primaryBlue : AppColors.divider, 
                      BlendMode.srcIn
                    ),
                  ),
                  label: "Chats",
                  isSelected: _selectedIndex == 0,
                  onTap: () => _onNavTapped(0),
                ),
                
                CustomNavBar(
                  icon: SvgPicture.asset(
                    'assets/icons/Iconfriend.svg', 
                    width: 24, 
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      _selectedIndex == 1 ? AppColors.primaryBlue : AppColors.divider, 
                      BlendMode.srcIn
                    ),
                  ),
                  label: "Friends",
                  isSelected: _selectedIndex == 1,
                  onTap: () => _onNavTapped(1),
                ),
                
                CustomNavBar(
                  icon: SvgPicture.asset(
                    'assets/icons/Iconsettings.svg', 
                    width: 24, 
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      _selectedIndex == 2 ? AppColors.primaryBlue : AppColors.divider, 
                      BlendMode.srcIn
                    ),
                  ),
                  label: "Settings",
                  isSelected: _selectedIndex == 2,
                  onTap: () => _onNavTapped(2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}