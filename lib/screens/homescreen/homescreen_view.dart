import 'package:flutter/material.dart';
import 'package:hostel_app/screens/homescreen/widgets/card2.dart';
import 'package:hostel_app/screens/homescreen/widgets/carousel.dart';
import 'package:hostel_app/screens/homescreen/widgets/drawer.dart';
import 'package:hostel_app/screens/homescreen/widgets/filter_widget.dart';
import 'package:hostel_app/screens/homescreen/widgets/hostelcard.dart';

import '../../constants/colorconstants.dart';
import 'widgets/hosteldata.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          // Add the TabBar and TabBarView section here
          SliverToBoxAdapter(
            child: TabBarSection(),
          ),
        ],
      ),
    );
  }
}

class TabBarSection extends StatefulWidget {
  @override
  TabBarSectionState createState() => TabBarSectionState();
}

class TabBarSectionState extends State<TabBarSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Recommended'),
            Tab(text: 'Top-Rated'),
            Tab(text: 'Trending'),
          ],
          indicatorColor: Colors.blue,
          labelColor: Colors.black,
        ),
        SizedBox(
          height: 600, // Set a fixed height for TabBarView
          child: TabBarView(
            controller: _tabController,
            children: [
              // Recommended Tab: Show the existing contents here
              _buildRecommendedTab(),
              // Top-Rated Tab: Show an empty container
              _buildEmptyTab(),
              // Trending Tab: Show an empty container
              _buildEmptyTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendedTab() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, bottom: 6, top: 20),
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
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox(
                  height: 330,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: hostels.length,
                    itemBuilder: (context, index) {
                      final hostel = hostels[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SizedBox(
                          width: 210,
                          child: Hostelcard(
                            height: 170,
                            imageUrl: hostel['imageUrl'],
                            rating: hostel['rating'],
                            title: hostel['title'],
                            price: hostel['price'],
                            location: hostel['location'],
                            originalPrice: hostel['originalPrice'],
                            offerPercentage: hostel['offerPercentage'],
                            userCount: hostel['userCount'],
                            landmark: hostel['landmark'],
                            taxes: hostel['taxes'],
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
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Best offers for you',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: MyCarousel(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Hostels at best price range',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cardData.length,
                itemBuilder: (context, index) {
                  double containerWidth = (index == 0) ? 220 : 200;
                  return Card2(
                    containerWidth: containerWidth,
                    cardData: cardData[index],
                  );
                },
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)),
              child: Center(
                  child: Text(
                "View all offers",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ScrollableButtonsRow(buttonData: buttonData),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: List.generate(hostels.length, (index) {
                final hostel = hostels[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Hostelcard(
                    taxes: hostel['taxes'],
                    height: 240,
                    imageUrl: hostel['imageUrl'],
                    rating: hostel['rating'],
                    title: hostel['title'],
                    price: hostel['price'],
                    location: hostel['location'],
                    originalPrice: hostel['originalPrice'],
                    offerPercentage: hostel['offerPercentage'],
                    userCount: hostel['userCount'],
                    landmark: hostel['landmark'],
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyTab() {
    return Center(
      child: Text(
        "No content available",
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    );
  }
}
