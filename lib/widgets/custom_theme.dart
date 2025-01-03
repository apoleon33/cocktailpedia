import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CustomTheme extends StatefulWidget {
  final ImageProvider image;
  final Widget child;

  const CustomTheme({super.key, required this.image, required this.child});

  @override
  State<StatefulWidget> createState() => _CustomTheme();
}

class _CustomTheme extends State<CustomTheme> {
  ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.deepOrange,
    brightness: SchedulerBinding.instance.platformDispatcher.platformBrightness,
  );

  final Brightness _brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // Future to avoid lag between the Hero transition and the theme switch
      Future.delayed(const Duration(seconds: 1), _initTheme);
    });
  }

  Future<void> _initTheme() async {
    colorScheme = await ColorScheme.fromImageProvider(
      provider: widget.image,
      brightness: _brightness,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
        brightness: _brightness,
      ),
      child: widget.child,
    );
  }
}
