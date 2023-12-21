
import 'package:admin_dashboard/ui/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/api/cafe_api.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/services/services.dart';
import 'package:admin_dashboard/providers/providers.dart';

import 'package:admin_dashboard/ui/layouts/auth/auth_layout.dart';
import 'package:admin_dashboard/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:admin_dashboard/ui/layouts/splash/splash_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.configurePrefs();
  CafeApi.configureDio();
  Flurorouter.configureRoutes();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( lazy: false, create: ( _ ) => AuthProvider() ),
        ChangeNotifierProvider( lazy: false, create: ( _ ) => SideMenuProvider() ),
        ChangeNotifierProvider( create: ( _ ) => CategoriesProvider() ),
        ChangeNotifierProvider( lazy: false, create: ( _ ) => UsersProvider() ),
        ChangeNotifierProvider( lazy: false, create: ( _ ) => UserFormProvider() ),

      ],
      child: const MyApp(), 
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationsService.messagerKey,
      home: const App(),
      theme: ThemeData.light().copyWith(
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(
            Colors.grey.withOpacity(0.5),
          ),
        )
      )
    );
  }
}


class App extends StatelessWidget {

  const App({super.key,});

  @override
  Widget build(BuildContext context) {

      final authProvider = Provider.of<AuthProvider>(context);
      if (authProvider.authStatus == AuthStatus.checking){ 
        return const SafeArea(child: SplashLayout());
        }
      if (authProvider.authStatus == AuthStatus.authenticated){ 
        return const SafeArea(child: DashboardLayout(child: DashboardView(),));
      } else {
        return const SafeArea(child: AuthLayaut(child: LoginView(),));
      }
  }
}