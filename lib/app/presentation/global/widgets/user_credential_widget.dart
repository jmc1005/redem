import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../utils/validators/validator_mixin.dart';
import 'logo_widget.dart';

class UserCredentialWidget extends StatelessWidget with ValidatorMixin {
  UserCredentialWidget({
    super.key,
    required this.onChangedEmail,
    required this.onChangedPassword,
  });

  final Function(String)? onChangedEmail;
  final Function(String)? onChangedPassword;

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context)!;

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
            label: Text(language.email),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFE5E7EB),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFE5E7EB),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          validator: emailValidator,
        ),
        const SizedBox(height: 15),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: onChangedPassword,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            label: Text(language.password),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFE5E7EB),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFE5E7EB),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          validator: passwordValidator,
          obscureText: true,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
