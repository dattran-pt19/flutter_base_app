extension StringExtension on String {
  DateTime toDate() {
    return DateTime.parse(this);
  }

  bool get emailValid => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
}