import 'package:flutter/material.dart';

import '../../../../utils/enums/sex.dart';
import '../../../../utils/enums/user_type.dart';
import '../../../global/controllers/session_lang_controller.dart';
import '../../../global/controllers/session_user_controller.dart';

class UserDetailController {
  final SessionUserController sessionUserController;
  final SessionLangController sessionLangController;

  UserDetailController({
    required this.sessionUserController,
    required this.sessionLangController,
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
}
