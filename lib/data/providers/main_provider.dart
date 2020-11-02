import 'package:beach_resort/data/database/database_helper.dart';
import 'package:beach_resort/data/providers/base_provider.dart';
import 'package:beach_resort/data/providers/item_provider.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier with BaseProvider, ItemProvider {}
