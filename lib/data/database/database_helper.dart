import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:beach_resort/data/database/queries/item_queries.dart'
    as itemTable;

class DatabaseHelper with ChangeNotifier {
  final int version = 2;
  String dbName;
  // This code here will help to make the database helper class singleton
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
//
  factory DatabaseHelper() => _instance;
//
  static Database _db;
//
//
  DatabaseHelper.internal();
  var databaseName = 'app_table';
  void printDatabaseName() {
    print(databaseName);
  }

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    notifyListeners();
    return _db;
  }

  initDb() async {
    //Get application directory
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    //prepare a database path
    String path = join(documentDirectory.path, databaseName + '.db');
    //open the database
    var ourDb = await openDatabase(path, version: version, onCreate: _onCreate);

    return ourDb;
  }

  Future deleteDbAndRecreate({String databaseName}) async {
    //Get application directory
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    //prepare a database path
    String path = join(documentDirectory.path, databaseName + '.db');
    await close();
    await deleteDatabase(path);
    _db = null;
    return db;
  }

  Future deleteDb() async {
    //Get application directory
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    //prepare a database path
    String path = join(documentDirectory.path, databaseName + '.db');
    return await deleteDatabase(path);
  }

  void _onCreate(Database db, int version) async {
    await createTable(db, itemTable.tableName, itemTable.columns,
        itemTable.columnsDefinition);
  }

  Future createTable(
      Database db, tableName, tableColumns, columnsDefinition) async {
    final String columns = tableColumns
        .map((column) => "$column ${columnsDefinition[column]}")
        .join(', ');
    final query = "CREATE TABLE IF NOT EXISTS $tableName ($columns)";
    print(query);
    await db.execute(query);
  }

  //Insertion
  Future<int> insert(String tableName, dynamic item) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableName", item.toJson());
    return res;
  }

  //Get Items
  Future<List<Map<String, dynamic>>> selectAll(String tableName) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName");

    return result.toList();
  }

  //Get Items
  Future<List<Map<String, dynamic>>> selectAllByColumn(
      String tableName, String columnName, dynamic value) async {
    var dbClient = await db;
    var result = await dbClient
        .rawQuery("SELECT * FROM $tableName WHERE $columnName = '$value'");

    return result.toList();
  }

  //Get Items
  Future<List<Map<String, dynamic>>> getOrderedItemsByColumn(String tableName,
      String columnName, dynamic value, orderBy, orderType) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
        "SELECT * FROM $tableName WHERE $columnName = '$value' ORDER BY $orderBy $orderType");

    return result.toList();
  }

  //Get Items
  Future<List<Map<String, dynamic>>> getOrderedItems(
      String tableName, orderBy, orderType) async {
    var dbClient = await db;
    var result = await dbClient
        .rawQuery("SELECT * FROM $tableName ORDER BY $orderBy $orderType");

    return result.toList();
  }

  // Get Counts of all items
  Future<int> getCount(String tableName) async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableName"));
  }

  // Get Counts of all single items
  Future<int> getSingleItemCount(String tableName, String id) async {
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient
        .rawQuery("SELECT COUNT(*) FROM $tableName WHERE id = '$id'"));
  }

  // Get Counts of all single items
  Future<int> getSingleItemCountByColumn(
      String tableName, String columnName, dynamic value) async {
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient.rawQuery(
        "SELECT COUNT(*) FROM $tableName WHERE $columnName = '$value'"));
  }

  // Get single item by id
  Future<dynamic> getItem(String tableName, String id) async {
    var dbClient = await db;

    var result =
        await dbClient.rawQuery("SELECT * FROM $tableName WHERE id = '$id'");
    if (result.length == 0) return null;
    return result;
  }

  // get item by specifying column
  Future<dynamic> getItemByColumn(
      String tableName, String columnName, dynamic value) async {
    var dbClient = await db;

    var result = await dbClient
        .rawQuery("SELECT * FROM $tableName WHERE $columnName = '$value'");
    if (result.length == 0) return null;
    return result;
  }

  // delete column in a database
  Future<int> delete(String tableName, String id) async {
    var dbClient = await db;

    return await dbClient
        .delete(tableName, where: "id = ?", whereArgs: ["$id"]);
  }

  // delete column in a database using specified
  Future<int> deleteByColumn(
      String tableName, String column, dynamic value) async {
    var dbClient = await db;

    return await dbClient
        .delete(tableName, where: "$column = ?", whereArgs: [value]);
  }

  // update Item in database
  Future<int> update(String tableName, dynamic item) async {
    var dbClient = await db;
    return await dbClient.update(tableName, item.toJson(),
        where: "id = ?", whereArgs: [item.id]);
  }

  // update one column Item in database
  Future<int> updateSingleColumn(
      String tableName, String column, dynamic value, String id) async {
    var dbClient = await db;
    return await dbClient
        .rawUpdate("UPDATE $tableName SET $column = '$value' WHERE id = '$id'");
  }

  // update Item in database
  Future<int> updateByColumn(
      String tableName, dynamic item, String column, dynamic value) async {
    var dbClient = await db;
    return await dbClient.update(tableName, item.toJson(),
        where: "$column = ?", whereArgs: [value]);
  }

  Future<int> addOrupdate(String tableName, dynamic item,
      [String column, dynamic value]) async {
    int itemCount;
    if (column == null) {
      itemCount = await getSingleItemCount(tableName, item.id);
      if (itemCount == 0) {
        return insert(tableName, item);
      } else {
        return update(tableName, item);
      }
    } else {
      itemCount = await getSingleItemCountByColumn(tableName, column, value);
      if (itemCount == 0) {
        return insert(tableName, item);
      } else {
        return updateByColumn(tableName, item, column, value);
      }
    }
  }

  // Get single item by id
  Future<dynamic> getListOfTables() async {
    var dbClient = await db;

    var result = await dbClient
        .rawQuery("SELECT name FROM sqlite_master WHERE type='table'");
    if (result.length == 0) return null;
    print('------ all tables here -----');
    print(result);
    return result;
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }

  void resetDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    //prepare a database path
    String path = join(documentDirectory.path, databaseName + '.db');
    await deleteDatabase(path);
    _db = null;
  }
}
