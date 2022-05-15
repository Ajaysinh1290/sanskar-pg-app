import 'package:get/get.dart';
import 'package:sanskar_pg_app/models/user/user_model.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  final Rx<UserModel?> _userModel = Rxn<UserModel?>();

  set user(UserModel? value) => _userModel.value = value;

  UserModel? get user => _userModel.value;

  void clear() {
    _userModel.value = null;
  }
}
