import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'app/data/http/api.dart';
import 'app/data/repository/connection_repo_impl.dart';
import 'app/data/repository/user_repo_impl.dart';
import 'app/data/services/local/session_service.dart';
import 'app/data/services/remote/check_connection.dart';
import 'app/data/services/remote/user_api.dart';
import 'app/domain/repository/connection_repo.dart';
import 'app/domain/repository/user_repo.dart';
import 'app/presentation/global/controllers/session_lang_controller.dart';
import 'app/presentation/global/controllers/session_user_controller.dart';
import 'app/utils/constants/app_constants.dart';
import 'app_redem.dart';

void main() {
  final sessionService = SessionService(const FlutterSecureStorage());

  runApp(
    MultiProvider(
      providers: [
        Provider<ConnectionRepo>(
          create: (_) => ConnectionRepoImpl(
            Connectivity(),
            CheckConnection(),
          ),
        ),
        Provider<UserRepo>(
          create: (_) => UserRepoImpl(
            UserApi(
              Api(
                client: Client(),
                baseUrl: AppConstants.baseUrl,
              ),
            ),
            sessionService,
          ),
        ),
        ChangeNotifierProvider<SessionUserController>(
          create: (context) => SessionUserController(userRepo: context.read()),
        ),
        ChangeNotifierProvider<SessionLangController>(
          create: (context) => SessionLangController(
            langCode: const Locale('es').languageCode,
          ),
        )
      ],
      child: const AppRedem(),
    ),
  );
}
