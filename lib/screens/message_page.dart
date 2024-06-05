import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Pesan 1'),
            subtitle: Text('Isi pesan 1'),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Pesan 2'),
            subtitle: Text('Isi pesan 2'),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Pesan 3'),
            subtitle: Text('Isi pesan 3'),
          ),
        ],
      ),
    );
  }
}
