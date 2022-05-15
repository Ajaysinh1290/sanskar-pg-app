import 'package:json_annotation/json_annotation.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class ChatModel {
  late String chatId;
  late String message;
  late String sentBy;
  late String sentTo;
  late bool isMedia;
  List<String>? readBy;
  late DateTime messageSentOn;

  ChatModel(
      {required this.chatId,
      required this.message,
      required this.sentBy,
      required this.sentTo,
      required this.isMedia,
      this.readBy,
      required this.messageSentOn});

  factory ChatModel.fromJson(Map<String, dynamic> data) =>
      _$ChatModelFromJson(data);

  Map<String, dynamic> toJson() => _$ChatModelToJson(this);
}
