import 'package:beach_resort/data/constants/routes.dart';
import 'package:beach_resort/data/enums/item_type.dart';
import 'package:beach_resort/data/models/item.dart';
import 'package:beach_resort/pages/home_page.dart';
import 'package:beach_resort/pages/item/item_detail.dart';
import 'package:beach_resort/pages/item/item_form.dart';
import 'package:beach_resort/pages/item/item_page.dart';
import 'package:beach_resort/pages/item/item_quantity_dialog.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
          settings: settings,
        );
        break;
      case AppRoutes.item:
        var type = settings.arguments as ItemType;
        return slideUpTransitionpageRouteBuilder(ItemPage(
          type: type,
        ));

        break;
      case AppRoutes.item_detail:
        var args = settings.arguments as Map<String, Item>;
        return MaterialPageRoute(
          builder: (_) => ItemDetail(item: args['item']),
          settings: settings,
        );

        break;
      case AppRoutes.item_quantity:
        return MaterialPageRoute(
          builder: (context) => ItemQuantityDialog(),
          fullscreenDialog: true,
        );
        break;
      case AppRoutes.item_form:
        var args = settings.arguments as Map<String, String>;
        return MaterialPageRoute(
          builder: (context) => ItemForm(
            itemType: args['itemType'],
          ),
          settings: settings,
        );
        break;

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(
                    leading: BackButton(),
                  ),
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }

  static PageRouteBuilder slideUpTransitionpageRouteBuilder(Widget page) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.fastOutSlowIn;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        });
  }
}
