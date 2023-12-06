
import 'package:clean_architecture_with_provider/core/router/back_button_dispatcher.dart';
import 'package:clean_architecture_with_provider/core/router/router_delegate.dart';
import 'package:clean_architecture_with_provider/core/router/router_parser.dart';
import 'package:clean_architecture_with_provider/core/utils/globals/globals.dart';
import 'package:clean_architecture_with_provider/core/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppRouterDelegate delegate;
  late BackButtonDispatcher backButtonDispatcher;
  late RouterParser parser = RouterParser();

  @override
  void initState() {
    delegate = AppRouterDelegate(sl());
    backButtonDispatcher = AppBackButtonDispatcher(sl());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: snackbarKey,
      title: 'Starting Project',
      theme: AppTheme.appTheme,
      routerDelegate: delegate,
      backButtonDispatcher: backButtonDispatcher,
      routeInformationParser: parser,
    );
  }
}