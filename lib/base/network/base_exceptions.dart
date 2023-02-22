import 'package:easy_localization/easy_localization.dart';

class BaseException implements Exception {
  final String message;
  final String prefix;
  final String url;

  BaseException(this.message, this.prefix, this.url);
}

class BadRequestException extends BaseException {
  BadRequestException({required String message, required String url}): super(message, "Bed request", url);
}

class FetchDataException extends BaseException {
  FetchDataException({required String message, required String url}): super(message, "Unable to fetch", url);
}

class ApiNotRespondingException extends BaseException {
  ApiNotRespondingException({required String message, required String url}): super(message, "Api not responded in time", url);
}

class UnAuthorizedException extends BaseException {
  UnAuthorizedException({required String message, required String url}): super(message, "UnAuthorized request", url);
}

enum NetworkExceptionType {
  noInternet, timeout,
  badRequest, unAuthorization,
  notFound, other;

  String get title {
    switch (this) {
      case NetworkExceptionType.noInternet:
        return "networkError.internet".tr();
      case NetworkExceptionType.timeout:
        return "networkError.timeOut".tr();
      case NetworkExceptionType.badRequest:
        return "networkError.other".tr();
      case NetworkExceptionType.unAuthorization:
        return "networkError.unAuthorization".tr();
      case NetworkExceptionType.notFound:
      case NetworkExceptionType.other:
        return "networkError.other".tr();
    }
  }
}

class NetworkCallBackModel {
  NetworkCallBackModel(this.response, {this.error});
  NetworkExceptionType? error;
  dynamic response;
}