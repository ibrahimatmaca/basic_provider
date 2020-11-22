import 'package:basic_provider/basicsecond/models/weight.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class WeightState with ChangeNotifier {
  List<Weight> _weights = [
    Weight(weight: 65, time: DateTime.utc(2019, 10, 4)),
    Weight(weight: 80, time: DateTime.utc(2019, 10, 18)),
    Weight(weight: 90, time: DateTime.utc(2019, 10, 26)),
  ];

  List<Weight> get weights => _weights;

  add(Weight weight) {
    _weights.insert(0, weight);
    notifyListeners();
  }
}
