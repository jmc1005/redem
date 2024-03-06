import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../../../utils/enums/sex.dart';
import '../../../../utils/enums/user_type.dart';
import '../controller/user_detail_controller.dart';

class PersonalData extends StatelessWidget {
  const PersonalData({
    super.key,
    required this.userDetailController,
  });

  final UserDetailController userDetailController;

  @override
  Widget build(BuildContext context) {
    final user = userDetailController.sessionUserController.state!;
    final context = userDetailController.context;
    final dateInput = TextEditingController();
    final language = AppLocalizations.of(context)!;

    return Column(
      children: [
        TextFormField(
          key: const Key('detailUserFirstName'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            label: Text(language.nombre),
          ),
          initialValue: user.firstName,
        ),
        TextFormField(
          key: const Key('detailUserLastName'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            label: Text(language.apellido),
          ),
          initialValue: user.lastName,
        ),
        Builder(builder: (_) {
          final dateOfBirth = DateTime.parse(user.dateOfBirth);
          dateInput.text = DateFormat('dd-MM-yyyy').format(dateOfBirth);

          return TextFormField(
            key: const Key('detailUserDateOfBirth'),
            controller: dateInput,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.datetime,
            decoration: InputDecoration(
              label: Text(language.fecha_nacimiento),
              suffixIcon: const Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Icon(
                  Icons.calendar_today,
                ),
              ),
            ),
            onTap: () =>
                userDetailController.openDatePicker(context, dateInput),
          );
        }),
        DropdownButtonFormField(
          value: user.sex.toString().trim() != ''
              ? user.sex.toString()
              : Sex.other.value,
          decoration: InputDecoration(
            label: Text(language.sexo),
          ),
          items: userDetailController.sexList,
          onChanged: (value) {
            if (value != null) {
              userDetailController.onChangeValueSex(value);
            }
          },
        ),
        DropdownButtonFormField(
          value: UserType.other.value,
          decoration: InputDecoration(
            label: Text(language.tipo_usuario),
          ),
          items: userDetailController.typeList,
          onChanged: (value) {
            if (value != null) {
              userDetailController.onChangeValueType(value);
            }
          },
        )
      ],
    );
  }
}
