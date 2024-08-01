import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../consts/colors.dart';
import '../../../../../consts/text_styles.dart';
import '../../../../../resources/assets_svg_generated.dart';
import '../../../../../widgets/custom_text.dart';
import '../pages/periodic_table/presentation/views/periodic_table_view.dart';


class TextandButtonWidget extends StatelessWidget {
  String title;
  String btext;
  Function ?onTab;
  Widget? backWidget;
  bool showMore;
  TextandButtonWidget(this.title,this.btext,{super.key, this.onTab,this.backWidget,required this.showMore});

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomText(
          title,
          textStyle: TextStyles.text16.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: const Color(ColorCode.primary)),
        ),
        const Spacer(),
       if(showMore == true) InkWell(
          onTap: () {
            if(onTab != null){
              onTab!();
            }else{
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: PeriodicTableView(
                  backWidget: backWidget!,
                ),
                withNavBar: true, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.fade,
              );
            }

          },
          child: CustomText(
            btext,
            textStyle: TextStyles.text16.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: const Color(ColorCode.primary)),
          ),
        ),
        if(showMore == true)  SvgPicture.asset(AppSVGAssets.moreArrow)
      ],
    );
  }
}
