import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jitak_machine/controller/bottom_controller.dart';
import 'package:jitak_machine/model/edit_image_model.dart';
import 'package:jitak_machine/view/widgets/navbar.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final BottomController controller = Get.put(BottomController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (count == 2) {
          exit(0);
        } else {
          Get.snackbar("Exit", "click one more time to exit");
          count++;
        }
      },
      child: Scaffold(
          body: Obx(() => IndexedStack(
                index: controller.selectedTab.value,
                children: controller.pages,
              )),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(size.width / 50),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.orange.shade100],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: const Icon(
                  Icons.qr_code_scanner_sharp,
                  color: Colors.white,
                ),
              ),
              Text(
                '打刻する',
                style: TextStyle(fontSize: size.width / 40),
              )
            ],
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Obx(() => navItem(
                        Icons.search,
                        controller.selectedTab.value == 0,
                        "さがす",
                        size: size,
                        onTap: () => controller.onTabTapped(0),
                      )),
                  Obx(
                    () => navItem(
                        Icons.badge, controller.selectedTab.value == 1, "お仕事",
                        size: size, onTap: () => controller.onTabTapped(1)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Obx(
                    () => navItem(Icons.chat_sharp,
                        controller.selectedTab.value == 2, "チャット",
                        size: size, onTap: () => controller.onTabTapped(2)),
                  ),
                  Obx(
                    () => navItem(Icons.person,
                        controller.selectedTab.value == 3, "マイページ",
                        size: size, onTap: () => controller.onTabTapped(3)),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

class TabPage extends StatelessWidget {
  final int tab;

  const TabPage({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tab $tab')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tab $tab'),
            ElevatedButton(
              onPressed: () {
                Get.to(() => Page(tab: tab));
              },
              child: const Text('Go to page'),
            )
          ],
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  final int tab;

  const Page({Key? key, required this.tab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Tab $tab')),
      body: Center(child: Text('Tab $tab')),
    );
  }
}
