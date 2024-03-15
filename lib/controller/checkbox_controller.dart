import 'package:get/get.dart';
import 'package:jitak_machine/model/edit_check_box_model.dart';

class CheckBoxController extends GetxController {
  RxList<CheckModel> homelist = CheckModel.checkModelList.obs;
  RxBool row1Bool = false.obs;
  RxBool row2Bool = false.obs;
  RxBool row3Bool = false.obs;
  checkFunction(int index) {
    homelist[index].checked = !homelist[index].checked!;
    homelist.refresh();
  }

  rowCheck(int index) {
    if (index == 0) {
      row1Bool.value = !row1Bool.value;
    } else if (index == 1) {
      row2Bool.value = !row2Bool.value;
    } else if (index == 2) {
      row3Bool.value = !row3Bool.value;
    }
  }
}
