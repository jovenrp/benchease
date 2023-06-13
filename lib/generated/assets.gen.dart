/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  String get blockBerthold => 'assets/fonts/Block-Berthold.ttf';
  String get poppinsBlack => 'assets/fonts/Poppins-Black.ttf';
  String get poppinsBlackItalic => 'assets/fonts/Poppins-BlackItalic.ttf';
  String get poppinsBold => 'assets/fonts/Poppins-Bold.ttf';
  String get poppinsBoldItalic => 'assets/fonts/Poppins-BoldItalic.ttf';
  String get poppinsExtraBold => 'assets/fonts/Poppins-ExtraBold.ttf';
  String get poppinsExtraBoldItalic =>
      'assets/fonts/Poppins-ExtraBoldItalic.ttf';
  String get poppinsExtraLight => 'assets/fonts/Poppins-ExtraLight.ttf';
  String get poppinsExtraLightItalic =>
      'assets/fonts/Poppins-ExtraLightItalic.ttf';
  String get poppinsItalic => 'assets/fonts/Poppins-Italic.ttf';
  String get poppinsLight => 'assets/fonts/Poppins-Light.ttf';
  String get poppinsLightItalic => 'assets/fonts/Poppins-LightItalic.ttf';
  String get poppinsMedium => 'assets/fonts/Poppins-Medium.ttf';
  String get poppinsMediumItalic => 'assets/fonts/Poppins-MediumItalic.ttf';
  String get poppinsRegular => 'assets/fonts/Poppins-Regular.ttf';
  String get poppinsSemiBold => 'assets/fonts/Poppins-SemiBold.ttf';
  String get poppinsSemiBoldItalic => 'assets/fonts/Poppins-SemiBoldItalic.ttf';
  String get poppinsThin => 'assets/fonts/Poppins-Thin.ttf';
  String get poppinsThinItalic => 'assets/fonts/Poppins-ThinItalic.ttf';
  String get productSansBoldItalic =>
      'assets/fonts/Product-Sans-Bold-Italic.ttf';
  String get productSansBold => 'assets/fonts/Product-Sans-Bold.ttf';
  String get productSansItalic => 'assets/fonts/Product-Sans-Italic.ttf';
  String get productSansRegular => 'assets/fonts/Product-Sans-Regular.ttf';
  String get proximaNovaBoldItalic =>
      'assets/fonts/Proxima-Nova-Bold-Italic.otf';
  String get proximaNovaBold => 'assets/fonts/Proxima-Nova-Bold.otf';
  String get proximaNovaItalic => 'assets/fonts/Proxima-Nova-Italic.otf';
  String get proximaNovaLightItalic =>
      'assets/fonts/Proxima-Nova-Light-Italic.otf';
  String get proximaNovaLight => 'assets/fonts/Proxima-Nova-Light.otf';
  String get proximaNovaRegular => 'assets/fonts/Proxima-Nova-Regular.otf';
  String get dawnIcons => 'assets/fonts/dawn-icons.ttf';
}

class $AssetsI18nGen {
  const $AssetsI18nGen();

  String get enUS => 'assets/i18n/en-US.json';
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  AssetGenImage get applogo => const AssetGenImage('assets/images/applogo.png');
  AssetGenImage get applogowhite =>
      const AssetGenImage('assets/images/applogowhite.jpeg');
  AssetGenImage get appnamelogo =>
      const AssetGenImage('assets/images/appnamelogo.png');
  SvgGenImage get cogLoader =>
      const SvgGenImage('assets/images/cog_loader.svg');
  SvgGenImage get contact => const SvgGenImage('assets/images/contact.svg');
  SvgGenImage get dayshift => const SvgGenImage('assets/images/dayshift.svg');
  SvgGenImage get email => const SvgGenImage('assets/images/email.svg');
  SvgGenImage get filterIcon =>
      const SvgGenImage('assets/images/filter_icon.svg');
  SvgGenImage get gear => const SvgGenImage('assets/images/gear.svg');
  SvgGenImage get geartop => const SvgGenImage('assets/images/geartop.svg');
  AssetGenImage get getstarted =>
      const AssetGenImage('assets/images/getstarted.png');
  SvgGenImage get location => const SvgGenImage('assets/images/location.svg');
  AssetGenImage get logonameTransparent =>
      const AssetGenImage('assets/images/logoname_transparent.png');
  AssetGenImage get logotransparent =>
      const AssetGenImage('assets/images/logotransparent.png');
  AssetGenImage get people => const AssetGenImage('assets/images/people.png');
  SvgGenImage get person => const SvgGenImage('assets/images/person.svg');
  AssetGenImage get shakehand =>
      const AssetGenImage('assets/images/shakehand.png');
  SvgGenImage get timeshift => const SvgGenImage('assets/images/timeshift.svg');
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsI18nGen i18n = $AssetsI18nGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
    );
  }

  String get path => _assetName;
}
