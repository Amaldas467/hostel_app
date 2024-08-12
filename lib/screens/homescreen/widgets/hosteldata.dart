import 'package:flutter/material.dart';

final List<Map<String, dynamic>> hostels = [
  {
    'imageUrl': 'assets/hostel1.jpg',
    'rating': 4.5,
    'title': 'Cozy Hostel',
    'price': '\$50',
    'location': 'New York',
    'landmark': 'Near Central Park',
    'originalPrice': '\$60',
    'offerPercentage': '20% OFF',
    'userCount': 120,
  },
  {
    'imageUrl': 'assets/hostel1.jpg',
    'rating': 4.2,
    'title': 'Modern Hostel',
    'price': '\$60',
    'location': 'Los Angeles',
    'landmark': 'Close to Hollywood Blvd',
    'originalPrice': '\$75',
    'offerPercentage': '15% OFF',
    'userCount': 95,
  },
  {
    'imageUrl': 'assets/hostel1.jpg',
    'rating': 4.8,
    'title': 'Luxury Hostel',
    'price': '\$80',
    'location': 'Chicago',
    'landmark': 'Near Millennium Park',
    'originalPrice': '\$100',
    'offerPercentage': '20% OFF',
    'userCount': 200,
  },
  {
    'imageUrl': 'assets/hostel1.jpg',
    'rating': 4.0,
    'title': 'Budget Hostel',
    'price': '\$30',
    'location': 'Houston',
    'landmark': 'Near Downtown',
    'originalPrice': '\$40',
    'offerPercentage': '25% OFF',
    'userCount': 80,
  },
];

final List<Map<String, String>> cities = [
  //initial circleavatar  for cities
  {'image': 'assets/hostel2.jpeg', 'name': 'New York'},
  {'image': 'assets/hostel2.jpeg', 'name': 'Los Angeles'},
  {'image': 'assets/hostel2.jpeg', 'name': 'Chicago'},
  {'image': 'assets/hostel2.jpeg', 'name': 'Houston'},
  {'image': 'assets/hostel2.jpeg', 'name': 'Phoenix'},
  {'image': 'assets/hostel2.jpeg', 'name': 'San Francisco'},
  {'image': 'assets/hostel2.jpeg', 'name': 'Miami'},
];

final List<Map<String, dynamic>> cardData = [
  //for offer price range
  {
    'image':
        'https://cdn.pixabay.com/photo/2018/04/22/13/04/hallway-3341001_640.jpg',
    'isMainCard': true, // This card will use the main layout
    'specialOffer': 'Up to 50% off on your first booking.',
    'buttonText': 'Book Now',
    'buttonColor': Colors.orange,
  },
  {
    'image':
        'https://cdn.pixabay.com/photo/2023/09/20/20/17/wall-8265556_640.jpg',
    'isMainCard': false, // This card will use the secondary layout
    'price': '\$100/night',
    'taxes': '+ taxes',
    'buttonText': 'Explore',
    'buttonColor': Colors.blue,
  },
  {
    'image':
        'https://cdn.pixabay.com/photo/2023/09/20/20/17/wall-8265556_640.jpg',
    'isMainCard': false,
    'price': '\$120/night',
    'taxes': '+ taxes',
    'buttonText': 'Explore',
    'buttonColor': Colors.blue,
  },
  {
    'image':
        'https://cdn.pixabay.com/photo/2023/09/20/20/17/wall-8265556_640.jpg',
    'isMainCard': false,
    'price': '\$80/night',
    'taxes': '+ taxes',
    'buttonText': 'Explore',
    'buttonColor': Colors.green,
  },
  {
    'image':
        'https://cdn.pixabay.com/photo/2023/09/20/20/17/wall-8265556_640.jpg',
    'isMainCard': false,
    'price': '\$150/night',
    'taxes': '+ taxes',
    'buttonText': 'Explore',
    'buttonColor': Colors.red,
  },
  {
    'image':
        'https://cdn.pixabay.com/photo/2023/09/20/20/17/wall-8265556_640.jpg',
    'isMainCard': false,
    'price': '\$90/night',
    'taxes': '+ taxes',
    'buttonText': 'Explore',
    'buttonColor': Colors.purple,
  },
];
