import 'package:go_router/go_router.dart';
import 'package:image_generator/Features/home/presentation/pages/home_page.dart';

import 'app_route_const.dart';

class MyAppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: MyAppRouteConst.homePage,
        path: '/',
        builder: (context, state) {
          return const HomePage();
        },
      ),
    ],
  );
}
