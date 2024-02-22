import 'package:flutter/material.dart';

import '../../../../utils/enums/sex.dart';
import '../../../../utils/enums/user_type.dart';
import '../../../../utils/locale/language_translation.dart';
import '../controller/user_detail_controller.dart';

class PersonalData extends StatelessWidget {
  const PersonalData({
    super.key,
    required this.controller,
    required this.language,
    required this.onTap,
    required this.dateInput,
  });

  final UserDetailController controller;
  final LanguageTranslation language;
  final Function() onTap;
  final TextEditingController? dateInput;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          key: const Key('registerFirstName'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            label: Text(language.value('nombre')),
          ),
          initialValue: controller.state.firstName,
        ),
        TextFormField(
          key: const Key('registerLastName'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            label: Text(language.value('apellido')),
          ),
          initialValue: controller.state.lastName,
        ),
        Localizations.override(
          context: context,
          locale: Locale(controller.sessionLangController.langCode),
          child: Builder(builder: (context) {
            dateInput!.text = controller.state.dateOfBirth;
            return TextFormField(
              key: const Key('registerDateOfBirth'),
              controller: dateInput,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                label: Text(language.value('fecha_nacimiento')),
                suffixIcon: const Align(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: Icon(
                    Icons.calendar_today,
                  ),
                ),
              ),
              onTap: onTap,
            );
          }),
        ),
        DropdownButtonFormField(
          value: controller.state.sex.trim() != ''
              ? controller.state.sex
              : Sex.other.value,
          decoration: InputDecoration(
            label: Text(language.value('sexo')),
          ),
          items: controller.sexList,
          onChanged: (value) {
            if (value != null) {
              controller.onChangeValueSex(value);
            }
          },
        ),
        DropdownButtonFormField(
          value: UserType.other.value,
          decoration: InputDecoration(
            label: Text(language.value('tipo_usuario')),
          ),
          items: controller.typeList,
          onChanged: (value) {
            if (value != null) {
              controller.onChangeValueType(value);
            }
          },
        )
      ],
    );
  }
}
