import 'package:flutter/material.dart';
import 'package:take_home/entry.dart';
import 'package:take_home/injection_container/injection_container.dart';

Future<void> main() async {
  await init();
  runApp(const Entry());
}
