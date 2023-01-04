import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../../../../app.dart';
import '../../../../../../../routes/workgroup_pages.dart';
import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import 'calander_meeting/meeting.dart';
import 'calander_meeting/meeting_data_source.dart';

class CalanderWidget extends StatefulWidget {
  const CalanderWidget({Key? key}) : super(key: key);

  @override
  State<CalanderWidget> createState() => _CalanderWidgetState();
}

class _CalanderWidgetState extends State<CalanderWidget> {
  List<Meeting> _dataSourceDetail = <Meeting>[];
  MeetingDataSource _getDataSource() {
    final meetings = <Meeting>[];
    final today = DateTime.now();
    final startTime = DateTime(today.year, today.month, today.day, 9, 0, 0);
    final endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting('OT', 'Design Screen 1 - Dự án A', startTime, endTime,
        const Color(0xffF73D44), false));
    const SizedBox(
      height: 10,
    );
    meetings.add(Meeting('Giờ làm chính thức', 'Sửa lại UI', startTime, endTime,
        AppColor.primaryColor, false));
    const SizedBox(
      height: 10,
    );
    return MeetingDataSource(meetings);
  }

  void calendarTapped(CalendarTapDetails calendarTapDetails) {
    if (calendarTapDetails.targetElement == CalendarElement.calendarCell) {
      setState(() {
        _dataSourceDetail = calendarTapDetails.appointments!.cast<Meeting>();
      });
    }
  }

  CalendarView calendarView = CalendarView.month;
  CalendarController calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SfCalendar(
              view: calendarView,
              firstDayOfWeek: 1,
              showDatePickerButton: true,
              todayHighlightColor: AppColor.primaryColor,
              todayTextStyle: const TextStyle(color: Colors.white),
              showNavigationArrow: true,
              controller: calendarController,
              dataSource: _getDataSource(),
              onTap: calendarTapped,
              selectionDecoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: AppColor.primaryColor,
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(6),
                ),
                shape: BoxShape.rectangle,
              ),
              monthViewSettings: MonthViewSettings(
                numberOfWeeksInView: 6,
                appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
                dayFormat: 'EEE',
                showAgenda: false,
                appointmentDisplayCount: 3,
                monthCellStyle: MonthCellStyle(
                  textStyle:
                      AppTextStyle.bold(color: Colors.black, fontSize: 16),
                  leadingDatesTextStyle: AppTextStyle.bold(color: Colors.grey),
                  trailingDatesTextStyle: AppTextStyle.bold(color: Colors.grey),
                ),
              ),
              headerStyle: CalendarHeaderStyle(
                textStyle: AppTextStyle.bold(
                    color: const Color.fromARGB(255, 105, 5, 123),
                    fontSize: 20),
              ),
              viewHeaderStyle: ViewHeaderStyle(
                dayTextStyle: AppTextStyle.bold(color: Colors.black),
                dateTextStyle: AppTextStyle.bold(color: Colors.black),
              ),
              scheduleViewSettings: ScheduleViewSettings(
                appointmentTextStyle: AppTextStyle.bold(color: Colors.black),
                dayHeaderSettings: DayHeaderSettings(
                  dateTextStyle: AppTextStyle.bold(color: Colors.black),
                  dayTextStyle: AppTextStyle.bold(color: Colors.black),
                ),
                monthHeaderSettings: MonthHeaderSettings(
                  monthTextStyle: AppTextStyle.bold(color: Colors.black),
                ),
                weekHeaderSettings: WeekHeaderSettings(
                  weekTextStyle: AppTextStyle.bold(color: Colors.black),
                ),
              ),
              appointmentTextStyle: AppTextStyle.bold(color: Colors.white),
              cellBorderColor: Colors.white,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView.separated(
                padding: const EdgeInsets.all(2),
                itemCount: _dataSourceDetail.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(2),
                    height: 80,
                    color: _dataSourceDetail[index].background,
                    child: ListTile(
                      leading: Column(
                        children: <Widget>[
                          Text(
                            _dataSourceDetail[index].isAllDay
                                ? ''
                                : '${DateFormat('hh:mm a').format(_dataSourceDetail[index].from)}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                height: 1.7),
                          ),
                          Text(
                            _dataSourceDetail[index].isAllDay ? 'All day' : '',
                            style: const TextStyle(
                                height: 0.5, color: Colors.black),
                          ),
                          Text(
                            _dataSourceDetail[index].isAllDay
                                ? ''
                                : '${DateFormat('hh:mm a').format(_dataSourceDetail[index].to)}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      trailing: Container(
                        child: IconButton(
                          icon: Icon(
                            getIcon(_dataSourceDetail[index].eventName),
                            size: 15,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Get.toNamed(WorkGroupRoutes
                                .WORKPLACE_WORKGROUP_DETAIL_WORK);
                          },
                        ),
                      ),
                      title: Container(
                        child: Text(
                          '${_dataSourceDetail[index].eventName}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      subtitle: Container(
                        child: Text(
                          '${_dataSourceDetail[index].notes}',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.regular(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 5,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  IconData getIcon(String subject) {
    if (subject == 'Họp sprint 4') {
      return Icons.arrow_forward_ios;
    } else if (subject == 'Conference 2') {
      return Icons.arrow_forward_ios;
    } else if (subject == 'Conference 3') {
      return Icons.arrow_forward_ios;
    } else if (subject == 'Conference 4') {
      return Icons.arrow_forward_ios;
    } else if (subject == 'Conference 5') {
      return Icons.arrow_forward_ios;
    } else if (subject == 'Conference 6') {
      return Icons.arrow_forward_ios;
    } else {
      return Icons.arrow_forward_ios;
    }
  }
}
