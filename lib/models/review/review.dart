import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  late String reviewId;
  late String userId;
  double? rating;
  String? description;
  late DateTime reviewTime;

  Review(
      {required this.reviewId,
      required this.userId,
      this.rating,
      required this.reviewTime,
      this.description});

  factory Review.fromJson(Map<String, dynamic> data) => _$ReviewFromJson(data);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
