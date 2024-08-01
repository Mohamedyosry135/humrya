import 'package:example_structure/consts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../consts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../resources/assets_generated.dart';

class SwimmingNewsPlayWidget extends StatelessWidget {
  const SwimmingNewsPlayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 315.w,
        height: 365,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 11.w),
        decoration: BoxDecoration(
          color: const Color(ColorCode.white).withOpacity(0.55),
          borderRadius: BorderRadius.circular(10.r),
          // boxShadow: [
          //   BoxShadow(
          //     color: Color(0xff000000).withOpacity(0.08),
          //     spreadRadius: 0,
          //     blurRadius: 20,
          //     offset: Offset(0, 0), // changes position of shadow
          //   ),
          // ]
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ClipRRect(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                borderRadius: BorderRadius.circular(10.r),
                child: Image(
                  image: AppAssets.newsImage,
                  height: 165.h,
                  width: 285.w,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 16.w,
            ),
            Expanded(
                child: RichText(
              maxLines: 8,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text:
                    'حصل نادي الحمرية من لجنة التراخيص الابتدائية ية من لجنة التراخيص الابتدائية بية من لجنة التراخيص الابتدائية بية من لجنة التراخيص الابتدائية بية من لجنة التراخيص الابتدائية بية من لجنة التراخيص الابتدائية بية من لجنة التراخيص الابتدائية بية من لجنة التراخيص الابتدائية بية من لجنة التراخيص الابتدائية بية من لجنة التراخيص الابتدائية بية من لجنة التراخيص الابتدائية بية من لجنة التراخيص الابتدائيالتراخينة الترaaaaaaخيص لدوري الدرجة الأولى للموسم الرياضي  2023/2022',
                style: TextStyles.text11.copyWith(
                    color: const Color(0xff646464),
                    fontSize: 9.sp,
                    overflow: TextOverflow.ellipsis,
                    height: 1.8.h,
                    fontWeight: FontWeight.w700),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
