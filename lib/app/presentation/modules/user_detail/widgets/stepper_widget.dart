import 'package:flutter/material.dart';

import '../../../../config/colors/app_colors.dart';
import '../controller/user_detail_controller.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({super.key, required this.userDetailController});

  final UserDetailController userDetailController;

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      connectorColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primary;
        }

        return Colors.grey.shade400;
      }),
      currentStep: currentStep,
      onStepCancel: () => currentStep == 0
          ? null
          : setState(() {
              currentStep -= 1;
            }),
      onStepContinue: () {
        final bool isLastStep =
            (currentStep == widget.userDetailController.steps.length - 1);

        if (isLastStep) {
          //Do something with this information
        } else {
          setState(() {
            currentStep += 1;
          });
        }
      },
      onStepTapped: (step) => setState(() {
        currentStep = step;
      }),
      steps: widget.userDetailController.steps,
    );
  }
}
