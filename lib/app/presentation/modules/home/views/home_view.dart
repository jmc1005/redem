import 'dart:developer';

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
    final SessionUserController sessionController = context.read();
    final user = sessionController.state!;

    log(user.firstName);

    return ChangeNotifierProvider<HomeController>(
      create: (_) => HomeController(),
      child: Builder(builder: (context) {
        final controller = Provider.of<HomeController>(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0, // desactivar sombra appbar
            titleTextStyle: const TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
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
                onPressed: () {},
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
