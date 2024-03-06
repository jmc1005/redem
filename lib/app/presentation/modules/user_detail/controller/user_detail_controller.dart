import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../../../utils/enums/sex.dart';
import '../../../../utils/enums/user_type.dart';
import '../../../global/controllers/session_user_controller.dart';
import '../widgets/personal_data.dart';

class UserDetailController extends foundation.ChangeNotifier {
  final BuildContext context;
  final int currentStep;
  final SessionUserController sessionUserController;

  UserDetailController({
    required this.context,
    required this.sessionUserController,
    required this.currentStep,
  });

  List<DropdownMenuItem<String>> get sexList {
    return Sex.values.map<DropdownMenuItem<String>>(
      (Sex sex) {
        return DropdownMenuItem<String>(
          value: sex.value,
          alignment: Alignment.centerLeft,
          child: Text(sex.label),
        );
      },
    ).toList();
  }

  List<DropdownMenuItem<String>> get typeList {
    return UserType.values.map<DropdownMenuItem<String>>(
      (UserType type) {
        return DropdownMenuItem<String>(
          value: type.value,
          alignment: Alignment.centerLeft,
          child: Text(type.label),
        );
      },
    ).toList();
  }

  List<Step> get steps {
    return <Step>[
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text('Account Info'),
        content: PersonalData(
          userDetailController: this,
        ),
      ),
      // Step(
      //   state: currentStep > 1 ? StepState.complete : StepState.indexed,
      //   isActive: currentStep >= 1,
      //   title: const Text('Address'),
      //   content: Column(
      //     children: const [
      //       CustomInput(
      //         hint: 'City and State',
      //         inputBorder: OutlineInputBorder(),
      //       ),
      //       CustomInput(
      //         hint: 'Postal Code',
      //         inputBorder: OutlineInputBorder(),
      //       ),
      //     ],
      //   ),
      // ),
    ];
  }

  void onChangeValueFirstName(String text) {
    // onlyUpdate(state.copyWith(firstName: text.trim()));
  }

  void onChangeValueLastName(String text) {
    // onlyUpdate(state.copyWith(firstName: text.trim()));
  }

  void onChangeValueDateOfBirth(String text) {
    // onlyUpdate(state.copyWith(dateOfBirth: text.trim()));
  }

  void onChangeValueSex(String text) {
    // onlyUpdate(state.copyWith(sex: text));
  }

  void onChangeValueType(String text) {
    // onlyUpdate(state.copyWith(userType: text));
  }

  Future<void> openDatePicker(
    BuildContext context,
    TextEditingController dateInput,
  ) async {
    final language = AppLocalizations.of(context)!;

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      locale: Locale(language.localeName),
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final String date = DateFormat('dd-MM-yyyy').format(pickedDate);
      onChangeValueDateOfBirth(date);
      dateInput.text = date;
    } else {}
  }
}
