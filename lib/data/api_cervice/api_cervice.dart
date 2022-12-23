import 'package:dio/dio.dart';
import 'package:mockoapp/data/api_cervice/api_client.dart';
import 'package:mockoapp/data/models/mocko/mocko_model.dart';
import 'package:mockoapp/data/models/resopnse/response_model.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getMocko() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/dynamic");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        print(response.data);
        myResponse.data = MockoModel.fromJson(response.data);
      }
    } catch (err) {
      myResponse.error = err.toString();
    }
    return myResponse;
  }
}
