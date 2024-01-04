import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/auth_provider.dart';

import 'package:admin_dashboard/ui/layouts/auth/auth_layout.dart';
import 'package:admin_dashboard/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:admin_dashboard/ui/layouts/splash/splash_layout.dart';

import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:admin_dashboard/ui/views/register_view.dart';

class AdminHandlers {
  static Handler login = Handler(
    handlerFunc: (context, params){
      
      final authProvider = Provider.of<AuthProvider>(context!);

      switch (authProvider.authStatus){
        case AuthStatus.checking:         return const SplashLayout();
        case AuthStatus.authenticated:    return const DashboardLayout(child: DashboardView(),);
        case AuthStatus.notAuthenticated: return const AuthLayout(child: LoginView(),);
      }
    }
  );

  static Handler register = Handler(
    handlerFunc: (context, params){
      
      final authProvider = Provider.of<AuthProvider>(context!);
      
      switch (authProvider.authStatus){
        case AuthStatus.checking:         return const SplashLayout();
        case AuthStatus.authenticated:    return const DashboardLayout(child: DashboardView(),);
        case AuthStatus.notAuthenticated: return const AuthLayout(child: RegisterView(),);
      }
    }
  );
}