import '../../data/http/result.dart';
import '../models/article_data/article_data.dart';

abstract class ArticleRepo {
  Future<Result<List<ArticleData>, int>> getAll();

  Future<Result<ArticleData, int>> create();

  Future<Result<ArticleData, int>> update(String uuid);

  Future<Result<ArticleData, int>> remove(String uuid);
}
