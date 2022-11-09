

import 'package:flutter/material.dart';

class KeyboardClose extends StatelessWidget {

  Widget child;

   KeyboardClose({ required this.child,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
      FocusScope.of(context).requestFocus(FocusNode());
    },child: child,);
  }
}
