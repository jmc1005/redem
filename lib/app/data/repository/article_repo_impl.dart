import 'dart:convert';
import 'dart:io';

import '../../domain/models/article_data/article_data.dart';
import '../../domain/models/typedefs.dart';
import '../../domain/repository/article_repo.dart';
import '../http/result.dart';
import '../services/local/session_service.dart';
import '../services/remote/article_api.dart';

class ArticleRepoImpl implements ArticleRepo {
  final ArticleApi _api;
  final SessionService _sessionService;

  ArticleRepoImpl(this._api, this._sessionService);

  @override
  Future<Result<ArticleData, int>> create() {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Result<List<ArticleData>, int>> getAll() async {
    final token = await _sessionService.token;

    final response = await _api.getAll(token: token ?? '');

    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body) as Json;

      final data = json['data'] as List;
      final list = data.map((d) => ArticleData.fromJson(d));

      return Success(list.toList());
    } else {
      return Failure(response.statusCode);
    }
  }

  @override
  Future<Result<ArticleData, int>> remove(String uuid) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<Result<ArticleData, int>> update(String uuid) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
