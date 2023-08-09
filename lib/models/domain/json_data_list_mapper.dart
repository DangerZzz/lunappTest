import 'package:lunapp_test/models/domain/json_data_list.dart';
import 'package:lunapp_test/models/dto/json_data_dto.dart';

/// Заполнение модели [JsonData] данными [JsonDataDTO]
JsonData jsonDataMapper(JsonDataDTO data) {
  late RoleType roleType;
  late MessageType messageType;
  final answers = <Answers>[];

  switch (data.source) {
    case 'user':
      roleType = RoleType.user;
      break;
    case 'bot':
      roleType = RoleType.bot;
      break;
    default:
      roleType = RoleType.bot;
  }

  switch (data.type) {
    case 'text':
      messageType = MessageType.text;
      break;
    case 'quiz':
      messageType = MessageType.quiz;
      break;
    default:
      messageType = MessageType.text;
  }

  for (var answer in (data.answers ?? [])) {
    answers.add(
      Answers(
        correct: (answer.correct == 'true') ? true : false,
        text: answer.text,
      ),
    );
  }

  return JsonData(
    text: data.text,
    role: roleType,
    messageType: messageType,
    answers: answers,
    isSend: roleType == RoleType.bot ? true : false,
  );
}
