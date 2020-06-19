import 'package:flutter/material.dart';
import 'package:netiflutterapp/model/response_model.dart';

class PersonPage extends StatefulWidget {
  final Result person;

  const PersonPage({Key key, this.person}) : super(key: key);
  @override
  PersonPageState createState() => new PersonPageState();
}

class PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.person.name)),
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
