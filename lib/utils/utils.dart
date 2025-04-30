import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

var logger = Logger();
var uuid = Uuid();

void showSnackBar(BuildContext context, String content, int second) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      duration: Duration(seconds: second),
    ),
  );
}
