import 'package:flutter/material.dart';

import '../modules/admin/views/admin_view.dart';
import '../modules/article/views/article_detail_view.dart';
import '../modules/article/views/articles_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/views/login_view.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/start_up/views/start_up_view.dart';
import '../modules/user_detail/views/user_detail_view.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.startUp: (context) => const StartUpView(),
    Routes.login: (context) => LoginView(),
    Routes.signUp: (context) => const SignUpView(),
    Routes.userDetail: (context) => const UserDetailView(),
    Routes.home: (context) => const HomeView(),
    Routes.admin: (context) => const AdminView(),
    Routes.articles: (context) => const ArticlesView(),
    Routes.articleDetail: (context) => const ArticleDetailView(),
  };
}

Future<void> navigateTo(String route, BuildContext context) {
  return Navigator.pushReplacementNamed(
    context,
    route,
  );
}
