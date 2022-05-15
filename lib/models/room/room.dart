import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable()
class Room {
  late int floor;
  late String wing;
  late int roomNumber;
  late String roomId;
  late int capacity;
  List<String>? users;
  bool? isActive;
  late String roomType;

  Room(
      {required this.roomId,
      required this.capacity,
      required this.roomNumber,
      required this.floor,
      required this.wing,
      required this.roomType,
      this.isActive,
      this.users});

  factory Room.fromJson(Map<String, dynamic> data) => _$RoomFromJson(data);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
