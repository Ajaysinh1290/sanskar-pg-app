// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hostel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hostel _$HostelFromJson(Map<String, dynamic> json) => Hostel(
      hostelId: json['hostelId'] as String,
      hostelName: json['hostelName'] as String,
      description: json['description'] as String?,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      mobileNumber: json['mobileNumber'] as String,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      emailId: json['emailId'] as String,
      acRoomRentHistory: (json['acRoomRentHistory'] as List<dynamic>)
          .map((e) => RoomRentHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      noneAcRoomRentHistory: (json['noneAcRoomRentHistory'] as List<dynamic>)
          .map((e) => RoomRentHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => Room.fromJson(e as Map<String, dynamic>))
          .toList(),
      about: json['about'] as String?,
      privacyPolicy: json['privacyPolicy'] as String?,
    );

Map<String, dynamic> _$HostelToJson(Hostel instance) => <String, dynamic>{
      'hostelId': instance.hostelId,
      'hostelName': instance.hostelName,
      'description': instance.description,
      'address': instance.address.toJson(),
      'mobileNumber': instance.mobileNumber,
      'images': instance.images,
      'emailId': instance.emailId,
      'rooms': instance.rooms.map((e) => e.toJson()).toList(),
      'about': instance.about,
      'privacyPolicy': instance.privacyPolicy,
      'acRoomRentHistory':
          instance.acRoomRentHistory.map((e) => e.toJson()).toList(),
      'noneAcRoomRentHistory':
          instance.noneAcRoomRentHistory.map((e) => e.toJson()).toList(),
    };
