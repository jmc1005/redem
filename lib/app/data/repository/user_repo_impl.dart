import 'dart:convert';
import 'dart:io';

import 'package:jwt_decoder/jwt_decoder.dart';

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
  Future<Result<User, int>> login(String email, String password) async {
    final loginResponse = await _api.login(
      email: email,
      password: password,
    );

    if (loginResponse.statusCode == HttpStatus.ok) {
      final json = jsonDecode(loginResponse.body) as Json;

      if (json['token'] != null) {
        final token = json['token'];

        final decodedToken = JwtDecoder.decode(token);
        final role = decodedToken['role'];
        await _sessionService.saveRole(role);
        await _sessionService.saveToken(token);

        return getUser();
      } else {
        return Failure(loginResponse.statusCode);
      }
    }

    return Failure(loginResponse.statusCode);
  }

  @override
  Future<Result<User, int>> signUp(String email, String password) async {
    final response = await _api.signUp(
      email: email,
      password: password,
    );

    if (response.statusCode == HttpStatus.created) {
      return login(email, password);
    } else {
      return Failure(response.statusCode);
    }
  }

  @override
  Future<Result<User, int>> getUser() async {
    final token = await _sessionService.token;

    final response = await _api.getUserInfo(token: token ?? '');

    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body) as Json;

      return Success(User.fromJson(json['data']));
    } else {
      return Failure(response.statusCode);
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

  @override
  Future<Result<String, int>> saveUser(
    String uuid,
    String firstName,
    String lastName,
    String dateOfBirth,
    String sex,
    String email,
    String userType,
    String city,
    String country,
  ) async {
    final token = await _sessionService.token;

    final response = await _api.saveUser(
      token: token ?? '',
      uuid: uuid,
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: dateOfBirth,
      sex: sex,
      email: email,
      userType: userType,
      city: city,
      country: country,
    );

    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body) as Json;

      return Success(json['message']);
    } else {
      return Failure(response.statusCode);
    }
  }
}
