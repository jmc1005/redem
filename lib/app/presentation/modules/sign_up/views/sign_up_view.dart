import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../utils/validators/validator_mixin.dart';
import '../../../global/controllers/state/user_credential_state.dart';
import '../../../global/widgets/user_credential_widget.dart';
import '../../../global/widgets/user_submit_button_widget.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/routes.dart';
import '../controller/sign_up_controller.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> with ValidatorMixin {
  TextEditingController confirmpassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpController>(
      create: (_) => SignUpController(
        const UserCredentialState(),
        userRepo: context.read(),
        context: context,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Builder(builder: (context) {
              final controller = Provider.of<SignUpController>(context);
              final language = AppLocalizations.of(context)!;

              return AbsorbPointer(
                absorbing: controller.state.loading,
                child: ListView(
                  padding: const EdgeInsets.all(30),
                  children: [
                    UserCredentialWidget(
                      onChangedEmail: (text) {
                        controller.onEmailChanged(text);
                      },
                      onChangedPassword: (text) {
                        controller.onPasswordChanged(text);
                      },
                    ),
                    TextFormField(
                      controller: confirmpassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (value) {
                        controller.onPasswordChanged(value);
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        label: Text(language.confirmar_password),
                      ),
                      validator: (value) {
                        final validPassword = passwordValidator(value);
                        final password = controller.state.password;

                        if (validPassword == null) {
                          if (password != confirmpassword.text) {
                            return language.password_no_coincide;
                          }
                        }

                        return validPassword;
                      },
                      obscureText: true,
                    ),
                    const SizedBox(height: 30),
                    UserSubmitButtonWidget(
                      loading: controller.state.loading,
                      label: language.registrarse,
                      onPressed: controller.submit,
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text(language.acceptar_terminos),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            child: Text(
                              language.terminos_y_condiciones,
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
                    Text(language.tienes_cuenta, textAlign: TextAlign.center),
                    GestureDetector(
                      child: Text(
                        language.acceder,
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
