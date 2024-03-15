import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jitak_machine/view/screens/home_page.dart';
import 'package:jitak_machine/view/main_page.dart';
import 'package:jitak_machine/view/screens/edit_profile_screem.dart';

class BottomController extends GetxController {
  var selectedTab = 0.obs;

  List<Widget> get pages => [
        const HomeScreen(),
        const TabPage(tab: 2),
        const TabPage(tab: 3),
        const EditProfile()
      ];

  void onTabTapped(int index) {
    if (index == selectedTab.value) {
    } else {
      selectedTab.value = index;
    }
  }
}
