import 'package:flutter/material.dart';

class UserDetail extends StatefulWidget {
  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail>
    with SingleTickerProviderStateMixin {
  double _progress = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new SizedBox(
              height: _height / 12,
            ),
            Container(
                width: width / 2,
                height: width / 2,
                margin:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width / 2),
                ),
                child: Container()),
            Text(
              '',
              style: Theme.of(context).textTheme.headline6.copyWith(
                    fontSize: width / 15,
                  ),
            ),
            SizedBox(height: 3),
            Text(
              '---',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            SizedBox(height: 3),
            Container(),
            new Divider(
              height: _height / 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildCategory("Incidents", '10'),
                  _buildCategory("Contributions", '800,000'),
                  // _buildCategory("Groups"),
                ],
              ),
            ),
            new Divider(height: _height / 30),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              primary: false,
              padding: EdgeInsets.all(5),
              itemCount: 15,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 200 / 200,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Container(color: Colors.blue[50]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(String title, String amount) {
    return Column(
      children: <Widget>[
        Text(
          amount,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(),
        ),
      ],
    );
  }
}
