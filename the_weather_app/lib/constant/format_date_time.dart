import 'package:intl/intl.dart';

//преобразовываю дату к привычной для СНГ  dd:mm:yyyy
class FormatDateTime {
  static String getFormatDate(DateTime dateTime) {
    return DateFormat('EEE, d MMM, y').format(dateTime);
  }
}
