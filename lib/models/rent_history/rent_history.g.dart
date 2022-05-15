// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentHistory _$RentHistoryFromJson(Map<String, dynamic> json) => RentHistory(
      transactionId: json['transactionId'] as String,
      rentMonth: DateTime.parse(json['rentMonth'] as String),
    );

Map<String, dynamic> _$RentHistoryToJson(RentHistory instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'rentMonth': instance.rentMonth.toIso8601String(),
    };
