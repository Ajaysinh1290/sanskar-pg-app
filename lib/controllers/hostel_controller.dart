import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sanskar_pg_app/controllers/user_controller.dart';
import 'package:sanskar_pg_app/models/hostel/hostel.dart';
import 'package:sanskar_pg_app/screens/authentication/sign_in.dart';
import 'package:sanskar_pg_app/screens/widgets/dialog/show_error_dialog.dart';

class HostelController extends GetxController {
  final Rxn<Hostel> _hostel = Rxn<Hostel>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    String hostelId = Get.find<UserController>().user!.hostelId;
    _hostel.bindStream(_hostelStream(hostelId));
    ever(_hostel, _setUpHostel);
  }

  void _setUpHostel(Hostel? hostel) {
    if (hostel == null) {
      Get.offAll(const SignIn());
      showErrorDialog("Something went wrong",
          'Hostel not found. Contact admin for more details');
    }
  }

  Hostel? get hostel {
    return _hostel.value;
  }

  Stream<Hostel> _hostelStream(String hostelId) {
    return FirebaseFirestore.instance
        .collection('hostels')
        .doc(hostelId)
        .snapshots()
        .map((event) {
      return Hostel.fromJson(event.data()!);
    });
  }
}
