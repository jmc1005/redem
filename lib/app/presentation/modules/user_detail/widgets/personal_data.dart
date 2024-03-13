import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../../../utils/enums/sex.dart';
import '../../../../utils/enums/user_type.dart';
import '../../../../utils/validators/validator_mixin.dart';
import '../controller/user_detail_controller.dart';
import 'csc_widget.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({
    super.key,
    required this.userDetailController,
  });

  final UserDetailController userDetailController;

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> with ValidatorMixin {
  String countryValue = '';

  @override
  Widget build(BuildContext context) {
    final sessionUserController =
        widget.userDetailController.sessionUserController;
    final user = widget.userDetailController.sessionUserController.state!;
    final context = widget.userDetailController.context;
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
          onChanged: (value) {
            widget.userDetailController.onChangeValueFirstName(value);
          },
        ),
        TextFormField(
          key: const Key('detailUserLastName'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            label: Text(language.apellido),
          ),
          initialValue: user.lastName,
          onChanged: (value) {
            widget.userDetailController.onChangeValueLastName(value);
          },
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.emailAddress,
          initialValue: user.email,
          decoration: InputDecoration(
            label: Text(language.email),
          ),
          onChanged: (value) {
            widget.userDetailController.onChangeValueEmail(value);
          },
          validator: emailValidator,
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
                widget.userDetailController.openDatePicker(context, dateInput),
          );
        }),
        DropdownButtonFormField(
          value: user.sex.toString().trim() != ''
              ? user.sex.toString()
              : Sex.other.value,
          decoration: InputDecoration(
            label: Text(language.sexo),
          ),
          items: widget.userDetailController.sexList,
          onChanged: (value) {
            if (value != null) {
              widget.userDetailController.onChangeValueSex(value);
            }
          },
        ),
        DropdownButtonFormField(
          value: UserType.patient.value,
          decoration: InputDecoration(
            label: Text(language.tipo_usuario),
          ),
          items: widget.userDetailController.typeList,
          onChanged: (value) {
            if (value != null) {
              widget.userDetailController.onChangeValueType(value);
            }
          },
        ),
        const SizedBox(
          height: 5,
        ),
        CSCWidget(sessionUserController: sessionUserController)
      ],
    );
  }
}
