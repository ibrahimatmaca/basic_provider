import 'package:basic_provider/basicsecond/screens/weight_screen.dart';
import 'package:basic_provider/basicsecond/states/weight_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'basicfirst/model/counter_model.dart';
import 'basicfirst/stateless_app_firs.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Counter()),
      ChangeNotifierProvider(create: (_) => WeightState())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeightPage(),
    );
  }
}
