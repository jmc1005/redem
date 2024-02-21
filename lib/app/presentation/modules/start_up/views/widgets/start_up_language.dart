import 'package:flutter/material.dart';

import '../../../../../utils/enums/icon_label.dart';
import '../../controller/start_up_controller.dart';

class StartUpLanguage extends StatelessWidget {
  const StartUpLanguage({
    super.key,
    required this.iconLabel,
    required this.controller,
    required this.onChanged,
  });

  final IconLabel iconLabel;
  final StartUpController controller;
  final void Function(IconLabel) onChanged;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Material(
          color: const Color(0xfff0f0f0),
          borderRadius: BorderRadius.circular(8),
          child: DropdownButton<IconLabel>(
            value: iconLabel,
            underline: const SizedBox(),
            borderRadius: BorderRadius.circular(8),
            padding: const EdgeInsets.only(left: 15, right: 5),
            items: controller.dropdownMenuItems,
            onChanged: (vIconLabel) {
              if (vIconLabel != null && vIconLabel.value != iconLabel.value) {
                onChanged(vIconLabel);
              }
            },
          ),
        ),
      ),
    );
  }
}
