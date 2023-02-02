// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:auto_route/empty_router_widgets.dart' as _i1;
import 'package:flutter/material.dart' as _i4;

import '../../presentation/home/screens/bottom_navigation.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    InitialRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    MyNavigationBar.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.MyNavigationBar(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'initial',
          fullMatch: true,
        ),
        _i3.RouteConfig(
          InitialRouter.name,
          path: 'initial',
          children: [
            _i3.RouteConfig(
              MyNavigationBar.name,
              path: '',
              parent: InitialRouter.name,
            )
          ],
        ),
      ];
}

/// generated route for
/// [_i1.EmptyRouterPage]
class InitialRouter extends _i3.PageRouteInfo<void> {
  const InitialRouter({List<_i3.PageRouteInfo>? children})
      : super(
          InitialRouter.name,
          path: 'initial',
          initialChildren: children,
        );

  static const String name = 'InitialRouter';
}

/// generated route for
/// [_i2.MyNavigationBar]
class MyNavigationBar extends _i3.PageRouteInfo<void> {
  const MyNavigationBar()
      : super(
          MyNavigationBar.name,
          path: '',
        );

  static const String name = 'MyNavigationBar';
}
