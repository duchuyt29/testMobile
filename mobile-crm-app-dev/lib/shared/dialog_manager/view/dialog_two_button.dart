import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';

class DialogTwoButton extends StatelessWidget {
  const DialogTwoButton({
    required this.onPressedCancel,
    required this.onPressedAgree,
    required this.title,
    required this.content,
    this.cancelTextButton,
    this.agreeTextButton,
  });

  final VoidCallback onPressedCancel;
  final VoidCallback onPressedAgree;
  final String title;
  final String content;
  final String? cancelTextButton;
  final String? agreeTextButton;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: AppTextStyle.heavy(),
      ),
      content: Text(
        content,
        style: AppTextStyle.regular(),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: onPressedAgree,
          style: TextButton.styleFrom(
            minimumSize: const Size(100, 50),
            padding: EdgeInsets.zero,
            backgroundColor: AppColor.buttonBackgroundColor,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          child: Text(
            agreeTextButton == null ? 'ok'.tr : agreeTextButton!,
            style: AppTextStyle.heavy(
              color: AppColor.secondTextColor,
            ),
          ),
        ),
        TextButton(
          onPressed: onPressedCancel,
          child: Text(
            cancelTextButton == null ? 'cancel'.tr : cancelTextButton!,
            style: AppTextStyle.heavy(
              color: AppColor.primaryTextColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _dialogOnButtonContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 20, right: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              Text(
                content,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: onPressedAgree,
                      style: TextButton.styleFrom(
                        minimumSize: const Size(100, 50),
                        padding: EdgeInsets.zero,
                        backgroundColor: AppColor.buttonBackgroundColor,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      child: Text(
                        agreeTextButton == null ? 'ok'.tr : agreeTextButton!,
                        style: AppTextStyle.heavy(
                          color: AppColor.secondTextColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextButton(
                      onPressed: onPressedCancel,
                      style: TextButton.styleFrom(
                        minimumSize: const Size(100, 50),
                        padding: EdgeInsets.zero,
                        backgroundColor: AppColor.secondBackgroundColor,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      child: Text(
                        cancelTextButton == null
                            ? 'cancel'.tr
                            : cancelTextButton!,
                        style: AppTextStyle.heavy(
                          color: AppColor.primaryTextColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
