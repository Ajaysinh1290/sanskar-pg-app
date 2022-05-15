import 'package:json_annotation/json_annotation.dart';
import 'package:sanskar_pg_app/models/address/address.dart';
import 'package:sanskar_pg_app/models/room/room.dart';
import 'package:sanskar_pg_app/models/room_rent_history/room_rent_history.dart';

part 'hostel.g.dart';

@JsonSerializable(explicitToJson: true)
class Hostel {
  late String hostelId;
  late String hostelName;
  String? description;
  late Address address;
  late String mobileNumber;
  List<String>? images;
  late String emailId;
  late List<Room> rooms;
  String? about;
  String? privacyPolicy;
  late List<RoomRentHistory> acRoomRentHistory;
  late List<RoomRentHistory> noneAcRoomRentHistory;

  Hostel(
      {required this.hostelId,
      required this.hostelName,
      this.description,
      required this.address,
      required this.mobileNumber,
      this.images,
      required this.emailId,
      required this.acRoomRentHistory,
      required this.noneAcRoomRentHistory,
      required this.rooms,
      this.about,
      this.privacyPolicy});

  factory Hostel.fromJson(Map<String, dynamic> data) => _$HostelFromJson(data);

  Map<String, dynamic> toJson() => _$HostelToJson(this);
}
