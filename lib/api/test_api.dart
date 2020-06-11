import 'package:dio/dio.dart';
import 'package:netiflutterapp/model/reponse_model.dart';

class TestAPI {
  Dio dio = Dio();

  Future<ResponseModel> getData() async {
    var response = await dio.get('https://rickandmortyapi.com/api/character/');
    print(response.toString());
    ResponseModel result = authDataFromJson(response.toString());
    return result;
  }
}
