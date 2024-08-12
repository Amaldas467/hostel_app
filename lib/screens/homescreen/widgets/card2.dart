import 'package:flutter/material.dart';

class Card2 extends StatelessWidget {
  final double containerWidth;
  final Map<String, dynamic> cardData;

  const Card2({
    super.key,
    required this.containerWidth,
    required this.cardData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        children: [
          Container(
            height: 220,
            width: containerWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  cardData['image'], // Access the image URL from the dataset
                ),
              ),
            ),
            child: Center(
              child: cardData['isMainCard'] == true
                  ? _buildMainContent()
                  : _buildSecondaryContent(),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.hotel, size: 40, color: Colors.white), // Logo or Icon
        SizedBox(height: 10),
        Text(
          'Special Offer!',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        // Displaying special offer text from the dataset
        Text(
          cardData['specialOffer'],
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: Text(cardData['buttonText']), // Button text from the dataset
          style: ElevatedButton.styleFrom(
            backgroundColor:
                cardData['buttonColor'], // Button color from the dataset
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        ),
      ],
    );
  }

  Widget _buildSecondaryContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Starting from',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        // Displaying price from the dataset
        Text(
          cardData['price'],
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        // Displaying taxes text from the dataset
        Text(
          cardData['taxes'],
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            cardData['buttonText'], // Button text from the dataset
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor:
                cardData['buttonColor'], // Button color from the dataset
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        ),
      ],
    );
  }
}
