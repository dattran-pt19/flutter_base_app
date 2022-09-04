import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:base_flutter/base/network/common_api.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'base_exceptions.dart';

class BaseService {
  static const int timeOutDuration = 30;
  static const Map<String, dynamic> emptyMap = {};

  Map<String, String> requestHeaders = {
    HttpHeaders.contentTypeHeader: "application/json"
  };

  /// Get header here
  Map<String, String> _getHeaders() {
    Map<String, String> authorization = {};
    requestHeaders.addAll(authorization);
    return requestHeaders;
  }

  /// Get
  Future<NetworkCallBackModel> get(String api, {Map<String, dynamic> params = emptyMap}) async {
    var uri = Uri.https(CommonAPI.baseUrl, api, params);
    Logger().d(">>>>>> Params -> ${params.toString()}");
    Logger().d(">>>>>> API -> ${uri.toString()}");
    try {
      var response =
      await http.get(uri, headers: _getHeaders())
          .timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      return NetworkCallBackModel(null, error: NetworkExceptionType.noInternet);
    } on TimeoutException {
      return NetworkCallBackModel(null, error: NetworkExceptionType.timeout);
    }
  }

  /// Post
  Future<NetworkCallBackModel> post(String api,
      {Map<String, dynamic>? body}) async {
    var uri = Uri.https(CommonAPI.baseUrl, api);
    Logger().d(">>>>>> API -> ${uri.toString()}");
    try {
      var bodyJson = jsonEncode(body);
      Logger().d(">>>>>> Body -> $bodyJson");
      var response = await http
          .post(uri, body: bodyJson, headers: _getHeaders())
          .timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      return NetworkCallBackModel(null, error: NetworkExceptionType.noInternet);
    } on TimeoutException {
      return NetworkCallBackModel(null, error: NetworkExceptionType.timeout);
    }
  }

  NetworkCallBackModel _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        Logger().d(">>>>>> Response is ${response.body}");
        final body = json.decode(response.body);
        return NetworkCallBackModel(body);
      case 400:
        return NetworkCallBackModel(null,
            error: NetworkExceptionType.badRequest);
      case 401:
      case 403:
        return NetworkCallBackModel(null,
            error: NetworkExceptionType.unAuthorization);
      case 500:
      default:
        return NetworkCallBackModel(null, error: NetworkExceptionType.notFound);
    }
  }
}
