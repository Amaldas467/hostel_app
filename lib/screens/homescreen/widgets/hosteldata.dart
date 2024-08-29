import 'package:flutter/material.dart';

final List<Map<String, dynamic>> hostels = [
  {
    'id': '1', // Unique id
    'imageUrl': 'assets/hostel1.jpg',
    'rating': 4.5,
    'title': 'Cozy Hostel',
    'price': '\$50',
    'location': 'New York',
    'landmark': 'Near Central Park',
    'originalPrice': '\$60',
    'offerPercentage': '20% OFF',
    'userCount': 120,
    'taxes': 20,
    'description':
        'A cozy and comfortable hostel located near the iconic Central Park, offering a friendly atmosphere and great amenities.',
  },
  {
    'id': '2', // Unique id
    'imageUrl': 'assets/hostel1.jpg',
    'rating': 4.2,
    'title': 'Modern Hostel',
    'price': '\$60',
    'location': 'Los Angeles',
    'landmark': 'Close to Hollywood Blvd',
    'originalPrice': '\$75',
    'offerPercentage': '15% OFF',
    'userCount': 95,
    'taxes': 20,
    'description':
        'A modern and stylish hostel just a short walk from Hollywood Blvd, perfect for those looking to explore LA in style.',
  },
  {
    'id': '3', // Unique id
    'imageUrl': 'assets/hostel1.jpg',
    'rating': 4.8,
    'title': 'Luxury Hostel',
    'price': '\$80',
    'location': 'Chicago',
    'landmark': 'Near Millennium Park',
    'originalPrice': '\$100',
    'offerPercentage': '20% OFF',
    'userCount': 200,
    'taxes': 20,
    'description':
        'Experience luxury at an affordable price in this hostel near Millennium Park, offering top-notch facilities and services.',
  },
  {
    'id': '4', // Unique id
    'imageUrl': 'assets/hostel1.jpg',
    'rating': 4.0,
    'title': 'Budget Hostel',
    'price': '\$30',
    'location': 'Houston',
    'landmark': 'Near Downtown',
    'originalPrice': '\$40',
    'offerPercentage': '25% OFF',
    'userCount': 80,
    'taxes': 20,
    'description':
        'A budget-friendly hostel located near Downtown Houston, ideal for travelers looking to save without compromising on comfort.',
  },
  {
    'id': '5', // Unique id
    'imageUrl': 'assets/hostel1.jpg',
    'rating': 4.6,
    'title': 'Seaside Hostel',
    'price': '\$55',
    'location': 'Miami',
    'landmark': 'Beachfront',
    'originalPrice': '\$65',
    'offerPercentage': '15% OFF',
    'userCount': 150,
    'taxes': 20,
    'description':
        'A beautiful seaside hostel offering stunning views and easy beach access, perfect for a relaxing vacation.',
  },
  {
    'id': '6', // Unique id
    'imageUrl': 'assets/hostel1.jpg',
    'rating': 4.3,
    'title': 'Mountain View Hostel',
    'price': '\$45',
    'location': 'Denver',
    'landmark': 'Near Rocky Mountain Park',
    'originalPrice': '\$55',
    'offerPercentage': '18% OFF',
    'userCount': 110,
    'taxes': 20,
    'description':
        'A hostel with breathtaking mountain views, offering a tranquil escape for nature lovers.',
  },
  {
    'id': '7', // Unique id
    'imageUrl': 'assets/hostel1.jpg',
    'rating': 4.7,
    'title': 'Historic Hostel',
    'price': '\$70',
    'location': 'Boston',
    'landmark': 'Near Freedom Trail',
    'originalPrice': '\$85',
    'offerPercentage': '17% OFF',
    'userCount': 180,
    'taxes': 20,
    'description':
        'A hostel with a rich history, located near Boston\'s Freedom Trail, offering a unique cultural experience.',
  },
  {
    'id': '8', // Unique id
    'imageUrl': 'assets/hostel1.jpg',
    'rating': 4.1,
    'title': 'Artistic Hostel',
    'price': '\$40',
    'location': 'San Francisco',
    'landmark': 'Near Golden Gate Bridge',
    'originalPrice': '\$50',
    'offerPercentage': '20% OFF',
    'userCount': 90,
    'taxes': 20,
    'description':
        'An artistic hostel in the heart of San Francisco, close to the Golden Gate Bridge, perfect for creative minds.',
  },
  {
    'id': '9', // Unique id
    'imageUrl': 'assets/hostel1.jpg',
    'rating': 4.9,
    'title': 'Eco-Friendly Hostel',
    'price': '\$65',
    'location': 'Portland',
    'landmark': 'Near Forest Park',
    'originalPrice': '\$80',
    'offerPercentage': '19% OFF',
    'userCount': 210,
    'taxes': 20,
    'description':
        'An eco-friendly hostel committed to sustainability, located near the beautiful Forest Park in Portland.',
  },
  {
    'id': '10', // Unique id
    'imageUrl': 'assets/hostel1.jpg',
    'rating': 4.4,
    'title': 'Urban Hostel',
    'price': '\$35',
    'location': 'Seattle',
    'landmark': 'Near Pike Place Market',
    'originalPrice': '\$45',
    'offerPercentage': '22% OFF',
    'userCount': 130,
    'taxes': 20,
    'description':
        'A vibrant urban hostel near Seattle\'s Pike Place Market, offering a lively atmosphere and convenient location.',
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

//filter button data

final buttonData = [
  {
    'icon': Icons.keyboard_arrow_down_sharp,
    'text': 'Sort',
  },
  {
    'icon': Icons.keyboard_arrow_down_sharp,
    'text': 'Locality',
  },
  {
    'icon': Icons.keyboard_arrow_down_sharp,
    'text': 'Price',
  },
  {
    'icon': Icons.keyboard_arrow_down_sharp,
    'text': 'Townhouse',
  },
  {
    'icon': Icons.keyboard_arrow_down_sharp,
    'text': 'Trending',
  },
  {
    'icon': Icons.keyboard_arrow_down_sharp,
    'text': 'collection',
  },
];

final List<String> places = [
  'New York',
  'Los Angeles',
  'Chicago',
  'Houston',
  'Phoenix',
];
