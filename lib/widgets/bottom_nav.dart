import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';

class BottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNav({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return FlashyTabBar(
      selectedIndex: selectedIndex,
      showElevation: true, // Shows shadow below the tab bar
      onItemSelected: (index) {
        onItemTapped(
            index); // Ensure this is correctly set to update the selected index
      },
      items: [
        FlashyTabBarItem(
          icon: Icon(
            Icons.home,
            size: 26,
          ),
          title: Text('Home'),
        ),
        FlashyTabBarItem(
          icon: Icon(
            Icons.search,
            size: 26,
          ),
          title: Text('Search'),
        ),
        FlashyTabBarItem(
          icon: Icon(
            Icons.shopping_bag_outlined,
            size: 26,
          ),
          title: Text('Booking'),
        ),
        FlashyTabBarItem(
          icon: Icon(
            Icons.favorite,
            size: 26,
          ),
          title: Text('Favorites'),
        ),
      ],
    );
  }
}
