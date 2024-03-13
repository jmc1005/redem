import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'app/data/http/api.dart';
import 'app/data/repository/connection_repo_impl.dart';
import 'app/data/repository/symptom_repo_impl.dart';
import 'app/data/repository/user_repo_impl.dart';
import 'app/data/services/local/session_service.dart';
import 'app/data/services/remote/check_connection.dart';
import 'app/data/services/remote/symptom_api.dart';
import 'app/data/services/remote/user_api.dart';
import 'app/domain/repository/connection_repo.dart';
import 'app/domain/repository/symptom_repo.dart';
import 'app/domain/repository/user_repo.dart';
import 'app/presentation/global/controllers/session_symptom_controller.dart';
import 'app/presentation/global/controllers/session_user_controller.dart';
import 'app/presentation/modules/start_up/controller/start_up_controller.dart';
import 'app/utils/constants/app_constants.dart';
import 'app_redem.dart';
import 'firebase_options.dart';

void main() async {
  final sessionService = SessionService(const FlutterSecureStorage());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        Provider<SymptomRepo>(
          create: (_) => SymptomRepoImpl(
            SymptomApi(
              Api(
                client: Client(),
                baseUrl: AppConstants.baseUrl,
              ),
            ),
            sessionService,
          ),
        ),
        Provider<SessionService>(
          create: (_) => sessionService,
        ),
        ChangeNotifierProvider<StartUpController>(
          create: (context) => StartUpController(),
        ),
        ChangeNotifierProvider<SessionUserController>(
          create: (context) => SessionUserController(
            userRepo: context.read(),
            sessionService: sessionService,
          ),
        ),
        ChangeNotifierProvider<SessionSymptomController>(
          create: (context) => SessionSymptomController(
            symptomRepo: context.read(),
          ),
        ),
      ],
      child: const AppRedem(),
    ),
  );
}
