import 'package:flutter/material.dart';

import '../homescreen_view.dart';

class TabBarSectionState extends State<TabBarSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Recommended'),
            Tab(text: 'Top-Rated'),
            Tab(text: 'Premium'),
          ],
          indicatorColor: Colors.blue,
          labelColor: Colors.black,
        ),
      ],
    );
  }
}
