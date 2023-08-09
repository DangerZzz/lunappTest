import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// [AdaptiveActivityIndicator] отображающийся в зависимости от системы
class AdaptiveActivityIndicator extends StatelessWidget {
  ///
  final Brightness brightness;

  ///
  final double radius;

  ///
  const AdaptiveActivityIndicator({
    Key? key,
    this.brightness = Brightness.dark,
    this.radius = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Theme.of(context).platform != TargetPlatform.iOS)
        ? SizedBox(
            height: 20.0,
            width: 20.0,
            child: CircularProgressIndicator(
              strokeWidth: 1.0,
              valueColor: AlwaysStoppedAnimation<Color>(
                brightness == Brightness.dark
                    ? Colors.white
                    : Theme.of(context).colorScheme.secondary,
              ),
            ),
          )
        : CupertinoTheme(
            data: CupertinoTheme.of(context).copyWith(brightness: brightness),
            child: CupertinoActivityIndicator(radius: radius / 2),
          );
  }
}
