import 'dart:developer';

import '../../../../data/http/result.dart';
import '../../../../domain/models/user/user.dart';
import '../../../../domain/repository/user_repo.dart';
import '../../../global/state_notifier.dart';
import 'state/login_state.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(super.state, {required this.userRepo});

  final UserRepo userRepo;
  void onEmailChanged(String text) {
    final email = text.trim().toLowerCase();
    onlyUpdate(state.copyWith(email: email));
  }

  void onPasswordChanged(String text) {
    final password = text.trim();
    onlyUpdate(state.copyWith(password: password));
  }

  Future<Result<User, Exception>> submit() async {
    state = state.copyWith(loading: true);

    final result = await userRepo.login(
      state.email,
      state.password,
    );

    final value = switch (result) {
      Failure() => state = state.copyWith(loading: false),
      Success(value: final User _) => null
    };

    if (value != null) log('loading ${value.loading}');

    return result;
  }
}
