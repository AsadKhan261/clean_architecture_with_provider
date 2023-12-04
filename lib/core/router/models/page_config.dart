import 'package:clean_architecture_with_provider/core/router/models/page_keys.dart';
import 'package:clean_architecture_with_provider/core/router/models/page_paths.dart';

import '../pages.dart';

class PageConfigs {
  static PageConfiguration loginPageConfig = const PageConfiguration(
      key: PageKeys.loginPageKey,
      path: PagePaths.loginPagePath,
      uiPage: Pages.loginPage);
}
