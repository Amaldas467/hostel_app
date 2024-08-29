import 'package:flutter/material.dart';
import '../../hostel_detail/hostel_detail.dart';

// Global list to store favorite hostels
List<Hostelcard> favoriteHostels = [];

// Map to track favorite status using unique hostel IDs
Map<String, bool> favoriteStatus = {};

class Hostelcard extends StatefulWidget {
  final String id; // Unique identifier
  final String imageUrl;
  final double rating;
  final String title;
  final String price;
  final String location;
  final String originalPrice;
  final String offerPercentage;
  final int userCount;
  final String landmark;
  final double height;
  final int taxes;
  final String description;

  Hostelcard({
    required this.id, // Initialize the id
    required this.imageUrl,
    required this.rating,
    required this.title,
    required this.price,
    required this.location,
    required this.originalPrice,
    required this.offerPercentage,
    required this.userCount,
    required this.landmark,
    required this.height,
    required this.taxes,
    required this.description,
  });

  @override
  _HostelcardState createState() => _HostelcardState();
}

class _HostelcardState extends State<Hostelcard> {
  void _toggleFavorite() {
    setState(() {
      favoriteStatus[widget.id] = !(favoriteStatus[widget.id] ?? false);
      if (favoriteStatus[widget.id]!) {
        favoriteHostels.add(Hostelcard(
          id: widget.id, // Pass the id
          imageUrl: widget.imageUrl,
          rating: widget.rating,
          title: widget.title,
          price: widget.price,
          location: widget.location,
          originalPrice: widget.originalPrice,
          offerPercentage: widget.offerPercentage,
          userCount: widget.userCount,
          landmark: widget.landmark,
          height: widget.height,
          taxes: widget.taxes,
          description: widget.description,
        ));
      } else {
        favoriteHostels.removeWhere((hostel) => hostel.id == widget.id);
      }
    });
  }

  void _navigateToDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HostelDetailsPage(
          imageUrl: widget.imageUrl,
          rating: widget.rating,
          title: widget.title,
          price: widget.price,
          location: widget.location,
          originalPrice: widget.originalPrice,
          offerPercentage: widget.offerPercentage,
          userCount: widget.userCount,
          landmark: widget.landmark,
          taxes: widget.taxes,
          description: widget.description,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isFavorite = favoriteStatus[widget.id] ?? false;
    return InkWell(
      onTap: () => _navigateToDetails(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15), bottom: Radius.circular(15)),
                  child: Image.asset(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                    height: widget.height,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 5),
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
                            '${widget.rating} (${widget.userCount} Reviews)',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3),
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        widget.location,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        widget.landmark,
                        style: TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.price,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            widget.originalPrice,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            widget.offerPercentage,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1),
                      Text(
                        '+ ${widget.taxes} taxes & fees',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 6),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                          size: 20,
                        ),
                        onPressed: _toggleFavorite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Favourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
      ),
      body: favoriteHostels.isEmpty
          ? Center(
              child: Text('No favourites added'),
            )
          : ListView.builder(
              itemCount: favoriteHostels.length,
              itemBuilder: (context, index) {
                return favoriteHostels[index];
              },
            ),
    );
  }
}
