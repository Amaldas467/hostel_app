import 'package:flutter/material.dart';

import 'card2.dart';
import 'carousel.dart';
import 'filter_widget.dart';
import 'hostelcard.dart';
import 'hosteldata.dart';

class TopratedTab extends StatelessWidget {
  const TopratedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
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
            padding:
                const EdgeInsets.only(left: 8, right: 8, bottom: 6, top: 20),
            child: Text(
              'Quick Pick of Top Rated',
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
              'More Options for you',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        //SliverToBoxAdapter(
        //  child: Padding(
        //    padding: const EdgeInsets.all(12),
        //    child: SizedBox(
        //      height: 220,
        //      child: ListView.builder(
        //        scrollDirection: Axis.horizontal,
        //        itemCount: cardData.length,
        //        itemBuilder: (context, index) {
        //          double containerWidth = (index == 0) ? 220 : 200;
        //          return Card2(
        //            containerWidth: containerWidth,
        //            cardData: cardData[index],
        //          );
        //        },
        //      ),
        //    ),
        //  ),
        //),
        //SliverToBoxAdapter(
        //  child: Padding(
        //    padding: const EdgeInsets.all(15),
        //    child: Container(
        //      height: 50,
        //      width: double.infinity,
        //      decoration: BoxDecoration(
        //          borderRadius: BorderRadius.circular(10),
        //          border: Border.all(color: Colors.black)),
        //      child: Center(
        //          child: Text(
        //        "View all offers",
        //        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        //      )),
        //    ),
        //  ),
        //),
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
}
