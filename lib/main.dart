import 'package:clean_architecture_with_provider/app/my_app.dart';
import 'package:flutter/material.dart';
import 'dependency_container.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.onInit();
  runApp(const MyApp());
}
