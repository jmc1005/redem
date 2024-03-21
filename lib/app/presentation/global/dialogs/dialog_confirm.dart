import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../config/colors/app_colors.dart';

Future<bool> showConfirmDialog(
  BuildContext context, {
  String title = '',
  required List<Widget> actions,
}) async {
  final result = await showDialog<bool>(
    context: context,
    barrierColor: Colors.white.withOpacity(0.4), // cambiar la sombra
    barrierDismissible: false, // evitar cerrar popup al pulsar fuera del dialog
    builder: (context) => _DialogContent(
      title: title,
      actions: actions,
    ),
  );

  return result ?? false;
}

class _DialogContent extends StatelessWidget {
  const _DialogContent({
    super.key,
    required this.title,
    required this.actions,
  });

  final String title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ), // cambiar el borde radius
        actionsAlignment: MainAxisAlignment.center,
        actions: actions,
      ),
      onPopInvoked: (didPop) => false,
    );
  }
}
