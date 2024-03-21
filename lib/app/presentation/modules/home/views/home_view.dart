import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../global/controllers/session_user_controller.dart';
import '../../../global/widgets/app_bar_widget.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/routes.dart';
import '../controller/home_controller.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/central_panel_widget.dart';
import '../widgets/reminder_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SessionUserController sessionUserController = context.read();

    final List<Widget> actions = [
      IconButton(
        onPressed: () {
          navigateTo(Routes.userDetail, context);
        },
        icon: const Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
      IconButton(
        onPressed: () {
          sessionUserController.signOut();
          navigateTo(Routes.startUp, context);
        },
        icon: const Icon(
          Icons.logout,
          color: Colors.white,
        ),
      ),
    ];

    return ChangeNotifierProvider<HomeController>(
      create: (_) => HomeController(),
      child: Builder(builder: (context) {
        final controller = Provider.of<HomeController>(context);
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBarWidget(
            asset: 'assets/images/redem_white.png',
            actions: actions,
            backgroundColor: AppColors.primary,
          ),
          bottomNavigationBar: BottomNavBar(
            onTap: (index) {
              //print(index);
              controller.onCurrentIndexChange(index);
            },
            controller: controller,
          ),
          body: const SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReminderWidget(),
                  CentralPanelWidget(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
