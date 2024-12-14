/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsJpgGen {
  const $AssetsJpgGen();

  /// File path: assets/jpg/1.jpg
  AssetGenImage get a1 => const AssetGenImage('assets/jpg/1.jpg');

  /// File path: assets/jpg/10.jpg
  AssetGenImage get a10 => const AssetGenImage('assets/jpg/10.jpg');

  /// File path: assets/jpg/12.jpg
  AssetGenImage get a12 => const AssetGenImage('assets/jpg/12.jpg');

  /// File path: assets/jpg/2.jpg
  AssetGenImage get a2Jpg => const AssetGenImage('assets/jpg/2.jpg');

  /// File path: assets/jpg/اپلیکیشن 2.jpg
  AssetGenImage get a2Jpg_ => const AssetGenImage('assets/jpg/اپلیکیشن 2.jpg');

  /// File path: assets/jpg/5.jpg
  AssetGenImage get a5 => const AssetGenImage('assets/jpg/5.jpg');

  /// File path: assets/jpg/7.jpg
  AssetGenImage get a7 => const AssetGenImage('assets/jpg/7.jpg');

  /// File path: assets/jpg/8.jpg
  AssetGenImage get a8 => const AssetGenImage('assets/jpg/8.jpg');

  /// File path: assets/jpg/dani.jpg
  AssetGenImage get dani => const AssetGenImage('assets/jpg/dani.jpg');

  /// File path: assets/jpg/logo.jpg
  AssetGenImage get logo => const AssetGenImage('assets/jpg/logo.jpg');

  /// File path: assets/jpg/اپلیکیشن.jpg
  AssetGenImage get a => const AssetGenImage('assets/jpg/اپلیکیشن.jpg');

  /// List of all assets
  List<AssetGenImage> get values =>
      [a1, a10, a12, a2Jpg, a2Jpg_, a5, a7, a8, dani, logo, a];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/anima_tik.json
  String get animaTik => 'assets/json/anima_tik.json';

  /// File path: assets/json/arrowUp.json
  String get arrowUp => 'assets/json/arrowUp.json';

  /// File path: assets/json/disconnect.json
  String get disconnect => 'assets/json/disconnect.json';

  /// File path: assets/json/empty.json
  String get empty => 'assets/json/empty.json';

  /// File path: assets/json/env1.json
  String get env1 => 'assets/json/env1.json';

  /// File path: assets/json/error.json
  String get error => 'assets/json/error.json';

  /// File path: assets/json/wave2.json
  String get wave2 => 'assets/json/wave2.json';

  /// File path: assets/json/waveloop.json
  String get waveloop => 'assets/json/waveloop.json';

  /// List of all assets
  List<String> get values =>
      [animaTik, arrowUp, disconnect, empty, env1, error, wave2, waveloop];
}

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/png/logo.png');

  /// File path: assets/png/logoIcon.png
  AssetGenImage get logoIcon => const AssetGenImage('assets/png/logoIcon.png');

  /// File path: assets/png/title and logo.png
  AssetGenImage get titleAndLogo =>
      const AssetGenImage('assets/png/title and logo.png');

  /// File path: assets/png/title.png
  AssetGenImage get title => const AssetGenImage('assets/png/title.png');

  /// List of all assets
  List<AssetGenImage> get values => [logo, logoIcon, titleAndLogo, title];
}

class $AssetsWebpGen {
  const $AssetsWebpGen();

  /// File path: assets/webp/dani.webp
  AssetGenImage get dani => const AssetGenImage('assets/webp/dani.webp');

  /// List of all assets
  List<AssetGenImage> get values => [dani];
}

class Assets {
  Assets._();

  static const $AssetsJpgGen jpg = $AssetsJpgGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsWebpGen webp = $AssetsWebpGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
