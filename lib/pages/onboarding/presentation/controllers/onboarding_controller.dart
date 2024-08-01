import 'package:dio/dio.dart';
import 'package:example_structure/base/api_end_points.dart';
import 'package:dio/dio.dart' as dio;
import 'package:example_structure/consts/storage.dart';
import 'package:example_structure/pages/main/bindings/main_view_binding.dart';
import 'package:example_structure/pages/main/presentation/views/main_view.dart';
import 'package:example_structure/services/dio_helper.dart';
import 'package:example_structure/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:firebase_database/firebase_database.dart';

class OnBoardingController extends SuperController<dynamic> {
  GetStorage box = GetStorage();

  Future<void> signInWithGoogle(BuildContext context) async {
    try{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =  await FirebaseAuth.instance.signInWithCredential(credential);
      print("userCredential ${userCredential.credential?.accessToken}");

      signup(context,"google",userCredential.credential?.accessToken.toString() ?? "");
    }catch (e){
      print("Errorr ${e.toString()}");
    }
  }
  late DatabaseReference dbRef;

  readDatabase()async {
    dbRef = FirebaseDatabase.instance.ref().child("showGoogle");
    try{
      dbRef.once().then((snapshot) {
        print('Data : ${snapshot.snapshot.value}');
      });
    }catch(e){
      print("DataSnapshot");
    }
  }

  signup(BuildContext context,String loginType,String token) async{
    try {
      change(true, status: RxStatus.loading());
      dio.Response response = await DioHelper.postData(url: EndPoints.thirdPartyLogin, data: {
        "token" : token,
        "type" : loginType
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        box.write(StorageKeys.token, response.data['access_token'].toString());
        change(false,status: RxStatus.success());
        Get.offAll(const MainScreenView(),binding: MainViewBinding());
        ToastWidget().showToast(
          Get.context!,
          message: 'تم تسجيل الدخول بنجاح',
          type: ToastTypes.success,
        );
      } else {
        change(false,status: RxStatus.success());


        ToastWidget().showToast(
          context,
          message: response.data['message'].toString(),
          type: ToastTypes.error,
        );
      }
    } catch (e) {
      change(false,status: RxStatus.success());

      print(e.toString());
      if(e is DioError){
        ToastWidget().showToast(
          context,
          message: e.response?.data['message'],
          type: ToastTypes.error,
        );
      }
    }
  }


  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
    readDatabase();
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
