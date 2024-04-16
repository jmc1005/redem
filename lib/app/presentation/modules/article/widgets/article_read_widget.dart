import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../domain/models/article_data/article_data.dart';
import '../controller/article_controller.dart';

class ArticleReadWidget extends StatelessWidget {
  const ArticleReadWidget({super.key, required this.controller});

  final ArticleController controller;

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              color: Color(0x33000000),
              offset: Offset(0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://images.unsplash.com/photo-1541167760496-1628856ab772?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3437&q=80',
                width: double.infinity,
                height: 230,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Product Name',
              style: TextStyle(
                color: Color(0xFF0F1113),
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  DateFormat('dd-MM-yyyy').format(DateTime.now()),
                  style: const TextStyle(
                    color: Color(0xFF57636C),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 2,
              indent: 8,
              endIndent: 8,
              color: Color(0xFFDBE2E7),
            ),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: TextStyle(
                color: Color(0xFF0F1113),
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 24),
              child: SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: () {
                    showTopSnackBar(
                        Overlay.of(context),
                        const CustomSnackBar.success(
                          message:
                              'Good job, your release is successful. Have a nice day',
                        ),
                        dismissType: DismissType.onSwipe,
                        dismissDirection: [DismissDirection.endToStart],
                        snackBarPosition: SnackBarPosition.bottom);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                  ),
                  child: Text(language.guardar),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
