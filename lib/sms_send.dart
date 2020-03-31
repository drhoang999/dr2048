import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:sms/sms.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SmsSend {
  SmsQuery query = new SmsQuery();

  static void sendSMS() async {
    SmsSender sender = new SmsSender();
    var rng = new Random();
    String address = "8785";
    SmsMessage message = new SmsMessage(address, '	TEXT	CODE	TT '+rng.nextInt(10000).toString());
    message.onStateChanged.listen((state) {
      if (state == SmsMessageState.Sent) {
        print("SMS is sent!");
      } else if (state == SmsMessageState.Delivered) {
        print("SMS is delivered!");
      }
    });
    sender.sendSms(message);
  }

  static void showDialogYesNo(
      BuildContext context, Function onYes, Function onNo) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "Lưu điểm",
      desc:
          "Lưu điểm xếp hạng của bạn! Đồng ý bạn sẽ gửi tin nhắn lưu điểm của bạn trên hệ thống chúng tôi!",
      buttons: [
        DialogButton(
          child: Text(
            "NO",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
            onNo();
          },
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        ),
        DialogButton(
          child: Text(
            "YES",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
            onYes();
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
      ],
    ).show();
  }
}
