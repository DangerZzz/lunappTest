// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonDataDTO _$JsonDataDTOFromJson(Map<String, dynamic> json) => JsonDataDTO(
      text: json['text'] as String,
      type: json['type'] as String,
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => AnswersDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      source: json['source'] as String,
    );

Map<String, dynamic> _$JsonDataDTOToJson(JsonDataDTO instance) =>
    <String, dynamic>{
      'source': instance.source,
      'type': instance.type,
      'text': instance.text,
      'answers': instance.answers,
    };

AnswersDTO _$AnswersDTOFromJson(Map<String, dynamic> json) => AnswersDTO(
      text: json['text'] as String,
      correct: json['correct'] as String?,
    );

Map<String, dynamic> _$AnswersDTOToJson(AnswersDTO instance) =>
    <String, dynamic>{
      'text': instance.text,
      'correct': instance.correct,
    };
