// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      roomId: json['roomId'] as String,
      capacity: json['capacity'] as int,
      roomNumber: json['roomNumber'] as int,
      floor: json['floor'] as int,
      wing: json['wing'] as String,
      roomType: json['roomType'] as String,
      isActive: json['isActive'] as bool?,
      users:
          (json['users'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'floor': instance.floor,
      'wing': instance.wing,
      'roomNumber': instance.roomNumber,
      'roomId': instance.roomId,
      'capacity': instance.capacity,
      'users': instance.users,
      'isActive': instance.isActive,
      'roomType': instance.roomType,
    };
