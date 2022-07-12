import 'package:flutter/material.dart';
import 'package:prokit_socialv/auth/Login_&_SignIn.dart';
import 'package:prokit_socialv/theme.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(
      appTheme: AppTheme(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.appTheme,
  }) : super(key: key);

  final AppTheme appTheme;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      title: "eSports Farm",
      home: LoginSignIn(),
    );
  }
}

