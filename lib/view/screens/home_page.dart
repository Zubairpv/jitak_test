import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jitak_machine/controller/home_controller.dart';
import 'package:jitak_machine/model/home_page_data_model.dart';
import 'package:jitak_machine/view/screens/stamp_screen.dart';
import 'package:table_calendar/table_calendar.dart';

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageController controller = Get.put(HomePageController());

    // Create a DateFormat instance with the desired format
    DateFormat dateFormat = DateFormat('yyyy年 M月 d日（E）', 'ja');

    String formattedDate = dateFormat.format(kToday);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: const Color(0xFFFFFFFF),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(55.0),
            child: Column(
              children: [
                Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.orange, Colors.orange.shade100],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  height: 35,
                  child: Center(child: Text(formattedDate)),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          actions: [
            const SizedBox(
              width: 20,
            ),
            const Icon(Icons.tune_sharp),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {
                Get.to(const StampScreen());
              },
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFF7F7F7),
                  contentPadding: const EdgeInsets.only(
                      left: 15, right: 5, top: 5, bottom: 5),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "北海道, 札幌市",
                  hintStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w700),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TableCalendar(
                daysOfWeekVisible: false,
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) {
                    // Adjust the starting date as needed
                    final dayName = DateFormat.E('ja_JP').format(day);

                    return SizedBox(
                      height: 90,
                      width: 50,
                      child: Column(
                        children: [
                          Text(dayName),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(day.day.toString()),
                        ],
                      ),
                    );
                  },
                  todayBuilder: (context, day, focusedDay) {
                    // Adjust the starting date as needed
                    final dayName = DateFormat.E('ja_JP').format(day);
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber),
                      height: 90,
                      width: 50,
                      child: Column(
                        children: [
                          Text(dayName),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(day.day.toString()),
                        ],
                      ),
                    );
                  },
                ),
                headerVisible: false,
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: kToday,
                calendarFormat: CalendarFormat.week,
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: HomeDataModel.home.length,
                  itemBuilder: (context, index) {
                    HomeDataModel homeDataModel = controller.homelist[index];
                    return Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: size.width > 600
                                  ? size.height / 2.5
                                  : size.height / 3.5,
                              width: size.width,
                              margin: const EdgeInsets.only(
                                  top: 10, left: 15, right: 15),
                              constraints: const BoxConstraints(
                                  minHeight: 150,
                                  minWidth: 150,
                                  maxHeight: 350,
                                  maxWidth: 600),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          "${homeDataModel.image}")),
                                  color: Colors.black,
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(20))),
                            ),
                            Container(
                              height: size.width > 600
                                  ? size.height / 2.5
                                  : size.height / 3.5,
                              width: size.width,
                              constraints: const BoxConstraints(
                                  minHeight: 150,
                                  minWidth: 150,
                                  maxHeight: 350,
                                  maxWidth: 600),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 15),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFFF6262),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: const Text(
                                      '本日まで',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: size.width,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(
                              bottom: 10, left: 15, right: 15),
                          constraints: const BoxConstraints(
                              minWidth: 150, maxWidth: 600),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                new BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 0.5,
                                ),
                              ],
                              borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(20))),
                          child: LayoutBuilder(builder: (context, constraints) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  homeDataModel.heading,
                                  style: TextStyle(
                                      fontSize: constraints.maxWidth / 27,
                                      fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xFFEEAB40)
                                            .withOpacity(0.1),
                                      ),
                                      child: Text(
                                        homeDataModel.subHeading,
                                        style: TextStyle(
                                            fontSize:
                                                constraints.maxWidth / 40),
                                      ),
                                    ),
                                    Text(
                                      homeDataModel.price,
                                      style: TextStyle(
                                          fontSize: constraints.maxWidth / 23,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                Text(
                                  homeDataModel.dateTimeData,
                                  style: TextStyle(
                                    fontSize: constraints.maxWidth / 30,
                                  ),
                                ),
                                SizedBox(
                                  width: constraints.maxWidth - 70,
                                  child: Text(
                                    homeDataModel.descriptionData,
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth / 30,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: constraints.maxWidth - 70,
                                      child: Text(
                                        homeDataModel.subDescription,
                                        style: TextStyle(
                                            fontSize: constraints.maxWidth / 32,
                                            color: Colors.grey),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          controller.likeFunction(index);
                                        },
                                        icon: Obx(
                                          () => Icon(
                                            controller.homelist[index].liked
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color:
                                                controller.homelist[index].liked
                                                    ? Colors.red
                                                    : Colors.grey,
                                          ),
                                        ))
                                  ],
                                )
                              ],
                            );
                          }),
                        )
                      ],
                    );
                  })
            ],
          ),
        ),
        floatingActionButton: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(blurRadius: 2, color: Colors.black, spreadRadius: 0)
              ],
            ),
            child: const Icon(Icons.location_on_outlined)));
  }
}
