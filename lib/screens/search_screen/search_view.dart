import 'package:flutter/material.dart';
import 'package:hostel_app/screens/homescreen/widgets/drawer.dart';
import 'package:hostel_app/screens/homescreen/widgets/hostelcard.dart';
import '../../constants/colorconstants.dart';

import '../homescreen/widgets/hosteldata.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final filteredHostels = hostels.where((hostel) {
      final lowerCaseQuery = query.toLowerCase();
      return hostel['title'].toLowerCase().contains(lowerCaseQuery) ||
          hostel['location'].toLowerCase().contains(lowerCaseQuery) ||
          hostel['landmark'].toLowerCase().contains(lowerCaseQuery) ||
          hostel['description'].toLowerCase().contains(lowerCaseQuery);
    }).toList();

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
        title: Text('Search screen'),
      ),
      drawer: Homescreen_drawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[200],
              ),
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    query = text;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            child: query.isEmpty
                ? CustomScrollView(
                    slivers: [
                      // The initial widgets when there's no search query
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8),
                          child: SizedBox(
                            height: 120,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: cities.length + 1,
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 35,
                                          backgroundImage:
                                              AssetImage(city['image']!),
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
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 8,
                            bottom: 6,
                          ),
                          child: Text(
                            'Frequently Searched Hostels',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, bottom: 6, top: 20),
                          child: ListView.builder(
                            shrinkWrap:
                                true, // Ensures it doesn't take infinite height
                            physics:
                                NeverScrollableScrollPhysics(), // Prevents nested scrolling
                            itemCount: places.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Icon(Icons.location_on),
                                title: Text(
                                  places[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 8,
                            bottom: 6,
                          ),
                          child: Text(
                            'Book your Hostels',
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
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: SizedBox(
                                        width: 210,
                                        child: Hostelcard(
                                          id: hostel['id'],
                                          height: 170,
                                          imageUrl: hostel['imageUrl'],
                                          rating: hostel['rating'],
                                          title: hostel['title'],
                                          price: hostel['price'],
                                          location: hostel['location'],
                                          originalPrice:
                                              hostel['originalPrice'],
                                          offerPercentage:
                                              hostel['offerPercentage'],
                                          userCount: hostel['userCount'],
                                          landmark: hostel['landmark'],
                                          taxes: hostel['taxes'],
                                          description: hostel['description'],
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
                  )
                : ListView.builder(
                    itemCount: filteredHostels.length,
                    itemBuilder: (context, index) {
                      final hostel = filteredHostels[index];
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Hostelcard(
                          id: hostel['id'],
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
                          description: hostel['description'],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
