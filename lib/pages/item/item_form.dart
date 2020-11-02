import 'package:beach_resort/data/models/item.dart';
import 'package:beach_resort/data/models/unit.dart';
import 'package:beach_resort/data/providers/main_provider.dart';
import 'package:beach_resort/data/util/ui_helpers.dart';
import 'package:beach_resort/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemForm extends StatefulWidget {
  final String itemType;

  const ItemForm({Key key, this.itemType}) : super(key: key);
  @override
  _ItemFormState createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  TextEditingController _nameController = new TextEditingController();
  String _unit;
  List<Unit> units = [
    Unit(name: "Liter", acronym: "Lt"),
    Unit(name: 'Kilogram', acronym: 'Kg'),
    Unit(name: "Pieces", acronym: "Pcs"),
    Unit(name: "Crates", acronym: "Crate"),
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    MainProvider itemProvider = context.watch<MainProvider>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Item Form',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(letterSpacing: 10.0),
        ),
      ),
      body: Card(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppInput(
                controller: _nameController,
                label: 'Name',
              ),
              verticalSpaceSmall,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: new DropdownButton<String>(
                  isExpanded: true,
                  hint: Text('Choose Unit'),
                  value: _unit ?? null,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 20.0, // can be changed, default: 24.0
                  iconEnabledColor: Colors.blue,
                  items: units.map((Unit value) {
                    return new DropdownMenuItem<String>(
                      value: value.acronym,
                      child: new Text(value.name),
                    );
                  }).toList(),
                  onChanged: (unit) {
                    setState(() {
                      _unit = unit;
                    });
                  },
                ),
              ),
              verticalSpaceMedium,
              new MaterialButton(
                height: width / 7,
                minWidth: width,
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: new Text("Save"),
                onPressed: () async {
                  Item item = Item(
                      name: _nameController.text,
                      unit: _unit,
                      active: 1,
                      amount: 0.0,
                      quantity: 0,
                      unitSalePrice: 0.0,
                      unitPurchasePrice: 0.0,
                      createdAt: DateTime.now().toIso8601String(),
                      type: widget.itemType);

                  await itemProvider.insert(item, 'item');
                  Navigator.pop(context);
                },
                splashColor: Colors.redAccent,
              ),
              verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }
}
