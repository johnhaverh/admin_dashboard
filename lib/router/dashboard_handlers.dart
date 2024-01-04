import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/side_menu_provider.dart';

import 'package:admin_dashboard/ui/layouts/auth/auth_layout.dart';
import 'package:admin_dashboard/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:admin_dashboard/ui/layouts/splash/splash_layout.dart';

import 'package:admin_dashboard/ui/views/views.dart';

class DashboardHandlers {

  //Handler DashboardView
  static Handler dashboard = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.dashboardRoute);
      
      switch (authProvider.authStatus){
        case AuthStatus.checking:         return const SplashLayout();
        case AuthStatus.authenticated:    return const DashboardLayout(child: DashboardView(),);
        case AuthStatus.notAuthenticated: return const AuthLayout(child: LoginView(),);
      }
    }
  );  
  
  //Handler IconsView
  static Handler icons = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.iconsRoute);

      switch (authProvider.authStatus){
        case AuthStatus.checking:         return const SplashLayout();
        case AuthStatus.authenticated:    return const DashboardLayout(child: IconsView(),);
        case AuthStatus.notAuthenticated: return const AuthLayout(child: LoginView(),);
      }
    }
  );  

  //hanlder BlankView
  static Handler blank = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.blankRoute);
      
      switch (authProvider.authStatus){
        case AuthStatus.checking:         return const SplashLayout();
        case AuthStatus.authenticated:    return const DashboardLayout(child: BlankView(),);
        case AuthStatus.notAuthenticated: return const AuthLayout(child: LoginView(),);
      }
    }
  );

  //hanlder CategoriesView
  static Handler categories = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.categoriesRoute);
      
      switch (authProvider.authStatus){
        case AuthStatus.checking:         return const SplashLayout();
        case AuthStatus.authenticated:    return const DashboardLayout(child: CategoriesView(),);
        case AuthStatus.notAuthenticated: return const AuthLayout(child: LoginView(),);
      }
    }
  );

  //hanlder ProductsView
  static Handler products = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.productsRoute);

      switch (authProvider.authStatus){
        case AuthStatus.checking:         return const SplashLayout();
        case AuthStatus.authenticated:    return const DashboardLayout(child: ProductsView(),);
        case AuthStatus.notAuthenticated: return const AuthLayout(child: LoginView(),);
      }
    }
  );

  //hanlder UsersView
  static Handler users = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.usersRoute);

      switch (authProvider.authStatus){
        case AuthStatus.checking:         return const SplashLayout();
        case AuthStatus.authenticated:    return const DashboardLayout(child: UsersView(),);
        case AuthStatus.notAuthenticated: return const AuthLayout(child: LoginView(),);
      }
    }
  );
  //hanlder UserView
  static Handler user = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.userRoute);

      switch (authProvider.authStatus){
        case AuthStatus.checking:         
              return const SplashLayout();
        case AuthStatus.authenticated:    
              if (params['uid']?.first != null){
                return DashboardLayout(child: UserView(uid: params['uid']!.first),);
              } else{
                return const  DashboardLayout(child: UsersView(),);
              }
              // return const DashboardLayout(child: UsersView(),);
        case AuthStatus.notAuthenticated: 
              return const AuthLayout(child: LoginView(),);
      }
    }
  );
}