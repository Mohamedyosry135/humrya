import 'package:example_structure/base/base_provider.dart';




class BaseAuthProvider extends BaseProvider {
  @override
  void onInit() {
    super.onInit() ;
    httpClient.baseUrl = "";
  }
}
