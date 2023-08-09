///Сущность данных

///Тип роли
enum RoleType {
  /// Бот
  bot,

  /// Пользователь
  user,
}

///Тип сообщения
enum MessageType {
  /// Текстовое сообщение
  text,

  /// Викторина
  quiz,
}

///Сущность данных
class JsonData {
  /// Роль
  final RoleType role;

  /// Тип сообщения
  final MessageType messageType;

  /// Текст сообщения
  final String text;

  /// варианты ответов
  final List<Answers>? answers;

  ///Флаг отправки сообщения
  final bool isSend;

  ///конструктор [JsonData]
  JsonData({
    required this.answers,
    required this.text,
    required this.role,
    required this.messageType,
    required this.isSend,
  });
}

///Сущность ответов
class Answers {
  /// Текст ответа
  final String text;

  /// Правильность ответа
  final bool? correct;

  ///конструктор [Answers]
  Answers({
    required this.correct,
    required this.text,
  });
}
