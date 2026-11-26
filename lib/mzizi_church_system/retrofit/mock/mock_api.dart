import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:http/testing.dart' as http_testing;

/// Offline mock of the Mzizi Church API, for using and demoing the app
/// without the real backend.
///
/// Off by default. Turn it on with:
///
///   flutter run --flavor mzizicms --dart-define=MOCK_API=true
///
/// Every request is answered from `assets/mock_api/<EndpointName>.json`
/// (e.g. `POST /PortalEvents` -> `assets/mock_api/PortalEvents.json`).
/// Edit those files to change what the app shows. Any username, password and
/// church code are accepted at login.
///
/// Dates in fixtures can be written relative to today so the data never goes
/// stale: `{{date}}` is today and `{{date+3}}` / `{{date-10}}` are days from
/// today, all in the server's `M/d/yyyy` format.
class MockApi {
  MockApi._();

  static const bool enabled =
      bool.fromEnvironment('MOCK_API', defaultValue: false);

  /// Simulated network latency, so loading states are still visible.
  static const Duration latency = Duration(milliseconds: 400);

  /// Use instead of `Dio()` for every API client.
  static Dio dio() {
    final dio = Dio();
    if (enabled) dio.interceptors.add(_MockInterceptor());
    return dio;
  }

  /// Use instead of `http.Client()` for the legacy PORTAL_URL (.asmx) calls.
  static http.Client httpClient() {
    if (!enabled) return http.Client();
    return http_testing.MockClient((http.Request request) async {
      await Future.delayed(latency);
      final body = await _fixtureText(request.url.pathSegments.last);
      if (body == null) return http.Response('Not mocked', 404);
      return http.Response(body, 200,
          headers: {'content-type': 'application/json; charset=utf-8'});
    });
  }

  static Future<String?> _fixtureText(String endpoint) async {
    String text;
    try {
      text = await rootBundle.loadString('assets/mock_api/$endpoint.json');
    } catch (_) {
      return null;
    }
    return text.replaceAllMapped(RegExp(r'\{\{date([+-]\d+)?\}\}'), (m) {
      final offset = m.group(1) == null ? 0 : int.parse(m.group(1) ?? '');
      final d = DateTime.now().add(Duration(days: offset));
      return '${d.month}/${d.day}/${d.year}';
    });
  }

  static Future<dynamic> fixture(String endpoint) async {
    final text = await _fixtureText(endpoint);
    return text == null ? null : json.decode(text);
  }
}

class _MockInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    await Future.delayed(MockApi.latency);
    final endpoint = options.path.split('/').where((s) => s.isNotEmpty).last;
    final data = await MockApi.fixture(endpoint);
    if (data == null) {
      // Unknown endpoint: fail the same way a server 404 would.
      handler.reject(DioException(
        requestOptions: options,
        response: Response(
            statusCode: 404, data: 'Not mocked', requestOptions: options),
        type: DioExceptionType.badResponse,
        error: 'MockApi: no fixture for $endpoint',
      ));
      return;
    }
    handler.resolve(
        Response(data: data, statusCode: 200, requestOptions: options));
  }
}
