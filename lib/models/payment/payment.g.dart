// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      transactionId: json['transactionId'] as String,
      amount: json['amount'] as num,
      transactionDate: DateTime.parse(json['transactionDate'] as String),
      userId: json['userId'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'transactionId': instance.transactionId,
      'amount': instance.amount,
      'transactionDate': instance.transactionDate.toIso8601String(),
      'userId': instance.userId,
      'description': instance.description,
    };
