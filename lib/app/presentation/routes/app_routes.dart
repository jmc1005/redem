import 'package:flutter/material.dart';

import '../modules/login/views/login_view.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/start_up/views/start_up_view.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.startUp: (context) => const StartUpView(),
    Routes.login: (context) => LoginView(),
    Routes.signUp: (context) => const SignUpView()
  };
}

Future<void> navigateTo(String route, BuildContext context) {
  return Navigator.pushReplacementNamed(
    context,
    route,
  );
}
