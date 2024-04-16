import 'package:flutter/material.dart';

class SwitchWidget extends FormField<bool> {
  SwitchWidget({
    super.key,
    super.autovalidateMode,
    required String label,
    required bool checked,
    required void Function(bool value) onChanged,
  }) : super(
          builder: (state) {
            return SwitchListTile(
              contentPadding: EdgeInsets.zero,
              value: checked,
              inactiveTrackColor: Colors.blueGrey.shade100,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(label),
              onChanged: (value) => onChanged(value),
            );
          },
        );
}
