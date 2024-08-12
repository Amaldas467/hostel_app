import 'package:flutter/material.dart';

class Hostelcard extends StatelessWidget {
  final String imageUrl;
  final double rating;
  final String title;
  final String price;
  final String location;
  final String originalPrice;
  final String offerPercentage;
  final int userCount;

  Hostelcard({
    required this.imageUrl,
    required this.rating,
    required this.title,
    required this.price,
    required this.location,
    required this.originalPrice,
    required this.offerPercentage,
    required this.userCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(15), bottom: Radius.circular(15)),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              height: 150,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 19,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '$rating (${userCount})',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        //color: Colors.green,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      originalPrice,
                      style: TextStyle(
                        fontSize: 14,
                        //color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      offerPercentage,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
