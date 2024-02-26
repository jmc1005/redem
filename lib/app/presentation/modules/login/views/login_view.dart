import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/locale/language_translation.dart';
import '../../../../utils/validators/validator_mixin.dart';
import '../../../global/controllers/state/user_credential_state.dart';
import '../../../global/widgets/user_credential_widget.dart';
import '../../../global/widgets/user_submit_button_widget.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/routes.dart';
import '../controller/login_controller.dart';

class LoginView extends StatelessWidget with ValidatorMixin {
  LoginView({super.key});

  final TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginController>(
      create: (_) => LoginController(
        const UserCredentialState(),
        context: context,
        userRepo: context.read(),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Builder(builder: (context) {
                final controller = Provider.of<LoginController>(context);
                final language = LanguageTranslation.of(context)!;

                return AbsorbPointer(
                  absorbing: controller.state.loading,
                  child: ListView(
                    padding: const EdgeInsets.all(30),
                    children: [
                      UserCredentialWidget(
                        language: language,
                        onChangedEmail: (text) {
                          controller.onEmailChanged(text);
                        },
                        onChangedPassword: (text) {
                          controller.onPasswordChanged(text);
                        },
                      ),
                      UserSubmitButtonWidget(
                        loading: controller.state.loading,
                        label: language.value('acceder'),
                        onPressed: controller.submit,
                      ),
                      const SizedBox(height: 30),
                      GestureDetector(
                        child: Text(
                          language.value('perdiste_password'),
                          style: const TextStyle(
                            color: Colors.blueAccent,
                            decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {},
                      ),
                      const SizedBox(height: 30),
                      Text(
                        language.value('no_tienes_cuenta'),
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        child: Text(
                          language.value('no_tienes_cuenta'),
                          style: const TextStyle(
                            color: Colors.blueAccent,
                            decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          navigateTo(Routes.signUp, context);
                        },
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
