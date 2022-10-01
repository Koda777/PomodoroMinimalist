import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:rive/rive.dart';
import 'home.dart';
// Flutter-countdown-timer
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

enum timerState {
    start,
    resume,
    pause,
    stop,
    depart
}

class StartButton extends StatefulWidget {
    final onPlay;
    final void Function() setOnPlay;
    final RiveAnimationController controller1;
    final CountdownController controllerTime;
    final void Function() setController;
    const StartButton({Key key, this.onPlay, this.setOnPlay, this.controller1, this.setController, this.controllerTime}) : super(key: key);
    @override
    State<StatefulWidget> createState() {
        return _StartButton();
    }
}

class _StartButton extends State<StartButton> {
    timerState timer_state = timerState.depart;

    void actionTimer() {
        switch (timer_state) {
            case timerState.start: {
                setState(() => timer_state = timerState.pause);
                widget.controllerTime.pause();
            }
            break;
            case timerState.pause: {
                setState(() => timer_state = timerState.resume);
                widget.controllerTime.pause();
            }
            break;
            case timerState.depart: {
                setState(() => timer_state = timerState.pause);
                widget.controllerTime.start();
            }
            break;
            case timerState.resume: {
                setState(() => timer_state = timerState.pause);
                widget.controllerTime.resume();
            }
            break;
        }
        widget.setOnPlay();
        //widget.setController();
    }

    @override
    Widget build(BuildContext context) => Container(
        height: 60,
        width: 270,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: timer_state == timerState.pause ? Color.fromRGBO(175, 210, 233, 1) : Color.fromRGBO(191, 142, 167, 1),
                elevation: 2,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
                )
                ),
                    onPressed: () {actionTimer();},
                child: Text(
                (timer_state != timerState.pause || timer_state == timerState.depart ? "START" : "PAUSE"),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                        )
                    ),
        )
        );
}
