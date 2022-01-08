import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  bool Onlydigits;
  MyTextFormField({
    this.controller,
    this.name,
    this.Onlydigits = false,
  });

  @override
  Widget build(BuildContext context) {
    String stringComponents = "";
    if (this.Onlydigits) {
      stringComponents = "[0-9]";
    } else {
      stringComponents = "((.|\n)*)";
    }
    return SizedBox(
      height: 40.0,
      child: TextFormField(
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(stringComponents)),
        ],
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 5),
          border: OutlineInputBorder(),
          hintText: name,
        ),
      ),
    );
  }
}
