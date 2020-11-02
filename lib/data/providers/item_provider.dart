import 'package:beach_resort/data/enums/item_type.dart';
import 'package:beach_resort/data/models/item.dart';
import 'package:beach_resort/data/providers/base_provider.dart';
import 'package:beach_resort/data/util/ui_helpers.dart';

mixin ItemProvider on BaseProvider {
  String tableName = 'item';

  List<Item> getfilteredItems(String filter, ItemType type) {
    if (filter == null || filter == '') {
      return items
          .map((c) => c as Item)
          .toList()
          .where((Item item) => item.type == enumValue(type))
          .toList();
    }
    return items
        .map((c) => c as Item)
        .toList()
        .where((Item item) =>
            item.name.toLowerCase().contains(filter.toLowerCase()) &&
            item.type == enumValue(type))
        .toList();
  }
}
