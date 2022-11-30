import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class DashboardBottomBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late PersistentTabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = PersistentTabController();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
