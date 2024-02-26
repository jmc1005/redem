import 'package:flutter/material.dart';

import '../../../utils/locale/language_translation.dart';
import '../../../utils/validators/validator_mixin.dart';
import 'logo_widget.dart';

class UserCredentialWidget extends StatelessWidget with ValidatorMixin {
  UserCredentialWidget({
    super.key,
    required this.language,
    required this.onChangedEmail,
    required this.onChangedPassword,
  });

  final LanguageTranslation language;
  final Function(String)? onChangedEmail;
  final Function(String)? onChangedPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const SizedBox(height: 30),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: onChangedEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            label: Text(language.value('email')),
          ),
          validator: emailValidator,
        ),
        const SizedBox(height: 15),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: onChangedPassword,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            label: Text(language.value('password')),
          ),
          validator: passwordValidator,
          obscureText: true,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
