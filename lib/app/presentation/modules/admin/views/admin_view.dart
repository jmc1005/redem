import 'package:flutter/material.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../global/widgets/cabecera_widget.dart';
import '../../../global/widgets/gestion_widget.dart';
import '../../../global/widgets/user_submit_button_widget.dart';

class AdminView extends StatefulWidget {
  const AdminView({super.key});

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 38, horizontal: 16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(
                maxWidth: 390,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFFE5E7EB),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 8,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/redem.png',
                    width: 240,
                    height: 64,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional.topCenter,
                child: SingleChildScrollView(
                  child: Column(children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            constraints: const BoxConstraints(
                              maxWidth: 360,
                            ),
                            decoration: const BoxDecoration(),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CabeceraWidget(
                                  label: 'Gestión Enfermedad',
                                  color: Color(0xFF606A85),
                                ),
                                GestionWidget(
                                    label: 'Tipos esclerosis múltiples'),
                                GestionWidget(label: 'Síntomas'),
                                GestionWidget(label: 'Medicamentos'),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    top: 8,
                                  ),
                                  child: CabeceraWidget(
                                    label: 'Otras Gestiones',
                                    color: AppColors.cabeceraAdmin,
                                  ),
                                ),
                                GestionWidget(label: 'Artículos'),
                                GestionWidget(label: 'Categorías'),
                                GestionWidget(label: 'Recetas'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: SizedBox(
                width: 130,
                child: ElevatedButton(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                  ),
                  child: const Text('Log Out'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
