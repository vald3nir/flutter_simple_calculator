import 'dart:io' show Platform;

import 'package:calculator/platforms/android/app.dart';
import 'package:calculator/platforms/ios/app.dart';
import 'package:flutter/material.dart';

void main() => Platform.isIOS ? runApp(IOSApp()) : runApp(AndroidApp());
