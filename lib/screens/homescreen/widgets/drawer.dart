import 'package:flutter/material.dart';

import '../../../app/app.router.dart';
import '../../../app/utils.dart';
import '../../../constants/colorconstants.dart';

class Homescreen_drawer extends StatelessWidget {
  const Homescreen_drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.mirage,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRy5zKoI_m0hy7V1711x_xYAGJesoMf7jwyhQ&s'), // Replace with your profile image asset
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '+1 234 567 890',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {
              navigationService.navigateTo(Routes.profileScreen);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Navigate to settings screen
            },
          ),
          ListTile(
            leading: Icon(Icons.chat_outlined),
            title: Text('Need Help'),
            onTap: () {
              // Navigate to settings screen
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Invite & Earn'),
            onTap: () {
              navigationService.navigateTo(Routes.referScreen);
            },
          ),
          //ListTile(
          //  leading: Icon(Icons.wallet_outlined),
          //  title: Text('Link Wallet'),
          //  onTap: () {
          //    // Navigate to settings screen
          //  },
          //),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('View Privacy Policy'),
            onTap: () {
              // Navigate to settings screen
            },
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Text(
              '  Are You A Property Owner ?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(Icons.apartment),
            title: Text('List Your Property'),
            //subtitle: Text(),
            onTap: () {
              // Navigate to settings screen
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              navigationService.navigateTo(Routes.signInView);
            },
          ),
        ],
      ),
    );
  }
}
