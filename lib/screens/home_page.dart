import 'package:flutter/material.dart';
import 'package:netiflutterapp/api/test_api.dart';
import 'package:netiflutterapp/model/reponse_model.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  TestAPI _testAPI = TestAPI();
  ResponseModel _data = ResponseModel();
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    ResponseModel response = await _testAPI.getData();
    setState(() {
      _data = response;
    });
    print(_data.results.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemBuilder: (context, index) {
        var item = _data.results[index];
        return ListTile(
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.type),
        );
      },
      itemCount: _data.results != null ? _data.results.length : 0,
    ));
  }
}
