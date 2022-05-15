// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Food _$FoodFromJson(Map<String, dynamic> json) => Food(
      foodId: json['foodId'] as String,
      foodName: json['foodName'] as String,
      isAvailable: json['isAvailable'] as bool,
      description: json['description'] as String?,
      price: json['price'] as num?,
      foodImage: json['foodImage'] as String?,
      hostels:
          (json['hostels'] as List<dynamic>).map((e) => e as String).toList(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
      'foodId': instance.foodId,
      'foodName': instance.foodName,
      'description': instance.description,
      'price': instance.price,
      'foodImage': instance.foodImage,
      'reviews': instance.reviews?.map((e) => e.toJson()).toList(),
      'hostels': instance.hostels,
      'isAvailable': instance.isAvailable,
    };
