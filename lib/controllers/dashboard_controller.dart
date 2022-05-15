import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:sanskar_pg_app/services/notification_service.dart';

class DashboardController extends GetxController {
  int currentScreenIndex = 0;

  void changeScreen(int index) {
    currentScreenIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    NotificationService.startService();
  }
}
