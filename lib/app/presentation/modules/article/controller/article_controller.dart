import 'package:flutter/material.dart';

import '../../../../data/services/local/session_service.dart';
import '../../../../domain/models/article_data/article_data.dart';
import '../../../../domain/repository/article_repo.dart';
import '../../../global/state_notifier.dart';

class ArticleController extends StateNotifier<ArticleData?> {
  ArticleController({
    required this.articleRepo,
    required this.sessionService,
  }) : super(null);

  final ArticleRepo articleRepo;
  final SessionService sessionService;

  set articleData(ArticleData articleData) {
    state = articleData;
    onlyUpdate(state);
  }

  void onChangeIsPublished(bool isPublished) {
    var articleData = state!;
    final article = articleData.article.copyWith(isPublished: isPublished);
    articleData = articleData.copyWith(article: article);

    this.articleData = articleData;
  }

  void onContentChanged(String text) {
    debugPrint('On text changed : $text');

    if (text != '') {
      var articleData = state!;
      final article = articleData.article.copyWith(content: text);
      articleData = articleData.copyWith(article: article);

      this.articleData = articleData;
    }
  }
}
