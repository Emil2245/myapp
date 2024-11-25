import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5c5891),
      surfaceTint: Color(0xff5c5891),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffe3dfff),
      onPrimaryContainer: Color(0xff18124a),
      secondary: Color(0xff5e5c71),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe4dff9),
      onSecondaryContainer: Color(0xff1b1a2c),
      tertiary: Color(0xff65558f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffe9ddff),
      onTertiaryContainer: Color(0xff201047),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffcf8ff),
      onSurface: Color(0xff1c1b20),
      onSurfaceVariant: Color(0xff47464f),
      outline: Color(0xff787680),
      outlineVariant: Color(0xffc8c5d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313036),
      inversePrimary: Color(0xffc5c0ff),
      primaryFixed: Color(0xffe3dfff),
      onPrimaryFixed: Color(0xff18124a),
      primaryFixedDim: Color(0xffc5c0ff),
      onPrimaryFixedVariant: Color(0xff444078),
      secondaryFixed: Color(0xffe4dff9),
      onSecondaryFixed: Color(0xff1b1a2c),
      secondaryFixedDim: Color(0xffc7c4dc),
      onSecondaryFixedVariant: Color(0xff464559),
      tertiaryFixed: Color(0xffe9ddff),
      onTertiaryFixed: Color(0xff201047),
      tertiaryFixedDim: Color(0xffcfbdfe),
      onTertiaryFixedVariant: Color(0xff4d3d75),
      surfaceDim: Color(0xffdcd8e0),
      surfaceBright: Color(0xfffcf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f2fa),
      surfaceContainer: Color(0xfff0ecf4),
      surfaceContainerHigh: Color(0xffebe7ef),
      surfaceContainerHighest: Color(0xffe5e1e9),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff403c73),
      surfaceTint: Color(0xff5c5891),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff726ea9),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff424155),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff757288),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff493971),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff7b6ba7),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8ff),
      onSurface: Color(0xff1c1b20),
      onSurfaceVariant: Color(0xff43424b),
      outline: Color(0xff605e67),
      outlineVariant: Color(0xff7c7983),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313036),
      inversePrimary: Color(0xffc5c0ff),
      primaryFixed: Color(0xff726ea9),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff59558f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff757288),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff5c5a6f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff7b6ba7),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff62538c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdcd8e0),
      surfaceBright: Color(0xfffcf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f2fa),
      surfaceContainer: Color(0xfff0ecf4),
      surfaceContainerHigh: Color(0xffebe7ef),
      surfaceContainerHighest: Color(0xffe5e1e9),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1f1a51),
      surfaceTint: Color(0xff5c5891),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff403c73),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff212033),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff424155),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff27174e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff493971),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff24232b),
      outline: Color(0xff43424b),
      outlineVariant: Color(0xff43424b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313036),
      inversePrimary: Color(0xffeee9ff),
      primaryFixed: Color(0xff403c73),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff29255c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff424155),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff2c2b3e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff493971),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff322359),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdcd8e0),
      surfaceBright: Color(0xfffcf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f2fa),
      surfaceContainer: Color(0xfff0ecf4),
      surfaceContainerHigh: Color(0xffebe7ef),
      surfaceContainerHighest: Color(0xffe5e1e9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc5c0ff),
      surfaceTint: Color(0xffc5c0ff),
      onPrimary: Color(0xff2d2960),
      primaryContainer: Color(0xff444078),
      onPrimaryContainer: Color(0xffe3dfff),
      secondary: Color(0xffc7c4dc),
      onSecondary: Color(0xff302e42),
      secondaryContainer: Color(0xff464559),
      onSecondaryContainer: Color(0xffe4dff9),
      tertiary: Color(0xffcfbdfe),
      onTertiary: Color(0xff36275d),
      tertiaryContainer: Color(0xff4d3d75),
      onTertiaryContainer: Color(0xffe9ddff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff131318),
      onSurface: Color(0xffe5e1e9),
      onSurfaceVariant: Color(0xffc8c5d0),
      outline: Color(0xff928f99),
      outlineVariant: Color(0xff47464f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e9),
      inversePrimary: Color(0xff5c5891),
      primaryFixed: Color(0xffe3dfff),
      onPrimaryFixed: Color(0xff18124a),
      primaryFixedDim: Color(0xffc5c0ff),
      onPrimaryFixedVariant: Color(0xff444078),
      secondaryFixed: Color(0xffe4dff9),
      onSecondaryFixed: Color(0xff1b1a2c),
      secondaryFixedDim: Color(0xffc7c4dc),
      onSecondaryFixedVariant: Color(0xff464559),
      tertiaryFixed: Color(0xffe9ddff),
      onTertiaryFixed: Color(0xff201047),
      tertiaryFixedDim: Color(0xffcfbdfe),
      onTertiaryFixedVariant: Color(0xff4d3d75),
      surfaceDim: Color(0xff131318),
      surfaceBright: Color(0xff3a383f),
      surfaceContainerLowest: Color(0xff0e0e13),
      surfaceContainerLow: Color(0xff1c1b20),
      surfaceContainer: Color(0xff201f25),
      surfaceContainerHigh: Color(0xff2a292f),
      surfaceContainerHighest: Color(0xff35343a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc9c5ff),
      surfaceTint: Color(0xffc5c0ff),
      onPrimary: Color(0xff120c45),
      primaryContainer: Color(0xff8e8ac7),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffccc8e1),
      onSecondary: Color(0xff151426),
      secondaryContainer: Color(0xff918ea5),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffd3c1ff),
      onTertiary: Color(0xff1b0942),
      tertiaryContainer: Color(0xff9887c5),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff131318),
      onSurface: Color(0xfffef9ff),
      onSurfaceVariant: Color(0xffcdc9d4),
      outline: Color(0xffa4a1ac),
      outlineVariant: Color(0xff84828c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e9),
      inversePrimary: Color(0xff454179),
      primaryFixed: Color(0xffe3dfff),
      onPrimaryFixed: Color(0xff0d0540),
      primaryFixedDim: Color(0xffc5c0ff),
      onPrimaryFixedVariant: Color(0xff332f66),
      secondaryFixed: Color(0xffe4dff9),
      onSecondaryFixed: Color(0xff100f21),
      secondaryFixedDim: Color(0xffc7c4dc),
      onSecondaryFixedVariant: Color(0xff363448),
      tertiaryFixed: Color(0xffe9ddff),
      onTertiaryFixed: Color(0xff16033d),
      tertiaryFixedDim: Color(0xffcfbdfe),
      onTertiaryFixedVariant: Color(0xff3c2d63),
      surfaceDim: Color(0xff131318),
      surfaceBright: Color(0xff3a383f),
      surfaceContainerLowest: Color(0xff0e0e13),
      surfaceContainerLow: Color(0xff1c1b20),
      surfaceContainer: Color(0xff201f25),
      surfaceContainerHigh: Color(0xff2a292f),
      surfaceContainerHighest: Color(0xff35343a),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffef9ff),
      surfaceTint: Color(0xffc5c0ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffc9c5ff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffef9ff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffccc8e1),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffd3c1ff),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff131318),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffef9ff),
      outline: Color(0xffcdc9d4),
      outlineVariant: Color(0xffcdc9d4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e9),
      inversePrimary: Color(0xff272259),
      primaryFixed: Color(0xffe8e4ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffc9c5ff),
      onPrimaryFixedVariant: Color(0xff120c45),
      secondaryFixed: Color(0xffe8e4fd),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffccc8e1),
      onSecondaryFixedVariant: Color(0xff151426),
      tertiaryFixed: Color(0xffede2ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffd3c1ff),
      onTertiaryFixedVariant: Color(0xff1b0942),
      surfaceDim: Color(0xff131318),
      surfaceBright: Color(0xff3a383f),
      surfaceContainerLowest: Color(0xff0e0e13),
      surfaceContainerLow: Color(0xff1c1b20),
      surfaceContainer: Color(0xff201f25),
      surfaceContainerHigh: Color(0xff2a292f),
      surfaceContainerHighest: Color(0xff35343a),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
