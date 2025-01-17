import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomNavigationBar extends StatelessWidget
    implements PreferredSizeWidget {
  final bool isColorSurface;

  // AppBar properties
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;

  /// Small class to create an appbar with one of two colors for the system navigation bar on android
  const CustomNavigationBar({super.key, required this.isColorSurface, this.leading, this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    ColorScheme appColorScheme = ColorScheme.fromSeed(
      seedColor: Colors.deepOrange,
      brightness: MediaQuery.of(context).platformBrightness,
    );

    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: (isColorSurface)
            ? appColorScheme.surface
            : ElevationOverlay.applySurfaceTint(
                appColorScheme.surface,
                appColorScheme.surfaceTint,
                3.0,
              ),
      ),
      leading: leading,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
