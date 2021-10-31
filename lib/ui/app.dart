import 'package:flutter/material.dart';
import 'package:sheets_backend/providers/sheets/google_sheets_provider.dart';
import 'package:sheets_backend/ui/screens/add/add_page.dart';
import 'package:sheets_backend/ui/screens/home/home_page.dart';

const String routeAdd = '/add';
const String routeHome = '/';

class SheetsApp extends StatelessWidget {
  final GoogleSheetsProvider provider;

  const SheetsApp({
    required this.provider,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Houses App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: routeHome,
      routes: {
        routeHome: (_) => HomePage(provider: provider),
        routeAdd: (_) => AddPage(provider: provider),
      },
    );
  }
}
