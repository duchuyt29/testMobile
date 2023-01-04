import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../styles/text_style/text_style.dart';
import '../utils/date_util.dart';

class ChooseDateTimeWidget extends StatefulWidget {
  final Function()? onClose;
  final DateTime? birthDay;

  const ChooseDateTimeWidget({
    Key? key,
    required this.onClose,
    this.birthDay,
  }) : super(key: key);

  @override
  State<ChooseDateTimeWidget> createState() => _ChooseDateTimeWidgetState();
}

class _ChooseDateTimeWidgetState extends State<ChooseDateTimeWidget> {
  late DateTime birthDay;

  @override
  void initState() {
    birthDay = widget.birthDay ?? DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: const EdgeInsets.only(left: 14.0, right: 14.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 24.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.close,
                    color: AppColor.blackColor,
                  ),
                ),
                const SizedBox(
                  width: 24.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'birthday'.tr,
                        style: AppTextStyle.regular(
                          fontSize: 16.0,
                          color: AppColor.neutral6,
                        ),
                      ),
                      Text(
                        DateUtil.formatDatetimeToString(birthDay),
                        style: AppTextStyle.heavy(
                          fontSize: 26.0,
                          color: AppColor.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 12.5,
              right: 12.5,
              top: 32.0,
              bottom: 32.0,
            ),
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              dateOrder: DatePickerDateOrder.dmy,
              onDateTimeChanged: (value) {
                setState(() {
                  birthDay = value.toUtc();
                });
              },
              initialDateTime: birthDay,
            ),
          ),
          Container(
              width: double.infinity,
              height: 55.0,
              margin: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 32.0,
                bottom: 24.0,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                color: AppColor.primaryColor,
              ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context, birthDay);
                },
                child: Text(
                  'confirm'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: AppColor.secondTextColor,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
