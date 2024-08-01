import 'package:example_structure/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../consts/text_styles.dart';
import '../resources/assets_svg_generated.dart';
import 'custom_text.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
   CustomAppbar(
      {Key? key,
      this.title,
      required this.height,
      this.actions,
        this.onTap,
      this.backgroundColor,
      this.elevation = 1,
      this.implyLeading = false,
      this.leading,
      this.radius = 24})
      : super(key: key);

  final Color? backgroundColor;
  final double height;
  final double elevation;
  final bool implyLeading;
  final double radius;
  final List<Widget>? actions;
  final Widget? leading;
  final String? title;
   void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: const Color(ColorCode.primary),
      title: Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(onTap: onTap,
                child: SvgPicture.asset(
                  AppSVGAssets.back,
                  color: const Color(ColorCode.white),
                ),
              ),
           const Spacer(),
              CustomText(
                title ?? '',
                textStyle: TextStyles.text16.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(ColorCode.white),
                    height: 1.h),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
