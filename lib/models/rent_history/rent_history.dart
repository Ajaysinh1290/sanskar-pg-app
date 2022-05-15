import 'package:json_annotation/json_annotation.dart';

part 'rent_history.g.dart';

@JsonSerializable()
class RentHistory {
  late String transactionId;
  late DateTime rentMonth;

  RentHistory({required this.transactionId, required this.rentMonth});

  factory RentHistory.fromJson(Map<String, dynamic> data) =>
      _$RentHistoryFromJson(data);

  Map<String, dynamic> toJson() => _$RentHistoryToJson(this);
}
