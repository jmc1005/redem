import 'package:flutter/material.dart';

import '../controller/user_detail_controller.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({super.key, required this.userDetailController});

  final UserDetailController userDetailController;

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = widget.userDetailController;

    return Stepper(
      currentStep: controller.currentStep,
      onStepTapped: (step) => setState(
        () => controller.currentStep = step,
      ),
      onStepContinue: () async {
        final isLastStep =
            (controller.currentStep == controller.steps.length - 1);
        if (isLastStep) {
          /// Guardar los datos
          bool ok = await controller.saveUser();
          if (ok) {
            ok = await controller.saveSymptomUser();
          }

          if (ok) {
            controller.mostrarSuccess();
            controller.currentStep = 0;
          }
        } else {
          setState(() {
            controller.currentStep += 1;
          });
        }
      },
      onStepCancel: controller.currentStep > 0
          ? () => setState(() => controller.currentStep -= 1)
          : null,
      steps: controller.steps,
    );
  }
}
