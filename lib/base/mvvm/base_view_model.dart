import 'package:scoped_model/scoped_model.dart';

import '../network/app_service.dart';

abstract class BaseViewModel extends Model {
  final service = AppService();

  BaseViewModel();

  /// Executed once for each State object Flutter's framework creates.
  init() {}

  /// Executed when Widget's Stateful State gets dispose
  dispose() {}

  /// Called when the top route has been popped off, and the current route shows up.
  routingDidPopNext() {}

  /// Called when the current route has been pushed.
  routingDidPush() {}

  /// Called when the current route has been popped off.
  routingDidPop() {}

  /// Called when a new route has been pushed, and the current route is no
  /// longer visible.
  routingDidPushNext() {}
}