import 'package:flutter/material.dart';
import 'package:take_home/core/constants/string_constants.dart';
import 'package:take_home/feature/post/presentation/pages/post_page.dart';

class AppRouter {
  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.productDetailPage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const PostsPage(),
        );

      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const PostsPage(),
        );
    }
  }
}
