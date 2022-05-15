import 'package:json_annotation/json_annotation.dart';
import 'package:sanskar_pg_app/models/address/address.dart';
import 'package:sanskar_pg_app/models/review/review.dart';

part 'event.g.dart';

@JsonSerializable(explicitToJson: true)
class Event {
  late String eventTitle;
  late String hostelId;
  late String eventId;
  late String eventImage;
  late DateTime startingDate;
  late DateTime endingDate;
  late DateTime startingTime;
  late DateTime endingTime;
  late Address address;
  List<Review>? reviews;
  String? description;

  Event(
      {required this.eventId,
      required this.eventTitle,
      required this.eventImage,
      required this.startingDate,
      required this.endingDate,
      required this.startingTime,
      required this.endingTime,
      required this.address,
      required this.hostelId,
      this.description,
      this.reviews});

  factory Event.fromJson(Map<String, dynamic> data) => _$EventFromJson(data);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
