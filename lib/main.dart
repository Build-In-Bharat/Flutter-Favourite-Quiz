import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:id8nxt_quiz_app/core/routes/generated_routes.dart';
import 'package:id8nxt_quiz_app/core/theme/theme.dart';
import 'package:id8nxt_quiz_app/provider/favourites_provider.dart';
import 'package:id8nxt_quiz_app/provider/heart_animation_provider.dart';
import 'package:id8nxt_quiz_app/provider/quiz_provider.dart';
import 'package:id8nxt_quiz_app/screens/bottom_nav_bar.dart';

import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: GeneratedRoutes.generateRoutes,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => FavouritesProvider()),
          ChangeNotifierProvider(create: (context) => QuizProvider()),
          ChangeNotifierProvider(create: (context) => HeartAnimationProvider()),
        ],
        child: const BottomNavBar(),
      ),
    );
  }
}
