import 'dart:ui';

class Meeting {
  Meeting(this.eventName, this.notes, this.from, this.to, this.background,
      this.isAllDay);
  late String eventName;
  late String notes;
  late DateTime from;
  late DateTime to;
  late Color background;
  late bool isAllDay;
}
