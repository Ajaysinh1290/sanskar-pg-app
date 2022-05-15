// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_room_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRoomHistory _$UserRoomHistoryFromJson(Map<String, dynamic> json) =>
    UserRoomHistory(
      roomId: json['roomId'] as String,
      roomChangingDate: DateTime.parse(json['roomChangingDate'] as String),
    );

Map<String, dynamic> _$UserRoomHistoryToJson(UserRoomHistory instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'roomChangingDate': instance.roomChangingDate.toIso8601String(),
    };
