import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Pesan 1'),
            subtitle: Text('Notifikasi dari aplikasi'),
            trailing: Text('2 jam yang lalu'),
          ),
          ListTile(
            title: Text('Pesan 2'),
            subtitle: Text('Notifikasi penting'),
            trailing: Text('5 jam yang lalu'),
          ),
          ListTile(
            title: Text('Pesan 3'),
            subtitle: Text('Notifikasi terbaru'),
            trailing: Text('10 jam yang lalu'),
          ),
        ],
      ),
    );
  }
}
