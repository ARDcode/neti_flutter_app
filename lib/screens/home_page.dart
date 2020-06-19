import 'package:flutter/material.dart';
import 'package:netiflutterapp/api/test_api.dart';
import 'package:netiflutterapp/model/response_model.dart';
import 'package:netiflutterapp/screens/person_page.dart';

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
          Result item = _data.results[index];
          return ListTile(
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (context) => PersonPage(
                    person: item,
                  ),
                ),
              );
            },
            leading:
                Hero(child: Image.network(item.image), tag: item.id.toString()),
            title: Text(item.name, style: TextStyle(color: Colors.black)),
            subtitle: Text(item.type),
          );
        },
        itemCount: _data.results != null ? _data.results.length : 0,
      ),
    );
  }
}
