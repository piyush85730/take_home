import 'package:flutter/material.dart';
import 'package:take_home/core/constants/string_constants.dart';
import 'package:take_home/feature/post/presentation/pages/post_page.dart';
import 'package:take_home/feature/post_detail/presentation/pages/post_detail_page.dart';
import 'package:take_home/feature/splash/presentation/pages/splash_page.dart';

class AppRouter {
  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashPage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const SplashPage(),
        );
      case Routes.postsPage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const PostsPage(),
        );
      case Routes.postDetailPage:
        final args = routeSettings.arguments as PostDetailArguments;
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => PostDetailPage(post: args.post),
        );
      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const PostsPage(),
        );
    }
  }
}
