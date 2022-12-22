import 'package:mockoapp/data/api_cervice/api_cervice.dart';
import 'package:mockoapp/data/models/resopnse/response_model.dart';

class MockoRepository {
  ApiService apiService;
  MockoRepository({required this.apiService});

  Future<MyResponse> getMockoData() => apiService.getMocko();
}