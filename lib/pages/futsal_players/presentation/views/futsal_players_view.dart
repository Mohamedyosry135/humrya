import 'package:example_structure/pages/futsal_players/presentation/views/widgets/players_grid_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../consts/text_styles.dart';
import '../../../../resources/assets_svg_generated.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/home_appbar.dart';
import '../controllers/futsal_players_controller.dart';

class FutsalPlayersView extends GetView<FutsalPlayersController> {


  const FutsalPlayersView({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: HomeAppBar(
        height: 120.h,
        child: Padding(
          padding: EdgeInsets.only(
              bottom: 30.0.h, left: 30.w, right: 30.w, top: 66.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(
                opacity: 0,
                child: SvgPicture.asset(AppSVGAssets.back),
              ),
              CustomText(
                'اللاعبين',
                textAlign: TextAlign.center,
                textStyle: TextStyles.text22.copyWith(fontSize: 20.sp),
              ),
              InkWell(
                  onTap: () {
                   Get.back();
                    // Get.find<MainViewController>().navController.value =
                    //     PersistentTabController(initialIndex: 2);
                    // Get.find<MainViewController>().navIndex.value = 2;
                  },
                  child: SvgPicture.asset(AppSVGAssets.back)),
            ],
          ),
        ),
      ),
      body:  Obx(() =>
      PlayersGrid(players: controller.teamplayer.value.data?.players ?? []))


    );
  }
}
