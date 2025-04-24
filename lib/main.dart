import 'package:flutter/material.dart';
import 'package:maeul_app/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:maeul_app/providers/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: globalProviders,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MA:EUL',
      theme: ThemeData(
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: Color(0xFFFAF3E0),
        primaryColor: Color(0xFF8FBF67),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xFFB86B4B),
        ),
      ),
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
