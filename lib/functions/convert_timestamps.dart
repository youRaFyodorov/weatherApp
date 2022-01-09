import 'package:intl/intl.dart';

String getTimeFromTimestamp(int timestamp, int timezone) {
  var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000 - timezone * 1000);
  var formatter = new DateFormat('HH:mm');
  return formatter.format(date);
}

String getDateFromTimestamp(int timestamp, int timezone) {
  var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000 - timezone * 1000);
  var formatter = new DateFormat('EEEE');
  return formatter.format(date);
}