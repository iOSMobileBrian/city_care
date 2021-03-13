import 'package:city_care/Pages/IncidentListPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ViewModels/IncidentListViewModel.dart';
import 'ViewModels/ReportIncidentViewModel.dart';

void main() {
  runApp(MultiProvider(
    providers:[
    ChangeNotifierProvider(create: (context) => IncidentListViewModel()),
      ChangeNotifierProvider(create: (context) => ReportIncidentViewModel())],
    child: MyApp(),
  )

  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City Care',
      theme: ThemeData(

        primarySwatch: Colors.blueGrey,
      ),
      home: IncidentListPage(),
    );
  }
}

