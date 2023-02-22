class NotificationCenter {
  static final NotificationCenter _default = NotificationCenter();
  final _observerMap = {};
  final _segmentKey = '-888-';

  static void post({
    required String name,
    dynamic param,
  }) {
    NotificationCenter._default._observerMap.forEach((key, value) {
      final array = key.split(NotificationCenter._default._segmentKey);
      if (array.length == 2) {
        final _name = array[0];
        if (_name == name && value != null) {
          value(param);
        }
      }
    });
  }

  static void addObserver({
    required Object observer,
    required String name,
    void Function(dynamic param)? block,
  }) {
    final key = name +
        NotificationCenter._default._segmentKey +
        observer.hashCode.toString();
    NotificationCenter._default._observerMap[key] = block;
  }

  static void removeObserver({
    required Object observer,
    String? name,
  }) {
    if (name != null) {
      final key = name +
          NotificationCenter._default._segmentKey +
          observer.hashCode.toString();
      NotificationCenter._default._observerMap.remove(key);
    } else {
      final keys = NotificationCenter._default._observerMap.keys;
      final List<String> keysToRemove = [];

      for (var key in keys) {
        final array = key.split(NotificationCenter._default._segmentKey);
        if (array.length == 2) {
          final hasCode = array[1];
          if (hasCode == observer.hashCode.toString()) {
            keysToRemove.add(key);
          }
        }
      }

      NotificationCenter._default._observerMap
          .removeWhere((key, value) => keysToRemove.contains(key));
    }
  }
}

class NotificationCenterName {
  static const changeNotificationNumber = "ChangeNotificationNumber";
}