import 'package:flutter/material.dart';

import '../modules/start_up/views/start_up_view.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.startUp: (context) => const StartUpView(),
  };
}

Future<void> navigateTo(String route, BuildContext context) {
  return Navigator.pushReplacementNamed(
    context,
    route,
  );
}
