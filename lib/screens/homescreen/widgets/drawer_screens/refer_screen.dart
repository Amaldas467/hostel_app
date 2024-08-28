import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReferScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invite & Earn'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_balance_wallet),
            onPressed: () {},
          ),
        ],
        //bottom: TabBar(
        //  tabs: [
        //    Tab(text: 'Invite'),
        //    Tab(text: 'Rewards'),
        //    Tab(text: 'FAQ'),
        //  ],
        //),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconWithLabel(FontAwesomeIcons.whatsapp, 'WhatsApp'),
                _buildIconWithLabel(Icons.copy, 'Copy code'),
                _buildIconWithLabel(Icons.more_horiz, 'More'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Reward on friend's first Booking",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "15 days left",
              style: TextStyle(color: Colors.brown),
            ),
            SizedBox(height: 20),
            _buildRewardOption('0/1 Booking(s)', 'Earn  10 % offer'),
            _buildRewardOption('0/2 Booking(s)', 'Earn  20 % offer'),
            _buildRewardOption('0/3 Booking(s)', 'Earn  30 % offer'),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Start referring! Get 1 more friend(s) to Book and get more offer',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Invite action
                    },
                    child: Text('Invite'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
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

  Widget _buildIconWithLabel(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 40),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }

  Widget _buildRewardOption(String title, String subtitle) {
    return Column(
      children: [
        Row(
          children: [
            Radio(
              value: title,
              groupValue: null, // Replace with a variable to manage selection
              onChanged: (value) {
                // Handle radio button change
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text(subtitle, style: TextStyle(color: Colors.green)),
              ],
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
