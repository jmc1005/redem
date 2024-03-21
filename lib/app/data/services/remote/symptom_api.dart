import 'dart:io';

import 'package:http/http.dart';
import '../../http/api.dart';

class SymptomApi {
  SymptomApi(this._api);

  final Api _api;
  final String uriSymptoms = '/symptoms';
  final String uriSymptomsUser = '/symptoms/all';
  final String uriAdd = '/symptoms/add';
  final String uriRemove = '/symptoms/remove';

  /// sypmtom

  Future<Response> getSymptoms({required String token}) {
    final headers = {HttpHeaders.authorizationHeader: token};

    return _api.request(
      uriSymptoms,
      headers: headers,
    );
  }

  Future<Response> getSymptomsByUser({required String token}) {
    final headers = {HttpHeaders.authorizationHeader: token};

    return _api.request(uriSymptomsUser, headers: headers);
  }

  Future<Response> addSymptomUser({
    required String token,
    required String symptom,
  }) {
    final body = {
      'sypmtom': symptom,
    };

    final headers = {
      HttpHeaders.authorizationHeader: token,
    };

    return _api.request(
      uriAdd,
      method: HttpMethod.post,
      headers: headers,
      body: body,
    );
  }

  Future<Response> removeSymptomUser({
    required String token,
    required String symptom,
  }) {
    final body = {
      'sypmtom': symptom,
    };

    final headers = {
      HttpHeaders.authorizationHeader: token,
    };

    return _api.request(
      uriRemove,
      method: HttpMethod.post,
      headers: headers,
      body: body,
    );
  }
}
