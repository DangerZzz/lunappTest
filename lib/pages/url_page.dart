import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lunapp_test/api/api.dart';
import 'package:lunapp_test/pages/chat_page.dart';
import 'package:lunapp_test/widgets/adaptive_activity_indicator.dart';

///Строница ввода ссылки
class UrlPage extends StatefulWidget {
  const UrlPage({Key? key}) : super(key: key);

  @override
  State<UrlPage> createState() => _UrlPageState();
}

class _UrlPageState extends State<UrlPage> {
  ///Контроллер ввода ссылки
  final _urlController = TextEditingController();

  ///Статус загрузки
  bool _loadingStatus = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _urlController.text =
          'https://lunappstudio.com/hr/test_spanish_numerals.json';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(155, 155, 155, 1),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _urlController,
              onEditingComplete: () {
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Введите адрес json файла',
                hintStyle: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.black38,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black38),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            GestureDetector(
              onTap: () async {
                _loadingStatus ? null : _getData(url: _urlController.text);
              },
              child: Container(
                height: 60,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(67, 62, 62, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: _loadingStatus
                    ? const Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: AdaptiveActivityIndicator(),
                        ),
                      )
                    : Center(
                        child: Text(
                          'Начать урок',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///Вызов функции загрузки данных и перехода на страницу
  Future<void> _getData({required String url}) async {
    setState(() {
      _loadingStatus = true;
    });
    final data = await Api.getJsonData(
      url: url,
    );
    await Future<void>.delayed(const Duration(seconds: 1));

    if (data.isNotEmpty) {
      //ignore: use_build_context_synchronously
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatPage(chatData: data),
        ),
      );
    }

    setState(() {
      _loadingStatus = false;
    });
  }
}
