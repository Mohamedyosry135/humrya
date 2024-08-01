import 'package:get/get.dart';

import '../presentation/controllers/Marketing_and_investment_controller.dart';


class MarketingandInvestmentBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(MarketingandInvestmentController());
  }

}