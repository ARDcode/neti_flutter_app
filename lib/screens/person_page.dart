import 'package:flutter/material.dart';
import 'package:netiflutterapp/model/response_model.dart';
import 'package:netiflutterapp/store/global_store.dart';
import 'package:netiflutterapp/store/my_store.dart';

class PersonPage extends StatefulWidget {
  final Result person;

  const PersonPage({Key key, this.person}) : super(key: key);
  @override
  PersonPageState createState() => new PersonPageState();
}

class PersonPageState extends State<PersonPage> {
  MyStore myStore = GlobalStore().myStore;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(myStore.data.results[0].name)),
      body: ListView(
        children: [
          Hero(
              child: Image.network(widget.person.image),
              tag: widget.person.id.toString()),
        ],
      ),
    );
  }
}
