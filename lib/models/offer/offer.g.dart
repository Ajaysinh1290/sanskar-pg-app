// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Offer _$OfferFromJson(Map<String, dynamic> json) => Offer(
      offerId: json['offerId'] as String,
      value: json['value'] as num,
      discountType: json['discountType'] as String,
      lastDate: DateTime.parse(json['lastDate'] as String),
    );

Map<String, dynamic> _$OfferToJson(Offer instance) => <String, dynamic>{
      'offerId': instance.offerId,
      'value': instance.value,
      'discountType': instance.discountType,
      'lastDate': instance.lastDate.toIso8601String(),
    };
