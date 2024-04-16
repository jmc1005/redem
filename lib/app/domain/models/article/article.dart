import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

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
    @JsonKey(name: 'created_at', readValue: readCreatedAt) String createAt,
  ) = _Article;

  factory Article.fromJson(Json json) => _$ArticleFromJson(json);
}

Object? readCreatedAt(Map map, String _) {
  final timestamp = map['created_at'];
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp.seconds * 1000);

  return DateFormat('dd-MM-yyyy').format(date);
}
