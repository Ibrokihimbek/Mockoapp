import 'package:flutter/cupertino.dart';
import 'package:mockoapp/data/models/mocko/mocko_model.dart';
import 'package:mockoapp/data/models/resopnse/response_model.dart';
import 'package:mockoapp/data/repository/mocko_repository.dart';

class MockoViewModel extends ChangeNotifier {
  MockoRepository mockoRepository;
  MockoViewModel({required this.mockoRepository}) {
    fetchTransactions();
  }

  MockoModel? mockoModel;

  String errorForUI = "";

  fetchTransactions() async {
    MyResponse myResponse = await mockoRepository.getMockoData();
    if (myResponse.error.isEmpty) {
      mockoModel = myResponse.data as MockoModel;
    } else {
      errorForUI = myResponse.error;
    }
    notifyListeners();
  }
}
