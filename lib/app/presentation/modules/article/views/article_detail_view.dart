import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../domain/models/article_data/article_data.dart';
import '../../../global/widgets/app_bar_widget.dart';
import '../../../routes/app_routes.dart';
import '../../../routes/routes.dart';
import '../controller/article_controller.dart';
import '../widgets/article_edit_widget.dart';
import '../widgets/article_read_widget.dart';

class ArticleDetailView extends StatefulWidget {
  const ArticleDetailView({
    super.key,
    required this.editMode,
    this.articleData,
  });

  final bool editMode;
  final ArticleData? articleData;

  @override
  State<ArticleDetailView> createState() => _ArticleDetailViewState();
}

class _ArticleDetailViewState extends State<ArticleDetailView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ArticleController>(
      create: (_) => ArticleController(
        articleRepo: context.read(),
        sessionService: context.read(),
      ),
      child: Builder(builder: (context) {
        final controller = Provider.of<ArticleController>(context);
        if (widget.articleData != null) {
          controller.articleData = widget.articleData!;
        }

        return Scaffold(
          appBar: AppBarWidget(
            asset: 'assets/images/redem.png',
            leading: IconButton(
              onPressed: () {
                navigateTo(Routes.articles, context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.secondary,
              ),
            ),
            backgroundColor: Colors.blueGrey[100],
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: widget.editMode
                      ? ArticleEditWidget(
                          controller: controller,
                        )
                      : ArticleReadWidget(
                          controller: controller,
                        ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
