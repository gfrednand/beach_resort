import 'package:beach_resort/data/constants/routes.dart';
import 'package:beach_resort/data/enums/item_type.dart';
import 'package:beach_resort/pages/menu_page.dart';
import 'package:beach_resort/pages/user_details.dart';
import 'package:beach_resort/widgets/home_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  PageController _pageController = new PageController();
  int _page = 0;
  IconData _homeIcon = Icons.home;
  IconData _profileIcon = Icons.person_outline;
  @override
  void initState() {
    _homeIcon = _page == 0 ? Icons.home : Icons.home;
    _profileIcon = _page == 0 ? Icons.person_outline : Icons.person;

    super.initState();
    _pageController.addListener(_handlePageChange);
  }

  @override
  void dispose() {
    super.dispose();

    _pageController?.removeListener(_handlePageChange);
    _pageController?.dispose();
  }

  void _handlePageChange() {
    setState(() {
      _page = (_pageController.page + 0.5).floor();
      _homeIcon = _page == 0 ? Icons.home : Icons.home;
      _profileIcon = _page == 0 ? Icons.person_outline : Icons.person;
    });
  }

  BottomNavigationBar buildBottomNavigationBar(
    List<BottomNavigationBarItem> bottomNavigationBarItems,
    // TextTheme textTheme,
  ) {
    return BottomNavigationBar(
        showUnselectedLabels: true,
        items: bottomNavigationBarItems,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).textTheme.headline6.color,
//        unselectedItemColor: dividerColor,
        // selectedFontSize: textTheme.caption.fontSize,
        // unselectedFontSize: textTheme.caption.fontSize,
        onTap: navigationTapped);
  }

  void navigationTapped(int page) {
    // Animating to the page.
    // You can use whatever duration and curve you like
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic);
    // setState(() {
    //   _page = page;
    // });
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> bottomNavigationBarItems = [
      new BottomNavigationBarItem(
        icon: Icon(
          _homeIcon,
          size: 16.0,
        ),
        label: 'Home',
      ),
      // new BottomNavigationBarItem(
      //     icon: const Icon(Icons.add), title: Text("Incident")),
      new BottomNavigationBarItem(
        icon: Icon(
          _profileIcon,
          size: 18.0,
        ),
        label: 'Profile',
      )
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _page == 0 ? 'HOME' : 'ACCOUNT',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(letterSpacing: 10.0),
        ),
      ),
      body: PageView(
        children: <Widget>[MenuPage(), UserDetail()],
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            this._page = page;
          });
        },
        pageSnapping: true,
        physics: BouncingScrollPhysics(),
      ),
      bottomNavigationBar: buildBottomNavigationBar(bottomNavigationBarItems),
    );
  }
}
