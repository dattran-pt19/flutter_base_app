import 'base_exceptions.dart';
import 'codable.dart';

mixin BaseResponseMixin {
  final success = Bool(key: "success");
  final message = Stringer(key: "message");
  final errorKey = Stringer(key: "errorKey");
}

class BaseResponse<T extends Encodable> {
  const BaseResponse({this.response, this.error});
  final T? response;
  final NetworkExceptionType? error;
}

class BaseRawResponse {
  const BaseRawResponse({this.response, this.error});
  final dynamic response;
  final NetworkExceptionType? error;
}

class SimpleResponseModel extends Encodable with BaseResponseMixin {
  @override
  properties() {
    return [success, message, errorKey];
  }
}

class SimpleStringResponseModel extends Encodable with BaseResponseMixin {
  final data = Stringer(key: "data");

  @override
  properties() {
    return [success, message, errorKey, data];
  }
}

class SimpleIntResponseModel extends Encodable with BaseResponseMixin {
  final data = Integer(key: "data");

  @override
  properties() {
    return [success, message, errorKey, data];
  }
}