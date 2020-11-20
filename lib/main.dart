import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/counter_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => Counter())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StatelessApp(),
    );
  }
}

class StatelessApp extends StatelessWidget {
  const StatelessApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var value = Provider.of<Counter>(context).value;
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Using Provider: " + value.toString()),
          incrementRaisedButton(context),
          SizedBox(height: 10),
          resetRaisedButton(context)
        ]),
      ),
    );
  }

  //Use Consumer to build Widget displaying value
  RaisedButton incrementRaisedButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Provider.of<Counter>(context, listen: false).increment();
      },
      child: Text('Change State', style: TextStyle(fontSize: 20)),
    );
  }

  RaisedButton resetRaisedButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Provider.of<Counter>(context).reset();
      },
      child: Text('Reset', style: TextStyle(fontSize: 20)),
    );
  }
}
