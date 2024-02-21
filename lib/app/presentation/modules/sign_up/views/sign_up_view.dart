import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/locale/language_translation.dart';
import '../../../../utils/validators/validator_mixin.dart';
import '../../../global/widgets/logo_widget.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/routes.dart';
import '../../start_up/controller/state/sign_up_state.dart';
import '../controller/sign_up_controller.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> with ValidatorMixin {
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final bool _loading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpController>(
      create: (_) => SignUpController(
        const SignUpState(),
        userRepo: context.read(),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Builder(builder: (context) {
              final controller = Provider.of<SignUpController>(context);
              final language = LanguageTranslation.of(context)!;

              return AbsorbPointer(
                absorbing: controller.state.loading,
                child: ListView(
                  padding: const EdgeInsets.all(30),
                  children: [
                    const Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        LogoWidget(
                          asset: 'assets/images/redem.png',
                          size: 100,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
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
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: confirmpassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (value) {
                        controller.onPasswordChanged(value);
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        label: Text(language.value('confirmar_password')),
                      ),
                      validator: (value) {
                        final validPassword = passwordValidator(value);

                        if (validPassword == null) {
                          if (password.text != confirmpassword.text) {
                            return language.value('password_no_coincide');
                          }
                        }

                        return validPassword;
                      },
                      obscureText: true,
                    ),
                    const SizedBox(height: 30),
                    Builder(builder: (context) {
                      if (_loading) {
                        return const Center(
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        return ElevatedButton(
                          onPressed: () => controller.submit(context),
                          child: Text(language.value('registrarse')),
                        );
                      }
                    }),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text(language.value('acceptar_terminos')),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            child: Text(
                              language.value('terminos_y_condiciones'),
                              style: const TextStyle(
                                color: Colors.blueAccent,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onTap: () {},
                          ),
                          const Text('.')
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(language.value('tienes_cuenta'),
                        textAlign: TextAlign.center),
                    GestureDetector(
                      child: Text(
                        language.value('acceder'),
                        style: const TextStyle(
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        navigateTo(Routes.login, context);
                      },
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
