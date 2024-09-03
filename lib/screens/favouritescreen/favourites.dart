import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/favourite_provider.dart';

class Favourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteHostels =
        Provider.of<FavoriteProvider>(context).favoriteHostels;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
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
