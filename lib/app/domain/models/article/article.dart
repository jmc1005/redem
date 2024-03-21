import 'package:freezed_annotation/freezed_annotation.dart';

import '../typedefs.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {
  const factory Article(
    String uuid,
    String title,
    String content,
    @JsonKey(name: 'is_published') bool isPublished,
    @JsonKey(name: 'created_at') DateTime createAt,
  ) = _Article;

  factory Article.fromJson(Json json) => _$ArticleFromJson(json);
}
