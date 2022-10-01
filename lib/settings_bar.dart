import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InputUser extends StatefulWidget {
    final value;
    final void Function(double value) setValue;

    const InputUser({Key key, this.value, this.setValue}) : super(key: key);
    @override
    State<StatefulWidget> createState() {
        return _InputUser();
    }
}

class _InputUser extends State<InputUser> {
    @override
    Widget build(BuildContext context) => Container(
            child: Row(
            children: [
                CupertinoSlider(
                    min: 0.0,
                    max: 100.0,
                    value: widget.value,
                    activeColor: Color.fromRGBO(1, 1, 1, 1),
                    thumbColor: Color.fromRGBO(107, 78, 113, 1),
                    onChanged: widget.setValue,
                ),
                Text(
                    '${widget.value.round()}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        )
                    )
                ]
        )
    );
}
