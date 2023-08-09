import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveActivityIndicator extends StatelessWidget {
  final Brightness brightness;

  const AdaptiveActivityIndicator({Key? key, this.brightness = Brightness.dark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Theme.of(context).platform != TargetPlatform.iOS)
        ? Container(
            height: 20.0,
            width: 20.0,
            child: CircularProgressIndicator(
              value: null,
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
            child: const CupertinoActivityIndicator(
              animating: true,
            ),
          );
  }
}
