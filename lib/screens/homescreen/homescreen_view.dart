import 'package:flutter/material.dart';
import 'package:hostel_app/screens/homescreen/widgets/drawer.dart';
import 'package:hostel_app/screens/homescreen/widgets/hostelcard.dart';
import 'package:hostel_app/widgets/bottom_nav.dart';
import '../../constants/colorconstants.dart';
import 'widgets/hosteldata.dart';
import 'widgets/tab_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.creamColor,
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Text('Homescreen'),
      ),
      drawer: Homescreen_drawer(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[200],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cities.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.black,
                              child: Icon(
                                Icons.near_me,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Nearby',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      final city = cities[index - 1];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage(city['image']!),
                            ),
                            SizedBox(height: 8),
                            Text(
                              city['name']!,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Quick Pick for You',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: TabBarSection(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SizedBox(
                    height: 300,
                    //width: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: hostels.length,
                      itemBuilder: (context, index) {
                        final hostel = hostels[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SizedBox(
                            width: 240,
                            child: Hostelcard(
                              imageUrl: hostel['imageUrl'],
                              rating: hostel['rating'],
                              title: hostel['title'],
                              price: hostel['price'],
                              location: hostel['location'],
                              originalPrice: hostel['originalPrice'],
                              offerPercentage: hostel['offerPercentage'],
                              userCount: hostel['userCount'],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class TabBarSection extends StatefulWidget {
  @override
  TabBarSectionState createState() => TabBarSectionState();
}
