import 'package:dio/dio.dart';
import '../model/company_model.dart';
import '../model/my_response.dart';
import 'api_client.dart';

class ApiService extends ApiClient {

  Future<MyResponse> getAllCompaniesModels() async {

    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/companies");
      if (response.statusCode == 200) {
        myResponse.data = CompaniesModel.fromJson(response.data);
      }
    } catch (err) {
      myResponse.error = err.toString();
    }
    return myResponse;
  }
}