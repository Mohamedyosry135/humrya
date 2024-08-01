import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../resources/assets_svg_generated.dart';

class ToastWidget {
  void showToast(BuildContext context,
      {required String message, required ToastTypes type}) {
    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 15,
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 35,
      ),
      duration: const Duration(milliseconds: 2000),
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: type == ToastTypes.error
          ? Colors.red
          : type == ToastTypes.success
              ? Colors.green
              : type == ToastTypes.info
                  ? Colors.blueAccent.withOpacity(0.8)
                  : Colors.red,
      isDismissible: true,
      titleText: const Text(
        '',
        style: TextStyle(color: Colors.white, fontSize: 0),
      ),
      // boxShadows: [
      //   BoxShadow(
      //     color: Colors.grey.withOpacity(0.5),
      //     spreadRadius: 5,
      //     blurRadius: 7,
      //     offset: const Offset(0, 3), // changes position of shadow
      //   ),
      // ],
      padding: const EdgeInsets.only(
        bottom: 15,
        top: 10,
        left: 25,
        right: 25,
      ),
      messageText: Row(
        children: [
          SvgPicture.asset(
            type == ToastTypes.success
                ? AppSVGAssets.successIcon
                : AppSVGAssets.errorIcon,
            color: Colors.white,
            width: 26,
            height: 26,
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: Get.width - 115,
            child: Text(
              message,
              style: const TextStyle(
                height: 1.5,
                color: Colors.white,
                fontSize: 14,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

enum ToastTypes {
  success,
  error,
  info,
  warning,
}
