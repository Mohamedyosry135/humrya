import 'package:example_structure/consts/colors.dart';
import 'package:example_structure/consts/text_styles.dart';
import 'package:example_structure/pages/home/presentation/views/home_view.dart';
import 'package:example_structure/pages/main/presentation/controller/main_controller.dart';
import 'package:example_structure/pages/my_account/presentation/views/my_account_Screen.dart';
import 'package:example_structure/pages/rental_club/presentation/views/rental_club_View.dart';
import 'package:example_structure/pages/sports_game/presentation/views/sportsgame_Screen.dart';
import 'package:example_structure/pages/ticket/presentation/views/ticket_view.dart';
import 'package:example_structure/resources/assets_generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../sports_game/presentation/controllers/sportsgame_controller.dart';

class MainScreenView extends GetView<MainViewController> {
  const MainScreenView({super.key});

  List<Widget> _buildScreens() {
    return [
      const MyAccountScreen(),

      const TicketView(),

      HomeView(),
      RentalClubView(
        isBack: false,
      ),
      const SportsgameScreen()

      // ChoosePlayView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Image(
            image: AppAssets.navIcon3,
            color: controller.navIndex.value == 0
                ? const Color(ColorCode.primary)
                : const Color(ColorCode.navBarInactive),
          ),
          activeColorPrimary: const Color(ColorCode.primary),
          iconSize: 20,
          contentPadding: 0.0,
          textStyle: TextStyles.bottomNavBarItemStyle,
          activeColorSecondary: const Color(ColorCode.primary),
          inactiveColorPrimary: const Color(ColorCode.navBarInactive),
          title: 'حسابي'),
      PersistentBottomNavBarItem(
          icon: Image(
            image: AppAssets.navIcon2,
            color: controller.navIndex.value == 1
                ? const Color(ColorCode.primary)
                : const Color(ColorCode.navBarInactive),
          ),
          activeColorPrimary: const Color(ColorCode.primary),
          contentPadding: 0.0,
          iconSize: 20,
          textStyle: TextStyles.bottomNavBarItemStyle,
          inactiveColorPrimary: const Color(ColorCode.navBarInactive),
          title: 'التذاكر'),
      PersistentBottomNavBarItem(
        icon: const Image(image: AppAssets.navLogo),
        activeColorPrimary: const Color(ColorCode.white),
        contentPadding: 0.0,
        inactiveColorPrimary: const Color(ColorCode.navBarInactive),
      ),
      PersistentBottomNavBarItem(
          icon: Image(
            image: AppAssets.navIcon1,
            color: controller.navIndex.value == 3
                ? const Color(ColorCode.primary)
                : const Color(ColorCode.navBarInactive),
          ),
          activeColorPrimary: const Color(ColorCode.primary),
          contentPadding: 0.0,
          iconSize: 20,
          textStyle: TextStyles.bottomNavBarItemStyle,
          inactiveColorPrimary: const Color(ColorCode.navBarInactive),
          title: 'حجز المرافق'),
      PersistentBottomNavBarItem(
          icon: Image(
            image: AppAssets.navIcon4,
            color: controller.navIndex.value == 4
                ? const Color(ColorCode.primary)
                : const Color(ColorCode.navBarInactive),
          ),
          activeColorPrimary: const Color(ColorCode.primary),
          iconSize: 20,
          contentPadding: 0.0,
          textStyle: TextStyles.bottomNavBarItemStyle,
          inactiveColorPrimary: const Color(ColorCode.navBarInactive),
          title: 'التسجيل'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          Get.defaultDialog(
              title: '',
              content: const Center(
                child: Text(
                  'هل تريد الخروج من التطبيق ؟',
                  style: TextStyle(
                      color: Color(ColorCode.primary),
                      fontWeight: FontWeight.w700),
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 7),
                        decoration: BoxDecoration(
                            color:
                                const Color(ColorCode.primary).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'تأكيد',
                          style: TextStyle(
                              color: Color(ColorCode.primary),
                              fontWeight: FontWeight.w700),
                        ))),
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 7),
                        decoration: BoxDecoration(
                            color: const Color(ColorCode.grey).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'الغاء',
                          style: TextStyle(
                              color: Color(ColorCode.grey),
                              fontWeight: FontWeight.w700),
                        ))),
              ]);
          return false;
        },
        child: Scaffold(
          backgroundColor: const Color(ColorCode.primary),
          body: PersistentTabView(
            context,
            controller: controller.navController.value,
            screens: _buildScreens(),
            items: _navBarsItems(),
            popActionScreens: PopActionScreensType.once,
            onItemSelected: (i) {
              controller.navIndex.value = i;
              if (i == 4) {
                Get.find<SportsgameController>().isBack = false;
                Get.find<SportsgameController>().toRegister = true;
              }
            },
            navBarHeight: 70.h,
            padding:
                NavBarPadding.only(bottom: 6.h, left: 0, right: 0, top: 6.h),
            margin: EdgeInsets.zero,
            navBarStyle: NavBarStyle.style15,
            decoration: NavBarDecoration(
                borderRadius: BorderRadius.circular(0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
