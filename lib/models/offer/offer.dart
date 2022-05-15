import 'package:json_annotation/json_annotation.dart';

part 'offer.g.dart';

@JsonSerializable()
class Offer {
  late String offerId;
  late num value;
  late String discountType;
  late DateTime lastDate;

  Offer(
      {required this.offerId,
      required this.value,
      required this.discountType,
      required this.lastDate});

  factory Offer.fromJson(Map<String, dynamic> data) => _$OfferFromJson(data);

  Map<String, dynamic> toJson() => _$OfferToJson(this);
}
