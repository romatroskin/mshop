import 'package:flutter/material.dart';
import 'package:mshop/provider/app_provider.dart';
import 'package:mshop/screens/home/home.dart';
import 'package:mshop/screens/login.dart';
import 'package:mshop/screens/splash.dart';
import 'package:provider/provider.dart';
import 'provider/user_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: UserProvider.initialize()),
    ChangeNotifierProvider.value(value: AppProvider()),

  ],
  child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'OpenSans',
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
      ),
    home: ScreensController(),
  )));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch(user.status){
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return Login();
      case Status.Authenticated:
        return HomePage();
      default: return Login();
    }
  }
}




