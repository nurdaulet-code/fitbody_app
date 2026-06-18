// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Arrow.svg
  String get arrow => 'assets/icons/Arrow.svg';

  /// File path: assets/icons/Component.svg
  String get component => 'assets/icons/Component.svg';

  /// File path: assets/icons/Facebook.svg
  String get facebook => 'assets/icons/Facebook.svg';

  /// File path: assets/icons/Favorite.svg
  String get favorite => 'assets/icons/Favorite.svg';

  /// File path: assets/icons/Fingerprint.svg
  String get fingerprint => 'assets/icons/Fingerprint.svg';

  /// File path: assets/icons/Google.svg
  String get google => 'assets/icons/Google.svg';

  /// File path: assets/icons/Help.svg
  String get help => 'assets/icons/Help.svg';

  /// File path: assets/icons/Home.svg
  String get home => 'assets/icons/Home.svg';

  /// File path: assets/icons/Logout.svg
  String get logout => 'assets/icons/Logout.svg';

  /// File path: assets/icons/Profile.svg
  String get profile => 'assets/icons/Profile.svg';

  /// File path: assets/icons/Settings.svg
  String get settings => 'assets/icons/Settings.svg';

  /// File path: assets/icons/Stars.svg
  String get stars => 'assets/icons/Stars.svg';

  /// File path: assets/icons/Support.svg
  String get support => 'assets/icons/Support.svg';

  /// File path: assets/icons/Vector1.svg
  String get vector1 => 'assets/icons/Vector1.svg';

  /// File path: assets/icons/Vector2.svg
  String get vector2 => 'assets/icons/Vector2.svg';

  /// File path: assets/icons/Vector3.svg
  String get vector3 => 'assets/icons/Vector3.svg';

  /// File path: assets/icons/buttom.svg
  String get buttom => 'assets/icons/buttom.svg';

  /// List of all assets
  List<String> get values => [
    arrow,
    component,
    facebook,
    favorite,
    fingerprint,
    google,
    help,
    home,
    logout,
    profile,
    settings,
    stars,
    support,
    vector1,
    vector2,
    vector3,
    buttom,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Bot.png
  AssetGenImage get bot => const AssetGenImage('assets/images/Bot.png');

  /// File path: assets/images/FITBODY.png
  AssetGenImage get fitbody => const AssetGenImage('assets/images/FITBODY.png');

  /// File path: assets/images/Group.png
  AssetGenImage get group => const AssetGenImage('assets/images/Group.png');

  /// File path: assets/images/gym.png
  AssetGenImage get gym => const AssetGenImage('assets/images/gym.png');

  /// List of all assets
  List<AssetGenImage> get values => [bot, fitbody, group, gym];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
