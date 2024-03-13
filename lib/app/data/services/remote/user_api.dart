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

  Future<Response> saveUser({
    required String token,
    required String uuid,
    required String firstName,
    required String lastName,
    required String dateOfBirth,
    required String sex,
    required String email,
    required String userType,
    required String city,
    required String country,
  }) {
    final body = {
      'uuid': uuid,
      'first_name': firstName,
      'last_name': lastName,
      'date_of_birth': dateOfBirth,
      'sex': sex,
      'email': email,
      'user_type': userType,
      'city': city,
      'country': country
    };

    final headers = {HttpHeaders.authorizationHeader: token};

    return _api.request(
      uriUser,
      method: HttpMethod.put,
      body: body,
      headers: headers,
    );
  }
}
