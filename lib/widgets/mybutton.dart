import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function onPressed;
  final String name;
  Color color;
  bool sign_out;
  MyButton({this.name, this.onPressed, this.color = const Color(0xff746bc9)});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      child: RaisedButton(
        child: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
        color: color,
        onPressed: onPressed,
      ),
    );
  }
}
