import 'package:json_annotation/json_annotation.dart';
import 'package:sanskar_pg_app/models/address/address.dart';
import 'package:sanskar_pg_app/models/user_room_history/user_room_history.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  late String userId;
  String userName;
  String? userProfilePic;
  String password;

  //reference data
  //User will get referral points if any other user will use his referral code
  int? points;
  String? referId;
  List<String>? referred;
  String? referredBy;

  DateTime dateOfBirth;
  String email;
  String? mobileNumber;
  String gender;
  late String hostelId;
  late List<UserRoomHistory> roomHistory;

  late bool isAccountApproved;
  bool? isAccountRejected;
  bool? isAccountBlocked;

  List<String>? transactions;

  //Aadhaar card, Pan card etc..
  List<String> documents;

  Address address;

  UserModel(
      {required this.userId,
      required this.roomHistory,
      required this.userName,
      this.userProfilePic,
      this.points,
      this.referId,
      this.referred,
      this.referredBy,
      required this.email,
      this.mobileNumber,
      required this.gender,
      required this.hostelId,
      required this.documents,
      required this.isAccountApproved,
      this.isAccountBlocked,
      this.isAccountRejected,
      required this.address,
      required this.dateOfBirth,
      required this.password,
      this.transactions,
      this.admissionDate});

  DateTime? admissionDate;

  factory UserModel.fromJson(Map<String, dynamic> data) =>
      _$UserModelFromJson(data);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  // num calculatePendingRent(
  //     DateTime startingDate, DateTime nextDate, num pendingRent, Room room) {
  //   if (startingDate.month == nextDate.month &&
  //       startingDate.year == nextDate.year) {
  //     pendingRent += getRoomRent(room, startingDate) / 30 * (nextDate.day - 1);
  //   } else if (startingDate.day < nextDate.day &&
  //       startingDate.month <= nextDate.month &&
  //       startingDate.year <= nextDate.year) {
  //     if (startingDate.month == 1) {
  //       pendingRent += getRoomRent(room, startingDate);
  //     } else {
  //       pendingRent += getRoomRent(room, startingDate) -
  //           getRoomRent(room, startingDate) / 30 * (startingDate.day);
  //     }
  //   }
  //   return pendingRent;
  // }

  // Future<Room?> getRoom(String roomId) async {
  //   Room? room;
  //   await FirebaseFirestore.instance
  //       .collection('hostels')
  //       .doc(Get.find<HostelController>().hostel!.hostelId)
  //       .collection('rooms')
  //       .doc(roomId)
  //       .get()
  //       .then((value) => room = Room.fromJson(value.data()!));
  //   return room;
  // }
  //
  // int getRoomRent(Room room, DateTime date) {
  //   List tempRentHistory = [];
  //   if (room.roomType == 'AC') {
  //     tempRentHistory = Get.find<HostelController>()
  //         .hostel!
  //         .acRoomRentHistory
  //         .reversed
  //         .toList();
  //   } else {
  //     tempRentHistory = Get.find<HostelController>()
  //         .hostel!
  //         .noneAcRoomRentHistory
  //         .reversed
  //         .toList();
  //   }
  //   for (var roomRent in tempRentHistory) {
  //     if (date.year >= roomRent.rentChangingDate.year &&
  //         date.month >= roomRent.rentChangingDate.month) {
  //       return roomRent.rent;
  //     }
  //   }
  //   return 0;
  // }
  //
  // getPendingRent() async {
  //   DateTime now = DateTime.now();
  //   for (var element in roomHistory) {
  //     Room? room = await getRoom(element.roomId);
  //     if (room == null) return;
  //     num roomRent = 0;
  //     if (room.roomType == 'AC') {
  //       for (var acRoomRent in Get.find<HostelController>()
  //           .hostel!
  //           .acRoomRentHistory
  //           .reversed) {
  //         if (element.roomChangingDate.year ==
  //                 acRoomRent.rentChangingDate.year &&
  //             element.roomChangingDate.month ==
  //                 acRoomRent.rentChangingDate.month) {}
  //       }
  //       if (element.roomChangingDate.day == 1) {}
  //     }
  //   }
  // }
}
