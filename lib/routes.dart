import 'package:flutter/material.dart';
import 'package:re_exam_core_flutter/Screens/home_screen/home_screen.dart';

import 'Screens/detail_screen/detail.dart';

class MapRoutes{
  static Map<String, Widget Function(BuildContext)>routes = {
    '/':(context)=> const HomeScreen(),
    '/detail':(context)=> const DetailScreen(),
  };
}