import 'package:easy_localization/easy_localization.dart';

extension NumExtension on num {
  String toVND() {
    final format = NumberFormat("#,###", "en");
    return "${format.format(this)} ₫";
  }

  String toMoney() {
    final format = NumberFormat("#,###", "en");
    return format.format(this);
  }
}