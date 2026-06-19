import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skillhub/core/network/api_exception.dart';

class ApiClient {
  ApiClient({http.Client? client, String? baseUrl})
    : _client = client ?? http.Client(),
      baseUrl = baseUrl ?? _defaultBaseUrl;

  static const _tokenKey = 'skillhub_auth_token';
  static const _requestTimeout = Duration(seconds: 8);
  static const _configuredBaseUrl = String.fromEnvironment('API_BASE_URL');

  static String get _defaultBaseUrl {
    if (_configuredBaseUrl.isNotEmpty) {
      return _configuredBaseUrl.replaceFirst(RegExp(r'/+$'), '');
    }
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      return 'http://10.0.2.2:3000/api/v1';
    }
    return 'http://localhost:3000/api/v1';
  }

  final http.Client _client;
  final String baseUrl;

  Future<String?> get token async =>
      (await SharedPreferences.getInstance()).getString(_tokenKey);

  Future<void> saveToken(String value) async =>
      (await SharedPreferences.getInstance()).setString(_tokenKey, value);

  Future<void> clearToken() async =>
      (await SharedPreferences.getInstance()).remove(_tokenKey);

  Future<Map<String, dynamic>> login(String email, String password) async {
    final data = await post('/auth/login', {
      'email': email,
      'password': password,
    }, authenticated: false);
    await saveToken(data['token'] as String);
    return data;
  }

  Future<dynamic> get(String path, {Map<String, String>? query}) async {
    final uri = Uri.parse('$baseUrl$path').replace(queryParameters: query);
    return _send(() async => _client.get(uri, headers: await _headers()));
  }

  Future<dynamic> post(
    String path,
    Map<String, dynamic> body, {
    bool authenticated = true,
  }) async {
    return _send(
      () async => _client.post(
        Uri.parse('$baseUrl$path'),
        headers: await _headers(authenticated: authenticated),
        body: jsonEncode(body),
      ),
    );
  }

  Future<dynamic> put(String path, Map<String, dynamic> body) async {
    return _send(
      () async => _client.put(
        Uri.parse('$baseUrl$path'),
        headers: await _headers(),
        body: jsonEncode(body),
      ),
    );
  }

  Future<void> delete(String path) async {
    await _send(
      () async =>
          _client.delete(Uri.parse('$baseUrl$path'), headers: await _headers()),
    );
  }

  Future<dynamic> patch(String path, [Map<String, dynamic>? body]) async {
    return _send(
      () async => _client.patch(
        Uri.parse('$baseUrl$path'),
        headers: await _headers(),
        body: body == null ? null : jsonEncode(body),
      ),
    );
  }

  Future<Map<String, String>> _headers({bool authenticated = true}) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    final savedToken = authenticated ? await token : null;
    if (savedToken != null) headers['Authorization'] = 'Bearer $savedToken';
    return headers;
  }

  Future<dynamic> _send(Future<http.Response> Function() request) async {
    try {
      final response = await request().timeout(_requestTimeout);
      final body = response.body.isEmpty ? null : jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) return body;
      throw ApiException(
        body is Map
            ? (body['error']?.toString() ?? 'تعذر تنفيذ الطلب')
            : 'تعذر تنفيذ الطلب',
        statusCode: response.statusCode,
      );
    } on TimeoutException {
      throw const ApiException(
        'انتهت مهلة الاتصال بالخادم. تأكد أن الـ API يعمل على المنفذ 3000.',
      );
    } on http.ClientException {
      throw const ApiException(
        'تعذر الوصول إلى الخادم. شغّل الـ API ثم حاول مرة أخرى.',
      );
    } on FormatException {
      throw const ApiException('استجابة غير صالحة من الخادم.');
    }
  }
}
