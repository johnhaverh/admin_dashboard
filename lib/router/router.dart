import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter{
  static final FluroRouter router = FluroRouter();

  //root route
  static String rootRoute = '/';

  //Auth routes
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashboard
  static String dashboadrdRoute = '/dashboard';

  //
  static void configureRoutes(){
    router.define(rootRoute, handler: AdminHandlers.login);
    router.define(loginRoute, handler: AdminHandlers.login);
    //router.define(registerRoute, handler: handler);

  }
}