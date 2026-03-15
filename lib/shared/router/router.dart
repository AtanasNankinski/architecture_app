import 'package:auto_route/auto_route.dart';

import 'package:architecture_demo/shared/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: Routes.home, page: HomeRoute.page, initial: true,),
    AutoRoute(path: Routes.dataPage, page: DataRoute.page,),
  ];
}

class Routes {
  static String home= "/";
  static String dataPage = "/data_page";
}
