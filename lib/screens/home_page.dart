import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:netiflutterapp/api/test_api.dart';
import 'package:netiflutterapp/model/response_model.dart';
import 'package:netiflutterapp/screens/person_page.dart';
import 'package:netiflutterapp/store/global_store.dart';
import 'package:netiflutterapp/store/my_store.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  MyStore myStore = GlobalStore().myStore;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    myStore.getData();
  }

  @override
  Widget build(BuildContext context) {
    print('render');
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
        onPressed: myStore.test,
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
      body: Observer(builder: (context) {
        print('render');
        return IndexedStack(
          children: [
            myStore.data.results == null
                ? Center(child: CupertinoActivityIndicator())
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return Observer(builder: (context) {
                        Result item = myStore.data.results[index];
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
                              child: Image.network(item.image),
                              tag: item.id.toString()),
                          title: Text(
                              GlobalStore().myStore.data.results[index].name,
                              style: TextStyle(color: Colors.black)),
                          subtitle: Text(item.type),
                        );
                      });
                    },
                    itemCount: myStore.data.results != null
                        ? myStore.data.results.length
                        : 0,
                  ),
            Container(
              child: Text('second Tab'),
            )
          ],
          index: _currentIndex,
        );
      }),
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
