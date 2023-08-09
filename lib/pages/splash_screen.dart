import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lunapp_test/pages/url_page.dart';

///Сплэш экран при запуске приложения
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      backgroundColor: Colors.grey,
      splashScreenBody: Center(
        child: SizedBox(
          height: 200,
          child: Image.asset('assets/images/splash_screen.png'),
        ),
      ),
      duration: const Duration(milliseconds: 1500),
      defaultNextScreen: const UrlPage(),
    );
  }
}
