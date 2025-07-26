import 'package:alpha_learnapp/controllers/navigation_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies(){
    Get.put(HomeController());
  }
}
