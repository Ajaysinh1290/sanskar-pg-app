// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userId: json['userId'] as String,
      roomHistory: (json['roomHistory'] as List<dynamic>)
          .map((e) => UserRoomHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      userName: json['userName'] as String,
      userProfilePic: json['userProfilePic'] as String?,
      points: json['points'] as int?,
      referId: json['referId'] as String?,
      referred: (json['referred'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      referredBy: json['referredBy'] as String?,
      email: json['email'] as String,
      mobileNumber: json['mobileNumber'] as String?,
      gender: json['gender'] as String,
      hostelId: json['hostelId'] as String,
      documents:
          (json['documents'] as List<dynamic>).map((e) => e as String).toList(),
      isAccountApproved: json['isAccountApproved'] as bool,
      isAccountBlocked: json['isAccountBlocked'] as bool?,
      isAccountRejected: json['isAccountRejected'] as bool?,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      password: json['password'] as String,
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      admissionDate: json['admissionDate'] == null
          ? null
          : DateTime.parse(json['admissionDate'] as String),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'userProfilePic': instance.userProfilePic,
      'password': instance.password,
      'points': instance.points,
      'referId': instance.referId,
      'referred': instance.referred,
      'referredBy': instance.referredBy,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'email': instance.email,
      'mobileNumber': instance.mobileNumber,
      'gender': instance.gender,
      'hostelId': instance.hostelId,
      'roomHistory': instance.roomHistory.map((e) => e.toJson()).toList(),
      'isAccountApproved': instance.isAccountApproved,
      'isAccountRejected': instance.isAccountRejected,
      'isAccountBlocked': instance.isAccountBlocked,
      'transactions': instance.transactions,
      'documents': instance.documents,
      'address': instance.address.toJson(),
      'admissionDate': instance.admissionDate?.toIso8601String(),
    };
