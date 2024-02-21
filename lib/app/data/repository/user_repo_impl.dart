import 'dart:convert';
import 'dart:io';

import '../../domain/models/typedefs.dart';
import '../../domain/models/user/user.dart';
import '../../domain/repository/user_repo.dart';
import '../http/result.dart';
import '../services/local/session_service.dart';
import '../services/remote/user_api.dart';

class UserRepoImpl implements UserRepo {
  UserRepoImpl(this._api, this._sessionService);

  final UserApi _api;
  final SessionService _sessionService;

  @override
  Future<Result<User, Exception>> login(String email, String password) async {
    final loginResponse = await _api.login(
      email: email,
      password: password,
    );

    if (loginResponse.statusCode == HttpStatus.ok) {
      final json = jsonDecode(loginResponse.body) as Json;

      if (json['token'] != null) {
        final token = json['token'];
        await _sessionService.saveToken(token);

        return getUser();
      } else {
        return Failure(Exception('Error al obtener el token'));
      }
    }

    return Failure(
      Exception(
        'Error ${loginResponse.statusCode} al obtener los datos del login',
      ),
    );
  }

  @override
  Future<Result<User, Exception>> signUp(String email, String password) async {
    final response = await _api.signUp(
      email: email,
      password: password,
    );

    if (response.statusCode == HttpStatus.created) {
      return login(email, password);
    } else {
      return Failure(
        Exception(
          'Error ${response.statusCode} al realizar el registro',
        ),
      );
    }
  }

  @override
  Future<Result<User, Exception>> getUser() async {
    final token = await _sessionService.token;

    final response = await _api.getUserInfo(token: token ?? '');

    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body) as Json;

      return Success(User.fromJson(json['data']));
    } else {
      return Failure(
        Exception(
          'Error ${response.statusCode} al obtener la información del usuario',
        ),
      );
    }
  }

  @override
  Future<bool> get isSignedIn async {
    return await _sessionService.token != null;
  }

  @override
  Future<void> signOut() {
    return _sessionService.signOut();
  }
}
