// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      eventId: json['eventId'] as String,
      eventTitle: json['eventTitle'] as String,
      eventImage: json['eventImage'] as String,
      startingDate: DateTime.parse(json['startingDate'] as String),
      endingDate: DateTime.parse(json['endingDate'] as String),
      startingTime: DateTime.parse(json['startingTime'] as String),
      endingTime: DateTime.parse(json['endingTime'] as String),
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      hostelId: json['hostelId'] as String,
      description: json['description'] as String?,
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'eventTitle': instance.eventTitle,
      'hostelId': instance.hostelId,
      'eventId': instance.eventId,
      'eventImage': instance.eventImage,
      'startingDate': instance.startingDate.toIso8601String(),
      'endingDate': instance.endingDate.toIso8601String(),
      'startingTime': instance.startingTime.toIso8601String(),
      'endingTime': instance.endingTime.toIso8601String(),
      'address': instance.address.toJson(),
      'reviews': instance.reviews?.map((e) => e.toJson()).toList(),
      'description': instance.description,
    };
