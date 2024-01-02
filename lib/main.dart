import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydatingapp/controllers/auth_controller.dart';
import 'package:mydatingapp/firebase_options.dart';
import 'package:mydatingapp/providers/profile_data_provider.dart';
import 'package:mydatingapp/providers/signin_provider.dart';
import 'package:mydatingapp/providers/signup_provider.dart';
import 'package:mydatingapp/screens/splashscreen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut(() => AuthController());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => SignupProvider(),
      ),
      ChangeNotifierProvider(create: (context) => SignInProvider()),
      ChangeNotifierProvider(
        create: (context) => ProfileDataProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dating app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
