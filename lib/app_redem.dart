import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'app/config/themes/app_theme.dart';
import 'app/presentation/routes/app_routes.dart';
import 'app/presentation/routes/routes.dart';
import 'l10n/locale_support.dart';
import 'provider/locale_provider.dart';

class AppRedem extends StatelessWidget {
  const AppRedem({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme();

    return ChangeNotifierProvider<LocaleProvider>(
      create: (_) => LocaleProvider(),
      builder: (context, child) {
        return Consumer<LocaleProvider>(
          builder: (context, provider, child) {
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
                locale: provider.locale,
                supportedLocales: L10n.support,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
              ),
            );
          },
        );
      },
    );
  }
}
