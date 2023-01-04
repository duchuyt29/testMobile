import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../../../shared/utils/date_util.dart';

class CrmDetailLeadSalesOpportunityInfoController extends GetxController {
  final fbKey = GlobalKey<FormBuilderState>();
  DateTime dateStart = DateTime.now();
  DateTime dateDone = DateTime.now();
  TextEditingController dateStartText = TextEditingController();
  TextEditingController dateDoneText = TextEditingController();

  Future<void> selectDate(
      TextEditingController field, DateTime dateTime, bool isStartDate) async {
    await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      // styles
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
      // select hour
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    ).then(
      (date) {
        showTimePicker(
          context: Get.context!,
          initialTime: isStartDate
              ? TimeOfDay.now()
              : const TimeOfDay(hour: 23, minute: 59),
          builder: (context, child) {
            return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  surface: Colors.white,
                  onSurface: Colors.black,
                ),
                dialogBackgroundColor: Colors.white,
              ),
              child: child!,
            );
          },
        ).then(
          (time) {
            dateTime = DateTime(date!.year, date.month, date.day, time!.hour,
                time.minute, time.minute, 0);

            field.text = DateUtil.formatDatetimeToString(dateTime.toUtc(),
                type: DateUtil.DATETIME_TYPE);

            print(DateUtil.formatDatetimeToString(dateTime.toUtc(),
                type: DateUtil.API_TYPE));
          },
        );
      },
    );
  }
}
