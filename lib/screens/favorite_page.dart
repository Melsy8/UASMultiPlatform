import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Destinasi Favorit'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.place),
            title: Text('Destinasi 1'),
            subtitle: Text('Deskripsi singkat tentang destinasi 1'),
          ),
          ListTile(
            leading: Icon(Icons.place),
            title: Text('Destinasi 2'),
            subtitle: Text('Deskripsi singkat tentang destinasi 2'),
          ),
          ListTile(
            leading: Icon(Icons.place),
            title: Text('Destinasi 3'),
            subtitle: Text('Deskripsi singkat tentang destinasi 3'),
          ),
        ],
      ),
    );
  }
}
