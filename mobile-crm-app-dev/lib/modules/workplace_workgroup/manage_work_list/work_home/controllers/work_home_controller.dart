import 'package:get/get.dart';

class WorkHomeController extends GetxController {
  Rx<bool> isLongPress = Rx<bool>(false);

  void showCheckBox() {
    print(isLongPress.value);
    isLongPress.value = !isLongPress.value;
    print(isLongPress.value);
  }
}
