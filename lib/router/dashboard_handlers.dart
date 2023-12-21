
import 'package:admin_dashboard/ui/layouts/auth/auth_layout.dart';
import 'package:admin_dashboard/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/side_menu_provider.dart';

import 'package:admin_dashboard/ui/views/views.dart';

class DashboardHandlers {

  //Handler DashboardView
  static Handler dashboard = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.dashboardRoute);
      
      if (authProvider.authStatus == AuthStatus.authenticated){
        return const DashboardLayout(child: DashboardView());
      } else {
        return const AuthLayaut(child: LoginView());
      }
    }
  );  
  
  //Handler IconsView
  static Handler icons = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.iconsRoute);
      
      if (authProvider.authStatus == AuthStatus.authenticated){
        return const DashboardLayout(child: IconsView());
      } else {
        return const AuthLayaut(child: LoginView());
      }
    }
  );  

  //hanlder BlankView
  static Handler blank = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.blankRoute);
      
      if (authProvider.authStatus == AuthStatus.authenticated){
        return const DashboardLayout(child: BlankView());
      } else {
        return const AuthLayaut(child: LoginView());
      }
    }
  );

  //hanlder CategoriesView
  static Handler categories = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.categoriesRoute);
      
      if (authProvider.authStatus == AuthStatus.authenticated){
        return const DashboardLayout(child: CategoriesView());
      } else {
        return const AuthLayaut(child: LoginView());
      }
    }
  );

  //hanlder ProductsView
  static Handler products = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.productsRoute);
      
      if (authProvider.authStatus == AuthStatus.authenticated){
        return const DashboardLayout(child: ProductsView());
      } else {
        return const AuthLayaut(child: LoginView());
      }
    }
  );

  //hanlder UsersView
  static Handler users = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.usersRoute);
      
      if (authProvider.authStatus == AuthStatus.authenticated){
        return const DashboardLayout(child: UsersView());
      } else {
        return const AuthLayaut(child: LoginView());
      }
    }
  );
  //hanlder UserView
  static Handler user = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.userRoute);
      
      if (authProvider.authStatus == AuthStatus.authenticated){
        if (params['uid']?.first != null){
          return DashboardLayout(child: UserView(uid: params['uid']!.first));
        } else{
          return const DashboardLayout(child: UsersView());
        }
      } else {
        return const AuthLayaut(child: LoginView());
      }
    }
  );
}