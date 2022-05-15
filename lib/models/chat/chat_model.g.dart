// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel(
      chatId: json['chatId'] as String,
      message: json['message'] as String,
      sentBy: json['sentBy'] as String,
      sentTo: json['sentTo'] as String,
      isMedia: json['isMedia'] as bool,
      readBy:
          (json['readBy'] as List<dynamic>?)?.map((e) => e as String).toList(),
      messageSentOn: DateTime.parse(json['messageSentOn'] as String),
    );

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      'chatId': instance.chatId,
      'message': instance.message,
      'sentBy': instance.sentBy,
      'sentTo': instance.sentTo,
      'isMedia': instance.isMedia,
      'readBy': instance.readBy,
      'messageSentOn': instance.messageSentOn.toIso8601String(),
    };
