import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'models/page_config.dart';
import 'models/page_paths.dart';
import 'pages.dart';

class RouterParser extends RouteInformationParser<PageConfiguration> {
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.location ?? '');

    if (uri.pathSegments.isEmpty) {
      return SynchronousFuture(PageConfigs.loginPageConfig);
    }

    final path = '/${uri.pathSegments[0]}';

    switch (path) {
      case PagePaths.loginPagePath:
        return SynchronousFuture(PageConfigs.loginPageConfig);
      default:
        return SynchronousFuture(PageConfigs.loginPageConfig);
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    switch (configuration.uiPage) {
      case Pages.loginPage:
        return const RouteInformation(location: PagePaths.loginPagePath);
    }
  }
}
