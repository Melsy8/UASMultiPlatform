import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_picture.png'), // Path gambar profil
            ),
            SizedBox(height: 20),
            Text(
              'Nama Pengguna',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'email@domain.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('Edit profile'); // Placeholder for actual action
                  },
                  child: Text('Edit Profil'),
                  style: ElevatedButton.styleFrom(
                          foregroundColor: Color.fromARGB(255, 255, 255, 255), 
                          backgroundColor: Colors.green
                        ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Change password'); // Placeholder for actual action
                  },
                  child: Text('Ubah Password'),
                  style: ElevatedButton.styleFrom(
                          foregroundColor: Color.fromARGB(255, 255, 255, 255), 
                          backgroundColor: Colors.green
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}
