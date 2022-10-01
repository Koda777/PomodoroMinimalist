import 'package:flutter/material.dart';
import 'settings_bar.dart';
import 'dart:io';

class MenuCountdown extends StatefulWidget {
    final value;
    final void Function(double value) setValue;

    const MenuCountdown({Key key, this.value, this.setValue}) : super(key: key);
    @override
    State<StatefulWidget> createState() {
        return _MenuCountdown(); }
}

class _MenuCountdown extends State<MenuCountdown> with SingleTickerProviderStateMixin {
    AnimationController animController;
    Animation<double> animation;
    bool displayMenu = false;
    static const double marginLeft = 360;
    static const double marginTop = 80;


    @override
    void initState() {
        super.initState();
        animController = AnimationController(
            duration: const Duration(milliseconds: 90),
            vsync: this,
            );
        animation = Tween<double>(begin: 1, end: 18).animate(animController)
        ..addListener(() {
            setState(() {});
        });
    }

    void buttonOnPressed() {
        setState(() {displayMenu = !displayMenu;});
        if (displayMenu == false) {
            animController.reverse();
        } else {
            animController.forward();
        }
    }

    @override
    Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return (
        Stack(
        children: [
                GestureDetector(
                    onTap: () {buttonOnPressed();},
                    child: Container(
                        margin: const EdgeInsets.only(top: 40, left: marginLeft),
                        color: Colors.red,
                        width: 40,
                        height: 40,
                    )
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Container(
                            margin: EdgeInsets.only(top: height / 10),
                            width: animation.value * (width / 20),
                            height: height / 4,
                            color: Colors.blue,
                            child: displayMenu ? InputUser(value: widget.value, setValue: widget.setValue) : null
                        )
                    ]
                    )
                ]
        )
        );
    }
}
