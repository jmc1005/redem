import 'dart:convert';
import 'dart:io';

import '../../domain/models/symptom/symptom.dart';
import '../../domain/models/typedefs.dart';
import '../../domain/repository/symptom_repo.dart';
import '../http/result.dart';
import '../services/local/session_service.dart';
import '../services/remote/symptom_api.dart';

class SymptomRepoImpl implements SymptomRepo {
  SymptomRepoImpl(this._api, this._sessionService);

  final SymptomApi _api;
  final SessionService _sessionService;

  @override
  Future<Result<List<Symptom>, int>> getSymptoms() async {
    final token = await _sessionService.token;

    final response = await _api.getSymptoms(token: token ?? '');

    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body) as Json;

      final data = json['data'] as List;
      final list = data.map((d) => Symptom.fromJson(d));

      return Success(list.toList());
    } else {
      return Failure(response.statusCode);
    }
  }

  @override
  Future<Result<List<Symptom>, int>> getSymptomsByUser() async {
    final token = await _sessionService.token;

    final response = await _api.getSymptomsByUser(token: token ?? '');

    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body) as Json;

      final data = json['data'] as List;
      final list = data.map((d) => Symptom.fromJson(d));

      return Success(list.toList());
    } else {
      return Failure(response.statusCode);
    }
  }

  @override
  Future<Result<String, int>> addSymptomUser(String symptom) async {
    final token = await _sessionService.token;

    final response =
        await _api.addSymptomUser(token: token ?? '', symptom: symptom);

    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body) as Json;

      return Success(json['message']);
    } else {
      return Failure(response.statusCode);
    }
  }

  @override
  Future<Result<String, int>> removeSymptomUser(String symptom) async {
    final token = await _sessionService.token;

    final response =
        await _api.addSymptomUser(token: token ?? '', symptom: symptom);

    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body) as Json;

      return Success(json['message']);
    } else {
      return Failure(response.statusCode);
    }
  }
}
