import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:awesome_protfolio/provider/current_state.dart';
import 'package:awesome_protfolio/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CurrentState())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Awesome Portfolio',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 14)),
        ),
        builder: (context, child) {
          // Wrap with LayoutBuilder for responsive scaling or safe area
          return LayoutBuilder(
            builder: (context, constraints) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 1.0, // consistent text across screen sizes
                ),
                child: child!,
              );
            },
          );
        },
        home: const HomeScreen(),
      ),
    );
  }
}
