import 'package:beach_resort/data/database/database_helper.dart';
import 'package:beach_resort/data/database/queries/base_queries.dart';

final String tableName = 'item';
final String id = 'id';
final String name = 'name';
final String code = 'code';
final String type = 'type';
final String unit = 'unit';
final String quantity = 'quantity';
final String amount = 'amount';
final String unitPurchasePrice = 'unitPurchasePrice';
final String unitSalePrice = 'unitSalePrice';
final String updatedAt = 'updatedAt';
final String createdAt = 'createdAt';
final String active = 'active';

final List<String> columns = [
  id,
  name,
  code,
  type,
  unit,
  quantity,
  amount,
  unitPurchasePrice,
  unitSalePrice,
  updatedAt,
  createdAt,
  active
];

final Map<String, dynamic> columnsDefinition = {
  id: 'TEXT PRIMARY KEY',
  name: 'TEXT',
  code: 'TEXT',
  type: 'TEXT',
  unit: 'TEXT',
  quantity: 'INTEGER',
  amount: 'INTEGER',
  unitPurchasePrice: 'REAL',
  unitSalePrice: 'REAL',
  updatedAt: 'TEXT',
  createdAt: 'TEXT',
  active: 'NUMERIC'
};

mixin ItemQueries on Queries {
  DatabaseHelper con = new DatabaseHelper();
}
