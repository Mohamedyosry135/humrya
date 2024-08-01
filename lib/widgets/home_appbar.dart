import 'package:example_structure/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
    required this.height,required this.child
  }) : super(key: key);

  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(height: height,
      decoration: BoxDecoration(
          color: const Color(ColorCode.primary),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r))),
      child: child,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
