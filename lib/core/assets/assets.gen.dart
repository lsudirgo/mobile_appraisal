/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/attendance.svg
  String get attendance => 'assets/icons/attendance.svg';

  /// File path: assets/icons/back.svg
  String get back => 'assets/icons/back.svg';

  /// File path: assets/icons/calendar.svg
  String get calendar => 'assets/icons/calendar.svg';

  /// File path: assets/icons/check.svg
  String get check => 'assets/icons/check.svg';

  /// File path: assets/icons/checkmark.svg
  String get checkmark => 'assets/icons/checkmark.svg';

  /// File path: assets/icons/clock.svg
  String get clock => 'assets/icons/clock.svg';

  /// File path: assets/icons/connect.svg
  String get connect => 'assets/icons/connect.svg';

  /// File path: assets/icons/done.svg
  String get done => 'assets/icons/done.svg';

  /// File path: assets/icons/email.svg
  String get email => 'assets/icons/email.svg';

  /// File path: assets/icons/image.svg
  String get image => 'assets/icons/image.svg';

  /// File path: assets/icons/location.svg
  String get location => 'assets/icons/location.svg';

  /// File path: assets/icons/notification_rounded.svg
  String get notificationRounded => 'assets/icons/notification_rounded.svg';

  /// File path: assets/icons/password.svg
  String get password => 'assets/icons/password.svg';

  /// File path: assets/icons/refresh.svg
  String get refresh => 'assets/icons/refresh.svg';

  /// File path: assets/icons/reverse.svg
  String get reverse => 'assets/icons/reverse.svg';

  /// File path: assets/icons/support.svg
  String get support => 'assets/icons/support.svg';

  /// List of all assets
  List<String> get values => [
        attendance,
        back,
        calendar,
        check,
        checkmark,
        clock,
        connect,
        done,
        email,
        image,
        location,
        notificationRounded,
        password,
        refresh,
        reverse,
        support
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/LOGO_BSI_MENU.png
  AssetGenImage get logoBsiMenu =>
      const AssetGenImage('assets/images/LOGO_BSI_MENU.png');

  /// File path: assets/images/bgCard.png
  AssetGenImage get bgCard => const AssetGenImage('assets/images/bgCard.png');

  /// File path: assets/images/bgmobile.png
  AssetGenImage get bgmobile =>
      const AssetGenImage('assets/images/bgmobile.png');

  /// File path: assets/images/bloCK.png
  AssetGenImage get bloCK => const AssetGenImage('assets/images/bloCK.png');

  /// File path: assets/images/clock.png
  AssetGenImage get clock => const AssetGenImage('assets/images/clock.png');

  /// File path: assets/images/forgot_password.png
  AssetGenImage get forgotPassword =>
      const AssetGenImage('assets/images/forgot_password.png');

  /// File path: assets/images/icons_profile_girl.png
  AssetGenImage get iconsProfileGirl =>
      const AssetGenImage('assets/images/icons_profile_girl.png');

  /// File path: assets/images/icons_profile_man.png
  AssetGenImage get iconsProfileMan =>
      const AssetGenImage('assets/images/icons_profile_man.png');

  /// File path: assets/images/img.png
  AssetGenImage get img => const AssetGenImage('assets/images/img.png');

  /// File path: assets/images/log_out.png
  AssetGenImage get logOut => const AssetGenImage('assets/images/log_out.png');

  /// File path: assets/images/login_1.png
  AssetGenImage get login1 => const AssetGenImage('assets/images/login_1.png');

  /// File path: assets/images/no_image.jpg
  AssetGenImage get noImage =>
      const AssetGenImage('assets/images/no_image.jpg');

  /// File path: assets/images/not_found.png
  AssetGenImage get notFound =>
      const AssetGenImage('assets/images/not_found.png');

  /// File path: assets/images/register.png
  AssetGenImage get register =>
      const AssetGenImage('assets/images/register.png');

  /// File path: assets/images/session_expired.png
  AssetGenImage get sessionExpired =>
      const AssetGenImage('assets/images/session_expired.png');

  /// File path: assets/images/start.png
  AssetGenImage get start => const AssetGenImage('assets/images/start.png');

  /// File path: assets/images/warning.jpg
  AssetGenImage get warning => const AssetGenImage('assets/images/warning.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        logoBsiMenu,
        bgCard,
        bgmobile,
        bloCK,
        clock,
        forgotPassword,
        iconsProfileGirl,
        iconsProfileMan,
        img,
        logOut,
        login1,
        noImage,
        notFound,
        register,
        sessionExpired,
        start,
        warning
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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
