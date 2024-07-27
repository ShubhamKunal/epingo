import 'package:epingo/auth/provider/auth_provider.dart';
import 'package:epingo/auth/ui/login.dart';
import 'package:epingo/auth/ui/sign_up.dart';
import 'package:epingo/firebase_options.dart';
import 'package:epingo/home_screen.dart';
import 'package:epingo/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xfff5f9fd),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Consumer<AuthProvider>(
                builder: (context, authProvider, child) {
                  return authProvider.user != null
                      ? const HomeScreen()
                      : const WelcomePage();
                },
              ),
          '/login': (context) => Login(),
          '/signup': (context) => SignUp(),
          '/home': (context) => Consumer<AuthProvider>(
                builder: (context, authProvider, child) {
                  return authProvider.user != null
                      ? const HomeScreen()
                      : Login();
                },
              ),
        },
      ),
    );
  }
}
