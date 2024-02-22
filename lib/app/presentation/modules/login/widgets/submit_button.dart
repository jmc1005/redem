// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/http/result.dart';
import '../../../../domain/models/user/user.dart';
import '../../../global/controllers/session_user_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/routes.dart';
import '../controller/login_controller.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Provider.of(context);

    if (controller.state.loading) {
      return const Center(
        child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(),
        ),
      );
    }

    return ElevatedButton(
      onPressed: () => _submit(context),
      child: const Text('Login'),
    );
  }

  Future<void> _submit(BuildContext context) async {
    final LoginController controller = context.read();

    final result = await controller.submit();

    if (!controller.mounted) {
      return;
    }

    final value = switch (result) {
      Success(value: final User user) => user,
      Failure(exception: final exception) => exception
    };

    if (value is User) {
      final SessionUserController sessionController = context.read();
      sessionController.user = value;
      navigateTo(Routes.home, context);
    } else if (value is Exception) {
      mostrarError(context, value);
    }
  }

  void mostrarError(BuildContext context, Exception exception) {
    final snackBar = SnackBar(content: Text(exception.toString()));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
