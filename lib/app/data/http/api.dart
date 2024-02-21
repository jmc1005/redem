import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class Api {
  Api({
    required Client client,
    required String baseUrl,
  })  : _client = client,
        _baseUrl = baseUrl;

  final Client _client;
  final String _baseUrl;

  Future<Response> request(
    String path, {
    HttpMethod method = HttpMethod.get,
    Map<String, String> headers = const {},
    Map<String, String> body = const {},
    Map<String, String> queryParameters = const {},
  }) async {
    late final Response response;
    Uri url = Uri.parse('$_baseUrl$path');

    if (queryParameters.isNotEmpty) {
      url = url.replace(queryParameters: queryParameters);
    }

    headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      ...headers
    };

    body = {...body};

    try {
      final jsonBody = jsonEncode(body);
      const duration = Duration(seconds: 5);

      switch (method) {
        case HttpMethod.get:
          response = await _client
              .get(url, headers: headers)
              .timeout(duration, onTimeout: () => Response('Error', 408));
          break;
        case HttpMethod.post:
          response = await _client
              .post(url, headers: headers, body: jsonBody)
              .timeout(duration, onTimeout: () => Response('Error', 408));
          break;

        case HttpMethod.patch:
          response = await _client
              .patch(url, headers: headers, body: jsonBody)
              .timeout(duration, onTimeout: () => Response('Error', 408));
          break;

        case HttpMethod.delete:
          response = await _client
              .delete(url, headers: headers, body: jsonBody)
              .timeout(duration, onTimeout: () => Response('Error', 408));
          break;

        case HttpMethod.put:
          response = await _client
              .put(url, headers: headers, body: jsonBody)
              .timeout(duration, onTimeout: () => Response('Error', 408));
          break;
      }
    } catch (e) {
      if (e is ClientException || e is SocketException) {
        throw Exception(e);
      }
    }

    return Future.value(response);
  }
}

enum HttpMethod { get, post, patch, delete, put }
