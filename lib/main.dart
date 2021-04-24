import 'dart:io' show Platform;

import 'package:calculator/platforms/android/app.dart';
import 'package:calculator/platforms/ios/app.dart';
import 'package:calculator/platforms/linux/app.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

void main() {
  if (Platform.isIOS) {
    runApp(IOSApp());
  } else {
    if (Platform.isAndroid) {
      runApp(AndroidApp());
    } else {
      if (Platform.isLinux) {
        WidgetsFlutterBinding.ensureInitialized();
        if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
          setWindowTitle("My Desktop App");
          setWindowMinSize(Size(375, 750));
          setWindowMaxSize(Size(600, 1000));
        }
        runApp(LinuxApp());
      } else {
        print('Game Over');
      }
    }
  }
}
