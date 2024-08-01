
import 'package:example_structure/consts/colors.dart';
import 'package:example_structure/pages/home/bindings/home_binding.dart';
import 'package:example_structure/pages/rental_club/bindings/rental_club_binding.dart';
import 'package:example_structure/pages/ticket/bindings/ticket_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../choose_play/bindings/choose_play_binding.dart';
import '../../../my_account/binding/my_account_binding.dart';

class MainViewController extends SuperController<bool> {
  RxInt navIndex = 2.obs;
  Rx<PersistentTabController> navController =
      PersistentTabController(initialIndex: 2).obs;
  @override
  void onInit() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarColor: Color(ColorCode.primary), // status bar color
    ));
    HomeBinding().dependencies();
    TicketBinding().dependencies();
    MyAccountBinding().dependencies();
    RentalClubBinding().dependencies();
    chooseplayBinding().dependencies();
    super.onInit();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}
