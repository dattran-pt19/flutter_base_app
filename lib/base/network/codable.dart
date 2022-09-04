abstract class OriginalCodable<T> {
  String key;
  T? value;
  OriginalCodable({required this.key, this.value});

  dynamic fromJson(dynamic);
}

abstract class Codable<T> extends OriginalCodable<T> {
  Codable({required String key, T? value}): super(key: key, value: value);

  @override
  T? fromJson(dynamic) {
    if (dynamic != null) {
      value = dynamic as T;
    } else {
      value = null;
    }
    return value;
  }
}

class CodableObject<T extends Encodable> extends OriginalCodable<T> {
  CodableObject({required String key, T? value}): super(key: key, value: value);

  @override
  T? fromJson(dynamic) {
    if (dynamic != null) {
      if (value is Encodable) {
        (value as Encodable).decode(dynamic);
      } else {
        throw ArgumentError('Can not convert Object not extends from Encoding');
      }
    } else {
      value = null;
    }
    return value;
  }
}

typedef Instance<T extends Decodable> = T Function();
class CodableList<T extends Decodable> extends OriginalCodable<List<T>> {
  Instance<T> instance;
  CodableList({required String key, required this.instance, List<T>? value})
      : super(key: key, value: value);

  @override
  List<T>? fromJson(dynamic) {
    if(dynamic == null) {
      return null;
    } else if (dynamic != null && dynamic is List) {
      List<T> list = [];
      for (var item in dynamic) {
        final element = instance()..decode(item);
        list.add(element);
      }
      return list;
    } else {
      throw ArgumentError("Value is not a List");
    }
  }
}

class Stringer extends Codable<String> {
  Stringer({required String key, String? value}) : super(key: key, value: value);
}

class Integer extends Codable<num> {
  Integer({required String key, int? value}) : super(key: key, value: value);
}

class Bool extends Codable<bool> {
  Bool({required String key, bool? value}) : super(key: key, value: value);
}

class Double extends Codable<num> {
  Double({required String key, double? value}) : super(key: key, value: value);
}

class ListPrimaryCodable<T> extends Codable<List<T>> {
  ListPrimaryCodable({required String key, List<T>? value}):
        super(key: key, value: value);
}

class ListObjectCodable<T extends Encodable> extends CodableList<T> {
  ListObjectCodable({required String key, required Instance<T> instance, List<T>? value}):
        super(key: key, instance: instance, value: value);
}

class Decodable<T> {
  List<OriginalCodable> get _values => properties();
  List<OriginalCodable> properties() {
    return [];
  }

  void decode(Map json) {
    for (var item in _values) {
      if (json.containsKey(item.key)) {
        item.value = item.fromJson(json[item.key]);
      } else {
        item.value = null;
      }
    }
  }

  T? createInstance() => null;
}

abstract class Encodable extends Decodable {
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    for (var item in _values) {
      if (item is Encodable && item.value != null) {
        json[item.key] = (item.value as Encodable).toJson();
      } else if (item is CodableObject && item.value != null) {
        json[item.key] = (item.value as Encodable).toJson();
      } else if (item is CodableList && item.value != null) {
        json[item.key] = (item.value as List).map((e) => (e as Encodable).toJson()).toList();
      } else {
        json[item.key] = item.value;
      }
    }
    return json;
  }
}
