import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../data/http/result.dart';
import '../../../../domain/models/user/user.dart';
import '../../../../domain/repository/user_repo.dart';
import '../../../../utils/http/http_response.dart';
import '../../../global/controllers/session_user_controller.dart';
import '../../../global/controllers/state/user_credential_state.dart';
import '../../../global/state_notifier.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/routes.dart';

class LoginController extends StateNotifier<UserCredentialState> {
  LoginController(
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
    final SessionUserController sessionController = context.read();
    state = state.copyWith(loading: true);

    final result = await userRepo.login(
      state.email,
      state.password,
    );

    final value = switch (result) {
      Failure(exception: final exception) => exception,
      Success(value: final User user) => user
    };

    final role = await sessionController.sessionService.role;

    if (value is User) {
      sessionController.user = value;
      goTo(role);
    } else if (value is int) {
      mostrarError(value);
    }
  }

  void goTo(String? role) {
    if (role != null && role == 'admin') {
      navigateTo(Routes.admin, context);
    } else {
      navigateTo(Routes.home, context);
    }
  }

  void mostrarError(int statusCode) {
    final language = AppLocalizations.of(context)!;

    final httpResponse = HttpResponse(
      context: context,
      language: language,
      statusCode: statusCode,
    );

    httpResponse.showError();
  }
}
