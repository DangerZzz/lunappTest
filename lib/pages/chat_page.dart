import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lunapp_test/models/domain/json_data_list.dart';
import 'package:lunapp_test/widgets/chat_container.dart';

///Основная страница в виде чата
class ChatPage extends StatefulWidget {
  ///Полученные данные
  final List<JsonData> chatData;

  const ChatPage({
    required this.chatData,
    Key? key,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ///Индекс сообщения
  int index = 0;

  ///Индекс прошлого сообщения для сверки
  int lastIndex = -1;

  ///Флаг корректности ответа
  bool isCorrectAnswer = true;

  ///Список отображаемых сообщений
  final messages = <JsonData>[];

  ///Таймер для отображения сообщений по времени
  Timer? timer;

  @override
  void initState() {
    super.initState();

    ///Запуск таймера с вызывом функции заполнения данных
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer t) => _messagesWithDelay(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(155, 155, 155, 1),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(14, 22, 14, 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            for (int i = 0; i < messages.length; i++) ...[
              if (messages[i].role == RoleType.bot) ...[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset('assets/images/splash_screen.png'),
                      ),
                      ChatContainer(
                        text: messages[i].text,
                        color: const Color.fromRGBO(115, 115, 115, 1),
                        tail: true,
                        isSender: false,
                        margin: const EdgeInsets.fromLTRB(22, 18, 22, 18),
                        textStyle: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                if (messages[i].answers != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (var answer in (messages[i].answers ?? [])) ...[
                          GestureDetector(
                            onTap: () => _onVariantTap(answer),
                            child: Container(
                              width: 172,
                              decoration: BoxDecoration(
                                color: (!answer.correct && !isCorrectAnswer)
                                    ? const Color.fromRGBO(157, 48, 48, 1)
                                    : const Color.fromRGBO(67, 62, 62, 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: Center(
                                  child: Text(
                                    answer.text,
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
              ],
              if (messages[i].role == RoleType.user)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ChatContainer(
                        text: messages[i].text,
                        color: const Color.fromRGBO(249, 212, 106, 1),
                        tail: true,
                        isSender: true,
                        margin: const EdgeInsets.fromLTRB(22, 18, 26, 18),
                        textStyle: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset('assets/images/user_icon.png'),
                      ),
                    ],
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }

  /// Функция нажатия на вариант ответа
  void _onVariantTap(Answers answer) {
    if (answer.correct ?? false) {
      setState(() {
        messages.removeAt(index);

        messages.add(
          JsonData(
            answers: null,
            text: messages.last.text,
            role: messages.last.role,
            messageType: messages.last.messageType,
          ),
        );

        messages.add(
          JsonData(
            answers: null,
            text: answer.text,
            role: RoleType.user,
            messageType: MessageType.text,
          ),
        );
        index++;
      });
    } else {
      setState(() {
        isCorrectAnswer = false;
      });
    }
  }

  /// Функция заполнения списка сообщений данными
  void _messagesWithDelay() {
    if (lastIndex == index) {
      return;
    } else {
      lastIndex = index;
    }
    if (widget.chatData[lastIndex].messageType == MessageType.quiz) {
      setState(() {
        messages.add(widget.chatData[lastIndex]);
      });
    } else {
      setState(() {
        messages.add(widget.chatData[lastIndex]);
      });
      index++;
    }
  }
}
