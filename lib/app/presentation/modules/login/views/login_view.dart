import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/locale/language_translation.dart';
import '../../../../utils/validators/validator_mixin.dart';
import '../../../global/widgets/logo_widget.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/routes.dart';
import '../controller/login_controller.dart';
import '../controller/state/login_state.dart';
import '../widgets/submit_button.dart';

class LoginView extends StatelessWidget with ValidatorMixin {
  LoginView({super.key});

  final TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginController>(
      create: (_) => LoginController(
        const LoginState(),
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
                    padding: const EdgeInsets.all(40),
                    children: [
                      const Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          LogoWidget(
                            asset: 'assets/images/redem.png',
                            size: 250,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) {
                          controller.onEmailChanged(value);
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          label: Text(language.value('email')),
                        ),
                        validator: emailValidator,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: password,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) {
                          controller.onPasswordChanged(value);
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          label: Text(language.value('password')),
                        ),
                        validator: passwordValidator,
                        obscureText: true,
                      ),
                      const SizedBox(height: 30),
                      const SubmitButton(),
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
