// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_rent_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomRentHistory _$RoomRentHistoryFromJson(Map<String, dynamic> json) =>
    RoomRentHistory(
      rent: json['rent'] as int,
      rentChangingDate: DateTime.parse(json['rentChangingDate'] as String),
    );

Map<String, dynamic> _$RoomRentHistoryToJson(RoomRentHistory instance) =>
    <String, dynamic>{
      'rent': instance.rent,
      'rentChangingDate': instance.rentChangingDate.toIso8601String(),
    };
