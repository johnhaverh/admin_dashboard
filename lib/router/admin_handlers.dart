import 'package:admin_dashboard/ui/layouts/auth/auth_layout.dart';
import 'package:admin_dashboard/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';

import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:admin_dashboard/ui/views/register_view.dart';

class AdminHandlers {
  static Handler login = Handler(
    handlerFunc: (context, params){
      
      final authProvider = Provider.of<AuthProvider>(context!);
      
      if (authProvider.authStatus == AuthStatus.notAuthenticated){
          return const AuthLayaut(child: LoginView());
      } else {
        return const DashboardLayout(child: DashboardView());
      }
    }
  );

  static Handler register = Handler(
    handlerFunc: (context, params){
      
      final authProvider = Provider.of<AuthProvider>(context!);
      
      if (authProvider.authStatus == AuthStatus.notAuthenticated){
          return const AuthLayaut(child: RegisterView());
      } else {
        return const DashboardLayout(child: DashboardView());
      }
    }
  );
}