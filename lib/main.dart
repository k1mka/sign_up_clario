import 'package:clario/app_entry.dart';
import 'package:clario/setup_service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  serviceLocator();
  runApp(const AppEntry());
}
