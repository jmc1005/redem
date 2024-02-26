import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    final user = controller.sessionUserController.state!;

    return Column(
      children: [
        TextFormField(
          key: const Key('detailUserFirstName'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            label: Text(language.value('nombre')),
          ),
          initialValue: user.firstName,
        ),
        TextFormField(
          key: const Key('detailUserLastName'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            label: Text(language.value('apellido')),
          ),
          initialValue: user.lastName,
        ),
        Localizations.override(
          context: context,
          locale: Locale(controller.sessionLangController.langCode),
          child: Builder(builder: (context) {
            final dateOfBirth = DateTime.parse(user.dateOfBirth);
            dateInput!.text = DateFormat('dd-MM-yyyy').format(dateOfBirth);

            return TextFormField(
              key: const Key('detailUserDateOfBirth'),
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
          value: user.sex.toString().trim() != ''
              ? user.sex.toString()
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
