import 'package:flutter/material.dart';

class TextFormDefauld extends StatelessWidget {
  const TextFormDefauld({
    Key key, this.validate, this.valor, this.obscurecer, this.tipo, this.helper,
  }) : super(key: key);
  final Function validate, valor;
  final bool obscurecer;
  final String tipo, helper;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.green,
      validator: validate,
      onChanged: valor,
      //textInputAction: TextInputAction.search.,
      style: TextStyle(color: Colors.green),
      obscureText: obscurecer,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.green,),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(color: Color(0xffFFFFFF), style: BorderStyle.solid)),
        labelText: tipo,
        labelStyle: TextStyle(color: Colors.green, fontSize: 16,fontWeight: FontWeight.w700),
        helperText: helper,
        helperStyle: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.w700),
      ),
    );
  }
}
