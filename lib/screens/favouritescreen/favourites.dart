import 'package:flutter/material.dart';

import '../homescreen/widgets/hostelcard.dart';

class Favourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
      ),
      body: ValueListenableBuilder<List<Hostelcard>>(
        valueListenable: favoriteHostelsNotifier,
        builder: (context, favoriteHostels, _) {
          return favoriteHostels.isEmpty
              ? Center(
                  child: Text('No favourites added'),
                )
              : ListView.builder(
                  itemCount: favoriteHostels.length,
                  itemBuilder: (context, index) {
                    return favoriteHostels[index];
                  },
                );
        },
      ),
    );
  }
}
