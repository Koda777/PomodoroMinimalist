import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer';

class AnimationScreen extends StatefulWidget {
    final bool onPlay;
    final RiveAnimationController controller1;

    const AnimationScreen({Key key, this.onPlay, this.controller1}) : super(key: key);
    @override
    State<StatefulWidget> createState() {
        return _AnimationScreen();
    }
}

class _AnimationScreen extends State<AnimationScreen> {
    @override
    Widget build(BuildContext context) {
        return Container(
            width: 400,
            height: 400,
            child: RiveAnimation.asset(
            'assets/space_coffee.riv',
            controllers: [widget.controller1],
                )
        );
    }
}
