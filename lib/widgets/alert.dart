import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

alert(BuildContext context, String title, String msg) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title, style: TextStyle(color: Color(0xFF3da8a2))),
          content: Text(msg),
          actions: <Widget>[
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text("Ok", style: TextStyle(color: Colors.white)), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFF3da8a2))))
          ],
        );
      });
}
