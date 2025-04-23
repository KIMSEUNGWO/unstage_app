import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {

  final SvgPicture svgPicture;

  const SvgIcon.privateConstructor(this.svgPicture, {super.key});

  static SvgIcon asset({required SIcon sIcon, SvgIconStyle? style,}) {
    return _SvgIconBuilder(sIcon: sIcon).build(style);
  }

  @override
  Widget build(BuildContext context) {
    return svgPicture;
  }

}

class SvgIconStyle {

  double? width;
  double? height;
  Color? color;
  BoxFit? fit;
  BlendMode? blendMode;

  SvgIconStyle({this.width, this.height, this.color, this.fit, this.blendMode});

}

class SIcon {

  final String picture;
  final double width;
  final double height;

  const SIcon({required this.picture, required this.width, required this.height});

  // calendar arrow
  static const SIcon arrowRight = SIcon(picture: 'assets/icons/arrow_right.svg', width: 15, height: 15);
  static const SIcon arrowLeft = SIcon(picture: 'assets/icons/arrow_left.svg', width: 15, height: 15);

  // Menu Bar
  static const SIcon home = SIcon(picture: 'assets/icons/home.svg', width: 24, height: 24);
  static const SIcon calendar = SIcon(picture: 'assets/icons/calendar.svg', width: 24, height: 24);
  static const SIcon star = SIcon(picture: 'assets/icons/star.svg', width: 24, height: 24);
  static const SIcon user = SIcon(picture: 'assets/icons/user.svg', width: 24, height: 24);

  // Social
  static const SIcon twitter = SIcon(picture: 'assets/icons/twitter.svg', width: 13.3, height: 13.3);


  static const SIcon cancel = SIcon(picture: 'assets/icons/cancel_circle.svg', width: 20, height: 20);
  static const SIcon filter = SIcon(picture: 'assets/icons/filter.svg', width: 10, height: 10);
  static const SIcon idol = SIcon(picture: 'assets/icons/idol.svg', width: 16, height: 16);
  static const SIcon location = SIcon(picture: 'assets/icons/location.svg', width: 18, height: 18);
  static const SIcon map = SIcon(picture: 'assets/icons/map.svg', width: 10, height: 10);
  static const SIcon search = SIcon(picture: 'assets/icons/search.svg', width: 20, height: 20);
  
}

class _SvgIconBuilder {

  final SIcon sIcon;

  _SvgIconBuilder({required this.sIcon});

  SvgIcon build(SvgIconStyle? style) {
    return SvgIcon.privateConstructor(SvgPicture.asset(sIcon.picture,
        width: style?.width ?? sIcon.width,
        height: style?.height ?? sIcon.height,
        fit: style?.fit ?? BoxFit.contain,
        colorFilter: style == null || style.color == null ? null : ColorFilter.mode(style.color!, style.blendMode ?? BlendMode.srcIn),
    ));
  }

}