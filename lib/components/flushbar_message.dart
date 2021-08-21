import 'package:another_flushbar/flushbar.dart';
import 'package:country_details/contants/message_types.dart';
import 'package:flutter/material.dart';

class FlushbarMessage {
  static Widget show(BuildContext context, String message, String messageType) {
    return Flushbar(
      flushbarPosition: FlushbarPosition.BOTTOM,
      isDismissible: true,
      duration: Duration(seconds: 4),
      dismissDirection: FlushbarDismissDirection.VERTICAL,
      //   title: title,
      message: message,
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.all(15.0),
      icon: Icon(
        Icons.info_outline,
        color: Colors.white,
      ),
      flushbarStyle: FlushbarStyle.FLOATING,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      backgroundColor: messageType == MessageTypes.ERROR
          ? Colors.red[700]
          : (messageType == MessageTypes.SUCCESS
              ? Colors.green[700]
              : Colors.blue[700]),
    )..show(context);
  }
}
