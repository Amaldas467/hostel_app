import 'package:flutter/material.dart';

class Booking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bookings'),
      ),
      body: Center(
        child: Text('No Bookings Currently'),
      ),
    );
  }
}
