import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../favouritescreen/widgets/favourite_provider.dart';
import '../../hostel_detail/hostel_detail.dart';

class Hostelcard extends StatefulWidget {
  final String id; // Define the id parameter
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
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    bool isFavorite = favoriteProvider.favoriteStatus[widget.id] ?? false;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HostelDetailsPage(
              id: widget.id, // Pass the id parameter
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
      },
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
                        onPressed: () {
                          favoriteProvider.toggleFavorite(widget);
                        },
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
