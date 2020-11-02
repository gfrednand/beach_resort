import 'package:beach_resort/data/database/database_helper.dart';

class Queries {
  DatabaseHelper con = new DatabaseHelper();

//insertion
  Future<int> insert(String tableName, dynamic item) async {
    var dbClient = await con.db;
    int res = await dbClient.insert("$tableName", item.toJson());
    return res;
  }

  // update Item in database
  Future<int> update(String tableName, dynamic item) async {
    var dbClient = await con.db;
    return await dbClient.update('$tableName', item.toJson(),
        where: "id = ?", whereArgs: [item.id]);
  }

  //deletion
  Future<int> delete(String tableName, int id) async {
    var dbClient = await con.db;
    int res =
        await dbClient.rawDelete('DELETE FROM $tableName WHERE id = ?', [id]);
    return res;
  }

  Future<List<Map<String, dynamic>>> selectAll(String tableName) async {
    var dbClient = await con.db;
    var res = await dbClient.query("$tableName");

    List<dynamic> list = res.isNotEmpty ? res.toList() : null;

    return list;
  }
}
