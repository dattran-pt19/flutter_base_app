import 'package:shared_preferences/shared_preferences.dart';

class SharedData {
  static late SharedPreferences prefs;

  static Future<void> ensureInitialized() async =>
      prefs = await SharedPreferences.getInstance();

  static bool get isDisplayedOnBoarding {
    try {
      return prefs.getBool(SharedDataKey.isDisplayedOnBoarding) ?? false;
    } catch (_) {
      return false;
    }
  }

  static set isDisplayedOnBoarding(bool value) {
    prefs.setBool(SharedDataKey.isDisplayedOnBoarding, value);
  }
}

class SharedDataKey {
  static const isDisplayedOnBoarding = "isDisplayedOnBoarding";
}