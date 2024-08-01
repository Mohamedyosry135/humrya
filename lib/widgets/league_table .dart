import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../consts/colors.dart';
import '../../../../../consts/text_styles.dart';
import '../../../../../resources/assets_generated.dart';
import '../../../../../widgets/custom_text.dart';


class LeagueTableWidget extends StatelessWidget {
  const LeagueTableWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 129.h,
      width: 315.w,
      padding: EdgeInsets.symmetric(vertical: 2.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: const Color(ColorCode.white),
          border: Border.all(
              color: const Color(ColorCode.borderColor),
              width: 1.0.w,
              strokeAlign: StrokeAlign.inside)),
      child: Table(
        // columnWidths: const {
        //   0: FlexColumnWidth(1),
        //   1: FlexColumnWidth(4),
        //   2: FlexColumnWidth(1),
        //   3: FlexColumnWidth(1),
        //   4: FlexColumnWidth(1),
        //   5: FlexColumnWidth(1),
        //   6: FlexColumnWidth(1),
        //   7: FlexColumnWidth(1),
        //   8: FlexColumnWidth(1),
        // },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        defaultColumnWidth: const IntrinsicColumnWidth(),
        border: const TableBorder(
          horizontalInside:
          BorderSide(color: Color(ColorCode.borderColor)),
        ),
        children: [
          TableRow(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                'المركز',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                'النادي',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                'لعب',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                'فاز',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                'خسارة',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                'تعادل',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                'الأهداف',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                'الفرق',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                'النقاط',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ]),
          TableRow(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '1',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Image(image: AppAssets.clubFlag4),
                  SizedBox(
                    width: 4.w,
                  ),
                  CustomText(
                    'الجزيرة الحمراء',
                    textStyle: TextStyles.text11.copyWith(
                        fontSize: 9.sp,
                        textBaseline: TextBaseline.alphabetic,
                        fontWeight: FontWeight.w400,
                        color: const Color(ColorCode.black)),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '7',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '4',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '7',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '4',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '4',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '4',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '12',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ]),
          TableRow(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '2',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Image(image: AppAssets.clubFlag3),
                  SizedBox(
                    width: 4.w,
                  ),
                  CustomText(
                    'فرسان هيسبانيا',
                    textStyle: TextStyles.text11.copyWith(
                        fontSize: 9.sp,
                        textBaseline: TextBaseline.alphabetic,
                        fontWeight: FontWeight.w400,
                        color: const Color(ColorCode.black)),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '7',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '4',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '7',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '4',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '4',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '4',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '12',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ]),
          TableRow(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '3',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Image(image: AppAssets.clubFlag2),
                  SizedBox(
                    width: 4.w,
                  ),
                  CustomText(
                    'الذيد',
                    textStyle: TextStyles.text11.copyWith(
                        fontSize: 9.sp,
                        textBaseline: TextBaseline.alphabetic,
                        fontWeight: FontWeight.w400,
                        color: const Color(ColorCode.black)),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '7',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '4',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '7',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '4',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '4',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '4',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '12',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ]),
          TableRow(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '4',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Image(image: AppAssets.clubFlag1),
                  SizedBox(
                    width: 4.w,
                  ),
                  CustomText(
                    'العربي',
                    textStyle: TextStyles.text11.copyWith(
                        fontSize: 9.sp,
                        textBaseline: TextBaseline.alphabetic,
                        fontWeight: FontWeight.w400,
                        color: const Color(ColorCode.black)),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '7',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '4',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '7',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '4',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '4',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '4',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: CustomText(
                '12',
                textStyle: TextStyles.text11.copyWith(
                    color: const Color(ColorCode.primary),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
