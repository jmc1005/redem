import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/config/themes/app_theme.dart';
import 'app/presentation/routes/app_routes.dart';
import 'app/presentation/routes/routes.dart';
import 'app/utils/locale/translation_delegate.dart';

class AppRedem extends StatelessWidget {
  const AppRedem({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme();

    return GestureDetector(
      onTap: () {
        // verificar el contexto hijo
        final focus = FocusScope.of(context);
        // minimizar el teclado al pulsar fuera en el hijo
        final focusedChild = focus.focusedChild;
        if (focusedChild != null && !focusedChild.hasPrimaryFocus) {
          focusedChild.unfocus();
        }
      },
      child: MaterialApp(
        initialRoute: Routes.startUp,
        routes: appRoutes,
        theme: appTheme.light,
        localizationsDelegates: const [
          TranslationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('es'),
          Locale('en'),
        ],
      ),
    );
  }
}
