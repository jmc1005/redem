import 'package:flutter/material.dart';

class UserSubmitButtonWidget extends StatelessWidget {
  const UserSubmitButtonWidget(
      {super.key, this.onPressed, required this.loading, required this.label});

  final void Function()? onPressed;
  final String label;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(
        child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(),
        ),
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
