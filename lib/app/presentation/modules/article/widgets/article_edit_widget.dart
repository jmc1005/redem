import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../domain/models/article_data/article_data.dart';
import '../../../global/widgets/html_editor_widget.dart';
import '../../../global/widgets/switch_widget.dart';
import '../controller/article_controller.dart';

class ArticleEditWidget extends StatefulWidget {
  const ArticleEditWidget({super.key, required this.controller});

  final ArticleController controller;

  @override
  State<ArticleEditWidget> createState() => _ArticleEditWidgetState();
}

class _ArticleEditWidgetState extends State<ArticleEditWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ArticleController>(context);
    final textEditingController = TextEditingController();
    final focusNode = FocusNode();
    final language = AppLocalizations.of(context)!;
    final articleData = controller.state;
    final article = articleData?.article;

    textEditingController.text = article?.title ?? '';

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16,
      ),
      child: SafeArea(
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
              // https://pub.dev/documentation/image_field/latest/
              // TODO: Carousel
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://images.unsplash.com/photo-1541167760496-1628856ab772?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3437&q=80',
                  width: double.infinity,
                  height: 230,
                  fit: BoxFit.cover,
                ),
              ),
              SwitchWidget(
                label: 'publicado',
                checked: article?.isPublished ?? false,
                onChanged: (value) => controller.onChangeIsPublished(value),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: textEditingController,
                focusNode: focusNode,
                textCapitalization: TextCapitalization.words,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  labelText: language.titulo,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFE5E7EB),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFE5E7EB),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: const TextStyle(
                  color: Color(0xFF15161E),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                cursorColor: const Color(0xFF6F61EF),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${language.ultima_actualizacion} ${DateFormat('dd-MM-yyyy').format(DateTime.now())}',
                      style: const TextStyle(
                        color: Color(0xFF57636C),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 20,
                thickness: 2,
                indent: 8,
                endIndent: 8,
                color: Color(0xFFDBE2E7),
              ),
              const SizedBox(height: 8),
              HtmlEditorWidget(
                onTextChanged: (text) => controller.onContentChanged(text),
                content: article?.content ?? '',
              ),
              const SizedBox(height: 8),
              SizedBox(
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
            ],
          ),
        ),
      ),
    );
  }
}
