import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:dailyAffirmationss/core/navigation/navigation_constants.dart';
import 'package:dailyAffirmationss/presentation/home/screens/bottom_navigation.dart';
import 'package:dailyAffirmationss/presentation/home/screens/home_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      path: NavigationConstants.initialScreenPath,
      name: NavigationConstants.initialRouter,
      page: EmptyRouterPage,
      children: [
        AutoRoute(path: '', page: MyNavigationBar),
      ],
    ),
  ],
)
class $AppRouter {}
