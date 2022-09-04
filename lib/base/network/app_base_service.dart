import 'package:logger/logger.dart';

import 'app_base_model.dart';
import 'base_service.dart';
import 'codable.dart';

class AppBaseService extends BaseService {
  Future<AppBaseResponse<T>> getAPI<T extends Encodable>(
      String api, T data, {Map<String, dynamic> params = BaseService.emptyMap}) async {
    var response = await get(api, params: params);
    if (response.error == null) {
      return AppBaseResponse<T>(response: data..decode(response.response));
    } else {
      Logger().e(response.error?.name);
      return AppBaseResponse<T>(error: response.error);
    }
  }

  Future<AppBaseResponse<T>> postAPI<T extends Encodable>(
      String api, T data, {Encodable? bodyObject}) async {
    var response = await post(api, body: bodyObject?.toJson());
    if (response.error == null) {
      return AppBaseResponse<T>(response: data..decode(response.response));
    } else {
      Logger().e(response.error?.name);
      return AppBaseResponse<T>(error: response.error);
    }
  }
}
