import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final Function handler;
  AdaptiveFlatButton(this.text,this.handler);
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              'Add Transaction',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: handler,
            color: Theme.of(context).primaryColor,
          )
        : RaisedButton(
            child: Text(
              'Add Transaction',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: handler,
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).textTheme.button.color,
          );
  }
}
