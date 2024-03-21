import 'package:freezed_annotation/freezed_annotation.dart';

import '../article/article.dart';
import '../typedefs.dart';

part 'article_data.freezed.dart';
part 'article_data.g.dart';

@freezed
class ArticleData with _$ArticleData {
  const factory ArticleData({
    required Article article,
    required List<String> media,
  }) = _ArticleData;

  factory ArticleData.fromJson(Json json) => _$ArticleDataFromJson(json);
}
