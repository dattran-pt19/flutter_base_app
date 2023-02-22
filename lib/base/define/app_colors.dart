import 'dart:ui';

class AppColors {
  static final AppColors _instance = AppColors._();
  factory AppColors() => _instance;
  AppColors._();

  final primary = const Color(0xFF114A9F);
  final transparentPrimary = const Color(0xFF114A9F).withAlpha(30);
  final mainText = const Color(0xFF333333);
  final lightText = const Color(0xFF4F4F4F);
  final warning = const Color(0xFFFDB913);
  final active = const Color(0xFF43A047);
  final danger = const Color(0xFFEA5455);
  final placeholder = const Color(0xFFA7A9AC);
  final border = const Color(0xFFD0D0D5);
  final background = const Color(0xFFF1F1F4);
  final disable = const Color(0xFFADAFB6);
  final dimColor = const Color(0xFF4B4B4B).withAlpha(183);
  final shadow = const Color(0xFF000000).withAlpha(25);
  final ticketFooter = const Color(0xFF1E3869);
  final ticketContent = const Color(0xFF231F20);
  final info = const Color(0xFF00A0DC);
  final cardBackground = const Color(0xFF0083CA).withAlpha(30);
}