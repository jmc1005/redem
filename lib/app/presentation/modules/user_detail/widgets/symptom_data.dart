import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../data/http/result.dart';
import '../../../../domain/models/symptom/symptom.dart';
import '../../../../domain/repository/symptom_repo.dart';
import '../controller/user_detail_controller.dart';

class SymptomData extends StatefulWidget {
  const SymptomData({
    super.key,
    required this.userDetailController,
  });

  final UserDetailController userDetailController;

  @override
  State<SymptomData> createState() => _SymptomData();
}

class _SymptomData extends State<SymptomData> {
  late final Future<Result<List<Symptom>, int>> _futureSymptoms;
  final List<String> initialSymptomsUser = [];

  Future<void> _getSymptoms() async {
    final SymptomRepo symptomRepository = context.read();

    await symptomRepository.getSymptomsByUser().then((value) {
      final symptoms = switch (value) {
        Failure(exception: final exception) => exception,
        Success(value: final List<Symptom> symptoms) => symptoms
      };

      if (symptoms is List<Symptom>) {
        for (final el in symptoms) {
          if (!widget.userDetailController.selectedSymptoms.contains(el.uuid)) {
            widget.userDetailController.selectedSymptoms.add(el.uuid);
            initialSymptomsUser.add(el.uuid);
          }
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    final SymptomRepo symptomRepository = context.read();
    _getSymptoms();
    _futureSymptoms = symptomRepository.getSymptoms();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: FutureBuilder(
        future: _futureSymptoms,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            final Result<List<Symptom>, int> symptoms = snapshot.data!;

            final resSymptoms = switch (symptoms) {
              Failure(exception: final exception) => exception,
              Success(value: final List<Symptom> symptoms) => symptoms
            };

            if (resSymptoms is List<Symptom>) {
              return ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (_, __) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Divider(
                      height: 2,
                      color: AppColors.secondary.withOpacity(0.5),
                    ),
                  );
                },
                itemBuilder: (_, int index) {
                  final listaSymptoms = resSymptoms;
                  final symptom = listaSymptoms[index];
                  final controller = widget.userDetailController;
                  final selectedSymptoms = controller.selectedSymptoms;
                  final deleteSymptoms = controller.deleteSymptoms;

                  return CheckboxListTile(
                    title: Text(symptom.name),
                    value: selectedSymptoms.contains(symptom.uuid),
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value != null && value) {
                          if (!selectedSymptoms.contains(symptom.uuid)) {
                            selectedSymptoms.add(symptom.uuid);
                          }
                        } else if (initialSymptomsUser.contains(symptom.uuid) &&
                            !deleteSymptoms.contains(symptom.uuid)) {
                          deleteSymptoms.add(symptom.uuid);
                        }
                      });
                    },
                  );
                },
                itemCount: resSymptoms.length,
              );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            const Center(child: CircularProgressIndicator());
          }

          return const Text('Error');
        },
      ),
    );
  }
}
