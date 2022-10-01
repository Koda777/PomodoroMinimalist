import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

//screen
import 'start_button.dart';
import 'menuTimeCounter.dart';
import 'animation.dart';
import 'time_watch.dart';

class Home extends StatefulWidget {
    @override
    State<StatefulWidget> createState() {
        return _Home(); }
}

class _Home extends State<Home> {
    double value = 0;
    bool onPlay = false;
    RiveAnimationController _controller;
    CountdownController controllerTime = CountdownController(autoStart: true);

    @override
    void initState() {
        super.initState();
        _controller = SimpleAnimation('idle');
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: const Color.fromRGBO(30, 5, 32, 1),
            body: Stack(
                children: [
                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget> [
                       CountdownTimer(controller: controllerTime, value: value),
                       AnimationScreen(controller1: _controller),
                       StartButton(onPlay: onPlay, setOnPlay: (){
                           setState(() => onPlay = !onPlay);
                       }, setController: (){
                           setState(() => _controller.isActive = !_controller.isActive);
                       }, controller1: _controller, controllerTime: controllerTime),
                    ]
                ),
                 if (!onPlay)
                    MenuCountdown(value: value, setValue: (double newValue) {
                       setState(() => value = newValue);
                   }),
                ]
                )
            );
    }
}
