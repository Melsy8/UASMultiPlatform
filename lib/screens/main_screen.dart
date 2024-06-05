import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/screens/home.dart';
import 'package:flutter_travel_concept/screens/profil_page.dart';
import 'package:flutter_travel_concept/screens/message_page.dart';
import 'package:flutter_travel_concept/screens/favorite_page.dart';
import 'package:flutter_travel_concept/widgets/icon_badge.dart';
import 'package:flutter_travel_concept/service/api_service.dart';
import 'package:flutter_travel_concept/screens/login_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: [
          Home(), // Halaman 0
          FavoritePage(),
          MessagePage(), // Halaman 2
          ProfilePage(), // Halaman 3
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 7.0),
            barIcon(icon: Icons.home, page: 0),
            barIcon(icon: Icons.favorite, page: 1),
            barIcon(icon: Icons.mode_comment, page: 2, badge: true),
            barIcon(icon: Icons.person, page: 3),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                // Panggil fungsi logout dari ApiService
                ApiService.logout();

                // Pindahkan pengguna ke halaman login
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false,
                );
              },
            ),
            const SizedBox(width: 7.0),
          ],
        ),
      ),
    );
  }

  // Widget untuk menampilkan ikon pada bottom navigation bar
  Widget barIcon({
    required IconData icon,
    required int page,
    bool badge = false,
  }) {
    var iconButton = IconButton(
      icon: badge
          ? IconBadge(
              icon: icon,
              size: 24.0,
              color: Colors.black,
            )
          : Icon(icon, size: 24.0),
      color: _page == page
          ? Theme.of(context).colorScheme.secondary
          : Colors.blueGrey[300],
      onPressed: () => _pageController.jumpToPage(page),
    );
    return iconButton;
  }

  // Fungsi untuk mengubah halaman
  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
