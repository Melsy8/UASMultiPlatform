import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/screens/login_page.dart';
import 'package:flutter_travel_concept/screens/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8080';

  static Future<bool> loginUser(String username, String password, BuildContext context) async {
    final String apiUrl = '$baseUrl/login';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login Berhasil')),
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
          (route) => false,
        );
        return true;
      } else {
        // Login gagal
        return false;
      }
    } catch (e) {
      // Tangani kesalahan yang terjadi selama proses login
      print('Error: $e');
      return false;
    }
  }

  static Future<bool> registerUser(String username, String email, String password, String name, BuildContext context) async {
    final String apiUrl = '$baseUrl/register';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'email': email,
          'password': password,
          'name': name,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration Berhasil')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
        return true;
      } else {
        // Registrasi gagal
        return false;
      }
    } catch (e) {
      // Tangani kesalahan yang terjadi selama proses registrasi
      print('Error: $e');
      return false;
    }
  }

  static Future<bool> updateProfile(String username, String name, String email) async {
    final String apiUrl = '$baseUrl/update-profile';

    try {
      final response = await http.put(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'name': name,
          'email': email,
        }),
      );

      if (response.statusCode == 200) {
        // Update profil berhasil
        return true;
      } else {
        // Update profil gagal
        return false;
      }
    } catch (e) {
      // Tangani kesalahan yang terjadi selama proses update profil
      print('Error: $e');
      return false;
    }
  }

  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
