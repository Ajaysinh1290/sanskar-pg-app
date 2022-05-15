import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  String? street;
  String? city;
  String? state;
  String? pinCode;

  Address({this.street, this.city, this.state, this.pinCode});

  factory Address.fromJson(Map<String, dynamic> data) =>
      _$AddressFromJson(data);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
