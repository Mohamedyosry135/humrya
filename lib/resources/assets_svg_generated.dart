import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; 
class AppSVGAssets {
static const moreArrow = "assets/svg_icons/more_arrow.svg";
static const notification = "assets/svg_icons/notification.svg";
static const clubFlag4 = "assets/svg_icons/club_flag4.svg";
static const successIcon = "assets/svg_icons/success_icon.svg";
static const clubFlag2 = "assets/svg_icons/club_flag2.svg";
static const errorIcon = "assets/svg_icons/error_icon.svg";
static const clubFlag3 = "assets/svg_icons/club_flag3.svg";
static const clubFlag1 = "assets/svg_icons/club_flag1.svg";
static const like = "assets/svg_icons/like.svg";
static const attach = "assets/svg_icons/attach.svg";
static const visibile = "assets/svg_icons/visibile.svg";
static const menu = "assets/svg_icons/menu.svg";
static const navLogo = "assets/svg_icons/nav_logo.svg";
static const flag = "assets/svg_icons/flag.svg";
static const splashLogo = "assets/svg_icons/splash_logo.svg";
static const back = "assets/svg_icons/back.svg";
static const share = "assets/svg_icons/share.svg";
static const google = "assets/svg_icons/google.svg";

     static SvgPicture getWidget(String assetName,{ BoxFit fit = BoxFit.none, Color? color,
      double? width, double? height}) {
    if (width != null && height != null) {
      return SvgPicture.asset(
        assetName,
        fit: fit,
        color: color,
        width: width,
        height: height,
      );
    }
    return SvgPicture.asset(
      assetName,
      fit: fit,
      color: color
    );
  }
    }