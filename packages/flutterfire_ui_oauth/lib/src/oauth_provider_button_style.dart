import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ThemedValue<T> {
  final T dark;
  final T light;

  const ThemedValue(this.dark, this.light);

  T getValue(Brightness brightness) {
    switch (brightness) {
      case Brightness.dark:
        return dark;
      case Brightness.light:
        return light;
    }
  }
}

class ThemedColor extends ThemedValue<Color> {
  const ThemedColor(Color dark, Color light) : super(dark, light);
}

class ThemedIconSrc extends ThemedValue<String> {
  const ThemedIconSrc(
    String dark,
    String light,
  ) : super(dark, light);
}

abstract class ThemedOAuthProviderButtonStyle {
  ThemedIconSrc get iconSrc;
  ThemedColor get backgroundColor;
  ThemedColor get color;
  ThemedColor get iconBackgroundColor => backgroundColor;
  ThemedColor get borderColor => backgroundColor;
  double get iconPadding => 0;
  String get assetsPackage;

  const ThemedOAuthProviderButtonStyle();

  OAuthProviderButtonStyle withBrightness(Brightness brightness) {
    return OAuthProviderButtonStyle(
      iconSrc: iconSrc.getValue(brightness),
      backgroundColor: backgroundColor.getValue(brightness),
      color: color.getValue(brightness),
      borderColor: borderColor.getValue(brightness),
      assetsPackage: assetsPackage,
      iconBackgroundColor: iconBackgroundColor.getValue(brightness),
    );
  }
}

class OAuthProviderButtonStyle {
  final String iconSrc;
  final Color backgroundColor;
  final Color color;
  final Color borderColor;
  final String assetsPackage;
  final Color iconBackgroundColor;

  OAuthProviderButtonStyle({
    required this.iconSrc,
    required this.backgroundColor,
    required this.color,
    required this.borderColor,
    required this.assetsPackage,
    required this.iconBackgroundColor,
  });
}
