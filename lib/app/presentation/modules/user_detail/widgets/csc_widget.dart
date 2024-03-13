import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../global/controllers/session_user_controller.dart';

class CSCWidget extends StatefulWidget {
  const CSCWidget({super.key, required this.sessionUserController});

  final SessionUserController? sessionUserController;

  @override
  State<CSCWidget> createState() => _CSCWidgetState();
}

class _CSCWidgetState extends State<CSCWidget> {
  String countryValue = '';
  String stateValue = '';
  String cityValue = '';

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context)!;
    final controller = widget.sessionUserController;
    final state = controller?.state;

    countryValue = state?.country ?? '';
    stateValue = state?.city ?? '';

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: CSCPicker(
        // layout: Layout.vertical,
        flagState: CountryFlag.DISABLE,

        dropdownDecoration: const BoxDecoration(
          color: Colors.white,
          border: BorderDirectional(
            bottom: BorderSide(color: Colors.grey),
          ),
        ),

        disabledDropdownDecoration: BoxDecoration(
          color: Colors.grey.shade300,
          border: const BorderDirectional(
            bottom: BorderSide(color: Colors.grey),
          ),
        ),

        countrySearchPlaceholder: language.pais,
        stateSearchPlaceholder: language.ciudad,

        countryDropdownLabel: language.pais,
        stateDropdownLabel: language.ciudad,

        countryFilter: const [
          CscCountry.Uruguay,
          CscCountry.Argentina,
          CscCountry.Chile,
          CscCountry.Peru,
          CscCountry.Colombia,
          CscCountry.Ecuador,
        ],

        selectedItemStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),

        dropdownHeadingStyle: const TextStyle(
            color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),

        dropdownItemStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),

        dropdownDialogRadius: 10.0,

        searchBarRadius: 8.0,

        showCities: false,

        onCountryChanged: (value) {
          setState(() {
            countryValue = value;
            final user = state!.copyWith(country: countryValue);
            controller?.user = user;
          });
        },

        onStateChanged: (value) {
          setState(() {
            stateValue = value ?? '';
            final user = state!.copyWith(city: stateValue);
            controller?.user = user;
          });
        },

        onCityChanged: (value) {
          setState(() {
            cityValue = value ?? '';
          });
        },
      ),
    );
  }
}
