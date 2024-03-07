import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/controllers/session_user_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/routes.dart';
import '../controller/user_detail_controller.dart';
import '../widgets/stepper_widget.dart';

class UserDetailView extends StatefulWidget {
  const UserDetailView({super.key});

  @override
  State<UserDetailView> createState() => _UserDetailViewState();
}

class _UserDetailViewState extends State<UserDetailView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SessionUserController sessionUserController = context.read();

    return ChangeNotifierProvider<UserDetailController>(
      create: (_) => UserDetailController(
          context: context,
          sessionUserController: sessionUserController,
          currentStep: 0),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            leading: IconButton(
              onPressed: () {
                navigateTo(Routes.home, context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            title: Image.asset(
              'assets/images/redem_white.png',
              width: 56,
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Builder(builder: (context) {
              final UserDetailController userDetailController = context.read();

              return Form(
                child: Column(
                  children: [
                    Expanded(
                      child: StepperWidget(
                        userDetailController: userDetailController,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
