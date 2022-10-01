import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class CountdownTimer extends StatefulWidget {
    final CountdownController controller;
    final double value;
    const CountdownTimer({Key key, this.controller, this.value}) : super(key: key);

    @override
    State<StatefulWidget> createState() {
        return _CountdownTimer(); }
}

class _CountdownTimer extends State<CountdownTimer> {
    @override
    Widget build(BuildContext context) => Countdown(
        controller: widget.controller,
        seconds: widget.value.toInt(),
        build: (BuildContext context, double time) => Text(
            time.toString(),
            style: TextStyle(
            fontSize: 100,
            color: Colors.white,
                ),
                ),
        interval: Duration(milliseconds: 100),
        onFinished: () {
            print('Timer is done!');
            }
        );
}
