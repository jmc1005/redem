import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../domain/repository/connection_repo.dart';
import '../../../../utils/locale/language_translation.dart';
import '../../../global/controllers/session_lang_controller.dart';
import '../../../global/widgets/logo_widget.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/routes.dart';
import '../controller/start_up_controller.dart';
import 'widgets/start_up_language.dart';

class StartUpView extends StatefulWidget {
  const StartUpView({super.key});

  @override
  State<StartUpView> createState() => _StartUpViewState();
}

class _StartUpViewState extends State<StartUpView> {
  var hasInternet = true;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final ConnectionRepo connectionRepo = context.read();
    hasInternet = await connectionRepo.hasInternet;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StartUpController>(
      create: (_) => StartUpController(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            child: Center(
              child: Builder(builder: (context) {
                final controller = Provider.of<StartUpController>(context);
                final language = LanguageTranslation.of(context)!;

                if (!hasInternet) {
                  final snackBar =
                      SnackBar(content: Text(language.value('sin_conexion')));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                return Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                StartUpLanguage(
                                  iconLabel: controller.iconLabel,
                                  controller: controller,
                                  onChanged: (iconLabel) {
                                    setState(() {
                                      controller.onIconLabelChanged(iconLabel);
                                      final session = SessionLangController(
                                        langCode: iconLabel.value,
                                      );
                                      session.langCode = iconLabel.value;
                                      onLocaleChange(Locale(iconLabel.value));
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  LogoWidget(
                                    asset: 'assets/images/redem.png',
                                    size: 120,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Text(
                                      language.value('bienvenido'),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      language.value('mensaje_bienvenida'),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  navigateTo(Routes.login, context);
                                },
                                child: Text(language.value('acceder')),
                              ),
                              const SizedBox(height: 20),
                              Text(language.value('no_tienes_cuenta')),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: AppColors.secondary,
                                ),
                                onPressed: () {
                                  navigateTo(Routes.signUp, context);
                                },
                                child: Text(language.value('registrarse')),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onLocaleChange(Locale locale) async {
    LanguageTranslation.load(locale);
  }
}
