import 'package:logger/logger.dart';

import 'app_base_model.dart';
import 'base_service.dart';
import 'codable.dart';

class AppBaseService extends BaseService {
  Future<BaseResponse<T>> getAPI<T extends Encodable>(
      String api, T data, {Map<String, dynamic>? params}) async {
    var response = await get(api, params: params);
    if (response.error == null) {
      return BaseResponse<T>(response: data..decode(response.response));
    } else {
      Logger().e(response.error?.name);
      return BaseResponse<T>(error: response.error);
    }
  }

  Future<BaseResponse<T>> postAPI<T extends Encodable>(
      String api, T data, {Encodable? bodyObject, Map<String, dynamic>? params}) async {
    var response = await post(api, body: bodyObject?.toJson(), params: params);
    if (response.error == null) {
      return BaseResponse<T>(response: data..decode(response.response));
    } else {
      Logger().e(response.error?.name);
      return BaseResponse<T>(error: response.error);
    }
  }

  Future<BaseResponse<T>> deleteAPI<T extends Encodable>(
      String api, T data, {Encodable? bodyObject, Map<String, dynamic>? params}) async {
    var response = await delete(api, body: bodyObject?.toJson(), params: params);
    if (response.error == null) {
      return BaseResponse<T>(response: data..decode(response.response));
    } else {
      Logger().e(response.error?.name);
      return BaseResponse<T>(error: response.error);
    }
  }
}
