import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/utils.dart';
import 'package:ui_api/crm_api/models/activity/activity_content.dart';
import 'package:ui_api/crm_api/models/activity/activity_involves.dart';

import '../../data/app_data_global.dart';
import '../../resource/assets_constant/images_constants.dart';
import '../constants/common.dart';
import 'date_util.dart';

class AppUtil {
  static bool isVideo(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith('.mov') ||
        ext.endsWith('.mp4') ||
        ext.endsWith('.avi') ||
        ext.endsWith('.wmv') ||
        ext.endsWith('.rmvb') ||
        ext.endsWith('.mpg') ||
        ext.endsWith('.mpeg') ||
        ext.endsWith('.3gp');
  }

  static String formatEmojiMessageContent(String content) {
    final regex = RegExp(r'\:\[.*?\]\(.*?\)');
    return content.replaceAllMapped(regex, (match) {
      try {
        return (match[0] ?? '').substring(2, 4);
      } catch (e) {
        return content;
      }
    });
  }

  static bool hasUrlProtocol(String s) =>
      GetUtils.hasMatch(s, r'^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?');

  static String cleanDuplicateWhitespace(String value) {
    return value.replaceAll(RegExp(r'\s+'), ' ');
  }

  Future<Position> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<String> getAddress(double lat, double long) async {
    final placemarks = await placemarkFromCoordinates(lat, long);

    print(
        '${placemarks[0].street ?? ''}, ${placemarks[0].subLocality ?? ''}, ${placemarks[0].subAdministrativeArea ?? ''}, ${placemarks[0].administrativeArea ?? ''}, ${placemarks[0].country ?? ''}');

    return '${placemarks[0].street ?? ''}, ${placemarks[0].subLocality ?? ''}, ${placemarks[0].subAdministrativeArea ?? ''}, ${placemarks[0].administrativeArea ?? ''}, ${placemarks[0].country ?? ''}';
  }

  static String getTextPriority(int id) {
    for (var i = 0;
        i < AppDataGlobal.crmMasterData!.listPriority!.length;
        i++) {
      if (AppDataGlobal.crmMasterData?.listPriority?[i].id == id) {
        return AppDataGlobal.crmMasterData?.listPriority?[i].priorityName ?? '';
      }
    }
    return '';
  }

  static String getIconActivity(int id) {
    switch (id) {
      case 1: //ActivityType.TASK_OBJECT.value
        return ImageConstants.crmActivityTask;
      case 2: //ActivityType.PHONE_CALL_OBJECT.value
        return ImageConstants.crmActivityCall;
      case 3: //ActivityType.EMAIL_OBJECT.value
        return ImageConstants.crmActivityEmail;
      case 4: //ActivityType.APPOINTMENT_OBJECT.value
        return ImageConstants.crmActivityAppointment;
      default:
        return ImageConstants.crmActivityTask;
    }
  }

  static String getStateText(String id) {
    var temp = '';

    if (id == FilterActivitySTATEType.PENDING.value) {
      temp = FilterActivitySTATEType.PENDING.text;
    } else if (id == FilterActivitySTATEType.IN_PROGRESS.value) {
      temp = FilterActivitySTATEType.IN_PROGRESS.text;
    } else if (id == FilterActivitySTATEType.COMPLETED.value) {
      temp = FilterActivitySTATEType.COMPLETED.text;
    } else if (id == FilterActivitySTATEType.DEFERRED.value) {
      temp = FilterActivitySTATEType.DEFERRED.text;
    } else if (id == FilterActivitySTATEType.CANCELED.value) {
      temp = FilterActivitySTATEType.CANCELED.text;
    } else if (id == FilterActivitySTATEType.REVIEWING.value) {
      temp = FilterActivitySTATEType.REVIEWING.text;
    } else if (id == FilterActivitySTATEType.REPROCESS.value) {
      temp = FilterActivitySTATEType.REPROCESS.text;
    }

    return temp;
  }

  static String getNameReponsiableEmployee(ActivityContent item) {
    var text = '';
    final temp = item.involves?.firstWhere(
        (element) => element.role == 'RESPONSIBLE',
        orElse: () => ActivityInvolves());

    if (temp?.involveIds != null) {
      for (var i = 0; i < temp!.involveIds!.length; i++) {
        if (i == temp.involveIds!.length - 1) {
          text += temp.involveIds![i].fullName ?? '';
        } else {
          text += '${temp.involveIds![i].fullName}, ';
        }
      }
    }
    return text;
  }

  /// Checks if string is phone number.
  static bool isPhoneNumber(String phone) {
    if (phone.length != 10) {
      return false;
    }

    const regexHotline = r'^[1]+(\d{7,10})$|^[0]+(\d{9,10})$';
    const regexPhone = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';

    return GetUtils.hasMatch(phone, regexPhone) ||
        GetUtils.hasMatch(phone, regexHotline);
  }

  static String? dateToString(DateTime? date) {
    if (date == null) {
      return null;
    }
    return DateUtil.formatDatetimeToString(date.toUtc(),
        type: DateUtil.API_TYPE);
  }
}
