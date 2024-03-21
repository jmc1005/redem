import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../global/controllers/session_symptom_controller.dart';
import '../../../global/controllers/session_user_controller.dart';
import '../../../global/widgets/app_bar_widget.dart';
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
    final SessionSymptomController sessionSymptomController = context.read();

    return ChangeNotifierProvider<UserDetailController>(
      create: (_) => UserDetailController(
          context: context,
          sessionUserController: sessionUserController,
          sessionSymptomController: sessionSymptomController,
          currentStep: 0,
          selectedSymptoms: [],
          deleteSymptoms: []),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBarWidget(
            asset: 'assets/images/redem_white.png',
            leading: IconButton(
              onPressed: () {
                navigateTo(Routes.home, context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            backgroundColor: AppColors.primary,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Builder(builder: (context) {
              final UserDetailController userDetailController = context.read();

              return Column(
                children: [
                  Expanded(
                    child: StepperWidget(
                      userDetailController: userDetailController,
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
