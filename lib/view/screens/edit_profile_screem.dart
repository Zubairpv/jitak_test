import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jitak_machine/controller/checkbox_controller.dart';
import 'package:jitak_machine/controller/time_piker_controller.dart';
import 'package:jitak_machine/view/widgets/checkbox.dart';
import 'package:jitak_machine/view/widgets/label_text.dart';
import 'package:jitak_machine/view/widgets/photo_row.dart';
import 'package:jitak_machine/view/widgets/time_picker_wid.dart';

import '../widgets/edit_text_field.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    CheckBoxController checkBoxController = Get.put(CheckBoxController());
    int counter = 1;
    TimePickerController timePickerController = Get.put(TimePickerController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: Colors.black,
              height: 0.2,
            )),
        elevation: 0,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          "店舗プロフィール編集",
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: CircleAvatar(
            backgroundColor: Color(0xFFF4F2F2),
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Color(0xFFB8B8B8),
              ),
            ),
          ),
        ),
        leadingWidth: 40,
        actions: [
          Stack(
            children: <Widget>[
              IconButton(
                  icon: const Icon(
                    Icons.notifications_none_outlined,
                    size: 40,
                  ),
                  onPressed: () {}),
              counter != 0
                  ? const Positioned(
                      right: 10,
                      top: 11,
                      child: CircleAvatar(
                        minRadius: 8,
                        maxRadius: 10,
                        backgroundColor: Color(0xFFEE7D42),
                        child: Text(
                          "99+",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EditProfileTextfield(
                label: "店舗名",
                textEditingController: TextEditingController(text: "Mer キッチン"),
              ),
              EditProfileTextfield(
                label: "代表担当者名",
                textEditingController: TextEditingController(text: "林田 絵梨花"),
              ),
              EditProfileTextfield(
                label: "店舗電話番号",
                textEditingController:
                    TextEditingController(text: "123-45678910"),
                isPhoneNumber: true,
              ),
              EditProfileTextfield(
                label: "店舗住所",
                textEditingController:
                    TextEditingController(text: "大分県豊後高田市払田791-13"),
              ),
              Container(
                height: width > 700 ? height / 1.7 : height / 2.5,
                width: width > 700 ? width / 1.2 : width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                        image: AssetImage(
                            "assets/edit_screen_images/map_image.png"),
                        fit: BoxFit.fill)),
              ),
              const SizedBox(
                height: 10,
              ),
              EditScreenPhotoData(
                  mainIndex: 0,
                  width: width,
                  label: "店舗外観",
                  subLabel: "最大3枚まで"),
              EditScreenPhotoData(
                mainIndex: 1,
                width: width,
                label: "店舗内観",
                subLabel: "1枚〜3枚ずつ追加してください",
              ),
              EditScreenPhotoData(
                mainIndex: 2,
                width: width,
                label: "料理写真",
                subLabel: "1枚〜3枚ずつ追加してください",
              ),
              EditScreenPhotoData(
                mainIndex: 3,
                width: width,
                label: "メニュー写真",
                subLabel: "1枚〜3枚ずつ追加してください",
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TimePickerWidget(
                      width: width, timePickerController: timePickerController),
                  Text(
                    '  〜  ',
                    style: TextStyle(
                        fontSize: width < 700 ? width / 25 : width / 28),
                  ),
                  TimePickerWidget(
                      width: width, timePickerController: timePickerController),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TimePickerWidget(
                      width: width, timePickerController: timePickerController),
                  Text(
                    '  〜  ',
                    style: TextStyle(
                        fontSize: width < 700 ? width / 25 : width / 28),
                  ),
                  TimePickerWidget(
                      width: width, timePickerController: timePickerController),
                ],
              ),
              const Labeltext(label: "定休日"),
              GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (context, i) => Obx(
                  () => CostomCheck(
                    isSelected: checkBoxController.homelist[i].checked!,
                    content: checkBoxController.homelist[i].content,
                    onChanged: (value) {
                      checkBoxController.checkFunction(i);
                    },
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisExtent: 50,
                    childAspectRatio: 0.9),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width > 700 ? width / 4 : width / 3,
                    child: EditProfileTextfield(
                      label: "ランチ時間",
                      textEditingController:
                          TextEditingController(text: "¥ 4,000"),
                    ),
                  ),
                  Text(
                    '  〜  ',
                    style: TextStyle(
                        fontSize: width < 700 ? width / 25 : width / 28),
                  ),
                  SizedBox(
                    width: width > 700 ? width / 4 : width / 3,
                    child: EditProfileTextfield(
                      textEditingController:
                          TextEditingController(text: "¥ 1,000"),
                    ),
                  ),
                ],
              ),
              EditProfileTextfield(
                label: "キャッチコピー",
                textEditingController:
                    TextEditingController(text: "美味しい！リーズナブルなオムライスランチ！"),
              ),
              EditProfileTextfield(
                label: "座席数",
                textEditingController: TextEditingController(text: "40席"),
              ),
              const Labeltext(
                label: "営業時間",
              ),
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: CostomCheck(
                        isSelected: checkBoxController.row1Bool.value,
                        content: "有",
                        onChanged: (p0) {
                          checkBoxController.rowCheck(0);
                        },
                      ),
                    ),
                    Expanded(
                      child: CostomCheck(
                        isSelected: !checkBoxController.row1Bool.value,
                        content: "有",
                        onChanged: (p0) {
                          checkBoxController.rowCheck(0);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Labeltext(
                label: "駐車場",
              ),
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: CostomCheck(
                        isSelected: checkBoxController.row2Bool.value,
                        content: "有",
                        onChanged: (p0) {
                          checkBoxController.rowCheck(1);
                        },
                      ),
                    ),
                    Expanded(
                      child: CostomCheck(
                        isSelected: !checkBoxController.row2Bool.value,
                        content: "有",
                        onChanged: (p0) {
                          checkBoxController.rowCheck(1);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Labeltext(
                label: "来店プレゼント",
              ),
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: CostomCheck(
                        isSelected: checkBoxController.row3Bool.value,
                        content: "有（最大３枚まで）",
                        onChanged: (p0) {
                          checkBoxController.rowCheck(2);
                        },
                      ),
                    ),
                    Expanded(
                      child: CostomCheck(
                        isSelected: !checkBoxController.row3Bool.value,
                        content: "有",
                        onChanged: (p0) {
                          checkBoxController.rowCheck(2);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              EditScreenPhotoData(
                mainIndex: 4,
                width: width,
                label: "",
                subLabel: "",
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFEE7D42),
                      Color(0xFFFFC8AB),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    '編集を保存',
                    style: TextStyle(
                        fontSize: width < 700 ? width / 25 : width / 28,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
