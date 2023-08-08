part of 'route_imports.dart';

@AutoRouterConfig(replaceInRouteName: "Route")
class AppRouter extends $AppRouter {
  RouteType get defualtType => const RouteType.cupertino();

  @override
  List<CupertinoRoute> get routes => [
        CupertinoRoute(
          page: LoginScreenRoute.page,
        ),
        CupertinoRoute(page: HomeScreenRoute.page, initial: true),
        CupertinoRoute(
          page: DashBoardScreenRoute.page,
        ),
        CupertinoRoute(
          page: DashBoardScreenRoute.page,
        ),
        CupertinoRoute(
          page: NotificationRoute.page,
        ),
      ];
}
