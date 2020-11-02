import 'package:beach_resort/data/constants/routes.dart';
import 'package:beach_resort/data/models/item.dart';
import 'package:beach_resort/data/util/ui_helpers.dart';
import 'package:beach_resort/widgets/toast.dart';
import 'package:flutter/material.dart';

class ItemDetail extends StatelessWidget {
  final Item item;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ItemDetail({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Details',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(letterSpacing: 10.0),
        ),
      ),
      body: Card(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(child: Text(item.name.toUpperCase())),
              verticalSpaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Quantity :'),
                  Text('${item.quantity} ${item.unit}'),
                ],
              ),
              spacedDivider,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sale'),
                  Text(' @ ${item.unitSalePrice}'),
                ],
              ),
              spacedDivider,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Boutght'),
                  Text(' @ ${item.unitPurchasePrice}'),
                ],
              ),
              spacedDivider,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RaisedButton(
                    color: Colors.amber,
                    onPressed: () {},
                    child: Text('Buy'),
                  ),
                  horizontalSpaceMedium,
                  item.quantity == 0
                      ? Container()
                      : RaisedButton(
                          color: Colors.green,
                          onPressed: () {
                            _displayQuantityPage(context);
                          },
                          child: Text('Add to cart'),
                        ),
                ],
              ),
              verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }

  _displayQuantityPage(BuildContext context) async {
    final result = await Navigator.pushNamed(context, AppRoutes.item_quantity);
    if (result != null && result is String) {
      Toast.show(message: 'Successful!', context: context);
      // _scaffoldKey.currentState.removeCurrentSnackBar();
      // _scaffoldKey.currentState.showSnackBar(SnackBar(
      //   content: Text(result),
      // ));
    }
  }
}
