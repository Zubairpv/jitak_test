import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StampScreen extends StatelessWidget {
  const StampScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFA8B1FF),
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.black,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          "店舗プロフィール編集",
          style: TextStyle(fontSize: size.width / 30, color: Colors.white),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5.0, top: 5),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: CircleAvatar(
              backgroundColor: const Color(0xFF949EFF),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: size.width / 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        leadingWidth: size.width / 10,
        actions: [
          Icon(
            Icons.remove_circle_outline_outlined,
            color: Colors.white,
            size: size.width / 15,
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Mer キッチン",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width / 30,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "現在の獲得数",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width / 30,
                        ),
                      ),
                      TextSpan(
                        text: '30',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width / 18,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: "個",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width / 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: size.width,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: size.width / 1.35,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 1,
                                    color: Colors.grey,
                                    offset: Offset(2, 2),
                                    spreadRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: GridView.builder(
                                itemCount: 15,
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount:
                                            size.width > 700 ? 8 : 5,
                                        childAspectRatio:
                                            size.width > 700 ? 2 : 1.5,
                                        mainAxisSpacing: size.width / 70,
                                        crossAxisSpacing: size.width / 70),
                                itemBuilder: (BuildContext context, int index) {
                                  return Image.asset(
                                    "assets/stamp_images/star.png",
                                    height: 1,
                                  );
                                }),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: size.width / 1.35,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 1,
                                    color: Colors.grey,
                                    offset: Offset(2, 2),
                                    spreadRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: 15,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount:
                                            size.width > 700 ? 8 : 5,
                                        childAspectRatio:
                                            size.width > 700 ? 2 : 1.5,
                                        mainAxisSpacing: size.width / 30,
                                        crossAxisSpacing: size.width / 30),
                                itemBuilder: (BuildContext context, int index) {
                                  return Image.asset(
                                    "assets/stamp_images/star.png",
                                    height: 10,
                                  );
                                }),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '2 / 2枚目',
                        style: TextStyle(
                          fontSize: size.width / 26,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                  Text(
                    "スタンプ獲得履歴",
                    style: TextStyle(
                        fontSize: size.width / 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                "2021 / 11 / ${18 - index}",
                                style: TextStyle(
                                    fontSize: size.width / 22,
                                    color: Colors.grey),
                              ),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "スタンプを獲得しました。",
                                    style: TextStyle(
                                      fontSize: size.width / 22,
                                    ),
                                  ),
                                  Text(
                                    "1 個",
                                    style: TextStyle(
                                        fontSize: size.width / 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: 5))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
