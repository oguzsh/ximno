import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:ximno/core/utils/constants.dart';

import 'api_errors.dart';

class BaseAPI {
  final timeOutDuration = const Duration(seconds: 20);

  final String _baseUrl = Constants.apiBaseUrl;
  final String _path;

  final Map<String, String> headers = {"Content-Type": "application/json"};

  var errorMap = {
    400: BadRequestError(),
    401: UnauthorizedError(),
    403: UnauthorizedError(),
    404: NotFoundError(),
    409: ConflictError(),
    500: ServerError(),
  };

  BaseAPI(this._path);

  Future<Response<dynamic>> get([String? uuid]) async {
    Uri url = _buildUrl(uuid);

    try {
      var response =
          await http.get(url, headers: headers).timeout(timeOutDuration);

      return _perform(response);
    } on SocketException {
      throw FetchDataError('No internet connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingError(
          'API taking too long to response', url.toString());
    }
  }

  Future<Response<dynamic>> post(dynamic payloadObj) async {
    Uri url = _buildUrl();
    var payload = json.encode(payloadObj);

    try {
      var response = await http
          .post(url, headers: headers, body: payload)
          .timeout(timeOutDuration);

      return _perform(response);
    } on SocketException {
      throw FetchDataError('No internet connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingError(
          'Api taking too long to response', url.toString());
    }
  }

  Future<Response<dynamic>> put(String uuid, dynamic payloadObj) async {
    Uri url = _buildUrl(uuid);
    var payload = json.encode(payloadObj);

    try {
      var response = await http
          .post(url, headers: headers, body: payload)
          .timeout(timeOutDuration);

      return _perform(response);
    } on SocketException {
      throw FetchDataError('No internet connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingError(
          'Api taking too long to response', url.toString());
    }
  }

  Future<Response<dynamic>> delete(String uuid) async {
    Uri url = _buildUrl(uuid);

    try {
      var response =
          await http.delete(url, headers: headers).timeout(timeOutDuration);

      return _perform(response);
    } on SocketException {
      throw FetchDataError('No internet connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingError(
          'Api taking too long to response', url.toString());
    }
  }

  Uri _buildUrl([String? uuid]) {
    return uuid == null
        ? Uri.parse('$_baseUrl/$_path')
        : Uri.parse('$_baseUrl/$_path/$uuid');
  }

  dynamic _perform(http.Response response) {
    if (response.statusCode != 200) {
      var error = errorMap[response.statusCode]!;

      error.message = jsonDecode(response.body);
      error.url = response.request!.url.toString();

      throw error;
    }

    return jsonDecode(response.body);
  }
}
