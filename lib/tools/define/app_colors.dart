import 'dart:ui';

class AppColors {
  static final AppColors _instance = AppColors._();
  factory AppColors() => _instance;
  AppColors._();

  final primary = const Color(0xFF114A9F);
  final dark = const Color(0xFF4B4B4B);
  final displayText = const Color(0xFF424244);
  final bodyText = const Color(0xFF5D5F65);
  final warning = const Color(0xFFFDB913);
  final danger = const Color(0xFFEA5455);
  final placeholder = const Color(0xFFA7A9AC);
  final border = const Color(0xFFD6D9E1);
  final background = const Color(0xFFFBFCFF);
  final disable = const Color(0xFFADAFB6);
  final blur = const Color(0xFFF4F5F8);
  final tableHeader = const Color(0xFFF2F3F7);
  final dimColor = const Color(0xFF4B4B4B).withAlpha(183);
}