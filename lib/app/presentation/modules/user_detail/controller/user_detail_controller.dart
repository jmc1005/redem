import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../../../data/http/result.dart';
import '../../../../utils/enums/em.dart';
import '../../../../utils/enums/sex.dart';
import '../../../../utils/enums/user_type.dart';
import '../../../../utils/http/http_response.dart';
import '../../../global/controllers/session_symptom_controller.dart';
import '../../../global/controllers/session_user_controller.dart';
import '../widgets/pathology_data.dart';
import '../widgets/personal_data.dart';
import '../widgets/symptom_data.dart';

class UserDetailController extends foundation.ChangeNotifier {
  final BuildContext context;
  int currentStep;
  final SessionUserController sessionUserController;
  final SessionSymptomController sessionSymptomController;
  final List<String> selectedSymptoms;
  final List<String> deleteSymptoms;

  UserDetailController({
    required this.context,
    required this.sessionUserController,
    required this.sessionSymptomController,
    required this.currentStep,
    required this.selectedSymptoms,
    required this.deleteSymptoms,
  });

  List<DropdownMenuItem<String>> get sexList {
    final language = AppLocalizations.of(context)!;

    return Sex.values.map<DropdownMenuItem<String>>(
      (Sex sex) {
        final label = getEnumSextring(sex, language);

        return DropdownMenuItem<String>(
          value: sex.value,
          alignment: Alignment.centerLeft,
          child: Text(label),
        );
      },
    ).toList();
  }

  String getEnumSextring(Sex enumValue, AppLocalizations language) {
    switch (enumValue) {
      case Sex.male:
        return language.hombre;
      case Sex.female:
        return language.mujer;
      case Sex.other:
        return language.otro;
    }
  }

  List<DropdownMenuItem<String>> get typeList {
    final language = AppLocalizations.of(context)!;

    return UserType.values.map<DropdownMenuItem<String>>(
      (UserType type) {
        final label = getEnumTypeString(type, language);

        return DropdownMenuItem<String>(
          value: type.value,
          alignment: Alignment.centerLeft,
          child: Text(label),
        );
      },
    ).toList();
  }

  String getEnumTypeString(UserType enumValue, AppLocalizations language) {
    switch (enumValue) {
      case UserType.caregiver:
        return language.cuidador;
      case UserType.patient:
        return language.paciente;
      case UserType.doctor:
        return language.doctor;
    }
  }

  List<DropdownMenuItem<String>> get emList {
    final language = AppLocalizations.of(context)!;

    return EM.values.map<DropdownMenuItem<String>>(
      (EM em) {
        final label = getEnumEMString(em, language);

        return DropdownMenuItem<String>(
          value: em.value,
          alignment: Alignment.centerLeft,
          child: Text(label),
        );
      },
    ).toList();
  }

  String getEnumEMString(EM enumValue, AppLocalizations language) {
    switch (enumValue) {
      case EM.emrr:
        return language.emrr;
      case EM.emsp:
        return language.emsp;
      case EM.empp:
        return language.empp;
      case EM.empr:
        return language.empr;
    }
  }

  List<Step> get steps {
    final language = AppLocalizations.of(context)!;

    return <Step>[
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep == 0,
        title: Text(language.datos_personales),
        content: PersonalData(
          userDetailController: this,
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep == 1,
        title: Text(language.patologia),
        content: PathologyData(
          userDetailController: this,
        ),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep == 2,
        title: Text(language.sintomas),
        content: SymptomData(
          userDetailController: this,
        ),
      ),
    ];
  }

  void onChangeValueFirstName(String text) {
    final user = sessionUserController.state!.copyWith(firstName: text);
    sessionUserController.user = user;
  }

  void onChangeValueLastName(String text) {
    final user = sessionUserController.state!.copyWith(lastName: text);
    sessionUserController.user = user;
  }

  void onChangeValueEmail(String text) {
    final user = sessionUserController.state!.copyWith(email: text);
    sessionUserController.user = user;
  }

  void onChangeValueDateOfBirth(String text) {
    final user = sessionUserController.state!.copyWith(dateOfBirth: text);
    sessionUserController.user = user;
  }

  void onChangeValueSex(String text) {
    final user = sessionUserController.state!.copyWith(sex: text);
    sessionUserController.user = user;
  }

  void onChangeValueType(String text) {
    final user = sessionUserController.state!.copyWith(userType: text);
    sessionUserController.user = user;
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

  Future<bool> saveUser() async {
    final user = sessionUserController.state!;
    final result = await sessionUserController.userRepo.saveUser(
      user.uuid,
      user.firstName,
      user.lastName,
      user.dateOfBirth,
      user.sex,
      user.email,
      user.userType,
      user.city,
      user.country,
    );

    final value = switch (result) {
      Failure(exception: final exception) => exception,
      Success(value: final user) => user,
    };

    if (value is int) {
      mostrarError(value);
      return false;
    }

    return true;
  }

  Future<bool> saveSymptomUser() async {
    bool ok = true;
    for (var i = 0; i < selectedSymptoms.length; i++) {
      if (ok) {
        ok = await addSymptomUser(
          selectedSymptoms[i],
        );
      }
    }

    for (var i = 0; i < deleteSymptoms.length; i++) {
      if (ok) {
        ok = await removeSymptomUser(
          deleteSymptoms[i],
        );
      }
    }

    return ok;
  }

  Future<bool> addSymptomUser(symptom) async {
    final result =
        await sessionSymptomController.symptomRepo.addSymptomUser(symptom);

    final value = switch (result) {
      Failure(exception: final exception) => exception,
      Success(value: final user) => user,
    };

    if (value is int) {
      mostrarError(value);
      return false;
    }

    return true;
  }

  Future<bool> removeSymptomUser(symptom) async {
    final result =
        await sessionSymptomController.symptomRepo.removeSymptomUser(symptom);

    final value = switch (result) {
      Failure(exception: final exception) => exception,
      Success(value: final user) => user,
    };

    if (value is int) {
      mostrarError(value);
      return false;
    }

    return true;
  }

  void mostrarError(int statusCode) {
    final language = AppLocalizations.of(context)!;

    final httpResponse = HttpResponse(
      context: context,
      language: language,
      statusCode: statusCode,
    );

    httpResponse.showError();
  }

  void mostrarSuccess() {
    final language = AppLocalizations.of(context)!;

    final snackBar = SnackBar(content: Text(language.usuarioGuardado));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
