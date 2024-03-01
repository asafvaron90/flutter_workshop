import 'package:common_dependencies/common_dependencies.dart';
import 'package:login/src/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => LoginController());
}
