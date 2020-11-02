import 'package:beach_resort/data/constants/routes.dart';
import 'package:beach_resort/data/enums/item_type.dart';
import 'package:beach_resort/widgets/home_button.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: height / 10,
        children: [
          HomeButton(
            title: 'Foods',
            iconData: Icons.room_service,
            navigation: {
              'routeName': AppRoutes.item,
              'arguments': ItemType.Food
            },
          ),
          HomeButton(
            title: 'Bevarages',
            iconData: Icons.wine_bar,
            navigation: {
              'routeName': AppRoutes.item,
              'arguments': ItemType.Bevarage
            },
          ),
          HomeButton(
            title: 'Rooms',
            iconData: Icons.roofing,
          ),
          HomeButton(
            title: 'Purchases',
            iconData: Icons.input,
          ),
          HomeButton(
            title: 'Sales',
            iconData: Icons.outbond,
          )
        ]);
  }
}
