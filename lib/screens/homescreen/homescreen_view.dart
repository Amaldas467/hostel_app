import 'package:flutter/material.dart';
import 'package:hostel_app/screens/homescreen/widgets/card2.dart';
import 'package:hostel_app/screens/homescreen/widgets/carousel.dart';
import 'package:hostel_app/screens/homescreen/widgets/drawer.dart';
import 'package:hostel_app/screens/homescreen/widgets/filter_widget.dart';
import 'package:hostel_app/screens/homescreen/widgets/hostelcard.dart';
import 'package:hostel_app/screens/homescreen/widgets/recommended_tab.dart';
import 'package:hostel_app/screens/homescreen/widgets/toprated_tab.dart';
import 'package:hostel_app/screens/homescreen/widgets/trending_tab.dart';

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
          height: 600,
          child: TabBarView(
            controller: _tabController,
            children: [
              // Recommended Tab: Show the existing contents here
              _buildRecommendedTab(),
              // Top-Rated Tab: Show an empty container
              _buildTopratedTab(),
              // Trending Tab: Show an empty container
              _TrendingTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendedTab() {
    return RecommendedTab();
  }

  Widget _buildTopratedTab() {
    return TopratedTab();
  }

  Widget _TrendingTab() {
    return TrendingTab();
  }
}
