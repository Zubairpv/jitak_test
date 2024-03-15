import 'package:get/get.dart';
import 'package:jitak_machine/model/home_page_data_model.dart';

class HomePageController extends GetxController {
  RxList<HomeDataModel> homelist = HomeDataModel.home.obs;
  likeFunction(int index) {
    homelist[index].liked = !homelist[index].liked;
    homelist.refresh();
  }
}
