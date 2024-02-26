import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../utils/locale/language_translation.dart';
import '../controller/user_detail_controller.dart';
import 'pathology_data.dart';
import 'personal_data.dart';

class AccordionWidget extends StatelessWidget {
  const AccordionWidget({
    super.key,
    required this.controller,
    required this.language,
    required this.onTap,
    required this.dateInput,
  });

  static const headerStyle = TextStyle(
    color: Color(0xffffffff),
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  final UserDetailController controller;
  final LanguageTranslation language;
  final Function() onTap;
  final TextEditingController? dateInput;

  @override
  Widget build(BuildContext context) {
    return Accordion(
      headerBorderColor: Colors.blueGrey,
      headerBorderColorOpened: Colors.transparent,
      headerBackgroundColor: AppColors.primary.withOpacity(0.8),
      contentBackgroundColor: Colors.white,
      contentBorderWidth: 1,
      contentHorizontalPadding: 20,
      scaleWhenAnimating: true,
      openAndCloseAnimation: true,
      headerPadding: const EdgeInsets.symmetric(
        vertical: 7,
        horizontal: 15,
      ),
      sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
      sectionClosingHapticFeedback: SectionHapticFeedback.light,
      children: [
        AccordionSection(
          isOpen: true,
          contentVerticalPadding: 20,
          leftIcon: const Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
          header: Text(
            language.value('datos_personales'),
            style: headerStyle,
          ),
          content: PersonalData(
            controller: controller,
            language: language,
            onTap: onTap,
            dateInput: dateInput,
          ),
        ),
        AccordionSection(
          contentVerticalPadding: 20,
          leftIcon: const Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
          header: Text(
            language.value('patologia'),
            style: headerStyle,
          ),
          content: const PathologyData(),
        ),
      ],
    );
  }
}
