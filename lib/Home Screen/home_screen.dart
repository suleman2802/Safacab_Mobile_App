import 'package:flutter/material.dart';
import '../Packages Screen/Widgets/package_tile_widget.dart';
import './Widgets/category_banner_widget.dart';
import '../General Widget/appbar_widget.dart';
import '../General Widget/bottom_navigation_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: AppbarWidget("Taxi Service", false),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryBannerWidget(),
            // Text(
            //   "Hot Offers",
            //   style: Theme.of(context).textTheme.bodyLarge,
            // ),
            //PackageTileWidget("Toyota Camry", 4, 2, 5),
          ],
        ),
      ),
    );
  }
}
