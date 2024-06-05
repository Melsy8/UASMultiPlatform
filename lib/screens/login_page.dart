import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/screens/main_screen.dart';
import 'package:flutter_travel_concept/screens/signup_page.dart';
import 'package:flutter_travel_concept/service/api_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

    if (username.isNotEmpty && password.isNotEmpty) {
      bool success = await ApiService.loginUser(username, password, context); // Tambahkan context
      if (success) {
        Navigator.pushReplacement( // Gunakan pushReplacement untuk mengganti halaman tanpa menambahkan halaman ke dalam stack
          context,
          MaterialPageRoute(builder: (context) => MainScreen()), // Pindahkan ke halaman utama setelah login berhasil
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to login')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter username and password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.8,
              ),
              child: Card(
                elevation: 5.0,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        "Login",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 20.0),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignupPage()),
                          );
                        },
                        child: Text('Belum Punya Akun? Daftar Disini'),
                      ),
                      ElevatedButton(
                        onPressed: _login,
                        child: Text('Login'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Color.fromARGB(255, 255, 255, 255),
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
