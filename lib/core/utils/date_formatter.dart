import 'package:intl/intl.dart';

class DateFormatter {
  static final dayFormat = DateFormat('MMM d');
  static final monthFormat = DateFormat('MMM');

  // Prevent instantiation
  DateFormatter._();
}