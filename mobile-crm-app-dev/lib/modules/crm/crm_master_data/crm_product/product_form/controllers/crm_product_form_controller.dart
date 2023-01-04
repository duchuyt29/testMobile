import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../../../base/base_controller.dart';

class CrmProductFormController extends BaseController {
  final fbKey = GlobalKey<FormBuilderState>();

  Future<void> onSubmitted() async {
    if (fbKey.currentState!.saveAndValidate()) {
      print(fbKey.currentState!.value);
    }
  }

  Future<void> selectDate() async {
    final date = await showDatePicker(
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
    ).then((date) {
      showTimePicker(
        context: Get.context!,
        initialTime: TimeOfDay.now(),
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
      ).then((time) {
        print(
            '${date!.day}/${date.month}/${date.year} ${time!.hour}:${time.minute}');
      });

      // return
    });

    fbKey.currentState!.fields['date']!.didChange(date);
  }
}
