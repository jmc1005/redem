import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/http/result.dart';
import '../../../../domain/models/user/user.dart';
import '../../../../domain/repository/user_repo.dart';
import '../../../global/controllers/session_user_controller.dart';
import '../../../global/controllers/state/user_credential_state.dart';
import '../../../global/state_notifier.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/routes.dart';

class SignUpController extends StateNotifier<UserCredentialState> {
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
    state = state.copyWith(loading: true);

    final result = await userRepo.signUp(
      state.email,
      state.password,
    );

    final value = switch (result) {
      Failure(exception: final exception) => exception,
      Success(value: final user) => user,
    };

    if (value is User) {
      goTo(value);
    } else if (value is Exception) {
      mostrarError(value);
    }
  }

  void goTo(User value) {
    final SessionUserController sessionController = context.read();
    sessionController.user = value;
    navigateTo(Routes.userDetail, context);
  }

  void mostrarError(Exception exception) {
    final snackBar = SnackBar(content: Text(exception.toString()));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
