import 'package:flutter/material.dart';

class Favourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('favourites'),
      ),
      body: Center(
        child: Text('No favourites added'),
      ),
    );
  }
}
