import 'package:json_annotation/json_annotation.dart';
import 'package:sanskar_pg_app/models/review/review.dart';

part 'food.g.dart';

@JsonSerializable(explicitToJson: true)
class Food {
  late String foodId;
  late String foodName;
  String? description;
  num? price;
  String? foodImage;
  List<Review>? reviews;
  List<String> hostels;
  bool isAvailable;

  Food(
      {required this.foodId,
      required this.foodName,
      required this.isAvailable,
      this.description,
      this.price,
      this.foodImage,
      required this.hostels,
      this.reviews});

  factory Food.fromJson(Map<String, dynamic> data) => _$FoodFromJson(data);

  Map<String, dynamic> toJson() => _$FoodToJson(this);
}
