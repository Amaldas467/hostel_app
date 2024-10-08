import 'package:flutter/material.dart';

import '../filter_widget.dart';
import '../hostelcard.dart';
import '../hosteldata.dart';

class TrendingTab extends StatelessWidget {
  const TrendingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, bottom: 6, top: 20),
            child: Text(
              'Quick Pick of Trending Hostels',
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
                            id: hostel['id'], // Pass the id here
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
              'More Options for you',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
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
            padding: const EdgeInsets.all(15),
            child: Column(
              children: List.generate(hostels.length, (index) {
                final hostel = hostels[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Hostelcard(
                    id: hostel['id'], // Pass the id here
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
                    description: hostel['description'],
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
