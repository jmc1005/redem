import 'package:country_flags/country_flags.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';

import '../../../../utils/enums/icon_label.dart';

class StartUpController extends foundation.ChangeNotifier {
  IconLabel _iconLabel = IconLabel.esES;

  IconLabel get iconLabel => _iconLabel;

  void onIconLabelChanged(IconLabel value) {
    _iconLabel = value;
  }

  List<DropdownMenuItem<IconLabel>> get dropdownMenuItems {
    return IconLabel.values.map<DropdownMenuItem<IconLabel>>(
      (IconLabel icon) {
        return DropdownMenuItem<IconLabel>(
          value: icon,
          alignment: Alignment.center,
          child: CountryFlag.fromLanguageCode(
            icon.value,
            height: 30,
            width: 30,
            borderRadius: 8,
          ),
        );
      },
    ).toList();
  }
}
