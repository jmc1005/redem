import 'dart:io';

import 'package:http/http.dart';

import '../../http/api.dart';

class ArticleApi {
  final Api _api;

  ArticleApi(this._api);

  final String uri = '/articles';

  Future<Response> getAll({required String token}) {
    final headers = {HttpHeaders.authorizationHeader: token};

    return _api.request(uri, headers: headers);
  }
}
