import 'package:beach_resort/data/constants/routes.dart';
import 'package:beach_resort/data/enums/item_type.dart';
import 'package:beach_resort/data/models/item.dart';
import 'package:beach_resort/data/providers/main_provider.dart';
import 'package:beach_resort/data/util/ui_helpers.dart';
import 'package:beach_resort/widgets/cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatefulWidget {
  final ItemType type;

  const ItemPage({Key key, @required this.type}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  final _controller = TextEditingController();
  String _searchText;
  List<Item> items = [];
  @override
  void initState() {
    _controller.addListener(
      () {
        setState(() {
          _searchText = _controller.text;
        });
      },
    );
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAppBar(BuildContext context) {
    String title = this.widget.type == ItemType.Food ? 'Foods' : 'Bevarages';

    return new AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(letterSpacing: 10.0),
        ),
        actions: <Widget>[
          // vm.carts.length == 0
          //         ? new Container()
          //         :
          CartButton(onPressed: () {}, itemCount: 1)
        ]);
  }

  // showSnackBar() {
  //   _scaffoldKey.currentState.hideCurrentSnackBar();
  //   _scaffoldKey.currentState.showSnackBar(SnackBar(
  //     content: Text('Hoooray!!!!'),
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    MainProvider itemProvider = context.select((MainProvider model) => model);
    bool busy = context.select((MainProvider model) => model.busy);

    items = itemProvider.getfilteredItems(_searchText, this.widget.type);

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          Expanded(
            child: busy
                ? Center(
                    child: CircularProgressIndicator(
                        // valueColor:
                        //     AlwaysStoppedAnimation(Theme.of(context).accentColor),
                        ),
                  )
                : items.length == 0
                    ? Center(child: Text('Nothing Found'))
                    : ListView.separated(
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 0,
                            child: ListTile(
                              onTap: () {
                                _controller.clear();
                                Navigator.pushNamed(
                                    context, AppRoutes.item_detail,
                                    arguments: {"item": items[index]});
                              },
                              leading: Container(
                                height: width / 9,
                                width: width / 9,
                                color: Colors.green,
                              ),
                              title: Text(items[index].name ?? ''),
                              trailing: Text(
                                '${items[index].unitSalePrice ?? 0}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.item_form,
              arguments: {'itemType': enumValue(this.widget.type)});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
