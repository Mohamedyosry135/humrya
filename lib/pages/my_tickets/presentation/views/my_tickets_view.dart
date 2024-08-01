import 'package:example_structure/pages/my_tickets/presentation/controllers/my_ticket_controller.dart';
import 'package:example_structure/pages/ticket_details/bindings/ticket_details_binding.dart';
import 'package:example_structure/pages/ticket_details/presentaion/view/ticket_details_view.dart';
import 'package:example_structure/widgets/home_appbar.dart';
import 'package:example_structure/widgets/next_match_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custom_text.dart';

class MyTicketsView extends GetView<MyTicketsController> {
  const MyTicketsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        height: 120.h,
        child: Padding(
          padding: EdgeInsets.only(
              bottom: 33.0.h, left: 30.w, right: 30.w, top: 66.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(
                opacity: 0,
                child: SvgPicture.asset(AppSVGAssets.back),
              ),
              CustomText(
                'تذاكري',
                textAlign: TextAlign.center,
                textStyle: TextStyles.text22.copyWith(fontSize: 20.sp),
              ),
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(AppSVGAssets.back)),
            ],
          ),
        ),
      ),
      body: controller.obx((state) => ListView.separated(
        physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
            itemBuilder: (ctx, i) => InkWell(
              onTap: () {
                Get.to(() => const TicketDetailsView(),
                    binding: TicketDetailsBinding(),
                    arguments: [controller.tickets.value.data?[i]]);
              },
              child: NextMatchItem(
                  guestLogo:
                      controller.tickets.value.data?[i].matche?.guest?.logo ??
                          '',
                  hostLogo:
                      controller.tickets.value.data?[i].matche?.host?.logo ??
                          '',
                  title: controller.tickets.value.data?[i].matche?.gameTitle ??
                      '',
                  time: controller.tickets.value.data?[i].matche?.time ?? '',
                  date: controller.tickets.value.data?[i].matche?.date ?? '',
                  guestName:
                      controller.tickets.value.data?[i].matche?.guest?.title ??
                          '',
                  hostName:
                      controller.tickets.value.data?[i].matche?.host?.title ??
                          '',
                  stadium:
                      controller.tickets.value.data?[i].matche?.stadioum ?? ''),
            ),
            separatorBuilder: (ctx, i) => SizedBox(
              height: 16.h,
            ),
            itemCount: controller.tickets.value.data?.length ?? 0,
          )),
    );
  }
}
