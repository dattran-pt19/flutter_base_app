import 'base_exceptions.dart';
import 'codable.dart';

abstract class AppBaseModel<T extends OriginalCodable> extends Encodable {
  final code = Integer(key: "code");
  final message = Stringer(key: "message");
  T get data;

  @override
  properties() {
    return [code, message, data];
  }
}

class AppBaseResponse<T extends Encodable> {
  const AppBaseResponse({this.response, this.error});
  final T? response;
  final NetworkExceptionType? error;
}

class CommonObjectResponse<T extends Encodable> extends AppBaseModel {
  CommonObjectResponse(this._model);
  final T _model;
  @override
  CodableObject<T> get data => CodableObject<T>(key: "data", value: _model);
}