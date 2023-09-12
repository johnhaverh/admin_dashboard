
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
        return const DashboardView();
      } else {
        return const LoginView();
      }
    }
  );  
  
  //Handler IconsView
  static Handler icons = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.iconsRoute);
      
      if (authProvider.authStatus == AuthStatus.authenticated){
        return const IconsView();
      } else {
        return const LoginView();
      }
    }
  );  

  //hanlder BlankView
  static Handler blank = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.blankRoute);
      
      if (authProvider.authStatus == AuthStatus.authenticated){
        return const BlankView();
      } else {
        return const LoginView();
      }
    }
  );

  //hanlder CategoriesView
  static Handler categories = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.categoriesRoute);
      
      if (authProvider.authStatus == AuthStatus.authenticated){
        return const CategoriesView();
      } else {
        return const LoginView();
      }
    }
  );

  //hanlder ProductsView
  static Handler products = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.productsRoute);
      
      if (authProvider.authStatus == AuthStatus.authenticated){
        return const ProductsView();
      } else {
        return const LoginView();
      }
    }
  );

  //hanlder UsersView
  static Handler users = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.usersRoute);
      
      if (authProvider.authStatus == AuthStatus.authenticated){
        return const UsersView();
      } else {
        return const LoginView();
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
          return UserView(uid: params['uid']!.first);
        } else{
          return const UsersView();
        }
      } else {
        return const LoginView();
      }
    }
  );
}