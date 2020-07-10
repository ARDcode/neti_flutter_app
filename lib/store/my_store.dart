import 'package:mobx/mobx.dart';
import 'package:netiflutterapp/api/test_api.dart';
import 'package:netiflutterapp/model/response_model.dart';

part 'my_store.g.dart';

class MyStore = MyStoreBase with _$MyStore;

abstract class MyStoreBase with Store {
  TestAPI _testAPI = TestAPI();
  @observable
  ResponseModel data = ResponseModel();
  @observable
  int count = 0;

  @action
  Future<void> getData() async {
    ResponseModel response = await _testAPI.getData();
    print('INFO' + response.info.pages.toString());
    data = response;
  }

  @computed
  get filteredData {
    List<Result> results =
        data?.results?.where((person) => person.name.startsWith("R")) ?? List();
    print(results.length);
    return results;
  }

  @action
  void test() {
    print('test');
    this.count++;
    ObservableList<Result> newList = ObservableList.of(this.data.results);
    newList[0].name = 'Fedor';
    this.data.results = newList;
    this.data = ResponseModel(info: null, results: this.data.results);
  }
}
