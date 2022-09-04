import 'package:flutter/material.dart';

enum LanguageType {
  vietnamese("vi"),
  english("en");

  const LanguageType(this.code);
  static LanguageType instance(String code) {
    if (LanguageType.values.map((type) => type.code).toList().contains(code)) {
      return LanguageType.values.firstWhere((element) => element.code == code);
    } else {
      return LanguageType.vietnamese;
    }
  }

  final String code;

  String get name {
    switch (this) {
      case LanguageType.vietnamese:
        return "Tiếng Việt";
      case LanguageType.english:
        return "English";
    }
  }

  Locale get locale {
    return Locale(code);
  }

  String get flag {
    return 'flag_$code.svg';
  }
}