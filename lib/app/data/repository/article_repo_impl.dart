import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../../domain/models/article/article.dart';
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
  Future<Result<List<ArticleData>, int>> getAll() async {
    final List<ArticleData> list = [];

    final articles = await _api.getAll();

    for (final element in articles) {
      list.add(ArticleData.fromJson(element));
    }

    log('getAll $list');
    return Success(list);
  }

  @override
  Future<Result<ArticleData, int>> get(String documentPath) async {
    final article = await _api.get(documentPath);

    log('get $article');
    return Success(ArticleData.fromJson(article));
  }

  @override
  Future<Result<Json, int>> set(Json data) async {
    const uuid = Uuid();
    final uuidDoc = uuid.v1();

    final article = data['article'];
    article.update('uuid', (value) => uuidDoc);
    article.update('created_at', (value) => DateTime.now().toString());

    final json = await _api.set(data, uuidDoc);

    log('set $json');
    if (json.containsKey('success')) {
      return Success(json);
    } else {
      return const Failure(500);
    }
  }
}
