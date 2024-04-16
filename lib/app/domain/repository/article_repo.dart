import '../../data/http/result.dart';
import '../models/article_data/article_data.dart';
import '../models/typedefs.dart';

abstract class ArticleRepo {
  Future<Result<List<ArticleData>, int>> getAll();

  Future<Result<ArticleData, int>> get(String documentPath);

  Future<Result<Json, int>> set(Json data);
}
