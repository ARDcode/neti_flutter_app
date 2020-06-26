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
  int _currentIndex = 0;
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
      appBar: AppBar(
        title: Text('AppBar'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Center(child: Text('DrawerHeader')),
              decoration: BoxDecoration(color: Colors.redAccent),
            ),
            Text('FirstPage'),
            Text('SecondsPage')
          ],
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return Content();
              });
        },
        child: Text('GO'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              title: Text('1'),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('2'),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('2'),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('2'),
              backgroundColor: Colors.black)
        ],
      ),
      body: IndexedStack(
        children: [
          ListView.builder(
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
                leading: Hero(
                    child: Image.network(item.image), tag: item.id.toString()),
                title: Text(item.name, style: TextStyle(color: Colors.black)),
                subtitle: Text(item.type),
              );
            },
            itemCount: _data.results != null ? _data.results.length : 0,
          ),
          Container(
            child: Text('second Tab'),
          )
        ],
        index: _currentIndex,
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.4,
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Persons'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Persons'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Persons'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Persons'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
