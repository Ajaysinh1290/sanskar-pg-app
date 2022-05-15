// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      reviewId: json['reviewId'] as String,
      userId: json['userId'] as String,
      rating: (json['rating'] as num?)?.toDouble(),
      reviewTime: DateTime.parse(json['reviewTime'] as String),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'reviewId': instance.reviewId,
      'userId': instance.userId,
      'rating': instance.rating,
      'description': instance.description,
      'reviewTime': instance.reviewTime.toIso8601String(),
    };
