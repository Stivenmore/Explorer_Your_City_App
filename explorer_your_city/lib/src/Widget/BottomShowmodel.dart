
import 'package:flutter/material.dart';

class BottomShowmodel extends StatelessWidget {
  const BottomShowmodel({
    Key key,
    this.texto,
    this.textColor,
    this.containerColor,
    this.ir,
  }) : super(key: key);
  final String texto;
  final Color textColor, containerColor;
  final Function ir;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        color: containerColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        onPressed: ir,
        child: Container(
          width: 200,
          height: 50,
          child: Text(
            texto,
            style: TextStyle(color: textColor),
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
