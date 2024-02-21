import 'dart:io';

import 'package:http/http.dart';

import '../../http/api.dart';

class UserApi {
  UserApi(this._api);

  final Api _api;
  final String uriSignUp = '/users/signup';
  final String uriLogin = '/users/login';
  final String uriUser = '/users';

  Future<Response> login({
    required String email,
    required String password,
  }) {
    final body = {
      'email': email,
      'password': password,
    };

    return _api.request(uriLogin, method: HttpMethod.post, body: body);
  }

  Future<Response> signUp({
    required String email,
    required String password,
  }) {
    final body = {
      'email': email,
      'password': password,
    };

    return _api.request(uriSignUp, method: HttpMethod.post, body: body);
  }

  Future<Response> getUserInfo({
    required String token,
  }) {
    final headers = {HttpHeaders.authorizationHeader: token};

    return _api.request(uriUser, headers: headers);
  }
}
