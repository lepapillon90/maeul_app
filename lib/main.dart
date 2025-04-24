import 'package:flutter/material.dart';
import 'package:maeul_app/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:maeul_app/providers/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AppStart());
}

class AppStart extends StatelessWidget {
  const AppStart({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: globalProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MA:EUL',
        theme: ThemeData(
          fontFamily: 'Pretendard',
          scaffoldBackgroundColor: const Color(0xFFFAF3E0),
          primaryColor: const Color(0xFF8FBF67),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color(0xFFB86B4B),
          ),
        ),
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
