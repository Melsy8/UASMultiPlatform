import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_travel_concept/util/places.dart';
import 'package:flutter_travel_concept/screens/notifcation_page.dart';
import 'package:flutter_travel_concept/widgets/horizontal_place_item.dart';
import 'package:flutter_travel_concept/widgets/icon_badge.dart';
import 'package:flutter_travel_concept/widgets/search_bar.dart';
import 'package:flutter_travel_concept/widgets/vertical_place_item.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: IconBadge(
              icon: Icons.notifications_none,
              size: 24, // Menambahkan ukuran icon badge
              color: Colors.black, // Menambahkan warna icon badge
            ),
            onPressed: () {
              Navigator.push(context, 
                MaterialPageRoute(builder: (context)=>NotificationPage())
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Where are you \ngoing?",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: SearchBar(),
          ),
          buildHorizontalList(context),
          buildVerticalList(),
        ],
      ),
    );
  }

  Widget buildHorizontalList(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 20.0),
      height: 250.0,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: places?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          Map<String, dynamic> place = places!.reversed.toList()[index];
          return HorizontalPlaceItem(place: place);
        },
      ),
    );
  }

  Widget buildVerticalList() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: ListView.builder(
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: places?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          Map<String, dynamic> place = places![index];
          return VerticalPlaceItem(place: place);
        },
      ),
    );
  }
}
