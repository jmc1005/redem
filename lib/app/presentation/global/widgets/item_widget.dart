import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../config/colors/app_colors.dart';
import '../../routes/app_routes.dart';
import '../../routes/routes.dart';
import '../dialogs/dialog_confirm.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.editMode,
    required this.showMedia,
    required this.media,
    required this.title,
    required this.content,
    this.onTap,
  });

  final bool editMode;
  final bool showMedia;
  final String? media;
  final String title;
  final String content;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context)!;

    final List<Widget> actions = [
      OutlinedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          language.cancelar,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      OutlinedButton(
        onPressed: () {
          Navigator.pop(context, true);
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          language.aceptar,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ];

    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          if (showMedia)
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0x4D9489F5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF6F61EF),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: media != null
                      ? Image.network(
                          media!,
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.no_photography_outlined,
                          size: 48,
                        ),
                ),
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 4),
                    child: Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(end: 12),
                            child: Text(
                              content,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color(0xFF606A85),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 4),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              0,
                              8,
                              12,
                              0,
                            ),
                            child: Text(
                              language.leer_mas,
                              style: const TextStyle(
                                color: AppColors.secondary,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showConfirmDialog(
                              context,
                              title: language.seguro_borrar(
                                language.articulo,
                              ),
                              actions: actions,
                            );
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: AppColors.secondary,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
