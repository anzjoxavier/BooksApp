

import 'package:booksapp/Home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

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

int _selectedIndex = 0; 
  List selectedbody = const [
    HomeScreen(),
    Center(
      child: Text("WishList"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 28,
    currentIndex: _selectedIndex, //New
  onTap:(int index) {
  setState(() {
    _selectedIndex = index;
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
        icon: ImageIcon( AssetImage('assets/images/wishicon.png')),
        label: 'Wishlist',
      ),
  ],
),
      body: selectedbody[_selectedIndex],
    );
  }
}