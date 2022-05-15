import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sanskar_pg_app/controllers/dashboard_controller.dart';
import 'package:sanskar_pg_app/controllers/hostel_controller.dart';
import 'package:sanskar_pg_app/screens/chat/chat_main_screen.dart';
import 'package:sanskar_pg_app/screens/event/event_screen.dart';
import 'package:sanskar_pg_app/screens/fees/fees_screen.dart';
import 'package:sanskar_pg_app/screens/notifications/notifications.dart';
import 'package:sanskar_pg_app/screens/settings/settings.dart';
import 'package:sanskar_pg_app/utils/images/image_storage.dart';

import '../home/home_page.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> screens = [
    {
      'label': 'Home',
      "icon": ImageStorage.icons.home,
      "active_icon": ImageStorage.icons.homeActive,
      "screen": const HomePage(),
    },
    {
      'label': 'Events',
      "icon": ImageStorage.icons.event,
      "active_icon": ImageStorage.icons.eventActive,
      "screen": const EventScreen(),
    },
    {
      'label': 'Fees',
      "icon": ImageStorage.icons.fees,
      "active_icon": ImageStorage.icons.feesActive,
      "screen": const FeesScreen(),
    },
    {
      'label': 'Chat',
      "icon": ImageStorage.icons.chat,
      "active_icon": ImageStorage.icons.chatActive,
      "screen": const ChatMainScreen(),
    },
    {
      'label': 'Settings',
      "icon": ImageStorage.icons.settings,
      "active_icon": ImageStorage.icons.settingsActive,
      "screen": const Settings(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    Get.put(HostelController());
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        body: screens[controller.currentScreenIndex]['screen'],
        bottomNavigationBar: Container(
          height: 70.w,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: const Offset(0, -4),
                blurRadius: 20)
          ]),
          child: BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: controller.currentScreenIndex,
              type: BottomNavigationBarType.fixed,
              onTap: controller.changeScreen,
              items: screens.map((screenData) {
                return BottomNavigationBarItem(
                    label: '',
                    tooltip: screenData['label'],
                    icon: Image.asset(
                      screenData['icon'],
                      width: 25.sp,
                      fit: BoxFit.contain,
                    ),
                    activeIcon: Image.asset(
                      screenData['active_icon'],
                      width: 25.sp,
                      fit: BoxFit.contain,
                    ));
              }).toList()),
        ),
      );
    });
  }
}
