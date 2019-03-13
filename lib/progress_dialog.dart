library progress_dialog;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProgressDialog {
  bool _isShowing = false;

  BuildContext buildContext, _context;
  String message = "Loading...";
  Color color = Colors.blue;

  ProgressDialog(this.buildContext);

  void setMessage(String mess Color color) {
    this.message = mess;
    this.color=color;
  }

  void show() {
    _showDialog();
    _isShowing = true;
  }

  bool isShowing() {
    return _isShowing;
  }

  void hide() {
    _isShowing = false;
    Navigator.of(_context).pop();
  }

  Future _showDialog() {
    showDialog(
      context: buildContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        _context = context;
        return CupertinoAlertDialog(
          content: SizedBox(
            height: 45.0,
            child: Center(
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10.0),
                  CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(this.color)),
                  SizedBox(width: 20.0),
                  Text(
                    message,
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
    return null;
  }
}
