import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../utils/enums/em.dart';
import '../controller/user_detail_controller.dart';

class PathologyData extends StatefulWidget {
  const PathologyData({
    super.key,
    required this.userDetailController,
  });

  final UserDetailController userDetailController;

  @override
  State<PathologyData> createState() => _PathologyDataState();
}

class _PathologyDataState extends State<PathologyData> {
  final db = FirebaseFirestore.instance;
  late var value = EM.emrr.value;

  @override
  void initState() {
    super.initState();

    db.settings = const Settings(
      persistenceEnabled: true,
    );
  }

  Future<String> getEMValue(uuid) async {
    await db.collection('patology').doc(uuid).get().then(
      (doc) {
        final data = doc.data()!;
        value = data['multiple_sclerosis_type'];
        developer.log('em_type $value');
      },
      onError: (e) => developer.log('Error getting document: $e'),
    );

    return value;
  }

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context)!;
    final controller = widget.userDetailController;
    final user = controller.sessionUserController.state!;

    return Column(
      children: [
        DropdownButtonFormField(
          value: value,
          decoration: InputDecoration(
            label: Text(language.tipo_em),
          ),
          items: controller.emList,
          onChanged: (value) {
            if (value != null) {
              final em = {
                'multiple_sclerosis_type': value,
              };

              db.collection('patology').doc(user.uuid).set(em).onError(
                    (e, _) => developer.log(
                      'Error writing document: $e',
                    ),
                  );
            }
          },
        ),
      ],
    );
  }
}
