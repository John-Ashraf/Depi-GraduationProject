import 'package:get/get.dart';
import '../../controller/HomeController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(city: 'assiut'));
  }
}
