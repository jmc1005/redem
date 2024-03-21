import 'package:flutter/material.dart';

import '../../../../domain/models/article_data/article_data.dart';
import '../../../global/widgets/item_widget.dart';

class ArticleWidget extends StatefulWidget {
  const ArticleWidget({super.key, required this.articleData});
  final ArticleData articleData;

  @override
  State<ArticleWidget> createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {
  @override
  Widget build(BuildContext context) {
    final articleData = widget.articleData.copyWith();
    final media = articleData.media.isNotEmpty ? articleData.media[0] : null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: Container(
        width: double.infinity,
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
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ItemWidget(
            showMedia: true,
            media: media,
            title: articleData.article.title,
            content: articleData.article.content,
          ),
        ),
      ),
    );
  }
}
