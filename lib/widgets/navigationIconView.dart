import 'package:flutter/material.dart';
class NavigationIconView {
  NavigationIconView({
    this.title,
    this.icon,
    TickerProvider vsync,
  })  : item = BottomNavigationBarItem(
    icon: icon,
    title: Text(title),
  ),
        controller = AnimationController(
          duration: kThemeAnimationDuration,
          vsync: vsync,
        ) {
    _animation = controller.drive(CurveTween(
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    ));
  }

  final String title;
  final Widget icon;
  final BottomNavigationBarItem item;
  final AnimationController controller;
  Animation<double> _animation;

  FadeTransition transition(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Stack(
        children: [
//          ExcludeSemantics(
//            child: Center(
//              child: Padding(
//                padding: const EdgeInsets.all(16),
//                child: ClipRRect(
//                  borderRadius: BorderRadius.circular(8),
//                  child: Image.asset(
//                    'assets/demos/bottom_navigation_background.png',
//                  ),
//                ),
//              ),
//            ),
//          ),
          Center(
            child: IconTheme(
              data: IconThemeData(
                color: Colors.white,
                size: 80,
              ),
              child: Semantics(
                label: title,
                child: icon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}