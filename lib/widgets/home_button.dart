import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Map<String, dynamic> navigation;

  const HomeButton(
      {Key key, @required this.title, @required this.iconData, this.navigation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: RawMaterialButton(
            onPressed: () {
              if (navigation != null) {
                Navigator.pushNamed(context, navigation['routeName'],
                    arguments: navigation['arguments']);
              }
            },
            elevation: 16.0,
            fillColor: Colors.blue,
            child: Icon(
              iconData,
              color: Colors.white,
              size: width / 7,
            ),
            padding: EdgeInsets.all(15.0),
            shape: CircleBorder(),
          ),
        ),
        Text(title)
      ],
    );
  }
}
