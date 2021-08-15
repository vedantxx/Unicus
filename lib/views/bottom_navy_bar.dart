import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:unicus/views/fragments/categoriesFragment.dart';
import 'package:unicus/views/fragments/favs_fragment.dart';
import 'package:unicus/views/fragments/search_fragment.dart';
import 'package:unicus/views/home.dart';

class MyBottomNavyBar extends StatefulWidget {
  @override
  _MyBottomNavyBarState createState() => _MyBottomNavyBarState();
}

class _MyBottomNavyBarState extends State<MyBottomNavyBar> {
  int currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    SearchFragment(),
    CategoriesFragment(),
    // Favsafragment(),
  ];
  //I encountered the same problem.
  // The solution is to put the variable "selectedIndex = 0" outside of the _build_ method,
  // otherwise "setstate()" won't change the value of that variable
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[currentIndex],
      bottomNavigationBar: BottomNavyBar(

        selectedIndex: currentIndex,
        onItemSelected: (index){
          setState(() {
            currentIndex = index;
          },
          );
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),

              activeColor: Colors.blueAccent,
              inactiveColor: Colors.black
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
              activeColor: Colors.blueAccent,
              inactiveColor: Colors.black
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.auto_awesome_motion),
              title: Text('Categories'),
              activeColor: Colors.blueAccent,
              inactiveColor: Colors.black
          ),
          // BottomNavyBarItem(
          //   icon: Icon(Icons.favorite_border),
          //   title: Text('Favorites'),
          //   activeColor: Colors.blueAccent,
          //   inactiveColor: Colors.black,
          //
          // ),
        ],

      ),
    );
  }
}
