import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/dashboard_handlers.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter{
  static final FluroRouter router = FluroRouter();

  //root route
  static String rootRoute = '/';

  //Auth routes
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashboard
  static String dashboarddRoute = '/dashboard';

  //
  static void configureRoutes(){
      //Auth routes
    router.define(rootRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute, handler: AdminHandlers.register, transitionType: TransitionType.none);

    //Dashboard
    router.define(dashboarddRoute, handler: DashboardHandlers.dashboard);

    //404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}