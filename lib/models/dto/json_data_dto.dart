import 'package:json_annotation/json_annotation.dart';

part 'json_data_dto.g.dart';

/// Модель, хранящая список данных
@JsonSerializable()
class JsonDataDTO {
  /// Источник
  @JsonKey(name: 'source')
  final String source;

  /// Тип
  @JsonKey(name: 'type')
  final String type;

  /// Текст
  @JsonKey(name: 'text')
  final String text;

  /// Ответы
  @JsonKey(name: 'answers')
  final List<AnswersDTO>? answers;

  /// Конструктор [JsonDataDTO]
  JsonDataDTO({
    required this.text,
    required this.type,
    required this.answers,
    required this.source,
  });

  /// Преобразование из json
  factory JsonDataDTO.fromJson(Map<String, dynamic> json) =>
      _$JsonDataDTOFromJson(json);

  /// Преобразование из json в лист объектов
  static Iterable<JsonDataDTO> listFromJson(
    Iterable<Map<String, dynamic>> parsedJson,
  ) {
    Iterable<JsonDataDTO> list = <JsonDataDTO>[];
    list = parsedJson.map((i) => JsonDataDTO.fromJson(i)).toList();
    return list;
  }

  /// Преобразование в json
  Map<String, dynamic> toJson() => _$JsonDataDTOToJson(this);
}

/// Модель ответов
@JsonSerializable()
class AnswersDTO {
  /// Текст ответа
  @JsonKey(name: 'text')
  final String text;

  /// Правильность ответа
  @JsonKey(name: 'correct')
  final String? correct;

  /// Конструктор [AnswersDTO]
  AnswersDTO({
    required this.text,
    required this.correct,
  });

  /// Преобразование из json
  factory AnswersDTO.fromJson(Map<String, dynamic> json) =>
      _$AnswersDTOFromJson(json);

  /// Преобразование из json в лист объектов
  static Iterable<AnswersDTO> listFromJson(
    Iterable<Map<String, dynamic>> parsedJson,
  ) {
    Iterable<AnswersDTO> list = <AnswersDTO>[];
    list = parsedJson.map((i) => AnswersDTO.fromJson(i)).toList();
    return list;
  }

  /// Преобразование в json
  Map<String, dynamic> toJson() => _$AnswersDTOToJson(this);
}
