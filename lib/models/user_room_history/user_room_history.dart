import 'package:json_annotation/json_annotation.dart';

part 'user_room_history.g.dart';

@JsonSerializable()
class UserRoomHistory {
  late String roomId;
  late DateTime roomChangingDate;

  UserRoomHistory({required this.roomId, required this.roomChangingDate});

  factory UserRoomHistory.fromJson(Map<String, dynamic> data) =>
      _$UserRoomHistoryFromJson(data);

  Map<String, dynamic> toJson() => _$UserRoomHistoryToJson(this);
}
