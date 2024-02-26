import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../utils/locale/language_translation.dart';
import '../controller/user_detail_controller.dart';
import '../widgets/accordion_widget.dart';

class UserDetailView extends StatefulWidget {
  const UserDetailView({super.key});

  @override
  State<UserDetailView> createState() => _UserDetailViewState();
}

class _UserDetailViewState extends State<UserDetailView> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ''; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = UserDetailController(
      sessionLangController: context.read(),
      sessionUserController: context.read(),
    );
    final language = LanguageTranslation.of(context)!;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/redem_white.png',
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Builder(builder: (context) {
            return Form(
              child: Column(
                children: [
                  Expanded(
                    child: AccordionWidget(
                      controller: controller,
                      language: language,
                      dateInput: dateInput,
                      onTap: () {
                        openDatePicker(controller);
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Future<void> openDatePicker(UserDetailController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final String date = DateFormat('dd-MM-yyyy').format(pickedDate);
      controller.onChangeValueDateOfBirth(date);
      dateInput.text = date;
    } else {}
  }
}
