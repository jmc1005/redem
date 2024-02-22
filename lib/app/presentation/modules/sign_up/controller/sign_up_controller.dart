import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/http/result.dart';
import '../../../../domain/models/user/user.dart';
import '../../../../domain/repository/user_repo.dart';
import '../../../global/controllers/session_user_controller.dart';
import '../../../global/state_notifier.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/routes.dart';
import '../../start_up/controller/state/sign_up_state.dart';

class SignUpController extends StateNotifier<SignUpState> {
  SignUpController(
    super.state, {
    required this.userRepo,
    required this.context,
  });

  final UserRepo userRepo;
  final BuildContext context;

  void onEmailChanged(String text) {
    final email = text.trim().toLowerCase();
    onlyUpdate(state.copyWith(email: email));
  }

  void onPasswordChanged(String text) {
    final password = text.trim();
    onlyUpdate(state.copyWith(password: password));
  }

  Future<void> submit() async {
    final UserRepo userRepo = context.read();

    final result = await userRepo.signUp(state.email, state.password);

    final value = switch (result) {
      Success(value: final user) => user,
      Failure(exception: final exception) => exception,
    };

    if (value is User) {
      goToRegister(value);
    } else if (value is Exception) {
      mostrarError(value);
    }
  }

  void goToRegister(User value) {
    final SessionUserController sessionController = context.read();
    sessionController.user = value;
    navigateTo(Routes.userDetail, context);
  }

  void mostrarError(Exception exception) {
    final snackBar = SnackBar(content: Text(exception.toString()));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
