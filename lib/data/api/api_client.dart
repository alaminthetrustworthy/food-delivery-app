import 'package:get/get.dart';

import '../../utils/app_constant.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeader;

  ApiClient({required this.appBaseUrl}){

    baseUrl=appBaseUrl;
    timeout=const Duration(seconds: 20);

    token=AppConstant.TOKEN;
    _mainHeader={
      'Content-type':'application/json;charset=UTF-8',
      'Authorization':'Bearer $token',
    };
  }
  Future<Response> getData(String uri,) async {
    try{
        Response response= await get(uri);
        return response;
    }catch(e){
      return Response(statusCode: 1,statusText: e.toString());
    }
  }
}