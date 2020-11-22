import 'package:basic_provider/basicsecond/models/weight.dart';
import 'package:basic_provider/basicsecond/states/weight_state.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class WeightPage extends StatelessWidget {
  const WeightPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight Tracker Demo"),
      ),
      body: _builderBodyConsumer(),
      floatingActionButton: _buildfbutton(context),
    );
  }

  FloatingActionButton _buildfbutton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        var state = Provider.of<WeightState>(context, listen: false);
        var result = await showDialog<double>(
            context: context,
            builder: (context) {
              return NumberPickerDialog.decimal(
                  initialDoubleValue: state.weights.first.weight,
                  maxValue: 200,
                  minValue: 1);
            });
        if (result != null && result > 0) {
          state.add(Weight(
            weight: result,
            time: DateTime.now(),
          ));
        }
      },
    );
  }

  Consumer<WeightState> _builderBodyConsumer() {
    return Consumer<WeightState>(
      builder: (context, state, child) {
        var weights = state.weights;
        return Container(
          child: Column(
            children: <Widget>[
              _containerInput(weights),
              _expandedListViewBuilder(state, weights),
            ],
          ),
        );
      },
    );
  }

  Container _containerInput(List<Weight> weights) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Current Weight",
                textScaleFactor: 1.5,
              ),
              Text(
                weights.first.weight.toString(),
                textScaleFactor: 2,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded _expandedListViewBuilder(WeightState state, List<Weight> weights) {
    return Expanded(
      child: ListView.builder(
        itemCount: state.weights.length,
        itemBuilder: (BuildContext context, int index) {
          return listTile(weights, index);
        },
      ),
    );
  }

  ListTile listTile(List<Weight> weights, int index) {
    return ListTile(
      title: _timeText(weights, index),
      trailing: trailingText(weights, index),
    );
  }

  Text trailingText(List<Weight> weights, int index) {
    return Text(
      weights[index].weight.toString(),
      textScaleFactor: 2,
    );
  }

  Text _timeText(List<Weight> weights, int index) {
    return Text(
        "${weights[index].time.day}/${weights[index].time.month}/${weights[index].time.year}");
  }
}
