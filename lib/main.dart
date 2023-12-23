import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_jokes_genrator/views/Helper/provider_value.dart';
import 'package:random_jokes_genrator/views/Splash%20Screen/splashscreen.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => indexProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
