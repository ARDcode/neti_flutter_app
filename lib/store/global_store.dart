import 'package:netiflutterapp/store/my_store.dart';

class GlobalStore {
  static final GlobalStore _singleton = new GlobalStore._internal();

  MyStore myStore = MyStore();

  factory GlobalStore() {
    return _singleton;
  }

  GlobalStore._internal();
}
