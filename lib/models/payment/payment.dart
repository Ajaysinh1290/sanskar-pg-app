import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';

@JsonSerializable()
class Payment {
  late String transactionId;
  late num amount;
  late DateTime transactionDate;
  late String userId;
  String? description;

  Payment(
      {required this.transactionId,
      required this.amount,
      required this.transactionDate,
      required this.userId,
      this.description});

  factory Payment.fromJson(Map<String, dynamic> data) =>
      _$PaymentFromJson(data);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}