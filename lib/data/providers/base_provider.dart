import 'package:beach_resort/data/database/database_helper.dart';
import 'package:beach_resort/data/database/queries/item_queries.dart';
import 'package:flutter/material.dart';

mixin BaseProvider on ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;
  DatabaseHelper _dbHelper;
  DatabaseHelper get dbHelper => _dbHelper;
  List<dynamic> _items = [];
  List<dynamic> get items => [..._items];
  void initDbHelper({DatabaseHelper dbHelper}) {
    if (dbHelper != null) {
      _dbHelper = dbHelper;
    }
    // _items = items;
  }

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  Future<void> insert(dynamic item, String tableName) async {
    _items.add(item);
    setBusy(true);
    int numSaved = await dbHelper.insert(tableName, item);
    if (numSaved > 0) {
      print('Item SAVED');
    } else {
      print('No Item SAVED');
    }
    setBusy(false);
  }

  Future<int> update(dynamic item, String tableName) {
    var result = dbHelper.update(tableName, item);
    return result;
  }

  Future<void> selectAll(String tableName) async {
    setBusy(true);
    _items = await dbHelper.selectAll(tableName);

    // _items = result.map((c) => Item.fromJson(c)).toList();
    setBusy(false);
  }

  Future<int> delete(int id, String tableName) {
    var result = dbHelper.delete(tableName, id.toString());
    return result;
  }
}
