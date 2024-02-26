import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/controllers/session_user_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/routes.dart';
import '../controller/home_controller.dart';
import '../widgets/article_list.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/floating_expand_menu.dart';

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

    return ChangeNotifierProvider<HomeController>(
      create: (_) => HomeController(),
      child: Builder(builder: (context) {
        final controller = Provider.of<HomeController>(context);
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            title: Image.asset(
              'assets/images/redem_white.png',
              width: 56,
            ),
            centerTitle: true,
            actions: [
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
            ],
          ),
          floatingActionButton: FloatingExpandMenu(
            distance: 100,
            children: controller.actionButtonList,
          ),
          bottomNavigationBar: BottomNavBar(
            onTap: (index) {
              //print(index);
              controller.onCurrentIndexChange(index);
            },
            controller: controller,
          ),
          body: const SafeArea(
            child: ArticleList(),
          ),
        );
      }),
    );
  }
}
