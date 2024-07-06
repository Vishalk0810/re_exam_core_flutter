import 'package:flutter/material.dart';
import 'package:re_exam_core_flutter/routes.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: MapRoutes.routes,
    );
  }
}