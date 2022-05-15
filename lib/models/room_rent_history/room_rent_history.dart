import 'package:json_annotation/json_annotation.dart';

part 'room_rent_history.g.dart';

@JsonSerializable()
class RoomRentHistory {
  late int rent;
  late DateTime rentChangingDate;

  RoomRentHistory({required this.rent, required this.rentChangingDate});

  factory RoomRentHistory.fromJson(Map<String, dynamic> data) =>
      _$RoomRentHistoryFromJson(data);

  Map<String, dynamic> toJson() => _$RoomRentHistoryToJson(this);
}
