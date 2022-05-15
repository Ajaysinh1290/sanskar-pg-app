
DateTime getNextMonthDate() {
  DateTime now = DateTime.now();
  if (now.day == 1) {
    return now;
  }
  int year = now.month == 12 ? now.year + 1 : now.year;
  int month = now.month == 12 ? 1 : now.month;
  return DateTime(year, month, 1);
}