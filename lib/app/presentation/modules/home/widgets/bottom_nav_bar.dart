import 'package:border_bottom_navigation_bar/border_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../../config/colors/app_colors.dart';
import '../controller/home_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.onTap,
    required this.controller,
  });

  final Function(int) onTap;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return BorderBottomNavigationBar(
      height: 53,
      borderRadiusValue: 8,
      selectedLabelColor: Colors.white,
      unselectedLabelColor: Colors.white,
      selectedBackgroundColor: AppColors.primary,
      unselectedBackgroundColor: Colors.white,
      unselectedIconColor: Colors.black54,
      selectedIconColor: Colors.white,
      onTap: onTap,
      currentIndex: controller.currentIndex,
      customBottomNavItems: [
        BorderBottomNavigationItems(
          icon: Icons.home,
        ),
        BorderBottomNavigationItems(
          icon: Icons.monitor,
        ),
        BorderBottomNavigationItems(
          icon: Icons.person,
        ),
        BorderBottomNavigationItems(
          icon: Icons.medical_services_outlined,
        ),
        BorderBottomNavigationItems(
          icon: Icons.tips_and_updates_outlined,
        ),
      ],
    );
  }
}
