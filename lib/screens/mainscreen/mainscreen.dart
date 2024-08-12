import 'package:flutter/material.dart';
import 'package:hostel_app/screens/bookingscreen/booking.dart';
import 'package:hostel_app/screens/favouritescreen/favourites.dart';
import 'package:hostel_app/screens/homescreen/homescreen_view.dart';
import 'package:hostel_app/screens/search_screen/search_view.dart';

import 'package:hostel_app/widgets/bottom_nav.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    Booking(), // Assume BookingScreen is a valid widget
    Favourites(), // Assume FavoritesScreen is a valid widget
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
