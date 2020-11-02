import 'package:beach_resort/data/util/ui_helpers.dart';
import 'package:beach_resort/widgets/counter_form_field.dart';
import 'package:flutter/material.dart';

class ItemQuantityDialog extends StatefulWidget {
  @override
  _ItemQuantityDialogState createState() => _ItemQuantityDialogState();
}

class _ItemQuantityDialogState extends State<ItemQuantityDialog> {
  final _formKey = GlobalKey<FormState>();

  int _quantity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Remove the MediaQuery padding because the demo is rendered inside of a
    // different page that already accounts for this padding.
    return MediaQuery.removePadding(
      context: context,
      removeTop: false,
      removeBottom: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add to cart',
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(letterSpacing: 2.0),
          ),
          actions: [
            FlatButton(
              child: Text(
                'Save',
                style: theme.textTheme.bodyText2.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.pop(context, 'Saved Successful!');
              },
            ),
          ],
        ),
        body: Card(
            child: Form(
          key: _formKey,
          child: Container(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Quantity'),
                  verticalSpaceMedium,
                  CounterFormField(
                    validator: (value) {
                      if (value < 0) {
                        return 'Negative values not supported';
                      }
                    },
                    onSaved: (value) => this._quantity = value,
                  )
                ],
              )),
        )),
      ),
    );
  }
}
