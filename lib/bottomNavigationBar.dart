

import 'package:booksapp/Genre_List_Page/genre_list_page.dart';
import 'package:booksapp/Home/home_screen.dart';
import 'package:booksapp/Wishlist/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BottomNavBar extends StatefulWidget {
   BottomNavBar({super.key, this.selectedIndex=0});
  int selectedIndex = 0;  

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  List selectedbody = const [
    HomeScreen(),
    GenreList(),
    WishListPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 28,
    currentIndex: widget.selectedIndex, //New
  onTap:(int index) {
  setState(() {
    widget.selectedIndex = index;
  });
}, selectedFontSize: 14,
elevation: 10,
  selectedLabelStyle:const TextStyle(fontWeight: FontWeight.bold),
  unselectedFontSize: 14,
  items: const <BottomNavigationBarItem>[
         BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.list_alt_rounded),
        label: 'Genres',
      ),
      BottomNavigationBarItem(
        icon: ImageIcon( AssetImage('assets/images/wishicon.png')),
        label: 'Wishlist',
      ),
  ],
),
      body: selectedbody[widget.selectedIndex],
    );
  }
}