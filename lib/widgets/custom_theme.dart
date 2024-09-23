import 'package:flutter/material.dart';

class CustomTheme extends StatefulWidget {
  final ImageProvider image;
  final Widget child;

  const CustomTheme({super.key, required this.image, required this.child});

  @override
  State<StatefulWidget> createState() => _CustomTheme();
}

class _CustomTheme extends State<CustomTheme> {
  ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.deepOrange, brightness: Brightness.light);

  final Brightness _brightness = Brightness.light;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _initTheme();
    });
  }

  void _initTheme() async {
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
        child: widget.child);
  }
}
