import 'package:beach_resort/data/constants/routes.dart';
import 'package:beach_resort/data/database/database_helper.dart';
import 'package:beach_resort/data/providers/main_provider.dart';
import 'package:beach_resort/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();

        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => DatabaseHelper()),
          ChangeNotifierProxyProvider<DatabaseHelper, MainProvider>(
              create: (context) => MainProvider()..initDbHelper(dbHelper: null),
              update: (context, db, previous) =>
                  previous..initDbHelper(dbHelper: db)),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Beach Resort',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: AppRoutes.home,
          onGenerateRoute: AppRouter.generateRoute,
        ),
      ),
    );
  }
}
